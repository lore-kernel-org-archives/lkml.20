Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36119CC0F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294975; cv=pass; b=ADyYboJH3/Ibi16N93Qi6NfCu6s2TF+jDUeXm9XDyjXvSF+obK294Wm/3QXZZ6sFeufxoGYb3CXGRD0uQq7EzWNHnKDRVX9qmZNQL7mrlcuWF2dRzfAUVD/F2bAAKoYj7Ru6AZedh/RYSmdq1kRbVR+8BiEB0a+bJm/LqSU7ObM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294975; c=relaxed/simple;
	bh=iPGTdM+eHv5ZH8W6go2pTrN14Dr3emCgNgRX+uNwDgI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7Z99lZDEhQF1EwGSBavkwg9Cj69Q5Ej2q1mLxztff/zSAFxUxwbG/rslEIvgm/s5F9bnqOsxtOLGRMhtwJOd704ypXus+Tog0lNkzKh68wRxYC/H9CRpV0+CvHeqP8x3EOo+UPs4IfBdQSLtdNW5aB9QOSENnfplw/G0vt6m9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6qH+mWx; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6qH+mWx"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so55931366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294972; cv=none;
        d=google.com; s=arc-20260327;
        b=YkmLic5fnNK+AtAw7c7Rh8XknZHTjkhAGTvDYnQ4wr8eJkXN5WfWBNZkrJuLXeRUgl
         YZpQUpo/UeywCQS4UVBChuqinpq5g8KhpYAOlh318T89zdwNkVzX/5jbVu7i3W0c715W
         I4/nXr1T4Q6SgWVAdHm0EEWZJVVI/MZTgP3OcAr535t0Fa6RuhcTlCFB+ilSN45KJjpo
         W1Zz+2jYQPrRtgytipbaCZamBIC8cGHRPtsyVqagp3l+LlkH3HTs/22L4j2hFSx2to/N
         MAeR+osF8Hluc5EJ7lbyvimT+uFfRZJW3/DXIHiNJixjWv4BQWbF/2MQdilFDnB2IVDV
         mRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        fh=/TeDWCraNOeZb7Z/ZPi+9Wz0GaUPltzBSClrU/KrefE=;
        b=nvZ27f9iGJ1YByE8NlgK2BgN2J99Sz3t260O2rNmy8nDKzFes+nYahCfbV7OrUGzNU
         907tLBBpC/I7IKcMb4F9uPwz7/Tc1zqdiyGOYnjtf+24SQK4uVARi3gNhmVx9kl2J/jK
         rBCv1E4Wa8iRXiUfCdwi1OGbOpw+o0+X0VWHsGAssF8V4BzIDJHdo1WEI/wBBV7C8cze
         8bt07t4b4zoQmsGlFvC+KwpHtWfriCRykPJPWF7iAhXYSHJVEbr5noWD+RxtxCGm4KYx
         eNcl9tGDvrKQRFnjfeYOFZ/fP6qctCSZfbmvdfaqF96RLN7nysRg5HLAGZcu2Cj+Vx89
         XHrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294972; x=1790899772; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        b=Q6qH+mWxZJaJvAv1KW0FTxI9BCsH5OsOQ96JvEmAoR3w3vc8IQxSumZclnWkA1RP+7
         AJDXlon9ahImHv8ruO7cvK86d9m4/Ox/zZgTCcgGzmORa5Ct00FHS2Bwy6wcaw6EXlv9
         c40Ycn+5OxI67+YX/58BlFWv6DXGGvh3R+hgUZRCcMrrxrvIbU6xSEMUBU+qggGc403u
         AsThGV1i5PGJkbkKycKHmB3W7emoLC3A4GapCLJrgWYV7SlenxvbWdbcmGFXROBFh3Kr
         0M3DTw8YmCLW8syU1+OfZ7RbZDR6zs+izNzmoEl6HgwHFz2fOnw617c/CvxtpghuL6YM
         zYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294972; x=1790899772;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        b=ixQtZZuMwUdPTkZ2gavjHSF82inWlAvFYzH5TLciUMW31JBbtBryEaZ11oaxIL/nQW
         m1mmCOKP9lQd/p+m6Xkn+Sg8K+E83fOoByW3CL5xxrcXGiY795gZLjIaS1ChE9gSUbTp
         MFdLj+OXFPGPR5F2GvUFM3prwG0rea1raUlzK9bHeKmlKYi78NUf3qQB0ch6dcKUNJ2Q
         KNodlnZguOH3d/QPsE845rNHhPAvw7sSPn/RUisi4/XMg3XDuJZTAsZRXduLXye8shp2
         qO0L3lGtf1PgOlx5f0alL3Iwp0QhmXtH/RzeRymFYp1nd+RdElTsgq9v51MuLXHsIR1M
         Rz5w==
X-Forwarded-Encrypted: i=1; AKwUvBzqw/9S09ae18Su+i4YxTpUNDHO+TQnyW4mnEotYvOC4D0dIV8hPuyY/E9PJBMQUQJIPHzRJXjIF+m0N3c=@vger.kernel.org
X-Gm-Message-State: AFuF++kWEH1+ll96OBnWw4vgRCSmbytmza15+LUNwwWt8msVDorRGoM6
	rZBz2//ejHWdvYSMlo350OEhuEy99jEDgE8uhQxWSCTqRzR/WNVejRrNGtfs1M/0ChjQ3U/bdsd
	alOwhiLvdu1JFp+r3q10gbT9pkK1/PA==
X-Gm-Gg: AYBFou0SF1r4vrMPgkheWqTTVw9A7wB6luHELrT86pFOZOqsBsYT0/PIdnEiTR9BKnF
	C9gDSv8R9G6CltSHt5QSEZubusI56NkpQDsGLaraNk836L12S+1nFN43yNIC/K3vkez4+5LRPUg
	9rO5zKuwoGVjrXZRab7MW8UUwnyf28prpq1gNSsPG2UJc1foLzXiZYUyswPSpwDTc95AShpeIKQ
	Mj5S7nekd4cQyjEixLMK0L4/uDMnlJ9m6+vjdYkcFbMPhrVqtNj6fpz+03aa9uu+33OX8APDu8g
	9FrqkOO18CrKXiXyB+2xg6Kg1/2MRilD9lUcWchgOzMvz04i7iArHgYCG05QUmAoSYRJqZoMrJH
	cP8+vJnwGrh7jmjkqcRHFV9tLzAB63WFXs4w1BmvTG2tQ+8UEPLPeQX9EGDKdYDnA
X-Received: by 2002:a17:906:dc90:b0:c2a:85:5c01 with SMTP id
 a640c23a62f3a-c2ac22cabd1mr365869266b.41.1790294971950; Thu, 24 Sep 2026
 17:09:31 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:31 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:31 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
References: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Date: Fri, 25 Sep 2026 00:09:31 +0000
X-Gm-Features: AclHuK8Qhl5-EGC4HUcDq0yD-vI60rrYH2FFCNerdpeXKUT00izorJWy0kVNFrQ
Message-ID: <CAGEsz8ENFnYSCS3w7zLnkVbG4FEVG04WoptROY21mn+PnnJ7NQ@mail.gmail.com>
Subject: [PATCH 2/2] media: venus: disable recovery work before HFI teardown
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com, sashiko-bot@kernel.org, stable@vger.kernel.org, 
	ae878000@gmail.com
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


On Fri, 25 Sep 2026 00:09:06 +0000, mhun512@gmail.com wrote:
> As part of our ongoing static-analysis research, we reviewed the Venus
> teardown path and confirmed the race reported by Sashiko.
>
> This series fixes two HFI lifetime races during teardown. The first patch
> waits for the hard and threaded IRQ handlers before releasing HFI state.
> The second disables and drains recovery work so it cannot be requeued
> while HFI state is being torn down.
>
> The later Sashiko report also identifies a separate resource leak when IRQ
> registration fails during probe. That issue is outside this series.
>
> Myeonghun Pak (2):
>   media: venus: hfi: disable IRQ before freeing HFI device
>   media: venus: disable recovery work before HFI teardown
>
>  drivers/media/platform/qcom/venus/core.c      | 2 +-
>  drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> --
> 2.53.0
