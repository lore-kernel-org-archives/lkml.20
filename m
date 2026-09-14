Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D13B058F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370492; cv=none; b=c7xhxX/rNwAfv/9VGzw8YphPO2bfxu7tPhz4CalNWMnH73rd2aBLo1h/j4Eo6DVy9Em7do5cvarondthlwF/A6S5IzVMi986/9cpBhnQJvLduyWq+79R36beXkBzZCIVYw+UAoyT56anHxL2WxJg+cNErNZPCwOTElt4sws0P3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370492; c=relaxed/simple;
	bh=Oa0dPt8wRWwDv4w5M5fcE+11BbbC+L0Crshyd0d0VmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxKd9JRV7S/d8oq9sVlnEMwxszRn/SAu0FeVRqUeHdpUoRFmieREQ0kE75HKTPFnIrD2VjEBfq6RyOowBbugcKykljX38QtWTAErVit90fn1evg+w39EnSBnjY87+IPmbtmnBNxYT6wMlEJIxjuRv7P4x3qZZzxMcytAWfqR/64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=p3i4FPNG; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="p3i4FPNG"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E61Rwa1214259;
	Mon, 14 Sep 2026 07:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vkSsW/
	YiYIxr2kcixGxovIRFYIOnEmpWPSa0DA+PTsQ=; b=p3i4FPNGlVUjp6ZBviJ55Q
	grDiX0eKTOzbl5rXD/weOxq7p0thCgZJjwSprOlJd3D/WUazbu/SHUgk5JhGASWV
	79zUwiQ6C8SYE8PMbhoIbUKfQpYLcHfbNhvxYNQoUQrCSNKlL6j9FT0rBiobJP5f
	gctTa8nAUnXUqYcQ7yL9NSVWL6eGvh5Ttc+2rwX6kuepkE99mSKPCHIOK+nOTlc6
	lZIJV/WR2ldhZUwCLocNqZI1tjNP+KtxQ5A1LAznENXzkgfOQvPKVRiASgKSUPge
	KtGCjbK0CGFcurTPYpefDiilO0lfwmjRUijZYRigsv2I0lQrSyihNz/46LYuSbsg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmx83ftht-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:21:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5oAtJ1787585;
	Mon, 14 Sep 2026 07:21:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gnjjgmfwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:21:15 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68E7L96349873210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 07:21:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 721E92004B;
	Mon, 14 Sep 2026 07:21:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1015120043;
	Mon, 14 Sep 2026 07:21:05 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.93.83])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Sep 2026 07:21:04 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Aditya Gupta <adityag@linux.ibm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/prom: Remove redundant early_init_dt_scan_root() call
Date: Mon, 14 Sep 2026 12:51:03 +0530
Message-ID: <178919368043.441103.10019829068499885695.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260418091250.134111-1-sourabhjain@linux.ibm.com>
References: <20260418091250.134111-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyYI6HXZzfj3W
 1NB9AteNb9vY6hTfxhqYvJbzxxrYKUmiiBu4rBNnNNvTsMwYnnUDWYLw5fXn5wutCg3yZUJ+OeO
 tFrutRgklXgXaqYQfmvM8JUVyusFzRgZ7CPbAc6ZRJnXeuOnr92BIICxhE6YWdM+6ozzVl8LnMB
 rtYN+2zZlyv+fX73aaamctpJ1t4Ebfy7XGURRFRrVXC4e7Rj4nI6gN8KxKbwtNDANjnF6VQFy8b
 T0uhhF9KjJqp3o6FT+JLkemHXmpstIKN9JYMx/Fx2rnoA7NiQ8kDnGEOjm1dh2B1MZ2/SX5TL1x
 POSebTVaBozDOFsAfn5ncYp1HRL038hLuZ1DuY1xoVXthXuSyaDWT+ZenogQ5aRI7Y/040M3CUv
 LKKzxydgRC3hQjqMrERhTzjK4lTSgd31ybWk12Tulk9AhYBrr2K+h9w9LKBI/kdHXKPBDaKOyCb
 VxGLkhGUYmdhDqdkp/g==
X-Proofpoint-ORIG-GUID: qzabzMd1ZeT3s7Hbm9foK0tWWci0jy5q
X-Proofpoint-GUID: 2N8UGprZKgA6tPD_JfdsiKOI0N4ZYf6b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX1x2QSk2at+/U
 FXU4hFiYcWzezEBfdmmk8xVETFg8wRDND/EfaEBrTMJPnWvT5xsEQt327khLNP9PnnktQtThAED
 L3K8IWGJscHdxck3MU+QAByT58t9MUg=
X-Authority-Analysis: v=2.4 cv=cY9HPXDM c=1 sm=1 tr=0 ts=6aa7a06c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=mrly7fLVJiLaC4xhfc0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

On Sat, 18 Apr 2026 14:42:50 +0530, Sourabh Jain wrote:
> Commit 554b66233623 ("of/fdt: Scan the root node properties earlier")
> moved the invocation of early_init_dt_scan_root() into
> early_init_dt_verify().
> 
> early_init_devtree() already calls early_init_dt_verify(), so the root
> node properties are parsed before reaching the explicit call in this
> function.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/prom: Remove redundant early_init_dt_scan_root() call
      https://git.kernel.org/powerpc/c/15f3ce3aa218f6d4cece9101f1af4332e8712e39

cheers
