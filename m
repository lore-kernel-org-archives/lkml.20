Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793045312;
	b=g7oAKH8VbmyG64uDSqGEXiXDCCQtrGIpvgom0cS7ceM/xd3UWTYm3tBUWX8ysX8tWlss
	 +xiIc9ZApPm1SQgdVYFF3GPJD3OcFxbAUnmSQQ2fcyz0N3HQFVMPpJlGzHAuCwJRxu8ma
	 NaDHd1eBMg1XEWBbhNkcJQqYoU/lP+2Ac4ltb1zPummPjoPuJeEu5xCyoNh+CXkUD1FCu
	 HRZYu02aHudazoicR5cEr0ikLZGgtYUkgF/CxC23j2W58wtymwIeNDVobD9Mi30fyfPbR
	 lNlF1cYj4UxGgfxfQPt+2WZ17EfYO70IGU0iT6mgdK7cMKaUzjBdouEZS+wAj5vjmxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
	b=nuBPdla0XyOr9CW+HjUZS6alLwcWNbpF6+f1i20CUCM+zPz58YGP/zeplvy40FlXuzp9
	 XzMulLwy7d6x3iws2OGy2iOUsbYpL2AUdJOTwoF2YVqLbYIW/2YV/s0C+NLNucmbnpBRT
	 25YEmaVmSeKF3pnIhRR9Zo46h6zIRgR3v5tGfmitr1XXf0civCHfwyFNL3Ej//9ZxQuEx
	 tyJm7djSTjF1KpBtVrB4rnGx9yVXlVO2PpgsRFkrDv2ACdocvkYlnvHcEZc4Gg9S2FujL
	 j82K7ezNEERTh2KehjD017/5/URTezfLoFn68AK6u4jO2Mh6HmTGLQpoeW4Hq4qMQNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZh6S+kW;
	arc=fail smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24410606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24410606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZh6S+kW
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2390748e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793045310; cv=none;
        d=google.com; s=arc-20260327;
        b=L9i6d6RfRUTa0pq2zRZEIf2kW5HSrPUeYl2gx34b+MSnl4K69Xm/zG8TL+fJ60Osmd
         t8O8U4JyRrF1NEQYyWjy8uZtcRI0iFYNTM1Ziam24H/GlHxxjlxiEu73Y4oaUOwWczOg
         WH8Y49gHgbeg5RXbNIHFr6VDXaGIDvrmQUoBLppQOFzJa5gHa4Kvm4OI/nZzFsdR6kQR
         GOruEWXQJkXENpYEkHzqviQ4bwSY302kaXUgBjcY58yoQeATOX8hc62DkAUuXOGnyqXH
         2AVqsYit/13loejHYVX0a73mSTyFX8PiW30U6ckysA4yTOEK1Rs/1/qtDtSyfEId1/xt
         xFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
        fh=0NwnBsUnK9Bw3SGkUVLZRSkglWPRPulHPQuZ7wCC6Sg=;
        b=IUNYWvlDZniV5IuUqpMoQIB5ZLJUO0/iPss5krbaxX1XgpMPISjRAntrmux/4/NMJx
         2I5rQpZI7sO46uC41Hpx290m+DIFILFvSiCKHdNSUg2EzS3Uiq+FP+KmVMFRP2CCL8Fy
         KOdnE5OuM/yD8bvOs1DWTRTxN8LYQNgtnl90iruqZ0crjWhPXrCEm/Husmu6Mdix0iZR
         Pf3zosPAp+ePgFR+yEtyOOdeNbwsg9Q3HPJZ1AHPxMnN0sSGyBP3PiyVL13654rz6ghJ
         n9BDlOuAdWxpjtchONd2FknS2lQuN7VtKngeIeN99TDfZ0D7W0U179sRW8wlvaYm6AeS
         bryA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793045310; x=1793650110; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
        b=OZh6S+kW13kxpe3lREHBsQh7gKurkpWH6ldjdgEceuqtuVRZ3cCV7j4U//r2MvB7lU
         2L48tzRSfgIESNC+J07hbFIqffZMyhEUK4Vauc84aTbLsEZNwdK03v+BQcLAtq2f5ReD
         oAmxaCGbbkcUuB8jksUqRoswH1buNz/raAsyvytkiLsa/9H95KiGGJej0a4SAm46L0gO
         M5NYNOLaYoDsWsuyCOgkS/qut4MsNspWHcUL8IGSkeOrzcSiFqa1YTAgQyVFrdzpom9U
         LYyswoJwSWpxB8byrplRzmSMhbPZM99zK1bFbUmz4A+iwBHWBmRxCWa9NfX5w/o4MjtQ
         SGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793045310; x=1793650110;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWqnHnWKSGu2qfmiQO4KE2+ceVuEjS/9bDtJVMivCcg=;
        b=ooagdGHZ3SuEij3NvlvR/Nc36lSa7P+yTtGG/G56C+4sRMPSN79XSxq1R+CcdmFX4q
         eS6RGFdC3Kgz32FJcbXa4PE1dXRPRIYo2cDp5903NoAH3E2dYqESf+PoS5/TMkQ1Qtrr
         Vl79Eb0oSygTU7HQ2vFL4z6FEHYqbC2bXqNryWl3hsDdT8goxmzha7cxVojVCY5jzf7x
         WNi3jPBPJGDdtzeiwWtUF4fbyd75gcC1qMvLct8jGtCeGdfLkw9NPr50sj+zFnBHJPmg
         Zxvrydu/P1QUowkQU6gHA8VbFx2CmWO0u1SEqm+C4Pl6Zk7CvjyxmiSUDmxKWUsiCVKe
         gACw==
X-Forwarded-Encrypted: i=1; AKwUvBzonvAwGm5Bau+vAGDJyvS58SgE2LrdhiDbW9CI3YetQaN0ul9oOgN8xTFiHnDUOwMPJVvstPP+RjFN2DU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSI1ZWUFnwXmaF8GQxFaFDi7FpxFNA9yqJ6D8Am2aWcFdxNzJd
	xehidsl48cP1yAofMif4ku5OfX4v6LG31eHWtJBvCXWr53MQH4i2mvvEwbAedeHaFHl71XbroLh
	krJYmq5mVELi3tapDjwwh+aCBINVSavM=
X-Gm-Gg: AYBFou3BxBvBahRA4JTQRlxhz14N4j6pM4KtCI6wLNuEf+Lid5U5nt91CwSKmWsV7Gq
	3ky6Q+sjdKSiOy8gSMdhpbYW05sHf12YKXrlN3MnMq60dYLd/Ppl18vV+x/K8qxWn9JzCgl2iZe
	AzQsfzJEgxZXXZIigXrRxRPcX9YCzFD+HLRqbUCW8oBrrzLfD35EDbrzMM+SyEy3Y/waIfrXmo8
	QKHPdvJ1HrBxfdUST8gjz6tsdt9kuskA00+nQjDFq+RPv3gAqanBWMftLzFqwvIfGiLNLC7j8hu
	ljnPdj/X71t0e58cU1UdaRsQev7WzOk7+VXpLmRE9jRHyDUqWioLiegihOURrHdv4An5TA9CoOx
	oSUAfkXJCjqBDaJMaxRc1k9mq2OV6OiPatfzsOCM=
X-Received: by 2002:a05:6512:3e04:b0:5bf:a27e:e455 with SMTP id
 2adb3069b0e04-5bfb71fe5dbmr2606420e87.65.1793045310018; Mon, 26 Oct 2026
 13:08:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-2-457aafbb28da@gmail.com> <54itft4rw53zcxoyx5vhxz3zfenxgooorp6lo44vbsdayrq4yi@3f4btdyicop6>
In-Reply-To: <54itft4rw53zcxoyx5vhxz3zfenxgooorp6lo44vbsdayrq4yi@3f4btdyicop6>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Mon, 26 Oct 2026 17:07:51 -0300
X-Gm-Features: AclHuK-BkS5vWEjGMTsyKGjUVJ_nbifNDhF0-JuYBYIWpzcnB0joyMLQ1fgk8e0
Message-ID: <CANxzQdFsbu0mTP6WgwjH=9tHT0SyT+yw1LWbAtHYv2unr1ym3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/a5xx: Hold a CPU latency request while the
 GPU is powered
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Paul Sajna <sajattack@postmarketos.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2026 at 08:42:26PM +0300, Dmitry Baryshkov wrote:
> Do you have any extra patches that you are running with? I don't think
> that currently Linux can hit system power collapse with the GPU still
> running.

Yes, a series not yet sent that adds SDM630's system-level idle state
(cluster and system power domains in PSCI OSI mode, and the MPM). The
stall needs that state, so on mainline this patch prevents nothing. I
briefly mentioned it in the cover letter.

> On SDM630 the GPU is running from the CX, but we don't vote on it (yet).
> With the CPUs awake we keep a vote on CX. With the cores going to the
> deep sleep, the CX might drop below the required leven, causing GPU to
> die.
[...]
> Could you please check what actually stops in your setup (CX corner, the
> BIMC vote, XO)? I think the proper fix is for the GPU to vote its real
> rail, scaled per OPP, in both RPM sets, rather than keeping the CPUs out
> of their idle states.

The GPU doesn't die: it pauses for as long as the SoC is in the system
state, and the job completes once the SoC leaves it. The votes don't
change that. I tested them with the latency request off and on:

- XO: the GPU clock controller using RPM_SMD_XO_CLK_SRC
- CX: the GPU clock controller voting RPMPD_VDDCX at TURBO
- MX: every GPU OPP at TURBO
- BIMC: every GPU OPP at the maximum peak bandwidth

Each was read back from debugfs during the run, in both sets. Hang
detections in jobs, two runs with the request off:

                        request off        request on
  as is                 207/483  216/483   0/500
  CX                    192/488  194/485   0/499
  XO                    188/487  188/483   0/499
  CX + XO + BIMC        180/487  185/488   0/499
  CX + XO + BIMC + MX   199/494  208/487   0/498

I don't know why it pauses, but downstream keeps the SoC out of that
state while the GPU is active, with qcom,pm-qos-active-latency.

You're right about the CPUs' idle states, though: with sdm630.dtsi's
values, 424 us keeps every CPU out of power collapse while the GPU is
powered. Only the system state needs blocking: at 2336 us, which leaves
every CPU and cluster state available, the same test gives no hang
detections.
