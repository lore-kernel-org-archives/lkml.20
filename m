Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6514DAF9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969316; cv=none; b=DJZNcapzWw+L7rAlBeLHMSWw5NOAxxB0D4g5tRkrXlrLXHiddFXtPjeat3TrwaCdHmxG9+Huxxsehy9E1Uv2+b/iWCQly/ZgGfLfcjbFmILwdtRjuWcNJ2Wnb462XwXdSrZeyV1sYVzugQWiGR3ntjLO76pveZ2w8rk6DEgcOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969316; c=relaxed/simple;
	bh=+50QVp9BSctXJtAuwgEtvCbl6ALW73YOfkm+kl6STek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dnAqn/DgrjV4gwTlm8wSLhpjrzWO0VAT66CYl7pj0bIzw1FZ5C49A0e8mI1XZ0aJoXZD05feMBzmZAX4p7E2FKqXiUTvMTnX5BN3fWeQ5OIaqhKGIuMlTyDhDGIq5IfYYHgXyi6TJI4VmLWTHgdZWbdkRWmvrOIgx23cZg6upfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PnC79+M6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PnC79+M6"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DLgHYb148969;
	Wed, 14 Oct 2026 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kYq5j6
	Hspfsld/YJImxU8dUcCifnwuwq5BKH2719tPA=; b=PnC79+M6WXAThq/agRj4+a
	JBAPmBQDPSWX5hk4Ik7HDKRJ3FB9dcUp27hlK9iXDoNeubSbSPfit83InprhMvR9
	iYBRXzw9lYKjIQXO2x1P6gpKTg23EuSZeN+5hh4zXS/Ey+kw/xO++QLTTb1uEx1L
	mxWcj1u9uBSDQdrXrRGP/eEXYGxpYBkN8Jv0uf7ypcNu9kpLEBpqJHGQApIxc5O0
	d1u6grPX4yRRQDeEakFw1pwuKhhyymnwneNU2mWqj7ZR0tlekKlbGYY4dm3tNNT/
	x2OY8sYGHuULlBg0g1CL/G/i3YTP0UZxwql1/QiAm9L292cujnZSwlaFRX2pZYfA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhkgfb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 09:14:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5M3Tg3149863;
	Wed, 14 Oct 2026 09:14:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h9pb3mbsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 09:14:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69E9Ekhc45154764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Oct 2026 09:14:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64FD720043;
	Wed, 14 Oct 2026 09:14:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B657120040;
	Wed, 14 Oct 2026 09:14:43 +0000 (GMT)
Received: from Linuxdev.bl1-in.ibm.com (unknown [9.123.8.83])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Oct 2026 09:14:43 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        ritesh.list@gmail.com, sshegde@linux.ibm.com, mkchauras@linux.ibm.com,
        ruanjinjie@huawei.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org,
        "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V2] powerpc: fix NMI exit ordering: restore soft masks after irqentry_nmi_exit()
Date: Wed, 14 Oct 2026 14:44:42 +0530
Message-ID: <179196918686.1557523.10308055309171214794.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003094509.3408190-1-mkchauras@gmail.com>
References: <20261003094509.3408190-1-mkchauras@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX2LXqrCqjTjJX
 krhTQeyd3tslzMnYRAiKQHKrMy61abT9lLMQFWCXvr8o25FK+7udg9K3ZI3s64hioSFHqHlK3Wu
 ltuon+f5oGO05dj3wtyyXv2bceJcMIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXwR9azx6wwaTS
 CfO+ldMzh/uY6rKrUVYhQhiWpQeu9YCk5kHfFv1/lgultB5gr5TnXA6DVE2HImdIAIE3sI2CxsP
 iOYLqbcjxf4vq6UNj0ElpgrZn8HOgfPD3Tfnb4GVGPmBJj0A54pm9d/HcvOc+JMfzT1vtnDWHD4
 oU6OWMTpCldqidVg4tXlIF3CPFqMrGcXJgIDQL4RtgmiOJUEMtbc+4AiVdr7sIN/YOWUsf6h/PQ
 EJN4wEfWaCZUAiySZAHxDLZmYo0qGP4avax3+Zr5miRBILofFL4U1X/BpeGlTxGThxA04M05tI6
 sHba5w629KNhE3K8UC4tKTMlz7X+13DTZjnQQIfhhX4TdrSxDfZc6/oqIWSDF5KuHJTn7jLkG7L
 YDhkPExy83TJ+faBZnLm9cm7bci1GIuU+Puz7e4PlyCN1E3/P75zyRMYTh7NQyVTMkCyoaSnu+h
 kroRhCoVDsUty4T/QyA==
X-Proofpoint-GUID: CHm5z0WamRe9bG5ch40rVVcw09hixmn7
X-Authority-Analysis: v=2.4 cv=RoFQvymK c=1 sm=1 tr=0 ts=6acf480b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=_7OFt7L6OE-8oMjxGPEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CaE5uubE-nAKHt-5KGZ2S04rTu4TSDO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

On Sat, 03 Oct 2026 15:15:09 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> When running with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y and LOCKDEP=y, an
> Oops is triggered during NMI exit:
> 
>   [  202.258332] Oops: Exception in kernel mode, sig: 4 [#1]
>   NIP [000000000003e178] 0x3e178
>   LR  [c00000000003e174] arch_local_irq_restore+0x2a4/0x328
>   TRAP: 0700  MSR: 0000000000081000 <ME>
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: fix NMI exit ordering: restore soft masks after irqentry_nmi_exit()
      https://git.kernel.org/powerpc/c/8fa763bc3ee9bd215476ab91ee480c649eaa4b29

cheers
