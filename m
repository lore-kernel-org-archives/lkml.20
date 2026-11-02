Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598798;
	b=Xeti3nrosqO9x/mbInxk9y2lPYhuVhtdOOV9/n3McNEMlm7B9a9VldipyijG0WTPTKP9
	 G3KCjbOEza3IZB8ONdrQaozD4Xx2FCCi4yqB8xidK4wtCG6vkTMtsXcX4sJUZZnbpAJjh
	 bx6A5Kt9vamGPiaCncKuEGbeIqlgaVSkmcjzwp5WgFMWgjafREHs2Td2FrIyP2BABPwuz
	 ZTRo/JTGr34jDOy1M6Ol3MgFw/cHUEvW5MtfP/7e9lrGVTjBN+IJCRSF17OZKgCCJld1i
	 dNr42OMI5OM/LFR/cPxiGjNeJg0QyC/8h6q0Q3jqfNjE0hU7HrXiOJm3ujkafgCFUXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598798;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=Z7VOfdGlq/tsCeMOtC2n9BnTqm/JFSdUYGKJP6RCeBo=;
	b=GLVpxEsz7lSXEd7+damAY2MxyyPk0votdk8yB/U7CWqG4AZlLuz26BJmJvwV55g6XbAu
	 3aQ+oqaet7YK1DUzfBUnEfLO1FR4gXt1BktD4gEECklH3h03+sdrdXuEB1RAEh6fcYtSc
	 M4iSYQbiQQ87Tp05jGCTrTvYCWzEK8tx5ACUYUaMavDQuIMGtZYrY4U+2RB+bxwWGZ3oi
	 RSqiI5jEvMze29ezkgB5QOLAxEu/JMrF9AiLBp9/rDXp1s5MZDChijqVKRhg+c6ZhfPYp
	 FVc2oCcx2geZImX+NzHeHfJ5ouMOCPPyv+pq+Go0VlI9K7fuv1w41Puw+fbUGsEdXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=opBW3e7b;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD8A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=opBW3e7b
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261102055314epoutp035ae7ff77d5b887a8731bf45e137790a2~kJJnZP9fj3208732087epoutp03o
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:53:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261102055314epoutp035ae7ff77d5b887a8731bf45e137790a2~kJJnZP9fj3208732087epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793598794;
	bh=Z7VOfdGlq/tsCeMOtC2n9BnTqm/JFSdUYGKJP6RCeBo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=opBW3e7bzHmRE2ZzbOc3KQ10qwv4NmjJRYGUVk8ylM8JEQSOgsZBLkLn0+duMYfxj
	 iA8Jw3PRAFg9veWaE4YTehiTs8Vb9/uaw0d81HRMQaZ/t4gHBq3+1aiQSubVrJoAwe
	 oiSX/HfAFWuHYhFcrOh3wWoLfdrips5urGaZIENE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261102055314epcas2p3a6521855070a25e6afb4e8cff7ccc699~kJJnBzYxv1401114011epcas2p30;
	Mon,  2 Nov 2026 05:53:14 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.207]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jJ18V0t0dz6B9mC; Mon,  2 Nov
	2026 05:53:14 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20261102055313epcas2p236ca7854da996b968f37931db6e5258b~kJJmQnarW1991319913epcas2p2i;
	Mon,  2 Nov 2026 05:53:13 +0000 (GMT)
Received: from apsw.samsungds.net (unknown [12.80.211.160]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261102055313epsmtip2dfa5bb0ac1ebb60a5ab009d134f0d171~kJJmJrZB10957509575epsmtip2s;
	Mon,  2 Nov 2026 05:53:13 +0000 (GMT)
From: Kiwoong Kim <kwmad.kim@samsung.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	bvanassche@acm.org, kwangwon.min@samsung.com, hy50.seo@samsung.com,
	cpgs@samsung.com, h10.kim@samsung.com
Cc: stable@vger.kernel.org, stanleyjhu@google.com, Kiwoong Kim
	<kwmad.kim@samsung.com>
Subject: [PATCH v4 0/2] ufs: fix the abort path of device management
 commands in MCQ mode
Date: Mon,  2 Nov 2026 14:52:56 +0900
Message-ID: <cover.1793598099.git.kwmad.kim@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261102055313epcas2p236ca7854da996b968f37931db6e5258b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261102055313epcas2p236ca7854da996b968f37931db6e5258b
References: <CGME20261102055313epcas2p236ca7854da996b968f37931db6e5258b@epcas2p2.samsung.com>

This series fixes how a timed-out device management command (query, NOP)
is aborted in MCQ mode.

Patch 1 makes ufshcd_try_to_abort_task() skip the task management path
for device management commands and clear them with ufshcd_clear_cmd()
directly, as the single doorbell path in ufshcd_abort() already does.
Since the conversion to scsi_get_internal_cmd(), ufshcd_mcq_abort() sends
these commands to the QUERY TASK / ABORT TASK path, which is meant for
SCSI I/O commands.

Patch 2 makes ufshcd_mcq_sq_cleanup() wait for the OCS of a device
management command to be updated after SQ cleanup. UFSHCI does not
specify the order between the OCS update and the SQ_CUS update. Without
the wait, a late completion of the cleaned-up query can race with the
retry of that query, which leaves the host with two query contexts and
raises IS.UTPES.

Patch 2 depends on patch 1. Without patch 1, ufshcd_mcq_sq_cleanup() is
reached for a device management command only if the ABORT TASK TMF
succeeds.

Changes since v3:
- Split the v3 patch into two patches: the abort path fix and
  the OCS poll after SQ cleanup (Bean Huo).
- Explain in patch 1 that the problem is only reachable since the
  scsi_get_internal_cmd() conversion and add the corresponding Fixes tag,
  per review.
- Add a Fixes tag to patch 2. (Bean Huo)
- Fix the step numbering of the timeline in the patch 2 commit message.

Link: https://lore.kernel.org/linux-scsi/20261030111045.982094-1-kwmad.kim@samsung.com/

Changes since v2:
- Use read_poll_timeout() for the OCS poll in ufshcd_mcq_sq_cleanup().
  The open-coded loop did not re-read the OCS after the timeout, so it
  could return a false -ETIMEDOUT if the OCS was updated while sleeping
  in the last iteration (Sashiko).

Link: https://lore.kernel.org/linux-scsi/20261030093645.790159-1-kwmad.kim@samsung.com/

Changes since v1:
- Limit the OCS poll in ufshcd_mcq_sq_cleanup() to device management
  commands. ufshcd_compl_one_cqe() copies the OCS from the CQE into the
  UTRD only for them, so for SCSI commands the poll always ran for
  MCQ_POLL_US and then failed with -ETIMEDOUT (Sashiko).
- Return -ETIMEDOUT only if OCS is still OCS_INVALID_COMMAND_STATUS
  after the poll. OCS_ABORTED, which the host controller reports for
  the cleaned-up request, is no longer treated as a cleanup failure
  (Sashiko).
- Update the commit message to match.

Link: https://lore.kernel.org/linux-scsi/20261030083311.602909-1-kwmad.kim@samsung.com/

Kiwoong Kim (2):
  ufs: core: skip ABORT TASK for device management commands
  ufs: mcq: poll OCS after sq cleanup for device management commands

 drivers/ufs/core/ufs-mcq.c | 21 +++++++++++++++++++++
 drivers/ufs/core/ufshcd.c  |  4 ++++
 2 files changed, 25 insertions(+)

-- 
2.43.0

