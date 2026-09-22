Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBFD5540AD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082813; cv=none; b=Dm8SPQZBoWd+9JgYtDOUsf82NpEw/nCKt4h8ZXgA5rGcPkSJL8DOo6N7GIyffZVW473zfd0cYHiza8k0ieHXozrcCAoeFbeT04f7GhpA3skBZOvs3o/WR5mTiTSqfhM4n4wpcBM5DdM/j8KjIOnHAvo1knPHpy6RaZz38Hz71gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082813; c=relaxed/simple;
	bh=mTHSYZ8oIyH5+jZA9kzIy7do9Yh3x2nmm+86lRMfbrU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d8PmxTwZY7WRj0uxOis9ju5gz1pYgHsIGhbC8wyxLYrUl2H6J8xszEvz1EbSEE4deFAmnrbJD5QmvRG37lJPQsJnWCUtyJISXa6G4sfyB5RAieyGtsfDT5jgY6GfUfHUcmyuZUUjZbmBq8jfVpyXjJE7Sy+2B8qKFlLSUDC6wyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2EsLHFd; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2EsLHFd"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so55213505e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082807; x=1790687607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3DEXLWinBeC2wh/ugj+OMoPA5T1eV0IuqxQq4Yim5M=;
        b=d2EsLHFdds1SCqqolRmBjeE8a7poud0o/bCmIGRvkKYwRo7QwSHkKrt8AvNdwjEv57
         hFzb6hYu8qqVFVqQp2rAsGty85blpM9JoWjrkp3YHI75up5YLt8np0MqWDWcU9LZqQpw
         l1W5vDVVxclA4QwNpF20oAA9WXvpB10s3lz5b7yWXJR1O09UFVrWafLAnHja0fpBLWWu
         oiXqvY2JuQm6+rLM6PRTzJiCLO3HybIVTN5Tjo8z9olhWPCOq1ABs6wtCwgH+J9/ZYRV
         ujg4Tve+syfQggUdnYx08fTv9ZOS0LwHt+B4Ho1fNUbYG0oVyxawPa8wpqQA13QPAqI6
         1n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082807; x=1790687607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3DEXLWinBeC2wh/ugj+OMoPA5T1eV0IuqxQq4Yim5M=;
        b=LWx+C/UlJJy8J2955SKrgOxmSr3zVLjdRtA5xBSGHM1FFiYwcKEEXuWbh0GeX4v6Sd
         Ox0uiTVhRGw0Pmh+/wT+HS46T6vHx9VSySiEfdAUCDasSrLS0jkgemSgXE8EBV026voM
         GGorbTU+mrRpZPpHGN0tc8XOR/uG6YQ7YyIbWoFZdXi8MRC4i+9EALE8e8PTznrHFj6e
         rLjmN+xlM31PVyrN+J2oSuPfivKb6ps96m/r07dTfwee2WDvnjDduJz0wpidRpE3EYOZ
         RCKOG2XzSCWRqYDiobuTH/Y45NW2spc+3hgeaW3wqkxbjygCIl7nk6XBW+XIRFQNTwDH
         3DNg==
X-Forwarded-Encrypted: i=1; AKwUvBzxit8Q6wgafaqkFgBT5W/VXMkQ/ws7gzygIKvumt+Xe+1GjJoFUlrcUXj3FBnxN4K96jXBlalhTNmgZck=@vger.kernel.org
X-Gm-Message-State: AFuF++kKAZmOfv3FCUGAuC3IIDfKrbNwtg47SYiMdDnFFCnJ/bYcUDXO
	+RI4o4alcp+B15+8N62Tz+x0W3+AndQ2wggZQA/OE8+8wI0Le5FqT9VozfoeBvUPzySDhw+iM7V
	s7Jp3MCAoIDbTyg==
X-Received: from wmxt2-n1.prod.google.com ([2002:a05:600d:8642:10b0:49e:6b4f:f95d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3585:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49fc5734ef6mr253475505e9.16.1790082807063;
 Tue, 22 Sep 2026 06:13:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:53 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-21-smostafa@google.com>
Subject: [PATCH v8 20/25] iommu/arm-smmu-v3-kvm: Emulate GBPA
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

The last bit of emulation is GBPA. it must be always set to ABORT,
as when the SMMU is disabled it's not allowed for the host to bypass
the SMMU.

That's is done by setting the GBPA to ABORT at init time, and host
writes are always ignored and host reads always return ABORT.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 00528380774f..6e023e968ed3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -215,6 +215,22 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
 	return smmu_sync_cmd(smmu);
 }
 
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 reg;
+
+	ret = smmu_wait(false,
+			(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) == 0);
+	if (ret)
+		return ret;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT | reg, smmu->base + ARM_SMMU_GBPA);
+	return smmu_wait(false,
+			 (readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) == 0);
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
@@ -453,6 +469,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_ret;
 
+	ret = smmu_abort_gbpa(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
 
 out_ret:
@@ -778,10 +798,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			val = smmu->host_ste_cfg;
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_GBPA:
-		mask = read_write;
-		break;
+		if (len != sizeof(u32))
+			break;
+
+		/* Ignore write, always read to abort. */
+		if (!is_write) {
+			val = GBPA_ABORT;
+			goto out_update_regs;
+		}
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (len != sizeof(u32))
 			break;
-- 
2.55.0.1082.g2b9226bbc0-goog

