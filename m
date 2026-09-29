Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C037517BB7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681472; cv=none; b=kzsqEJsHzSCP16gwTRovaa7Srg1VllOtFsG0VDeNB5tpoAYa86fXBXC1s4TwTrXfMEWYaXjmRJKJl5k40lJDwEnve/O7IVNWKLKrA4nMmnMwIxb9AnOrH90EoJPU5s571nMdRzq+oMu8ax6psKffADEMTPB0duqaSafrA6h6Vl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681472; c=relaxed/simple;
	bh=oPnbMU3iYjYEpNatI8K6JyKm5xl08HdBciL2WPrnfAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7S4tJG8I5CI/LaZlFvaXquaSD/jGEo/5+MnKBJBnm86VuMnO27Cw7YFUOd/cjltWChuWCjSH1j3JxnQjSver797u9GsQx06ng3w6MCWc8i20rDOra22gGJV1Yumb491c1QXwsvAdS1WocS70xqUPp5xTJOS0XpqfbyZy4YTdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i54dObVD; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i54dObVD"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TB65tK2784022;
	Tue, 29 Sep 2026 11:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3OoNFS
	3jCJrMuG+OTzIRVQAr779T6sCKddO+/uLriWQ=; b=i54dObVDMPK2CrNMaVsnaa
	u74V+T1DDtitI5oyDlepTlEhxEEBAW5wIXxJFLyVcyRmfLuM5mKNPQRJS1VcK2EC
	Gwt1vpJefC+y5j4Q+NSeUotc7gWJcuxoHQNCWaQDm7qAHkas3Vd+jcikORBwpHUi
	kJ7zs2fdhjNFWYDP+kseybKV+WwcOIjwCMP381PLRH4Nr+sysqX+lEdeU7JSaeHX
	POEii5fw0yFfArWCjCaa/ERNbfMfXxw2h2S32JMRbDwnfuP9lEppNPp0Dwmah37N
	8nkNk+t5k0wyzi0BCoxTILoa76Y/5CYHoy56+jkP2IL3lrdNwPNxrLtRpiX5xydw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx4fe63q0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:31:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAlZD01617030;
	Tue, 29 Sep 2026 11:31:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxrrw9kdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:31:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68TBUwQr46727622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 11:30:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F0902004B;
	Tue, 29 Sep 2026 11:30:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4423A20040;
	Tue, 29 Sep 2026 11:30:56 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.88.139])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 11:30:55 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: Fix powerpc memtrace Kconfig symbol
Date: Tue, 29 Sep 2026 17:00:54 +0530
Message-ID: <179066556651.265207.13199455241158262731.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822081253.86256-1-kmehltretter@gmail.com>
References: <20260822081253.86256-1-kmehltretter@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=FYWiV5+6 c=1 sm=1 tr=0 ts=6abba175 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VdFJkbfUe5Q2UCklYtUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NCBTYWx0ZWRfX3xyK7o+0ep/U
 j0nt3cK46n8QCFntxEMd47ftAl3oblviSEVxxS5c8RV6DMXTeZCOz8B11cjr2oqmN1Lm1IS4oZI
 4OsXHEbRfrWvscLYxupQAFH0eZnuPWU=
X-Proofpoint-ORIG-GUID: OGc2UqwpFuvOuyUZ5Mw5V7QdBbIkOdTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NCBTYWx0ZWRfXwm3DwSbyJUa5
 DFTsSPzFaJAnTvhtSQgjcNL4+5c+mvuAcM2wI5GVh2E1E+tiLEAqhiIWP37T1ch122q8HTIt2RS
 3YlnIA2GjLqv1deYGRpG9iRwoar+Bc87fqQxQhiYMjVXuGXte94LwI4ogIW3vzOBLFfexZCQcFV
 ZWvRB41X14bvBqg//M9YIYEKF4GQOcQMB8XK6Z8htUnMoJV0vGG3Ogi+gMi4TpDw5YIBl3Kizur
 wa0AlDoHccVTwo3uHETNXfOoSEZ7/wJrw45kEupGEtQgK87bDad8otLYJA8v2T0pimFl2xCModO
 kUd5E4bPfAWKxmn7p4diCzu5+ZpuckdzQk+06TCFDtDKOSTvg/xQYicsuZpNyciggZd7tmZI47e
 mkay5FJa9bRR6GlsSxkOi41unDPpzEvwn55ZFd6s/mscDvutERwwllVKRqqQduQBDvPoaTKQDkz
 MPOzCmJ2X8KHFGqOUJg==
X-Proofpoint-GUID: LMcyk_wLbRD0slPRodbZol0VAecP0H4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290044

On Sat, 22 Aug 2026 10:12:53 +0200, Karl Mehltretter wrote:
> The memtrace interface is controlled by CONFIG_PPC_MEMTRACE. The
> documented CONFIG_PPC64_HARDWARE_TRACING symbol does not exist.
> 
> 

Applied to powerpc/next.

[1/1] docs: ABI: Fix powerpc memtrace Kconfig symbol
      https://git.kernel.org/powerpc/c/cb3502d2e57ab2b73cee7d69756becbe241db0e1

cheers
