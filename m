Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D43AFAEC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370484; cv=none; b=uID8hI52erVkX5Y6NramQLnYeNdV8ViXzBCKKdCIPYDp9eiT4ruRULwnoGCDepQ3+qVcrl8yv4n9OafWgD+K8W8NKd9FkrqGVWeTAXm/winNnAeCWV/usGgP9DE4J/se/Vboym6USzJ/mA4YvSqn5HYt3Zv2p4mKquCqsIbmYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370484; c=relaxed/simple;
	bh=u1sRkY1a+ZLWWeLAxqsX4qKKXpfCUhIciZv44Rrz9Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PP3VcFzZGJ3+O7+wGo4iIy22qT0RZObQMoBAPK5o5d8TKf4dEJSAFW42os3jlHIJZ33BaUNOLPRiqmfAoiUf0/dBuU8GJTBnGFWMpYEuzK/SKYXTSNCBVPFYdfnpDZrqWpLiFFsS3sLPIq4oCRt0ygByioKTOTOAiaZaDELuf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=j/r54h2E; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="j/r54h2E"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E61bui1219967;
	Mon, 14 Sep 2026 07:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Rrsrq1
	gvEEAUebyWkYRXmAor7uy0bZhljPymPF4n7tw=; b=j/r54h2EPzxhSdfUek8nb8
	a/fR4Tft61zlxId6xG8Wnvk5Ds6wQynhoRWP/fPhG6IB6NXpPoKc1MGWgKwKCcRn
	wEBe4s2L3YApWlH1ym6BbnK0dTXpc3HieD8RJrI3DgHuaJIbYcDQZwaJNraik9AA
	QXCKrXM7+Y+SnKlV9KZ6MDzwaektOv/3Q/Ycv5L8zNJQjiRlntKKqE1aUP1D9gOZ
	QpTel5qKqsFBHV9+MAhVsXWy7+oaOke2Cahlu64YMeINNZm6CSVf2ZOUwBQwChGG
	2+hJe9yILWacWikO0LEH6OhfkPnfN8DtsRLgKUrKZ3b8lT5ltVNLB/ZYTKbcKLEg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxf4qs0c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:20:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5o4qC1775082;
	Mon, 14 Sep 2026 07:20:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gnhevvp42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:20:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68E7KoOG40763736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 07:20:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 991E720040;
	Mon, 14 Sep 2026 07:20:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C3EC2004E;
	Mon, 14 Sep 2026 07:20:47 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.93.83])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Sep 2026 07:20:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, aneesh.kumar@kernel.org,
        Christophe Leroy <chleroy@kernel.org>,
        Naveen N Rao <naveen@kernel.org>, Kunwu Chan <chentao@kylinos.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/pasemi: Add a null pointer check to the pas_setup_mce_regs
Date: Mon, 14 Sep 2026 12:50:45 +0530
Message-ID: <178919368045.441103.4497545121257990515.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20240117091706.153431-1-chentao@kylinos.cn>
References: <20240117091706.153431-1-chentao@kylinos.cn>
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
X-Proofpoint-GUID: tBcR-VeGAUNBbq-Kuay96F5Kl2X5plBV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6H+MbKivV+wd
 iqopI3+hw1t9XoLHpT+pxGn2meds70MUdvztJiVRmgU7adjzj6RE1Ek6XH4Jhfv7uxfLBCLVyel
 hwOcAcZl9hzxnMTHZ3MKVl4qhPZOfFo=
X-Authority-Analysis: v=2.4 cv=cvgOAF4i c=1 sm=1 tr=0 ts=6aa7a056 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=-w1i4xx_hGGhZ5jEBOAA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: EOz-WbQtdjfuYzg_n1nttKfYkbzlJmo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+SoI+2k/zCHs
 8Qrz+Qv/kwKjwjLfgql5wtJOmXDSzEOpZ9CLHw6ey1iswQVgb3orRKwA404mHwTSDXocIfAIwI+
 YoLJ0IytraCbMitK+u2OvJTtOqR2syi2aKi3CBi1KVkVJW4pDs/CeiQ84KDoRsMZRItANsI6BFq
 uYCRnti9Oxo78iG2GglvYo+pnWF/49x3e3Udso/vZm8CKjNW0d3cTO2DfSIbLkIPjrNy6Ec0N0f
 SY7EVMDkIX0VnwC9M2lme2fWuhIRvxJPzqFi+FsZfLlOfKQW5C3bfOFtWie1DqAmftoC4sIkBJz
 tjZImLNsx5FoJkpB2HZaSRhPJpTCSeXrrdv2fTzt6lLeamrRkJWBVMpvJSn6ZAZ8yAKbcPlEljN
 ZyX1J2vOOaFQu7h5FF9mqTAxpTHZ2rvlhYfq0KRsIkek1nsKBOQeDga2lWzXmDxiB+HqKN3S3MK
 UP+CG3DUrqdhTV2rnLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

On Wed, 17 Jan 2024 17:17:06 +0800, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/pasemi: Add a null pointer check to the pas_setup_mce_regs
      https://git.kernel.org/powerpc/c/9e5c53d75c560a058abef0e4338c5e3e52cb432a

cheers
