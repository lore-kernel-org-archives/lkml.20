Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F4144062D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829672; cv=none; b=GsvcLF4DU8UwVFjX0KeIzV8qoUY1FPD0jICv9EDR1I374mutBY7+NYjYTcZY5AGh89woPcP0Iue+vsWLPR5avHoHE3+jEDEix8QFyMl+f1V4ZNme8XCsnQa0zaTzOHpD8zelxpo8zGND0V4135edgEPMRkcswhqmfO0jMdZmwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829672; c=relaxed/simple;
	bh=SWZzYG82ddIf4CWzyYSqf8meUDhHnZNy8MmQcSNHLqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxfzFAzzsndR/ta0LHZKdKrYdbGjk92ZDd+k6Qltav+cCaw8R4rW/PNWMbCz9NTqhyQ57LcF4TNZPf27kA8QUR8mhSZi5jR9qLsLB8ujtoRTjoiJ9JgKAAzUCbeSVXtpL+88rwU+TFL0++xBGu798Hnfh2/nEINJ741mvICvqqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1SmviCV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1SmviCV"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so1267662a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787829666; x=1788434466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+EJF4VycVNW4dQeq5vgulgjlvSit3NOpyYWBllNXVY=;
        b=E1SmviCVobiyI45rJLMIAVTULqw5gfQH6MkFtmBqzXg8+5MoexNlIpNZ7W57gRfIpu
         0x8QgbvagqYHAVIPWuw3y7rln/eyi2oWhkyhGHyQQxIouAKZScw6d5izYA6FmVMdBE0+
         Q0blZgSfhdkXF02tJvrI3S/EUwSRP9N6+OgUw1NirXBvtROdk1P3PzkeKvei7e5WBH1R
         vt+v2hxjxr6iPHFh92+CqwdgXnVtYiONm/23vHC/V/xWb9m9F4bVZxsiVBbH7lf3CbFL
         DzTbGprmm8UIUjmlT7Q7G8eXSqoepTyhUSJhGfElTcK3NJkw9nXvaxdxUhcSv3nWK62H
         l1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787829666; x=1788434466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+EJF4VycVNW4dQeq5vgulgjlvSit3NOpyYWBllNXVY=;
        b=kKuWINBVrPvCHgIIfIq5bv6tkTbCb/jmLEUDnEhpE2HLqZD8xXTip/ToW7J1ZUu5AJ
         f92QtTLUGDou3wsuoNVddBNjZkTruZo7X6wnCgOFYE0YgpSTq3H01Aon42dTZpExkxio
         7FWHwB+73qllH3ZltfkCETANmZL+B6PaWJbTzcImMvTqI1E9MI2vzsrII8BO+cEUhfJv
         ujNZkwRZSijhDJukpQ5p48psxQ0BVlvbd7JcyXpG/oCh9M6TtOsA1FFonsiU0wOhL06e
         V8zDz70dCJHI1vwJcQ/aoHZXJWdc0xiQuBNW3/se7NB76R4bG5VA9l6tpCjzqOMW0c/P
         cT0g==
X-Forwarded-Encrypted: i=1; AHgh+RqJYlpQK+PSmdkp3LoIiPmupQR8XCVYiHExF88Sh23BnkKTTmg4mXhVVB/U1w77Iqw1DmpbY11ufmNAGEM=@vger.kernel.org
X-Gm-Message-State: AFuF++lcCi579K/G1UgutXugaW+okcTIY+JQ2PqmxdEbwGpa/zgizRKa
	8d/Da9TiVY1jZroQ6i3AfnuzMwf2d2hS8q1W9WkFEMW2FY+Kd2HsMufQ
X-Gm-Gg: AR+sD13g0zqrJ/mkwbEMgKDwtpdtA+Z/P0tjKpOtF0rINkQbbBi93OP8eA9OknVrYT4
	3s6vaXpEspsZOXc6YsedGV6r9VdV4xQ0tiLEhePIA4jVg9qcyxuxJBQI7oThubn+o/2sIqohz5s
	fTZCiqfGiaruuuaQ63j7e2TPMM24Nb5Xt9fzA/8B5ZYDYAhmeGxTw/b7sypECB565usaun5/CQT
	8K4mIzvWV+Pvs57i8GNzxc9fV6luVQgnzEBI0jv3TMxTf2EVsfSStAKh/o/uSZK5ymAlgVxyjFF
	IgJXqDz2gHk1RkvKRLobQj/25iTDoxUoTKsrVQsuRxcKtsaI8cpHLrrP/jDuFAUjrDXkbpgacVG
	iTeXekpm7jmwMnqj9m/+kuUXfICix0gw8zjq3RslEoPTzzumapYd6JfKLcsub9nZssRW7SKyLLT
	/UCwZQMrDJ1SY+LesdbFRGQrxoEV5lQBqCpQcIg+Fjhz9XygJ7dECtqFqK3ITuhGwnwD1IuEKso
	axCfNA2EHrxbHAM8L9izZi19+1Yo5i3M1wb+KPz
X-Received: by 2002:a17:90b:4f49:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-3966d1baf30mr26872063a91.5.1787829666315;
        Thu, 27 Aug 2026 04:21:06 -0700 (PDT)
Received: from baaz.tail58d41.ts.net ([2401:4900:8853:c223:d8cf:ffee:2034:18a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm16423327c88.6.2026.08.27.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:21:05 -0700 (PDT)
From: Muhammad Falak R Wani <falakreyaz@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] scsi: ibmvfc: fix kernel-doc name for ibmvfc_scsi_relogin()
Date: Thu, 27 Aug 2026 16:50:37 +0530
Message-ID: <dd866cf2321381694af027fbd726bcbd63ac3751.1787828961.git.falakreyaz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e0fca728a89f ("scsi: ibmvfc: delete NVMe/FC targets as well as
SCSI") renamed ibmvfc_relogin() to ibmvfc_scsi_relogin() but left the
kernel-doc comment referring to the old name, so a W=1 build warns:

  drivers/scsi/ibmvscsi/ibmvfc-core.c:1901: warning: expecting prototype
  for ibmvfc_relogin(). Prototype was for ibmvfc_scsi_relogin() instead

Update the kernel-doc comment to use the current function name.

Fixes: e0fca728a89f ("scsi: ibmvfc: delete NVMe/FC targets as well as SCSI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608271026.iMLmrwz4-lkp@intel.com/
Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/scsi/ibmvscsi/ibmvfc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc-core.c b/drivers/scsi/ibmvscsi/ibmvfc-core.c
index 93b9f699c2e53..d1956552698e0 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc-core.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc-core.c
@@ -1894,7 +1894,7 @@ static void ibmvfc_log_error(struct ibmvfc_event *evt)
 }
 
 /**
- * ibmvfc_relogin - Log back into the specified device
+ * ibmvfc_scsi_relogin - Log back into the specified device
  * @sdev:	scsi device struct
  *
  **/
-- 
2.55.0

