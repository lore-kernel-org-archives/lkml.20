Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543F466AE7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522399; cv=none; b=WDdRDV3YNm7FO/fAArMvguTS/asjvziAwgp9ziwi+5S3aQWe6G0bnBFWJGz9VWzxKhW5AI45+ZQm5D685JFWAZYfqb+K8gG/U8/wches1P7+b5tol2cJAHn310SlW4J1cTb5D+GOr2gmosvFVYSm76MKeSHRtvbCtFGzqfbm+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522399; c=relaxed/simple;
	bh=q/EHG82b1n2sCjSHe/6Qi0YTt1OahLioR6F3Jco6HXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lf+CqQ3MmhK8rk4/zZUXAYKYxT0Q6n6iK+SMQQ3KETz9ubIg/c9/kXomW68MK4nJ+RZ4gDsjtjFyYuWewbsoiEKp8R3CehY0vYgj9itO3BlLuEMewmxFapWUBtduMWSDLTC+0QZYlcJOIiW3VANe7TyIDj+KaBxHgza/ICPSyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc7ZU2GW; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc7ZU2GW"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4cc6797b7so531000a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522396; x=1789127196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5/ycngy5ku8gnwGq8mTTya2wxi5X2DaQH5UuYeTu+I=;
        b=gc7ZU2GWHZ7Het8eEGEGWidRCox5Rwmt+Rw5eVKeLIAgxubLxZx8VvxnC50p6+Ar1N
         syj30BKENfeIqNjBshgRP3nebLrMTzDmhh6DrXcmFatuV10ddL0ljKJEXPq+/LXYl1If
         FBufeeVHJ7uukNERvboOLaE5PDSsLLuMEB25xgfpoyYUoxcBsyxyOBa5DmiJ3VlcJwqw
         IAzrEd1+kDR7VwqcaJo6634h5HORnzNWagBVU3+RaGo5lscx5bMAyCohbQWPjF9T3AV/
         x49IA1qgVM32AtIDqWTaLkFvycDlOx5ktOV7zSkpCOIlTlh8vdiGbqH+lUGHVad1OsVC
         K87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522396; x=1789127196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5/ycngy5ku8gnwGq8mTTya2wxi5X2DaQH5UuYeTu+I=;
        b=NnUsbiowrgsIGT4bdzJ2PWE9pk2k0xgVrUOuuTJE4OxQBSn5sT/AvcaW+6zhs4vV7k
         5oeRNVNUELLowpYm1d/V1MmsHp6MLbQ9lVY2EdfNWl28F+45QRZ7j6bDQPkxQZrcZZgL
         kGvPm/11dHaMV69OIsI5uI7LKpQkIIut3W5iVPC3BO7T7NB2G1jxZlbkz4QnIG63ztPH
         A8GBaJVmwxIgldFJBJVNDTBJWnTerzeTe0rMAzpp525YjK7mQIIUpbV9CTfapfhgBMJo
         Fi67cqens1AguVbX1m70NOGIcKrUkytYJn4poywigVBa4BbNmQRd6p15/1hhNG9Z/y7J
         DtqA==
X-Gm-Message-State: AFuF++nJZEl5R+iwMQ7JSp0mvhJMq7Qnhl9XW8LvhtUc5H9NVPkjCHOL
	bQqFCV5Pp/lOX8eEjfdtybijUiNnSUkUeZ948dE43Nr70PXr6RELkhMQ5x6qJnrPiU8=
X-Gm-Gg: AYBFou2a6iejNGpd3QOzvgcKw1rJ0eRDju3ux3/t5OXNnc8i35BWQIew7qFxzfCR3/5
	GJsNB8uK112iKQs/CtggD/w6PJa3t4V7Z1Arfr1gcaSGdEhmX34AiNrEjVhYsT7jy9qR/HAZc7Y
	PIEZxdz4PMepSFtiIXXm3W9NOQ2A5U4O1WfAAjuY8oJMpWQ/yd1RhwFDevjdt1H1FEf22h8vpql
	E0AlnC5kkl898LTHuIymvUpPOt0j/ypCWhoqojIXOw+DYpBmfBSvAzcozqkeExp9FFbvDjoaVJZ
	gMHiyfPoYbynNeK2ueg1uRo/w95BsqVEct/MxiMmrww6QeSikK+qaRdCUF/GiTY9U/YpkNSIG/E
	tOoyYFn0q2YHHk+tjZwnuK+If1DtZXSu/dHIkPzYsPmp6bU3yDHLTrQRFgziXs7aT2CcUisT4V+
	SG40Q8JJLvMGxIW54Mk468y8rqmBce+YBlRLW43YSrIw2+cSC1g0eD/p3raUuA83xd6lmEAnQBj
	t4BTwj60LQ4etdk7CiMEUC7cUo=
X-Received: by 2002:a05:6820:179b:b0:6b1:42ab:d040 with SMTP id 006d021491bc7-6b6fd3c83cbmr3514126eaf.28.1788522396581;
        Fri, 04 Sep 2026 04:46:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm6071545eec.10.2026.09.04.04.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:46:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev
Subject: [PATCH] nfc: fix typo "occured" in comments
Date: Fri,  4 Sep 2026 17:16:30 +0530
Message-ID: <20260904114632.31336-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "occured" to "occurred", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/nfc/microread/i2c.c | 2 +-
 drivers/nfc/pn544/i2c.c     | 2 +-
 drivers/nfc/st21nfca/i2c.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index f45e883b8730..03dd11271027 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -39,7 +39,7 @@ struct microread_i2c_phy {
 	struct nfc_hci_dev *hdev;
 
 	int hard_fault;		/*
-				 * < 0 if hardware error occured (e.g. i2c err)
+				 * < 0 if hardware error occurred (e.g. i2c err)
 				 * and prevents normal operation.
 				 */
 };
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 7fde3aefae70..edafa1709f95 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -169,7 +169,7 @@ struct pn544_i2c_phy {
 	int run_mode;
 
 	int hard_fault;		/*
-				 * < 0 if hardware error occured (e.g. i2c err)
+				 * < 0 if hardware error occurred (e.g. i2c err)
 				 * and prevents normal operation.
 				 */
 };
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index a4c93ff7c5b0..e760d1813edf 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -66,7 +66,7 @@ struct st21nfca_i2c_phy {
 	int run_mode;
 
 	/*
-	 * < 0 if hardware error occured (e.g. i2c err)
+	 * < 0 if hardware error occurred (e.g. i2c err)
 	 * and prevents normal operation.
 	 */
 	int hard_fault;
-- 
2.48.1

