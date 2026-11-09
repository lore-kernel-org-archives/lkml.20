Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210802;
	b=cScSqSz+UjWs9pce3I0/Sr3LKH03YZkEXmYmDUNgdcZSwOf6VLC0Dh3WkjnB8JzVFSM0
	 7MReXop+Ofkf1gKwq4iu5iJ+7ykBTAejosUNtX4gwS25uiXsyox5OnwX+dV54c1m5jN08
	 iGOIh117pemWoiCdwhbidTgVIuQ2hiNOFu8XP6pxv2jLNdUUjFNtQuv91WN+pmqKIhJ5T
	 chsf8KmTT524NE9FJju7i59RjdNrP4vzyj/zt7DAUqAhpvrDUCNjTHz/pyi+9qp9gvJI+
	 yUnGngzo/kgamIlPJH5HhharuWhGfULYx+1PRmVuIhh5gWtn+2ahWhm006DQDcI2WjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210802;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=mtwimrsAGfjjluaZ29H+iIKzD9a3mq5Gyxp1CKu0/S4=;
	b=WJhXB1a0ZSO/+nPexKGAatVvEvzXFEVpqN+Faa+xhPFZHgcr86QP/wQeHgcN+B6K6ydy
	 TwTopLO46nWeeUXXs2KLWfPltcGN0IPaC4lYKWJnJFkRLL7gytpBBsU/EIgAuBb8Z/mkm
	 4aDpTnviij4E7bP80qxNNkdPvphM96Q45DbyyDmDo4rTeQqiRiXlUBjy4y/CssaDNPfqF
	 NlE8f1/QCxcR9yW06pttdo7GLT45fQmT1LfA3FrN6+8w68bveM0X7V+MBKO6d8IfP7E9f
	 c3AcO8+8hIrxq669HO2ndyEgdl7l1q4+EAz0ZxiuDrOOdmRjgTeOXuVziFRjR4KP4Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g6DzDdfc;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g6DzDdfc;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B3606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g6DzDdfc;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g6DzDdfc
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2F3F21F83;
	Mon,  9 Nov 2026 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794210799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mtwimrsAGfjjluaZ29H+iIKzD9a3mq5Gyxp1CKu0/S4=;
	b=g6DzDdfcnRcM33YreK2ahQsBHkXEbLPIgPFv9GPVarTdwsPQr2CTIsF55ENSLzdf38DC5s
	npi7JRAh/4EppTiPS1/9LSZ7QXBfih7Cv5u+iLWv04iPb2n9fQTbmef45IfBmsI1M9Pxsm
	mGFFaqOrG219P4NlTHxK3DLrTjyISYE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794210799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mtwimrsAGfjjluaZ29H+iIKzD9a3mq5Gyxp1CKu0/S4=;
	b=g6DzDdfcnRcM33YreK2ahQsBHkXEbLPIgPFv9GPVarTdwsPQr2CTIsF55ENSLzdf38DC5s
	npi7JRAh/4EppTiPS1/9LSZ7QXBfih7Cv5u+iLWv04iPb2n9fQTbmef45IfBmsI1M9Pxsm
	mGFFaqOrG219P4NlTHxK3DLrTjyISYE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6749A13319;
	Mon,  9 Nov 2026 07:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZaOBD+978WrJRwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 09 Nov 2026 07:53:19 +0000
Message-ID: <7af392b9-0cf9-46fe-a820-c994942893fe@suse.com>
Date: Mon, 9 Nov 2026 08:53:18 +0100
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
Subject: Re: [PATCH] xen/events: replace __get_free_pages() with kmalloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
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
In-Reply-To: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wXW5pNoOVuHMY5I23DbFQuaD"
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-9.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.49)[0.998];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -9.80

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wXW5pNoOVuHMY5I23DbFQuaD
Content-Type: multipart/mixed; boundary="------------9CjsJxfyxMmK8BT64s75qaM0";
 protected-headers="v1"; hp="clear"
Message-ID: <7af392b9-0cf9-46fe-a820-c994942893fe@suse.com>
Date: Mon, 9 Nov 2026 08:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: replace __get_free_pages() with kmalloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
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
In-Reply-To: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>

--------------9CjsJxfyxMmK8BT64s75qaM0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTEuMjYgMDk6NDIsIE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgd3JvdGU6DQo+
IHNldF9ldnRjaG5fdG9faXJxKCkgYWxsb2NhdGVzIGEgcGFnZSBmb3IgdGhlIGV2ZW50IGNo
YW5uZWwgdG8gSVJRDQo+IG51bWJlciBzb2Z0d2FyZSBsb29rdXAgdGFibGUuDQo+IA0KPiBU
aGlzIGJ1ZmZlciBjYW4gYmUgYWxsb2NhdGVkIHdpdGgga21hbGxvYygpIGFzIHRoZXJlJ3Mg
bm90aGluZyBzcGVjaWFsDQo+IGFib3V0IGl0IHRvIGdvIGRpcmVjdGx5IHRvIHRoZSBwYWdl
IGFsbG9jYXRvci4NCj4gDQo+IGttYWxsb2MoKSBwcm92aWRlcyBhIGJldHRlciBBUEkgdGhh
dCBkb2VzIG5vdCByZXF1aXJlIHVnbHkgY2FzdHMgYW5kDQo+IGtmcmVlKCkgZG9lcyBub3Qg
bmVlZCB0byBrbm93IHRoZSBzaXplIG9mIHRoZSBmcmVlZCBvYmplY3QuDQo+IA0KPiBQZXJm
b3JtYW5jZSBkaWZmZXJlbmNlIGJldHdlZW4ga21hbGxvYygpIGFuZCBfX2dldF9mcmVlX3Bh
Z2VzKCkgaXMgbm90DQo+IG1lYXN1cmFibGUgYXMgYm90aCBhbGxvY2F0b3JzIHRha2UgYW4g
b2JqZWN0L3BhZ2UgZnJvbSBhIHBlci1DUFUgbGlzdCBmb3INCj4gZmFzdCBwYXRoIGFsbG9j
YXRpb25zLg0KPiANCj4gRm9yIHRoZSBzbG93IHBhdGggdGhlIHBlcmZvcm1hbmNlIGlzIGFu
eXdheSBkZXRlcm1pbmVkIGJ5IHRoZSBhbW91bnQgb2YNCj4gcmVjbGFpbSBpbnZvbHZlZCBy
YXRoZXIgdGhhbiBieSB3aGF0IGFsbG9jYXRvciBpcyB1c2VkLg0KPiANCj4gUmVwbGFjZSB1
c2Ugb2YgX19nZXRfZnJlZV9wYWdlcygpIHdpdGgga21hbGxvYygpIGFuZCBmcmVlX3BhZ2Vz
KCkgd2l0aA0KPiBrZnJlZSgpLg0KPiANCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzYzNTQwNWU0LTk0MjMtNGEyNS1hNmU3LWUwM2M4ZWEwYmNiZUByZWRoYXQuY29t
DQo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2Vy
bmVsLm9yZz4NCg0KU2hvdWxkbid0IHlvdSBhbHNvIHJlcGxhY2UgX19nZXRfZnJlZV9wYWdl
KCkgaW4geGVuX2luaXRfSVJRKCk/IEkgZG9uJ3Qgc2VlDQp3aHkgdGhpcyBpcyBiZWluZyBv
bWl0dGVkLg0KDQoNCkp1ZXJnZW4NCg0KPiAtLS0NCj4gVGhpcyBpcyBhIChzbWFsbCkgcGFy
dCBvZiBsYXJnZXIgd29yayBvZiByZXBsYWNpbmcgcGFnZSBhbGxvY2F0b3IgY2FsbHMNCj4g
d2l0aCBrbWFsbG9jLg0KPiANCj4gTGFyZ2VseSwgYW55dGhpbmcgdGhhdCBkb2Vzbid0IG5l
ZWQgc3RydWN0IHBhZ2UgKG9yIGEgbWVtZGVzYyBpbiB0aGUNCj4gZnV0dXJlKSBzaG91bGQg
anVzdCB1c2Uga21hbGxvYygpIG9yIGt2bWFsbG9jKCkgdG8gYWxsb2NhdGUgbWVtb3J5Lg0K
PiBSZW1vdmluZyBuZWVkbGVzcyBjYWxscyB0byBwYWdlIGFsbG9jYXRvciBoZWxwcyB3aXRo
IG1lbWRlc2MgKGFrYSBwcm9qZWN0DQo+IGZvbGlvKSBjb252ZXJzaW9uIGFuZCBnaXZlcyBh
IG5pY2VyIEFQSSB3aXRob3V0IGNhc3RzLg0KPiAtLS0NCj4gICBkcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94
ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jh
c2UuYw0KPiBpbmRleCBmZDE2ZDY1MmM4MWYyLi44YzM3NzQ5MzQyOWI3IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KPiArKysgYi9kcml2ZXJz
L3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KPiBAQCAtMjMwLDcgKzIzMCw3IEBAIHN0YXRp
YyBpbnQgc2V0X2V2dGNobl90b19pcnEoZXZ0Y2huX3BvcnRfdCBldnRjaG4sIHVuc2lnbmVk
IGludCBpcnEpDQo+ICAgCQlpZiAoaXJxID09IC0xKQ0KPiAgIAkJCXJldHVybiAwOw0KPiAg
IA0KPiAtCQlldnRjaG5fcm93ID0gKGludCAqKSBfX2dldF9mcmVlX3BhZ2VzKEdGUF9LRVJO
RUwsIDApOw0KPiArCQlldnRjaG5fcm93ID0ga21hbGxvYyhQQUdFX1NJWkUsIEdGUF9LRVJO
RUwpOw0KPiAgIAkJaWYgKGV2dGNobl9yb3cgPT0gTlVMTCkNCj4gICAJCQlyZXR1cm4gLUVO
T01FTTsNCj4gICANCj4gQEAgLTI0MSw3ICsyNDEsNyBAQCBzdGF0aWMgaW50IHNldF9ldnRj
aG5fdG9faXJxKGV2dGNobl9wb3J0X3QgZXZ0Y2huLCB1bnNpZ25lZCBpbnQgaXJxKQ0KPiAg
IAkJICogdGhyZWFkIHdhcyBmYXN0ZXIgaW5zZXJ0aW5nIGl0LCB3ZSBjYW4gZHJvcCBvdXJz
Lg0KPiAgIAkJICovDQo+ICAgCQlpZiAoY21weGNoZygmZXZ0Y2huX3RvX2lycVtyb3ddLCBO
VUxMLCBldnRjaG5fcm93KSAhPSBOVUxMKQ0KPiAtCQkJZnJlZV9wYWdlKCh1bnNpZ25lZCBs
b25nKSBldnRjaG5fcm93KTsNCj4gKwkJCWtmcmVlKGV2dGNobl9yb3cpOw0KPiAgIAl9DQo+
ICAgDQo+ICAgCVdSSVRFX09OQ0UoZXZ0Y2huX3RvX2lycVtyb3ddW2NvbF0sIGlycSk7DQo+
IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDY2MjhlN2Q0YzZiMjVjOGQxOGYxMzQ1ZTNhMjBk
MjE4MjlhYWU3ZTQNCj4gY2hhbmdlLWlkOiAyMDI2MDYyNC1iNC14ZW4tYTFjZDYyOWNlOWY0
DQo+IA0KPiAtLQ0KPiBTaW5jZXJlbHkgeW91cnMsDQo+IE1pa2UuDQoNCg==

--------------9CjsJxfyxMmK8BT64s75qaM0--

--------------wXW5pNoOVuHMY5I23DbFQuaD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrxe+4FAwAAAAAACgkQsN6d1ii/Ey9J
cwf+L3XaMzorCG1a1NqCToQpyu0zZH4Y8kmNNW0/rOxHQHH3N6z1NjBS/4OA3dFxz/HgVZJG9fjN
VpLu3NGawgxhx0kswckZeP0mL1qsTAJNqCJt2iR9xPBSQIhvWz2dTObySLv7i2AzzK+7Ker8V/A3
l9M7wG9YjYC9c0fsPRcqtYFECiH8KZL47sOCGX+2mS5bn1lJG7U9/C1ODW3hmiTns3rdiYFg8TxX
NFVkoo/VFf1nIjJtr4IVJsVNhyOsfTRRbbiy4eyb8RpYC5mCNK2t9k1m5Q/EN8ZvRlsG+EcptY/7
VqBH+RbDz8HR65Q9mlfkxWSs8/m1rpk6XBRjjX7n+A==
=sx3s
-----END PGP SIGNATURE-----

--------------wXW5pNoOVuHMY5I23DbFQuaD--
