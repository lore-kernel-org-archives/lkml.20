Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C2388E60
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996472; cv=none; b=aajrXBAA8UWo8AUsdoYu+PdY+4XdMuP/xUtV2t9qax4IW8di7ziHTr+aPVU1NAQF39NGhqUavaM7IjkiBQPLZxtzX6BABbw4p2bTEPhgUUQn/pzrK3JkCcM63vWVe+30rGcGJLqxhq3stgnknJS9W0g9e5DMK7kqDEbexJrf77Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996472; c=relaxed/simple;
	bh=ep11eUjGaRYZD5Y5tVL923e3l8aN0sPspZm3DI41NHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmD9UcHAXQD3K14EWE3EFmXJLT076IbTgcat2K7Zyk5h66PV7Ai2oLuGg6MTs7nJmG7Q3r0TlREbq3F1lcj7yxLU7Y34Cc03w5TM8f1E2FaWVahekwtTzCrTa0CBwnOE4Pw6FWm+b5agV953o4YmYAqX9YW12mFfe2mgqXniT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8V7I8E5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGTKlkuq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8V7I8E5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGTKlkuq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZjfY3468940
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6/IglL+b+wtFPZ5EstJiD1NM9orXL5+hMxkr3Qx2XI=; b=M8V7I8E5HgeGS4S8
	a9c5Tr8E9X2SaAREIjIFFWKD+uGumnMXVPRMJjQX6xNxdOG2L2o045+kC3PcP+Pc
	hTB9oPiggtORrRdRrYfijzEF8xXuPlMhf/wI9tAHvVJ2IJGG3dvn8bCnw1RjLbYn
	a19PMwwfJY8UWdJlrlmi8K8Iv2kfvMhFwnEjZWgNN6m+XC3bzHD0PxB/oLC8wjI4
	pwz9a2eN89NO674EKMw8xZcegr9YTDUfiajgesUe6MY7fVp144aI/xTF1FtvrbgU
	q15dhY2slV31YQ9KJssvJwBLhjoKx2rV1TUNmRr8qQvqBvBh9riQDAo8zU6hj8oG
	D7jWmQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd781e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:47:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so4081199eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996470; x=1792601270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B6/IglL+b+wtFPZ5EstJiD1NM9orXL5+hMxkr3Qx2XI=;
        b=NGTKlkuqFd4i0R8+AFOKpZJa4h9QvWUaWkPxpis94KiNQtJ8CJrEhBYHEjfdYNh9ob
         JMiOBc2tlMWk2u4LAPGoLneBD7cYRpG28hS4sdLrVSHBAmgU/ZX7Hq19xgO24kU4dvNu
         crIujZtbWv3jDNYH9xN8k1tXLL8WMapBlRrz69caosnuiEF+QUZHgjp+EbgbShAgNazz
         qAlPZauHXOhllAUct61lvcH6mTdzVxHj4mxCjYdKUZEB+P1dOerZmuFfBagm/tknipcz
         hMAT21hChGDLaEW3pppyW8RvgJVHZWaIiaulag9gGDcG//gmCXDpuuChUnvSnRAewq1N
         ijoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996470; x=1792601270;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6/IglL+b+wtFPZ5EstJiD1NM9orXL5+hMxkr3Qx2XI=;
        b=sGB2dklLmy88PlkKaTqIO6JoGyVED1aEd9KOl1cx0wcg7kY0z8M0xnqOesXGgH/JOo
         C8swDZzZlzXLEad4lr6XQzo9g/9KTX6xQ+0q7lqyKdmvQtqK2BVFeFAWqtF8jaWNcZZi
         0O+UkfxbkpJDjys3Ir8pdWKzMF4bzO1js9wly5Roew9c+zDsMEuCz4vdypEnQ2veETNy
         boZJWtdzg/EPoHOrLQHTaF0gql8y+hK9bn9yAcfPUIhHdegcN4a3r/IA4LtB61HskxXz
         7JZpJROPu4lKLL2lSq1qANDfhsfUGDDgKA9g1I/+9QuMVz+OoirY0HcJ23O6HFg1NHEd
         8jPw==
X-Gm-Message-State: AFq9FYJseaKbECX79Ut6aAedc1n1DxOjx0rVI+j7Nqnnx2/krLbNa+hM
	IePfyDUrJFX1mdf0cCmIQcyNhsIPN0xyKFhIqY3s+YbsIIVtIi4ufhgmO0rHj7UEyX/sR9sxRne
	x41fWBjcFkF6Ja+5RapaC76Yr0DwOwJ+X5rFjyzenukVEkpAMTLnAu0UY0O3P+Ctpurk=
X-Gm-Gg: AYBFou2qEV97iOpyZlXrXeZFI7cbn4oxH0xAKMI3EsV9pdcUcwAub2axvvy3hlVhHUG
	Pjbp8UUbXYItm228Kfx0iGbWV1QFTyrOJj3f/WFgpFfgbnNmlILeppyzds45/dHVBO112T72/0r
	o5hU0hMix8GpgHSPXpSPpeJqLbJR/9tGfL4XdUdzuO9XZDL/1tNE1znMbHqnDUt3GW6msDRcPcd
	UM9g6mLipyYSJ1dRIM9wc1jVJa03gSYDA2DumIpZ74CSSUP/l8f5FNsBMfLaqC1vuvxgC426RUx
	TSIkO8CJEfSslbv5tHM9KexxGdJWtDJrOYcT2vU6XEXNRabrq6jGoDPOSIiW+CNVX/iw6dped8i
	VbUf3WjORi1dHzMmqwQqXKOWzwDAx/0N8aZMJPpD2jm3SE4kboJQWLDw=
X-Received: by 2002:a05:693c:87c7:20b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3537e020a08mr23634057eec.16.1791996469863;
        Wed, 14 Oct 2026 09:47:49 -0700 (PDT)
X-Received: by 2002:a05:693c:87c7:20b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3537e020a08mr23634013eec.16.1791996469242;
        Wed, 14 Oct 2026 09:47:49 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm39681092eec.8.2026.10.14.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:47:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:47:44 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin"
 <hpa@zytor.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
 <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Hanjun Guo
 <guohanjun@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai
 Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Yazen Ghannam <yazen.ghannam@amd.com>, Radu
 Rendec <radu@rendec.net>,
        Avadhut Naik <avadhut.naik@amd.com>, Kees Cook
 <kees@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M. De
 Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Terry Bowman <terry.bowman@amd.com>,
        Dan Williams
 <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [RFC PATCH 0/6] CPER: Add Memory Error Section 2 support
Message-ID: <20261014094744.00007c0c@oss.qualcomm.com>
In-Reply-To: <94bf3539-6a94-4efb-a57e-c0e1ecf243fd@arm.com>
References: <20260929074659.2587216-1-pierre.gondois@arm.com>
	<20260929093516.00003781@oss.qualcomm.com>
	<94bf3539-6a94-4efb-a57e-c0e1ecf243fd@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6acfb236 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=oD4Dqva4uQW2vlo4LloA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: usiUazvJyhS6Ml7wmyxBsOrXNiTkr6-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX5GTSvOKADTry
 ZmHmSNlWUf6XIiYJcUTFD7rB5TjKFHZizoJ2J4fdZHocNCIuo1diMQYkpcMmwvpzCI6x4ykyPtY
 EALZiZ3q6bZUJuwLcnQuRW2TTJcwDzoYgKIy+oNa7RKlqBn0CJbXBHB7aUH9GcpKa49X07mlV9+
 k+X2b5bYfJs6D+1TsYRB4Yv31I8QUHtMoxm1N3oIK76HPMTT/FmhUOXgF1PZ98CsrEfJM3lKpGF
 SLwjTmp0A6KbvLo/ipdmnAER++mUoxYEU35ztjzrJWA0/AFhAVhcdAAwnHk6xbcnTXNbmijY7MH
 wbmPkiYSlsZBDm+Jd7swtSc9pOaxkRhIJG8hWVReXD9qQx9VEqh+zbEbbeTLnNOYF2Urc0D7f9w
 Cy+JR/CTqdwRLgdHYZ31NXUnUb7r+yAJFMll1A/JCo7oKbHwE8Q++tYUZMYPaob6/1MvY+V0WJ/
 jb8qOXgTdbouRetlO9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX6Klw13WS5uO9
 gWqRFlYEPCz9j2OD7lwMIWETUfbkD7ghgJ72xddYaQ/h4rCE/YJZv+y8lzs/gWRWC+OjtisnGKO
 Uvur2q9j1sHmce0mHO+91yKMNG9jC8M=
X-Proofpoint-ORIG-GUID: usiUazvJyhS6Ml7wmyxBsOrXNiTkr6-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On Wed, 7 Oct 2026 15:35:08 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> On 9/29/26 18:35, Jonathan Cameron wrote:
> > On Tue, 29 Sep 2026 09:45:59 +0200
> > Pierre Gondois <pierre.gondois@arm.com> wrote:
> >  
> >> Add support for Memory Error Section 2 records.
> >>
> >> Extend cper_mem_err_compact to hold both legacy and section-2 records.
> >> Add a common parser and convert the CPER, GHES, EDAC, extlog and x86 APEI
> >> paths to use it.
> >>
> >> The extlog_mem_event payload layout changes with this series.
> >> Compatibility with existing userspace decoders still needs to be
> >> addressed. More specifically, the rasdaemon relies on the current
> >> struct cper_mem_err_compact definition.
> >> Either:
> >> A-
> >> this patchset should not modify struct cper_mem_err_compact and
> >> create a new structure to handle Memory Error Section 2 events,
> >> but this would ignore the similarities of Memory Error Section (1)/2
> >> B-
> >> userspace should not rely on the struct cper_mem_err_compact
> >> layout. extlog_mem_event trace events should instead emit data
> >> that relies on the actual layout of the CPER records, as defined
> >> in the ACPI spec.
> >>
> >> I am looking for guidance on how to handle the above question.
> >> Current implementation lean toward B, but emits data in the trace
> >> event that maps the new/updated struct cper_mem_err_compact.  
> > My initial thought is a no to modifying the usespace ABI.
> >
> > It isn't particularly painful to just have separate handling code
> > for the new record.  Unfortunately the ext_log tracepoints don't
> > split out the fields in a fashion that would let you change
> > the structure.  Other RAS tracepoints do it field by field which
> > would have been possible to augment - even then it would have
> > required care to deal with field size changes.
> >
> > It may be worth considering a much more 'expanded' tracepoint for
> > memory error section 2 to reduce similar future extension problems.
> > That is express ever field and don't use a compact structure at all.
> >
> > Mauro, perhaps you can give input on what works better over the
> > long term?
> >  
> Just to be sure I understand correclty, this means that you would prefer
> to add a 'struct cper_mem_err2_compact'. All the functions currently using
> 'struct cper_mem_err_compact' or 'struct cper_sec_mem_err' as input/output
> parameter would have to be duplicated right ?
> E.g. arch_apei_report_mem_error(), cper_dimm_err_location(), ...

Yes - if that's the cleanest path to not modify existing userspace ABI
(and ras tracepoints definitely count as that).


Jonathan
> 
> Regards,
> 
> Pierre
> 

