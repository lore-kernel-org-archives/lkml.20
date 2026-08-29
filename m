Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E8335F170
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982257; cv=none; b=ptM7asz8zHioxUOKxI1TB3fuVoFsZU8NHUCy21rQSPDM43rZG/IdDPKUSZgsR9bVes44yonbUpY56GdaUqoq4Xt11sEMdH7+aSMVPuJQ+UaFKOBFJHRTDsSejlfW+OkHs5rv+R72QpiTg2wLPdAJZVqGeyTlYoAOa/5ZETPWQ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982257; c=relaxed/simple;
	bh=Sx82Mbp5lO5DjoKy80dsNlSHsxmeRD7u8l6pGGCMoDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MonkjzYcs/4yQAk0yRlK8MUC+BUamPm9SCXfzS7P5z2sLCOrcja8ZZ4hRYtTQ3Ve/DfPh3qcQ6nWBTyFAc+aCnZUL5KstCRVFWTeN3DKMTbEf79L+tGhwL5Xm8VwiC8bavgi6fBUWi08lrQe2d532+9SN5nQCe+nFen6nyQmjwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e78diXwd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e78diXwd"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b00d083818so2650927e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982254; x=1788587054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mKYBlq5Au3+HGNkg1vfOBKHH7P2alX9eeNg+UdnZVyg=;
        b=e78diXwdS7g5gUbpLAASowKGW1EdigBIid6IwdsKXL3wZwCAc5oH8Bj93zmBaLhXLS
         YxDdJ52dzeMKr0niuDkNuAHUhS3XFyqOc/nnfuzHTvsQL067zESg2Ffn/BBu9QUCia1t
         xii3oLLpJdizenTNDp+oOal0MBRlUO5VwZ++GK7lN671pGBxU36nmwkE/L4UnVrtooj0
         l6OloYR/+1T6Gr0lf1KjaPy5Fco9YidMbLWTJONpTsrJ43A91Qt0OPbFW7AhEtcoarbY
         f4BW2gD/Fp/rlQDUvS6msHEf9+GhxsY/MGlnvD1t8Dw8nqMSKOdyvDd4evRWBtpF3EFS
         +hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982254; x=1788587054;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKYBlq5Au3+HGNkg1vfOBKHH7P2alX9eeNg+UdnZVyg=;
        b=d9rBPQZkYcQeaHrUNLqapUoomrqOp4onNeg7z2LKt3eViaicMis4R/J/qyFr5LOWmC
         0HKBFFqAib2R7pfmwv3n6S9xwow5lTZmn5BbWKLiVWTPgjfml7wL4DGitUI3kb9yMgCf
         PJkDDx6klNA5CMs+U9ZRwPa9eCxxu1CVechzFDa7887ClGcLE3xpAM+MbChVlHF5JqDU
         UPEtX6DS75dnpXdE7dhjvObQ2UiInKarPBUcMLg9vVTaxoK2hCZZyKip2fapC0Cu1VXz
         TsAlIKRgsW0KIfR9IH3tKneSwwU2gKYu9K26NfSRvVo1GqsADTBNXNVAtwUIHiFue4Tq
         z47w==
X-Gm-Message-State: AFuF++mtO8pXAfv7C6xe7Gn8CU+x3Zkuvtw3Hn931dPW2Lr3y8oU44ok
	yvrmHFb8tSeBMJmU+SO6rczAw6GGEHOvNn+8Wb49w24q1pfnOLx2qAw=
X-Gm-Gg: AYBFou0WnqekPdwBWmKwfQU7LVMXiEjPkvaU8+aiyZp3krkL9Z1Cqp9/Nqh/mPlrSIb
	kmh9Ajy3iR+wknwVkrO7UCiAo4KejCAwKNo0wt0EMuSaJsL4dps1keXbctBJWzjE+L7l43UhhOz
	qmKiX2ZxEGAMDrFGufd2kJjp4Es2ZO/ZSt3wB5UFqg9kAdlNRNVFn+5FTs4HN6KVumi6unqVZTu
	PoEOhcazLpDcczQMXR4IJjEtK2YbTKyp0e6F2e7Wtlmd4oU7adZ/w9rGQuvJsBe73V5Vw68qEqs
	X0MUFceKO9oAqheV+BlapqU5q9P4krBgBjTP5cTvBVVzjEVtwCuFQcPFLSlOEBnuAqf81awPgpb
	a7gFDQC3vUEUovtE55VPbrjzJAea81a6e3jc8mG17BVLPeuHBMreRuHaoruH+kOwTmi3TjppLjw
	P1s/8W3sJEHQU+XzCXFWkVh7RKHl9HcMol2bcWgmQ42yxkmHNJGma2NcL9jBgR2G662QAW+6mvS
	t7RNjCB73kQVC2slDv30qxxt9HgK1ysQex36pluw+v3tU7yPHWadYw+BYQ/7zdJZ+UE08HcmbB2
	6SmYOyCUCrS9Nd4=
X-Received: by 2002:a05:6512:3984:b0:5b5:8382:7dbc with SMTP id 2adb3069b0e04-5b583827f4fmr4057128e87.10.1787982253727;
        Fri, 28 Aug 2026 22:44:13 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b86sm803040e87.12.2026.08.28.22.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:44:12 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] wifi: ath9k: name the register multi-read limit
Date: Sat, 29 Aug 2026 08:43:58 +0300
Message-ID: <20260829054401.1198574-2-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829054401.1198574-1-nerijus.bendziunas@gmail.com>
References: <20260829054401.1198574-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_multi_regread() converts the addresses and the results through
fixed eight-entry arrays without checking the count it was given, so
every REG_READ_MULTI() caller has to stay at or below eight to be safe
over USB. Nothing says so. The only caller that exists today,
ar9271_hw_pa_cal(), happens to ask for exactly eight.

Give the limit a name next to REG_READ_MULTI(), size the arrays with it,
and warn rather than write past them.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 7 +++++--
 drivers/net/wireless/ath/ath9k/hw.h           | 7 +++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 6de78ae85726..7fdec25c76ef 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -258,10 +258,13 @@ static void ath9k_multi_regread(void *hw_priv, u32 *addr,
 	struct ath_hw *ah = hw_priv;
 	struct ath_common *common = ath9k_hw_common(ah);
 	struct ath9k_htc_priv *priv = common->priv;
-	__be32 tmpaddr[8];
-	__be32 tmpval[8];
+	__be32 tmpaddr[ATH9K_MULTI_READ_MAX];
+	__be32 tmpval[ATH9K_MULTI_READ_MAX];
 	int i, ret;
 
+	if (WARN_ON_ONCE(count > ATH9K_MULTI_READ_MAX))
+		return;
+
 	for (i = 0; i < count; i++) {
 		tmpaddr[i] = cpu_to_be32(addr[i]);
 	}
diff --git a/drivers/net/wireless/ath/ath9k/hw.h b/drivers/net/wireless/ath/ath9k/hw.h
index b942b8303d8f..946c4d307b91 100644
--- a/drivers/net/wireless/ath/ath9k/hw.h
+++ b/drivers/net/wireless/ath/ath9k/hw.h
@@ -83,6 +83,13 @@
 #define REG_READ(_ah, _reg) \
 	(_ah)->reg_ops.read((_ah), (_reg))
 
+/*
+ * Registers a single REG_READ_MULTI() may ask for. The USB transport carries
+ * the addresses and the results in one WMI command each, so its buffers put a
+ * hard cap on the count; callers must split larger reads themselves.
+ */
+#define ATH9K_MULTI_READ_MAX	8
+
 #define REG_READ_MULTI(_ah, _addr, _val, _cnt)		\
 	(_ah)->reg_ops.multi_read((_ah), (_addr), (_val), (_cnt))
 
-- 
2.55.0

