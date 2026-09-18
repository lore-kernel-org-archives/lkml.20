Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040DC517BA1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748906; cv=none; b=OHoWSxmva8U+o7peMtckoSapurM65rYRKv6+uEGPGisieWcB+9s8CPZ3yucPkeN31iRNDeosNRp6ompEt6dQ64KhJkMkeOg7LsnPuIAEytzOT4CYFLoVEViAV1J2/OGUiMdE650FabSYmX1ghDHq8RqBZcO9ar6WFUNgsaoWOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748906; c=relaxed/simple;
	bh=rC7MRxNfUWhtYdVB9YR3RctIloKrq9Sq6wQ6PnHvyis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMJ1ZjKJNU5/LPLUZFeDmbtZuSkz0l1U5AtV1ty5qyoEVP+W22SWlzHjiEmNWU9k8ow14rV9jxV5DyOrXiPOeDoLteaarLPYapY1VyFBkoRBc0TxAnJsFFx1N03DWNjE6EDW9nFCMafcTEWWlh3njWyikaz7eakIBEC+zNPNodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WzyHo1Ma; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WzyHo1Ma"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDVekB1421307;
	Fri, 18 Sep 2026 16:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=CddF5Hh7/CFgpw+ul
	T6WRv2w8SNH3AHV4owBOHYChgI=; b=WzyHo1MaUUD6L/vJjEPwMslUGatWWNliD
	RyUs8a9Rl9wu+CDdyuUFWBRcbsWZtse1hLMaKTWpSQI++k29zQjKmtHOBjBYZ5+u
	T7YP+l0GhecjFy3ctI/4ylw8kBXhxpqXI+7e7bwghsxCR9002qinb4kLVvubQotN
	bBEV5H3BlbBPdGjb/7sPWD0yATA282IIAlSadQn9WRoNILb6j3t8VoZwuLS6VO3i
	SXLAW7DdzhmGbg2sbGZNrwj1EuG/tmyCVH0mRxc9d9dT+Rq+q8oU0rJTlMq5iY7P
	PENkwVJAuZZafsStn0qwsOEL4jWl1KV6iqinp3SiLxlIqdnldr/WA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcvgh8t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 16:28:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDO7FC695770;
	Fri, 18 Sep 2026 16:28:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gra3ff84h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 16:28:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IGS1aS44040654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 16:28:01 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A788C20043;
	Fri, 18 Sep 2026 16:28:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D941120040;
	Fri, 18 Sep 2026 16:27:57 +0000 (GMT)
Received: from li-a84c74cc-2b13-11b2-a85c-acdd023f0674.ibm.com.com (unknown [9.61.58.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 16:27:57 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        gjoyce@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>
Subject: [PATCH v2 1/2] nvmet: defer setting ns->enabled to false in nvmet_ns_disable()
Date: Fri, 18 Sep 2026 21:57:30 +0530
Message-ID: <20260918162736.802665-2-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918162736.802665-1-nilay@linux.ibm.com>
References: <20260918162736.802665-1-nilay@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIyOSBTYWx0ZWRfX0DS39BViFOLr
 4+lTJ9rkGPjhi9Pbmx/+NTh2Os58CGZCuey8ysbUDMcqFv0QSA6J+iCdnp6c7jZsfQ/wnn44RmA
 MAixh8sJM9l7au3DJQNj6CXYl47BkTM=
X-Proofpoint-ORIG-GUID: nUYsCzDVXhHQdt8ij9aikr3Njtxlin2B
X-Proofpoint-GUID: nUYsCzDVXhHQdt8ij9aikr3Njtxlin2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIyOSBTYWx0ZWRfX8s7uv6CSIvXL
 qRLOhmFEGDd2K9D6KhX11kZqHi87w9kuS1Sk1rE5+W1Puiq5GMFdEEbBRlQnN8/XxGMj7MJHBpo
 5vRIdwJ9yzZBn65YKRR1FLucfHc5IKIUWdTCoHd/qjDka1k0JdtYW0m+J2rg/hjVbJpsSWRUICe
 mr8zRm43/umWFY/cf5EYjBVzHUmcW/4r3Gwlpqz+jhDa8pZ7oeaAtwg9lwofDyjbCKD2N81MqT7
 pfxd59pqELJQTh1wrC+mJGwJ321Yx4kctWWDRkQYLkAvCZwYaAxOFwNTUtbIw+If8qELqN4VYD8
 Kgu6R3RF4968FH/o7+2E3LyFqMznwwMIVe7SfrqZmS++4HNiIhHWKkDSLFvd+c+xnfBLwuDp2cq
 j09WQXaZWyYFzDhQr7Z5fBXCz8NuM4/LTvuOfZ8voUOBVjyfhqFLFvOMk0MxylkMMM3VouEtkfn
 xorXr8+a+j7ftozs47Q==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aad6696 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=hbKdY98Ba3EgmsBfOz0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180229

nvmet_ns_disable() currently clears ns->enabled before draining
in-flight I/O references. This allows namespace configuration to be
changed while existing I/O requests can still hold a reference to the
namespace.

This can race with configuration of namespace attributes such as the
device path, UUID, NGUID etc. These attributes can be accessed by I/O
requests without holding subsys->lock and must not be modified while
such requests are still using the namespace.

In nvmet_ns_disable(), keep ns->enabled set while existing namespace
references are being drained, so namespace configuration remains blocked
until all in-flight I/O has completed. Set ns->enabled to false only
after the namespace references have been drained and the namespace
device has been disabled.

Introduce the NVMET_NS_IO_LIVE flag, which is set after the namespace
is successfully enabled in nvmet_ns_enable(). When nvmet_ns_disable()
starts, clear NVMET_NS_IO_LIVE so that the I/O path stops admitting new
I/O once the flag is cleared. Using test_and_clear_bit() in
nvmet_ns_disable() also prevents concurrent callers from starting a
second disable operation.

Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
---
 drivers/nvme/target/core.c  | 12 +++++++-----
 drivers/nvme/target/nvmet.h |  2 ++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 43871a8f56ca..1d4b4936bcac 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -448,7 +448,8 @@ u16 nvmet_req_find_ns(struct nvmet_req *req)
 	struct nvmet_subsys *subsys = nvmet_req_subsys(req);
 
 	req->ns = xa_load(&subsys->namespaces, nsid);
-	if (unlikely(!req->ns || !req->ns->enabled)) {
+	if (unlikely(!req->ns) ||
+	    !test_bit(NVMET_NS_IO_LIVE, &req->ns->flags)) {
 		req->error_loc = offsetof(struct nvme_common_command, nsid);
 		if (!req->ns) /* ns doesn't exist! */
 			return NVME_SC_INVALID_NS | NVME_STATUS_DNR;
@@ -623,6 +624,7 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
 	ns->enabled = true;
 	xa_set_mark(&subsys->namespaces, ns->nsid, NVMET_NS_ENABLED);
 	nvmet_debugfs_ns_setup(ns);
+	set_bit(NVMET_NS_IO_LIVE, &ns->flags);
 	ret = 0;
 out_unlock:
 	mutex_unlock(&subsys->lock);
@@ -643,11 +645,11 @@ void nvmet_ns_disable(struct nvmet_ns *ns)
 	struct nvmet_subsys *subsys = ns->subsys;
 	struct nvmet_ctrl *ctrl;
 
+	if (!test_and_clear_bit(NVMET_NS_IO_LIVE, &ns->flags))
+		return;
+
 	mutex_lock(&subsys->lock);
-	if (!ns->enabled)
-		goto out_unlock;
 
-	ns->enabled = false;
 	xa_clear_mark(&subsys->namespaces, ns->nsid, NVMET_NS_ENABLED);
 	nvmet_debugfs_ns_free(ns);
 
@@ -675,7 +677,7 @@ void nvmet_ns_disable(struct nvmet_ns *ns)
 	mutex_lock(&subsys->lock);
 	nvmet_ns_changed(subsys, ns->nsid);
 	nvmet_ns_dev_disable(ns);
-out_unlock:
+	ns->enabled = false;
 	mutex_unlock(&subsys->lock);
 }
 
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index dbda55895f4f..162e2fdd848e 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -112,6 +112,8 @@ struct nvmet_ns {
 
 	bool			buffered_io;
 	bool			enabled;
+#define NVMET_NS_IO_LIVE	0
+	unsigned long		flags;
 	struct nvmet_subsys	*subsys;
 	const char		*device_path;
 
-- 
2.53.0

