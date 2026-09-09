Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901A29D27D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934759; cv=none; b=MlTGCD9gh3hs66Nso4Z6sXTGlCaHDN4CvY1OuA3zVh4g72XJSzirM8/ZwuJSYdLdwsZQvpyRWpl85KenBirul3Cmsa5/uq8cRC3lEG2jvlrx3GISy0MOqcYETj5NcBn5a6pVy/QuBqUlki9JN4jTxy8vWachnEkAodrWNwTNeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934759; c=relaxed/simple;
	bh=8iIhkaViv0lxVg+X1XCns9FTakWQ8PmqNATPBEe+wZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBBdmoHlC6tUvmyIAVIHvIdz7za1wg4tIqn6tc5+oriJ5D7R/k8XoG0iv9hOP9BQ9rCsjwAyJNG0ZXXujjLrDwyramkTKjRQ3bjy0Os11ky+9vwkEnfWWzSE8nGwpAd1zop57mhbirSvX10wlsWTOE9MJULJwWVNcu1T0PSjIb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UyYB7qOQ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UyYB7qOQ"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1YkE2299221;
	Wed, 9 Sep 2026 06:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=36Y+28
	hjQ9L+4NyprQcBwKp45JSBLhHqK21qer0CriQ=; b=UyYB7qOQydPc2Jve0iJhkb
	97TLrfJo/UT1qdTmItU9ijM/0GY1JA+QFD2+biffxQ3bFo58/LyYmFcwF7lb3LPB
	pT1P1X4B0kOGm9YLT57I1NduVaqyK8c0IlJOpzmiYvgwMFoMAiSOJhlpBZPSBxi7
	DvkAu1dIQiMr+NLex7NZXSWCH2LWn0frt1QxfhLPRR87upAi/jnJu8A0XKUGs2Nx
	a1m8F59I+7IpQcjlBnOEVlUnli4LDa+jYQ9PTwM2BUtIFiNA98L0t24u7vjvcww3
	Oiaf7hKjB6/vsz90mAR4btChOdpogDRbum+wUpEpWGbs9gfnIHdVnKeieQGuYE9A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbhf3q8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BGCM012908;
	Wed, 9 Sep 2026 06:18:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ggwdqgrya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:18:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896IskK44040646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:18:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9D8720043;
	Wed,  9 Sep 2026 06:18:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1220120040;
	Wed,  9 Sep 2026 06:18:50 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:18:49 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kexec_file: Use inclusive range checks for excluded memory
Date: Wed,  9 Sep 2026 11:48:48 +0530
Message-ID: <178893459271.174069.12910729821958749066.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810145827.157972-3-thorsten.blum@linux.dev>
References: <20260810145827.157972-3-thorsten.blum@linux.dev>
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
X-Proofpoint-GUID: CpAz1mZVupbDZGSPGVzRlX1b2f3mizfV
X-Authority-Analysis: v=2.4 cv=RIaD2Yi+ c=1 sm=1 tr=0 ts=6aa0fa53 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=Nnc9RaRy9hPcq58hLzkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX3RGrnNvVdINF
 kZLF5c3xmJtHSqaBm4Ujm97a/9dCY57IH4k8Q8HFH5Di7yv8MgM0waQm+uEB/jVHKCkhrDzxwVJ
 8szy/4SnYsfju21fnjDSWZAB44rOkcI=
X-Proofpoint-ORIG-GUID: 9WRSbRZRiPTMfSyEVrMVvw-MfhX8YO6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfXwq3KtZcuVdWF
 2pO8FrODDzwFeMMas608ZV2uFucJuNn1jfCBM/O9LC7+hXuqfJMSiy2CDhaJpP3e15oeLZnfGhJ
 OGxLaDwgy3w8a7QP5nrkrariw68xaUEwK8QSZuCXPFXF2iTRL9M0blN9XPoULH5JB84PSc+PxJP
 DlAaYpt2+mpT8gJzeLHqUJCQarGjG9i0RcDQL9MGsmmEz0hxZrC3D7BzBnfpZiMVyrDsPbUvdIM
 9K7cPAi7Y3BPngoVhhPpbSQCGzIuxkgwXRQnlfPkh4cH3XSKjwQP8Pnt4D96+gYjqC5pep3AtWQ
 WxdJgEQkMHbF3jBaEH60fbBmsmWLl+GleiAhK4IcNzoWBnn5x7RWHSlzRuvdcy4R0E1U41MtHev
 fz8x0TzH8ReD8Tsu9cxWxz+cGXeQf/UdQwsvpl/NGoImQ+IQyBzSoI9TA7PFivTQGvlqPhVwBHh
 J0ZiPq4fbACC0BiLf3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Mon, 10 Aug 2026 16:58:27 +0200, Thorsten Blum wrote:
> arch_check_excluded_range() checks if a kexec segment overlaps an
> excluded memory range.
> 
> Both ranges use inclusive end addresses, but the overlap check uses
> exclusive comparisons. This skips ranges with start == ->ranges[i].end
> or end == ->ranges[i].start. Use inclusive comparisons instead.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kexec_file: Use inclusive range checks for excluded memory
      https://git.kernel.org/powerpc/c/449f60f99f8f3cbe80a9bd2242945e827c5ed003

cheers
