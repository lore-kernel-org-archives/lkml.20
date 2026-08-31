Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E013B47C4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160372; cv=none; b=C2V2BvaANYncy5qpPXlfhcLAATBiR/GTWvnYcztx8DF7NiBGxqsu4wla9UWvzgbevgUsnK75HEJ/i6SgrTvrKtP+VWHSIi0SFY1zbKGuzq0VMh6PV+Zc2nD9ZEhBrxSMO+fIhPDH4XiOfKeKXwQ50wxXYfxjQHNtTJkXh/KZ7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160372; c=relaxed/simple;
	bh=4CRDX1LWJpVWaFDqfWK7eMRv/MyXu8h5n/dReVzx75I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3DBQq9W62p9HoYS7bPI222oT6DMMMREZ3KhajD/PDp6GZcY4JetOsqGQTPkupgaArhH1TVEgGsPnwqwI7N5DPltH6FX3ghXgwyENB3er2X0riqr1gXPD6Ld0u+OaX4c4J8I3Ocs2clpXE2u5sLdwQZ1dx4dfwmIEzIzdq73nuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Dj++rs6p; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Dj++rs6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788160318;
	bh=PcaU8lb3oJj5WuAfj6w4L5H3SWpj2dSt7KUf4MB3SiQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Dj++rs6pzbvsQNmG3xWg5R3x+CDom0l6GJjuxPhmouw6yjTypRFgY4srETzHcuMa7
	 aYeOAmaOQRcULpj4Rd0feXbK5+JWh2VWCZNzoBVCA3CBCuOlALqrAaj+iMNM5SDtc7
	 am9akZR/ihaQZ1NzfrfgQr8AdhHLAc1wjJ62XslU=
X-QQ-mid: zesmtpgz6t1788160300t215cf119
X-QQ-Originating-IP: mimRkE15pwQbL131ohYG4c/XYUQeUbxmUBZI45Khlhc=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 15:11:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9551787566103979334
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH nvme-7.3 v3 4/4] nvme-fabrics: add helper for DH-CHAP secret options
Date: Mon, 31 Aug 2026 15:11:36 +0800
Message-ID: <1E3563FE22B8A343+20260831071136.638787-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com>
References: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTGYztYhR5ET5H/R20ph7EtmGyJY00Ph6krl3NhEgcygu5UtHbuul/V7
	W8s3nmH3zv/Oj2lqSsyDlk23t6lE3L70Q8UFgcUkmEvv/byMjRfenaB5JhumfVXDKI2tDec
	Cmn9eAySh823EpJguLwgnL88IrlwS7Meh/tE3DI+xATrAVeUQwTFk3uHDysz+pk+atWMMl0
	1079NYGnnhheUTnbH/X/nJg29NmiY9VVB9H/JNDBh5Fez6ZKLpP1JdFmhfjrHtnlOCJ0Bdv
	dqKlyq24afXthR6N0wf5oOtVNmnwuxsU0AB7fmzOAQb7YbUfPlJIJrwnFWtloQQWttUKsZd
	5JlDDnRbqMtj7vIKalh57AMUVQbfsV0jkkJ3+w921SZgh/xJL6Axud3YymyFEMuWJoLBsB7
	ANkHfUsGISbgvZPZpneIwTtMKbdabLxaVK8vz70nqXZFDFoWxYerdPFJtGFUJ9mXLlqsVND
	Ngk61vcZ4xcyuQN45RdGs4ci4/rBWHg9G/8R9OKEegPdwx7dHGrAsqL9C1hZArkjJr0TLJq
	kl5/gA0ew6xxELMLuWfa8R6PtvUA8yprO5C6qi6978n+0tTy+dalXjLaMHa3y2pCa238MSl
	pDr4mEQ517cVmYJ9bJeUobH9qJHwh1mwuHzLrYZXdw1LyD0DQPJWZeOIpFyhXBW9dKMcAvw
	9ly21nL58piximwsdxUBFd/ioXzXZ2lneqwe2MwqOi85g5HJqfGjhFlRtDEzAW4AAwCQ4f5
	h+8gqOpagdqnf7PSps1sSEYloirAXnly17XJEADZeoxeDdRpUPFk2BKsm+pkvU52mGf2Jy7
	EqdqIASy8f8a6bEqtBh7oAVynGOvjNInCyiAXUM1VA6CO7OeoXRf49d4c3w0acF3vANgaGr
	gr9O/WQzZiVP65sbVkKhrz3I433bgBtDre5oDb6ccC2/bRXuVpT+49WSlq+n8Gnk+QZLK3B
	HdO1hVdMHxIG6fKAHAOSfYjDkddXecDosNQcYvub3Mc0ityCMRfnuHftM0zIPcOWzekoE73
	fIzHDmbjJlxQPn6uPglAsV1ulU5U/8LiCQiNAR2RgOizmf33a44jNFRfn7e0NT3WnAdsp5N
	Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The dhchap_secret and dhchap_ctrl_secret options share the same string
replacement and DHHC-1 validation rules.  The replacement step can reuse
nvmf_parse_string_option(), leaving only the DH-CHAP-specific validation
in a dedicated helper.

Add nvmf_parse_dhchap_secret() to reuse nvmf_parse_string_option() for the
common allocation and ownership handling, then perform the DH-CHAP-specific
validation.  If validation fails, discard the installed value with
kfree_sensitive() and clear the field so the normal options cleanup can
safely run after nvmf_parse_options() returns an error.

Both secret options share this helper because their parsing and validation
rules are identical.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nvme/host/fabrics.c | 47 ++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 24385e777307..207b05ade022 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -725,6 +725,24 @@ static int nvmf_parse_string_option(substring_t *args, char **dst)
 	return 0;
 }
 
+static int nvmf_parse_dhchap_secret(substring_t *args, char **secret)
+{
+	int ret;
+
+	ret = nvmf_parse_string_option(args, secret);
+	if (ret)
+		return ret;
+
+	if (strlen(*secret) < 11 || strncmp(*secret, "DHHC-1:", 7)) {
+		pr_err("Invalid DH-CHAP secret %s\n", *secret);
+		kfree_sensitive(*secret);
+		*secret = NULL;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 		const char *buf)
 {
@@ -1010,34 +1028,15 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
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

