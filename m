Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF04519B6
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765942; cv=none; b=ezKN0RMSOtY6eXRmolNIl7bnZZP0kb2yhg6gCI7oLju+Ua+4chOpif29P03v7dMp/rN5sL9zrLUm+CYOw5mfW13ouI2/rRvXYnMhmLyueZIAEbUw5G2LhwLUDxm+0Nq1C/X1qpF+OX8S/4LUbjrk6jjccIQbEbWc84UtxYLY9gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765942; c=relaxed/simple;
	bh=WjSSs7DWZ1WjN2t1xfRJcmMy+SlW84QKapqtSQqqCAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmJbQ7RF2i/xJBYHbOwt4agumrgXkK/Ph1gXDCtmJ6zC1zLv/CcsesQflsHw3c8wJRqNd6HIq+3XvbsZhxqiB8+cIuZoN9R8eNlL5eiHd2AaGDSSiUKDZpHHugX1PtzhqWIZKxLEvsNTBQeY4sL4BeMEl3JHypL/zdqRbr/plEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhgie42g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gd7kndJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhgie42g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gd7kndJ6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGukVt343384
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=; b=Rhgie42ggrY0U3yI
	bvXJiPXqlv+TLTOApxq7JoX4tcFRw/tOdvt7CK3m6xZ/e/In1+GLWOzV49yUiTrt
	/D9X8euAEiIhVPosiVeyOYkmJwcXWpynpp0a+6HaICnU0C4ez3bMFX2DIyr/fVP1
	NmULcbcse2vL/PaLMCAv6p4aFOmRtu9jbmJjxtPE9WhvNaQ2mtWHYHFIvW3+xYP3
	gemdw6vUCpTLjKgTJ44NYsfJMqjNM57nP7I7cVPfSxsgYeqFJ1j+zWxrGrj7O2g0
	8hXRkn9lvFdoKMQ86aPJT/lXYtFjyENAIfCPDjcp4UmUjLouyYaVwdaf6rhT0CpR
	GOOvtw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthtbb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:38:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2271878a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765926; x=1788370726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=;
        b=gd7kndJ6q1GmFgw1Ri7a3aOU4JC6j0n2LX4pbSvxRSM8EkGeonQ869EjuWX/ybTXxN
         l5nguKJKCO9LJOOoCeRUa2JDe8vI6O1V/Cj93iGjVQPyWa9n/rE40KUwQKHtaOWIhVla
         t9z9FreXdw55kW8cK6YKr9hma1KJz7pBntFVz1MjcBa77sh09K4/x/vJppFU7WIWcQx8
         mbHP8YMusWWrjACiE9uRGIudVnq/ZiMOdiBCs4dpAX+8OOnTYQhsO+ZfV6KqJ3Ay79qj
         JjAvDuX7nDRmuqMtL2TkFJTJ2SccMOZKiVhcmrI8Kr30BzSlZsoGzENXMciTA5NRtvZp
         pk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765926; x=1788370726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=;
        b=mhG2I2AvG2jEcZ6XPTdE34R7Qiw8Khm8wXiSj13l2IkLxmxZad08gBaWbXTSo4znmS
         FbFXP7vIAUXYQomMYwe4XZmGEP9HTVG6oRJQl9V1/UMG4bf8R0Bdob8itD3+tTXiRJ3X
         El+r7KcKesk7bSlf75L3lZKnWZfJp3kgbxKrF7QOyAMfp4e3EmNPw48Os4DwTv2BIf4D
         Oz7c5td4Qhmv9bJqQ4ZPqCV4mhzZEMeMcUT4NrerEqmsJaVHVEcRzO3y0+ozUPoShBRQ
         fIhmJVlCtQMaSglChqhPRtuuDfGgqnBMwje5EpP2w8DeD0Dw3B12mgO9G/YHZzUYaVQb
         xrCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRPdoj7h32xIt1+f2wErThRezlgB/UJzdkKH8nk/qIT12nKYBl6NhX4C8Z8i7EiZFUzx2m1WwNQT3s3Zo=@vger.kernel.org
X-Gm-Message-State: AFuF++mvNGlXOtZWFbxRTXRfxqmgpI4Y4RuQUKEoyF8o2TEY2wA/aNN8
	LtvCjnsatFW15iivUQQY6w1Vi0rrbMCQ6/LISuLB7XeieZwzhnEo8t0qif2EivrCk/mIRyotgnH
	rj6tqkXNDSVvaDXABUDRlUSWsMu+IaiREQITyLJKrd0+iqVzWPdncBnLI6olhZHZoxKc=
X-Gm-Gg: AR+sD10nOtIN3K+jT4JT5sKzrhOmsR4v66faXVYOy5wvmZ/IEc4sNRej16kdkeg+Upw
	zjdrajRgUtLHZ9pLDRtYBOi2o5S0DpKM9b8onBydpBDlWJtulnvua5pR53o7gD+AgV4RzlN2PJt
	OzMltOGlzopFyj+haVSC6cvIIY4QKrPiDeEm6HYHVzqSm7FhSPOySQHsIRJKx4gHh19lCE7ENay
	6zlbDEMlQvfwwwbYesEaWRLcQjyoowfeKQJTtvFOViNaEcilcGGkdD0qtM9Bd+Vgnr89VuSM4MJ
	iviXhF8+OfIHNZ94sRq3DSiDe2SdjXT0fUx6uaXux4zH988st8RBefH65XLz81+2Teym+bSsjDh
	kBxQPtn2obpDIkZV+l2UnWY8FdzmFt+hEpNKU1KX6wF0ljFfOPGiWvTr/s4SpZHRMFF2CPJupeh
	uRiaFt/XA4dFvJcUISRw==
X-Received: by 2002:a05:6a20:9f93:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cf7810f7a6mr17119396637.7.1787765926507;
        Wed, 26 Aug 2026 10:38:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f93:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cf7810f7a6mr17119274637.7.1787765925967;
        Wed, 26 Aug 2026 10:38:45 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beae6484sm1288684a12.4.2026.08.26.10.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:38:45 -0700 (PDT)
Message-ID: <35c1a38c-c174-455d-ba16-ecba1f7990ba@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:08:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/12] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-12-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-12-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8f24a7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ChElBHoWxOA9GRTPlqMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Byi8BmCHhon7xVljNXrgHGQttJelStDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX3V61dp5CrtlX
 7SxMDD5ndI0c3I/k7IH3pRsvw/ibEDbANJ1r4gnvg9hUvOiKYDWU+pDrW28g3tnaj0yv8hnZMsm
 PhjKitKtpE+WuuoVl7pNqi+vvkMzQMD3PF3dzfMXWspXmGBB8Gm0cANQqHRBCfgUXeqv+rPgEt4
 5SV41wtAUfG2hLMRAhvJMUTK+VOl+gy/AGK7iPytyaeL/BNgmmTZyOEnigRrpup26kY3MKgXYv2
 VlwAEiN7N1Fo7RPtF0itNanovJsxRQwEcJ8a4OK+fzYsWcrqaVPX28vTMdJY6HAPDDKihJjuvQ+
 Pwzm3wl/DzujQQy/aB8XHk3JELXYwHMBFuZtMymmtHfF63nvXjKHAv0XHv0p2BfZUBk9ZUCbT4r
 B7+VtX1vFWqHNXhRGoPLq0fbhj6+F1JPuttwgHdj79AuWi/wbka0D5KYjPhFgF0YVbRoBFt07Iv
 6SCqGR1zrvE5zrwCUxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfXzmUhap2NazPD
 o3eZIjEU+yY5SzLMGdT/vnGULQC+YOGqPJLR09z8fK4o0phJZvaTcsKBbzoZvdUagufMSOmMUU8
 3p2vY9O9aoXWcSaH2l3jnBwIRDazcGs=
X-Proofpoint-GUID: Byi8BmCHhon7xVljNXrgHGQttJelStDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260147



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> a (potentially sleeping) MSC access as well.
> 
> Change the error IRQ handler to be a threaded interrupt, but keep the
> handling in the hard-IRQ part for MMIO MSCs. This is needed since the
> CPU affinity check in the MSC accessors requires a non-preemptible
> context.
> When the MSC is using an MPAM-Fb based access, we push the work into the
> threaded part of the handler, where the accessors are allowed to sleep.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The actual IRQ handler learns how to deal with errors. We cannot really
> handle them, but we can try our best to disable the IRQ anyway.
> Should the level IRQ line deactivation fail on the device side, we mask
> the IRQ on the irqchip level, to prevent an interrupt storm.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 77 ++++++++++++++++++++++++++++------
>   1 file changed, 65 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index fb2fba5ba96d..4b1382fce2be 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

