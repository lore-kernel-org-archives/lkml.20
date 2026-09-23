Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18F47012D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155578; cv=none; b=Fw8Ys9ttZ8HI7MSQhlKuFShEwAPUrQbGRfevAfPegcrR6UdbCYxBsjYeUDrohkzV709QQXCsiZXAnyVfi//2ttjh4VGTeLIRx9pyCXU8p8vTxvxDvDYf/w4jv/qkCtgXqFtkIANMnqWB1uStbyPRZ7ZDDVzT6i3fqIzVlrCouIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155578; c=relaxed/simple;
	bh=YuHsXKmtt1Yf4R6473fQ7ueJUHFzOqYtmF58xn6NqZA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqT5o4zO/fmrp3KxPGUha0aQiqbzl4uJxCt/ym0iqixkVelp+qAKL/r5/mn2GjRZzxULKk/DTAZm0q2ms0hjIiXcwsarxtLXKqjnBOegqSvyuQwq0MPv8D5PDOYrbAEygRuO5+SViuz/Sg8ci3YhRb/PAjhh9b9Q6MgGqzxYzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SqPInnDC; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SqPInnDC"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8ZTrm2907112;
	Wed, 23 Sep 2026 09:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=/Pb/HPk8qE15QQIw9lXoM
	FDPPQbYIBOkhW3LZaHPdyI=; b=SqPInnDCIXn0fGp9dgyE8yINNF0jZwcpHDCMJ
	2xpghe0+mYu5JUPmosKMuKIZ8UjA2ZYjw+CcpHgQ+q8K2HvqjyygZ3YOTJmXdQm1
	5/+Zh1P7mvVod+4eGQJZeAxLGrd+msoWyYEd5Sujgd/h4i1xsvYSNofoQ0qtpGQ+
	tr8N5X2Bdmg8vO+/cEs1e9uCaSf3ftHk5f/GrVa/Pkewyt4TXrdrIunhUYihDG9j
	DBd0hCE13xdw7rp4MuUAQ/5ACatkp9BTgJXt1nPi5vdbkDPlu3wN77r93p7S5VeT
	TNCAAvvlmvlz+JK6o8kExQu/TZaXbY46fnB9ZSRFwUf4qu84Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgsa9cg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:26:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8LwuS008049;
	Wed, 23 Sep 2026 09:26:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gvb6qg67q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:26:10 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68N9Q6dj47317366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 09:26:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CF4720043;
	Wed, 23 Sep 2026 09:26:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27CEB20040;
	Wed, 23 Sep 2026 09:26:05 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 23 Sep 2026 09:26:04 +0000 (GMT)
Date: Wed, 23 Sep 2026 14:56:04 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "scripts/faddr2line: Combine three readelf calls
 into one"
Message-ID: <arObLLalNd_fMi2u@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20260905012449.3872882-2-srikar@linux.ibm.com>
 <aqhDm60zSZIazrnC@jpoimboe>
 <aqiqScJg8Ey5QnKl@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aqiqScJg8Ey5QnKl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=V/XoQuni c=1 sm=1 tr=0 ts=6ab39b33 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=uZoqLgDn0AsYzM-udzAA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: TxBX3XJefu7F2_p06RZKwIsiUGgtT4ud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9CttZq7zgnxB
 t+Uq6P603T1ZglTzefMiPLhZFS5MCs49GaqAGNV83L705TjJqj6CwPxZXf7vGmtvYD1DGT+7Muq
 +Tzg6uKliqrfR7bhbGfJ886uiTAjWTokB7ijmKF0mTORJptjjI59gwRLURlGiVGsZ+k0QjuDKsg
 TJ0AcCJxoBVJeOLpN9Nn0/l+bOznV3LP1HgxKMfZd5rzVLfeGCLZxYoW04TehnO7dxOLQHiEUpI
 kHQZgWAidWhIU7sUXhWogxjGG1Bdj6tsQUMqju+EwBDT1/Qy7jnveDG3+FRvsmkO5gtYrKDVwjO
 BrxOQv4n+wUXjkrLbzbyXICpzfQpFAIgebwQI++woaqXITAH6wBw1UHta2Tt8ejBF6row5Z5aUO
 VCsKrFj+DGyXWFgmFCt3NmOaaYdgYRhJhuHiFc2c3NWIC89J7qdcVnlB4kh7AfozOmQ4F1Fc+jv
 LeBI0NeCqG14nlzVrBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9bOSIgz3krSJ
 tIbgmkVyq19UVUjRqh7I9vVpzcZiIuFxv4rjSXql84Zg4oarHHOzpqkMVsCVbcG1p/NuEGqyUW4
 5i8oucfoNxQE4ogaJ91c52rOXGq8nyY=
X-Proofpoint-GUID: ADsUo_F8NtOgviKY6q7Sh_ih7Q0BpUnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

* Srikar Dronamraju <srikar@linux.ibm.com> [2026-09-15 07:45:37]:

> * Josh Poimboeuf <jpoimboe@kernel.org> [2026-09-14 12:00:26]:

Hi Josh,

> > > With the revert, we end up calling readelf three times but this should
> > > still be fine since calling faddr2line is a debug tool.
> > > 
> > > Fixes: b8d9d9496c1e ("scripts/faddr2line: Combine three readelf calls into one")
> > > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > 
> > Can you run
> > 
> >   bash -x scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c
> > 
> 
> + set -o errexit
> + set -o nounset
> + UTIL_SUFFIX=
> + [[ '' == '' ]]

Did you get a chance to look into this.

-- 
Thanks and Regards
Srikar Dronamraju
