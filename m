Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A23DCDBC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819256; cv=none; b=oVpAcoWb/fmLoR0pw/vUG130pZEt3vgzEgUhIYKf+aDVzSj3yrCETHMaj3rmoeX2WL2Bd77H5n1OPd9Ty87x3YULJV+gDmIz2VX3vQ6zWWVVZUh/0e1t00k//x/H15P1r7dFyhuf9Nhxrcgv+2p7zrvquygYP6BpPfcH8+Euqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819256; c=relaxed/simple;
	bh=i3IOh5gLWNsrGy5Cgu4RF58HuUnSAlKRgmenknTZTO4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=finhl0Xs8gs9gKyV54njSh2tktBR+X6iPGrYA8/eWpTNGMKBHX8zER9xIUYKgjaqDoWR85D6jCSbx1PbrzC7C6PApJv+6ViIztSFtfBMfI1heQkJn/W3KTmOxW6kop8EH0K0dFD6mSQitudof+t3UCeLnQVMke3UNzdMzNWfI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UUerknCQ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UUerknCQ"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6Vdoq2210177;
	Thu, 27 Aug 2026 08:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LsCdWe
	hN+6tqdtCq+Ukvfpfb6LLtXcF2WXAWEsQkk1g=; b=UUerknCQraqa7b7Bse8fX6
	FbOUoHbREt2cRa7+k7pYQN9spzRZKB0Y2eEVCoUZ7rAzE5SlWH3fXWv3fBl/ZSLq
	TtmAzjRbGWpOsqmVWf9ebCyqybTmdah86Abq+wx4m++Szo/7/DT/O5mvSlDU/OBW
	lajQ4oNba2xmghQw28XoQeaImuoiN6okygA7niHm+xdGo7DQaaNDpyeFuhEZPjfG
	YjF00Ge8CEpF8YvN+NN6G22xO+tCEDVta/NutBC2OLJY3LLda9DmowHafBevquLw
	UFvZBSwJQys8OUO6aFw7z43D1T2oSGxDNzCcEEavOSHv+s/EZgmyBEujUpi065jw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g73g546rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 08:27:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67R8QLnj006786;
	Thu, 27 Aug 2026 08:27:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4g7pfwf2kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 08:27:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67R8RFLO43844054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2026 08:27:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4030F2004B;
	Thu, 27 Aug 2026 08:27:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A93020040;
	Thu, 27 Aug 2026 08:27:13 +0000 (GMT)
Received: from shivang.upadyay (unknown [9.123.12.247])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Aug 2026 08:27:12 +0000 (GMT)
Message-ID: <8b61b631828a52b4fdf49122d3d2b41f86586219.camel@linux.ibm.com>
Subject: Re: [PATCH v3] ppc/fadump: collect dump if the collected size is
 lesser than reserved
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sourabhjain@linux.ibm.com, adityag@linux.ibm.com, adri.vero.dev@gmail.com,
        anushree.mathur@linux.vnet.ibm.com, chleroy@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Date: Thu, 27 Aug 2026 13:57:12 +0530
In-Reply-To: <20260827075803.2240934-1-shivangu@linux.ibm.com>
References: <20260827075803.2240934-1-shivangu@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: OLs1JXQN8IxKWtpTXIVaTjFP9lmTF8YQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2NSBTYWx0ZWRfX0/duCQXP/53d
 3qLFWB0lIlWd5lrLWrTROV4KrS5qto3xGlM/fnDr9+QcPVnxa0aTJLBDvKXcklJeGzoozqtP1m0
 9P9xQhr6FtoCzZyzz6PfvYUBSl+reQM=
X-Proofpoint-GUID: IcZ5w1Q-cw4dsjTmPoOeVMdldq1dgegF
X-Authority-Analysis: v=2.4 cv=JZyMa0KV c=1 sm=1 tr=0 ts=6a8ff4ec cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=JSrYWKBkpYHP3JM9lOcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2NSBTYWx0ZWRfXzG7LSAo2YJKW
 6KQ7jjPWQezhx2XA28tkD/ozx9lw1PgFICgG2L0n2LQsCQHKlLHtiSJA4r0alGhcdgUgneAmnxx
 Y9i1Y7ibXZlrTbeOG4fl3nob+fN3WjLBMYPztqzUIVadejrod653lKONhreYpABjE6/bRpkDuJ7
 7vYi6sZrYU3rz8tNsWuHZZ5HWPN7eYIttpmNXGg+0RqqkfCQJ8EEGzlqUKcSlfi44xUhOa52wmF
 ImYOPLIG43ijJ6kSbQlKrquY2uNrr7haND7nQgbWDkRvF4wqTwt3oFMj+UdqZfmjtaZFDq+aMI9
 pfgcAWEk/ovdbIvlVaV9yjYF/HnbRORbseDmZunlzBSWDVSUmoCuAkTEo4kpktwE2Ge0vbEm835
 PGzxmZwynNcUurlJ2Rv+oo4X5OUs2+qdBs1VzXaWXotsiKQxAJokltJU3Q/5U2NWBD3QnAOVuAE
 88zUJtOzXEq778KkxsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270065

On Thu, 2026-08-27 at 13:28 +0530, Shivang Upadhyay wrote:
> +
> =C2=A0				pr_err("Dump taken by platform is
> incomplete (%d)\n", i);
> +				pr_debug("type -> %d, bytes_dumped -
> > %llx, source_len -> %llx\n",
> +					 type, bytes_dumped,
> source_len);
> =C2=A0				rc =3D -EINVAL;
> =C2=A0			}
> +
> +
It seems checkpatch.pl --fix-inplace, broke more things then it fixed.
I will send another revision Tomorrow.

~Shivang.
