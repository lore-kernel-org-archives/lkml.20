Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B65C456DF1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835923; cv=none; b=WIkpWSitzZgElvtOl2MUHp+cj0wSREHqHdFpzXXzSje7PtgqLrwOWhoQt/0Le7X0K25Hzu/Wjvi01jblIGFYckBBVZn64NnVR2znnul6NvgTp4huqNgUsjOPoyHPQkTuqvLqvC29stQ4dtRK39tpPTxniGE3BqXpaaJmL2uJDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835923; c=relaxed/simple;
	bh=tlwmsXU1TI1dDNisHesFFFQzWAmxz4dg76o9OEnHLd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9X9QE3HX/gzABqF45OHRT9jDteUzjeLGzHwvbAEV0ZMWxKyTxTaG1Ae4inqCPq4xHdVroF0GlbltW3MpVfY/xQq6bZJQI7c8DT4wEG/L3w537h52NmM8R07GhyICS/MIqlUbWmBwn6juo1vbz+rZMuVIUT19AqLvtJN93QKU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TyIGP7Bn; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="TyIGP7Bn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787835852;
	bh=5K8HiGpe4pTl4e3/3UO5i3J1pMJi2AYfK6GebpRCy2g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TyIGP7Bn5JvjlJSv9KJEuCXBJDqOOmb/ifICdKiPVZKmEE8baquWhbUE+tnIvyBu7
	 REngFbGFtlSLQLsigpRXaBLdSHmidrQe1jad87MR+sZrPiUBS5ZzcJNm6Gh04ZpzmL
	 jqYreiPVFB9Ddpo5NIvzJGCsksF40bFbVsXXtJ3g=
X-QQ-mid: esmtpgz15t1787835837te8da011d
X-QQ-Originating-IP: 5NWuQc8cQ++sHC19BBODe+OXEnWDkVuSNy8qkIGmp1I=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 21:03:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8434123566750053300
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: axboe@kernel.dk,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH nvme-7.3 v2 3/4] nvme-fabrics: reuse string helper for subsystem NQN
Date: Thu, 27 Aug 2026 21:03:53 +0800
Message-ID: <2480D624F1D8ABC8+20260827130353.1390863-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: OXWhkXa0b/rw9ftOf5B9qskYclDcj3ibk9fb+k1xV2jjEGFk0QaVM6ho
	zMTicCu1OLCZLW6GC2Glwte25aDEIBg4uBfFHqSUqWsT1cgV4r1mopcyeCq65wH8eW5YlRH
	lG/EesTLAzeTSQ/vGEkcdnNa0V28Lc0qTNxZoeeH/+jrf73sGccFXL3Ce+QQJKvegRy3NR2
	DgYs33f1qNJz3r705hUQPrBbFpSkEVrk4WRVPXRxefhXWmDSW9b3u1KCaoxlPfk8RpTbLGN
	Bxl9exa8ZfdaB3lM9nBLLM9+ZJ94Kl4+HCTexJg8HrohGuwGTEVZgiCxHhVgCT89aAJBItw
	vNifRWfuvl4ysuNPlbHuQgJSPUSUBWsHhdSGztgIMxk9tPengNpaJn+Ss7SNqsqagDRETGm
	uSHNucXbHpKijKQcyBx/XNw6632JkV/C5OuhWc1wJNOdC4GHVMoI9Dby/yap/mkDep/vaDw
	/JdWTN+FxoxPMSjCcqgYaP+7g38cD7F8nX7jmJeeUlJ+EzqJIkF+EEH1CHOgPLun0b6HPck
	gGUgxwHOPdJuNpkf2TbtFAZTUR5OTBb+Mi1F2lPXIXO97+oRPOAJs/PWfYe07zkVvEKlyov
	icEYfujhdHj9c/A4FyLKehUD9v7cZI6+8GTE/KS7dqp20FUNPlwOLYRJYSr0QY5h/B2Bd77
	BQDY2GbLOzq70CfNoiDNQPPKJWD35p0ZLppiXsXrImPJLAlOXWRBMkd49EgQB04fbScTzkg
	MyV0unpmEikok8EMIxKL9GSIoWuz+VKKvR1FA/UTe75+VXnt1Cl94QOrhKHqTr9CseyVb2T
	nJJyYu/Tc0VrnZmqgMQU34Xo07HTQrurna+hb6/Wu5xag9D3zPYwTCpVTCSPuKT+HckvwWX
	V6jEYFHD1rRhNKQ+7oTL6BT1JeiJMM3bUww0xyJCun47jO0TX4PmpJUI0pexpS/luLzBlMA
	drCrtswElq1ztDoz5pHACGubp21mPOHE15ZjRG42LaS/c+VpO0G+isIx0NO77t93IZ+88d6
	p6TjmTArfnCRzdHTk2WA02HoyPZZ/x+QbWQIPojwcUw4KzPjnq5o9LxF0Vb30Ze4eaHL2KI
	oVb4gEClT/W
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The subsystem NQN starts with the same owned-string replacement sequence
as the direct string options handled by nvmf_parse_string_option():
duplicate the matched value, free the previously stored string, and
transfer ownership of the new allocation.

Reuse nvmf_parse_string_option() for that replacement only.  Leave the
existing NQN length validation and discovery-NQN update unchanged.  The
hostnqn and hostid parsing paths are also left untouched.

This removes another copy of the match_strdup(), free and
ownership-transfer sequence without introducing a dedicated helper or
changing option-specific logic.

No functional change is intended.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/nvme/host/fabrics.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index aab3fd279d0e..24385e777307 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -773,13 +773,9 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 				goto out;
 			break;
 		case NVMF_OPT_NQN:
-			p = match_strdup(args);
-			if (!p) {
-				ret = -ENOMEM;
+			ret = nvmf_parse_string_option(args, &opts->subsysnqn);
+			if (ret)
 				goto out;
-			}
-			kfree(opts->subsysnqn);
-			opts->subsysnqn = p;
 			nqnlen = strlen(opts->subsysnqn);
 			if (nqnlen >= NVMF_NQN_SIZE) {
 				pr_err("%s needs to be < %d bytes\n",
-- 
2.50.1

