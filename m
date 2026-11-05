Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901059;
	b=srYbK1fK3ouLXqNvRVVGzg2Wez0WC8h777+HNyxeVA1LEaXNm4dAkUj2tmqXNEVQtoa7
	 PhPlraMWzhNI6QQEb7e63AMDmX0ksctaIkx55CP/AI31Jk9H2pIlA1jzht+3sjdc7Kmjy
	 o1AiAePPAqkXJWKo7HtFP1h98ud1JxMvi/Bcg+JPQwSDLVFGUGvZuU042GalYlwriwMrm
	 wNnDJ2+Z9zkApSQJZDVSFuJcxnfefuwhy777L27GWvwQeUAg6prwONAvxVvzMI+P8aQQc
	 cJE6Yg1WJMgqbYSFZ0QEq7fsVgJnJWfd3BPGrrvw0pHY7CGZIrRjO5tmykqTMpM1Hxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M7cEymzOZLIIrJvm4Dq8ALdmxrFPncHDTEjFCCwAuZQ=;
	b=Vtk96L4y+AOrtnbIdusuYXlAw7jaHQnq2fd3tGLM/jKYGLSiZeD/OZRv9Xb/ssRte8+9
	 ITT8wyC4TLWWvRUzKspeL0FGDwmPqjL7asaLQC4LFd5T26yqjKps2i2YJW8hwZOfaiwGz
	 HLp/oduVSf8hqECXFSeSLlz/R3d64KjpTLcciL1ZInaeU0+rFGNfRd1HuDdkYOIp1sBIk
	 YsXiEWzXT6H4sQLIC6wPMWlGgBHIDOng5yaUBEQYkgbn8EkORE4FnewNVoYokZwZ1/9pc
	 Iw5nIAybpuFvcKVPebBiLXz+5PFZ2XYi/ETh1m4kY//yjdi5GG/5SAK+dL5Jzrt0Buw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U+irHUeO;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFC606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CFC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U+irHUeO
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HiHDr2579485;
	Thu, 5 Nov 2026 17:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=M7cEym
	zOZLIIrJvm4Dq8ALdmxrFPncHDTEjFCCwAuZQ=; b=U+irHUeODLy2GFTgO1beys
	Z8j1UdHqtaeCGTtJDgcBBhQCFkyVdC0kSgYD1YVqE19iOwzLY9a5cl95AYK2ix1M
	eLTWwQBg8cUEtWo8a9uaKQBp8w9mkyQgn/BuHFn5ej3vfP9O7JYWaS2OM51CLo7g
	uEGfi0XXR54VzEdHyvDR+A67xETORkR6zi5HXF2QDNR0Ex24a3LIjIj2h2ylaZ8R
	pTn1WHPZ58b/2R2KizX+8HTYZHZd5OZPzGPdCD9RAC0rQ1dUmDxs8RXQ02Hg8q7t
	7+a+HOfCwQnJyENE+o8V1BvoOwouo/dN+WhaeM2zmb/NHIt465NDDDoWsJavsRfQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn80t47vf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:50:50 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HnxBh2075288;
	Thu, 5 Nov 2026 17:50:49 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hrdd7n14n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:50:49 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A5HonMK1639154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Nov 2026 17:50:49 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F276058052;
	Thu,  5 Nov 2026 17:50:48 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96AB65805E;
	Thu,  5 Nov 2026 17:50:47 +0000 (GMT)
Received: from [9.68.10.150] (unknown [9.68.10.150])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Nov 2026 17:50:47 +0000 (GMT)
Message-ID: <f94b603b-1e5d-45c0-871b-4bc96941b47a@linux.ibm.com>
Date: Thu, 5 Nov 2026 18:50:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/20] gcov: fix gcov_info_add() merge semantics for
 IOR counters
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Chuck Wolber
 <chuck@wolber.net>,
        Frantisek Hrbata <fhrbata@redhat.com>, Marco Elver <elver@google.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-18-sashal@kernel.org>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261103015238.3780910-18-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2h8oofa_vFqzC4GFvZbh7TlBn7MNTIRH
X-Proofpoint-ORIG-GUID: 5P6p7-gxYZ9YWc2mrSrk__8Byb2rMBzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX3bNqcn4kDxI9
 IKa34PNQqOasXjtcPK0sLR4eyRXLotpg6U4NDXsiH41VwS/wJswNMfagx+U+DgnMSaMvug+YLRY
 SXFACPKhVg+3UNOxGNH67ZGdrdQu1iOjIw5YdTHeJ7m+SXoS66nHFMxGoLZKeycg7pOA7Lfz7aq
 E3lyhY8bU0AlRbnez2+cZS2aaIkB41mAtJKNLCM7nFZdp78i8b5mrSY3+lC1JheRPgALYnKyuYk
 StvIkgX6cX0xl5QHltN4lrl3aCcvhCBPMFvdvc312DJF3l+cdLqLh0ExzXqDFyGltD3KJSdHSEp
 wcII37aKbNuvDEpBKWCuxnbWJneIybGZuDPi9dTeTErgoO+wILJoWLJnEY6xlq+ZRcZQ/YgZGt4
 /+hNOYikUKsC7ptHTI3r1jKFuZ7gC5rnfZk2j0R4LJOwkSK/Qpun5wIYKGYpWo2ZcqAy5ZUFkN3
 6Q1nzuKUuM3d/WaCt2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX/8TZ/FfcQQo0
 m6anrMsAclLsjLEN0CItxgbSi4DFsoSG8Zcm1Ad7gVhtPMGRpNE6q2T9r6DPmyG6+OTUvPr37sl
 n8594CSiqwQCseT71aaGPFa7OKsv6Cc=
X-Authority-Analysis: v=2.4 cv=FIqOVOos c=1 sm=1 tr=0 ts=6aecc1fb cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=JJMpogqkKgZq-FOXKlsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050070

On 03.11.2026 02:52, Sasha Levin wrote:
> gcov_info_add() unconditionally uses += to merge all counter types.
> This is wrong for counters that use IOR merge semantics (bitwise OR),
> such as GCOV_COUNTER_IOR and GCC 14's GCOV_COUNTER_CONDS (MC/DC
> condition coverage). These counters store bitsets that must be merged
> with |=, not accumulated with +=.
> 
> Detect IOR merge semantics by comparing the merge function pointer
> against __gcov_merge_ior, matching how GCC's own libgcov identifies
> merge semantics. This fixes the pre-existing bug for GCOV_COUNTER_IOR
> and also enables correct merging for MC/DC condition coverage data.
> 
> Fixes: 5f41ea0386a5 ("gcov: add support for gcc 4.7 gcov format")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D
