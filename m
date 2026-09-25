Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB204DF4A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361747; cv=pass; b=AVdffdsle82DbUor/K09cQARjT/rmytR9pXhVoSpgVRsviHmgcRzUFCSPa74aOVw+kmOSAPytmPxnnSS6PEB5MEgs2Y+x+TNFNnTguvhIsr42ARb7ejMBkl84MQiQKqvcESi0SScG6sdMTY+fv1OCovMIbmRHzOHLG1bxpVMDiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361747; c=relaxed/simple;
	bh=hrTFA0SFmbn2rhmMV3Ste6+KH/y0c6VQdoL8hcnAOM4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrGFGqDEekrvTcvw6ql1ORWDUhwFiTBBjoDxKG/2X1/JkYGMMMysix40d6Xaxind4wlAmuwYMbYXT+tdxfThtGTjpY4vPOGIFVoJRDY0jKyQ0IlCkOXcQcpMtt980ZGJxrETfvg/QLFhGok/7t1JcxO8RLOrxAIIs1See1Lifp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pO7e4zZo; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO7e4zZo"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so185945266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361744; cv=none;
        d=google.com; s=arc-20260327;
        b=STm6O31y7BRutGet9hL3HU8sw1XUrqz7AjPWff8RpFm/KKkk9I6JOeAgZ737zBqeIS
         UOEkRBdsO1kxgjef2rTJMDj/ntS2rfvmfuDKriWwc+RhcIU/KqlwuJXbgfZ+s8WG1ycU
         +7nUGUijkuGI1hOqqcxWrneYuewDBSe0XTJQkaVBfjkdKK5Q9T+XqMV6Nk+PShjrv/KG
         GxYKUev6dOv0yOCz45JB4NtWUpkHR6mITUrojvz0C9DbjJIZn/s3wMYB1eIH28z74Suh
         XiAbBUe9qzo0AjiurT8dIbFgKKtWfgZ3Tx15PCM+aCvq+hzur8f7S97VuR5HdvlXVCnI
         w1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        fh=l5ooqUOIVbqp4Rohi76fDtiimPFJMv00SQRQvYpNk50=;
        b=VFTVUthi+w/0LpWsjKNLZgqEQHYDfvA9f08b+u9/WMvck7o40BW+90QwHhPnPxorIe
         ytSD3ZIw3NhAhhm8OmFfUy6SREbO63CfvEBB9C7OT5qgfk7AS97f+zzHQ2GxDsKf4NQH
         mdLYX6u9lJ/y9FYrxv+tmu8kkIRQUMgxeDJEt1iklS+QDsqedYPWAclISd8M6owGPJ8g
         zKkpKXmCxjIHErdHBjR9sQ7ZgEi/zPFxQOtZHsJv9di8eTY6ZC26cvqM4R2uSw7wTTPO
         1Idu/eOY1qgBJDbX0h32fChpATzTPcXDCkhM37j2AAZtg4dcJ6KtLYG7U8ZAui0fYhHl
         9AXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361744; x=1790966544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        b=pO7e4zZo1519ppE5GIz7ojI4kdnqQwVuj82ZTdM+2vrqECGG/E25Ld3Q4tW12Rdc/R
         Tz+E04YrbkoLZfXVrcMqzOcrmlvaEUKygB/asD9o9Zijn7sW6Jopn+e8Hd3Cy20zvofT
         cM8gwG3i7nDA33Bn1keVRr+fvfbTzuKPRFa3HLFkOc0t8ZBnk8Yu0CaNcn5zBfNVuDZY
         /K7AyIjWEzQGdiIYN9AI6hRqHVOgmpHuFE5De2aXFiVg+DnPMqt0HGAQyZ/WoXOYyRKz
         bfDF0RFeo61dPkkZi8inB/Gqcbm/JJCj7OAEPvv65ETHGjcltWdAhErbSaUEsrRSYffQ
         9ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361744; x=1790966544;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        b=UPrrT0nSwX/UEKR/JSoik8o1wfvEeuvJTwYlTs2cAZ+8lIDnXMmIVLAfJ3jWNVQEEq
         1DgDDwjgaSVJ7zASRY0+q0sjx1YGDkxX+ZUSBIb/Uh4wabvxHRohSet7HfUH8Zf/8Hve
         jOLdNUIxeEchUM+Iqx25yP+fRvHhbigaHST0MUKUk7hO6or9JOiWHjmlxdcoFiez2anm
         7hOHAdMT9wmWbAX25gm33mGxOGmhEFLxZrAjNh/kJQfLrA7runsrMzfY8dEPEP47NtFo
         55psYjImemoczvXb12fsHPi3xJRxNYIR0fB9P6uWd8OTL94etAt+rt5063LscyW1uUCE
         hs/g==
X-Forwarded-Encrypted: i=1; AKwUvBx3V9b0RAahEr1R1jkPo7q4UKxFRJWni7xy1SfJ1GCbzFvyUofdd5aduG8DcEa8yjmrLS9nxcV+jb+fpLg=@vger.kernel.org
X-Gm-Message-State: AFuF++k1rWudTd3bjmd33slgI6reQIy6Kc85TNDwA2PSjeaASTCDf0TT
	0virt544yZ2nYEua/Df6JcD6L3VGbuDBh48tNWXQQIz55DQh06Q7KfLuOLYZ2+0OpFN1cLuHOfN
	qdnnrNu1y/LuOsyt0IHYgpY95VG0Y0g==
X-Gm-Gg: AYBFou2PzQLQRhbKHaCvk2ZiZ03ss0qxY+BGOhClaeJxhtD/3XFe4G5www3BDr4jEMu
	NgYAYr/CGmXzV3V/EH/qVEsrJZYXarcFh/W2wBP/0MUiI/3WWMqlhaEA/usVwCXzXW4RRjOsV0T
	SpbN381LnSTm4XEFha/t5rxQGn/5lIPRPAGhuO7lCDUnY16H9dETlFU1STObR1s7qJjCtiJxTMn
	YWc0w7klBDu34hjTELiFdFqjN4ZEp9hygG6j9XHDioMepJK7aUNWpTRFzRbwGsDSSmm7ztTsSZt
	yROsDeHEG0uKOhFjcBvxPWiE6pnI838TM568tvl7TfIYSVLAfI6R71kWBRBvZr3cGzOMaQA8H6n
	jl0/l1DFYtkhIdOyYH+j+fAtAMLlHbsDpFX/N97vYCO2qtkRZhGCI891h4RvQSBWw
X-Received: by 2002:a17:907:c602:20b0:c2a:f360:1c67 with SMTP id
 a640c23a62f3a-c2af3602870mr155361966b.35.1790361743598; Fri, 25 Sep 2026
 11:42:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:22 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:05 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:10 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
References: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Date: Fri, 25 Sep 2026 11:42:22 -0700
X-Gm-Features: AclHuK-b91Uq58Jkr9vpiDUZfFWzBSqSctMSgFDJ6Ik34Htw_8K-UmJ0z9VCStU
Message-ID: <CAGEsz8GXrP1p1HM3TNJ4nWnL0GLqgp=pjsiwA-v-28wVosjtJQ@mail.gmail.com>
Subject: [PATCH v2 1/2] media: venus: hfi: disable IRQ before freeing HFI device
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }

-- 
2.53.0
