Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C586480357
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286579; cv=pass; b=NlR3N6hkwy6wMEpniAhF785z6DGTwrfG2fxMBGBqWTbhkdN1d3Jcb0FX5iZZ8Sp1JDABE4zWeDV9BWUPEFFBdlTAjMTZdoAnW2TFix2G2cdsPgH8iO1kdrhbi7xlDMHP/iAWKs70fS0O2aEHCqbhfNfE6xg6h1DVk3e697gFNu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286579; c=relaxed/simple;
	bh=EYwriSULvYePD3iJ2T4Pa8I2fYA+Ygahe3VBHSaLFG8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0iwUL9B3c4qww2QABzdRVT5b+DoKmMHN5hYOrT/IsmC4CqxTAWVUx+VVAYNedaDyaIzT3CvLAkBKOT1e4bi36CpLR2xs1rHGE+Pgyi7X5G4Ph2dzfptsZ241wys1wF7ZpamPdwbNzZuz+0LN+C/Jf4WgdjjMIChjvuT2W0VhcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4R9qFfc; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4R9qFfc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so40078466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286575; cv=none;
        d=google.com; s=arc-20260327;
        b=fIG053Ka7qrYJihtK1GGe33HkjwKNbnu95woFNIxjRUVhUuXbFWt2OX/+3JWNwWGr1
         7SljgMm65wP5A4LAE+2NG6y7AF+zKsmTflK8AyGTlsyzLF/l3UPaANQLjr8DpxhvJXgy
         VtHRf6SUVc4YtLn3wrBqwsdFJeHpiiWEruoYO3LI6p6kPeldNGvtLpjvdARj/EUr24Zt
         om+drn5YclhulqZZs6qxgMbh477vcpv/1v7ehtyccOwC4ZwRqHsVhoPHOpLcQ33sywGB
         tqJ9ji6HU8Bj+9gUI4kZxh4dxZrLK0kKwA4Ew/oNU22NztLygowW+vL5/35aWXAFI9eR
         Mtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=IlXhqmO4UQN1t5S6AwF3HMJwBfhvJfo1PV6ZXzxULoI=;
        fh=OL/ZFWLSLJi4+SuG0nsKD8EmFSwe1xtasfGSwhQRUxU=;
        b=ocoMckTRNdpGWZowFkdZqrDHgLGnuQ3886Ga8JJ/KUslG5XCkYTlFyHvvtseUBWzIS
         Rv5kaQPKu+GHPurKuvAizAvQslepbig4SnPvmBSy7cY5MUITpyGW25iNPtXn9rUtfaZ7
         OvimCpW9ppvSLl29qWEAqOdZ5nLsoH9e18sj6A66eyvIPseU5FF39Np9gObtriL6D3yQ
         ZfU2AgICxM4um/K4m8FrWz/L1J/2lddE6EBrIzFOeRbXDKx+zInXdRs/vgrlVW5OAsgJ
         VSwIFhwUrFDkME2PNvrmIX+4DbGU/qsOnkdjRtWXBJdZatW8nSdC9LfubtwkFcNHpcju
         q1lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286575; x=1790891375; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlXhqmO4UQN1t5S6AwF3HMJwBfhvJfo1PV6ZXzxULoI=;
        b=r4R9qFfcwXWDXMw2frbD61TNqnMSExox+VkYBMY40DJCxA2qh2sWTgzymsK/XOdeaQ
         phYCiyj43hC4NKG3ve6x0xM9aH1D4JRZAtzuSYn9cQpXvgKluPSsG34mtzLym1rN+o6S
         VkiTKdSD0JvuFZZotChNO9Fi/VAJBBQKJm3dL0s2IyApn3mkwGzsmW3kVGA0AfIgAarO
         oJRBC1XFaEgt8pvC7yxQnvmthYx9yDQIEq70EubAAGkl95832m/aJPDQNje+qPw4ms1/
         1yR4PU7Ga0g5woa614Uren5Gny10kHM+atrUzS7NyDVUjgvjOcjFmLmSI3+JfAFpegvD
         3CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286575; x=1790891375;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlXhqmO4UQN1t5S6AwF3HMJwBfhvJfo1PV6ZXzxULoI=;
        b=dHmhtxx8loG2hNk1YVf1yoa6/8XzO9yKg8+TE39VeYn6APLEoYX/dXrm1R8GXj598b
         O4K5TdDpQ1mfsf48JL05QlUZWvzTK5UMX9MPpYqc7SoEjOj3o1mj7b+E52b0siQs1NTV
         IC8ur7k5R8D/OYEADDqvs/FrEvWrPzOterqA9d1rra4TEWgnTr+dzJJQUA3iZ5AmVPOV
         bqpcORUBya4qSsTLGYvfamsyXL2V2zvq9A8D1OKfDCtP2waaH3YZTt+MI2ilMcwOAGw2
         LAtQ2OKtzltQmPQoCYIW+hQ6Opkqzxcu9EoF7M+aqiKAXJzL1dNAqzKo+Ht6frJ0Bw8H
         l5ig==
X-Forwarded-Encrypted: i=1; AKwUvByDPApbK0LF+JeX4p8bfN47BsiYRwlkTRiq72tVVGhaVLkV6at1qp2eeZdJrL4tT2rcU1G3DpnZu9mLwO0=@vger.kernel.org
X-Gm-Message-State: AFuF++khN+jnrNRE80Jv3fovEQkqQFdrDpNgimxl40v9xXt+4mHSM50A
	Nd1x8Z0GDHGAVn778nOcabBe5rwD0mjX+I9X+7+TCXGwypCOFBjEE8t6tfAyPXavkt72jfVyLCt
	zlSlV58QSa1nkQtg0pEeyX6kyBdowFQ==
X-Gm-Gg: AYBFou2XTefi5iSMmf/vzXrfGVQbjCBUZPqscGaRabow4LSjo9foVqBH3X3QTyUSSYz
	yJN388YNrbZaF+FjYGZtaw7BClWJiRWvJhihuaksps0vVsn2Hz8pGRb0mdimF9u0BcoPJT257YN
	4EdyZDt2GuKHA2wC7Zc6nEWcn0hZ/jXsu4rIt9ZTFxZ4kzSsj+Ma49THjsVz3S46LnxQX2LreXI
	ZdWYM1FL5WxfniFhLqu/qkFM6S1MiQRL7ivaEoeuQkZ1y7eHeZmcz6vlCftbqAmADwKX7QCQ7Ur
	VYol43srY9r/xiHl4ONmGuaLu5wimDoOu0NrIMFYTOESSLuKatifxJs+hq1xCcLrnQHJUaTLnDo
	QCxJXmkdFdLt81YjrL22KykTNanXazd2fB0Ja0pgIH3DsbydQxLdZqzXrbJxtg3yo
X-Received: by 2002:a17:907:c71b:b0:c26:1691:b371 with SMTP id
 a640c23a62f3a-c2ac2538398mr364279966b.42.1790286574820; Thu, 24 Sep 2026
 14:49:34 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:33 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
References: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 16:49:33 -0500
X-Gm-Features: AclHuK8YiU9a_Ru4QSeqUTrJVzzT1FhyKaFMooPwpYN9sMpvSeDBkg2s-WQ3MVQ
Message-ID: <CAGEsz8GqYcGK8zaos_PTeto0de4+9nkyqo_815gjac3CNSOo_g@mail.gmail.com>
Subject: [PATCH v2 2/2] media: amphion: prevent unbind while video instances
 are open
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

An open video instance holds a plain pointer to its devm-allocated core.
Unbinding the core or its parent through sysfs can release that memory
while the instance remains open. A later ioctl or close then uses the
stale pointer.

The video file operations pin the module, but sysfs unbind bypasses that
protection. Suppress manual bind and unbind for both platform drivers,
and warn if core removal ever encounters a live instance.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 3 +++
 drivers/media/platform/amphion/vpu_drv.c  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index a0c58ec97a42..2e8e08e05de7 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -696,6 +696,8 @@ static void vpu_core_remove(struct platform_device *pdev)
 	struct vpu_core *core = platform_get_drvdata(pdev);
 	int ret;

+	WARN_ON(!list_empty(&core->instances));
+
 	vpu_core_remove_dbgfs_file(core);
 	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
@@ -846,6 +848,7 @@ static struct platform_driver amphion_vpu_core_driver = {
 	.remove = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_core_dt_match,
 		.pm = &vpu_core_pm_ops,
 	},
diff --git a/drivers/media/platform/amphion/vpu_drv.c
b/drivers/media/platform/amphion/vpu_drv.c
index 2cca61f41bea..9c6f32c5eae9 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -205,6 +205,7 @@ static struct platform_driver amphion_vpu_driver = {
 	.remove = vpu_remove,
 	.driver = {
 		.name = "amphion-vpu",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_dt_match,
 	},
 };
-- 
2.53.0



On Thu, 24 Sep 2026 14:49:08 -0700, Myeonghun Pak <mhun512@gmail.com> wrote:
> vpu_core_unregister() releases the message FIFO buffer and VPU reference
> before draining queued message work. An open video instance can also keep
> a pointer to devm-allocated core state while sysfs unbind removes the core
> or its parent.
>
> The first patch drains message work before releasing core state. The
> second prevents manual unbind on both platform drivers and warns if core
> removal encounters a live instance.
>
> Changes in v2:
> - Move vpu_core_put_vpu() after the work drain.
> - Keep runtime PM and mailbox teardown unchanged.
> - Address sysfs unbind in a separate patch.
>
> Myeonghun Pak (2):
>   media: amphion: drain message work before releasing core state
>   media: amphion: prevent unbind while video instances are open
>
>  drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
>  drivers/media/platform/amphion/vpu_drv.c  |  1 +
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> --
> 2.53.0
