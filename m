Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593173;
	b=FllJ9ZFqQSY9h9jHtC1h3dtvZhyUBJe2baCMlxxMGnbnmRAfbomhrt+NI2NK2Ka9Avz/
	 H7xVbYO/ttyiJMZpZTnt06FTbRrt7Pg5cozELhBYhX4eD180fJB+/naA8RyEuZDM1e9iQ
	 42DxQIgJdaEKZY0hBazTrjmUWamMxJ+0KjDoxs73cVP0jy1z+eojwDoREnUs0DQ3/65/j
	 eBLUraDYS8AHF4SOgk3Mxya/1ac11z6YkIcDywvcW/mLDEDD5yeydBsaX/qCWnhy9OkXb
	 SOFPN93IVxqd+B1TR4DYLKoDxK42WWkoRnM75WZNDirsSyS4TZqadiA7c7k/K240GKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593173;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=GcLCVP/byW9lB9utLT5Cp39Wp4fsLagjwzXlyTN7rY4=;
	b=kLu0DSQKrPFSIrVn4fxoB4HmugCyRNK4pX3XUCnVPBAkbvlojFKQl+5uTKAQTdQ9Wi64
	 EowoMaJ59D0AX5hMv9sifbrHSGkbZVmelv/rmUH4XpClQIewwGpqjqOPzgQiZiiOX2UPC
	 pb8muFLIXO+2vXQ75IRX4/kXKWPUF/QxPrQovM72qbOBDbssOlaF1z+wBuYT4XRBCYUD7
	 yw75KLsU0lLrNOhja/j2CEjUCbXPnD/qhesjVe5ntV3T1etNtqd28x1rT8TLefLxywQDB
	 Vbz4QX+uTzC5jV+/pDjrdJY6PZL60IQRV+4HLDHDghaLxx5T8NicpvcTuoGfJOInHwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b="cbtwD5/+";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RIeES4Wa;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9126A606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9126A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=cbtwD5/+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RIeES4Wa
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EC9677A01CD
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 01 Nov 2026 23:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593171; x=
	1793679571; bh=GcLCVP/byW9lB9utLT5Cp39Wp4fsLagjwzXlyTN7rY4=; b=c
	btwD5/+J5k/B37rKUQUXXtwtY/+J7ywoTypAABybTISlKybxxCPSUAwnSy/HHuDT
	hQ5CYnv5LnNqmPe5tEU67Nvtifme/Sna0eQjBNo/9+Rd7+FOiDgCI89nE3oROFDk
	Q+IK6Zdn9Ev1gHPqlwaTwtPzY2ratW+KyhwGG9tH6+ltv18yzJ7ZJz9aDnYQVg6c
	sczER84xgEJl+UpUtnRwPCxmBME+d3yS4EZheJVH1hubtq8nZIDHZZrcP10wQtg1
	02vH59gSo87tQvhHua4J/nNRJWIGMhBK0ijCOoTqu77HqE5NpqhXa0MlpBKXPeMj
	LOniNvlhejSCtAgMkoe/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593171; x=1793679571; bh=G
	cLCVP/byW9lB9utLT5Cp39Wp4fsLagjwzXlyTN7rY4=; b=RIeES4WaZKZGwTZmB
	6VRxIYNBSiOKsEhEm1XPt4LEFDXczXZky+HLoMLm1ZOJ/Wf2dN7Yo/Z9zR7sPQZW
	LKAB80rzVADC3p4F5Wlx7plDzDv5pInzp+6XtLUSZmaxfh/5it3BczZ189hFX/oI
	HmuxJJOJkdxRZlJcizw0sVPDl8fQQb8la5uKk54mQXDIMiwTuIZKCE3UUG0jp4RO
	FYFHfsHgvwPY8xSo265l+syp65Fr6/FU4OaOz3wtjUj3YWqAIgI+xl/i+Wl1wYQI
	jmPOkm3rks2RlReRHSPPu3i8iQMa1NY5ZXeXXqVSLUery7JCsGEEscZMNioG7cPD
	/SXig==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593171; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:hXO7bFnEpQHkzAEmKsVnCzWdER+AIMQB8wcCfzsuBzPJvxj
	yzEjzKnRNf7Z+T1DMNowLTUtebw11iBifHOc9T5lmCxe0jlhug0wR5hGfQvQABih
	xo0FSkUprtE2JNzUe2vW1g9e1t1q94uRdUiZHR6RlbPBk/XrrBb1CpDfP21GARpF
	SamjYBW+Ki/AXOzGNtIaesRD7PKCk70Yy3sdmcba3GhpTy4RIuBhxHIsJGml3hsw
	gBXLoot6MD4o8HuKBYNSeiHrtudWOevffqcQ9EMyovnCpu1GyK9qdIgZ2o5YB0ef
	8ScOMy8dY3xPVPERWvnmDfm2+T8rMyO1r+Xdbww==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:p1aiqCTUZu7J7dtenG6Zd3fJsbDjdqDGjmrq2nAUUGo=:44Fz+fDYgIgGfTki3TYnOkRd/t99zQxfpRu9/6hrkcY=;
X-ME-Sender: <xms:Uw_oalr2HVDttZH8cRa8piYLOrQ8nOKhBcG7CmVkqbjJR4zbAINiVw>
    <xme:Uw_oalkJ6VbJk2c8lSsA-7n1sV6lYERu_ekfcA52P-ziaDlCZdydIXfFFwX-sVEMJ
    5sEvuA_XEy7ZZnYvknDlqDaOlQEbwLV-SCpKZRvRyJueXQM8b2vRMPbng>
X-ME-Received: <xmr:Uw_oapxucRXYQJ-FRCSf20fZTFuxD4wQ9nplNE7bFfcF2yG757L6MKNYfn-1IucaxmE4gP4gezchdUkU9ahBdwKMO9b4U28q2Vvki9DNGiYOUA>
X-ME-Proxy-Cause: dmFkZTGTA7ypb8lSnU98o05UzKcmT11qhFUV3HwDuCeH6c1SeZQuM8+DCBOa8yufLGsjH0
    kxzXb5vqHLhUV9lJCE2ybZ1uCJlxcTtUAB8T7mKXexrw6o4707CjSaTFsra8dIs4piXY8u
    7HCNChUgEupPlh4phugR24uBJdud5L4NOlOPm0TBzN4H28Kd5ma9CVxAaExfCd6OQc81IC
    /V7MupcUsV1wg9TP27eDdtq1ktF3iA3WpjDwu0JFZRfc3s+ihwAHCA4MJFcE/SMmhSY16Q
    DCyMgOjMkG7AzOIOXSVdxCaJwqDJw2sLbkwy3dfJqucdrQepAbN5shtGH+Z3KXB30X/ckS
    JfJPzCmPFl2DyU/f8XroESpZx2tZuZxxmeePBhezdiogjHyCNajoO5S+6GNhtnoG6KjCMM
    VdhSgtAlgHGpl2zLh15Me0ue2TDVWaXRlnW8IGacOyajUsGVIg4/I4HdJyxm56/6eSJw1T
    mLGQN0FLhNR06Pvq1OS6pR8wEUc+mtuqGTcyCm2PlUbgaaCLStDRQ4PVbI4RHtxrKE/uwB
    k3NKbDnOw1E9moHZ/33psiJcgm90ChfKMDYFf0mmqofpDr4cfDnKMySqAiNQM2YJBAeAVA
    yreYPqqaGRYbsGcu6d1gDoQ8uhxF4KziIEpP11lhv2ogWvUqqsQyrFaGm6Iw
X-ME-Proxy: <xmx:Uw_oatkrFOgNXFjA7JQHj_BZMCSFBeplkGoUf7ngP9n689XZafQCxA>
    <xmx:Uw_oaidUnGXJX2_zi4WnmLrrZH3vSXX5ymlzJmlkZEbUAtK10i83jA>
    <xmx:Uw_oajrW8M7RoscNGvq4xVZDGluJBGgHL3eHjkQcgsm-v4eq7ICpvQ>
    <xmx:Uw_oag5b-Xrl-R9o63dKWBIxQy46P6CY7vsTDm3DidyFZLZXpQfLAQ>
    <xmx:Uw_oakeZX9WvPRNqRArjzxWGvOM8o3-PYp1xwz1com6f5wergyWdJZku>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:30 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] firewire: cdev: enable compiler-based context analysis
Date: Mon,  2 Nov 2026 13:19:13 +0900
Message-ID: <20261102041913.1187814-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel is transitioning from Sparse-based context analysis to
compiler-based context analysis, which requires LLVM/Clang 23 or later.
Individual compilation units can opt in to this analysis through their
Makefiles.

Enable compiler-based context analysis for the cdev layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firewire/Makefile b/drivers/firewire/Makefile
index e27fca37b4b2..0e5e7027f22e 100644
--- a/drivers/firewire/Makefile
+++ b/drivers/firewire/Makefile
@@ -4,6 +4,7 @@
 #
 
 CONTEXT_ANALYSIS_core-transaction.o := y
+CONTEXT_ANALYSIS_core-cdev.o := y
 
 firewire-core-y += core-trace.o core-card.o core-cdev.o core-device.o \
                    core-iso.o core-topology.o core-transaction.o
-- 
2.53.0

