Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466933;
	b=0VYSAJM39Knb/ET9bJxeb1O1FVbohj04sDwEjYgYUMhAo9fBFrtvOQwGyI7W+sTXJoVO
	 u9n9Ifi7APUYpGmTgtFWHExOS0az/FDa2z2EBbm90E0eFxS7x01QmwC4eYbfPZd5gAf39
	 ZvdpAjA8RqVqlq0k90RgM7ZrCrgacMSu7KWR1aV5NCvciIhEISTU7i4741xNkZxpLqUXz
	 HXVq8333S5cIx+MesGYi5vLHy2TI5grvUsykVWQZZCL1O0ujXIULnvOuBLsO8dJlCc3Sb
	 7PtMjtJf4RPbxmSkPR95TQ4/+iznoPsGoh3O9Muy1msTf0te/A8jjR2Bii9kHlDn1ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=/4MtBLSGAeSlREMeMpXOJglcbVkwCt0++4H9V4EMMVM=;
	b=Kcz9XslqXecRF5SIHpzMn1DsdHKQeqNj0em+uY/46G+ZyyCOTdhE1oVBiEYZz+Lzvr3D
	 dZYPzkHB8bgXT/3Jl89fkk+dCPCysGG0LYOV6Zg52nF4XfKRGwM9lG9xMfxGOaKKp6YLo
	 ncu3oWBuCeRtMw0JngS6mLiDKQ2jP4+viBXNQsAngsv+67CJEfFlSjSy4O2Wzz2KSQegA
	 wHOnWI29Jxcksg0mJXVN5+9821Em2oYw2nUxmbrUNbWcTc7g/J5vA2wdWbERSsa0j4tIV
	 9+gFzGcKoXozBUwJKViD/12LQapuOThCfqURyOydl3uVvTZbjbKgp6CCxc+CWdTd0gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bjvcdfpw;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A05606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bjvcdfpw
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so598374a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794466931; x=1795071731; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/4MtBLSGAeSlREMeMpXOJglcbVkwCt0++4H9V4EMMVM=;
        b=BjvcdfpwCSBKwnvk9dCuZdO5bKIE7LwAVDFAJ/gmxSf74WWDcshOCc4hWUyXyWXXUr
         4sZTuk4jlequbSGaosO1Aa9C45fjTvXFUCFwQ/9zmPG8TnCwSWyOtFW1WxdYViy06yTc
         HyFX1dQtACLjFDtpRnNOcP/J81n1jrZC0X6gNuRiOoKvRw3BaT3Wwd6O03XwNbf5Ueuw
         PEtIxT25lUKN7ekbFyaixdV6RqZwO4LjKFYjA5f4dlm2xzjsWBm8x1RzGDJxAAkgyreV
         /vcr+SLLhddZFEgHZqgHxdSZH+baDtgbno3TWD21Uj+EIETHVKbPhaDJZ4K6/jVbpari
         RNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466931; x=1795071731;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4MtBLSGAeSlREMeMpXOJglcbVkwCt0++4H9V4EMMVM=;
        b=nLdScFwDkv3UyG0ks1SMyDcH9AcxA1MYs5K/Ava34wmDXLUlhFK+LO9xlw8q89PO0w
         yKUvLOF+16S+7GewbvKlZTSTUPPjZZTkPhkIyhdYEgjQKoUUPm1DfzCmIMts2NNUDuT5
         Y7sYfP6hbGo/4w2WZTBzrFYlh7zN+hnX3p2ABzdKgoO17z4SYUPst0idj5/rEC9eQ5GK
         ulGk6Wx1/u4Un3vlt4BrAHZB6DCELKRHzqs42HYphaQGWENmcHEeFn/3OEXigO5fCErc
         9G7fysEt6qHlretfVhH0TOjynLhEO5QzUzbbhUzU95c3DDQ/h9BuK5iabvPIV+UhaMnV
         MO9w==
X-Forwarded-Encrypted: i=1; AL+hErH4ZOuc+f050a6QO7n0rsK1GjjjER5BwjWXpupbhyBDng3RG+1qk04m3ZYA+Bjwt2to6cf5za2Pf/rCTmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e4k9qCTka+EGGbNYMBDUiWZjihFuRTT58dx4oAofdkTwytljC
	Hoxqozv9z1g736Q8tisILY0LeXQX5N5/MyKnuyWq53X6T2dgnxRU3MCcVbJtzD46kRc=
X-Gm-Gg: AYBFou3MDhBGGDc+LSEhiEJB5+uXwkx6i7xI+S0ZMAsDm6edY7ECDo+kth4mL3/cli/
	pvQ58luobarE+yCyJaqdlnui6u9s7Oe9/EW6bVU7psLq+fnPkVZxogtL76cL1mV98MrifLiI4g3
	PihIDAS/mpWes7Qtnt9v0dUlmxVtXjuMnCAZvV0qLEFKTauvc+091jQSQXATZcHNAFO1yIraGO9
	hR4tg1ogU/16jV8nTRt+VUkWWbSW8vAzkXSHU5GcPk0fh2F+iE7q6cp7HWtA2VsZROpVly0nnFW
	jW0+LD6yXgmC9P/IJU9cb129NZGnH25p04/+IUzdDYrGKyrXQgaZ0dBxVMy71WQDCMhtSFzxWB1
	z7whcLH4AUPsLXs5QIJmEkdJ7JtLO3YorS6iEzMFVERdJGnIUYGasXMFI0gi5IlvuMiHXGjsHZR
	7hOtaEIKTMB4ewMO6eYbtX3zdzsPYaXixMH2rAfeG5rZoWYWkVs8sR+82QDR5mxOOBDTXypBVKO
	qE9dSPZ29V3DLegIQ3h/LMDr9io36nhF++8gi/lLWrUfCOvU3rblu1qA7m/qOUHaGAKU51BOkd7
	BycITxpYrM346ZCQuOgfp5qDvQJnMxVuapD3TTfnLekawcbWw8cDC2iq7BoOfGQHE1Cmq7ANJJS
	fz50dZsQTGnOek3tUqcIGmhJFfsREkTf4wbfaPo1qbs9Yw3EwpBUgHnUrm0v5duRrGTG3vLsM
X-Received: by 2002:a05:6402:1e94:b0:6b5:61fe:982a with SMTP id 4fb4d7f45d1cf-6b777824953mr3292179a12.45.1794466916038;
        Wed, 11 Nov 2026 23:01:56 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7ada54c88sm112091a12.2.2026.11.11.23.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:01:54 -0800 (PST)
Message-ID: <3a052d2c-8d14-4cb1-b6fd-277a6b0c8196@suse.com>
Date: Thu, 12 Nov 2026 08:01:53 +0100
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
Subject: Re: [PATCH 0/3] xen-blkback: do some I/O statistics rework
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20261111162058.804033-1-jgross@suse.com>
 <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
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
In-Reply-To: <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XnKNkkfJknfgjGY9Ag00BvNt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XnKNkkfJknfgjGY9Ag00BvNt
Content-Type: multipart/mixed; boundary="------------znQNYWv2cH6gyTbCeqXfd0fm";
 protected-headers="v1"; hp="clear"
Message-ID: <3a052d2c-8d14-4cb1-b6fd-277a6b0c8196@suse.com>
Date: Thu, 12 Nov 2026 08:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen-blkback: do some I/O statistics rework
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20261111162058.804033-1-jgross@suse.com>
 <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
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
In-Reply-To: <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>

--------------znQNYWv2cH6gyTbCeqXfd0fm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTEuMjYgMDc6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMS4yMDI2
IDE3OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gU29tZSByZXdvcmsgb2YgdGhlIGJs
a2JhY2sgc3RhdGljcyBkYXRhIGhhbmRsaW5nLg0KPj4NCj4+IEp1ZXJnZW4gR3Jvc3MgKDMp
Og0KPj4gICAgeGVuLWJsa2JhY2s6IFJlbW92ZSBzdGF0aXN0aWNzIGxvZ2dpbmcgb24gY29u
c29sZQ0KPj4gICAgeGVuLWJsa2JhY2s6IG1vdmUgc3RhdGlzdGljcyBkYXRhIGludG8gc3Vi
LXN0cnVjdHVyZQ0KPj4gICAgeGVuLWJsa2JhY2s6IG1ha2Ugc3RhdGlzdGljcyBkYXRhIHBl
cnNpc3RlbnQgYWNyb3NzIGRpc2Nvbm5lY3QvY29ubmVjdA0KPiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4gSW4gdGhlIGxh
c3QgcGF0Y2ggYSBicmllZiBjb21tZW50IG9uIHRoZSBnbG9iYWwgc3RhdHMgaW5zdGFuY2Ug
bWF5IGJlDQo+IHdvcnRoLCB0byBpbmRpY2F0ZSBpdCdzIGd1YXJkZWQgYnkgdGhlIHJpbmdz
IGxvY2suDQo+IA0KPiBBbHNvLCBkbyBJIG1heWJlIGdldCBhIFJlcG9ydGVkLWJ5OiBvbiB0
aGUgbGFzdCBwYXRjaD8NClllcyB0byBib3RoLiA6LSkNCg0KDQpKdWVyZ2VuDQo=

--------------znQNYWv2cH6gyTbCeqXfd0fm--

--------------XnKNkkfJknfgjGY9Ag00BvNt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr1ZGEFAwAAAAAACgkQsN6d1ii/Ey+j
5Qf/VkOKnOQT0F4EOFuBzac7B3dirk00TyTViv89zfyTCzNWvQ1NhWRd612k2Xgs3lS/oMFgAlZt
8xcOpUaNnM+ubudMuiHRsf94cKCdh2EubF04ANK9kn012eDseJjkCweKmxjVDDoPM/A1BVSwq5yQ
aTE8k+xGcOzKNYrGHwaFiC1C/jsIcw4DN+CCV/vPDL0iIkhFP0qWbOE8d7kQ0czpFzwJBXAI6LBQ
r/PKwaH/JwSwwW28ipAGIYNwTdlJWfsu18dP/C3j/A4UOiFGDFTWlFq31EaSvZkKmMSl+tQ2LHse
EX30z7qV/A7ZAEiQet8JXCQ9qtLsznVIwO+Q8Zn1JQ==
=hvYA
-----END PGP SIGNATURE-----

--------------XnKNkkfJknfgjGY9Ag00BvNt--
