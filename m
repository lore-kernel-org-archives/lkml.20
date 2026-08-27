Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09172367297
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835936; cv=none; b=PfErBGOwrGihepY4teABYuJ/8mr/V39UlELgRjT6XOKGI6mDUxsVmfvFjtgtBtKaqMJ+PSoarAjJ5L8qerlxdybcsDHa39KYJFqhjnxs7yu6Np/EIwvdjSDuosjwwGm4Rq9JvW00IvvRnmRrTHZJ1FCB8wxMhyZMlOL9k22W0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835936; c=relaxed/simple;
	bh=kWbuAeU3rZEcLpkxyQWhYiUIkF0sIct8wc2VoP6TBKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avIaGD3btqgAmwZRbnpHRgY9fbcYSCkNX0Wie05PAeNIt00oyeSsTuDObYajHDZin5zegHTJu16G/xNkGlKrrkeEkXpWapXcGizd78qnqIUbndDG2WDfM3oQO7tvZynTeI2CGwmhNPM9vg3gL6fZ6nCGITyoYkwSnRIAU1WFf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nM2qiGk3; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nM2qiGk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787835866;
	bh=URWLRJR30vRoaJ6t+h0dcOE0A9/rLwIDzZpxZ507naE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nM2qiGk3aXrMOvgTwfPEBoAhbyijwvPSJ7PCNlf89cBQJWjG8SdidCHP2jIlhdvoz
	 FTLxHPZfReSZhpx3cScaC5VnWOD7ylm5shf2IU+0JOHTWgMYD80+9Ht/01LfjyTQ0M
	 m6qiklYIQIQW+Oi+8/gZjJjVB8H7pNY+ONM4y7f8=
X-QQ-mid: esmtpsz20t1787835851tb572156c
X-QQ-Originating-IP: mTHK8769jpSroKAKN3aeJtIDyenvTb4Gn5q3LoxzuE4=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 21:04:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14667445658277018892
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH nvme-7.3 v2 4/4] nvme-fabrics: add helper for DH-CHAP secret options
Date: Thu, 27 Aug 2026 21:04:07 +0800
Message-ID: <A234F50F1018A58C+20260827130407.1391174-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
References: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MRQq5cyInCgJdQv6dhbTMzU35xbCAj5GKngjDeu1Tf1gBwdn13C0fmdC
	uA8nps4psrwr84xl4NH5VzwOTM13UT7YzpQo20j9GYVjyLMPCEMiPUhqX67EL/Tr7ESicGQ
	OvhQRWpeDk4x7HQ4LpdAack2deZ4SH6gyxEjP6Nme015njkgwDk/P+4Bd+GLYg2OTbkftwF
	C8baW5suo7fXmq8TsQCiVMrb/8KJWAX4UhW4eR3dLRGXbI0q/34f9kDBH74/QAzrBrC2LAs
	A+Jze70re/NFUpSE3cL3avszEb05P9zn6tsxy6Kv9ZQ6T07vFiVeI0R4ARO5Pj6uZA40G7u
	QljX9uEwPwC1QH8KK+BTy/Lp6NZLDzqVTzDsENG01gJini3Mr4UUou/0VBfkfMbYTF7Evj0
	gisWhFlaxTEwkMwVhZie8sUlNzQlx3cCRVgLhLfIqwBXaSAwegNtZzk1QF4ExD4xbc8893Q
	X1oDgzB07eB3DlvC5hgbJJyzZP+KKADUNl0yy9TOVcDqQB1d73wSNUyEENcC/4/KkIieUcE
	KvUs6hKDt/7aPRCmbyHeoA8Yae8qjzG5pifJp5hLB8mXfzK4veaLXSGKuw/edyGXaX0cUY6
	kACR74Y1iyBtv8LlNsfx9Un8Cefe+aFiznz7Zrj+RO9gO9px7zkx1G0u6Vk2HaLEYnb3OXZ
	GEqYsPpPokKo4dP6B9E4AH8lodOB4hITozEOVk+8Asw4KEYj87TGmjhYSjTmJb5FM0A1xvJ
	XkmOCoOEZZrL0np9stTYF+N5majatthpFAthXaTg+SWQvmcSIU+RkSHegBBGioPi/3Iu5KY
	Tp/ZXYp++EztX+PhzIWFZsFioHnKYFykooOaUIJfBaZCG3Mclb2Eiw0TnrR+EovbsEC+HcH
	S61F1/VNw7bgVBhWVQZkrZaZLf+DsjVRHj8SWemar1DFDDSRSG99neGiQmqKdHLLocWFRG+
	QYFzx6uXHPVgsnMGiHtzJj9kdlvX8sG0arr/tCNhq87DBH16Xg+L6WxFs/UzOkLrfdmeGT0
	TuBJ745AHUdSU4zs+tRVfTuubR7KXadrsOXtWaO3MrFJ4yjE0j1U0wNLbF6QsTk6pJogfrn
	A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The dhchap_secret and dhchap_ctrl_secret options have a distinct string
lifetime because their values are authentication material.  The temporary
string must be checked for the DHHC-1 representation and discarded with
kfree_sensitive() when validation fails before ownership is transferred.

Add nvmf_parse_dhchap_secret() to keep match_strdup(), DHHC-1 validation,
failure cleanup, replacement of the old value and successful ownership
transfer in one scope.  Both secret options use the same helper because
their parsing and ownership rules are identical.

Keep the existing replacement semantics for an already stored valid secret;
this patch only moves the parsing and temporary allocation lifetime into
the helper.

No functional change is intended.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nvme/host/fabrics.c | 48 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 24385e777307..dc8883d85f45 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -725,6 +725,25 @@ static int nvmf_parse_string_option(substring_t *args, char **dst)
 	return 0;
 }
 
+static int nvmf_parse_dhchap_secret(substring_t *args, char **secret)
+{
+	char *value;
+
+	value = match_strdup(args);
+	if (!value)
+		return -ENOMEM;
+
+	if (strlen(value) < 11 || strncmp(value, "DHHC-1:", 7)) {
+		pr_err("Invalid DH-CHAP secret %s\n", value);
+		kfree_sensitive(value);
+		return -EINVAL;
+	}
+
+	kfree(*secret);
+	*secret = value;
+	return 0;
+}
+
 static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 		const char *buf)
 {
@@ -1010,34 +1029,15 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			opts->discovery_nqn = true;
 			break;
 		case NVMF_OPT_DHCHAP_SECRET:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
-				goto out;
-			}
-			if (strlen(p) < 11 || strncmp(p, "DHHC-1:", 7)) {
-				pr_err("Invalid DH-CHAP secret %s\n", p);
-				kfree_sensitive(p);
-				ret = -EINVAL;
+			ret = nvmf_parse_dhchap_secret(args, &opts->dhchap_secret);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->dhchap_secret);
-			opts->dhchap_secret = p;
 			break;
 		case NVMF_OPT_DHCHAP_CTRL_SECRET:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
-				goto out;
-			}
-			if (strlen(p) < 11 || strncmp(p, "DHHC-1:", 7)) {
-				pr_err("Invalid DH-CHAP secret %s\n", p);
-				kfree_sensitive(p);
-				ret = -EINVAL;
+			ret = nvmf_parse_dhchap_secret(args,
+						       &opts->dhchap_ctrl_secret);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->dhchap_ctrl_secret);
-			opts->dhchap_ctrl_secret = p;
 			break;
 		case NVMF_OPT_TLS:
 			if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
-- 
2.50.1

