Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990605;
	b=F3vl8BAEaZADllWvgBgfoBiBZWBIXCv1qsmq71fvc7FVISyUIu8sTNhRw/S6/Bv3RE9n
	 XafhlL02gy+MV01n+jndQKXKG5k3HPEBPCKs7Z1m0CscLXaMGQJMl/VPdas3CTwCKAKJt
	 QNWwoibCZpB07TnM4cOHTQv8AK8ZR+EVcW90WyXMPObsJvR0lPdj7fluGJzzVwLGvmakS
	 08J4hi00DfAgkQh3NlrlcCPsAsgPvXFn7UKjrFPl8zqL57c9mWZdqMagytgVrsoYChoc0
	 scHObuFOlnpdhow7l/XCQn2d75VlK08bjhNJIEdW27gUHpS3QexhWxV6wiSJW2+QhZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990605;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=wPGqgpq4ILhntLdO389LmeXWfjnrM37fQMQ8Ob9CkJw=;
	b=xJaJOGMj9JQvSHhP+8obD7bnEAcIvBUdhvmElVvn1iahxXIy+zwGAAOPID4awQ+0CO91
	 ryBYt/g/Jx5jcqgzb2evC8TmoL/sB8akMnG5AcAuNuQJtX1aRvohFdRg22qlz06mQK1bX
	 ws7+hkO6aa2MHPsFA9sethc1lS/9gaJjINqnslwV52+Q8CVwMtuenfL2rCpTOvnjXPFKG
	 v3awqvgmqjeB9M8VxLxH9+lviNKdczvbatMPySJ2MRCSwdx//lyd08VBL44hCyN78pyat
	 R065dF7dHY+W3+oqvM7mOn3IKzM3Gu9Hko//EXPDDHvwNQ4CUTdzirUUg3r+D0SLXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E67606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E67606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A6IeLQC1544155
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 10:43:23 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hs3r0x1ex-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:23 -0800 (PST)
Received: from twshared9449.02.snb2.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 18:43:21 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id C5E5E2E8EFD4C;
	Fri,  6 Nov 2026 10:43:07 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>, <linux-nvme@lists.infradead.org>,
        Andrew
 Stellman <astellman@stellman-greene.com>
CC: Yuehong Wu <wuyuehong@cmss.chinamobile.com>,
        Nitesh Shetty
	<nj.shetty@samsung.com>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261106134313.34829-1-astellman@stellman-greene.com>
References: <20261106134313.34829-1-astellman@stellman-greene.com>
Subject: Re: [PATCH v2] nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in
 configfs
Message-ID: <179399058779.513959.11542324887752959416.b4-ty@kernel.org>
Date: Fri, 6 Nov 2026 10:43:07 -0800
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
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=Cucq4X4D c=1 sm=1 tr=0 ts=6aee1fcb cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=VwQbUJbxAAAA:8 a=-y6Pi5ZMLliYdh8cQ_kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sxAzdLoZRR9viLPzmzPQvfJandoPd84j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX/Yd6B7qfQZUj
 v8yBBUili8pvCaU/lvLb8xrhIYdViLGn8q89zHSb6K0Cq9042+L1iG6VXYXSkmVTMRwrARU1hcu
 LDtj8yj4OLry94g/zI+inDcbCZmJFi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX/hx4ozvP6Gg7
 QHJDhXccjEf/4UYEcifLLnrjUj0AnS81WvZsPpSo9j5yFumaCznPEGn249z9CAmnlZIljtasPQY
 9bAEfM05taNt3lz2MxY5GA86JqqVAXJwtQv89csVp3pk240UAjOHdtxl/7bs8TH3z4SlCJciZ1O
 T39HzXrr/3HsQAhkgFTHMEzGDQf4+5pB9P8ubtFWL+IErVFrRqexmECASCB/cbLCEZBaS1sZIMB
 G1Q4q8jgxYseOm6VD/Zq5A3rH/4es7ijinII/ALXOzMG4AA93v8KSGBSYdisnCuWzrguZ0H7X4L
 ftq7KQ8DIJpPXZxf6WqG8SDgQLwCMFIbQAzfK1HAVKeIG+lEWf0bkiEUiBqGvlE0Cz8JiCY2F/W
 SewHUJar+SR/ogM9QD/csJWJuUwsj8qvJTQl3/WQEjW+hZ55vo/yVVIQFbgiUxdo14TzCF22Z7C
 wdf6xTUfezkQZL24iog==
X-Proofpoint-ORIG-GUID: sxAzdLoZRR9viLPzmzPQvfJandoPd84j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01

On Fri, 6 Nov 2026 08:43:13 -0500, Andrew Stellman wrote:
> nvmet_ns_ana_grpid_store() accepts an ANA group ID in the range
> 1..NVMET_MAX_ANAGRPS, and nvmet_ana_groups_make_group() accepts
> 2..NVMET_MAX_ANAGRPS (group 1 is the default group).  Both then pass the
> ID through array_index_nospec() with NVMET_MAX_ANAGRPS as the size.
> That helper treats the size as an exclusive upper bound, so the maximum
> valid ID, 128, is rewritten to 0.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in configfs
      commit: f3c20e42ff5628b93ed0084154cf62082a2157b2
--
Keith Busch <kbusch@kernel.org>

