Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7810B367B74
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699726; cv=none; b=IDPm3++Q8UldohP/4E1JYRRDYIxGnDBNkotkgQHLjX/uy3KBCYhhaJc4BIj2GAB/cr5UqJm7zwwQYSsWLI5e8S42KEubFk+wHg938SB6LXmsyaGOdlalLvuk2X6IvnGZ3uPui8/SzkPqo2HoVzquWUBZFLdU9TFqldgGHl5xen0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699726; c=relaxed/simple;
	bh=47rwlglKSQxfxEDXXmuEm44Dq/NXlBUlHanQleCqj5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEPdATAFCCpELBlPpHxgWdfX8gh+/jHnvP+Xt5HzVfZx8GSyR/rZrnE2kUqwcuUGnkVhg9EgX5VQCMtD5fVHuq24svLrfOxo83qwJrqrzUKaD6mhN6ctqdvO/mB5USvMn+W7NpOYWqmMfuWSaFv3azhRZC+eTJtyYMjldzQvBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThElj4IK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVOxXvYG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThElj4IK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVOxXvYG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdAh204839
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFiMMBdl/YpceHjKDolf2xod3hSnCtpF9Xk21w7Nw2A=; b=ThElj4IKoevghTAa
	4XiJQlDhMIyY1XUHykZQSTSS+vlsvajzHyW34tKwk4T9H9WSo+o2LtEABTw84mK9
	i3/s+pnm1hl7EYJzsVlfJHpyDFqlhsgxn8Iq81MzIoMOhD3BQvtzw7ofgQCzv8aj
	N6sVj1wB9vLTCew2UKGNpE7GAVjXCK30YIF4ywcxdOBLiqny2OwUEPx2jtBYS46K
	loqvi279e8mMjRHAZU6kLRlBRtxFEvekfAzbxfRCf/elUqmSUMMyBCmG0/bkW24b
	PB/w7WQJbrbQV4V7i+FWCl8GJ5xPHiQVikoRdv5mCEkV45TUc1wZSQnFjh8k7ws5
	1LVvQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144v37e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:35:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2529809a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790699723; x=1791304523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QFiMMBdl/YpceHjKDolf2xod3hSnCtpF9Xk21w7Nw2A=;
        b=ZVOxXvYGI8R+LkJHOsuZsOq5oihaPepdALpGlygGb/FgALKuAjSlwxmZ9U6E9RVKMc
         v+clKeGCQ7YkyoFSA6sGYyqjthuMnLLD2mWPoFkeCBENBbcMzWV+eLK5ijXM0GJOopUN
         Xlth8kS7WHsgen8WJQQeAl4qREqZ9XQptUhIXSQodd7AvvfFidsSFve4O46/y6Ma1Wln
         BKP+lVBsWHhHwcaXVFIwah3xxdVQ3ZPoSIWVo7MRhH/ORj04pv03r3C4MzVLO3b7Hh1r
         Dqu3dy6oikL0EPJ87VsLx7kdpShmIsUxnNGG5a9wfQF3XRFM/ZCmd+L7KWzS0OPgbecO
         dRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699723; x=1791304523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFiMMBdl/YpceHjKDolf2xod3hSnCtpF9Xk21w7Nw2A=;
        b=dxUs2okhhllvPivBNnVZ9FtDun1vTGuV2R0lF7alX6dzrQG7JaIteMmMsZ+ypmYO0j
         8CBAxBcHbH3Zm5oN0aUzupQKQwD4MgYfybUuT2K1gaFrdKOV9xSLqMP8jhgNKxxFw1wc
         V7vZbgmcXF2+PcGO9DkCYzqEwpd+cs7TmMXvpAZmy/VjHz28jK/GKRqq43PimLKIcPuc
         A6Jx+nZadW4XcCDfvgwH0gj7YYHfiei/+SHsl5lV2aG7tPn8ILI9liKerNBJVnOxhVAo
         xhHKhAtxXltQJXIU89Ht8SnXttilzmkOY5hjVSTnY96vuHLgZhCfKTdp0jo4ugbPDEYw
         MW1A==
X-Gm-Message-State: AFq9FYLMinbEkX3hUsTYSR5vn5tSf4yyAKfSB+RsiWsLPnea4B4M4uov
	OHTtJNnfZCKJdqOn2Xs2dQaAtw/6O69z7Oyx7C2bMa9QuFr6aUbxEltec04KaNUKS/U3RKTL530
	Q4BkC5lSV+AT3FrhSB1e3ISWaDEB2ny5tt7cZWp5GupDXua14EuKiL+HYS4OzBFqk13s=
X-Gm-Gg: AYBFou0u84pRROrXslVF1KuWD2Fac0qostNOnzQZtvcqD/7uzD3HC96usXu3op08ubV
	w+B9rKW+RqiqZnRYp9K/XZZkZ4532FrLnUt9QpWrR1zbjDDN7wGXtLkA80K30J7AzJj+06qTdLm
	m9ilsuZWKe7M0qpsDvxFhvS9eWDVgySDWpWkp+KnrBJqLCJOm1fd0kRzreXdpy1zGnBNA7u2Ke6
	reu9346f5LmEomv4MEiHSUE8g9xk+E/Zty7cFJbCbzh8rPU89z9zkFRgtpO85QunwEj2eLKqopm
	e6xjx+gr1FcMPVhOqoDIK/F3szpyKOi2ViRUuL7ABTrQf/L+SeTaNYdvoPy+GYo1kqcjkeI9Enm
	uloN6LHOwrwEEmJd61ORkGwdpJa2V7m/FhMe/YOtxcagwaEb8pNGVx14=
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr145703505ad.57.1790699722904;
        Tue, 29 Sep 2026 09:35:22 -0700 (PDT)
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr145703055ad.57.1790699722348;
        Tue, 29 Sep 2026 09:35:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbb201sm60790195ad.9.2026.09.29.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:21 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:35:16 -0700
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
Message-ID: <20260929093516.00003781@oss.qualcomm.com>
In-Reply-To: <20260929074659.2587216-1-pierre.gondois@arm.com>
References: <20260929074659.2587216-1-pierre.gondois@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfXy5zQ7+D/YpuY
 Z/liDQJH9yerAXx5leORrRq+9a0hVHS9LUkdJ21xlaAiabscB50myZ8ku0Geszxujl8foVXENaa
 UlQQ6+41pHZOMLGvwnAaEoyLYCw/pFwnC8XN3t7doR7/7s4SaMixchnYLsQOoC4PH1g5tRxPv+9
 gIOlUWfbV5XdPPC48byP0+q+RyLLnOynQ50lWPhDVcjw5+xw+ztWcHFAuQnJ+2UOMA+4A2rM0p0
 Dj5/CqpYoUSR83TY989n73poL92vvS90n7iMkmN05Ae0+3YfFfN2IYiCT/YDSmHDrD0PZWgvsib
 wR6TujX1CVhIaoFF2f5Zs5/70QmiGq4SfiR7WZ1p3uALFrMHcFLoKibSDkwPPkS7EtOG9qjOcBv
 r5bFCum2svv2e/dqGbPbCMOWOKKAp8VCuTcMaapkzzPMsqJvWyuUCVtIepEmyGpGmNQPh6yBz4T
 ttkZCCvRT4G7aDlAmYQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbe8cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=XM342pYOwZ3m7ahhEzQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: p-qm30yr0pb3gMpQM9G92tfKTxkED5dX
X-Proofpoint-GUID: p-qm30yr0pb3gMpQM9G92tfKTxkED5dX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX2a8QDUcBz/MA
 W9mu3kmkJy6qkglKPDn9O/S6KIUhMm8TA+SvBgT1bpYqqcWbUwIthAe056smBULDQlJa4cf8BEE
 H3dukbotKUef8jh6nqEEF3KyLmVMCao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290066

On Tue, 29 Sep 2026 09:45:59 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add support for Memory Error Section 2 records.
> 
> Extend cper_mem_err_compact to hold both legacy and section-2 records.
> Add a common parser and convert the CPER, GHES, EDAC, extlog and x86 APEI
> paths to use it.
> 
> The extlog_mem_event payload layout changes with this series.
> Compatibility with existing userspace decoders still needs to be
> addressed. More specifically, the rasdaemon relies on the current
> struct cper_mem_err_compact definition.
> Either:
> A-
> this patchset should not modify struct cper_mem_err_compact and
> create a new structure to handle Memory Error Section 2 events,
> but this would ignore the similarities of Memory Error Section (1)/2
> B-
> userspace should not rely on the struct cper_mem_err_compact
> layout. extlog_mem_event trace events should instead emit data
> that relies on the actual layout of the CPER records, as defined
> in the ACPI spec.
> 
> I am looking for guidance on how to handle the above question.
> Current implementation lean toward B, but emits data in the trace
> event that maps the new/updated struct cper_mem_err_compact.

My initial thought is a no to modifying the usespace ABI.

It isn't particularly painful to just have separate handling code
for the new record.  Unfortunately the ext_log tracepoints don't
split out the fields in a fashion that would let you change
the structure.  Other RAS tracepoints do it field by field which
would have been possible to augment - even then it would have
required care to deal with field size changes.

It may be worth considering a much more 'expanded' tracepoint for
memory error section 2 to reduce similar future extension problems.
That is express ever field and don't use a compact structure at all.

Mauro, perhaps you can give input on what works better over the
long term?


Jonathan

> 
> Pierre Gondois (6):
>   ACPI: extlog: fix extlog_mem_event build issue
>   cper: add Memory Error Section 2 structures
>   cper: extend cper_mem_err_compact struct
>   cper: add helpers to handle Memory Error Section 2
>   x86/mce/apei: switch cper_sec_mem_err struct users to compact CPER
>     records
>   cper: make cper_mem_err_pack() static
> 
>  arch/x86/include/asm/mce.h     |   4 +-
>  arch/x86/kernel/acpi/apei.c    |   2 +-
>  arch/x86/kernel/cpu/mce/apei.c |   2 +-
>  drivers/acpi/acpi_extlog.c     |  23 +++-
>  drivers/acpi/apei/apei-base.c  |   2 +-
>  drivers/acpi/apei/ghes.c       |  20 +--
>  drivers/edac/ghes_edac.c       |  26 ++--
>  drivers/firmware/efi/cper.c    | 219 +++++++++++++++++++++++++++------
>  include/acpi/apei.h            |   2 +-
>  include/linux/cper.h           |  58 +++++++--
>  include/ras/ras_event.h        |   4 +-
>  11 files changed, 283 insertions(+), 79 deletions(-)
> 
> --
> 2.43.0

