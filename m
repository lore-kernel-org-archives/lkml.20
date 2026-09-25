Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FB1A704B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294969; cv=pass; b=As6ZP+H/83xxugQ7c2sC9+y8+pItz2WERmZgfdgggo7ub7SKaWjWPUt3GN5Q59IYtavLHSY0twSV/JR+0v4t0Ibqc7eNHnR6weayV7uom6EN2m/qh4FApkxAB5/8tl+AG+CWOF7K4j4WdcAxbgYa7tNsC1FpzQGdH+fN8KGFt6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294969; c=relaxed/simple;
	bh=YSMX5FLA+2PLf6XOskP8bd0x+m6bdSeEocRmUK+dICY=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2BqdravHQDnW4ULUNDlJJexte/n7AKWMaB0K6XI6HlS2LOb0UiAuu0hs2fdOo1yCgDFXzF8/mxIUZ3T5qUAh4+zMW4mrlbcf5IyFEwyxDFvIdvrtSZiw+dHT8BYc0Je+PihLkYwG8rq1+v5JzU5x0+B8oWqrbtsgIpnij0wlLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMGt7b+R; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMGt7b+R"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso55482266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294965; cv=none;
        d=google.com; s=arc-20260327;
        b=D90ltawbfBgsyLziSt5CDTilnykOyM6FppyTDV/Ll4lEmjbhLij8Nu4dvKTZZbsfUe
         6EndyQznE2gs4JHXr4hnpZHouXwdMXXUwcrjjwVJ7oUKbYeZMjdl27Z9g2iRSmLryJyC
         /N3EBRYyk7sqEKiLsuLmmDrf10qSkqRfmSCAgcZkGwwAv5SavrXOt8mxB7wRvyVPXAyL
         +AL9t4dNoFfJpb+5n1VbfkA29Opulcl+ZPoM6Al+I0CZcemZdXQxd1ftWU9XwR9GSRvb
         qeIvn/Eb28tJHQqpQjXMWJ1hw/RyCkqm1KDN+IoUtOU8wphiE2s8QrC7/vWgdOlnMPWH
         RtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        fh=oDvqQLx/qV5yLo+mV8hm+lIaGfoiA21vDTYCbwe8D6A=;
        b=Dyyad9l8Av37Mh34Do+vm1dz9VvrghxVDDR4yCdSCZhZtqk5+LeW0ZklJao24aQtxF
         cBWLAGnU6cMIghECHCtUnZWbm1IGtNMyBztaHZSVTktsT3bmgEkYunGcM3+M3BlOdVD/
         MUfcEpv8btdaPNblSrmSCt0xbCpTD52OBhjMQBUZCprUxQgkaHUqxUQ8HppI0BrSDzmi
         doIO1PE/uTaCWbgHjzN2udFgSeZsKd/56Hh9p/aNOVga4NwYWO+MXdaR2TONxFHNyyOO
         hOMwkpi9twjvm2+nBe5xT48TWR7xSHjYoR0ZmoO7Gl3PRmi6ZBRwRR7kCVrBe50gT7vI
         XMWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294965; x=1790899765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        b=TMGt7b+R43WhQbmZL3n4NTNVIVlbBAiInjTRsUgiqqWIhBK08HMW2yahUbHtQDizHO
         CnaLr0xp8ExNwvlSqhUl4z6967ScxsPMITLAltzxBzggwyA+a/nHjuYkmSdxjwTpf9CQ
         2TAcIMUrnVWTncZGW2r/l+KllcbVSS/E0ggvy+Q5GLoLpIXDzh4jV38RvZ2+11H29IVd
         ei2eAXEO2V6e1KwXNTNfoo3Q4sVAESBmHY05Bv4M2KB0z7rKXN0mm92XPFYa4gjdNzXY
         gRJjh/zr8l4k2Ea48LrbKtMYB2mNvJGHdZFmh+xtaS6LexFejeCGiKxrO521KTYk+fig
         QtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294965; x=1790899765;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        b=OtUrQ5Tu0LR20vxARFDBES+yZvdotJKc2vuIEdda6bmfkNeO5Ngqt04+mr771ws3ZA
         oLR6tZIH0Mvz1UHFXL0zSnTBHsKRYxE6gf3oPxCPNyLojtrUZlOWfCh0uyH9U29M7Kn8
         WY9tTZB24jQiQGZGEE0V5XJeJQ1TsVmnVUufksaZgMjQ5vIh/dSBNiak1756ZiojNWuK
         6q39y026pktgoV4tbWwOzH5vhU7Znsm7IPQtbeBJdqagtAsXYuShLKesSIXdW/hQIHNK
         pYt46sEpIZzHf283Jur0EKy+ijAMdOMiVU2ALHc96mdHpykWsnhlPl2IzV+8GJxnwmOi
         pB4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWH/+Kscxi5JkJ8TUkozbP8v1bYATcjO6DYsFXRa9whFno/OOrGbsIqe+HerDQee5rSZd58cJCJDpoqeM=@vger.kernel.org
X-Gm-Message-State: AFuF++nxJkyABddsq3ZE8powy3A8/ha6hwbzRg6SvyeqlbIMfae210kA
	U29o+P/1S9JOL2m7t9ZxZVr1Rb25RY3RstLx72MhtucCEDBWSybeVITeSmJAGcjP3KYou0S8IBe
	+9XmIugzle2KrOQbPnUKtYGWvd+sCpw==
X-Gm-Gg: AYBFou2mu+AJA+v9Z1ublsvireP6EEoo6Ms+0Ca04BCU+pznpMuZ1MseGWylN2ZK3iG
	hj0g22gIPhvCotTKaI8eysc4hRqFKOeQ2V1JXtWuSiOU5swlML2fhwnMaKvhBNcjBHd2UqLQYoO
	OctKW1FSBvFkWlO0esrqkb4MxMTZKj/rTkE8CKLe0PoPy6e18/Gscfwv3lg8sY/6CDEsfu7qMwK
	/iQrmanlUTJrpTfeResFxQA8KZpgykAAhnVT18lt8wYSMVbjjq4M79lVEdKpQnwHA9ssBKXrCL5
	I+ecsTFc/y3sSwK7XEJ61YHuAwLUgFFTu6+miGEwsQO2xw2kkeLVOKQT+k1asHlOeo/utXNVHqK
	D6nVk/NUokpAN1XOOs3kROpzSpu1/+gKZZ39G1165tDwog0KCCi03etqYnRJS1St4
X-Received: by 2002:a17:907:728a:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2ac257861bmr361270666b.47.1790294965192; Thu, 24 Sep 2026
 17:09:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:09:24 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:09:24 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
References: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Date: Thu, 24 Sep 2026 19:09:24 -0500
X-Gm-Features: AclHuK8SQKUaayfiqW3eGLbdulCVU75I0EuHaaMSyB3qG3Aqki_rJZf295CwA-U
Message-ID: <CAGEsz8H02F9SQ70UmnqMz3wWO5oc6=v5YTnAobBPW2a0reWeJw@mail.gmail.com>
Subject: [PATCH 1/2] media: venus: hfi: disable IRQ before freeing HFI device
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com, sashiko-bot@kernel.org, stable@vger.kernel.org, 
	ae878000@gmail.com
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
