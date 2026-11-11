Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380369;
	b=EqxrJW34JSzhcREvUKF371neIRdAf961tLI0MJc6RfLnJT1JrU/WbgaFH67mvFNcx5Wd
	 FiTr5/A03fonXjpLjoUlIDmXXb+PSHlu/cvoj5NkxYq4sEdwoukgl9tCbtUJe0oH8z4KR
	 ZTgnDmF9dK1L0Jk1Ibkvs6MRPr6YH639dE1kpQzJ1g2ENRiSrod3WjAAopTkABW4eSRUH
	 V1RJamQErXmiaIDGcBh5xxdMN9LehZYO28rZQgQKXaI8ZG4jhLHeU78+wgfJrmDs8ajly
	 Tyqxq1PUDtOeRfWcIAx95DS5TmUH1qiNPQ7MggF63lP8nrSpRYji1PsipOCj9aWIXvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380369;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=yV8hrlpozPsiEWEb++KWMa2sJo3D3sqct3Q64SBrrZw=;
	b=Qrho8fSvTiJrKN8ABr23xP0tAq0xViN+HurA/bVSIKW8RkopVWkACN3EQeWKdBhhCEuy
	 JAxGOwxqhvNtwHglknGo0E/5DD4c/gJU44t2fxbgS/sThi1eYz6/SjKZ9nfuzRnyz/1Fd
	 myVA97s3KmX+4s0karAQ+I7ztcsf0o76uLyIYCu558b/oNc0h8pqVESneEkIGdCnwri5R
	 P1yoknTPxXfALC8HCKYWFeylOqEieqYktkX1Bzvr1vVwX7LdtY4pfAaVo6HAAZp2lzbIe
	 GAVLOa5u7QFbBdH+Zxg6KlhChUKCnGVR+Z0y7OowCfMmmrYCWQ4rZxqyGmOWldck0sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Oqdw0A0A;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Oqdw0A0A;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB25606A9A3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB25606A9A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Oqdw0A0A;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Oqdw0A0A
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 07EF421EBF;
	Wed, 11 Nov 2026 06:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794380367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yV8hrlpozPsiEWEb++KWMa2sJo3D3sqct3Q64SBrrZw=;
	b=Oqdw0A0AO1KS27HFDxzM+rKs/T6Rt5Jwf1MP+ZCwa4pMhPzBOXti1yAvE6LTaiGIstwJi6
	cExTBPiiw3iBDupJX1MQK0RRlZgLAlU5sAZnE5IF0OSr6r3mbiaIAQsbXCzdIgBhfya1dy
	ton1FjNH093nvfGGP4Sn4IO90uWKHK0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Oqdw0A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794380367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yV8hrlpozPsiEWEb++KWMa2sJo3D3sqct3Q64SBrrZw=;
	b=Oqdw0A0AO1KS27HFDxzM+rKs/T6Rt5Jwf1MP+ZCwa4pMhPzBOXti1yAvE6LTaiGIstwJi6
	cExTBPiiw3iBDupJX1MQK0RRlZgLAlU5sAZnE5IF0OSr6r3mbiaIAQsbXCzdIgBhfya1dy
	ton1FjNH093nvfGGP4Sn4IO90uWKHK0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 827D11339F;
	Wed, 11 Nov 2026 06:59:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cau3FU4S9GoqOgAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 06:59:26 +0000
Message-ID: <d97e0e3c-f551-4384-8b51-2bd7424abd44@suse.com>
Date: Wed, 11 Nov 2026 07:59:25 +0100
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
Subject: Re: [PATCH v2 5/8] x86/xen/time: Clear xen_clock mapping later
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
 <1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@vates.tech>
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
In-Reply-To: <1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wudRoL3uGjY0X6IXsESZ3IvW"
X-Spamd-Result: default: False [-10.21 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.29)[0.941];
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
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,vates.tech:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.21
X-Spam-Level: 
X-Rspamd-Queue-Id: 07EF421EBF

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wudRoL3uGjY0X6IXsESZ3IvW
Content-Type: multipart/mixed; boundary="------------HTolZmEc8gjt0Uc7AWth7o0T";
 protected-headers="v1"; hp="clear"
Message-ID: <d97e0e3c-f551-4384-8b51-2bd7424abd44@suse.com>
Date: Wed, 11 Nov 2026 07:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] x86/xen/time: Clear xen_clock mapping later
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
 <1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@vates.tech>
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
In-Reply-To: <1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@vates.tech>

--------------HTolZmEc8gjt0Uc7AWth7o0T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTAuMjYgMTk6MDYsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBUaGUgY3VycmVudCBs
b2dpYyBoYXMgYSBjb3JuZXIgY2FzZSB3aGVuIGJvdGggeGVuX3NhdmVfdGltZV9tZW1vcnlf
YXJlYSgpDQo+IGFuZCB4ZW5fcmVzdG9yZV90aW1lX21lbW9yeV9hcmVhKCkgZmFpbHMuIElu
IHRoaXMgY2FzZSwgdGhlIG1hcHBpbmcgaXMgbmV2ZXINCj4gY2xlYXJlZCBhbmQga2VwdCB3
aXRoIHByZXZpb3VzIHB2Y2xvY2sgdmFsdWVzIChpbnZhbGlkYXRpbmcgdGhlIGNvbW1lbnQN
Cj4gcmVnYXJkaW5nIFZEU09fQ0xPQ0tNT0RFX1BWQ0xPQ0sgYXMgdGhlIGRhdGEgbWF5IG5v
dCBoYXZlIGJlZW4gemVyb2VkKS4NCj4gDQo+IEFsc28gY29udmVydCB0aGUgY2xlYXJfcGFn
ZSB3aXRoIGEgbWVtc2V0LCB0aGVyZSdzIG5vIG5lZWQgdG8gY2xlYXIgdGhlDQo+IGVudGly
ZSBwYWdlIHdoZW4gd2Ugb25seSBjYXJlIGFib3V0IDY0IGJ5dGVzIG9mIGl0Lg0KPiANCj4g
Rml4ZXM6IDIyMjlmNzBiNWJiYiAoIng4Ni94ZW4vdGltZTogc2V0dXAgdmNwdSAwIHRpbWUg
aW5mbyBwYWdlIikNCj4gU2lnbmVkLW9mZi1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGll
QHZhdGVzLnRlY2g+DQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg==

--------------HTolZmEc8gjt0Uc7AWth7o0T--

--------------wudRoL3uGjY0X6IXsESZ3IvW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr0Ek0FAwAAAAAACgkQsN6d1ii/Ey9b
TAf+IWTHJGPmc04SjEg2jlda7GVvWM6uEND9ZgrpIx4mEWDMqFH29lxgTSn99aFksaMaJjgV6vOM
v/in2qcNVJ6kvw/uGG6UffZxnyUJ5e2fjICR5v5eB8M3o7ARnV/QymNwVHo8WKHGrYAuGrMYophN
ZMgDOW/O1GDnx6U1Y1c2Yu657nMc0F8e1js7dMz4BqUCdoVK1yGtpj19wB8CHtDV0fHHFURC50Jg
TtaSZXKJ77PHaZW3v83aHKt4p/1KyqKfasBvYOecl/YxqCi3TMMOdOezzRSn3Zh/XEATVVsRmMnV
jLx4IhnO8Vmu/2sMb3o6icy42Bw0Lj5GYs+GsA7w6w==
=p9m9
-----END PGP SIGNATURE-----

--------------wudRoL3uGjY0X6IXsESZ3IvW--
