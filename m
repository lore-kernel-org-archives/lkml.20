Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793119866;
	b=4c5NKfCrP1czzB3buwXMn1X1JN90HbuVyCCjgg8aJ9e4kDDjiceya9D5SJAkyp1hpe4s
	 YZwx2HYSIfcWwzEfurZPmMhmMYXfOjBSbXr76wYBFuGPPxW3w5Y/JdgmJ0VMksJ3tRICx
	 8hTvGcOZqW+DPlJYU7qqiEkaKVZBi0iXtmx2Hwprd8oCt6iMVgk4kgjZTz1w73ys8rX5V
	 q2BACsA253mkMJBr5/1esvTDCwc0QPGygw5jIw0qXNu4eP+Dq8+PaOScMP5IS6pAkUa1x
	 UlQ9XU4YHHPXjpT315e4BkPQXTVGRlJJ31DY2QuUwbSDJp0a5oiDDE95iPJm2Bb9xYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
	b=A5rWeiyScUUFAk3IxihfFsj1CBeMZyB1y0n3MfN/gle2m9HUsIBEVINu9LlPd9BNrUs+
	 5pypanfL9zIi8JGuVw/ZHYGeOi4F+dpqQdPIpMucPdgNMd8Lc5r2GYJuNBcc/TgWIYC7r
	 jfkQKbCfVqhpaFz2jb2rBs2Um4m7t3mDRf6ZWHpJEIt4eZ6vBq1QOfTUCntoG60dp3Sm8
	 O8kaiC70L4dz1GDyf32hHmBlt/YToUR08z6rPm/ufKOINVaQQRbk8UY6iFAEGk6k7s2iX
	 KtG/e1BdnsFf1fKUM5Mud3NeU42BSjpS0lyb4d64HahnAjtAG2RZ6BjVDpe9zIqWuZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=f2AcRrWv;
	arc=fail smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2ABC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=f2AcRrWv
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48e94879f02so53946fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119865; cv=none;
        d=google.com; s=arc-20260327;
        b=qWfP84kzLWtik15IwyMeYl3j0SEBcisCVdVvcjur0YnpEM0RPDJ5E+Du8/nu23V8iE
         IOrfAt+OFLBBhLx9MOvuMLxyGh77UdYaCHokRG7ITd8+w9v9xDZIZV/d6cOEEtwJEHDE
         nOLZ4x+oZkqJ2pP+Qdp36qaAgfduI90y7ym52cgNB5I3UE5esLMlWxwUIu3yRV2EJURm
         u08sLt4qJ4D23FA/5MK4sx8AOlS1+31QmTntk0LWzgKXbox50dLPCTgoQ+5IGGFMxBBl
         c7p66dopc5O580yddufRXY4JKJErWGj0VEnwE5ZHi/wuToL5mQF90rD7tmzLpvZ5JbxO
         +9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
        fh=6fMzLahO9jMP23/xKvz9EjF7Lvzd7nJzXyjixiMbjZs=;
        b=jD6lSdTwXBhY5nY/glQmgaqfvYu8V7bGxjalQ7K3EV+myf/SVFHGqc0ygA+8j0SHVJ
         63PaUmy9L0suY5K1WD1Srt/oBsZETruLjg5OlJrWvDyns1J3uQKdcrcTLrvTbALGEEzc
         DekRcglCtGr+sChMaiDUN0exh4RktaAC8dnZWPVN2IE8+Xa16nqy/qVg5dGcvhNKSKsg
         HyiBV6uHYcTHc6KhNDhulNa4LaFcVdKRPkoYzIQIWw2G5IU8u5sFkVBOBr1jumDZ8nc9
         DCqbq+THstj+0p5JAWbatgqMKnHU5OfEReky7fSH2qeCeUEdRfImowaBCWDk3kpNrCIG
         1Bcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793119865; x=1793724665; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
        b=f2AcRrWv5oi1ivQNNe9pviZGHpfiK1uiUFT8pQSXULYzdF+YGe/NCMqF+VONT4YcMy
         USUN9cHI8CB25BG4MuVk9Uo+sUb5OqCFcD+CwWgJorVgGmS41UzAfoMStWXY2Mw0ved+
         YtxBLBoUx3LFFlM5gBvrjrGIFDDRp9GncBafYJPjQ5ySeLnXd8n9GtT16YFUqEcm4R5m
         tToxLd3MkjgAnM+DdQWCi9UkKuuGdGK9WkIWxE9cy9LuB8WtAC/q/QssIgtrXvskHXT8
         MbFY3h/OXGffCL1rDyKIQbbd2cB+SdtloBYfaQEjvYEf2UHUEs4IqjYERIFuVvj3RJB+
         svpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119865; x=1793724665;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
        b=TUwtIbrCnf+s1MTixGHzbhdEH6PRIylho8nFMidqm4iyfqVEfM2prH+yLwvlWtsHxC
         XRq7nVBUfEblxBlDrMNn9AWiQ1Naa50YLR4ZviXFQVPSQn1DZU74tzXszIoeuHx8r6eD
         zNkjp90GwuJyUf3u0+tOFWwqmsH6+i4EFwDj2dyODHi2PXm1nTgTfZ/xCoT+3LVcopBk
         gv4j8vWUP7gUlTBnNjR1CtNQAW9YA5qE86HDXF7dkWPqk4t4/nV1RBBpRthry7tK/woQ
         w/Pk6cILpavaaXtHTG25ijg6/gJ3EcIxQwAOe/tFoxWXcCua2h+qFwRrRmBsfogYZ9Sj
         Mahw==
X-Forwarded-Encrypted: i=1; AKwUvBycZPUok+3jUBSjdWecp6uY5fJRjp0cTdcXcZ+tw8wkVlyRChKIgSSNciTW3g/DJLEd9vLCPh7ppSN+5/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDxyu/lnYod+iaRZLPBqzrUZEbsqitb2OZhvi67oAGKr5j5/5y
	mr5cD42BWkZ20mnnoK/1ub37HJnYhBGyXAALxaskzg1a4c8wJsHdxxK0/YtZ//QLHOFEm14ckrS
	rP5hrlGUfkAxqWYcnWfcTOny7C1f7gz+zF/TGvoHbHw==
X-Gm-Gg: AYBFou23bO6yX5LAi7eAwHeIi5LUNYlVC1b7W6+VszwfZ2gz4OLFWUC3Wox2JNJ4D3G
	DTb8BQYNC/G5iTuKj1UlzSkOaC3qoYcftnXtYC1BH965wM+dSmxvf67tOntqm3QLr/drhOeXbRX
	APjmmrQ9h7jaxFFYqCKTnD3APqNL4ryXi7mAnAmywbXw4hmF3bVcx7C5GLDCLt5NAHYzROP+FjQ
	TJOYscnPK6K70k84n1xm0ygQlkEzY70EcdCJQ6a8DvyHYuUHHKPtVwpKOCdGlxXgvz3vckbdgzF
	qWxEloCWE7X7/vXncLMJcxuUhiDBZhB7JYfGgxNhyneXFg074QQQv7dQ+6cHDUfbn+DyLwKS/od
	CU8hcdUrw7xV15Kl5k+s8PHIRgzSPUGWpsJxj4wp0sgd+N6I9lNXaIavC0T+unmVQ5OsffRGuO6
	8xCs/P64bO0KS3CQi0l1v+z6YnMYMd7KoQd9H+BQVdvFOYoazFM289qQ==
X-Received: by 2002:a05:6870:d889:b0:46a:c217:c56d with SMTP id
 586e51a60fabf-4a8bb1737f0mr98260fac.2.1793119864501; Tue, 27 Oct 2026
 09:51:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-2-antoine.pichot@gmail.com> <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
In-Reply-To: <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 27 Oct 2026 16:50:48 +0000
X-Gm-Features: AclHuK-6apCrsSW-JKKLxfQ64Ax9KsC9jd8-Haw-R9qIe3JqmapOTsN1wSNV7Ks
Message-ID: <CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com>
Subject: Re: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
To: "D. Manresa" <dmanresa@gmail.com>
Cc: antoine.pichot@gmail.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, djrscally@gmail.com, 
	dan.scally@ideasonboard.com, hansg@kernel.org, 
	andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine and D. Manresa

On Tue, 27 Oct 2026 at 10:27, D. Manresa <dmanresa@gmail.com> wrote:
>
> On Mon, Oct 26, 2026 at 08:10:26PM +0900, Antoine Pichot wrote:
> > Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
> > 319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
> > and the pixel rate and PLL registers are off the same way.

I'll agree that the link frequency isn't abided by, and your patch
does fix that. However testing on a DT based system (Raspberry Pi)
with a 24MHz extclk I'm also seeing issues.

I'm working with the datasheet from
https://static6.arrow.com/aropdfconversion/dedba0a4f2b52e9b6587341a0e31cd115a2c3a46/ov7750_ov7251_csp3_rev1f_ds_2.12.pdf

As I read it, the pixelrate is configured via PLL2. Those settings are
identical between the 2 link frequencies, so the pixel rate should be
48000000 in both cases. Without that I was getting 75fps from
libcamera when I asked for 100fps. 100 * 480 / 638.4 = 75.1fps.
The settings for PLL2 with a 24MHz extclk exactly follow the sample
PLL configuration in table 2.10 of the datasheet. For 24MHz the
multiplier is 0x28 / 40dec vs 0x32 / 50dec for 19.2MHz, resulting in
the same rate.

The settings for PLL1 seem to be all over the shop if the datasheet is correct.

With a 24MHz extclk and measuring with an oscilloscope, the "240MHz
link freq" actually runs at 400MHz. The "319.2MHz link frequency" runs
at 454MHz.
If I follow the datasheet, then the 240MHz mode does fall out at 400MHz
For the 319.2MHz mode I reckon that the VCO is well out of spec -
2.128GHz when the limit is 800MHz.

The numbers for the 19.2MHz modes look sane in their ratios, but I
can't test them.
The 240MHz link freq does a prediv of 3, multiply by 75, and divider
of 1, which keeps things in range, and 19.2 / 3 * 75 / 1 = 480MPix/s,
or 240MHz.
The 319.2MHz link frequency uses a prediv of 1 and multiply by 0x85 /
133 gives a VCO frequency of 2.55GHz, when again the limit is 800MHz.
That then gets divided by 4 afterwards for a supposed result of
638.4MPix/s or 319.2MHz.

@D. Manresa it'd be worth trying using a prediv instead of (post)div:
static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
    .pre_div = 0x04,
    .mult = 0x85,
    .div = 0x01,
    .pix_div = 0x0a,
    .mipi_div = 0x05,
};

So I'll agree the patch is correct, but it'll show up other failures
that were currently masked. I'm not fussed about the 24MHz mode, but
it sounds like there are devices using the 19.2MHz / 319.2MHz mode.

(I've also noted that the driver allows V4L2_CID_VBLANK to go down to
1, when 40 or below seem to give corrupt images for me. Implementing
set_frame_interval for a raw sensor is also wrong, particularly when
V4L2_CID_VBLANK is also implemented. I'll see if I can find some time
to patch it up).

Hope that helps.
  Dave

> The diagnosis holds on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19).
> ipu-bridge gives this machine the same single frequency as yours:
>
>   IPU_SENSOR_CONFIG("INT347E", 1, 319200000)
>
> and unpatched, the sensor reports
>
>   link_frequency ... value=0 (240000000)
>   pixel_rate ... value=48000000
>
> exactly the mismatch you describe.
>
> Applying the patch makes this machine worse, though, and since it carries
> Cc: stable I think that is worth resolving before it goes in.
>
> The fix does not only correct a reported value: it reprograms the PLL and
> moves the link from 480 to 638.4 Mbps.
>
>                      unpatched v6.19     + this patch
>   link_frequency     0 (240000000)       1 (319200000)
>   pixel_rate         48000000            63840000
>   PLL1 0x30b1/b3/b4  0x01 / 0x4b / 0x03  0x04 / 0x85 / 0x01
>
> The IPU6 receiver here does not hold that link. 150-frame captures of the
> 640x480 30 fps mode, counting dropped buffers from v4l2-ctl and csi2-5
> error lines from dmesg (including the "callbacks suppressed" lines):
>
>   unpatched  run 1  dropped 23   csi2 errors ~7216
>   unpatched  run 2  dropped 23   csi2 errors 13277
>   unpatched  run 3  dropped 13   csi2 errors 4722
>   patched    run 1  dropped 106  csi2 errors 120788
>   patched    run 3  stalled: 50 frames, then none for 60 s
>
> The errors are DPHY fatal error, SOT sync error, inter-frame short/long
> packet discarded and frame sync error. The frames that do arrive look
> normal, so this is the link and not the image.
>
> Two things to be honest about. This unit is not a clean baseline: even
> unpatched, mainline already logs thousands of CSI-2 errors per run at
> 30 fps, and the out-of-tree Surface driver sidesteps the whole area with
> a vts_boost parameter -- at its production VTS of 3448, 15 fps, I measure
> zero CSI-2 errors. And the sample is small: three runs each, one unit.
> What makes me report it anyway is that the one-line difference was
> consistent in every run, that it introduced hard stalls I never saw
> unpatched, and that going back to a build with only that line reverted
> gave 568 consecutive frames with zero CSI-2 errors.
>
> One hypothesis tried and failed, so you do not repeat it: the out-of-tree
> Surface driver notes that the vendor runs the 319.2 MHz PLL with the MIPI
> divider at 0x01 rather than 0x05. Building this patch with mipi_div
> changed to 0x01 in the 19_2_mhz_319_2_mhz entry was worse, not better --
> 3 frames in about four minutes. So the divider alone is not the missing
> piece. The vendor path also uses VTS 522, which I did not try.
>
> So either ipu-bridge's advertised link frequency is wrong for this SKU,
> or mainline's 319.2 MHz PLL entry needs more than the index fix to be
> usable. I have the machine for a few more days and can run whatever would
> help decide which.
>
> The rest of the series tests well here; I have replied to the cover letter
> with that.
>
> D. Manresa
>
> (Written with AI assistance, directed and reviewed by me.)
>
