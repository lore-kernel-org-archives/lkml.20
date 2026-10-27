Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136035;
	b=2KkcqpyDCg/zl5ehiDTJvV5kIdaEluzTzTFB146I0h8fZMTWG3INgfuT6Bxcl29N59kn
	 3MI0PwR7sl0rh/xlE2q7457q6rwtVHEfuff1bcri3XOZNemZLxxB+IIjagEaiXanVNJkW
	 03I72efZal1OhX2t0otSwGCVS6kq7CLib7N0N7MAszeBenYWpj0ZrDIjB//Awo5Yy9zjX
	 adL6xeBBnKW3iMUoMndVmbAQRekOoDdnqw5cbw3xc46NYrwVEoUH7B3GTEZRwWNRywoLA
	 +nwPjfdQZ1cmYorYYCLsTKoSG+VaL2kS52RS5psTjOR2VERXXYEDdqFRAinvfccJvvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136035;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=XCYZfDPuMQEKjrf6+5KNKK3eE3TnkkLplBWgbqZuKz8=;
	b=GrqsYtWe7C8ad1zlF7T5/8UECHpxUIErya8dcY0LeFIVfA4LrbEVd4cYHPjQ4qO051IF
	 DC0bywiACFpop86Y5GkWtT4mmt9n9/FZYmHug3G0LVZFhcHEu1RKD1Mmcrm1boGcrMYer
	 eBEVCVYBjb59ZirdcFCl3CXCbF5K2F/ljh0L/K2iYCtcGsowNL8myhAiH3TCihoVJFn4g
	 D0OzHvCsnvpbPyK+JLsZaNKWbXZMskOPTngKqiEt59RsVxMNfLZ27UPoYLSy9krO9RHws
	 OV1nXG6ZlAGlLYTqFagOi7PBZPj46b9qpT/luNTx5v8FbbL7N9oSm24KlyeTWxl7Ffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CPj8Uqp2;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CPj8Uqp2
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so186690a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136034; x=1793740834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCYZfDPuMQEKjrf6+5KNKK3eE3TnkkLplBWgbqZuKz8=;
        b=GaYuyU8GY7BRzbBjachrMgtloD1406mHX4h8cAm8vt1wZDxlbMOekl9X7Uk86J+t/B
         OPYs55LJMEciBXlfQ84WdNnzBkXLm5RU9WQcj4CTNiaM5KJx+Kbj97XERzA6DJWT+ABF
         TlfCgndCqSRD6fasEV2fgWaoPt2U3fonekJRIpoJ7lynt/iDSzoqlooeTa5mjwGsUTDH
         B5OxcejfdWROs9ACIpAFI2U1kIyGi3Yx3dtfdNKIlAcypA6XRVvWDsYt+Gru0vbhbmOC
         UUgXgpS5CQThdBmxneqG7o0l8FoCBQWVaKGeAkdy+vtJhci4va0YgnKwqWtuQxTTgehb
         ZNZA==
X-Forwarded-Encrypted: i=1; AKwUvBwMxM1ka0dBG0OfwIr5nKBWYLWvVXqc1yYw4hcrlvMKAzgWAXpdJAIHT4x5BlmYy9kMwSawYSmEh+vapHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9k9zG2L3wEqQuUpbglHvEp2nBQxwTATiHs9YBY95MTJa8ZVZP
	/uGFKVEEDbBrJnLX6hB9l7obnpo3RWGDgc1DEBvf61WLro0wmEgexlkxsC1Ok9GsKjEEP5q8Z5/
	U9GVbwF8JMNS8IcxHU50iyE+kI5COZf2Vqaz9WCflH49XrXsXqY6NGjiqPA3sKOSa8PwYIAlaCM
	SJZPCczswKr6992nnkkFs/4wl1mVJFsmVCpfD8LSoyo9IUWiT64mKcIOtgn9MWNZoDYsHF8Mu/b
	YT2Aa8Hh+vP6srG
X-Gm-Gg: AYBFou1fVZGbXYiV7EAibSHkH4A12xrB54GNEqXFqymVv/DNOcIK4djFK0iy+U3+7SV
	XBBzTfSpF/r4j3eESiw4GSEXjUUuWCwEOhCoOj2H9K4xmZtKLwzDhGwDxDYiEF4m34KrnQs8G23
	1XaBIvRUF36oe7T1MjW+WcyN8MMo5lzNZoK0R8mbAEYxxsPECXSvthjDxn/7AK8gzfoCxWy7Mgx
	YFJdcwJvzvBIwMoJ4s67dyf9UqLrC98RKXnHuxpR/r4unfHO+dV26LVAgCsz4c+deJIwFaCObj6
	OwKGF1RL277bv0eVjP4hwe22Tmn+CLQwvqfv+OrfhUjEu6ZudvZeXjdlBAYilvHrT6NIslsVf5j
	rFXNVpgXgGC4v1rX2U23M+J4yNvMxKggAleOOPjNbWcjSAXvDQPtmRO+27Ywx8w7WrhOBLEePO2
	clcZw4RqY5MHZJKG3MsMuA8go5VTpU3BxX
X-Received: by 2002:a17:90b:510f:b0:3ac:adce:60b5 with SMTP id 98e67ed59e1d1-3ae580ae38emr206498a91.14.1793136034063;
        Tue, 27 Oct 2026 14:20:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5a281410sm17828a91.1.2026.10.27.14.20.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 14:20:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5bfc3cc4754so165268e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793136032; x=1793740832; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCYZfDPuMQEKjrf6+5KNKK3eE3TnkkLplBWgbqZuKz8=;
        b=CPj8Uqp2xe02AvN2LPOLbbquJflFwzdlMRE+WoGPNDp5uT7uU0dZeOgbbqNLTu972T
         k+HbFMBvCrLPBKJ41pGzBg3mLdUvdviczdVZ544UFp8ZBMOikC0HNsbh51DE6Ihicf+F
         r6EvnvzFL6GZWVmwsSS3VembVE6h8C5Hsa83I=
X-Forwarded-Encrypted: i=1; AKwUvByzdO1/Wb+VRHqbQZ+k1C34JejUbfJIVP+qA6sOCEcKfWsPS4YbWMCBbkzI/vg0lBhnEcxkR/pOtKJPU6o=@vger.kernel.org
X-Received: by 2002:a05:6512:33cb:b0:5bf:ba43:f2f1 with SMTP id 2adb3069b0e04-5bfcad8c081mr199956e87.34.1793136031865;
        Tue, 27 Oct 2026 14:20:31 -0700 (PDT)
X-Received: by 2002:a05:6512:33cb:b0:5bf:ba43:f2f1 with SMTP id
 2adb3069b0e04-5bfcad8c081mr199943e87.34.1793136031423; Tue, 27 Oct 2026
 14:20:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <e84774ae-b49d-4df5-923d-ae2cde480aaf@broadcom.com>
 <20261023090121.5031-1-fausten@ebizmis.com> <DMCM449DWDHV.1U5UYOS65HWUW@broadcom.com>
 <CAO6tsQgWAn8LLJvYfY34Es43oNk=qrZBE4Do6xcHpYyivPJzDQ@mail.gmail.com>
In-Reply-To: <CAO6tsQgWAn8LLJvYfY34Es43oNk=qrZBE4Do6xcHpYyivPJzDQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 27 Oct 2026 17:20:17 -0400
X-Gm-Features: AclHuK8adWorJLhZatp9pta1o3VxE6SFdWvchjgAgO6xXAM5cH9rG4BsVroyUX0
Message-ID: <CABQX2QPnYyOP=Lns2ELd=GoO7J1qK7gn+GHLoEKEQvmC6EJYtA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION
 as unset
To: Li Yunfeng <yunfeng.li.nb@gmail.com>
Cc: "Maaz Mombasawala <maaz.mombasawala@broadcom.com>" <maaz.mombasawala@broadcom.com>, dri-devel@lists.freedesktop.org, 
	bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003b30d5065ed90429"

--0000000000003b30d5065ed90429
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 9:46=E2=80=AFAM Li Yunfeng <yunfeng.li.nb@gmail.com=
> wrote:
> On Sat, Oct 24, 2026 at 7:37=E2=80=AFAM Maaz Mombasawala <maaz.mombasawal=
a@broadcom.com> <maaz.mombasawala@broadcom.com> wrote:
>>
>> Hi fausten,
>>
>> Sorry for not following up on this patch, I did not get time to do so.
>> Will get back to it shortly.
>>
>> --
>> Maaz Mombasawala <maaz.mombasawala@broadcom.com>
>>
>
>  Hi Maaz,
> No worries, thanks for the update.

Thank you for the patch. I was looking at various cursor issues and
I've fixed this particular bug differently. If you have a minute I'd
appreciate it if you could try the series I sent out a few minutes ago
(you were cc'ed on it) to make sure everything works with it.

z

--0000000000003b30d5065ed90429
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIOAJ
ixuufw9GEgetdZfhGk2vp2na45hi/ZzP+LSW+uKpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAyNzIxMjAzMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAC2kXAmO3SfPJhn0LaLHEs9sKhqa03vPpDiqGFcI
+TW9ImgI4Yp0kmYOlrCRW9GDUb3KBD/wofi5RT6MvOoAKXwN41i6edno8JeD+MwFc+8EpIBAUbvE
MSKHT3V/17+1BYGCA2xGloaq0IR6Ivpw2TfWUSgyGNK68j16wgHo/QwstSigETSk1zoUXxHoBHVd
ZNhB6kEO5UEsllkw5S2kuKbJtfjoOJ8k0lx0XobmQL5GMySnPQQPq+54UtRiqTWX82jbDPvfUGHi
ZYm3NIqBgbndjD2IEu1Dzyqg260yM/I29NYh4qACVM2ajuJCS44d+cwHYxmH0QKTU9qbMLmFHSQ=
--0000000000003b30d5065ed90429--
