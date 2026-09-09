Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FDB3A7F57
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934766; cv=none; b=EVhxeQvA0VnMKWGCEB8+fuw8QwK2xtm/RvVxG8BqNSnxGsGXxz6wG4IWl55B5vanNt1mnff70gWt0lbiIckhwUKVUdfm56TVkXIjMqUOsFFICrLFqzmg3JbYOvHCsYbBcY/ovykVrjETkSTlS4hcpvs4mzLNl/H6G/9miYaI6MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934766; c=relaxed/simple;
	bh=1t95cm9RiPBkX2KolyfkO60VefMHYaMDvkqarT0GvW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsE4e2XCpAUZC9nvD2QSTK4C3JKZY2JGmb2mkClKHBjT3+XH1wzJmvof/9JrUIzrYkMkPNN3Ag1wssSNkbGtfkxF5jExK3DJQFHkTEvARrsNr0GxozrKGa9Yyo9EXXn44HIBWznUc4flDPWK93oeE9yt9KxQYnjm+7eDTMbTYms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iNuImvxy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iNuImvxy"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688N1e9K1116578;
	Wed, 9 Sep 2026 06:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9HTRK7
	bHGk5eS/Et9Lz6B/U5wWCH+R101rFtNh/yVKU=; b=iNuImvxyjWR/GGN1jmHzoi
	See1l/W0KZ0fo3pX8H5VptPd0mApoVfmHpfK/LFd4y6EvOG0SDHBxZUePeDTzCwq
	Xz9Z2Z7N3jOzKjg2h5GCDzn9xah3G68d7iobotQRvPqKdVE7UWDlbPc34XgkHk9q
	CcoGcltCa9vajSqmLtWYxoBcWRBBWw70PQBvjzRr9eimKFeGamuRUMR6Brv+0wHq
	rW6nz852NPhT8uDur665Q8QRSEupMOzc5twVToe66fV13hCVvrS5Q2KKD+38trqH
	x8DzNH7HaU1ZBoIyHWQd7sNYeFLqKR/KHDYKS1T18CWg3DOpqdUkEyuqNrG8OdVw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbjruqbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:19:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6896BHgn027899;
	Wed, 9 Sep 2026 06:19:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggxwh8jbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:19:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6896J52431981834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 06:19:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C8D820043;
	Wed,  9 Sep 2026 06:19:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DA2D20040;
	Wed,  9 Sep 2026 06:19:02 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.64.17])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 06:19:01 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kexec: Simplify kdump_extra_elfcorehdr_size()
Date: Wed,  9 Sep 2026 11:49:00 +0530
Message-ID: <178893459270.174069.6408811447920762280.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730131940.597739-2-thorsten.blum@linux.dev>
References: <20260730131940.597739-2-thorsten.blum@linux.dev>
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
X-Authority-Analysis: v=2.4 cv=E7T9Y6dl c=1 sm=1 tr=0 ts=6aa0fa5e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=m8c79K__-cDjZdXFNigA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfXw9al98Ioj3p1
 SMWAU1vdN/K8dHgS63g5hdqU/bjeoUerrC1XubaEbth3Zn5gOlFHU+GUxfCxgeKnagX253W8pYz
 ECJRiKZcKDZzUdXKR2KKgBbSWJCFMBM=
X-Proofpoint-ORIG-GUID: 49GXZPBANCxtdjPSLVW9wv6GzXBBV6IH
X-Proofpoint-GUID: frJ885BdySxmvBjnEjNGJoAQQKxv5Tri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfXydCCRhsnPEgS
 YIdJ44julns2XeuYAwgH+GjeZ76W3mGffUzxWO7brkN0fyYnzQ6lnyWv2W+Mhjrdfu6zzyqFnVS
 au9OmpG2jMTK0pTpt1Z2+o4eZTr5vr+tDX0Gd+o9e9m9Iq79SOVlgU1IUXng99Wny/Rg7PIED4v
 HqdQOKFWiQmNJo6Var7Qn26QIVBgxebmxTKCzrfbAq3JF1dnzqd9FkZhR3OGg0jlRZNMgWPPAQC
 isN4PEfC0w8yzswpOGG5MnEU6IQ6jgRpGqD0dNrf4C9CVy9IPHUWlkIdAdeSTIBQitbc8YLcAbK
 o/iA69KM3DUvWrzqhE/z3exUN+DmX6bEXUS1+fR/J6/5pxqdmh1Ny7hzBO8NPlK/WXBCiNTtx7c
 PBh1a0OfKYWar4RFtG5yC+lMA7HIKS/IvDI5LCU1px/S8tdlvfnpFZ1/smpf6xmETbTUPbNDnPd
 A5MZXf22jkFlrH5I7vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

On Thu, 30 Jul 2026 15:19:40 +0200, Thorsten Blum wrote:
> Return the size directly and drop the extra_sz variable to simplify
> kdump_extra_elfcorehdr_size(). The two warning paths now fall through
> to the existing return 0 at the end of the function.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/kexec: Simplify kdump_extra_elfcorehdr_size()
      https://git.kernel.org/powerpc/c/68832eb08751b4ce23e90bd90e9414a465a99da3

cheers
