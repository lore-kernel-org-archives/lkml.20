Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101641DED5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829690; cv=none; b=EgUsnJFqisMkjz1vRDvKaE9oSIwjiehUe1iE3qsOQ0kfkSxkJk+9IrUC0mQ+fJQth0NonWgv0BoT64En69nVRyGB0HIVjt23uUGOyHOUkMqUzh/CQ8ghgt76UQTGJuJnqz/xmJJdB2S32rfKLXIklaewycFSTCAjlMweNElHNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829690; c=relaxed/simple;
	bh=jAJCUoDhgJdImNIePC7j08N47hwd3t2WfQxePgjwS3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqea8W5Lu5uFoB5V7KPzyE4fWBBWgX/la9tQUWceLINpE+L+a0CcxiNkL8vKo/b2hN34xXnn2BKts7IgkPRMkGfdgCAyrOkvtSEkNfaeeG6ARt/jIQfD+IOVBtC8n7pX9OEVFSumHxvqC1fWRJd/seYLXmxxCuI2C9HJXoxCvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mViux1bY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mViux1bY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39652a6e963so804134a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787829686; x=1788434486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AQl5RP9TxXn81ZgXLlb05Y9y6XA1JA2H2ttGtX56P8=;
        b=mViux1bYxGTC+ThorwbYBWpDwOYm0/6QXKtKgdDK5vyjlVjS0R1+dPWEYg570CRFAD
         XKHI87iyRxzJ2W+QvLy/0GPOiXTmSK7L/9e95XmSMvvxYMhBb5YfqWk1YxsHVeorlAFu
         Vod0Y5EBYdNs+obYp8XSonZc/TozJ0LgOjSYUqMZc0RkhGovtXeSht18DiFgUzxACC1c
         5aI/fv9pq3gH38zWr3tbiKp0BbxKbjzslBbLhBM738gFrFBJx0jMunybuAEyX5ZGxmqg
         iHHElr5OxKhdLmQVXLd/A/8gFL2v1Y72xzAiwiLdfARkV6eNrfEkEc04sNApSYu7xqw5
         iALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787829686; x=1788434486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AQl5RP9TxXn81ZgXLlb05Y9y6XA1JA2H2ttGtX56P8=;
        b=GARXY1Ch8Zbis3Oja6yhgAp2hu6Z8YzC3u/VKjDARL0Q4ry9W525iFqro0ncpbK7v9
         QoMxAJuKI6A/5dWeT7uLd3Q4qolkL5DNWUOyFhLgnVcNUwjTKiCmDNiHVi+v0AI/Upj5
         15mN1ZuzXUk/9OyFJXlbMFYqRt2YeAwxdHxT0NDecA3hcpeHKfKdk+ncvQuhc2J4mgdU
         rKoYd9lT0dZkQuiU4AkICmk1+EB08ovKIrYwiY/ZKcQnb1iqyPEiF30XF4SiPiY8HrQm
         7Hg1EqQsDHxvJGYHMvqaMAPXzXaHVQebhSsXMCy5GdN5F9bQLYm0whA7nDY2aohlFlop
         nvfA==
X-Forwarded-Encrypted: i=1; AHgh+RoMueDn9cXvUwawCHBduRkWZ/Tml0Be2lpGPJj8fn9xeqvjYL0ThlCpRyombqGavafUVLKvOBCsa391mZU=@vger.kernel.org
X-Gm-Message-State: AFuF++mB8RZ+AXCqGwOUNlbAHBzHtw9eMuD6V9AQ9pwdYIO/Z7x2Oniw
	B0mO+qBaInPmhT+mrvWqDmxtvESckYBAXzF5CQcUhqHTUWKQMUSLIA8t
X-Gm-Gg: AR+sD102r6kk7KLOCHGGMPfecfKjs3BmIzHuk9IK0ir7u5IpHKVzKa27gw7qD28bL2Q
	muj18+AS6UFXSyqVCGeU4wGSPbnZCxfEVai2VyTdQ+MmRSKZQx9Sms+QZDbVlmu34JxL62JP0Qo
	LEdg+WrLEYKahiySKmL3NT3wB0ABRew6mupfMENo+eIyL1YBExVDdLr8JgSjZRkPjz8F41PHPoi
	hMqpJgSAQG4+UM5N47RUH0C0T6uqpIoib3tBmLCY+fto9IiXC/tIkqCs2W4eEBdPO4jANDxfO/Y
	k1fBEFqr5cCNrdg+UsE9Mf7eluWm1YLWn0EzaA21EKvGdjwRvZE5eV6C8H8doSVdyKjO6MkThKV
	pxZ3FvM30rmaLF4QuZIgVFJmXQgzEVsgyszTxi1HQRukIT6fSSk7BxsPzDOVlL9aJKLHya61z5R
	wvOZi1WgTWf8t4nhFDVN7/IZyXDRffRURQAx13W04ZRo1DxiHNzO79/+/WzuNlguXSDHt0I2K18
	UfNAstfWNdO6yKpsjgtMnG1fRX1iV4SEfb1xnk=
X-Received: by 2002:a17:90a:e70f:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-3969bc5054dmr8099705a91.15.1787829686419;
        Thu, 27 Aug 2026 04:21:26 -0700 (PDT)
Received: from baaz.tail58d41.ts.net ([2401:4900:8853:c223:d8cf:ffee:2034:18a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm16423327c88.6.2026.08.27.04.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:21:25 -0700 (PDT)
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
Subject: [PATCH 2/2] scsi: ibmvfc: document protocol parameter of ibmvfc_alloc_target()
Date: Thu, 27 Aug 2026 16:50:38 +0530
Message-ID: <b073968ae020b6ae0240e91341a92f428587ebd9.1787828961.git.falakreyaz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <dd866cf2321381694af027fbd726bcbd63ac3751.1787828961.git.falakreyaz@gmail.com>
References: <dd866cf2321381694af027fbd726bcbd63ac3751.1787828961.git.falakreyaz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 249313b3f7b5 ("scsi: ibmvfc: allocate targets based on protocol")
added a protocol parameter to ibmvfc_alloc_target() but did not describe
it in the function's kernel-doc comment, so a W=1 build warns:

  drivers/scsi/ibmvscsi/ibmvfc-core.c:4996: warning: Function parameter
  or struct member 'protocol' not described in 'ibmvfc_alloc_target'

Add the missing parameter description.

Fixes: 249313b3f7b5 ("scsi: ibmvfc: allocate targets based on protocol")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608270829.lHI1FAdO-lkp@intel.com/
Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/scsi/ibmvscsi/ibmvfc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc-core.c b/drivers/scsi/ibmvscsi/ibmvfc-core.c
index d1956552698e0..6fd4c601f978c 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc-core.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc-core.c
@@ -4987,6 +4987,7 @@ static void ibmvfc_tgt_query_target(struct ibmvfc_target *tgt)
  * ibmvfc_alloc_target - Allocate and initialize an ibmvfc target
  * @vhost:		ibmvfc host struct
  * @target:		Holds SCSI ID to allocate target forand the WWPN
+ * @protocol:		protocol of the target to allocate
  *
  * Returns:
  *	0 on success / other on failure
-- 
2.55.0

