Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDC377A84
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789838523; cv=none; b=SjORpWCLFVb5Qz/2H/lfro5yLBSgh8gaSzkKnqJQ7z9zNDTSCO5vUWwrvNG7LY2dH2V0yF+Yk8lmCLDgYd/qmqOOukStMUKqepKK62fxqq96dyGMJEIMSswZUuBGz2seoyWyjMFWViRFAyJUI3eC6/oyEFOqWHV6uzAFO5c0KS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789838523; c=relaxed/simple;
	bh=GllVSDw6kg+iLMkp+9y3znXzr+FskJwzrrqrjJ08FKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqQiylZpMe46462OoH2c0+zePsOWvZ6RaRCzXHxPteUYVSEe88mswANsoYp0YW2SDqUGZSlpxADB/DjPbFXYJloCwbMeHfL88NC/BMiO2PnjINB5hP8IpVhOdiLhcNHI9z9RJEMMtf/hpy8Ad39jUVHLW5Um82yWAkCcOcsT9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6BxKIdf; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6BxKIdf"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so548253a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789838520; x=1790443320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gd85OUKLih1FwD89RxmCVAwGTJLLVkFC9DviJqE2Mj8=;
        b=S6BxKIdfnFoGrzqs3g9+vp5goqYqsuhIoIbKTXdcPDXZfN197AO5rQgOKpdQUM/omn
         qMU5SBqHRQLw1Sdy+dJJgcFnF7GvlOW4oMNmwYs2wkwPMWvgoYqTUP5IQmCRfoa3dE5C
         lf+cAXMmfLPE3VvoFIMnCMxoPUVYQrZzLf8gpwPmpm6vCr9gZyH40ZYqixFHhWu9m73e
         zP6mT3KTm73PN0gHyKHe9SAX5kBQyzUjixBJD5CB++WueAoZB++bdNsZWQC0wS/XLof/
         Equxf/4m/q2o+D1ZDRxvMr0ZdId690vWXab0mximwvwNdgNIJwbQyReYnBLA9NZ4qfpj
         ufUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789838520; x=1790443320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gd85OUKLih1FwD89RxmCVAwGTJLLVkFC9DviJqE2Mj8=;
        b=Dc/BBhAmxMcgBeXsRq6aFtPOb9K6E9S4MVT2gBr2AR3I2mnF27rkdydcvTpwb3ueHv
         2tkioi2qH6PurD4NAqkJnsv3+ymXti4ouiRrVMi80f/Zuvv0qRu3XCe4UrK5nhNdeAPv
         7rddUlf5rkho21H7YHGim2L1NLHRbrzt0dH2e8xvrF7kEbs0Sj2PcHrKCIqq5VimmvfY
         s7fvSU6PvgxovBfZx35cWMOForM76wRtbyV2eyPbZhlohGNU9CJprvQHAAJzv/8hrekG
         S7ovLsQxYsZhf8oNUnKvyRmRinV6XjzyBLq9xmy78BIi1LscG9zQbcgzBT4xFcTUrjuz
         GBLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3xQEoUAnGaVAQf8mn0KM19RVL5D8ZWvlitIA4GRRrjZmuo/DshJ+t/QJUAvWx9Yvqegyv/wA00UIJ/NM=@vger.kernel.org
X-Gm-Message-State: AFuF++nltpgIY8p/FOuL39w2VgHLF4WHNlp3ZlBkeoavekw+mC/53luP
	neF56ymiwLf9m+G6CTAiBVXGDtp+7C6EnfKllG6aNrF1YFrz4mNnVJDm
X-Gm-Gg: AYBFou2MzVcEIZUIXnLu+9r8ZgWUULotvm8OserVoluM1WJY8IFHCcgZf/a6EZ+TRPK
	a0GPt/5yjRtTC3ViB7IxkpiIYEavfeQaol7ftWJEcntArw96Dsdp9qTLIyu+nSoRRCVgACz5nHg
	NzTO/KDFfC0oGaMzmEkLmJ0hvdgpyaDdauu+axTOUs8xl2YgPUPkFysiHN2yS+68EYCpZ9dn5hP
	KNpPhbKmO/twaQVLE1NE7Ss/BAurg0jzaCpww6gGxPs5LQsx9lmbg4PNK5WrK4a2W9a8V4K+29I
	8a2T8dPfgRT8L467Yp/qPojQOgBPIBZcqEwkg3XJYRUiGswaZ5SKz/F9yAKFoNBS/Ph1LcjXvxQ
	bXrfdGdmumn3yrynqEY0R8qM6AyKMDIGD0o3Br+n/MVwqW2tEWLRCuvZuzXll+HMxrBvu2v/lkK
	H6jbnydz0cXYFZpwE0CS+CeCE8iveMVTKgTSo4PwzuPqclrg88sGIT4DhKXLvPbAWEvBZze45Cb
	xYbmM8U
X-Received: by 2002:a17:90a:1057:b0:39f:d323:c988 with SMTP id 98e67ed59e1d1-39fd323d93fmr2258003a91.48.1789838520515;
        Sat, 19 Sep 2026 10:22:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145e5sm5773510a91.5.2026.09.19.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:21:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net] net: pcs: xpcs: fix clock reference leak on xpcs_init_clks failure
Date: Sun, 20 Sep 2026 01:20:21 +0800
Message-ID: <20260919172021.2336748-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xpcs_init_clks() takes references with clk_bulk_get_optional() and then
enables them with clk_bulk_prepare_enable(). If the enable step fails,
the function returns without dropping the references.

xpcs_create() handles the failure through out_free_data, which calls
xpcs_free_data() but never xpcs_clear_clks(), so the clk references are
leaked.

Add the missing clk_bulk_put() on the enable failure path. The
prepare/enable side is already rolled back by
clk_bulk_prepare_enable() itself.

Fixes: f6bb3e9d98c2 ("net: pcs: xpcs: Add Synopsys DW xPCS platform device driver")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc012..b415b93d77c1 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1545,8 +1545,10 @@ static int xpcs_init_clks(struct dw_xpcs *xpcs)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	ret = clk_bulk_prepare_enable(DW_XPCS_NUM_CLKS, xpcs->clks);
-	if (ret)
+	if (ret) {
+		clk_bulk_put(DW_XPCS_NUM_CLKS, xpcs->clks);
 		return dev_err_probe(dev, ret, "Failed to enable clocks\n");
+	}
 
 	return 0;
 }
-- 
2.47.3

