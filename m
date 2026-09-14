Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA3A3B1009
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370458; cv=none; b=aGV7yCYcacBJYmX2RmM7MGoDyUZtUFnmgZINMC6K1nqSF3ZDg5TlnTynapHxOXY50zQfgcSB4N8k96g1tOlaBKsAPkoe/OLPvlA2CQRLua+VmD9/5eIXgqrqxJVDLxVucM2rur+AL+w7VS0ncT8ld2abKnw9HBN4P9KDXPGSP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370458; c=relaxed/simple;
	bh=Zkigoj1y4X7ppD1aLuN8rdfZWDDQO66DmpX8W53BzsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8AoNFddAgTgow87EkyHkyU97unuljelUoV9q+ph+MGzhDwpNyyoHH4wEsERZSYQdlFafJW9ACDMVzWleVdkxTP8VJAFwb+crv2x46iwoqYnxwS+oWnKCasK2mevRNs9vf2XzQKcVN/cjqALJYqdLV6nqBl4E2E24tyRjrXerUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qGuujjVM; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qGuujjVM"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E61ZxG3528030;
	Mon, 14 Sep 2026 07:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0YJEw8
	lOGuTHTgntrp7H0VPBZmY9XuPVvtiogNhct0o=; b=qGuujjVM9vXZwTt0fSJ62M
	be1+bevWNVH+YzeF439pkjWEiV3AujUzyR55vXVMVXxX/qqR+bsMZTyN7TK3KKFg
	O2lE5+gUWf62SbDhYAgnUKT2pLUpTFrP3TRsKNDUtZcBLUSuasGWqpEhGg0swqVv
	Sr+dk/WDybrDGz8Z+cHiHQfjl3IN0fR0qFYHYuh8VDO6n7ulWJj2w7taNfSpzxD+
	eiEoj7U8Gswnmg2SjSL9+zIiyNajUibVQDhZkSb4tudpjs5l1AAPywW3jggEgf+g
	diPmIi2zM5rcQDRgvyjwYPKhoWbiCMgEB63zTRyByIW8lgFyV+pHgwOphLxh8LBA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxdpyrbk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:20:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5o2Nf1805295;
	Mon, 14 Sep 2026 07:20:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gnkry49xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:20:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68E7KeOn35127806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 07:20:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAB932004E;
	Mon, 14 Sep 2026 07:20:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C341B20043;
	Mon, 14 Sep 2026 07:20:36 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.93.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Sep 2026 07:20:36 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>,
        "Nysal Jan K . A ." <nysal@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/entry: Fix double accounting of user time on interrupt entry
Date: Mon, 14 Sep 2026 12:50:34 +0530
Message-ID: <178919368033.441103.14931410336556974738.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904025831.3439809-1-aboorvad@linux.ibm.com>
References: <20260904025831.3439809-1-aboorvad@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/pD/Nbq0p5MK
 PlFlzo2PhyG22eAE/zvd2E9gHfub/Rh8OTDv8mPm6KoKq8ByT3VtR5p6CkFOecDY0wusrB4C14X
 gLWAWLnEguECQNAH8rUZhUlT0mhf1Jzb2dl/UuiYQuDsycroDYGLkpTSvHWrd1eWiK3uyaLZKpk
 xn0v4anXvTd6by4ffmaNIOzTTihmFuwuXNZ5HP7x6m5ihTyxjj7KnhlZSTk+IK8uGlQ2mXB7KjS
 jDwqFV0bpGmPIBDdbsL2Mqf3TYFEJiWkpLNDfLR4lc8xLN5ZoSi/2tlXK4Nz7E3iTLWaIYcrnWA
 KkwclCCe06ulyK7V8bgczEsysRdcINXglXcr0Iq9RbiUQPzRhnyS1KygeFGhH5sp+DURrE9cAa1
 JU/rRlFP6m1b8aRXzQBOVQyrjZ7AT2qGk4c8UsENregrYNDgIBGsg5pH3rux27XllryA0b6Y6st
 ZOyVjqyBsnF8X3skSZQ==
X-Proofpoint-GUID: P-wvmPuiTdi1d7uVTGSqlKAekdKOKx-s
X-Authority-Analysis: v=2.4 cv=DobDa2/+ c=1 sm=1 tr=0 ts=6aa7a04d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=vD1r1ehekdmUJcK3jvQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WS5cVFPAK37OXhPL0ly1ZknZgfdjLdSc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX2Qhpr1fK+CFn
 enW8ljQkSaLjSvMjyx8ferZh9rGvJOhtoB+bylY/gxo5765v3+HPQE/XLyieWKJDxhWdZ+Lh490
 omr0UtdE2WH7j6229bbF8q15vnyLcXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

On Fri, 04 Sep 2026 08:28:30 +0530, Aboorva Devarajan wrote:
> Since the switch to generic entry, an interrupt from user mode
> accounts user time twice: once in arch_interrupt_enter_prepare()
> and again in arch_enter_from_user_mode(), which irqentry_enter()
> invokes for the same interrupt:
> 
> 	arch_interrupt_enter_prepare()
> 	  account_cpu_user_entry()		/* first */
> 	irqentry_enter()
> 	  arch_enter_from_user_mode()
> 	    account_cpu_user_entry()		/* second */
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/entry: Fix double accounting of user time on interrupt entry
      https://git.kernel.org/powerpc/c/11ae2e1dc58304a48816fc8ca4afa8f2ef9d1bdf

cheers
