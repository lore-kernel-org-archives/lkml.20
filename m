Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D63876BE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385432; cv=none; b=ET+O9toIk+6Rh05Ug5DH9n9fASVkbv+XMRiD7/SLhCECtyD5zt9+ZZJwsk9c52adXDOt867YiTjoFjHx8tbwuig3KEABxDK17dxBD1UXI5qdJKVFkHjslyzLeQNWjlJ2dmvh55bu66qC/0fTJtoobKd8QzV9Zt+9R2SuBsPB1r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385432; c=relaxed/simple;
	bh=ZYOxG3p4H2C6/oyXwD1Q7tAtMo0R5yXI0TUlm/finw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OKZ7VSpDMVEcgHJO7JhRh/3SGuRd1g/dIIAOiI2yR9RFkzOvTQRc+F0hu8WOOCZTCVk+l/jZNzGVFSYu5HdWUBbmm0ahH4x1EsmXRmekaW/6hIfC83Kr7tHk3me8llGhgdZivXLfJohxkEc3LDAeJ0TLKz4ALhXpmHxQ/c3LKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qt9KE6lq; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qt9KE6lq"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso42869885e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385414; x=1791990214; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzDDB4ucLbbRTjxu5VYG/uPmoNmYS1X+sYC6plaG5JY=;
        b=qt9KE6lqq1YHLmQjeGjVl3hfd99ZtFGhRQCZrtUy2D0HJbK6OOFaz7QKa4IS9sYcKI
         qEmlQNkUm7jAvpdUkXMMTpfEdNwvRbcMDCt7kKFD9okVrebp0wXe5x3jsXrPP4OWtj8/
         54CzlmaBCCyBm/jsgDiDPFfiVoUol0Vg5DLQlv3bXMEIEPSbtjWMsee7WBAqfo3+4zNe
         CnmXdvRER+IVXyjwyhHdzH/GTCSd8w5L56R38ExV3eTc/9Yk/klRinufV6z9CCs0l/0l
         /kE3Y3lx5Gtr7rSh6Pa+AQqEoo2K+dSp4AtIfpyLO/MI1MX9wkidKeHPEuK2Y2VXvtow
         Fu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385414; x=1791990214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzDDB4ucLbbRTjxu5VYG/uPmoNmYS1X+sYC6plaG5JY=;
        b=HXYwoZOEJdmv4UK4DPSNI8S8Agwl+HEwyFO+WEZjC22oeERk5oXeQw5y1K854euFqh
         CKV2rRHA7AHkCpQg58+S/n8R1DZFVfQp3vx73GujEPcvdGm8nxNL3E9jdpk9+vEZ0pog
         NIZcKOhwv5DaCHYypUCihu6OBX2TjRo/VbiK9tY5I1ZfHtyKdvxy2yPwU7pFVlxym0dq
         4tc8lWgG3WRfFRKw1Bkvpl5ZVd6ZU/naQHSepn0OOArwRIyR90FRfJ183v8fzjUgpPgV
         9BU6TZ1kk6QR8rAfo7yq89p9MsBniq/1cbP1NVy/FtY4/UgfWNSrMk6qhSRY29NDaRqf
         9S8w==
X-Forwarded-Encrypted: i=1; AKwUvBy2jCcF+qajpXH4+wh5geOI/rtafPgMXtgLhtMNKcB4gCls9ask1j8E7Sn5O+fZ4y+OxMIyZt6kM6dJvZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++nWk+25Mv4RCqD2xIsQKgWdXrOKlA6MtJeFgHLxxT3uJYqN0GLh
	k/A3wFa6T6X2pghkSJ35ZwHbKURKtRuLV4hpR8hCa5m0kFf/6tSDwL3eSPSylxibcU0/f0pofM+
	p0AkXH5y2FovtJXb5dONhGg==
X-Received: from wmgb2.prod.google.com ([2002:a05:600c:1502:b0:4a1:6d54:16a6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b64:b0:4a1:6dc3:f5e2 with SMTP id 5b1f17b1804b1-4a180650499mr41927855e9.33.1791385414013;
 Wed, 07 Oct 2026 08:03:34 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:55 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-6-vdonnefort@google.com>
Subject: [PATCH 5/5] drivers/virt: pkvm: Allow granule larger than PAGE_SIZE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Both MEM_SHARE and MMIO_GUARD now support a PAGE_SIZE smaller than the
hypervisor granule. We can relax this restriction.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 3852be6bd16b..e3363a69a7eb 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -135,7 +135,7 @@ void __init pkvm_init_hyp_services(void)
 
 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID,
 			     0, 0, 0, &res);
-	if (res.a0 > PAGE_SIZE) /* Includes error codes */
+	if ((long)res.a0 <= 0)
 		return;
 
 	pkvm_granule = res.a0;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

