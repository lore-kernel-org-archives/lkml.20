Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8873B3C10
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766998; cv=none; b=ENyDp/pKqaLflCPQzuBbCBOBFLAb7x4GEaMmOoSCVjE945J2dGZdV4yh2/Mgp1+mDEAOp6E0wFKie4nyjdkie0G1t4zjelxHE9Y60vvXaV8UKAJr++ifSxxA2ZPzByMoiHwYXyuJwFRSnMikAIBMQzwWwsFBvYdJQ0CIZXCRWzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766998; c=relaxed/simple;
	bh=jyUD4aMy6hVbWC+FaesKvRIuJb1CpPKN4jivhsYe5zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+m7n5mIFqorVKt84LP4HAGHOxz998m3/xeQ3O2SKCOgvs8/Di8DfyCGZUzhq9Nc3slnCKdNzc5PZnRnD2d5ZosuqB8zKoU/4zhMiIWNodn/7orb3H8KDXZ/FfiZp4nkm+mmAp6ATr1wNxrG2EpvV6WpUEx4i/tfeJU+XEswczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1y1f4hz; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1y1f4hz"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so3176755a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766997; x=1791371797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SD1WRmI1pUkxY4BFxQyfL12jOZ1sUPFD5IX10ds1u8o=;
        b=G1y1f4hzpZa8PtIBSBBu6/kMxjhYYGcYdLAmWkU7Ghc7zkXnZKmqjCz0jMnL5rnsa4
         mHGJ4Ohi7sYR+HO9y4aT2aNWrvizlzw32vohnOncSVekdK0xx4ShAY/VMCC8bZx/5S+P
         AyyRzWpGOcR6vzHPECkK8RPvq/dnbAlAuKItaSbdHKQzSNbu0oMumwLOO/0w8uiQmKXY
         dZYQkQAXZycRT6eeCK7UgQ65sUt0yJ6/akZKBbpUE3GuE2DrWSi4PF69jZUtIhIEXw40
         y4S54rCv813k9Xi9aiqrSJctZe8Wyi+63ZGV+nYm9V4/I+A7ABBmrzI3PKQaBtFKURoK
         QpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766997; x=1791371797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SD1WRmI1pUkxY4BFxQyfL12jOZ1sUPFD5IX10ds1u8o=;
        b=knWusp2xqS/EGVWo4bin3fZLwjyBBCIAKfe7REPfP4rzbMqmEKvwqLP/p4QWcdgxR4
         vhd4+mnak4lqtbREQa0Juhj7JuMcGuEKcNoJQN7gwnajRB2PB7NktTVguaAZ+zBYq6bs
         9hyHuk0mWxLZzcdi4DrLsH6kAUIUwHAoGjYp99Em4xi5OFaPxoVrB5Zdhvfj4PmKy510
         oP5FO7SUHiWdKzrLDXQeuerLOayuPZ9DS9wTq+Pso+ixo28cDSjABGY3OfAryy+OHNxC
         NvyjryGmdhGIav3XjarTYgwxFRXvY7KfiOufyMjSe3VmWdrwGlMLE20RuBLDi8lvE9iw
         bz5A==
X-Forwarded-Encrypted: i=1; AKwUvBzCGmiCbO84ACI5DVajsItX59IckaLmqvleHbT4uqe5OSjxLesOHAjt9gjfO/9YejWm/JvKKb/m4T9QR4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfZ+gZ5PvmDrmLQ2/cYlcUTuxxcY/nxtgSs9F70GckjpLxxvzw
	7vX5G1JTeTHbwlWX5xHUg/Yp2U2xiR089WqQC5iq2WGqOHSHIVi5CbUU
X-Gm-Gg: AYBFou0gbtotD6ft6m3YOk92k4Vng7jZuoPkBW/kO2jsCVSJjCp/NcP0xwZid6rgLeN
	LpMC/hnjzpC0KdJ6bh1dpq/kG4q0LD1/lamp4Rc9BCWmLiK8a53gtuOPuRYuru9WO4PoQq1IWbJ
	10K1aQoXtToQK010obkFvvn7PV0m4l8omPVqBzXG5E9lQVZs/jnzFVZKxxybGh+2WDNFOX/7qlg
	pahcOy16LBlOwfD7HTitdOSCN9XYN5aP5HQ6hGZIyfVPsVTVvDIjTml4IFl2stegNPpXof+0I9W
	1KU8LV1S+imo3F92Yblp8AexLA2zlyIzGeQWvTT3txnjuiixowNg5MS1WItIRgtVOpVFfAwa1Ji
	Wqh7urFbwKw5Pp5XQaPk3MIPiz1LuLu8VwimvDnumAm+PVDq1BnBlajO9rsAgJhW2hRCAcbXthA
	DA1Cak7b34QXNikFtAN97SRX1GncpnpO64SSKj31/5hU7qJaqovrzMgmFc6DCm9sXkHqelM9Acj
	T00dXDTXOc70Dj2IpkfI/xi6dVysvyraUGv5lZsHJ6w7rR+pOvmKTQRaHc1PskWVeonimC8qgtm
	zyCt6u8hmGV7eHUTd+NnhagdaaP34dRk9dI=
X-Received: by 2002:a17:90b:1c85:b0:3a0:ab20:9e97 with SMTP id 98e67ed59e1d1-3a4d197a3f7mr925070a91.15.1790766996084;
        Wed, 30 Sep 2026 04:16:36 -0700 (PDT)
Received: from rahuls-x2elite ([110.226.112.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca9c6453sm3180524a91.7.2026.09.30.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:16:35 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: geni-se: don't fail ACPI probe on a missing SE clock
Date: Wed, 30 Sep 2026 16:46:27 +0530
Message-ID: <20260930111627.1121-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

geni_se_resources_init() tolerates a missing "se" clock for devices with an
ACPI companion, whose firmware manages the serial-engine clocks, but then
calls devm_pm_opp_set_clkname() for that same clock unconditionally. It
fails, so ACPI GENI controllers such as the I2C IDs QCOM0220 and QCOM0411
no longer probe. Before the OPP call, the error pointer left in se->clk
would also have reached clk_get_rate().

Treat an absent ACPI SE clock as firmware-owned: store NULL, which the
clock API accepts as a no-op (clk_get_rate() returns 0, so the I2C driver
selects its 19.2 MHz timing table), and skip the OPP clock name. DT
behaviour is unchanged.

Found by code review while bringing up an ACPI-booted Snapdragon X2
laptop; compile-tested with arm64 defconfig plus ACPI and W=1.

Fixes: 5b8a39dcf909 ("soc: qcom: geni-se: Introduce helper API for resource initialization")
Assisted-by: LLM
Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2..5d4b26e95e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1203,13 +1203,23 @@ int geni_se_resources_init(struct geni_se *se)
 				     "Failed to get optional core clk\n");
 
 	se->clk = devm_clk_get(se->dev, "se");
-	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
-		return dev_err_probe(se->dev, PTR_ERR(se->clk),
-				     "Failed to get SE clk\n");
+	if (IS_ERR(se->clk)) {
+		if (!has_acpi_companion(se->dev))
+			return dev_err_probe(se->dev, PTR_ERR(se->clk),
+					     "Failed to get SE clk\n");
+		/*
+		 * ACPI firmware owns the SE clock and its rate. The clock API
+		 * treats NULL as a no-op, whereas an error pointer must not
+		 * reach clk_get_rate() or the OPP core.
+		 */
+		se->clk = NULL;
+	}
 
-	ret = devm_pm_opp_set_clkname(se->dev, "se");
-	if (ret)
-		return ret;
+	if (se->clk) {
+		ret = devm_pm_opp_set_clkname(se->dev, "se");
+		if (ret)
+			return ret;
+	}
 
 	ret = devm_pm_opp_of_add_table(se->dev);
 	if (ret && ret != -ENODEV)

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0

