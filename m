Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900991;
	b=24N7gZWb5Mk85NTB9R/3Yuc0V5v+OEQMHVwH+TO6ZI03AlifPtyapSADwtcYcDHCi6jr
	 dHTeJpKIzGL53pRpLYSVbhPjdg9HEwBT5tio1yR26XSXUKC2gDjSc12kC9FarQeezJD0V
	 xp73BTwAY8UOxptEFVGscoh1rDM7bCTZDqcU9UJvBioFemclrvOkFPwxbyPcbxjrgwDFU
	 EicO+6HBHVRUMUJPtr6jtJoUA80auNhynxjHuLfEYCXAWLIEF7b7wI4PVXttAwzdd1d71
	 qH/Lj+lmgW3kvMCGF2EYX4GAnTPrvRN8iAQ+N+7EtqK7Z6H29TR5/qbElNslr9UZS5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Z8DGXC54oNDPvPHLF4Hz1+gC+Zgp//q9hZPIEDfCEs=;
	b=OFDnB7nw7WcaHPI+9aNKkgGTLy1yXeY4Y8HSMbMiCO+TS1ZP06Q0gYCSTLZ+9NEPfmh0
	 1sR5CrvJDE6skFbRzMTzFZ0ZBh2vtFXkDFQo09TNNtOUhw43V6hzGSvkJCEG1d2Rf6Trj
	 sHxAoPebHJfXxs26fqr2cFmrAyUNJdz2tF300+D1WcSD2W/7gBZuknRZMsT06eQYmE40b
	 Hkl6I/bZLd0g7xv4hWjv3AQIs3vXQXnAQV9ogym2g+VY5891fdVuASkZRbDMDRX7lLl+j
	 Q9R2FK6jkeibs3pOw75boT8cs0GyoxNyVxQQ/fg6ee6lrdugocHW0m3lVtA10Dobgvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="H4uLF/1O";
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713A0606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713A0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H4uLF/1O
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HiA3Q2578719;
	Thu, 5 Nov 2026 17:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6Z8DGX
	C54oNDPvPHLF4Hz1+gC+Zgp//q9hZPIEDfCEs=; b=H4uLF/1OECtOhuNhb/30l1
	SCkWmZH4aAE7Z6l+M/X/7rhh85qjol5yf/+d1SaNfxibeFQWZ9rf1yQpT6lpVUiE
	Jn3K4p1SUrX6HFmd/AlJagQGKABO5EdCxSiQyaBkQztM6ygM47qUCr26EY8ZmZlW
	Lbi777N4dtPhWxnWsnT1JSxYK329rPCMWWPX2NGiaEi9DI8V6UwN+dlFXancKcYB
	2PDmsTCsHUhTDSiSSBW7jmHDO+87gx69MdJG/iv/1nFfMm/JmgchFljY4Wj5q4Ix
	9CHOUM6I+u/Ca9e06M2IfkMbLUbzyQPJP1bX1wG+awV4D+yQLKFSUzrbH8bfqnHw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn80t47nb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:49:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5H6P5p1786971;
	Thu, 5 Nov 2026 17:49:43 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hqv1v1mn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:49:43 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A5HngwP23527952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Nov 2026 17:49:42 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 781F658064;
	Thu,  5 Nov 2026 17:49:42 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C11C658056;
	Thu,  5 Nov 2026 17:49:40 +0000 (GMT)
Received: from [9.68.10.150] (unknown [9.68.10.150])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Nov 2026 17:49:40 +0000 (GMT)
Message-ID: <27596ddc-6624-49b3-9ea9-891f477eee38@linux.ibm.com>
Date: Thu, 5 Nov 2026 18:49:27 +0100
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
Subject: Re: [PATCH v2 03/20] coverage: add a common debugfs interface
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Chuck Wolber <chuck@wolber.net>, Dmitry Vyukov <dvyukov@google.com>,
        kasan-dev@googlegroups.com, Marco Elver <elver@google.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-4-sashal@kernel.org>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261103015238.3780910-4-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: RcXFwb46gS1f6C_-4ejZWtGccweOzR06
X-Proofpoint-ORIG-GUID: cdZUO34zU9lIS0Rg5-KzPuKetpYscTUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX0LO84vh4UpoP
 wmuGlVKJaMHOqNMkG2gLGwIz8QZSilJhE36nVGX/69wROvPdeZXye3clJlr6eN4IUwl8faO3FRd
 oM5QtdUScaRDx5kiW0O8Ok2IA7jXNMX34VbyPloBLKQFPDHcAIkGe4lJV7VqbngW2mKfXpQ9vgx
 /yWsoKxxTzIQnYPHL6sioarsHlUTM67KMUTydyABBurgVkP3pgl25FilE+bBhaBlawaoTY6XZKr
 PZeFJZaGMXVh3V0nDtkJVGTMci+WNSd9+Qz8oC3AZm3/WzIWcolF2bacbfyjNRPBJ2NbDaSxOto
 WoOHazIgAVRPsJFpsMNpEK9gNfMXRXyM5U90L2jOjoQgx9NkBKejLhoJRGR7OWXvpDxfbqDtXhk
 IMH3rFo36pc8c0OI94dzDTypiK3LCIA+YhnSrmDzDK0f+PmAjC4q1HWKksK8ZkkM1/Y8X7MipAA
 NmM7JbKtFpmsKv0/gcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX9vyDezRGnwnV
 mOQ1JHavsMRHuJpgZnjbgcDRk51AXQ3MQ3sfD9hILNsb00DvQnD8eKUYsCWwS2Z6uJbD1Bd+Pl9
 n65rj/y4itfW7Zo5RUSg9rn4s74xv4U=
X-Authority-Analysis: v=2.4 cv=FIqOVOos c=1 sm=1 tr=0 ts=6aecc1b8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=E5mLeVgb6EEcHXiTWj8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050070

On 03.11.2026 02:52, Sasha Levin wrote:
> Each coverage implementation creates its own top-level debugfs entry
> with its own conventions: /sys/kernel/debug/gcov/ and
> /sys/kernel/debug/kcov. Give them a common root,
> /sys/kernel/debug/coverage/, which contains:
> 
>   backend  name of the selected code coverage measurement implementation
>   reset    write to reset all coverage data of that implementation
>   gcov     symlink to ../gcov when gcov is enabled
>   kcov     symlink to ../kcov when KCOV is enabled
> 
> backend and reset are only present when a code coverage measurement
> implementation is selected, so a kernel with only KCOV just has the kcov
> symlink. The data formats are defined by the respective toolchains and
> stay implementation specific. The existing paths are kept as they are,
> since lcov, distribution tooling and syzkaller rely on them; the gcov
> reset file now shares its implementation with the common one.
> 
> The common reset never touches KCOV, whose coverage buffers are owned
> by the tasks that set them up.

This part is slightly inconsistent - there is a common reset attribute,
but it doesn't apply to all coverage mechanisms. Also for gcov, there
are two reset attributes that perform the same function.

Would it make sense to only keep the attribute in the backend directory
and possibly mandate a common name via convention?

[...]


> +void __init coverage_register_backend(const struct coverage_backend *backend)
> +{
> +	if (WARN_ON(coverage_backend))
> +		return;

Can this happen at all?


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D
