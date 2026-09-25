Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B194DF4A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361752; cv=pass; b=vBMUhooOPk1Ro4mkl2odtupsmVqMnQumeMNsjmbdpvmx4uskYY3dFasF8gT8A+GRjGrwxbYJwI0Mz4NqPQTqLP+L2jQfRx1sS1HrXPWUWNGkojotHxHz6zLVYFEh8PwwxFzwfWtMZgQlKZh36wBdh0M1/X3qkVrN0i16VeeXSGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361752; c=relaxed/simple;
	bh=DlEudOypjlT0UT2XU/5WL96WZISmA/ECBN7ByCN7TWo=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRxo58h/HHtGOw2rmuLuT0xkrXOmrCVthXrlnb+nj0qd6PCY+n/NLEzVwQ9kuCHl3i/sKSw6JxMZfjPhE7Hx1xn5K4Qv8ACieYtdxlbGeQSAC7A0cMKfZQhxvkAH6Sf99XIaoTj2PAy70IZffjIqNYV9i/KjON9Jj+IJmS5u5LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOTkTZBP; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOTkTZBP"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c570a3030so15574666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361749; cv=none;
        d=google.com; s=arc-20260327;
        b=aabr+0KfdWSrc2Wfy7wMvDMVkmQP0KC5W68By/yBFDrq/ACMDLM7lAhukIIgyP9KqB
         QTCodmuYNM9lROYGopLWWDy7TCes0DNLNNLK03Yvkojd+PuIH5VJdrrWCUy8kLRJgmju
         C5pSSKS9baJTqqKq451X7FHnNp7ajEVTAJuKFx2Ko72UPS2fJyfk8v0rj9bfcqe/eZfH
         2OrOMv+sU4dfFFcQWxYDQ6qZSiah37jrnM8/ZOQtNYyS90NC12mVo23bAowx8jXZc7Pw
         syQAkI/RINVIoWMih9ZbkTdXMdr9AIZCl5TbWn5P+c5EB5n7RFHN2169HNiWcO7YY3RU
         lVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        fh=6fxEveRGvERjOxh25yoCRDYwisfTVGi7g8q6RV4k7nE=;
        b=fJVAbVHqacGTP0gMUkBlJXYPUUxaYXsSOXyp5CrvoeN2R3bdwTf8YYQQca+joFyqGz
         JbtCTeTWIWfPxG12gKggpFIdpmQQRlPaHZaElGHxgwAz9Dkl88hu5H8j3CVEoIoXiY1t
         4CC/gq5p4sVrk/XcbuyI3FCHUkl0zMnkU+pxetixK0E9rIYODEBVkyuz5e0L4/+fWZ01
         MpP+okft7qf/WK1c/PNLpJhrLl0Kqye4xYMvnjPXEw0Y1w04Cw8oPBwTbY8i5ggQALQ5
         wxdLpQ0DeV4i55UTKwDL4NAucRYMGaV+oKSLFa0UujlIQONda07364Kzh3+5woQ7fQaG
         c9rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361749; x=1790966549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        b=iOTkTZBP/Lm7/AH6yWxrX3SzvVDy5ZLkhrQLnMoZBIv1nK4dGfrCAPMwWofw7kDqLk
         00bthYyZ5+B/ATTa0fFrzJDHxzgRbcGyUZ/xsLCy1YHZ9LMx4LDEOVB5YZikAIlBO74B
         7WWltWBTfBNUgICa9vB/ElUGNY+Ftp5q3bmHDiCqfzfUCA4sFs/m0xobtgERqJFsKP6e
         r8cheojJXlT3BC2JhAE78FzKaoxv7x8tLhFvJ+8JQZWNW6pTfF46NnH5VQmyqBcsNz91
         VY4ZGtQOU4ZMZp8RkdmEPLX+mDja/J1fAC0GbmxGhx5mTas0muLBe5s2dc1CEm72G9jk
         jOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361749; x=1790966549;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        b=t093L8BjWVBTMSYU12FYCeJ8L0Ab6KEBiiyu9GdGwyPhNwof8nh3p9jDlN4axeGPok
         h1cwkTDgsoYrWaCKG0ZaPm5nw8HgTbVHBo2cpNOmD2usVIHqYeNxrvSzejOktWacv2Dx
         YfwxIoVgsAtLwFv8CVbzlkOImy+511pGUT6wNPOqa570b/6OK1dnWl8TYtelzUZq8OMe
         RHBg0d2Eymsenyvlmes35I0CloaMuOK4WLn59GkIdUm5ukb6nzwZgCdZjAkVl9GGYTv/
         I2aIAcxRplCU7Mz9EtggF64pbB+8L8l3KShdAPhUoOiA2pbNz2UHBojDswvV4D9hOJJH
         Fcyg==
X-Forwarded-Encrypted: i=1; AKwUvBxmzwqjal67qjBUfAR8ChC8XeFHaJhhfaCQ3zD4GheAiVYP6voygsvxWdDzbat4YfitOEe3HoJZzMTl/TE=@vger.kernel.org
X-Gm-Message-State: AFuF++na6oVnkXrMYAi0cFQJa+VXEDqWjzy45XUPgVMdgL+BpvKycDh6
	LQ/+8vAFjCH4C6ejxA/92akYVeOAR2IhiyAm49WXTSXeAiRfoXRiVtDwgbDtPIeWOZPsRdkpqqg
	Ekojs4uzw6ywajuG22YKjYkaMlfwchA==
X-Gm-Gg: AYBFou3Ik0QwHEcxVGY0u9SpNTbnPFWlD2PTScgLymM4fsRGBtf2tsLbApd+1fYY2mU
	o241nfopxeS9l18uzae0TCYpRe22s4tjmmGS32UDhqXiZbkbHGTk9i1ZoJ+4CKLsTkrrmW4OAn/
	OO2uiJBG5gYZHRgQpBpyVKMyEtCeaXkU77KG79xQuMEJ8jPrM5u2TlsPEZPav/ll5He0SmXkMJV
	5U+yzjYHkc9h1Wx4R2xqoLdhPCrZfZhvyDWhOKQYCakn0s1Nwvjqp7Jqs3H+u1W+qu/92/WhYp4
	b3lorCZfuzLm1ozRTfpqdu3MaAmm2ed7lD0Ap5ySN9Gbb2jNnr62Z9n4UZpsqOElmhZffE0MIJ2
	RYTXUexeXPN3GAykvdqnEsMrY1erneSZfb5FwZX7QISK/U+ngyzNnHActSasIr/0C
X-Received: by 2002:a17:906:dc90:b0:c29:57c4:cb92 with SMTP id
 a640c23a62f3a-c2ac228849fmr621819666b.0.1790361748717; Fri, 25 Sep 2026
 11:42:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:27 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:42:06 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
References: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Date: Fri, 25 Sep 2026 11:42:27 -0700
X-Gm-Features: AclHuK_62Txs1R6aJpFVtyE2f4h_5eO8zVZDoQklxyOE6uOg6AtGXwg5pp6EdGo
Message-ID: <CAGEsz8GWLwXjNKo-9RpR=sGWqoqiaW-bmT9o+fYsTJSkymiqNA@mail.gmail.com>
Subject: [PATCH v2 2/2] media: venus: disable recovery work before HFI teardown
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and
helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c
b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..94d4b8688ac2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,7 +538,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;

-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0
