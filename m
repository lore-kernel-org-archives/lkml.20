Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49550456DED
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059962; cv=none; b=HzH1SkEayKZUDsRfusRAOSNJYzj/sRMD7Ukk08ZfndPPf9KHiXgClPN0Y8FvdNAAIoXsbYSHzGR+Vsw1EgbHSHMMnfc9xBdb9Cm80mYrZWJoVeINcceySQ9lXCIeEQ/Qt+z03F7VL+MZG1Mp9xXkQodCGjG6dQroVFR6474f/xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059962; c=relaxed/simple;
	bh=joXwYCLDFBRvtST9liA7y5l07Dl0QlRsfc0qKdtSK8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTa1Ud2SjzlroJ/b8QWEWP1cbNjR0Zgn/N2+Rvzq1qGMfRZeTcfxhbpYJQ8mZ2czXcNH1Yhk/qgF+XWDjM82J9R0Xwe0s3HQ36urspYOnTJDAAjm/sKFcasQs5tiEw69y4k7qQCLv0u0xVAEL575t4JouejyoGIXxhAcuGSblE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+dWSwe2; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+dWSwe2"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48c688a7cd9so1517773f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059958; x=1792664758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAVLJelNLtLTgKVSCHdzfg2BmtJf7plaW7j80dNRMSk=;
        b=q+dWSwe2eO1L87Rr1awwzL8Q5/9hthKyIigVLWdyMXPkIC7Ca7Sw+GqthB7x6p6FjJ
         a6mezH7+4DTzWUmADw/r+Jp/xh4a/hDfN1TFGrUCLDxYag08Td1kiZnfIEXFgmastFXQ
         YfcVe6Ptpp3JOTqBb7wsGC+oJj/WE+DGFZ0u7/uxdc53WAivHcXg4gUDH8+8cESCtliR
         8wREf7tY6vbQ+VL/haVpP8TbE6wYBa+kXuc5+Mt13WaLfoHbIIBoTByEm6H84n57TV5X
         Wi/phZm9V9p3YuhQS5YFatX6tb3M5zmHCNdkwi3X1LqbVtl0RpmqiQzbyBXzASKIU7sQ
         E8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059958; x=1792664758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAVLJelNLtLTgKVSCHdzfg2BmtJf7plaW7j80dNRMSk=;
        b=cqjtHONk/r6dbaXUpXD/69vBdUgSS3VcmmcSLk450pOkff/OG9jwy15u4bNSwtMmK5
         3Vyq5L3AqoV+Sz8+3ZKnuwGqSvfMLBjEKObqHjrJgSmUQPFBPzvOlDvCm8DdZqarDuMJ
         K5KzV4fQ/vt67ccLBTDbxfv+Y/MdB62750vsGwz+aRdNMAWtg/EiBZgIba6hMXYMqnxB
         JZ16WCiaJ19UQb32c066KivczZfp18WL/x4AmWLqVY4MahTBjUWt7bSqP9rSd981sOic
         BVFVyHD1drjvopnBWf/HA1uYt6Y47dt+Gw7pbplg9m1SmLFKSVAWhszlsiYBx1jaFdcu
         SQiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxslcghgXtmIUorZnm6lLqi+CfJvQ779G1/MC+yBQ/0oKiS0mSGu2w4I/LHvRcQbb+504VuD4LtMBO9vk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8pCWooIuMjtC+gMMJGIBZNInnugg7Qsei20f+jj+SE8wxzING
	Ih156nXrdSm4KwYjQYorRgb/PaTxw8ap+7ThrY2z5+6d73SZS4KBDcHH
X-Gm-Gg: AYBFou1jF5UctV1yRLw8Ld7gf51Hny53NWv9vbra3cLSYht+8zHZyK9Afw4XQyLpNdj
	3nFsLE5TPgobM+GCTj/19kaGdtZBg2S5IhzJzrBlWVaECbj0s2agkjfDZ4/yieMcGyu9gI22wCQ
	8xzSMOKED/nIyGnmm/U5MvoXDSWgIkzMC2u77QnukodWYEPrFILAcADm77eSh7aTMNy6OSQX1Od
	O/biWDt1tFZS/GD147m8eEp0oaDUrhf1DykASL2VD7aGLcGNmzgIpNItTfxkIfit2y9z86A+yei
	rzIxUXRK+ltY1d4v0XPdAouOUpLFgqCLa8NstLdnLJgY2x2hLpns1m0pz8gJehw1pOfEk9+Fw5O
	6o9/sYcQdQvWDgbv7jKBlBkL9gYWdkEiuNJt5EAY+eFtMk/nduOxXwVDTwrtDzrfpXIEI/XQSL8
	4E4xKOW186Ee5O3W7qKM3AqOvT4RVP+GMoXRCbgeA0b32NTUNla3wty+UlzF1p7hlBYQ7kH5rcc
	Fattjop2/mJgg==
X-Received: by 2002:a05:6000:298d:20b0:48c:43e1:a332 with SMTP id ffacd0b85a97d-48dba7828c9mr28324592f8f.7.1792059958315;
        Thu, 15 Oct 2026 03:25:58 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm18387264f8f.51.2026.10.15.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:25:57 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org
Cc: Kaike Wan <kaike.wan@intel.com>,
	Mike Marciniszyn <mike.marciniszyn@intel.com>,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] IB/rdmavt: Fix error unwind path for qp_priv_init() in rvt_create_qp()
Date: Thu, 15 Oct 2026 13:25:18 +0300
Message-ID: <20261015102518.15780-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If driver_f.qp_priv_init() fails, execution jumps to bail_rq_wq, which
bypasses bail_qpn. Because alloc_qpn() has already succeeded at this point,
the allocated QP number is left unreleased.

Jump to bail_qpn instead to ensure the QPN is properly freed via
rvt_free_qpn().

Fixes: 5190f052a3654 ("IB/hfi1: Allow the driver to initialize QP priv struct")
Assisted-by: LLM
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found while investigating smatch warning:
- drivers/infiniband/sw/rdmavt/qp.c:1182 rvt_create_qp() warn: missing unwind goto? 

 drivers/infiniband/sw/rdmavt/qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rdmavt/qp.c b/drivers/infiniband/sw/rdmavt/qp.c
index d8ee485c49a6..3602b9ff2196 100644
--- a/drivers/infiniband/sw/rdmavt/qp.c
+++ b/drivers/infiniband/sw/rdmavt/qp.c
@@ -1173,7 +1173,7 @@ int rvt_create_qp(struct ib_qp *ibqp, struct ib_qp_init_attr *init_attr,
 		if (rdi->driver_f.qp_priv_init) {
 			ret = rdi->driver_f.qp_priv_init(rdi, qp, init_attr);
 			if (ret)
-				goto bail_rq_wq;
+				goto bail_qpn;
 		}
 		break;
 
-- 
2.53.0

