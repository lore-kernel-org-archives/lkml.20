Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA0377EC2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332880; cv=none; b=eR8/JBPfqVcEE2PmLyVaAO4vW69ELhZU6qKqA1yqxM91vTkoriSZ0nyImLpI5EyCbjUQ9xZN79DA+gcamkQty9cQvjVsXBzb6w+35EIkhFyBIR3eZnlcHSDTeCC8J76wkopRYtmQg9B7NxQAreGmVnDjKqYUaHZydcQuGn4+99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332880; c=relaxed/simple;
	bh=E2z5VxL5Xw3RGt5v4/KEBpw/NCagZi+Ml/JNW74PJmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqVwrPBUNRfwp2HeRDPyS9jQwFHmFGKmV0I9bx6CNFAg3mMMbT1gi/9TL4bfNXG+LBEyK0MFXWMmji5Cn3WmHnaasF//NsVgUZdvE+cZtqGXgC/GDWmsIvEiBAc0JnFJ3m/0vjcPcHddpPlikcaZZcpifuKn0XtuAR7OiBsgxQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmLC+OXa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmLC+OXa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d53197d8b5so6340055ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332878; x=1788937678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klWnmBIl39G/xBabfLBKbtaRH5w80OJ8IP172c6Po0A=;
        b=GmLC+OXaQkUQKH9o7JvNF/QxnOtodotPOa0yapEg9tTYgUnHdU26+fsukFU8MsWttC
         ewOLgaRLJi7mbiuib+qeO++dvLoZb5BUJcNRxSPQ1I897NYHVayddoR/hJ7pBhbGbU/u
         j8SDXcxBc0BplYWiruJk0pe91OciHaNamRa6jAoRprdN+hinq26gWiEM9svF0t6qLbRS
         vtRg8MKCbgDRMSlsasdTHOSsCLZl3ZR4MXI5XM6izKxaDjmbIKdXh9LdXQjb7cC5ZXVE
         S/u/qxtw6qNMzJ3DyVJh0htheevJjzYgQuHOTsRP1OVe7knzG6+Ru+nWwkhRg0gV0mxn
         2f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332878; x=1788937678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klWnmBIl39G/xBabfLBKbtaRH5w80OJ8IP172c6Po0A=;
        b=PMgFwfv2c8WHstf4BGryOQbwo4SD3tdni+J7esPJM5VhiAHStNI08rdtL52bPFjIi4
         7I+jyQNAFDs+sui671z9z2pFHorHQoRGnF3dz2NhfY3Xx+NGrR7mrK0rWAgL0JoHqgIa
         slX2VojfzFNYtPffHqikjKVrXvllAgehuhYBrxF3sOLGN6ysFG1GE4/7iUjoT6BcvFD0
         mTZDnx7INuRycjWA863Z5hmeVmlQlxaAvkVnCSqXt3yP5GBnBWSAkjYaW/AhSP93C11L
         FCXhOVlVhlOo/8cDXt2Qqik6RqeSBKL/UKnTFaBfdDyZak+QNRBn3H3YMyNSSlYANkdU
         JicA==
X-Forwarded-Encrypted: i=1; AKwUvBzrzAqq2QbRFjrgd2CJkDTjrTdZD/JMEjZlwkQLCY0sxAIAY9PDook95oTUCPRX6FLKzQdYVAeHdonJKLI=@vger.kernel.org
X-Gm-Message-State: AFuF++nK+/U93Iev56cxp0rFk6/MR2Lgr+FRybsTsURvt60euYzcnlGp
	HZCPFCweVdySN0P/O6AAdNXbTj+XLf96L/kKMsXpTM0gw288mnGNbQ1Y
X-Gm-Gg: AYBFou2NGXBLjL6pb5HdESsranbASyMniy5Zhfdbquxnyzjsw1RRXL1FCXIp9k72kxd
	TcRMVKmnWBSwNnjs6xNz/irLInrYyNXXn2o1sfHhuNN3RcEJC5GWtKo8EAC9UaxqTVXiQASw3Lv
	3ApCJZWRmGXcVK3pKYVYZCmesqSITVjJYZ1RErHetaPZ91J37JdBFy/G78nUy8yQip9WZx5tp6D
	zhl6h84wGLBSv5FZws8YLUzdJeyxPfgIrehQsskA+QkdJ/UR9ODVr4w7T2K7/Dw4REwmFlFljCK
	SC76QbglZF2/29Vmxi0GKmgMSOVKos93PYLZyf4Qzju6FKpLTwBaWz2f5Ej/6Xrlh9RDW0rjkWG
	wrsVk8YBUVWxj+7qzTr8+xGCNZdtX1gZdxdUK01qLkA4MbXAKcb+hqJnhXZ5hBtppu6bmbkjuB2
	2d3S6PEPHChQlb/Gh6D9uulgyd+WWTW/+xwRy64KLqOeX8pQA1g50p85VPa2o6SNN4Yux8EvZnB
	w==
X-Received: by 2002:a17:90b:57eb:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39aedfcc06amr4377236a91.6.1788332878001;
        Wed, 02 Sep 2026 00:07:58 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33f4sm4173256eec.1.2026.09.02.00.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:07:57 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	lixianglai@loongson.cn,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2 2/2] LoongArch: KVM: Fix resource leak in kvm_loongarch_env_init() error path
Date: Wed,  2 Sep 2026 07:07:23 +0000
Message-ID: <20260902070724.3459457-3-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
References: <20260817115847.2705791-1-nagachaithanya9911@gmail.com>
 <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_loongarch_env_init() allocates the per-CPU kvm_context (vmcs) and
kvm_loongarch_ops, registers the perf callbacks, and then registers the
IPI/EIOINTC/PCH-PIC/DMSINTC KVM devices. If any of those device
registrations fails, the function returned the error directly, leaving
everything acquired so far in place: vmcs and kvm_loongarch_ops are
never freed, the perf callbacks stay registered, and previously
registered KVM device ops remain registered. kvm_loongarch_init()
propagates the error without calling kvm_loongarch_env_exit(), so
nothing else cleans up either.

Unwind the error path in reverse order of registration, so that each
failure only undoes what had actually been set up. Use the same helpers
in kvm_loongarch_env_exit() to remove the device registrations during
normal teardown as well.

Fixes: c532de5a67a7 ("LoongArch: KVM: Add IPI device support")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/kvm/main.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 3e1005526f4b..c9cb3fc2e560 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -385,27 +385,51 @@ static int kvm_loongarch_env_init(void)
 	/* Register LoongArch IPI interrupt controller interface. */
 	ret = kvm_loongarch_register_ipi_device();
 	if (ret)
-		return ret;
+		goto err_env;
 
 	/* Register LoongArch EIOINTC interrupt controller interface. */
 	ret = kvm_loongarch_register_eiointc_device();
 	if (ret)
-		return ret;
+		goto err_ipi;
 
 	/* Register LoongArch PCH-PIC interrupt controller interface. */
 	ret = kvm_loongarch_register_pch_pic_device();
 	if (ret)
-		return ret;
+		goto err_eiointc;
 
 	/* Register LoongArch DMSINTC interrupt contrroller interface */
-	if (cpu_has_msgint)
+	if (cpu_has_msgint) {
 		ret = kvm_loongarch_register_dmsintc_device();
+		if (ret)
+			goto err_pch_pic;
+	}
+
+	return 0;
+
+err_pch_pic:
+	kvm_loongarch_unregister_pch_pic_device();
+err_eiointc:
+	kvm_loongarch_unregister_eiointc_device();
+err_ipi:
+	kvm_loongarch_unregister_ipi_device();
+err_env:
+	kvm_unregister_perf_callbacks();
+	kfree(kvm_loongarch_ops);
+	kvm_loongarch_ops = NULL;
+	free_percpu(vmcs);
+	vmcs = NULL;
 
 	return ret;
 }
 
 static void kvm_loongarch_env_exit(void)
 {
+	if (cpu_has_msgint)
+		kvm_loongarch_unregister_dmsintc_device();
+	kvm_loongarch_unregister_pch_pic_device();
+	kvm_loongarch_unregister_eiointc_device();
+	kvm_loongarch_unregister_ipi_device();
+
 	if (vmcs)
 		free_percpu(vmcs);
 
-- 
2.43.0

