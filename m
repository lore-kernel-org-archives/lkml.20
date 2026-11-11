Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.90.104.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393719;
	b=MoH2/g2sEH/l0WKZjN9QfLhOcLRcgHGY01HpYt0Oa+D6FULtDak5zlIs8tHiGllNShKs
	 0EGgdNL+lV8c0iWos8qhJrZoFEEcSAATn/+upKJIaRRRHUMCnx+PgI82MJaiv1yvJ6gN7
	 qINRDGpMcfeP7q+gvDjptlEzW9ihM9OX+EMF8tzUPa6jiwo79oZJDLI1IlQ0cQQlTnINq
	 z+vCwZr9EdT2SFFUY+OHIJ57UgZI94ssBoLK5BVr4y26X6CbG/oz+EKXhkpnpwFjVQ+Ww
	 GKwhQH9OWExMi77Vt/tT7rD84JivbSGtJmpPYbbBrOLGXJEuVdVge+CAF2s1QN97kDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393719;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=S4581JpYQiNoEfuMjrRG0HIzn8GgNoTKQlvoBZqFOH8=;
	b=VCbCIBZY5K7oH1lPAyPMvayUGQEkTl8tYO8UdFefphfB7ssWEKqiBtjYlhcmkaOp8e60
	 ayMTgCtd3o7RDpBHv9Wpb6GCAv7Z7NBmjqsxivBjStMM1lWGz/v6JV/DBOD+PHvHDW19X
	 Jv/FV2gDczIPaN729K4A+BXO+U23gjMNp/9CZ0SuB9OiicZ9Stm+bAQmO9eP72Vadw04V
	 R+bKJKZXlywj5LYZZVOFlq1ibgRb7aLMz7St7uLkJDgZoU+MTyAT/1T1L9qiVXpaksui7
	 ztMGJLzyh/j2WXoXdexe85IwkkGNTlg7kuKuZTbDdNsWrfBNPbNInxlYckmfI2vV/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=23.90.104.144
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com [23.90.104.144])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E44606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794393716; x=1825929716;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=HdyES5zrAsYi4tYrCkIcc3IYqeJvqK5DsTIlkytKTFk=;
  b=WXXz5zz+M6+sVCnF5RzuPO17ri+xK+gLd5zku7utQjHWSaKkn+xNn+Hk
   SsQQ1rC/VpfcbpaeJz7nRoGbohsyYoFqgzvk3h40kN3/BLozYI2Hgiylz
   juzD9mTBCY6rpcpmztVXN+X8mOL0xs5caESB2yU0PhQZCWttm8EdVy4eP
   tSThg3dKZ/uwRvApoaC3y93dU+2h6AoM1CLiXditGw9MA32MwK/Z7bwbm
   1LUez1HDaAeuQJO1rTFpQ0SJzzEEA33vnSoInsvY5RF6Z8DeatznEbd6E
   u416Jm4rw2wFbTA2ygSLAppNXVmuLvq0b/tLVuElQJj2N3w2Ga9ldwL45
   Q==;
X-CSE-ConnectionGUID: hM79ILT0TummRrDOREgYow==
X-CSE-MsgGUID: X9nYLeY/Qum3TUAtiG2uwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 12:41:53 +0200
X-CSE-ConnectionGUID: AxvzWaxoRmaNNXEHERfO0w==
X-CSE-MsgGUID: A2JhisewSzC9uSjKboONUA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 11 Nov 2026 12:49:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 11 Nov 2026 12:41:52 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 11 Nov 2026 12:41:21 +0200
Subject: [PATCH] riscv: unaligned: fix __setup handlers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
X-B4-Tracking: v=1; b=H4sIAFBG9GoC/yWM0QqDMBAEf0XuuQcxUKn9FemDTTZ6IqnkqhTEf
 +/Z7tvAzuykKAKle7VTwSYqr2xQXyoKY58HsERj8s43tY2TfLiIho3X3M8yZESGj+nmrq6FS2T
 mUmC3X7V7/FnX54TwPlN0HF9abA9idwAAAA==
X-Change-ID: 20261111-fix-riscv-unaligned-e2df80509e0f
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0

Returning -EINVAL from a __setup() callback cause invalid
unaligned_scalar_speed= and unaligned_vector_speed=
values to be treated as handled. obsolete_checksetup() treats any
non-zero return value from setup_func() as success, so an unrecognized
argument is silently accepted instead of being reported as an unknown
boot option.

__setup() handlers return 0 on failure.

Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 67f1a0371659..323ccfcfbbb7 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -322,7 +322,7 @@ static int __init set_unaligned_scalar_speed_param(char *str)
 	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
 		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
 	else
-		return -EINVAL;
+		return 0;
 
 	return 1;
 }
@@ -337,7 +337,7 @@ static int __init set_unaligned_vector_speed_param(char *str)
 	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
 		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 	else
-		return -EINVAL;
+		return 0;
 
 	return 1;
 }

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261111-fix-riscv-unaligned-e2df80509e0f

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

