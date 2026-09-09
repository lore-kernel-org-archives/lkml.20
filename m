Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5829D27D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934740; cv=none; b=XubP8StzkkGG5rVMNXIhskgZr3QQhEgE7+bVq3WA/NuT1TdfPC1PGm8N9czljcnTq4CfUdqVIMCQVUKTEtq2P/oaC1qfmFe48OK0D07bCT4aVE/oZsKGeQl+QGNUK2bwwPk93BbgQyZx9updsyGeXRYzyzIR5xmt6jN0fqbMUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934740; c=relaxed/simple;
	bh=wii9LsYE+VnK914T/ZI4vPbhWoZevPhx+5IPYhi2oUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAc4auwak0DxcTQazCYTtJ23NrKdURI6bvrF4CnIyq4FCeO4TixD7aBDp8OGe5cl57vbnfcCqRjp536UI0o2B2JiIM84ed+Zgfs0wu4ekgzRbBSdxe36zBObn2b3a0iKpHioqAgiR+to9EIulimmdVAQXFaeKM8k5PWUV/PBDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GhzsBYqx; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GhzsBYqx"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1bDR1116403;
	Wed, 9 Sep 2026 06:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mEKrnb
	Uo+oAYrBYLUe8ytG6hfLqpGa2Ewy/OTHbb8hg=; b=GhzsBYqxG7NccuA3RjNeJ/
	zm34AiEgC0uKm6UNL9BYcREnS9HimhdSUMw5TCy1ReowkYm7Lq2eZNwqNiNH+iBP
	iB+NGhJT98nKoykW0M/lUrcMvLL4aHK2hyRfWrwHGr6OUmahdfQ5wk7i5TrYwBn8
	XrjjzQQsEHGM1BGraghFq8rCrkn4YNTICUoJMgfsE3LxvglByd0D539vxRz20Sas
	oUUjcuM0Xj2J+Tedmje0vbVyEcrBZ86lq8yuCV6esTFubA8LKc6mIqBS6E33ZdDt
	Eq4TV4pcj3I8PyJHM5+CBwNvWMk0pMAJsy62S/RaZwigiw6apEmlqijJP951RS9w
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbjruqa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:44 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BDa5002263;
	Wed, 9 Sep 2026 06:18:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gh03ygdts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:43 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896IcfS46662018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:18:39 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D65FB20043;
	Wed,  9 Sep 2026 06:18:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C096F20040;
	Wed,  9 Sep 2026 06:18:35 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:18:35 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: harshpb@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/eeh: Fix recursive locking on devices without EEH sensitive driver
Date: Wed,  9 Sep 2026 11:48:34 +0530
Message-ID: <178893459268.174069.5130701368927941646.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178404937381.913.2759874335293830160.stgit@linux.ibm.com>
References: <178404937381.913.2759874335293830160.stgit@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=E7T9Y6dl c=1 sm=1 tr=0 ts=6aa0fa44 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=ng_bIwBZr1CxlLq88DYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX3V+ybrdOXxCg
 VLrpCTHk/561RijgDZMHw9pC3tXOtVP6fz/wfbaOjXw3wKhD08DSLWQNYvd+aRl5WxFG9xMCTMz
 2DqLsknmp04siTMB21WPlVjkv5AhjDE=
X-Proofpoint-ORIG-GUID: qYMVKJyJO9jA-KQA_7FwdIuakEg2bH4L
X-Proofpoint-GUID: cEwzS9G6tUHKQYcNAGAt0Hx0VPpX1mtf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX2AHvBsAUj7bz
 GZ/bB1isGpH1oBStqMvzKdfzQA29hlsGAx4hCHXtP+vdl3Y11u8Pmn+WFP70CPT3n4nBkMUWWaD
 Cpwmy9kK/9jNzdi/dtffcx/XL5yrRO7z5C45LDmjbkS4oCa6AjFuCwEsQwlNaGXZeYR7Z/n2F5J
 MyfnVfag3dziHpdutNEdMWk3dFMufkpOdvyKvkDnQKXYtyVpCYw6wgFUtyTeyZJ2h7hlIzgfIYv
 nMMKIjIVtXlA2YTaOWq4U/hFYSFJZzCDeIb5BZw5OjGRCtAv2Os+SrW2OeeQC3TrqJ5X92IocAn
 2JZ8WONoR7E1H148pjl+7STLa46Tp6u03tRr7nPJ6fdPE4DEVQQObAOqDuziuy4+Jxsw9fmQYHY
 HAoy0P8TJSiwaPyzgSOqZOsdSOHUY4bTBsMoh/dMHUcytl7WQWQ1FXXEl/ABHQrRPIU5ZYN5qs3
 WaPj0mmbhmN2/c3it9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Tue, 14 Jul 2026 17:16:23 +0000, Shivaprasad G Bhat wrote:
> The commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device hotplug
> safe") refactored the EEH code such that the pci_rescan_remove_lock is
> held at the beginning of eeh_handle_normal_event() and the
> eeh_reset_device() is called with that lock being held. Looks like the
> commit missed to remove the existing lock/unlock inside eeh_rmv_device()
> which is no longer necessary. This is causing the eehd to hang on the
> lock which it actually holds when that code path is taken.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/eeh: Fix recursive locking on devices without EEH sensitive driver
      https://git.kernel.org/powerpc/c/c5e68706527968282e49de205cc2b935823cb88a

cheers
