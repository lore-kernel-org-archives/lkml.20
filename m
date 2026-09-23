Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44AF43CEFE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144044; cv=none; b=BdZofOhprb0L0uFDy9B4cePgV/2b6LrvQ0y/ki1rLA6oqgPJ9jOenHSl15eVu5jghKstpSEgV4PfjKIVOhPDF3avSSf+M2taJEDUgFW7VOlimUFYQUMt8PVLw2CXdzPIukru3q88CdYNlDVwix6MzZywCrnYyQHhUATxiI6/IU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144044; c=relaxed/simple;
	bh=+Fuf5V4QdagabkdhWoW24eWgZzIj7hWme4ib6xqrKLU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QN8l+ma6kjulGrF4EndH7qV+YsEP4pYjwJ1o05AofD0ewD09Ht5PWC46yKFcLxfaudWF08VNmcdw5XeFjVveNJk9lPQM6cKSuV1YUQ/c5dasSSDfkOT8aBUhRqvy55vxpnl+bNWxMRHoPQuqU0N9pN6CvRY26zc3MVBrvIfxV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SnxrL94T; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SnxrL94T"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N45coL2384522;
	Wed, 23 Sep 2026 06:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BPXVeq
	lpcVmP+7XM6OY0LDt1ekDGxsj9CyIVqZKmAeA=; b=SnxrL94TG3pj3PN08O7pEn
	hR80YGyG8yCBMPkdr11B4zbWue9tzjRICih6jwZNY8J7LeNtH6yFfLj231bRFnPY
	wd3PfAloJcN0qCwhtCCArXZMcqk8h04eO8qNZy6xJEM/4rjrWeK6HBpVuw2KuOKh
	/aY9YYhIOCSm1q/qnzRsoInvINjSxZmCO4JImrBIFR+ASh3Y1V3W5QnAn479mKWB
	TCz7OrJb48181AxSFB6PMN1DWgW+70ph9xt5gbA2kR5iom135aKrMblkZyXlvlLv
	hYRWv+iNP7jwsHE5mk/5RPvfLEkgqlWj9lmE9CSJJDTgH5wXgIfTyR4HGFM46aYQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskdv95pp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:13:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3lW212594484;
	Wed, 23 Sep 2026 06:13:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gu5bkfjf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:13:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68N6Dblt52953366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 06:13:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 994542004B;
	Wed, 23 Sep 2026 06:13:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8177A20040;
	Wed, 23 Sep 2026 06:13:35 +0000 (GMT)
Received: from shivang.upadyay (unknown [9.123.12.247])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Sep 2026 06:13:35 +0000 (GMT)
Message-ID: <c0cd49cf78a1f1ffe8768c48785df0c3f6a2f528.camel@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/powernv: Cache OPAL check_token() results
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: Aditya Gupta <adityag@linux.ibm.com>
Cc: chleroy@kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        sourabhjain@linux.ibm.com, thuth@redhat.com
Date: Wed, 23 Sep 2026 11:43:34 +0530
In-Reply-To: <arD9skpQHxR6a8A4@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
References: <20260626123534.396456-1-shivangu@linux.ibm.com>
	 <arD9skpQHxR6a8A4@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: sZmswxA8p5Ih1iOx7imx-VBB5Z7628OB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX/KqMlN0LMgPf
 vSI5oAanuuqNh038hphXXNKp841D4BK4FEpt3Spuuel3SO5lSECwiSlbxGQykk/MkV3UG6OfWFJ
 NvGGGhV4ctUGao66yedwSvC2gvf6HN0=
X-Authority-Analysis: v=2.4 cv=FLiOVOos c=1 sm=1 tr=0 ts=6ab36e16 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=P1DLfJaGPtq_K2Gt2jUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yncImd9g6OO__PW4IoCI8-RsRyhtaqKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX/AoI5TAAnEXg
 elwVa8yRHCpuokDVvlrk9UTvnC/CCvCy7N9ZQ/vbFZjGeMv2geckHkGGF+o96E5dELzl5dTYuJT
 HVY9iab49vViVBqUcLN8bJX6wMiyNCKk6jlD1gMUz0wvoaNZoizl8P8+7w8XrinwxaWjB2Mh42A
 LGE1qJtZjcw5ignmpyg52SPgawR/9sraamvWE6wJ08FwYshzs6fpTJqh0NTGkfE5JL0kDuJUbnu
 IbPFUHSTGtRgNY1GKpsZ9dQqM7kvDkG1KGoBsrVEZSEujZqfeEc8Ccd343F7uJkeDV3Fu6Nu/4B
 6a2BJH+1JBYyB6Yn0M5uyud2k0V2I1rOl/Zc+qhVFl/HlOerhLIgA6ddEgkJxHggBFsfFz0p6B7
 i7MhKtTfLdRXqujFUXXV6zVFY2BayDNDsc3hzVV2Fw7BNOfKKt8iApvSpPTGyMj+hMqk2GDBghJ
 9gCR4nesyg2zVzo+Asg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230024

Hi Aditya,

Thanks for the review.

On Tue, 2026-09-22 at 11:06 +0530, Aditya Gupta wrote:
> not a suggestion to change anything, just an observation:
>=20
> based on this in skiboot:
> ```
> void __opal_register(uint64_t token, void *func, unsigned int nargs)
> {
> 	assert(token <=3D OPAL_LAST);
> ...
>=20
> static int64_t opal_check_token(uint64_t token)
> {
> 	if (token > OPAL_LAST)
> 		return OPAL_TOKEN_ABSENT;
> ```
>=20
> along with other usages of OPAL_LAST in skiboot, OPAL_LAST is being
> treated as a valid token.
>=20
> there are no handlers for OPAL_LAST and kernel doesn't do
> opal_check_token for this
>=20
> I feel the logic should better be fixed in opal to not consider
> OPAL_LAST
>=20
As per my current understanding, I assume OPAL_LAST is meant to be the
length of all valid opal tokens, Not a valid call itself.

> at the same time it maybe safer to have length as OPAL_LAST+1 here,
> though it is not necessary, so the patch looks good to me
>=20
> Reviewed-by: Aditya Gupta <adityag@linux.ibm.com>
>=20

Thanks.
~Shivang.

