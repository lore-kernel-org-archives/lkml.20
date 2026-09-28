Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC64DA553;
	Mon, 28 Sep 2026 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604969; cv=none; b=uTmlxJ8ShR8IFsosxVKjJ60eI4XVOGxOC3aZmAm41fJ+JyyiDdcolzkDVOg4bqIuOFzULN1Bl/rkszIEq/ipU2iKtnElui4GAf2qcB1HgS3w7e+4Y2GILbVpSQTOSALl9DS62Z+h0B9quhwjfLuqqMhjk5173LHVU26I7ufuOBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604969; c=relaxed/simple;
	bh=T8GcJzd2UBSu+LZ5VeNq7duTNf+q/7epDImDrpdt7Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQws5Qln1GMlmwR6BKfrU1mbzxJ1Cf8VZtgnFFB/zZ75IxjapkplYYf/hqNPyWB7i17pDJydx1Aqr6IRZoqkDC0dEVSkTB6JCcqw0a1ZEmgMW9xz1t0/qYjravcTSw/vq9qnbSIs+Sr7q84aBKU/TsME4m5uY/1Q3xsN4F8zFo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WcvGvxEu; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WcvGvxEu"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBZQiU1019410;
	Mon, 28 Sep 2026 14:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lnvSDC
	tOXXIeEpC1quqcL3B8zbtZVA0yXqfF3wmvDOQ=; b=WcvGvxEukFouFPihjeW+M9
	GdicIVdGeITIxPijDMjnlTrIwrj6vYElOBjv0zhFYzqOoBI5flbaMGUFr2plzN+u
	8uDicFql0awVRSyCK7Qv4JiXG6/2Oy51FRJbCWq+NWHNk1TZi7aGKo0da6p8pxGE
	kn6Tnwt6p5U510LvH0m3von4w9+fqjjisUetmv228O3Fd0m6AoNpULSdODx16gM4
	8Net9tQsSKJQf/Wr50RoTfMoBk6ANXCNCmSYXNpqnUaru6q2wu6J8LpWyhJfhpY4
	lA7GNucDofhkRJoOsuTNPPMsXfrvwB7VD8PPN+FDXgb/mSQRT2658gzOjsNPLtDw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5s51txu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 14:16:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBHgwa057349;
	Mon, 28 Sep 2026 14:15:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gxu2y5a50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 14:15:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68SEFvYI31523438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Sep 2026 14:15:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBCBA2004E;
	Mon, 28 Sep 2026 14:15:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B630B2004B;
	Mon, 28 Sep 2026 14:15:55 +0000 (GMT)
Received: from [9.124.213.68] (unknown [9.124.213.68])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Sep 2026 14:15:55 +0000 (GMT)
Message-ID: <2ef4f859-6cc6-4dd0-90da-8bf57b519ab7@linux.ibm.com>
Date: Mon, 28 Sep 2026 19:45:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tip tree with the jc_docs tree
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Quchaosheng <quchaosheng000406@163.com>
References: <arpymyOST1apXE25@sirena.org.uk>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <arpymyOST1apXE25@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NiBTYWx0ZWRfX0Ex3uXt/u/MT
 8ogMJGdngyRk9n/SNCfCL26MQV2dNalCrLHAo91DbiMGeS0vihpB9h/xEnmnaDZfRSKixyMPF3a
 hkI8nWPhSOHKXbHCt7LoD2zcldhgNUQ=
X-Authority-Analysis: v=2.4 cv=HJ5WhYtv c=1 sm=1 tr=0 ts=6aba76a0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=q1YJmZKzCJPk7gEazE4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WkhVHUUaOB5rKtiwdugcZy9aJGgnk4wg
X-Proofpoint-ORIG-GUID: pfCp_HPHe4Uf3gjCz9pnaBJmSpIcN2Mx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NiBTYWx0ZWRfX399hn4NTNhX0
 egdm+tYMAbLbRdwerct0ezUL2ySPLKxhoVYpCHBFaPlNSsedVWtrdl5Z4rbBXT+c+4YkC/tj9K5
 obCmJ1DjlGUA9K5TibfZmJm0OzBXX94zHip5AQ8MfwrnM4dLmWmPfBaJwIkCsLjsm88CnHYLmmm
 lLYTputU8/NFNS2YgC6qSngm7kAHOo81t6QwpCbgoHbk7AXJ47nf45cwPoUIyU8k3CRa/ssGG7d
 fgI9t5ZnJsuwodJagsj1MqtNJRkvHMEbEpHWv2raWG6Z/Q6Q9ba64lk+gUwhcgr6poibxVgFNL+
 lZp2/dQJRERgamOVViKrdGrdPkOYTXdF34JBHR3tdSnQMNJ72ufcsK2M68UoOGh49heC5VQIl54
 DuZHjDSOufYPVp/jXM1SHPYx4a7a9QQnjQsLcTCdDYBNo2kZkY7ZdUttClYDyApRYiv8F2Np/8w
 50/JfWkEeWpi8/Z7OXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280056

Hi Mark.

On 9/28/26 7:28 PM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>    Documentation/scheduler/index.rst
> 
> between commit:
> 
>    80c2913d0a06c ("sched/doc: add a preemption model overview")
> 
> from the jc_docs tree and commit:
> 
>    06a49ef784acf ("sched/docs: Document cpu_preferred_mask and Preferred CPU concept")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Documentation/scheduler/index.rst
> index d6d75421756ac,a43647b9706d9..0000000000000
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@@ -23,6 -23,6 +23,7 @@@ Schedule
>        sched-stats
>        sched-ext
>        sched-debug
> +     sched-paravirt
>   +    sched-preemption
>    
>        text_files


Looks correct to me.
I guess it clashed since both were beginning around sched-p.

Sorry, I should have mentioned, But it didn't occur to me when I sent it.
