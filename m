Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16251599D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748906; cv=none; b=qOgcNfQvOVf6eN+sx+r9HkVYn1W3cqoOG6gKjOTCrWKUFyZ3iPDT5kl7b9mQJbYy5StLRnTnH+N2FShaz6X9LCtzwTCU/a84G2uLB+VA8bTic8hzcjwz3NeMpefW10eAGrYmqdoT+zlwmaxYwyuXvM8yYcq5RqhWGFAQcDEQ08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748906; c=relaxed/simple;
	bh=HW6m6mS/77Y6CKtFCqboPaczP4TpWVieFemOcQJ9y2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FKBEowtbmlt0qIKNiHHgXlCfFKBrcXw31100/yBHXAYaH7ukILdo8CP7Xclt8cAaIO8pciKXCkINN28DEbrU28ydwC2G9Q5YLDXEv+kM8FEyfyR87ufXMHnE3OiovH8OMxkC45ySnsHd06qB2Cnm/aiPjDlV4r+kVVYsdrMtFnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZZND4UWl; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZZND4UWl"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDW1XJ217949;
	Fri, 18 Sep 2026 16:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=iLjgYPxddNtuBGrPgnvvpKAUKmcAkKJxdPmq3t2sE
	QQ=; b=ZZND4UWlGxT/PRFM1rdp8KD92tmlaXjt8oyVVpRw4Fn8SLtFNr0VJOiP9
	lb+USctXZ6RY0LW8aaWJNtOfy3YQc7G1Qx4rH6p4cxPWTa+pv+1zzgawVtUJOwsU
	k4qTESOy1PLupCd0I9UKk1KcXIoa0cAsKKuAmKWmXWAmKW03kv3TIhoAOvjAJOX7
	p1cnhrOBvBiVQnEhzywiYbuB+6t77dY6Pm6bZef3m+9tbl8ncRz4Ir91FxaM9akt
	so7IZdEhIJKcfDvND9ooor48raD9sahg2DGJTjKgMUv68a99BpMOnvpxZtwTb7Cb
	xOyC5nxdfuCq0jkt3/f83RmWIfUrg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmw5egpay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 16:27:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNq2o739423;
	Fri, 18 Sep 2026 16:27:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gs56q8x75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 16:27:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IGRrLV47841640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 16:27:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D30B20040;
	Fri, 18 Sep 2026 16:27:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F53820043;
	Fri, 18 Sep 2026 16:27:49 +0000 (GMT)
Received: from li-a84c74cc-2b13-11b2-a85c-acdd023f0674.ibm.com.com (unknown [9.61.58.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 16:27:49 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        gjoyce@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>
Subject: [PATCH v2 0/2] nvmet: fix subtle race in I/O processing and ns configuration 
Date: Fri, 18 Sep 2026 21:57:29 +0530
Message-ID: <20260918162736.802665-1-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIyOSBTYWx0ZWRfX3acdlFbCz79e
 v1JivbGRlXV/vbPVouw4rdtYWJU1gf6Z44anIWtMTYACe1iWoHDbbN+YvQBG0ilb/7thPcj2oP+
 OpeFlKhlrY0OdszgpQZ8vjKI3VhdLacElO/RYFqekuFvQS2dWQgMXUyCDSZHEjR3vXPk3uRnA30
 G1by77QXEWNq5mbGLuOEncq2NfQzWO3Vn5ZZe1GvYOmCe3q3zjEFYbi8deQjMug1z3xRBEcH54c
 Hdc1q5eqXWcOaXlgn9aE9wIc7GA15wgptwej5tIRHq+J9UKDCPTEZDEkMyU2HegnCKj1inpsGDh
 O4XyqCfI+RV0h3dhXBhUTmz8158E4X6SwVihQVwlTzli7yepOT5gdqsdwt0URBFZZ6dNzNc+XTO
 3fnOrkmDrGYUniEIefGtfIEsLxZDH0P6DfijJS3wUrWkU2mG0XpW996CctobEPPYq6y01499TCf
 +BcZz/jgbG3hAcVtwwg==
X-Authority-Analysis: v=2.4 cv=E/NYNqdl c=1 sm=1 tr=0 ts=6aad668e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=fAA4TpzF4eqHYy8hkuwA:9
X-Proofpoint-ORIG-GUID: E0dEO139w3rWVlbV47TIA2S68gkpZPe3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIyOSBTYWx0ZWRfX28zyyaqt7fT9
 JW+KPLC/TMYd378m6xH9U+LPMwJkcrDl17Q/Aw1Rm7xVPTk0dLQKqzrcSxiaMDwa6j8DrkQdiHA
 4bpeUBAH+zoV4U7ECfTcaiXX9IAweGo=
X-Proofpoint-GUID: E0dEO139w3rWVlbV47TIA2S68gkpZPe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180229

Hi,

This series addresses two race conditions in the nvmet core code that
handles I/O submission and namespace configuration.

The first patch addresses a race where target namespace attributes
could be changed while I/O is in progress. The second patch addresses
a subtle race that could allow I/O to be admitted even after the
percpu reference count has been killed or marked dead.

As usual, feedback, comments, and suggestions are most welcome!

Thanks!

Changes from v1:
  - Replace the XArray mark used to determine whether I/O should be
    admitted with an atomic bit. Using an XArray mark would touch
    significantly more cache lines in the I/O hot path than a simple
    bit test (hch)
  - Introduce the NVMET_NS_IO_LIVE namespace flag to address the cache
    line overhead of using an XArray mark.

Nilay Shroff (2):
  nvmet: defer setting ns->enabled to false in nvmet_ns_disable()
  nvmet: don't allow I/O admission after percpu ns reference is killed

 drivers/nvme/target/core.c  | 28 ++++++++++++++++++----------
 drivers/nvme/target/nvmet.h |  2 ++
 2 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.53.0

