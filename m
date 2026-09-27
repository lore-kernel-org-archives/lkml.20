Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEB33E0081
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518295; cv=none; b=hDiX3JWhUQ0BdFZB6uCpxFYVA5wYRKf17TRvGWOLNPj6UEUmmlMkfUhfeEgN5UxkCEKgvpTtc2wQDj7bbq8Je4moKC532lFUgOib8FtZXsVR7EOZ0OpMgJFTnnuqj3jXeGwPk3wePaOIhbQgLRsPkKXL+Tv/lJgg5AH2+CU2n7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518295; c=relaxed/simple;
	bh=Jo6hKbGHkm66l37ZDevFtAWN03dbYRZ9E9ZLUdKNAog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TGpP+c9iBbW1pYjQOOvKi1mjg2svtlRW80YyzXic7VfqmSC3AoWeKg7kE9hLgHXlXYyk1O1rlxn+7MSI5nbhyXq25gstzfgFyRtdaaKD5uRkfDn8r3TpBMStKiHgAYosunEohu8SiXkSgBaB1MU70pU22nRzvuLO0MO3v0A+5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHX6xW1G; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHX6xW1G"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1861715f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790518293; x=1791123093; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q66d7dJ6XGqTvsuFbKIhtLnO/AdCHdZe6HhcW+GVCsU=;
        b=AHX6xW1GJFcUR0ZznYXj7c09CUXwD41fA3/GddGck6fusgizAsJvlWTkuUC9FE8LMk
         SypbjSRKP94OLftWTouKgkGx5ytIvMTiOsgWy9Eq4w+XtXnUtuSA1aYnyH22a4nWbwB5
         OnDqVctmxEdVWYde7VUrqTwjvunsHRYAGEGYLSDDv23LBPg7ck4l3othzLSHnbc/RykD
         LOQdk9FIfUpqyQqs4uZreiGcAocWrQKVzgSozFq/tdblJuXew1T5EErkwFDIIs+g8QHg
         16+IrtAxgCy/UOVgJxm2KwQACdE0MyIVZPY7ma47dqbpcArYxUZXimwHKtAJ6SXPFDKf
         URTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518293; x=1791123093;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q66d7dJ6XGqTvsuFbKIhtLnO/AdCHdZe6HhcW+GVCsU=;
        b=klOEjw18dLfJLDb5/2vg9W6GXKcWKrSuVGfJvezGxDPHlY89CC+QKBrMoJ7l7vCkwg
         xH3eMOjqUBnfDCEZ3fw218H6A2fW9aTq39Ci8qESW7KucaqtWpI1dCV54L9wmyvX4ysU
         AF8GqQB6XFszTAxgRIiU/YN5AofLthTYDysLsW2Iw4knGS1e4KsPcsDk2Ml/5DPGWrtn
         4p1ByMbOZ3LtR8bn4DRW4HYKfEEnNJoyJ0k0zpMO7VPIwNwh0FjPOe4o3ufHJhmttNB2
         yn7pOyyAKcepnvhmdtrpJXKP2yFmGi3zYNze0TL+e9cV785vSrQ7tFAr401o3e64Fv61
         x/VA==
X-Forwarded-Encrypted: i=1; AKwUvBxZZt3+kjKUCK+h+BI8doKS1trrE2Bp8188crG/NXTvPKrbDtHlii+kpwqjkMF8nzbFUW8n1NBGHYN/sWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfTeN2TKUl3ynTiIXDQYBGJqepsBJE8QuocKX8G7QXNByMTEsz
	tmIbvNixNVSU48vsMMrTTJJ8tz65JsyFK6qx1SISNKoXXt63qSmEM08L
X-Gm-Gg: AYBFou2M1MG09Xkvp81v0Q/OxhlInQGiBzlmPy8cnKPraOa2p0itOzLYvjhVC9AgYGt
	4c1768+PHdqxKF6c3JFwxYU11/FGpS9dHzFJI7vKMZ/mNqpf/7a4+/MnkNlvDfW1n0mAy8ZPOWy
	k8k2P/+weUk1Kyv1+T2isaMCEgikrN7QigZAVhzJhnea96c9amFKEl+ma/KXxzueLRccyB2S98G
	FJNyEMxmv319kqWOwPuWrG+v3Ukc7AHJdq31plm9V6cbKq+EJUC7jclunIsBZQzYT/3CeaELbWs
	APYEAJXbP7aFKJ7ssGPzQCz39joKAtfnRayZ8KUQ4KspHaMnK5+o/aRBTzv8IGtY90rjFv2a6vE
	5qwkkHwF50tNndXvIMiBl/H19RRaH5A7YOwdxu/JY5PdFyf7TYKu/G+qneNYKJ9dWCLVflQM6F5
	5fXwv5PvUS2XwZC2GkI0kv8S4Hc4bsvnOy4J2kGlXm963jsuZorcmfM2mZ+vyLy0B8yTnRE9NH5
	5+jXUUUB8ZdwQydLfAX92GOCNSK/HqtUagN0w==
X-Received: by 2002:a05:6000:4703:b0:487:242a:c020 with SMTP id ffacd0b85a97d-48872a5cdb4mr19193713f8f.6.1790518292615;
        Sun, 27 Sep 2026 07:11:32 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a640df9sm19930964f8f.24.2026.09.27.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:11:32 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 27 Sep 2026 16:11:22 +0200
Subject: [PATCH] spi: spi-qpic-snand: drop ecceng_to_qspi() macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-qpic-snand-drop-ecceng_to_qspi-v1-1-993e9ec1c2d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqEMAxA0atI1ga04gzjVUSkptHJJq2NDAPi3
 S0u3+b/E4yzsMFQnZD5JyZRC9q6Avp63RglFINr3Kv5uDfuSQhNvQYMOSZkItZtPuK8WxLkfl1
 at/TUdR5KJGVe5f8Mxum6bt5mwiFwAAAA
X-Change-ID: 20260927-qpic-snand-drop-ecceng_to_qspi-e5fb12b5c33a
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The ecceng_to_qspi() macro is only used within the nand_to_qcom_snand()
function. Drop the macro and use the respective container_of() macro call
directly in the function instead to simplify the code.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 9d626cee3d17..40ec6a3769bc 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -63,7 +63,6 @@
 #define ACC_FEATURE			0xe
 #define BAD_BLOCK_MARKER_SIZE		0x2
 #define OOB_BUF_SIZE			128
-#define ecceng_to_qspi(eng)		container_of(eng, struct qpic_spi_nand, ecc_eng)
 
 struct snandc_read_status {
 	__le32 snandc_flash;
@@ -168,8 +167,9 @@ static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
 static struct qcom_nand_controller *nand_to_qcom_snand(struct nand_device *nand)
 {
 	struct nand_ecc_engine *eng = nand->ecc.engine;
-	struct qpic_spi_nand *qspi = ecceng_to_qspi(eng);
+	struct qpic_spi_nand *qspi;
 
+	qspi = container_of(eng, struct qpic_spi_nand, ecc_eng);
 	return qspi->snandc;
 }
 

---
base-commit: 926f9c44a76fe9e722180d0804c607c6cf1ebbb4
change-id: 20260927-qpic-snand-drop-ecceng_to_qspi-e5fb12b5c33a

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

