Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379704;
	b=C6uFYuMDOckxV+7IpRgWjsf9QXut2ZWvDggQcGXWKKVqg/Kr9FC5rrhRbYcPp+56HGpj
	 E3k75F7jxpmBXTwYX0z5qaXEcb+i++71pXx2blrKAbx3Kz2ptYX3mPfDkQ5FrZ+Hy5bHK
	 R16gr73N1IEO4iPWg5RAC+qnTSBVMf2RC4qFEZME5ommWpH+Jh8boHf2zxv87es3plALq
	 gSfjqSkCPRy3agEA7/zhAXV3L1z3/n7kNbD51OHU+bCEI2Si+kBYtdyaQzXPrZKlztHxy
	 SGfMZU2zP8wWhX3QJtafKoTkQD0FB/qQnv8hCdM7HZoKQl5Ca5RycHQs6nu9h4Irr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379704;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=1mzkHDiRZ6m4gfdg/54Ac4V1uOP64Vnktdy1a0RgfH0=;
	b=jTMJZt0+qTQ1vePy9WPIybZzKPDTsmy/s6cNgzEHcqw/QZQYczcjYbCOu30m5NuMt1rX
	 IO8q/AhATvmNGUY/MBlZtmWEgt4Wx8/H31gGyNZAQHX5o22IM8oofPCRRzNSuTr4E+gVE
	 JG5FLRRUbzwDCioWzDTxSi86npKgaJIyW2aABd3SFCGM3pHKWNUJ/OWLv1bjvpT6p5Bs4
	 t1MGu/X8150CI0k1HnJkCDrIH4KPCm2SM0LUTH18S9xeyeGUT+dppFBJ3l6h4sFp8UX6z
	 UQkkhj7kC4lL/40DeXjtjFYrmVkDjsAjUuGW0jcful532OSPjDNyNIN9iB+scvtN+eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=OBtqduht;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=H30q7H+r;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5584606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5584606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=OBtqduht;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=H30q7H+r
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7201D21E5A;
	Wed, 11 Nov 2026 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794379701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1mzkHDiRZ6m4gfdg/54Ac4V1uOP64Vnktdy1a0RgfH0=;
	b=OBtqduht2nQ0c1pov69X04Nr0Ec0TcqQxaDr50vKukdwsOW/tPpm3oPlrH+ZZ8nDCP8xjR
	XhQo9SpigiJUCCjfmScdkhyucNzBSsmNZ7cdqPf/wr0+qXmRiSw/yJWDlwvnQAUq1GrML6
	YnR/G9D0HB8YGsZCXXRNkhaisdFOG7g=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=H30q7H+r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794379700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1mzkHDiRZ6m4gfdg/54Ac4V1uOP64Vnktdy1a0RgfH0=;
	b=H30q7H+rxU8s/+9Om6rJ0fXy+uFNHEufciYBrsevXkA1/abzzOKK1Y1EaQbgVP+VenAFfB
	D6EzS4oCt3OesRKqR8ep2owa0DKHVHMLBGUy07B2+icMxIj+4XJNEsGV8Ckg57obJ+vzaH
	BEg8moPvTgYN3SeE/yHsk0Kca9+Qcp0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA92F1339F;
	Wed, 11 Nov 2026 06:48:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hAHtLrMP9GqnLgAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 06:48:19 +0000
Message-ID: <d74cbff5-ead6-4c26-b300-ffd8c2fbbd4a@suse.com>
Date: Wed, 11 Nov 2026 07:48:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen: Add gpa conversion helpers
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
 <1792170395.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@vates.tech>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <1792170395.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vD88nahLxSnTqn7YXJtgIGQK"
X-Spamd-Result: default: False [-10.18 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.32)[0.948];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,vates.tech:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.18
X-Spam-Level: 
X-Rspamd-Queue-Id: 7201D21E5A

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vD88nahLxSnTqn7YXJtgIGQK
Content-Type: multipart/mixed; boundary="------------ARUP9rYN0AOeR0kb0XQe0cap";
 protected-headers="v1"; hp="clear"
Message-ID: <d74cbff5-ead6-4c26-b300-ffd8c2fbbd4a@suse.com>
Date: Wed, 11 Nov 2026 07:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen: Add gpa conversion helpers
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
 <1792170395.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@vates.tech>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <1792170395.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@vates.tech>

--------------ARUP9rYN0AOeR0kb0XQe0cap
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTAuMjYgMTk6MDYsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBJbnRyb2R1Y2UgdmFy
aW91cyBoZWxwZXJzIHRvIGNvbnZlcnQgYmV0d2VlbiBHUEEgYW5kIHZpcnQvcGFkZHIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVj
aD4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0K
SWYgeW91IGFyZSB1cCB0byBpdCwgdGhlcmUgaXMgc29tZSBwb3RlbnRpYWwgZm9yIGNsZWFu
aW5nIHVwIHRoZSBYZW4gcmVsYXRlZA0KcGFnZS5oIGluY2x1ZGUgZmlsZXMuDQoNCllvdSBh
cmUgYWRkaW5nIHRoZSBzYW1lIGRlZmluaXRpb25zIHRvIHRoZSB4ODYgYW5kIGFybSBzcGVj
aWZpYyBwYWdlLmggZmlsZXMsDQp3aGljaCBhcmUgbG9jYXRlZCBhdCBkaWZmZXJlbnQgcG9z
aXRpb25zIHJlZ2FyZGluZyB0aGUgYXJjaCB0cmVlcy4NCg0KSSB0aGluayB0aGlzIHNob3Vs
ZCBiZSBjbGVhbmVkIHVwIGJ5IG1vdmluZyB0aGUgY29tbW9uIHBhcnRzIGludG8NCmluY2x1
ZGUveGVuL3BhZ2UuaC4gVGhlIGFyY2ggc3BlY2lmaWMgaW5jbHVkZSBmaWxlcyBzaG91bGQg
Ym90aCBiZSB1bmRlcg0KaW5jbHVkZS94ZW4vPGFyY2g+L3BhZ2UuaCwgSSB0aGluayAodXNp
bmcgYXJjaC88YXJjaD4vaW5jbHVkZS9hc20veGVuL3BhZ2UuaA0Kd29uJ3Qgd29yaywgYXMg
dGhlIGFybSBmaWxlIGlzIHVzZWQgYnkgYXJtIGFuZCBhcm02NCkuDQoNCkluIGNhc2UgeW91
IGRvbid0IHdhbnQgdG8gZG8gdGhhdCwgSSdtIGZpbmUgdG8gZG8gdGhhdCBsYXRlciwgZS5n
LiB3aGVuIHRoZQ0KcmlzY3YgWGVuIHBvcnQgaXMgYXJyaXZpbmcgaW4gdGhlIGtlcm5lbC4N
Cg0KDQpKdWVyZ2VuDQo=

--------------ARUP9rYN0AOeR0kb0XQe0cap--

--------------vD88nahLxSnTqn7YXJtgIGQK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr0D7MFAwAAAAAACgkQsN6d1ii/Ey9T
Lwf/dfhp5KLDwsmd4dT7ZiDCTzUS6Jd7l67dgXUSiRYlvoKM5VWRYs3Yt6yKXvLoBN9RuC34Muve
K/IOPYdLGyXDXBCyXluHQmn3gXA1PxKrSn2ahIMhfzl9l7QeFI1eA7pGqyICRldUdGox0/4rhFCC
XjDrXhX2CDyVKsdVvA2afNvWL0+UBKBEAIJiWDnxkYQXSVJUcJ4arA/Jh1x2Mn14wR7Bcy7v3WRC
bhhiOlIm4Wc//SbFPNYBKV+BP8548E0IN/k9F4uRWsQhcwB2Ti+eIVdsnQmsDKmm5pihEmFeQzBR
DlnbPB6UnLBFL0XOmlHa8QwiYUmWmSqLlMuH/Ma2yg==
=1hGf
-----END PGP SIGNATURE-----

--------------vD88nahLxSnTqn7YXJtgIGQK--
