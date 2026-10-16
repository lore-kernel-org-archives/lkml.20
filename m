Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F3730C179;
	Fri, 16 Oct 2026 03:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119825; cv=none; b=ExRJ0oO+2hIQvj+/Qk6WDKGYKe5/cT6kahgkd4TwTiVPrXlRtzfYxb9S6VVwkTQz34Afa0R/WTBB03R2Jk6fwQVsMaccq/aJRtuHcn+bbBUbgJyhCNjuI5MZIDzUuhXO9UKkFn3bHvM3dzlLjdXYBA5fqegk7TnT94hf56vtGCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119825; c=relaxed/simple;
	bh=Xi7EsVYX6CAbM8V/DzljJmJMYKLfTwIB0IZ/ZNYSC9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VqMh8T+xjEgM3wRmQ6aBYLQl9fNCXXW1fhwqy2g1fxBA0McgsqyX9koqyqq/N8muuJZeVuTT+TpxeXyx/3LUlgFcHnFhZYEGMlSElQiesy3CEuuMOhN0LcT3biW79LyCi0os03K0BQfpNwtPWTtCfSljp7OzormvqOFK/zhGyuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CQyA4HKz; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CQyA4HKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tw
	zUKFVYGVP8yWb+Kf9SURXQL/PTz0WDDgmonnrsu3U=; b=CQyA4HKzzzkTlNgVXB
	qBIKh7lW8EZZaT4Zl9edYW+TCcquyGABUDNYL65OjYPFVcSazl5ppy6vrwH24Xlk
	S5xd2s11klR3qOpP4r5vNRz0hyI5DcpbFZF59/dhnRrvzmgkXrmDRZDxg81T+rPR
	9M12WY01bGT/hXtF9fBTJ5bR0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnfybzk9FqNkeeAQ--.46746S4;
	Fri, 16 Oct 2026 11:03:20 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 2/2] bus: mhi: host: pci_generic: Update DW5934e autosuspend_delay as 5000ms
Date: Fri, 16 Oct 2026 11:03:04 +0800
Message-Id: <20261016030304.13677-3-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016030304.13677-1-slark_xiao@163.com>
References: <20261016030304.13677-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnfybzk9FqNkeeAQ--.46746S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruryxtw45Cw1kAw47tr47urg_yoW3Arb_Cr
	Z3GFy7Gw45Wr92gwnaq3ZxA3yrK3W5Ww1vqFs7tF95J39Fq34kXw1kZr95Ar9IgFWYkF9r
	Cwna9ryfAwnIyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRk9NztUUUUU==
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC6BgylmrRk-iQjgAA3a

Based on user request and Qualcomm's recommendations, we need to
set the autosuspend_delay_ms for DW5934e product to 5000ms.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 680a63eeedbb..123efbd56db4 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -672,6 +672,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
 	.dma_data_width = 32,
 	.mru_default = 32768,
 	.sideband_wake = false,
+	.autosuspend_delay = 5000,
 };
 
 static const struct mhi_pci_dev_info mhi_foxconn_t99w696_info = {
-- 
2.25.1

