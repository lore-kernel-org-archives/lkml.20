Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57736F916
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934749; cv=none; b=YsTZkhZAWO6Np++Orn3XSY+xhcVqFXRZwt0PDHrUeFi/JA+wstKhjuKDDEoyKEG2Gfow1AFmrLCD2oFJT6rK2JpIWszZvpctM9wAiY8yW1NuCNTTvixhLcmSpO4Y86ZNUZnBCw+tsnXUg01agJG2/dKKmJfa4vrG+S4omC4uDR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934749; c=relaxed/simple;
	bh=MAXWTTcU1TkrLon/dluBCG1wpjWMVSNMMLYWmMDU8VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWBPug8cqGJS6/NOSyJ/CfzNlOBErHeCngDX6nvHk02VyOytJkKFh5THfiljQAAtFi6d2Npl2fO5h/9xAjwrk4X8+n9s86GVBmUAuQjDT3Rm5ZB3oins5UkiVqK5ebThY4lznEO9cLz5GTkt7JhFwBimi0obsmql6TWC95hTMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CNnQuTkh; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CNnQuTkh"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1gU12299337;
	Wed, 9 Sep 2026 06:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KGrUX/
	EfvG++DiYSXBQxRin3fbRsj7oD86PbHMu9qfI=; b=CNnQuTkhfkOLodxfL9W15+
	FkAJZJI02rngMaaaDXcDcA/zmWEk/46H6Y2aQLmzG8vh1SZvcs/KmSlqDBH/mIvk
	RiaseTtjYmjFfyVU0r1ofpA4PO3XZLmGwV9AFJ9vJ8svtO1wYLEm1tenUbvA1Yc2
	mFm655vFvdcakGaK3ONe5TQL+BNESRXqJnIaxvkE0DisL61biCcQ+TsZzb5hAD2A
	/+uw6yCLQE9v5oEFLHaaTVrYRkQfP8bHdNweq/36rtqW+7KrTM7vC+KRxKnaBVcS
	UNTklaq1Pf1aPt9LfDxcDsEiG888BOrbtRGRo4kgrA8bIDv8pjXu7G98FlonDGxw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbhf3q76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BEx6030561;
	Wed, 9 Sep 2026 06:18:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggwsw8qxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896IYjt51446180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:18:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C2862004B;
	Wed,  9 Sep 2026 06:18:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C58020040;
	Wed,  9 Sep 2026 06:18:30 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:18:29 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: tpearson@raptorengineering.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, namcao@linutronix.de, tglx@kernel.org,
        yury.norov@gmail.com, tiwai@suse.de, wangruikang@iscas.ac.cn,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: pci-ioda: Fix the stale irq chip reference
Date: Wed,  9 Sep 2026 11:48:28 +0530
Message-ID: <178893459268.174069.17928552132814435755.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178716225364.1437.6201568081502251835.stgit@linux.ibm.com>
References: <178716225364.1437.6201568081502251835.stgit@linux.ibm.com>
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
X-Proofpoint-GUID: 4BLQBNsqlNIIsnnNY1E6-ufYupYO-m9a
X-Authority-Analysis: v=2.4 cv=RIaD2Yi+ c=1 sm=1 tr=0 ts=6aa0fa3d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=1JNkJZV6CAqgiA_SvoQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX8Jkd90pJMsB5
 fQZsTHdsgBwZkebqy3u4ROq8GYtZCftd21kXa3ZAyvOINTryF7zZADak4czpxUViXDvlXgMRfSz
 /fGoaDX8hjjwReRQwIRqvV56AAzBkNA=
X-Proofpoint-ORIG-GUID: -7tpTnOF4-RFJ1Pi1N_9lDqxj7PtzukJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX6z2JOjPGodyg
 l56JmaruZdfYZYH/jplxkvhBJZfaEEldXq+q0RwPht3XHm0SQ5xlYYQT+VUWHHR7xn9/EH5E5rA
 3UP3GS7jYUgZrlZG6qoMYWNR6UzgmDjo5ABhYTptV6DMG4+WthE81IL7FM2Tzi441OPzGFnPDVY
 3bG/3iTIXNMX/0vbc/RSpdZiGGdGKWGRbJA4/DoZA77fDJAD0EpxvvnuLAlstUArIelevVhOFEe
 vX4kfdgdHuZ+WM2/0ZIv0ZSsUDLmabBycf6BKXFlk0HPO4l8n6eSMjfkcUPMxfzURQzXFGp45t4
 90BLkwjMYEgwGm4+xFFQHBGAMBJWZR+B/lVuhQd6MWriP2E3vX2szx+Tkkl6LCYbsPkNtP/w32I
 5F9Icp6HUt042BYccRWsMMwbeWsWq1pBP3EV/dzI4y2ZIf10eSqqPe4aerI+3xUCotxGg8+cjG6
 ZKgttrircGxWwi85+xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Wed, 19 Aug 2026 17:58:22 +0000, Shivaprasad G Bhat wrote:
> The commit f0ac60e6e311 ("powerpc/powernv/pci: Switch to use
> msi_create_parent_irq_domain()") removed the legacy MSI irq chip
> pnv_pci_msi_irq_chip but left behind the static definition of it and
> its reference in is_pnv_opal_msi().
> 
> The KVM IRQ bypass for vfio devices is broken because the
> comparision in is_pnv_opal_msi() fails on the comparision with
> stale unused variable showing the below errors in dmesg.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: pci-ioda: Fix the stale irq chip reference
      https://git.kernel.org/powerpc/c/d96171d911e3b89ca2957c04264019cf2f96287b

cheers
