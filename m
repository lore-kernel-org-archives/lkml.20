Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A86349B19
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207307; cv=none; b=WL6q31I4h+ORNiCarjEd4V6HzFW219bftjLRwrvwJXciXuMhMx4tM0P3MnDUh63UfrSkX6nD/wIm34PRM11/vKGgWIp5ELI3yw/r0t5mLTbYXfnrmZhPFTMC3v7H/3cD+TWkaGFK5UnOQKjBlKirNpGkA1X7b1Oi9kKBZHNXoUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207307; c=relaxed/simple;
	bh=fQu8h00EssdjX+65ajgh6Z7/h4WGYUevxgzZ1eNMofw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4p0gcAbxQfHAjxhOUKdoNvW7oD/OHDNNiEfZmSGSRJ+aQu9S4J1FTyobEAlz+CM8gMloRcwi1R0fbeh0eCp2Osx2ZCXTqwhHiqPFVYgN3VghIK5fSfdbSCUV2oLTCtTT3hdfUiXmmSI9LLiLion2HW3GeDh1y1seA+V3lUDSzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9waZS0K; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9waZS0K"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb0so103143285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790207305; x=1790812105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR6Sw8KFOfic5kEDry7AfTNaMY9N/L+deT07wNcYwmc=;
        b=i9waZS0Kw/MSqlBl1uxkfnZnp3BusxxUs0VLI+hwq+SU0fkfyd402sGZxdwcblSnnJ
         wRqdIdUxT0DytJWRzVJamMM40wecie1w06bDZhZoVMO6Xez98hdyq/9ZG3GcY09y95s5
         bEXPnJwWmOmrNtIbjMypRU4FVbrFYqlDcPxka0FfOHj7zCTrdchBq+b2cpL9oGfuDv0B
         RqJoSNVh+lQRgIw5Z30Cd54/mFw93PX4htRp12+9Fgdx93og5WR/g0ZQAjqDTeWhu+zZ
         uN1UW5C0Df+Zvqrrk+031Zroj4wptddWTHRmK00qCoYGnQ4pxWI0W7zZ84ztbo8gBtQQ
         NW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207305; x=1790812105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR6Sw8KFOfic5kEDry7AfTNaMY9N/L+deT07wNcYwmc=;
        b=mfheKJKaSGrFTKGtyaoiLzd8XehPusVyy8u2mPAo0T8HZ/h/xiOKORRMeA7KHFZoFF
         kZ+JLd+yc9fyvWgWCvF8wakmVZx6swpjFwR0PpFx0xsQt0R6KRIw0WxyChj2azU+zYzO
         lPnDDPpYtjc4URUb69JT87hGLrY5MiJsc+SrVYpXF6WnIkZe58fp5+3k3C99wAFhGeqq
         KmUdq/DjyHkrLzHIV5maaQHPCkxj9U/NvoHmbsECEGaX3K1kNYJYABYx4IuUElUFFFvc
         kO6Y9UVIlVIPAchERsBhd2T9Dc+ZekB5boaDo4wgWBMOmjnPpb5+eWFoVoW9+NjNB6L8
         wtJA==
X-Forwarded-Encrypted: i=1; AKwUvBw3LebsBTnHGfuQ5WCrsV5z1/HpnvL0dnTcqaWo6wgWlK8ot761/CUMK0E68IHv/gPRzpgRGOgIPi0jh0w=@vger.kernel.org
X-Gm-Message-State: AFuF++lcHHB10I5MVy1wdQuzyMtHMnsL/Zbwl32Sw07qzI45gq/lXLlO
	oDuGXvdilrLxjvPzWxV38P0mGCgxneP2ai32ITHxS7jWpnJow90P4j1x
X-Gm-Gg: AYBFou3CcliapcQfwG9kX65DeadmuaThx2nqakoXUfybAviQOMIUfuiaUxE1CZkxcy7
	qZNP7aPrqax2h4om9agMZkLXhmHBSHB8Qo5GEXqZK6XJSXNHPIIzXHgff8qGzX7f5to/rWc8E1c
	McYIT/0d83fNMDrsfAB3EipEEUlY00Q/9yPWKIE4MgLujaI61GHo6JFAMrZgl3L7P2dHr9+3+kY
	zb93oxgzbr/oWxAFDjZ0rHlHBkINiepw2V4Ed2QiX35HoQbZYIGeDbHOcNuGnXNF80LZk45LZjQ
	94PuQq4GAt9nz9Ce77NYXrUAme1SIi2yAxHvByKfvzPp/Yri4jp/MmiD9rSS3ZNtGLW5z8nguAJ
	7kOyS8ECA9aL8fgDCiCHXCPEtsk//ICaS950o75zft77KwTBSSr/xL3FvAjqp7j2QcVYzjCLVvA
	8FxCPaUzxsMSBRKgqMBOijhJlB42OY0JqbIZbzqyRIKOmPFLwVq8pUt413AAndkNq9p8gjlXRdQ
	Sk1yYKp2W0MnsPbZ7Fy7A==
X-Received: by 2002:a05:620a:448b:b0:93a:3aba:a0d4 with SMTP id af79cd13be357-93c3633a150mr43043285a.27.1790207305188;
        Wed, 23 Sep 2026 16:48:25 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248a1481sm334514885a.35.2026.09.23.16.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:48:24 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH net v1] idpf: Fix vport IRQ name leak on request failure
Date: Wed, 23 Sep 2026 19:48:06 -0400
Message-ID: <20260923234819.702327-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idpf_vport_intr_req_irq() allocates a name for each vector IRQ before
calling request_irq(). On success, the name is released later through
kfree(free_irq()), but when request_irq() fails, the error path only
unwinds the previous vectors and the name for the failed one is leaked.

Free the allocated name on the request_irq() failure path, as done for
the mailbox IRQ in commit 9bff30482c10 ("idpf: Fix mailbox IRQ name leak
on request failure").

Fixes: bf9bf7042a38 ("idpf: avoid bloating &idpf_q_vector with big %NR_CPUS")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 defconfig + CONFIG_IDPF=m, W=1).

 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index 4311ffa30bb1..e7d5e7923371 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -4073,6 +4073,7 @@ static int idpf_vport_intr_req_irq(struct idpf_vport *vport,
 		if (err) {
 			netdev_err(vport->netdev,
 				   "Request_irq failed, error: %d\n", err);
+			kfree(name);
 			goto free_q_irqs;
 		}
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

