Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB54533592
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174141; cv=none; b=AQgP8FL94LUxtcjf4WDcv0WiI7d9Utfvdx0TMAyut0OfAnQD0P6uErRWI05+suUr4aZwqdP3Wucu9qU0/SVmOO+5Ss3fTjZ+BA8ZSCVU7nQfz4lNYC0rCtHrnYAqiatUaYI3EGMRGiIQXSPZbdU5KYCCzkncbHDmkvlLFo2Fmb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174141; c=relaxed/simple;
	bh=NtuLzrdQU/xe5/Mec0QKh47l3lUKt5OWTyb+GrLPoP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQwU8RKBnzqppLVW/BRP3MPvELeGe6yB5SqLBV0rDbTpEFxNtmYRIgbgXpMP667YKjsmBrrBi7icz+MrwptLd+TiAuj63QLhK1t5rCxeaKteZKdC+wxYjf0T/tLeWUHCQv+VrR79wUAo49ldn8A1CR4PfGYtyK8bx0Ro2hW7M/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DllpdnIN; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DllpdnIN"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d6d28aa26cso2630295ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174140; x=1790778940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NtuLzrdQU/xe5/Mec0QKh47l3lUKt5OWTyb+GrLPoP8=;
        b=ZzjLpRNIhHAfQKnoeF9Xmv6eQ0Kb3PVEXVjhWV//wkORH5ax5Be6ozNutOYNmK2Bne
         VYcV/MX4QT+jMnnMs0mtobz3zVvABDuj1L7A7ePz8oiCAptQU3ZbLnwTxi1zIniuqAWM
         fQZz3NFq+rADOv22QG0tK6DG26p38PzwOxnO8cj6U8oHIogb/9gXTiFEN044xLPKEK67
         g9xvtHjtDX0ZlxenPitt71dXDPcVO5BxCTdWf5otr5xbsgeLalBO7BRJVq/Y8GHKGgqs
         oQZZiZXWpduZwv7RUoRjo6GC/9YAOVDL3KoI/m2JTw2T7XsxdMZ3bvGFv2bzeMKv7dDB
         F2KA==
X-Forwarded-Encrypted: i=1; AKwUvBwb50CYjqVBuhc2z2Zs6Y0/m/kopV430eKq7a88g9G1w0oUdwEoqhzFNtkG7fmefTNGwz/Ep37ejcROLi8=@vger.kernel.org
X-Gm-Message-State: AFuF++nLCPut8oo0/U+dEB9CzpVjdp8F6zuzzQ4qvFEbDPEfewAhz1SX
	iaYr1TX4Zs9LFUHS/PnNMqJ5yj+X1l5lUL1ilqav4+dV51OAYyPg5necZdAEDlzOb6Wtrtpk51I
	i2DAzCXAzhp/0J8QpVQi6Qt0EDsyk16H7W1+QXKAPuq2o0WbtSn2dHaVZh+p8QcOjcNgwH9VlWU
	wa+lZc6DjL8wcDmKG2nAcbJ7XlKxbKyy/enc/vZjuZIKUi7ZlFJSIoIGQJ+mA7UZxqxG2FDl9it
	qqJ/ahzjYElCZtL
X-Gm-Gg: AYBFou3xxQKcaXxsrheqNvkqLBO4br4W/i95u9S8KaCpfcVHmOs94OXR+d0XaW2nm5N
	uXd2j5OV0mLVLpQQ9QrCDTxy7kZYZWRyMEMD6wsH2RE0C19n7D8gLIaZCD6VZbJb37IWsM0FVsk
	ZxU7ZlXxHwYZosnvi87opu8Ds4LPHAPdfIHBY/U4TCCfzZ2DMg/itbUujt1jiJr8J7g+qQYQHLE
	3VvbmofCPNoHF1+YH9oxXL7dj+auuKlnrexPu3yvO0Jt1SQXn0aDATa8q96mCWnA+92qkZyN3jP
	KrMcnmOX/Dp4NdPqVY7s9f/GW9fZnTm6gjI2L81jjJdqbNzv6A+wYC/DRohRnhvMc8p6ynTP4r/
	tt8xud9e/ML4TyBaFK1s5OO/G5ZEUJC3xt19Au2HFqA92i7Clkbk7+Um8Bm9fQxO8DbIgwa6yQu
	pZy79bThzyHMogyxR5nqqjyARDjvRJcdgIffU=
X-Received: by 2002:a17:902:db03:b0:2dd:c100:80af with SMTP id d9443c01a7336-2df69e02546mr21266195ad.42.1790174139477;
        Wed, 23 Sep 2026 07:35:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2df6a31d94dsm1517015ad.0.2026.09.23.07.35.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:35:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1461627eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790174138; x=1790778938; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtuLzrdQU/xe5/Mec0QKh47l3lUKt5OWTyb+GrLPoP8=;
        b=DllpdnIN6+o1eHSnMQ9dSSG4+QYCOIFycxNaUOtxqsTa/BrHACAiDWnPavaetk0H2w
         qapIWHXfmoYUOSiHod12KOY9N0FfvIGaU70QatJeFdhU/6T8/7Ccz9turiTqb0dqIAqb
         No4OqZGLUhCk/vJqHLa77vBh7OY5npQfAeEEw=
X-Forwarded-Encrypted: i=1; AKwUvBy6oYnetSSr/QxwAJMI2eXbehz7L2Mx5Cwsem276rXT5ZQC1Ek9tpHLWs7mfsfok4y/cszWcbBo/Mm8g2k=@vger.kernel.org
X-Received: by 2002:a05:7300:7949:b0:328:7033:9b8c with SMTP id 5a478bee46e88-33e8bc73e7cmr2815627eec.6.1790174137607;
        Wed, 23 Sep 2026 07:35:37 -0700 (PDT)
X-Received: by 2002:a05:7300:7949:b0:328:7033:9b8c with SMTP id
 5a478bee46e88-33e8bc73e7cmr2815595eec.6.1790174136915; Wed, 23 Sep 2026
 07:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809132514.421679-1-qwe.aldo@gmail.com> <CAP48HfvqpeMhxJZwzcjXo9akVvV5WU6nN4xVuNaAvX07q2OBEQ@mail.gmail.com>
In-Reply-To: <CAP48HfvqpeMhxJZwzcjXo9akVvV5WU6nN4xVuNaAvX07q2OBEQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 23 Sep 2026 10:35:20 -0400
X-Gm-Features: AclHuK8XCgHKVmYS7QbiG6C9CpOXmkEmvj5URg7eLb8I_-xOpBKy9sAIb_NR_J0
Message-ID: <CABQX2QPxRSLS8xUZyeV4RCLJmvBZRFsJRLgBpL07hTPJ3Hn+PA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: reject SURFACE_DMA commands smaller than body
 + suffix
To: Aldo Ariel <qwe.aldo@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000956774065c276506"

--000000000000956774065c276506
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 8:07=E2=80=AFAM Aldo Ariel <qwe.aldo@gmail.com> wro=
te:
>
> Hi Zack,
>
> Gentle ping on this one -- vmw_cmd_dma() still dereferences the suffix
> without checking that header->size is large enough to contain it.

That's not correct:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f4f1db96bfd68b81053=
693ba53405b6f510ac16c

z

--000000000000956774065c276506
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEID35
3braDRnrFyaSWwFl1kaM+PkUaPnlhcrJVuEuvs9GMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkyMzE0MzUzOFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAK98uepy228BS4S5FhF8e7Bg33rxmSEA47nORbGJ
+YUtbINixgIop7MpYry995Cyjuz18VFLkllRTEe9M3tb+136+43pEAbK6Z8d174I2lub352I1YTN
jR0v+xdQxEy5d2Pd8jbJW4K8vfbj/XvmwJ0qnf4aA1zLKS4eyNfy1L0xwuFoO3FZn7nZC7HFKSYt
4SGyMrQEy2atevfiklWtVoV8U67UnvRiObwQ5QWbGPkpM8nKr4Q0Zf3djo9J7v0D3XdjgFwjec+M
iqguTUj/LrE2UyHmXXk2uWNcQoXWYOhWGV+pvgJGuFjqdi17v1oL4MZ3tr2e4xUO+D9FmwoC4YA=
--000000000000956774065c276506--
