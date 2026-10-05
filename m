Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06448122C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203161; cv=none; b=MamqT95OBOy9ErWeu9+QeNIDct8QXXJEZ+zTFuQ1+iWpTZEuSQIuuMLOHcC5T7ff4Jf4mroJOaI9SJvuHiKTMAPloGnMr48bMYFIZv9oiFwz6fhIRvlrZ7kLELawvVvBmjdb/1hPRBgx7Eo/PlODNOJAidKQobxwmBUbP/ilwGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203161; c=relaxed/simple;
	bh=ngTUuzTFL2ANmfvCMOZoAzO0ULgveFUOcngTU9ri76U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJny/rhjnyepH8BHeKcMr/dIHyGPYsV15ilGcAkP5wV5HKOO9ryw3XlnZjhV0CvSzpjsrHvevvWGlwi+Buuz+qhfu2ppDnMKnMWNtkPCXmAS+trMhZ7BUasOno56S0ZqQ5nf9b68V2plaLChAHpurO+icEgIbJRUzq/7mqDkey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FBy7IeeJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FBy7IeeJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so1666543a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791203158; x=1791807958; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngTUuzTFL2ANmfvCMOZoAzO0ULgveFUOcngTU9ri76U=;
        b=FBy7IeeJZ9yFCFKmA3AvBMdKUOYgBgDNNF2Z4flLq/6Ogrh3AOZwy8lY0rx/o1L4ML
         fLgu1XZ1sNu9ydbgg9yV1jaC70NctyNQ1Y1Y/eNzC3XByQvc0142RJpBc0dQfClzBZ+F
         l2kq50fpR+oy5UG/y7xa4UfkreICbfuqUMuOuJq1s3hyqbp9vGUVX8HAs49uFt7RtD2J
         h+GbaSFvLrKZraaisxZ0Js/3PYiMLPT2gt+vVUPy0fSnycFXQaURoWIzSw6jvhrRXOrg
         BfRiCnbMZA+ryVjesAhFNd/voh+pWw2T4BxZWaY7av4dzJFeApVyQdR6e22v3NO/anWa
         U18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203158; x=1791807958;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngTUuzTFL2ANmfvCMOZoAzO0ULgveFUOcngTU9ri76U=;
        b=hWlPAnDVz3paBVvnF10IyExkrQ6v4p4roR5XHKTXlM5joJ0mUTuMo9/lqkhBRQ3dyC
         W7ulzifi+6X1N7KOpaWzY6AtcUGbSSrazzG/0Z5uRmQOEYWuC1Ib8CyavvfvMk/DVDJo
         g0BIkwlnWZpQT7PYljY6ryXHCIsnWkr0G3qkV2Xq0j07tOBnIJQIBUoQOvwKWXuzd5gd
         L1yriOl2Yge7flZC71ogxCunDsmu8xPSLPxf4JJ4aMjucMQwmRL/jk9CfCt0O28pJRd7
         yF+qzZiiLRk32CTIoQuijLHUDRSLbaeZ/wff2LNoSqRrH/BQeXEZbYlQxs9n7x5Cqby1
         KWjA==
X-Forwarded-Encrypted: i=1; AKwUvBwCiBkRp9rkug7gNd5DCiUDK6Kj+/GldzmuXcntQiCYLD/qND83WDbJY3Z8JXKXXnKbUxzLVNzsHI0UBbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiwPdLOxJyw3SuAy6mAT18znaQgAVD0y2OoPT54/WQauF9oKpb
	5WQy3hrCIZhCykGoYmBnBPyKpdE1N7hMH4q5EnDwIpM4ltL0FaFn1aIEbzD0ZkgAivU=
X-Gm-Gg: AYBFou3l0HY16RiliX/iHtokr9fcMtvq4xT7pJJdDtNG36AyMhURm6Xqx9ZRaA++MwX
	xmWj9bIRWTmwqpE8btSjGQKen/iqKZJRC4EO3RlCAHtaOjC8X8TIFYOUnaTTuPjtb91JkGMm7pj
	jDmoH4D1DylIQHFknxDfTWVMX4QNy/P8p4A02iVxx9WCHiIsgwQKI6lADAK7lY1JXf5byNym5ou
	DUBQhYCd97xXyMzpumRYA2d0dWWrmdnxb4q3q4Pv/yZYZLRA7jviSf+lfY4I57Fxz9shSKFQSLw
	QEPMPl30n2zsYfnoOCCfhs3TDHVWdYcpmjQJXE1CKoGuBZMyN/kCflmWaG0PgdP92wP6tJ9skmh
	7oEPXMFnHElB0tMa9sCQkS0+fnsBoaUPGnYTFiJomGIBbUxpAoEV5TgLndt6urVw87F76xUP8t7
	flHFWkmUb5h6XDTigphpEeNbgugfXx/Zng9PEzbLMx7ludR3rE7LPH1lPH1mdO7YnbC/mQvXYvc
	APXVzUI9DO5hupynmx90lPmYJiblphoNsSVq2HE1A2Lbc0aYYZ9uqOYcs3sifSK6VuzIQiFzXIW
	+AfqYn8q7oXliHzyVDg0m1R14xK5H6fQhDY=
X-Received: by 2002:a05:6402:401e:b0:6aa:9fef:641c with SMTP id 4fb4d7f45d1cf-6afada0d18amr6798484a12.28.1791203157706;
        Mon, 05 Oct 2026 05:25:57 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014783csm3254599a12.4.2026.10.05.05.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:25:57 -0700 (PDT)
Message-ID: <7697abef-5a5b-4b8e-b0e9-7e58c60e6180@suse.com>
Date: Mon, 5 Oct 2026 14:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mtrr: allocate the cache map before taking mtrr_mutex
To: Yogesh Gaur <yogeshgaur.83@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 syzbot+342762971f666337474e@syzkaller.appspotmail.com
References: <20261005102152.368-1-yogeshgaur.83@gmail.com>
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
In-Reply-To: <20261005102152.368-1-yogeshgaur.83@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Sc0emiW10LOT8GHszO0tEQW6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Sc0emiW10LOT8GHszO0tEQW6
Content-Type: multipart/mixed; boundary="------------HU6e0IbntlHeMchE2cZ0MSkV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yogesh Gaur <yogeshgaur.83@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 syzbot+342762971f666337474e@syzkaller.appspotmail.com
Message-ID: <7697abef-5a5b-4b8e-b0e9-7e58c60e6180@suse.com>
Subject: Re: [PATCH] x86/mtrr: allocate the cache map before taking mtrr_mutex
References: <20261005102152.368-1-yogeshgaur.83@gmail.com>
In-Reply-To: <20261005102152.368-1-yogeshgaur.83@gmail.com>

--------------HU6e0IbntlHeMchE2cZ0MSkV
Content-Type: multipart/mixed; boundary="------------immoS3WpaLviTN0G1s2pFJo0"

--------------immoS3WpaLviTN0G1s2pFJo0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjYgMTI6MjEsIFlvZ2VzaCBHYXVyIHdyb3RlOg0KPiBtdHJyX2NvcHlfbWFw
KCkgZG9lcyBhIEdGUF9LRVJORUwgYWxsb2NhdGlvbiB3aXRoIG10cnJfbXV0ZXggaGVsZC4N
Cj4gSXQgcnVucyBvbmNlIGF0IGJvb3QgZnJvbSBtdHJyX2luaXRfZmluYWxpemUoKSwgYnV0
IGxvY2tkZXAga2VlcHMNCj4gdGhlIG10cnJfbXV0ZXggLT4gZnNfcmVjbGFpbSBkZXBlbmRl
bmN5IGl0IHJlY29yZHMgdGhlcmUgZm9yIHRoZQ0KPiBsaWZlIG9mIHRoZSBzeXN0ZW0uIE9u
Y2UgYW5vdGhlciBwYXRoIGdpdmVzIGxvY2tkZXAgdGhlIHJlc3Qgb2YgYQ0KPiBjeWNsZSBi
YWNrIHRvIGEgbG9jayBoZWxkIGFyb3VuZCBtdHJyX211dGV4LCB0aGUgbmV4dCBNVFJSIGlv
Y3RsDQo+IHJlcG9ydHMgYSBjaXJjdWxhciBkZXBlbmRlbmN5LiBzeXpib3QgZm91bmQgdGhp
cyB0aHJvdWdoIG5iZCwgd2hpY2gNCj4gdGFrZXMgY3B1X2hvdHBsdWdfbG9jayAodmlhIHNr
X3NldF9tZW1hbGxvYygpIC0+IHN0YXRpY19rZXlfc2xvd19pbmMoKSkNCj4gdW5kZXIgaXRz
IHR4X2xvY2ssIHdoaWxlIG10cnJfZGVsX3BhZ2UoKSB0YWtlcyBtdHJyX211dGV4IHVuZGVy
DQo+IGNwdV9ob3RwbHVnX2xvY2s6DQo+IA0KPiAgICBXQVJOSU5HOiBwb3NzaWJsZSBjaXJj
dWxhciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0ZWQNCj4gICAgc3l6LjkuNTg0OC8yMTc0
NCBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOg0KPiAgICAgKG10cnJfbXV0ZXgpLCBhdDog
bXRycl9kZWxfcGFnZSBhcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvbXRyci5jOjQwOA0KPiAg
ICBidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoNCj4gICAgIChjcHVfaG90cGx1
Z19sb2NrKSwgYXQ6IG10cnJfZGVsX3BhZ2UgYXJjaC94ODYva2VybmVsL2NwdS9tdHJyL210
cnIuYzo0MDcNCj4gICAgLT4gIzEgKGZzX3JlY2xhaW0pOg0KPiAgICAgICAgICAgZnNfcmVj
bGFpbV9hY3F1aXJlDQo+ICAgICAgICAgICBtaWdodF9hbGxvYw0KPiAgICAgICAgICAgc2xh
Yl9wcmVfYWxsb2NfaG9vaw0KPiAgICAgICAgICAgX19rbWFsbG9jX25vcHJvZg0KPiAgICAg
ICAgICAgbXRycl9jb3B5X21hcCBhcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvZ2VuZXJpYy5j
OjQxMw0KPiAgICAgICAgICAgbXRycl9pbml0X2ZpbmFsaXplIGFyY2gveDg2L2tlcm5lbC9j
cHUvbXRyci9tdHJyLmM6NjE4DQo+ICAgIENoYWluIGV4aXN0cyBvZjoNCj4gICAgICBtdHJy
X211dGV4IC0tPiAmbnNvY2stPnR4X2xvY2sgLS0+IGNwdV9ob3RwbHVnX2xvY2sNCj4gDQo+
IFRoZSBhbGxvY2F0aW9uIGRvZXMgbm90IG5lZWQgdGhlIG11dGV4OyBvbmx5IHB1Ymxpc2hp
bmcgdGhlIG5ldyBtYXANCj4gZG9lcy4gQWxsb2NhdGUgZmlyc3QgYW5kIHRha2UgbXRycl9t
dXRleCBqdXN0IHRvIGNvcHkgdGhlIGJvb3QtdGltZQ0KPiBlbnRyaWVzIGFuZCBzd2l0Y2gg
Y2FjaGVfbWFwIG92ZXIuIE9uIGFsbG9jYXRpb24gZmFpbHVyZSBjYWNoZV9tYXAgaXMNCj4g
bm93IHNldCB0byBOVUxMIGV4cGxpY2l0bHkgcmF0aGVyIHRoYW4gYnkgdGhlIGZhaWxlZCBh
c3NpZ25tZW50LCBzbw0KPiB0aGUgYmVoYXZpb3VyIGlzIHVuY2hhbmdlZCBhbmQgY2FjaGVf
bWFwIHN0aWxsIG5ldmVyIHBvaW50cyBhdCB0aGUNCj4gX19pbml0ZGF0YSBhcnJheSBhZnRl
ciBpbml0Lg0KPiANCj4gRml4ZXM6IDA2MWI5ODRhYWI1OCAoIng4Ni9tdHJyOiBDb25zdHJ1
Y3QgYSBtZW1vcnkgbWFwIHdpdGggY2FjaGUgbW9kZXMiKQ0KPiBSZXBvcnRlZC1ieTogc3l6
Ym90KzM0Mjc2Mjk3MWY2NjYzMzc0NzRlQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20NCj4g
QXNzaXN0ZWQtYnk6IExMTQ0KPiBTaWduZWQtb2ZmLWJ5OiBZb2dlc2ggR2F1ciA8eW9nZXNo
Z2F1ci44M0BnbWFpbC5jb20+DQo+IC0tLQ0KPiBCdWlsdCB3aXRoIFc9MSBvbmx5LiBzeXpi
b3QgaGFzIG5vIHJlcHJvZHVjZXIgZm9yIHRoaXMgcmVwb3J0LCBzbyB0aGUNCj4gZml4IGhh
cyBub3QgYmVlbiBydW50aW1lLXRlc3RlZC4NCj4gDQo+ICAgYXJjaC94ODYva2VybmVsL2Nw
dS9tdHJyL2dlbmVyaWMuYyB8IDEzICsrKysrKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9jcHUvbXRyci9nZW5lcmljLmMgYi9hcmNoL3g4Ni9rZXJuZWwv
Y3B1L210cnIvZ2VuZXJpYy5jDQo+IGluZGV4IDY3Y2Y2OWYyNGIwMC4uNDMwYmM5ZGQ2ZjIw
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvZ2VuZXJpYy5jDQo+
ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvbXRyci9nZW5lcmljLmMNCj4gQEAgLTQwMiwy
MCArNDAyLDI1IEBAIHZvaWQgX19pbml0IG10cnJfYnVpbGRfbWFwKHZvaWQpDQo+ICAgdm9p
ZCBfX2luaXQgbXRycl9jb3B5X21hcCh2b2lkKQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgaW50
IG5ld19zaXplID0gZ2V0X2NhY2hlX21hcF9zaXplKCk7DQo+ICsJc3RydWN0IGNhY2hlX21h
cCAqbmV3X21hcDsNCj4gICANCj4gICAJaWYgKCFtdHJyX3N0YXRlLmVuYWJsZWQgfHwgIW5l
d19zaXplKSB7DQo+ICAgCQljYWNoZV9tYXAgPSBOVUxMOw0KPiAgIAkJcmV0dXJuOw0KPiAg
IAl9DQo+ICAgDQo+ICsJLyogQWxsb2NhdGUgYmVmb3JlIHRha2luZyBtdHJyX211dGV4LCB0
aGUgYWxsb2NhdGlvbiBtYXkgcmVjbGFpbS4gKi8NCj4gKwluZXdfbWFwID0ga3phbGxvY19v
YmpzKCpuZXdfbWFwLCBuZXdfc2l6ZSk7DQo+ICsNCj4gICAJbXV0ZXhfbG9jaygmbXRycl9t
dXRleCk7DQo+ICAgDQo+IC0JY2FjaGVfbWFwID0ga3phbGxvY19vYmpzKCpjYWNoZV9tYXAs
IG5ld19zaXplKTsNCg0KSGF2aW5nIGhlcmU6DQoNCisJY2FjaGVfbWFwID0gbmV3X21hcDsN
Cg0Kd291bGQgYXZvaWQgYWxsIHRoZSBjb2RlIGNodXJuIGJlbG93Lg0KDQo+IC0JaWYgKGNh
Y2hlX21hcCkgew0KPiAtCQltZW1tb3ZlKGNhY2hlX21hcCwgaW5pdF9jYWNoZV9tYXAsDQo+
IC0JCQljYWNoZV9tYXBfbiAqIHNpemVvZigqY2FjaGVfbWFwKSk7DQo+ICsJaWYgKG5ld19t
YXApIHsNCj4gKwkJbWVtbW92ZShuZXdfbWFwLCBpbml0X2NhY2hlX21hcCwNCj4gKwkJCWNh
Y2hlX21hcF9uICogc2l6ZW9mKCpuZXdfbWFwKSk7DQo+ICsJCWNhY2hlX21hcCA9IG5ld19t
YXA7DQo+ICAgCQljYWNoZV9tYXBfc2l6ZSA9IG5ld19zaXplOw0KPiAgIAl9IGVsc2Ugew0K
PiArCQljYWNoZV9tYXAgPSBOVUxMOw0KPiAgIAkJbXRycl9zdGF0ZS5lbmFibGVkID0gMDsN
Cj4gICAJCXByX2VycigiTVRSUnMgZGlzYWJsZWQgZHVlIHRvIGFsbG9jYXRpb24gZmFpbHVy
ZSBmb3IgbG9va3VwIG1hcC5cbiIpOw0KPiAgIAl9DQoNCg0KSnVlcmdlbg0K
--------------immoS3WpaLviTN0G1s2pFJo0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------immoS3WpaLviTN0G1s2pFJo0--

--------------HU6e0IbntlHeMchE2cZ0MSkV--

--------------Sc0emiW10LOT8GHszO0tEQW6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrDl1QFAwAAAAAACgkQsN6d1ii/Ey8A
wQf/Sdg4smrrWeyRKXQzAQJUZIW7DRT4gTZ0OSor4oMbobWKGvzDD3pKY4WXATS+V2woS1wudK/c
xBtuAgk0SjCr8GKCP1VAmL8lePAwh3bMO7qbVs5qhsBwiyW8agroBIC0p4pq9S5j4kCKQSBbQmWY
7QtgegS0UkGYqPcitRqFaBaoCApNm0APOrnBKb4PjB/ozcntGgdXGqTt5b4xnnIABVNzMLBZ1mgy
1JaZU5SQYzdjUWiZY54e2r2KzJ7920HnGI/ztnXG+TF0xgZDxvsaitxSVzZuIIYF0Rou066XTBAG
LGkpNcpQYZHiTAVnl4L5viB7gxYFO8TgKJAl2uc6VQ==
=BwHx
-----END PGP SIGNATURE-----

--------------Sc0emiW10LOT8GHszO0tEQW6--
