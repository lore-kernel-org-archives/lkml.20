Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878655;
	b=kcx+OoxoCJ1qpcxDkWUtqixzbvosYBnBdE4YZnc7x9zoC1bFMvwlQDjOHe6PKpxB1jEA
	 CIvRfk943ANV+mhvklJ9M/hRz4N2/lr9KX+buXzayRYSD9Un0RvvGukSzKMxcM/e8AmBT
	 h6avkBFLBiUkzUI5/shPuCVW2q4PqpRyJCYCvQPGrue9YApWKpVNWzg8g68rEHHS8OZlm
	 Fr+CKnJdI4TADemJpErCChCGDE8CEDgNAoyr55ls0LIrLhiELZrB+6MQCvifsuceQVWQO
	 uztCC6T2mDs3gKQTMRp7392Z8tYhBA5oNHu2D0i+oiP136vTVlhnCYHEAeG0lqFfkvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BrGoEFHtqBmKXcb+UUckvq2KsUQ5PsLAHRWOdAWZVZY=;
	b=dA1REdtKnf/kMWUCxSpDA2XZ8eDDBrO6b7CanDQv6uFybqfmAkqfZ9wr3aY/X2CIdx4f
	 y1qlm45eJaupMUAetyL+Uss7RR3P16IylPX7BdffaOQdwBBOMU/mMI0JUZKztWvsrgNXZ
	 rRzrMYSWkbBxrnB3QfQxTQDsTWt/ZAsWw4pjWFAbjh56YqjUfxDxNTbmk5ZrJ/+bhF7QT
	 l+XQyoNysXt90Nq3oDlTB+1fjKGv+DKKqLGEb9e6XAHHhndWnON6gRcdPipoSYrQWM0Ps
	 rFRazLOXIThtqQ7Lb2QTDTJHHEc1hcLicTkrKyoD5EkMgmINVnhW2cil7ysdSHdz4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF5tMPeK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBn49Umn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CBC606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88CBC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF5tMPeK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBn49Umn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbPo11795152
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BrGoEFHtqBmKXcb+UUckvq2K
	sUQ5PsLAHRWOdAWZVZY=; b=bF5tMPeKlBMtr38JagLlRF0GW+2Glwt87ZjNrMnh
	F5Sb6vnT+dP/VBXFjdEchNoDnzT1Sm6ssiOSbJ64BXBzFWzoGFoweWNRvQwXyy8P
	PDzkJLpeIcamWSQPmK08XOApNAQE5QiCH9Q3pzLHd49XFjPuv2t5lUnCNvt3avtS
	aNq5dXakjDg6KiukX/pkBrMzxSfLfYtbin+JA2uJGDRyFg2TYg0sAxbVFLx0dRMD
	ddrV6HLFIU9S8PGnDLxpluQAVOIgXEF7V8rA0Mx7lXGe6/9eMH2UA9qfEr97BTMF
	4aHyr9lB3WnowrVEoSZhg1I/KLdI5TfsbOVBPP480lR+Hw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9sqcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:50:53 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45952ce9ee0so2206065fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792878653; x=1793483453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrGoEFHtqBmKXcb+UUckvq2KsUQ5PsLAHRWOdAWZVZY=;
        b=eBn49UmnXmQZs1LdRsd0+j95m7DXPVkZrjrSaTfLowFCsfCBhK97YjyL+uhiT195Xj
         nXbyoeNwGyokEDaqoDp9tN41in2VbKoCBtYMMp4M6+OUWm5/fLYXRY1M3LTKR/Zqwbad
         4f5zkqpwEOGrh9UrRhRn0fY27BtRJWroCFHfVx9LQLqZ0bclkFjEYPK5NkgZIFGEQQUx
         upd3DelHybPTCEKOpNIdHINyTL5k3W/rAd+KsOFzL0kPxMm43LTDoYN8KcOeIuHcENsH
         s/g7A9PxqyvyXB0ovpLARY4NrRVXvUQiUJ8Y309CJTe1TpOyaE/Xa0MaU213vYg49/t5
         0bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878653; x=1793483453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrGoEFHtqBmKXcb+UUckvq2KsUQ5PsLAHRWOdAWZVZY=;
        b=rdCpfMffuHWbnF/i+EeaJjQEuxO/dOG1EGLt9LwrLiWAocFOhzmdodY5eXV3YI9UCo
         aeqM16irerzdGbjdZN5LjmQFn4y0L4HWmngmTZ9+VG5uYsjPkqRK1KJAHbcB54ECWTVh
         8ZorfmzzjqF0ecL6tLvV/jn4hCq1n0W1kUXWycdbbgReAgnnBNL0f0tBSPjzlesefGN+
         8tryNso6XsphSVDiUxJXBiJh0KxsmTeHdGRSoFAsS2cerbDW7kg90Rb6p7tYqhazYewD
         avKdKULindLFbAMSE4E5Dd6vdMdER01X2IOXXo8ma/5Vq9k2h39HKQo4dY1tuwiafBOu
         hjxg==
X-Gm-Message-State: AFq9FYI/aYSW0/qpMpestLeUKYDbyj6joe8owVVUtERQUpqCE3Jo+eGl
	BeiNoqJULjLzh2sMibVGdw2dUi/PmDE8BeNb03TjccGUhcYDt/1xapdo8epYcsyIEnhK/Mn9JCF
	9UHUR4K07QozQigSxv7SpSlnChBaeQCF8HlwkkT0t89URmrVRYAtx2GKRCbevHzOjyok=
X-Gm-Gg: AYBFou1gxjt1lyyvSAQwy48RhMo3rtrpM5XuqyKqDyaq+h77IFhVH4wER0Q0pzRQiLR
	jkd+OdOqGy2k5fcZs71mrXD/s6iaJnRnWh8lc4VvEjG01SgoTmu0e/hq3P7i9Zs3hd23Tc+Jed1
	EZ0O1/WhqiArh4zK4vH/s0d9iUIgDQZ+CdOgvWKPcbcHf97NRqiugiPJ834ZEkhu/Bl/aek+k/l
	8ZL+CoVONuoJcXXVeOVY/49T8HYnsXZ8pI5qcvqjTGj2PrFyBRIMR1uzReMboOGgZWpD+733IJU
	4v4K78A589acj+vAWLW2YCRuYtjbV0hLsKtBHoGOOQz1Q921kJNN6UEFOzUolZpI09FTR26xvOJ
	vzWf2cseiaqWgbNytMSHWpiiDSq/ETsR5y5WORcGwHaa7HFFYdA==
X-Received: by 2002:a05:6870:a2cc:b0:48f:e107:317b with SMTP id 586e51a60fabf-4a83f5bda63mr1957118fac.46.1792878652688;
        Sat, 24 Oct 2026 14:50:52 -0700 (PDT)
X-Received: by 2002:a05:6870:a2cc:b0:48f:e107:317b with SMTP id 586e51a60fabf-4a83f5bda63mr1957110fac.46.1792878652228;
        Sat, 24 Oct 2026 14:50:52 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c274sm1783227fac.9.2026.10.24.14.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:50:51 -0700 (PDT)
Date: Sat, 24 Oct 2026 14:50:48 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski <pawel.chmielewski@intel.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao <leitao@debian.org>, Terry Bowman <terry.bowman@amd.com>,
        Dan Williams <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 5/6] ACPI: APEI: add separate Memory Error Section 2
 handlers
Message-ID: <at0oOH1Pma1MvFlU@hu-ashoraj-lv.qualcomm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
 <20261019203915.2019037-6-pierre.gondois@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019203915.2019037-6-pierre.gondois@arm.com>
X-Proofpoint-GUID: LctOPKZFfeGVJounKpEH4Nk-ezdtMlg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4NyBTYWx0ZWRfX+LFsk0mDmWOj
 J8k0D/DXjtAmaEWylE5sg8yIydK4OKumnXS8tmrnzS/M9fvTv7SRPYY+BRn5pWEoAHteZxQ1tcR
 TaqWhmwZmq6p+EPCFmL/xj2/lqZCRzMm7GbDETdq0yR7urkZLWW5wa2pkMvpwfe1gW8+prxKVOc
 IMUwgHxjQWhyxsdZTDHrnK5dGdXJnNKJA70fVIDupUBZ7e/1ejBI5jj1pcASf2TnR9x9Fh9HZ9C
 7M0jc0J1V776fhNytmp8SgoTNG/wjWBykJCGnf4nBE/uWCQ7RCw7eWLvk8nYScwpZRSPbafPF76
 YcqK3sMEZptr8HhPLnKFuSSBgAxqWf5cK4KgwwrkNcolE+bs9yWQWBx29TbDcrsuJmYwCShdWRQ
 nZk10Udvv+504+wShsEGvqJoA0jeEaZn52HL/PsSUPXizkxEU3rKtJV6oVVtpT3eNq0avuBTODF
 b0VUQHoFssx/tYpjljA==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add283d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=xNf9USuDAAAA:8 a=7CQSdrXTAAAA:8 a=SBTCx-jMH1C4PCkex7IA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: LctOPKZFfeGVJounKpEH4Nk-ezdtMlg5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4NyBTYWx0ZWRfX+gdisKSJnrnx
 gznD1nfy4x1sy5fp7FlyBYZ4YRdxwdmiBFRcZ8tChR6QdNXPEd+YY3MeA7A2rl9alue8bnvugka
 deuDEd/f47KPDoNqpdPZ3/dIosRrFBQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240087

Hi Pierre,


On Mon, Oct 19, 2026 at 10:38:44PM +0200, Pierre Gondois wrote:
> Add dedicated GHES and EDAC callbacks for Memory Error Section 2
> records. Use a separate GHES notifier chain so existing consumers
> continue to receive legacy memory error sections.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/acpi/apei/ghes.c |  49 +++++++++++++++-
>  drivers/edac/ghes_edac.c | 118 +++++++++++++++++++++++++++++++++++++++
>  include/acpi/ghes.h      |   2 +
>  3 files changed, 168 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index fe10ab0e02f6..c7fb15543b56 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -101,6 +101,7 @@
>  #endif
>

[snip]

> @@ -952,6 +977,16 @@ static void ghes_do_proc(struct ghes *ghes,
>  
>  			arch_apei_report_mem_error(sev, mem_err);
>  			queued = ghes_handle_memory_failure(gdata, sev, sync);
One issue here.

> +		} else if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM2)) {
> +			struct cper_sec_mem_err2 *mem_err = acpi_hest_get_payload(gdata);
> +
> +			if (gdata->error_data_length < sizeof(*mem_err)) {
> +				pr_warn(FW_WARN "Memory Error Section 2 length is too small\n");
> +				continue;
> +			}
> +
> +			atomic_notifier_call_chain(&ghes_report_mem2_chain, sev, mem_err);
> +			queued = ghes_handle_memory_failure2(gdata, sev, sync);

could this accumulate queued with |= ? 

queued describes whether any section in this GHES status record queued
memory-failure work. The synchronous GHES path sends SIGBUS after the
section loop when `!queued`.

For example, a synchronous record can contain an eligible legacy memory
section followed by a Memory Error Section 2 record without a valid
physical address. The legacy section queues memory-failure work and sets
queued, but the Section 2 handler returns false and this assignment clears
the previous result. ghes_do_proc() then reaches the `sync && !queued`
path and sends SIGBUS despite having queued recovery work for the earlier
section.

This series appears to be based before the queued accumulation fix [1].
Could the new Memory Error Section 2 branch follow the same pattern?

> +                     queued = ghes_handle_memory_failure2(gdata, sev, sync);

should be:

        queued |= ghes_handle_memory_failure2(gdata, sev, sync);

Otherwise, an earlier section can queue memory-failure work, while a later
Section 2 record for which no work is queued clears `queued`. For a
synchronous GHES record, ghes_do_proc() will then reach `sync && !queued`
and send SIGBUS despite recovery work having been queued for the earlier
section.

Thoughts? 

[1] https://lore.kernel.org/r/20260925-ghes-queued-accumulate-v1-1-df50553957d4@debian.org/

Thanks,
Ashok
