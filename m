Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382945;
	b=FPXuBFEljBUkibQA5A7SmN/kyuDeQe6yT+flsM1zOL+sjX4Le7Kz1PHmmMR31RTmQ7X4
	 Ix/6JSILSPinBBrHOTDn7O+DeVDOAJGe3Ztxyxst9qx+sSiNJ/g9rU0KdN/Dd0wWNnbmV
	 r951C4/utVMgoJwGYvoLeWiDhCLsI9Z75EJ3z4HJPElbFxjCvWauUKNJRkUSDC2Xf22H5
	 7YF3do8d8OVvMtT4woYujvRIGBYtipWFhgbjaChuV2jv9V8R9w3i2iq/2IhVmS45tlPW/
	 HBwIoUEXtBORK/Pi6Fn84peVaoX502zssKcQYFLQKkc+PqfFV2/1LMIbCyln+YRbfCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382945;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=BY15tD/A3K1+RDVjlabMqua+yUmw6kPZuJpduMwqyFU=;
	b=kwxv0zWTKrgeI6JAc/DNUsuUUwdmeZyt6XdJLyJNgrWys56FnCw/dpEFKRMhJjNoUQXf
	 a4zYCFM4d+EmfteePxlGr8A1JEfYKrzp7ezt+MppkvLXnO3a663qwp5tRq+LlfedIaeeU
	 uUr+a3cHwgRaE5xRH3Kj7o+goHLrwMYyOFuuQZAMHakjiJ9YwuD3CfxS7gQAYkbDjUTP9
	 DosRK+VQPwF3xLc7mLM9ewRkdYKma5Oy9WPr9aSazr/xBgZPDSEg1k/unh6TRl5f62f2f
	 tp0qiJ/76XTHHdjdrD3V2nLb8o80EHUcTBG+T5DvH3LE06A7YFnL4xiihlPqBtOEyaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=PdFY+K3D;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=f9v9IvfA;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A163B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=PdFY+K3D;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=f9v9IvfA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0C8A21DEE;
	Wed, 11 Nov 2026 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794382942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BY15tD/A3K1+RDVjlabMqua+yUmw6kPZuJpduMwqyFU=;
	b=PdFY+K3DOL0TX4+0/GZ3zFhe6n2ZQ5WCEqrBwhjb3Xh2Qb/7rmdj+qNfAOkTb2PehUFj8j
	8DXMjDNXPyig5K+PF2qDFRtH2a4hAYxVLqffOovYP6L/q3YlVw3xuPnLK+PAog4G1LmEC6
	460AhGhhB/ZRmMra6pTXs/jUJDLsHSA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794382940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BY15tD/A3K1+RDVjlabMqua+yUmw6kPZuJpduMwqyFU=;
	b=f9v9IvfABnO+AMcidLBqP9+YyTq4IkxS2edHAJPrLSKUFvMT0woalIuf8sYabxUYsBqbVl
	nMNhurusAVlvLWQdbbVz4TEhz74h4Lq3hKl9W7eUb6vQkMAEC+fmz7NL/6dEy3Hb92zGFY
	JDIyZgsf77IzEnm6bN5pZhiNjXjnX0Y=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57CD41339F;
	Wed, 11 Nov 2026 07:42:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a33VC1wc9GqJZQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 07:42:20 +0000
Message-ID: <a6acba88-e224-4fcd-a0a8-c8c0acda8ea8@suse.com>
Date: Wed, 11 Nov 2026 08:42:19 +0100
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
Subject: Re: [RFC PATCH v2 8/8] xen/sysfs: Honor cached xen_features instead
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
 <1792170399.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@vates.tech>
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
In-Reply-To: <1792170399.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5LIUF0LOtyTtToeHZQZ6ZMN8"
X-Spamd-Result: default: False [-9.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.50)[0.999];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,epam.com:email,vates.tech:email,oracle.com:email,suse.com:email];
	URIBL_BLOCKED(0.00)[epam.com:email,oracle.com:email,vates.tech:email,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -9.79
X-Spam-Level: 
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5LIUF0LOtyTtToeHZQZ6ZMN8
Content-Type: multipart/mixed; boundary="------------pf3q9qSzpshtDKqpxhR0vAMl";
 protected-headers="v1"; hp="clear"
Message-ID: <a6acba88-e224-4fcd-a0a8-c8c0acda8ea8@suse.com>
Date: Wed, 11 Nov 2026 08:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 8/8] xen/sysfs: Honor cached xen_features instead
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
 <1792170399.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@vates.tech>
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
In-Reply-To: <1792170399.8631fc262581453bbf619ec5b2062170.1a145ae179d0008425@vates.tech>

--------------pf3q9qSzpshtDKqpxhR0vAMl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTAuMjYgMTk6MDYsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBDdXJyZW50bHksIC9z
eXMvaHlwZXJ2aXNvci9wcm9wZXJ0aWVzL2ZlYXR1cmVzIHF1ZXJpZXMgdGhlIHhlbg0KPiBm
ZWF0dXJlcyBmcm9tIHRoZSBoeXBlcnZpc29yIGV2ZW4gaWYgaXQgZG9lc24ndCBtYXRjaCB3
aGF0IExpbnV4DQo+IHVzZXMgaXRzZWxmIChpLmUgd2hhdCB3ZXJlIHRoZSBmZWF0dXJlcyBh
dCB0aGUgdGltZSBvZiB0aGUgYm9vdCkuDQo+IA0KPiBGb3IgY29uc2lzdGVuY3kgd2hlbiBt
aWdyYXRpb25zIGFyZSBpbnZvbHZlZCwgcmVwb3J0IGNhY2hlZA0KPiB4ZW5fZmVhdHVyZXMg
aW5zdGVhZCwgdGhhdCBhbHNvIGF2b2lkcyBtYWtpbmcgaHlwZXJjYWxscyB0byBxdWVyeQ0K
PiB0aGlzIGluZm9ybWF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGVkZHkgQXN0aWUg
PHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo+IC0tLQ0KPiBDQzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPiBDQzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4NCj4gQ0M6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlz
aGNoZW5rb0BlcGFtLmNvbT4NCj4gQ0M6IHg4NkBrZXJuZWwub3JnDQo+IENDOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IA0KPiBJJ20gbm90IHN1cmUgd2hhdCAvc3lzL2h5
cGVydmlzb3IvZmVhdHVyZXMgaXMgZXhwZWN0ZWQgdG8gc2hvdyBiZXR3ZWVuDQo+IHdoYXQg
TGludXggY29uc2lkZXJzIChwcm9wb3NhbCkgYW5kIHdoYXQgdGhlIGh5cGVydmlzb3IgdGVs
bHMgKGN1cnJlbnQNCj4gYmVoYXZpb3IpLg0KDQpJIHRoaW5rIGl0IHNob3VsZCBiZSB0aGUg
Zm9ybWVyLCBzbzoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------pf3q9qSzpshtDKqpxhR0vAMl--

--------------5LIUF0LOtyTtToeHZQZ6ZMN8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr0HFsFAwAAAAAACgkQsN6d1ii/Ey/o
aQf/VZadkWCtmvxxo8rgUrgutSWicWur3huPXGjmWAKnPH/7bCaZsgRoQFZQZ1NyYT1VWQaRfaox
QHpPZp3+pEDsfsI0eddtciXUib6fqF5n2NCVwKlpUoouKhlThbGNVoUaCX8pB7wVAZ+Lm1EzcFXd
vD/A7NIxjuWghRDJ9CbQnxYguSZ98DR4auESs77lB0ROZ9zs1BwIB39FZaKkBkvQufTePttidixo
6mz2iqrBpfZZbpmsWmCOWZvk6Tw95MJ/+VL3SFddbKVckW7/7d6nY5upPP5KsJakJ2SZ557x/UnR
SSvwCV5KkGSQPpsOPxkQvp1/vvcleVLDCqvDAaUNWw==
=tW4i
-----END PGP SIGNATURE-----

--------------5LIUF0LOtyTtToeHZQZ6ZMN8--
