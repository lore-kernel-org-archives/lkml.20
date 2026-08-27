Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC55C4477E8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835901; cv=none; b=bbvJ3wJOczvoZwadHnnFKS4Jl8TpXt3qAQ4Gv350kmES3upq3NqxG6iT3BMdTB9Hk2lbxX713UZ/CJmWL8Tu9qW6/KSX9cf0puhmcD0NJ6TIZ4XoVFQCmZEzc7yQBfPKdQxfbY7C84nYTQYBLc5eccGCdJQU/AE9swVyOE7st6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835901; c=relaxed/simple;
	bh=U3oUhCeFlm8VHw10BhaQEjChiC9PpUD3nBM7wDVO22k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNpHFmTfD/tbVeiigSITzXNS8rZZtPEWSgkOXt6vuZ6psm3Xj++41kGyrQ1+QvxRp/cyid+fri4lYLDwyl501pL6vmX5u+PhksZEonKd1/jfICVvxNeKLNYmEK4uspwAVp5zuZjWnJKLTmXlkBwRf+M2BRckZbYrANobPEK9d8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZfgG4wnb; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZfgG4wnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787835839;
	bh=DudSYiu0l51smEG9rCcrUuSsdx8R0ivwHpjL+SnU4yU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZfgG4wnbzGRdwf7CkqJj8ptZrvGPfaEKYQSxdtJNWtIxIqX47ZBBDxrqiwauKOiEw
	 L11M7zbKsXzzgr89NyuIu5gjEtLXzCxl2hYPZ/k7uUXkdeNjAwaZnP8uAREzw72Wi+
	 5CsT9Ec3teM6JNiPgUDfzwIIbumI7cPQ/+xQEbHM=
X-QQ-mid: esmtpgz16t1787835823t85a16d86
X-QQ-Originating-IP: WPzcot1uElX5wBNmxkZ7Vir9EpYhUzqvQOGUV0oKGjs=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 21:03:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17996740236134004177
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH nvme-7.3 v2 2/4] nvme-fabrics: add helper for owned string options
Date: Thu, 27 Aug 2026 21:03:40 +0800
Message-ID: <92BDA706885092E8+20260827130340.1390531-1-raoxu@uniontech.com>
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
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NWth7vBa++Gd6mfcxCMtAhqX+p60hOcvzQEJq0+432Zdddw1dG5Ln2ys
	yu9v20ggu23w2TYrlbbss146UZWKdka17cBXhDcVzhHmRfp+E7bGA2OD/FKNoI86sRV5ZWA
	KgFZXbeUAUdg/nFYq3NikTu3Br1E+WtakXSgqIA3yyDwyI+HvKalNYrOAc3s9xhnJSCD3gn
	Oct0JysX4rkpzTCx3yuGI5L3vLxsy71BxwxCiA06SyPiH1AjoVV3J1aCj7rComMCV1wKnT6
	X7ZZg473VAbQ+eCBl+KeXrQrygH+x4wkEjhRo01BF3bjYxJ5aMnXKtM8xBKmZm1tyXQUnnB
	aJJ+huqY8VO0VZpIjklnvuTFJtFlIoDTzjdOc5D56Q+BO0OCQMtjstq2c1gcfgoO6m9MNLh
	kKs2WeB/eNMAAA5o7lLrZUiFrETZ1JR2T8+WhzbzZX7sOBENAkp/9haPaKRY0cOyA9HbpRb
	li8EFg05w1PWJEMPlnyC5owJl2cuTI586xXk8beaFcvfBJz145NYtLPeR6/H0cuiVt0YLT3
	AModY112uo7Fo1IVO3gxkZQ+vYx0goXIJurVe1yYKT3cXA1uBYculD3b7Jw3+xJxxie2JRT
	HBSzVWVsuSXXxEzryNM3dbutuJsEAIgVYzxodEsTLQbQP0C8YFBG5SGyoMiWNvrjLPNqy71
	2IQlBnuMN28RV+bXMLqM404xeV6D2BCXwEyS7ctYIkTkzQA+X89zBzxYD8jBUMENGDeCztJ
	BO9443jtJwMuW3529zmmITAVj5nJ2uBvkyigRW3aDGu92cUR3WBrwVE2FRBAGGW4jiCcjbv
	XDKp796WvJ2rI9TbPCw9pc4CrVRCDGzwKR0ov+OVrMwkfmCqIahZpIQzs6iSyKs0ODpfRAP
	aGh3wCl1RW2m6+2xiui6C522lbMk2XMpRyAv7VLW/z+XZUITouHetBRLsxxqvo49UJHasnV
	YfpmQ/8U/AaRfuSAHkb3nQxS/matkIbNEcMaSiQ4R0JpOZO0F7dJNEo3qgmx2DJ/0h/E08g
	tvMOyGYlXj21rqd1RZ3aL0rPtU5qBRv1EfKSesqaHfsNazYvBHekBCPl5F1DC05QqpQx9FO
	A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Five string options -- transport, traddr, trsvcid, host_traddr and
host_iface -- have exactly the same parsing and ownership rule: duplicate
the matched value, free the previously stored string, and transfer the new
allocation to the corresponding struct nvmf_ctrl_options field.

Add nvmf_parse_string_option() for that common operation.  The helper owns
the match_strdup() result until it either fails or stores the new pointer
in the destination field, keeping this simple allocation lifetime in one
scope and removing five copies of the same sequence from
nvmf_parse_options().

The helper is intentionally limited to direct string replacement and does
not absorb option-specific validation, conversion, or sensitive cleanup.

No functional change is intended.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nvme/host/fabrics.c | 53 ++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 1ec6da49167d..aab3fd279d0e 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -712,6 +712,19 @@ static const match_table_t opt_tokens = {
 	{ NVMF_OPT_ERR,			NULL			}
 };
 
+static int nvmf_parse_string_option(substring_t *args, char **dst)
+{
+	char *value;
+
+	value = match_strdup(args);
+	if (!value)
+		return -ENOMEM;
+
+	kfree(*dst);
+	*dst = value;
+	return 0;
+}
+
 static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 		const char *buf)
 {
@@ -755,13 +768,9 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 		opts->mask |= token;
 		switch (token) {
 		case NVMF_OPT_TRANSPORT:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->transport);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->transport);
-			opts->transport = p;
 			break;
 		case NVMF_OPT_NQN:
 			p = match_strdup(args);
@@ -783,22 +792,14 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 					 NVME_DISC_SUBSYS_NAME));
 			break;
 		case NVMF_OPT_TRADDR:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->traddr);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->traddr);
-			opts->traddr = p;
 			break;
 		case NVMF_OPT_TRSVCID:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->trsvcid);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->trsvcid);
-			opts->trsvcid = p;
 			break;
 		case NVMF_OPT_QUEUE_SIZE:
 			if (match_int(args, &token)) {
@@ -907,22 +908,14 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			opts->reconnect_delay = token;
 			break;
 		case NVMF_OPT_HOST_TRADDR:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->host_traddr);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->host_traddr);
-			opts->host_traddr = p;
 			break;
 		case NVMF_OPT_HOST_IFACE:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->host_iface);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->host_iface);
-			opts->host_iface = p;
 			break;
 		case NVMF_OPT_HOST_ID:
 			p = match_strdup(args);
-- 
2.50.1

