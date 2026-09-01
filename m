Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D83B6370
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248829; cv=none; b=CJyeuQf5JYzBTC2Tw3RMprshCRPZErfR/Nqbx9cX/qsFLB3Yq2f+S8BAvMft2stOh/KBrjAHNSQu08jI9CNZ6dFq00WuEHn6n6/qQyjJcE3Y2zlsfwlRTbbsnYaQEft1cS3oUc8b6Y2ouovZGdVfwRW6SyCfc3VwQAIA/44nBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248829; c=relaxed/simple;
	bh=A9qVgctfJKa3lOPN/djwn5FdaMAcXZJbQwr/BkRW6fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckaV5K0j3MvpzbEU6ik45c7LUnf114ZbEhkdDIhO369Qyt1OWoiy71EkVKIWINVX04dWXSPYvTwjNwyAP4JVEtplNHYNzLuz1bONjOLZzsEdu74Uhuw+IDN/60l9hTEjdHKzJ3AUxx9a7si72MWL6ROhV1Yb1WhZYueB+8Apaso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkFYGgII; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkFYGgII"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66d23c88af0so2173075d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248827; x=1788853627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypWFkePANEp5wn6tG7VIKIBXZfw/6XX/4Y0Ddb9zlHA=;
        b=TkFYGgIIOuQ+ncJ36gqZNhdePJAl74b4c8epXXQMRj5dNHCV0ntsvvPY5dG4E14H93
         ZJdiJUX/In4gUpSaiyUu9R+rM6QZtM7i/u1gOefywwvl8743M4w/afTz6KP4oCnmiRBW
         zJD4KMZhTFXGlvq69bOxblzpYLdWNsFJuqMbiWOoU+9wDX4WtwLrPPLIIagvTayoYNkD
         WIK0QYVRO6lkNPJoRWxW7R7crnNNK02neAqeaZBDlwTiB3BgB7Xn0BCqgbAS4NhFUGfv
         hQA5EbVE3YPTypiBsvH88gfwpx6HFUFqDSC761ZLr1xGwo2rz6UeTfAAAwyHs4YJUC9V
         pEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248827; x=1788853627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypWFkePANEp5wn6tG7VIKIBXZfw/6XX/4Y0Ddb9zlHA=;
        b=SQVrNAwOXxCPsfXTXSdXXku6jOtm5/bOFcZwufnY/oWhd+8tx3Lor7QDDh6wO3FEDl
         5Kl2oKLxMCsAPBa6kIv2xmU7+zT6eJvPS7UDq0VVhV750Yh/oNdRbrGNdfUPJUw9TBUQ
         CjuB1s4uVbra7rdVsS0krh9imuIEkMEHziqe/LYhvdrrPLgrFTpTv30+stl4SL8XJpJn
         ral4j8rUxmHtzzfScNKkzYZIkoYSGv1SHRbv/9+x2wvWXbyjWI9hEv0kMvyU7jHEn9KJ
         ljE1tkmZrihltDl47xav/dA936B+829fSYuWUFBwaliDnxi9XokRUrNKLmP4UOn3+XNr
         WD9w==
X-Forwarded-Encrypted: i=1; AKwUvBznK32BjD/SRV/hau/6ugeRHU3iRE0Z7KCl5AkvPJxZcLoHuQjIigXFnWlbnJUoCslFYx25Exu7zYNunig=@vger.kernel.org
X-Gm-Message-State: AFuF++muJlfzvWw6VmZLxwdpGW9dMb8e4vAy6FncECzh86IWnKitMXfi
	cImPx5RBsaRLOr7WRcDtYnupgQj+rOtDV+P2hncjhQHf5UA39et6RpH1KKx/7q+5plg=
X-Gm-Gg: AYBFou1UoeK1wn+5nn/GserjlwXXnm2NtzrsIqmRKn4HDGXzJuJo5B2lzt6VFqMql7S
	XXRq+cPItu4Oxxa9/lK28moD9dye7NO71IZKDGB6sIASlmPAEYBvhRN/MmUIt0DYJdiFkDsiybF
	d7P40ZQkVnnyhjJN3BFiNds+bhOjP/cteSnLZAOAtSwjDCsnFEmlpWZjp9JOSbaQu3gYehiREIr
	1EnONI80mT4qbN+VXS7+COpHjJtagPrZNdRKTwwv6+HzlBuXIvArHHSBfiRv1DjCb/fsrd79JVg
	+FYonKg32orfJcW+iifYB4wDpxgGPFSfeVuvnsE8Y11EbVy234fiP0qXE8ck6Dnf3hOJSjhzssB
	YkGs/KEdLGxlJqwHlhbrMAF7gk3W8u2IFfSs/aheQIoBHqVFjQujTEAaefnzOinN66yGG5hxQlG
	lwCIzowUjvUa7NzcetSfnVqlybtw8ULd/jU5dK4DzVCCNf1AZNg/xCykUP+Tq9g5FikQ9b
X-Received: by 2002:a53:ebcd:0:b0:667:cbb1:5f1b with SMTP id 956f58d0204a3-66f8745bd95mr1811244d50.6.1788248826877;
        Tue, 01 Sep 2026 00:47:06 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed2c78esm7782602d50.19.2026.09.01.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:47:06 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] media: staging: ipu3: use vcalloc() instead of vzalloc() with multiply
Date: Tue,  1 Sep 2026 13:16:57 +0530
Message-ID: <20260901074657.536299-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmu->l2pts is sized as IPU3_PT_PTES * sizeof(*mmu->l2pts) by hand.
Use vcalloc() instead, which computes the size via the overflow-checked
size_mul() so a large enough count fails the allocation cleanly
instead of silently wrapping size_t into a too-small buffer.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index b196a5815903..ab40502c06b8 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -464,7 +464,7 @@ struct imgu_mmu_info *imgu_mmu_init(struct device *parent, void __iomem *base)
 	 * Allocate the array of L2PT CPU pointers, initialized to zero,
 	 * which means the dummy L2PT allocated above.
 	 */
-	mmu->l2pts = vzalloc(IPU3_PT_PTES * sizeof(*mmu->l2pts));
+	mmu->l2pts = vcalloc(IPU3_PT_PTES, sizeof(*mmu->l2pts));
 	if (!mmu->l2pts)
 		goto fail_l2pt;
 
