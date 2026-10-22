Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655436;
	b=f0nxTMJAVcT1l7QnexplMWUA55e/AvIKcx1TRA1MGI2W1GFxEt8J44ks6Hbv8MDipW7A
	 CEQQ2y5YqCwPRZTdeiIkolfgKSc+I+ANkQ0+YkA/+Z0IZeICUNvBNpe68mxuLW18e0eHt
	 J05lwFtQy3aAusDV3fFPla4azeHi7wJZLE3ioueUKw3z8NpdBJGBVRNGTa0EEo+7u4xSS
	 QizIk88uaaCSyfzQnsGw6qG//Z5EtbzozvrN8MfKWT061ca+S74oU5Cp2yxjR8Be4+7iG
	 dKz/ArbTerdegngGmxnN5Zvh3ApiW32hvrc/FvqyFoJ6ChDQRn9MNm6Z1hOAGfTCtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:Cc:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hnFt9iEag0zElK56g7z5NYGPgIOEa2I6BK0OZbZRDls=;
	b=TbiaExLEdDkHDe/Huhn+Lg7quVGHy/MEy/z/vcKMsZFix/aEc+qGPG6ImInNR8IubX9n
	 WK1VlXJnzvrptpD1YK1/Y4izZFrXMYwO6xyb+q6+FxvMln3r2+CgPJXq4nLBt5g1K490I
	 7zRsTpUKmEI9mAcQmPG9dBnY6QTLtq0Qw4GpvUsKqS530+VJK9o2ZFLZW+aSRHu3ZxtXT
	 J3MTAmfCOTEmCN7TfrLxtcsBoll8Sxmn2ACo9FDK7YY7Mdz/8CXPsofTPX8zyA7+84/FG
	 K6uZFeUIzjNGJ0FfGk6c7yiupqKzmyOv+Ug6FCEVQ/pR9euUaSMn08pQalxKWCMj3fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="P1yrbdX/";
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82400606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82400606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P1yrbdX/
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7EBRB3373307;
	Thu, 22 Oct 2026 07:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hnFt9i
	Eag0zElK56g7z5NYGPgIOEa2I6BK0OZbZRDls=; b=P1yrbdX/fppwN/GQcigqde
	WI3rEMOM8rvXqnBu7T7+urAzAe/tfNfX3LJ/jLkCGs906wqvj6jQy4oC8IzlJ1Ik
	NcY7wWr1BGoJvVoyBhjgQx3U0wynhK2iiT3M2JRjd+DIQYVbkhx5YSK073/Drhij
	GvCm24z3KZlOTS03TJScFbpe+3N5g8OuLACStqazbXE0k1ps7ZDn8Mv5wMtAbfZi
	b+FuV8lmaTchGbqTRZNYlVV3hKfkRHMz0nnltKtvLJqoM82QAXHfa4/qStLsgaX+
	62rBuZMwk1sJ1NvFqG1Z8t9nuqpLY9gp/HYq1yhIz1qV/vIvTFhQWWm/ELhREepg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw5awf7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:50:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M75FYW3136156;
	Thu, 22 Oct 2026 07:50:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hefss6tg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:50:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69M7o3Q034668978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2026 07:50:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 277C120040;
	Thu, 22 Oct 2026 07:50:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 007AC2004B;
	Thu, 22 Oct 2026 07:50:00 +0000 (GMT)
Received: from [9.124.220.107] (unknown [9.124.220.107])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Oct 2026 07:49:59 +0000 (GMT)
Message-ID: <e69ee97e-a0b6-4c73-b28f-7d247a6eabd2@linux.ibm.com>
Date: Thu, 22 Oct 2026 13:19:58 +0530
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
Subject: Re: [PATCH] powerpc: Support for generic tif bits
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
References: <20261021144453.232372-2-mkchauras@gmail.com>
Content-Language: en-US
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, msuchanek@suse.de,
        akpm@linux-foundation.org, yeoreum.yun@arm.com, agordeev@linux.ibm.com,
        mchauras@linux.ibm.com, bwiedemann@suse.de,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20261021144453.232372-2-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X63Hu2Te c=1 sm=1 tr=0 ts=6ad9c031 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=7x8YdOtcnDH_QHYHCW8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ul4_iAb4ksb5-4XZ1qkbvCYTTYApHxEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfXwevUGnDUOVvh
 34scqUB9D+ZPEXTkxa+NY5sdqm7sZEtywIhXMP1yP0Yvd3KpgftAHvtJBMH0hZihUO2zibE9iTo
 gGPadG4t8P9t9pIwAMGZU1VV14aJ+n2D9RQIO7jriyALatAUU+OOpnYGcF1Iw2gyg5BJifw6O91
 Q4H6rJhp65F8zIabUs+OneOAxhv2PSZvZHUr3JIkiW0SGWVqyt4pv+OgaMJoQvJ9YXWRdisFbSK
 Tooof0TiXqp6B2ZIubRd4Ua0Jh+me2KwV2gkC3OHdBZB6riYbGafcDFk9lN1OPTw/G0P6AdF8P+
 YwSCxC5tXZ1o8KHSJLoIqC2pGD+jGt8imNu8vdeqdkRcrRKQhfnehkjxjLCBErLKYcOwA2KiKi3
 +upAhBm2Oe3vNSNSL+Xp7zd9FgoExFaobc4sVbGjuy0MoIhYfBxY+sqVQGPaPh0b3evDEgB95DU
 lPJXZ3VJCRYICg2DUzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX50fibVaAVqWZ
 zpLoVB65cmU4qXDPcy1F6XkNVkB/9lwg7kHU3CFzP8u49YWEw36lmUwEB1vZXcx0Ov1jayDGwuB
 Ad+3M+VBkpcBrBbMDUQVpJiaxGJZwVM=
X-Proofpoint-GUID: sRhPS3eIACBexKGM2wsVKoPLR7NUfrsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220030

Hi Mukesh.

On 10/21/26 8:14 PM, Mukesh Kumar Chaurasiya (IBM) wrote:
> After the support of generic irq entry/exit. powerpc is now ready to
> use generic tif bits instead of arch specific ones.
> 

This needs a better change log. The intent to enable the change is not
written. There are features that could be enabled with this. Please list
them. Also please try those features on powerpc to ensure it works as expected.

I think we could rseq time slice extention selftests if there is one. etc.

+cc  thomas.

PS: I am on parental leave for sometime. So expect delayed or no response at all.
