Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295562;
	b=UYjVKqelZyfr5AD3CEGcTWxsGlWHfjEu2WRw+PYCkGb+7muQUBNsIRRTJDHFMqGB5ALR
	 xFXboqk2LKKBdNJVbKbbnQ8iAk7e1slhX2pG3sPx8Mp8WTQ94mL2oLcjyN/pz607/aodP
	 aVgInm2siU13TGHLfj4/im3Nf4h/fNd9bNDS/Ya1c/Zxw/LdxZS3LG3AyofdjwMIqqukE
	 c/9MRdBO08YsrSqXVL3jBC6VYP7R4WePG2rOUj5an6QUHeehO9XA2efZ4AXcJuB+FcWty
	 6XD8HngNLUHwUvWRJSCgY0fS/fHJj2UdZ3Zc1WdzmP4X1cDmQn2A8MiEI72P88dw/FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=OVur5LhTJoFv66K/FHeEGJ1JCwZsBRUToYym0WGroXg=;
	b=MJs03GQxYQ76bBcLou0PpO/SKglq49OGaekKEudx8dOM9EksbZdSnuh3nlSFM41EXhLH
	 gFlRCE73kTANe31cuJvuiduubJkvbMgQvDCoEhOTJkUk8ova5ZnWL1NFscxnhGiYdfWO+
	 hsv70wRpMax88XM6nJ10tRmrxIeXCCIANKi6ohEWKVg8pDX+t8hleBZEkXU7bLW1BdO96
	 /DqBNkPi8oFIeP0TFxhJnPd9sVv9JpFA8KU3rNq4jQKEkqFOKTnTS6s5zMPpPsXi9zTbO
	 Ltx9jUv55FwqHn3otGjZLXyS18xLN4VJlJg+PtGhPGeU3veeYrgaHVKO++JVNteEXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N7QLvWRi;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D015606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D015606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N7QLvWRi
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d30639709so208895266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794295561; x=1794900361; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVur5LhTJoFv66K/FHeEGJ1JCwZsBRUToYym0WGroXg=;
        b=N7QLvWRiqNd8cDpUplDDNvOg9vltLUYl0I6EDp9SQHkqhHgXTMudrICtk/BESAv47W
         V1YbNEwwP8DDdX3vrM7yUMW+XPBQYePTFF3Ux9c59egyGDp9gL5Bfc8YzrthuP39CzDm
         56Y2PuopPB9D2Feq0gyDR+xzuVgrIXtuSTEGGwxbuVjxRnVQzbL6bJ3oKiCurv+NvPYA
         enJ3uwyYHljI83d5jmX8g9URdL79hT1KAAX95OUc3tStaGyHrGqNyN0xqj6Zz/fM2fqc
         392p6K9O55j+OEawdG3FLwj1SNORRs+jtxcW+9Kvs8AO2OISYdQB525s69vLNlWI09u7
         ovLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794295561; x=1794900361;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVur5LhTJoFv66K/FHeEGJ1JCwZsBRUToYym0WGroXg=;
        b=C85OXulw5A5HDf4sAS+P4XoF1NhnGKYo44hGhAM477OAEmlPFNLEyeTeiRlpgW1fZ2
         l+fIASAxMe4ILO0ZWOlLTY8bzLyvhLOgeYXnRDKfyB5rUaMQ7xxWylEAId01ftfP74qa
         w3VYhDVQBpmnQY5OrZ3j0mq6C1N5E+6lN0ZE37wY/oP00R4crFqQyURnG541+fgOZjFK
         cCwl3eQOwVryChykjsWzBwvZ5licmzbuBUdq0iApVMg5AELgTGeNJuoca+phDcoBBp/V
         CgN5GnXM/6nqtGNtUkAAL8aDnEG6Ve+lhmjvEM4gxIxYVqdtw/WFioo1nXwlEfQg8jHV
         Ydkw==
X-Forwarded-Encrypted: i=1; AL+hErEIbRLh8arDPBGMlgtRZCyNK4sg7Ijx0Jy1s2/ilM2YsyL1uKB5ean8qFoXCgxgao/rC2lAGTFBGwWaNZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9heIAm7+SQkKVji3jtHM3HU0MygvQPypcZa6mgD+i6mYqogshy
	TYKDdFMj18zpcppYFdBEUJu6aCO4FGZ7YDDgbtrK9zuuVA/w9c8eFBbqZzQG+VCd6QBc9yCjLBY
	1pogoNyA=
X-Gm-Gg: AYBFou2mVVJVROL7I19vfdGQNgLbc6nNkJbN40kfi4ggRjk/PjKXQPUqroa8A1ccOQn
	XJpJuYu5qgeuLdmZaN3VEZ3hR6HmcK+45Tg35TQHTFwILmG6XnfrWCq2fD0CAHcszM3zqB0nA6Z
	BG97Hxt7ujzQvripK087KyDujIUaowxTG+WHWo7hR+B3QDkDK/t29BHk5sP2C7OiokoEiGQNBc+
	egHWG/d42igfU0Em/7vQd8hRDB4j9R4A4wk24BGD3RFPBEfOpgdDW7iggzEkObyebukTrzeg/xM
	lbjlFNiVXrsik+kLw4P7gjJ68SeU3I5ii2WoFvJBiyPRQByjLeOSzlev8KbQA9FjxwDSiiGV8ZD
	EYhoZPjJge3z3osE1sEar0rn60C71RyunAv7A5ry3hwdYw2Na8v1akbFerjlK6CGa1fpiPfVawA
	8OF8cCIal9W02M67p+shj+ObjqzSUEXmucRDIjEO49M4yJesA+0GoU/600IVqWvfZlyuzTQYVbt
	lYL+kxRfuZcz/vZVEQ8hD0xfzXbc6Fao+sNDv8CEUizfArCh0inUhZqvQJdOF7YtRNKW4MzcgyI
	161dmMEVEorc3kgOPikxjHPcya27QJYFH1g4epJK4sXV0EDcBum/q2sPmTmJR8lehTAeaPZQaap
	gpJXOsgToJimZZuEpElqCYZy6K0vLWecmkb0+dBUBctxUUNRoaJu3dGNZzoUVIMTjAGL37Ef3
X-Received: by 2002:a17:906:eecb:b0:c40:4965:72bd with SMTP id a640c23a62f3a-c50494e70c5mr127676966b.19.1794295560623;
        Mon, 09 Nov 2026 23:26:00 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a593b5esm76107766b.34.2026.11.09.23.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:26:00 -0800 (PST)
Message-ID: <b67abdc3-f234-49ce-b463-1e06e87eccf8@suse.com>
Date: Tue, 10 Nov 2026 08:25:59 +0100
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
Subject: Re: [PATCH v2] xen/events: replace page allocator calls with
 k[mz]alloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EM4uW1evflvUIpHMy0e9UjZp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EM4uW1evflvUIpHMy0e9UjZp
Content-Type: multipart/mixed; boundary="------------Yi2633bQOqoh05egSSnPXUpZ";
 protected-headers="v1"; hp="clear"
Message-ID: <b67abdc3-f234-49ce-b463-1e06e87eccf8@suse.com>
Date: Tue, 10 Nov 2026 08:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/events: replace page allocator calls with
 k[mz]alloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>

--------------Yi2633bQOqoh05egSSnPXUpZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjYgMDg6MTQsIE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgd3JvdGU6DQo+
IHNldF9ldnRjaG5fdG9faXJxKCkgYWxsb2NhdGVzIGEgcGFnZSBmb3IgdGhlIGV2ZW50IGNo
YW5uZWwgdG8gSVJRDQo+IG51bWJlciBzb2Z0d2FyZSBsb29rdXAgdGFibGUgYW5kIHhlbl9p
bml0X0lSUSgpIGFsbG9jYXRlcyB0aGUgUElSUSBFT0kNCj4gYml0bWFwIHRoYXQgaXMgcmVn
aXN0ZXJlZCB3aXRoIHRoZSBoeXBlcnZpc29yIGluIFBWIGRvbWFpbnMuDQo+IA0KPiBUaGVz
ZSBidWZmZXJzIGNhbiBiZSBhbGxvY2F0ZWQgd2l0aCBrbWFsbG9jKCkgYXMgdGhlcmUncyBu
b3RoaW5nIHNwZWNpYWwNCj4gYWJvdXQgdGhlbSB0byBnbyBkaXJlY3RseSB0byB0aGUgcGFn
ZSBhbGxvY2F0b3IuIFRoZSBQSVJRIEVPSSBiaXRtYXAgaXMNCj4gcGFzc2VkIHRvIHRoZSBo
eXBlcnZpc29yIGJ5IGl0cyBmcmFtZSBudW1iZXIgYW5kIG11c3Qgb2NjdXB5IGEgd2hvbGUN
Cj4gcGFnZSwgd2hpY2ggaXMgZ3VhcmFudGVlZCBmb3IgYSBQQUdFX1NJWkUga21hbGxvYygp
IGFsbG9jYXRpb24gYXMgaXQgaXMNCj4gbmF0dXJhbGx5IGFsaWduZWQuDQo+IA0KPiBrbWFs
bG9jKCkgcHJvdmlkZXMgYSBiZXR0ZXIgQVBJIHRoYXQgZG9lcyBub3QgcmVxdWlyZSB1Z2x5
IGNhc3RzIGFuZA0KPiBrZnJlZSgpIGRvZXMgbm90IG5lZWQgdG8ga25vdyB0aGUgc2l6ZSBv
ZiB0aGUgZnJlZWQgb2JqZWN0Lg0KPiANCj4gUGVyZm9ybWFuY2UgZGlmZmVyZW5jZSBiZXR3
ZWVuIGttYWxsb2MoKSBhbmQgX19nZXRfZnJlZV9wYWdlcygpIGlzIG5vdA0KPiBtZWFzdXJh
YmxlIGFzIGJvdGggYWxsb2NhdG9ycyB0YWtlIGFuIG9iamVjdC9wYWdlIGZyb20gYSBwZXIt
Q1BVIGxpc3QgZm9yDQo+IGZhc3QgcGF0aCBhbGxvY2F0aW9ucy4NCj4gDQo+IEZvciB0aGUg
c2xvdyBwYXRoIHRoZSBwZXJmb3JtYW5jZSBpcyBhbnl3YXkgZGV0ZXJtaW5lZCBieSB0aGUg
YW1vdW50IG9mDQo+IHJlY2xhaW0gaW52b2x2ZWQgcmF0aGVyIHRoYW4gYnkgd2hhdCBhbGxv
Y2F0b3IgaXMgdXNlZC4NCj4gDQo+IFJlcGxhY2UgdXNlIG9mIF9fZ2V0X2ZyZWVfcGFnZXMo
KSB3aXRoIGttYWxsb2MoKSwgX19nZXRfZnJlZV9wYWdlKCkgd2l0aA0KPiBfX0dGUF9aRVJP
IHdpdGgga3phbGxvYygpIGFuZCBmcmVlX3BhZ2Vbc10oKSB3aXRoIGtmcmVlKCkuDQo+IA0K
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjM1NDA1ZTQtOTQyMy00YTI1
LWE2ZTctZTAzYzhlYTBiY2JlQHJlZGhhdC5jb20NCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBS
YXBvcG9ydCAoTWljcm9zb2Z0KSA8cnBwdEBrZXJuZWwub3JnPg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------Yi2633bQOqoh05egSSnPXUpZ--

--------------EM4uW1evflvUIpHMy0e9UjZp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmryxwcFAwAAAAAACgkQsN6d1ii/Ey+K
AAf8C1MTN/9OTck7FwQ3t4PikfL6XxlBCTguh5pnn+XNtKkgbFvaAl26KbqsNDq4Egql3ZmgZZWC
paO5EYc8G75rASCelZYAQfSQKB3nTpgwiayf5hMeng2ctPr5OIgyyyio+dv/1CxtW/LHXR9KLfVw
5R+HkZRUjZ1yHvS5+lVN15yGXa93Ieul1NfGzmjSPBKfNobHPKLiUo3QIu8s+KTPcSDmaktt99lr
iH738+5hCNflKljXbvBlxRByHIlTSQ6UgINKd3G8zwt1cRPf+4wMgtJ0d2riY2wAq7K9pg23xMsp
1BbUY9oLWgVcH0jorlzfwPHe7TUbICLgc3iQLsAopg==
=dDBY
-----END PGP SIGNATURE-----

--------------EM4uW1evflvUIpHMy0e9UjZp--
