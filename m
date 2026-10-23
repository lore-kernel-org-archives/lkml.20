Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790790;
	b=FjyhH9E0fNVVyeJO2vHHGI9VotgkT2q9uA0GWpOd/wO9bXkKi4PIYj3IJGuGHQT/eJrk
	 cODGROjLAUFoYljUt6YbCbreD3YYeyl1toAS7K5U72g1Mz7WPOjm5+ox/4+E8kKgf/ZFY
	 HLpAYZCVG08dhUrh5Ut7/Qc8L6O1oVrPmm8fFq8qnkX9IHHZ4g6W9a5WTmUCYgPDq05yH
	 YKMO44aCq5dlrR/7s2Qn7CCLY09hv01PNgUCyzuxIgLgUnzXT+Ie3jbGLfQzH6Q/iAJAP
	 uiXfUggVFARXxsQM41qBbLu/yx1B2fL7ENTfEwVqBTbGrYNBKd30aWRPsjVUK5u/Byw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=onjC+0/JB/EMzeywRoMR9YdIXgcyM2qGbjpbSI4T3h0=;
	b=S6EcTaUvscdU6HKfWZuerClewF+cPwq7dveRL9Cz32WkkFZfZcR7wC9544mH9ZI812aO
	 FasN8xDIa2+Qrrwn0oMRgAwIAIMgJYVHKGSli5skI6eoIra7yr7BbToDOJtc5dniua4bZ
	 OJj7ChHLp5yA//BYztlV8xK/6x2H3Vdli0U+kC9fYWIYghOQ/lDDRbokn0ObR5EXjinGg
	 jtdfqljxPJkcx5+kRusGNmgB7vELNAYgroeZADnM0vLXh6zvMOur2Mqv9FtiJANx5dNo2
	 vkPiclWdcYBA/cKmF6HQEsRFLuNlDxuWUyHUbAm94/z8F1VAlgabvDHTu5x0XXjV33Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HRnNMC+Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VluYqfcK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E9606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HRnNMC+Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VluYqfcK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZgxV3047901
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	onjC+0/JB/EMzeywRoMR9YdIXgcyM2qGbjpbSI4T3h0=; b=HRnNMC+Q6WSd7YsH
	RZcrFxdaoCMuhrteHUqGKX3AkmhklMoyZ/cnmcyrc35ASxrxIEE8JA9999/TAR0a
	28AEarTbNWLmVQxHLdal8A9BJPiuN//4x1dBC5o998g2pi+jbfzFmyD+Fz/hQBNS
	Do0nkv/8rq81UF5qKDK3gPhxUSkrsH6EUnwVD0JqfCOfzXPdAoihGPBRqaUSEOK/
	IvgSn/8FuzbbiYsRcUSi2gxL1OnN+XNzK0eJSYq/9IDb+aFXYiovcASXrnuuL+ZA
	JGVbXs4Cy9nQAtXMD1feWK69CqjLqBy4MSK99b9xb3smeWxCpbTE/rXMLr/XWEhB
	K/2oJQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrughxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:26:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so4188188eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792790788; x=1793395588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=onjC+0/JB/EMzeywRoMR9YdIXgcyM2qGbjpbSI4T3h0=;
        b=VluYqfcKMa0g5yFYadpgV3E3o/8WWXMbgucE/k/+zOHPIx0g6E3+jVga6bwqslSZbY
         N1ihBQlGpFFwaJHUAKY3304PeHqg9p+V6nSd2gZF1uQyPKRVkJuiKQn1BoRFKvkt5wST
         TeYd1g8/2VmbE//AG5J+Ns79J6ZHG2SAFkLr3y9z+dfTB80eIpRNCGncaw7j6M4qz3qu
         XJXyWw6LDtD72JO4z/sJKgA7OOHxI1FCcFfr4P9AfKiO1I6uVu2JjbByvx9xEGo0fb7V
         +Xhm7/vgtJXPo9HS1fBTZ3r2G1UDa1NzUoG3nHFfmjIsZEJ1FHnQtEpBi1ICimt2JgKb
         NwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790788; x=1793395588;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onjC+0/JB/EMzeywRoMR9YdIXgcyM2qGbjpbSI4T3h0=;
        b=LrQnhPmqiffuAkwCNtPrCcLBs/eTnSGtMxkDGtYJBaTHUnDfeA8r3nkbInbhCM990w
         MhWfqavpHMkpTE+ZaMxVt2WCnbvkgXZii3vitDP59XAsPEYJmiUqRhXeF0mxwXj5Sy+D
         XbU6YLJWBXAPAkdF1aWKp1o8QSB2+RHWjMxXl9lwR1ZHUZqpcicUBufWKpqwPPvfVa3/
         wkkLl6xgXzc7GkhigBYYOMhP5/cYi/E96Kf2F7Ihd/H5qyZ/J3VXnaJbCU73gLJB9cbg
         9oR32pFgOcYZQBJoz/7jZ5Qp24JqWo10hmthpLjEAoywp7CuNX/LkqxVPGRbEdCsDTN/
         /mgw==
X-Gm-Message-State: AFq9FYJESD6XQOO0tr+W71Pza9hPvlamoiL74ZT2JfrvBFhjnd//MkrV
	QiPK4Bc2vvCSMJ9haeS9nC5T1oMM3xalg6Xk8P3OYxchihDMZZS85pcTT5WOucoFPSuhqM+LEFC
	9tdw0w8nZKKvm85LZPateBIKA7n1nlGRQYJNKkPRf8vhaVR90R7Fujpi7AnEbXaFn2S0=
X-Gm-Gg: AYBFou2tcNeqsvwuFmPidNMBpLm9/M9pjWwWxShkpKuKKkiPsKRykn01urFVzG/45oD
	Ougnq7W0TckI99zgKt6O13JQqlHynA+qLlsAbkAGu8CzaFyEJ1oG8ESphAX4OxVUrL8pzbHhs8k
	wp8Zs99iyEv5Ien9gf9F8rYKFX8OYl6uGorrOpGdIc4Dolx42yAUih+MFai4y2pOwwQqcMljD9m
	uIR/P/Gk85YflREH47XSuylTbWjxTLXNodiiQuTzVbrFg1jqHTeOmsDvOSTF92aCQAwvSbp6yZC
	VD7illffVLUxGSLpY1L8Ccr27TjOwhksY/aC4e6W3sVcL8JHIm33bNAMlD5/K2F6N8lc2OW/4sG
	pH7QOMrK59FtSR04mZIn5wbR0T0y4DOm3ahfEAoy/i1aSGrPR+tWIlg==
X-Received: by 2002:a05:7301:2f31:b0:369:d8e1:7bad with SMTP id 5a478bee46e88-369e84d7714mr627743eec.34.1792790787892;
        Fri, 23 Oct 2026 14:26:27 -0700 (PDT)
X-Received: by 2002:a05:7301:2f31:b0:369:d8e1:7bad with SMTP id 5a478bee46e88-369e84d7714mr627705eec.34.1792790786964;
        Fri, 23 Oct 2026 14:26:26 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8afd64fsm1007158eec.0.2026.10.23.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:26:26 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:26:21 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>, Tony Luck
 <tony.luck@intel.com>,
        Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai
 Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev,
        Ashok Raj
 <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] CPER: Add Memory Error Section 2 support
Message-ID: <20261023142621.00007051@oss.qualcomm.com>
In-Reply-To: <0817615d-5e96-4a3a-b39e-3e5d1b88e716@arm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
	<20261020101048.00000186@oss.qualcomm.com>
	<0817615d-5e96-4a3a-b39e-3e5d1b88e716@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfXza1ChRjWkoXQ
 Gd1JdoweKwRj1rreCH0QvJngInRYOVRGirki6fil0jyFGTIq9uc3JzMVtpyliSBYEOufzDS1Z6X
 tfLdFzPZwgZgzJVtx7GB38veN740ZDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfX61x/wBDGyFhN
 UegNDVzH2VFVIktpI/vS6vXcevcF1YouObVSnKCXsZDzjPDOD2jqfKYzCgCO0aj5IwQeSVUwUek
 kgNsgpnNEAwCOpmWhSRmQ3U8O75IZDEDsHpCZEoCScFuUgZk/OLo94OjWQv7NO25LXqVxI9nhve
 V8W8lgru2Gsg1nrqBIc6RaMCgJ6lXq4hTtLOg/uPZukUCp94KRozrJ27tv3S8G+ZK/+W97fd3g1
 320XR0XTCulIDXnihwNTLOtMAOth6XTR5eOIAU5j4Qj9wy1dWYjVUz9yw1MPv+NnH9AW+pRatOU
 cIDlUMF7RSs1KCqegA0ortV7OzKFiohBYrQELcA/qXxGYGxFE37JVCdwNYOF/nOGoRVxlMKpCJ7
 MPo30aI1TK1AyTmvIeBLGfABe3OdVU9SFUd1csNzIGrf/0coMNZpKHTOPFm546/hJIMKDPUXmCT
 q1EXXKc2C6EloRrvssg==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbd104 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=viUReOrFISyjNDj8nWYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: nLkxz8sU5cE5upzUHHcVYpYy8577FAY_
X-Proofpoint-ORIG-GUID: nLkxz8sU5cE5upzUHHcVYpYy8577FAY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230084

On Thu, 22 Oct 2026 09:07:25 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> On 10/20/26 19:10, Jonathan Cameron wrote:
> > On Mon, 19 Oct 2026 22:38:39 +0200
> > Pierre Gondois <pierre.gondois@arm.com> wrote:
> >  
> >> The support is mostly duplicated from Memory Error Section handling.
> >> Other than differences coming from the content of  Memory Error
> >> Section 1 and 2, differences in the support are:
> >>
> >> - v2 do not rely on a compact "struct cper_mem_err_compact" struct.
> >> This structure was used to support older versions of the Memory
> >> Error Section (1). This is not needed for the new structure.
> >>
> >> - The compact version is also used by the tracing framework.
> >> To avoid relying and propagating a non-standard record format,
> >> through trace event (cf. extlog_mem event) the new trace event
> >> prints each field individually.
> >>
> >> The last patch of the serie was only build-tested due to the
> >> absence of relevant hardware. apei_mce_report_mem_error() and
> >> arch_apei_report_mem_error() implementations were also removed since
> >> last version.
> >>
> >> It will also require a proper handling from the rasdaemon. Applying
> >> this last patch without rasdaemon support will silent the reports of
> >> Memory Error Section 2 error, cf. ras_userspace_consumers() check.  
> > Hi Pierre,
> >
> > I'd slow down a bit.  We are mid merge window and convention is normally
> > one version a week or so anyway.  Better to gather up feedback from
> > a number of folk and spin only one revision to cover it all.
> >  
> Hello Jonathan,
> 
> Ok sure, as the v1 was reviewed quickly I thought there was a chance
> of having the serie accepted quickly aswell. I ll wait a bit more.
> 
> Thanks for the review,
> 
> Pierre
> 

A general question that came up in a related thread with one of
our RAS architects. How does firmware decide what to send?  As far as
I can tell firwmare has no way to know whether the OS understands the CPER
Memory Section 2. 

So options that come to mind.
1. Firmware must send a CPER with both Memory Section and Memory Section 2.

2. For whatever other reason a platform knows it doesn't work with old kernel
   so can assume support in kernel and hopefully userspace got updated too.

3. We propose some additional discoverability (quickly - code first) to ACPI
   so that it can be a negotiated contract between OS and firmware.
   Until the OS confirms it understands Memory Section 2, firmware has to send
   the older one (or risk the record not being understood).  After that
   negotiation it can do what it likes - probably send the Memory Section 2 form.

Option 1 and 2 are ugly at best.

Obvious path to me for option 3 is an _OSC like the one for generic initiators
that we discovered a need for whilst implementing that years ago.

Anyhow have a better idea?  The above doesn't solve the end to end problem as
maybe userspace still has no idea what this new tracepoint is, but at least gets
us past hop 1 (so through the kernel). 

If we conclude _OSC plan works I'll draft a code first proposal.

Jonathan
