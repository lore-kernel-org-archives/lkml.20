Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7853577E54
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962848; cv=none; b=N77ZUiYM0DyFF7puJFli1SdVgFUYlH4fGpsKl4MvYPrz5rOGUBXt7srSyMOcLRdq4cHK/GDCcUsRekpNlhyt9SJ200i+2uDExEcaBQQrf2GEQwXFcjQ1rbE51seoRb+zve3UU/VxwRyq6Mj3s1SZMUae3b98G5Ju1VDk7sc1IfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962848; c=relaxed/simple;
	bh=wQNud0kEsTSOp1R+Gv0Q92P1f5sdKHbucbO9OsVAuq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ns0Z77Lp/6FUDeE0tuRhDH2Z4sTdUGsC9utPmDtJtAthhlctad4gJRvg+pDtxVThQKvX3828RIIojhObF7V0zBQIrghFWEfGr+95QHaOA9L82J7JE1oz2wzsrD/ovMh22WMTS8Lkbf4u4TxfhnCFGx3DeNvAluSCa8NSxgyrKIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mmfDhmGs; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mmfDhmGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788962833;
	bh=rdxtsC5FGSM610q9x9cjd+jqKpTMaFc1fUwPTup7fho=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=mmfDhmGsr46y3f2ZGP5E1JVKt5wOvOMTrv87S6J9/1yBjFYiYDavqHUfpN4MusR3G
	 bjAOHAsy8X1d55ccaSahiu2uMDi5Q+bp6Ol3kSxw3b55BnmLFbc3c4rDEwdXmr3pSl
	 QVAobLjCNEE/pXtA3AqSkD2e5eHLBopL9CAzLl68=
X-QQ-mid: zesmtpgz6t1788962832t950897d7
X-QQ-Originating-IP: 46inqLcoNwJCWbThTDJYTUkHgzGHF8rQss84kWW0nCU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 22:07:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11212110114369243432
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/5] clk: spacemit: preserve and safely synchronize
 firmware PLLs
Date: Wed, 09 Sep 2026 22:07:00 +0800
Message-Id: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA2kQ6jEq4gLE6d1RGPIxFIQ7
 25qd+9bvP8AocQk0FYHJPqw8BYKHnUFfhrCmxSPxYAan9rqRkkcPK2cVVwWxaEMbw06h8aiMVB
 +MdGLv3ez6/+W3c3k8y8E53kBYMoYInUAAAA=
X-Change-ID: 20260907-spacemit-pll-init-c942bb249244
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=wQNud0kEsTSOp1R+Gv0Q92P1f5sdKHbucbO9OsVAuq4=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLM1iXdUzZ4LTLJfp4yMfj/2NeTdYxkOe8Zuef8q9WT
 s+PMep4RykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwER2fmBk+CO9wdHJ48jkXAc+
 5yxnL/adxzznvnZImqVskSXlKPPGgZFhBYeaoOn/d5X1T0/NUlwh6KLcOiEvPEG+Jn96TZTOWnY
 mAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MUZVN6GmaGOthUDQyPAmlFeYynRItECDOFA3oHm5nWlc4bGCoibTXueH
	+mXaq8iaAZHZlFi6bpykLepkfGVsDnfXZmBUCKSAjMLTAxRFGc7LMOUF94bCfsjESfXA3cp
	NUQtlWknTbKg/HiiTOLuWJcrAe9wmsgnXCYpbTDq0VdFAvYgCkYps8aEetdj8VLtN3c0nKb
	CgtrJGMVVcime2TeA5H6MtAhDVUh7A00w4UgUt+ZbodUmoPyXdyp/6XBBTHEM3rI2kA5B/B
	GaoW2N79R+QOCTxZUtgVLf2nfQxmsUAtvABfC2Q+ACgS+A5P6s1DCZsLlRGRGzIqBKtoWWa
	ggp3qRowbnNFIrLZMIj9Zv3wrM5lIoOTKXIkgjLJlxws5mpr43EzVV0/Ag7+Y0gDZ69dW3y
	6Ra9SxKpSqtKGj6AUd9aPlAzMRnpYDJF+lSF1tShapdfh848Dp3zHOTQSByWez1rxShEfUx
	6fNbxxIHpo4JY4SOkqcR05Ps6SaOw/DKJo2ncY//USrMXdJaZeuf0jU2ywht5/xXT5Zwbtn
	Hrl7mcmAB6wZXuMCLVdTygGjzgBB+MIsUMMu+QR1tf8q2V7kKid/qsVCOIu0gC6E1pD5qdN
	ld7KSskWRaDhCMqY/wNfaMG2tyOqYU1glBLPU1ZO0s1l7y2mv6mamJb5rM7dQfeJAilNqwT
	cY3VTHsvJ7uV7jUezbHq8MkjCrQ5o+1tI1xm65ofF94Uu5tqG3ia28A8nEdviItrwlN5rgE
	laZwL5rlHCWlPo+c46Eps36yu4ataJTxwlaJMhzt6/LuBHsdldJL7ImV5wx7AzfIpR2uAzz
	rXABNffHbhgMcp44NpRAAC1RQ+/1aC3MfftUy3bhrH4N8oGa3qWE3ZIDiu9tnDsGyFj5sMP
	k5iEtlFrCSuJbglMJbgXrMbgHb3iLpxS+0VrK0viJggqAhSrCL9TNIciHJyLF0+hGr70O1O
	Ma4EwsaFEI0I5daqpIBZUCL8rPJKRW9b5xxoFLQTNCnJ8qZSfYOrv3n40S7lfbhAtVDhph9
	swMSnpdiMl7PBDWYaq8/CkU27v0wCX0KvDrXNiQE4X41nKqqgB3+GhcZDfUzcd8xXhk2X1v
	BIs4he8p8AqksHvCdktXHONjTzb3zP311OISleOZ85kNJKuknbAOELbx4Jj+gGtW8xFwl8b
	3ofF
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Firmware may leave PLLs running with valid settings absent from Linux's
rate tables. Replacing those settings during clock registration can
stop CPUs that depend on them.

This series removes the init fallback to the first rate-table entry,
decodes hardware rates directly and preserves unlisted rates. Opt-in
synchronization applies only to differing parameters for the same
decoded rate. It temporarily moves mapped CPU consumers to validated
PLL1 branches and restores their parents after the reprogrammed PLL
locks. PLL1 itself is not synchronized, and enabled outputs outside the
managed CPU paths prevent synchronization.

The series also corrects CPU divider and shared-parent modeling and
makes MIX rate selection agree with programming. Runtime PLL rate
changes still require a stopped PLL; automatic DVFS switching and new
rate-table entries are outside this series.

---
Troy Mitchell (5):
      clk: spacemit: derive PLL rates from hardware
      clk: spacemit: make MIX rate selection consistent
      clk: spacemit: describe CPU clock dividers and shared PLL muxes
      clk: spacemit: reject rate changes to running firmware PLLs
      clk: spacemit: safely synchronize PLL parameters during init

 drivers/clk/spacemit/ccu-k1.c     |  60 +++--
 drivers/clk/spacemit/ccu-k3.c     | 137 +++++++---
 drivers/clk/spacemit/ccu_common.c |  12 +
 drivers/clk/spacemit/ccu_common.h |   2 +
 drivers/clk/spacemit/ccu_mix.c    |  35 ++-
 drivers/clk/spacemit/ccu_mix.h    |  18 ++
 drivers/clk/spacemit/ccu_pll.c    | 535 +++++++++++++++++++++++++++++++-------
 drivers/clk/spacemit/ccu_pll.h    |  43 ++-
 8 files changed, 689 insertions(+), 153 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260907-spacemit-pll-init-c942bb249244

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

