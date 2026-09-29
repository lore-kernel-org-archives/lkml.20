Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54F514746
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681460; cv=none; b=c/01ZpVAZbBhkICCQSxQTO6w/6tLQqjNvV50HVYjcsF59VMX7JKtxQs9SySQwJCIfZ1JO2AZyopQVFkzZj/qDz+Jz9bhOFXO1ut3EDGiks4yOVtVMqHO1dxLgfnMg+ddv5d3LcU9lCwW50gytj9HyMG5rSny7RwTSTV56H7eft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681460; c=relaxed/simple;
	bh=Yr/0qbQM6saoD2JsAJoR6NJonF3HpF1VedR9WOKFmvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZRjiTSV8RQYAoUEgeQxmUQnWkKdd699D7+RmbYppEW+8Th4p54tMM7WtfV4PcW4GqWMap+/1g4WlXxOhzzPl1xIg46LSVU36lYbV4Q4kW3vdwcLQEcbnyW/+nKZx3UTisRJmf6GRIL94StBbrw0vgKg8by1IvAUsLBVGTkjAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LoqJgTO5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LoqJgTO5"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TB5n1Q4018055;
	Tue, 29 Sep 2026 11:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hRcwiE
	sVxLpMpM8Cas9aJOlJb6BNKB59c4rzI10SOak=; b=LoqJgTO5lRgHekTDW1LLuu
	zVZFVFfiQUBtQJ6Hs8TdyecXdCZyOlXLCFQlEPK8A9BI2Ay7fyyMzcgZEIepFzVh
	tE5IvHNTFsV4/zPnFU27d392vnMQk3AowYlCaj3taGRaj2FGRDiNo6grfYLzx0pi
	Oa9Bx4XVisBEnW0PZgZHfPbEU6QIm0istZCkqQxtLUO8eXTbaBEy8/5kIzhoT2Lg
	8SE9T9/5gDXhwoSJbA79h4NtnQfzwFahw2jZzeOdLdhRAhJqNwn+0/KpueLpbheC
	jRpdVCETgULWV9OnSIx+TxArnvrElFVyFeJIElFKf6yGOWRjuUvVyaLb2Wov/EVg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5pt5ymn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:30:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAlhnt1608057;
	Tue, 29 Sep 2026 11:30:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxsck9f6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:30:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68TBUkxx49480072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 11:30:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B5782004B;
	Tue, 29 Sep 2026 11:30:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 971DB20040;
	Tue, 29 Sep 2026 11:30:43 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.88.139])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 11:30:43 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Thorsten Blum <blum@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/sysfs: Remove redundant wait time clamps
Date: Tue, 29 Sep 2026 17:00:42 +0530
Message-ID: <179066556652.265207.17736539340344825251.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916151254.120629-2-blum@kernel.org>
References: <20260916151254.120629-2-blum@kernel.org>
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
X-Proofpoint-ORIG-GUID: c3srm_n49U41mAYeewu1YRlQs0I_cQR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NCBTYWx0ZWRfX4Ng+WexXJhye
 n+RAHMLPbFewm7sh8k0Mwq870uJggarN9xl6zx5u0j61TZsqWWChHsYuujBk03lIOD/zxaYXKRl
 ISep1m9jq0b1cDcdqiri3dI71CjEz1hklegsfYC6IsM6jdF1DP9o/4IXHBIczljwVM1C7Uev8iw
 TiB6BGAVR4OdfQ9BV74ay1p4J70Ebf1/1OWb4TQP2iHTv6yw5JroDAhh1VQ+rXLwsgfRteeLfAM
 MBdGLAfxMRRcSx/YRBm+UZWWyBd2oRKy/CVNMsNun3SaHJ/oBOR2NGc3qKZFIDJ5+UwJtHnn/lD
 7Awjw848GdgAxtYnubXjNbJZEreY6hShypACY0XurlcqX2BgQomEaEO4JSk2P8Igk/CyBNzy7l8
 xGLki3/HXrR7D5lCZPwTAP8PXKsZqNe1GTPoGsPVQiwrgpeZXOBN7SyaAhYnKdLyA7vadhyiG1v
 UVJ4aiBEcSsKtTzbqqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NCBTYWx0ZWRfXwlAdYvj5AxCM
 vcYJ/tDfTTqpeOvVZFdrsYZVxGU9vl8cOs9jlGdq7GD+dwDcCbAyrpk9tMYoJOCBUx8ouh+N1oy
 JGRlRJgdB82+C1XjmQfXSrKQTPgt3Hs=
X-Authority-Analysis: v=2.4 cv=EY5d0/mC c=1 sm=1 tr=0 ts=6abba169 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=-MndoXCyHQlNvhxjK5oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1oSNlotS8mt_LwWcZuKNfAvpU0jaVy07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290044

On Wed, 16 Sep 2026 17:12:54 +0200, Thorsten Blum wrote:
> The wait times are u64 and cannot be negative. Remove the redundant
> clamps.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/sysfs: Remove redundant wait time clamps
      https://git.kernel.org/powerpc/c/12d238d584ba485a99e02e033746100fc7099184

cheers
