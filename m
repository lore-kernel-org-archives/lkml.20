Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF738A734
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488762; cv=none; b=DgSZ+BXisp4uXexHFtSDG/++RlZ5gl+UhPf8uf1iSrhU36135gc1luz2bsb/POFsaYV4h8IF8+15UIevkU4uYUo3hmbL5cAd70UIFTU/6WWoW70VmqyCts8npDuIemcf3OSumLoWXVqY0ZPj3qYOqISm6dY6BDfxKdo8uJsMyR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488762; c=relaxed/simple;
	bh=ugzVxAjTEnjShZeOxL+eJDmc/0g+rGyJoye29gd4s7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVcGXK3tj2f68Dq4Ulu3yLgAzbgEZKgutdFgyFtk8WW7hgzq8GAY3xbEWopl4YXmRr4sUaBOAQ9T79aRv5HYW2TXFEE3TlZ0SwXE7gFmcbbztmRI6n1/UjhV4RRoD+ve4UHtmG1xd0Cp92l7ejjBeCOcO8R4Q94r6mX7fD2QjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akHKFqVx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akHKFqVx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853c947bfefso429715b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488760; x=1789093560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TQ9tB7GYsgLshxgrlgtnE3BzZ3XB27V3iJEzkjdXdY=;
        b=akHKFqVxm38FokxZII2lY0rBRmePK9veAULaR0XT1TIXQE64jcZ/s1kvqdQdDpaj0H
         9EVFhvRwqYda/r48J6M44D51uG1mUV7rmBSSttdd1nj7ttoXmu7gkSfPL8mVjb63Zk8r
         Gf8pDRPsNPKnDEusApcvBWiridNSvxa4bJwVptcLxSW8QBTo8x87CDMjCSpek+a4uLkY
         xS2NI1oOpCDAw7aDRG0nrZzgdhQQjgqEQFQ/Tag5WjBjtK7qC/VxDxATo4ugvVjnULvK
         ROIZuUh/V3h0BA7cBTIKC3f3+pvaaTvLtMqsHTuSaIhsmiFA/k6C3we+DLQ1z3sU9kwX
         Gs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488760; x=1789093560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TQ9tB7GYsgLshxgrlgtnE3BzZ3XB27V3iJEzkjdXdY=;
        b=Dh5vwGhxcwYMU/PX4Bp6FcQ3mOpwR6zYbiL/qKTLxTozw3iymS/ZZziqnoz5a+8msr
         UbhkCCyKa3PmxJQBHLLz/io/q092/MpKKa5cdqzZgCcpGrYSPzkikqEpnfbZ3qcWDz1S
         8wdZsMdZHJ7DIBF0nAC8bAs/Amp62sA0BfsCaOsMVy/gBLZs1Nj97JZU+bOghp3Q80n1
         6hkL2QVuBIytjmEIytOPjC+AZSh9z7wBHq5VgAJZzhcWBdgw2nJP57e8psDfhbH9DEHB
         nLKr/T6D5u/IRuruMJSJqUUES85YuFb4pGZiGf8H4N/CGXZpHaeNlCW5E21qKcE46VW4
         8M+w==
X-Forwarded-Encrypted: i=1; AKwUvByie/r0JeBEKuCLhIJL+kP33OvM9No3NC9a57pcvPatl98OwO+vCq2QzjRp2EyWRLL3kNK+zl6xNwOhhqk=@vger.kernel.org
X-Gm-Message-State: AFuF++lUjWrSNfE3W+QcPaBY+Hgkq92kd1wNFVHRsrmLZLCxVueuRpNN
	EC+BV8oNMAGkKKyPkeuniMs3Fgmd7emGbJz06niGYzH+hDBuvVRPl+dQ
X-Gm-Gg: AYBFou2wYoZ3pQXlMHhPgkmh+QPVoeI8iBQjx3Kj1J1hhPhiltE5g1CKZ3R0kDR4uX4
	yCVXfSoQgYn82HtfWDpBqXR7ezG8cEl4764Le1j6gEZ3C8mPJN86vDW5ojYTOH35rq+ycTpGS7v
	R2nzlJOjjIFsSWM8JluWFInLYbkPs3XEY/GdTMiHl88IkDSp7KkvtAHlDiUNOwEK8Qim32NplxZ
	GNgrdim29fBtmzIouB5bvTknInxUfVQpo5Cp3SRwvJO8jDLsVn6rZLsLu3rNJWPM5euRuYOSvuV
	SO/VOsQwXonZbiNfMeqHTs+4Ji8nif+VdBNzgHbQnXWOMW5sUtaXLic8zi054zUqrGdv2M5gFbk
	kSd4tig5agenWu5lP2ILsAfo9QicH0kJ7hfobXiZ+yVPJrOdnEyCRAVXMbAKPKFspb/AlCQjWl1
	Tf2TzrlVJmpk60c1eUCa+q0I7/cM4HotPe/8hiGdpVNShW0FyZEMpHePEHLp22z2MHUT6dn307R
	BLA9dWt1xmHFGJnl1PwQXWg0f9r+CyXy6wqgpu/hK0Y8vtRNvIjuu4431o8r9jVBpoxUxt4EKC2
	L/hfyNY0Hr7PgJuCXG5CZTrCVNP/UBqjS0vIcsxhWXxjo9Ja
X-Received: by 2002:a05:6a00:138f:b0:851:80de:db56 with SMTP id d2e1a72fcca58-85ffe10a09amr8232438b3a.13.1788488759952;
        Thu, 03 Sep 2026 19:25:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f871fc6sm591487b3a.7.2026.09.03.19.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:25:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-devel] wifi: ath: split 5150-5350 regulatory rule
Date: Thu,  3 Sep 2026 19:25:57 -0700
Message-ID: <20260904022557.2679261-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow initiation in the 5150-5240 MHz portion of the world
regulatory rule while retaining NO_IR for 5260-5350 MHz, where
radar detection is required.

The previous single rule marked both ranges NO_IR and unnecessarily
restricted channels 36-48. Update the rule counts for the expanded
rule list.

Assisted-by: Codex:gpt-5.6-luna
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/regd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/regd.c b/drivers/net/wireless/ath/regd.c
index f15e7bd690b5..b129af0eed88 100644
--- a/drivers/net/wireless/ath/regd.c
+++ b/drivers/net/wireless/ath/regd.c
@@ -43,7 +43,8 @@ static int __ath_regd_init(struct ath_regulatory *reg);
 					 NL80211_RRF_NO_OFDM)
 
 /* We allow IBSS on these on a case by case basis by regulatory domain */
-#define ATH_5GHZ_5150_5350	REG_RULE(5150-10, 5350+10, 80, 0, 30,\
+#define ATH_5GHZ_5150_5350	REG_RULE(5150-10, 5240+10, 80, 0, 30, 0),\
+				REG_RULE(5260-10, 5350+10, 80, 0, 30,\
 					 NL80211_RRF_NO_IR)
 #define ATH_5GHZ_5470_5850	REG_RULE(5470-10, 5850+10, 80, 0, 30,\
 					 NL80211_RRF_NO_IR)
@@ -64,7 +65,7 @@ static int __ath_regd_init(struct ath_regulatory *reg);
 /* Can be used for:
  * 0x60, 0x61, 0x62 */
 static const struct ieee80211_regdomain ath_world_regdom_60_61_62 = {
-	.n_reg_rules = 5,
+	.n_reg_rules = 6,
 	.alpha2 =  "99",
 	.reg_rules = {
 		ATH_2GHZ_ALL,
@@ -74,7 +75,7 @@ static const struct ieee80211_regdomain ath_world_regdom_60_61_62 = {
 
 /* Can be used by 0x63 and 0x65 */
 static const struct ieee80211_regdomain ath_world_regdom_63_65 = {
-	.n_reg_rules = 4,
+	.n_reg_rules = 5,
 	.alpha2 =  "99",
 	.reg_rules = {
 		ATH_2GHZ_CH01_11,
@@ -85,7 +86,7 @@ static const struct ieee80211_regdomain ath_world_regdom_63_65 = {
 
 /* Can be used by 0x64 only */
 static const struct ieee80211_regdomain ath_world_regdom_64 = {
-	.n_reg_rules = 3,
+	.n_reg_rules = 4,
 	.alpha2 =  "99",
 	.reg_rules = {
 		ATH_2GHZ_CH01_11,
@@ -95,7 +96,7 @@ static const struct ieee80211_regdomain ath_world_regdom_64 = {
 
 /* Can be used by 0x66 and 0x69 */
 static const struct ieee80211_regdomain ath_world_regdom_66_69 = {
-	.n_reg_rules = 3,
+	.n_reg_rules = 4,
 	.alpha2 =  "99",
 	.reg_rules = {
 		ATH_2GHZ_CH01_11,
@@ -105,7 +106,7 @@ static const struct ieee80211_regdomain ath_world_regdom_66_69 = {
 
 /* Can be used by 0x67, 0x68, 0x6A and 0x6C */
 static const struct ieee80211_regdomain ath_world_regdom_67_68_6A_6C = {
-	.n_reg_rules = 4,
+	.n_reg_rules = 5,
 	.alpha2 =  "99",
 	.reg_rules = {
 		ATH_2GHZ_CH01_11,
-- 
2.55.0

