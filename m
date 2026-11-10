Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351287;
	b=PINF8Ru/xVZ7d7TUO1rGnQTgre++a5K831FA/HQoY7PXrCpcUwH67QgoxVxsVFyh3hSn
	 z/d9vUXFAcc69f3deILgRfsH8L4MZYBpWuNBh3+9FChBY7Curr6/2QJrpTi0h6nZCvjf3
	 qQjS0tkbLFJDjp52fyvYgmBl73pVtg4stm1JKSAXfBYkib7AL+2BP9yaFvfyf9npudryS
	 cI+uQm7lmCeA02IqdcYBkXrjDZ6WspftqFVFwbTHoPkNcJmA/jpYDDTZUgs2B3bWeUD29
	 P7apRfWlHYxPtJyo3SQvvGkkJOp+8wbh9A0Yu9aCoZhkFUflsFkrMFW/bapjSKwIB2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
	b=hWEUo1StUOHTw4MVjJzYI6qsUGrt+ep38wbfa1xQZKBSRHZ2lnoqFzR4eTop6RhTEX53
	 /sII46MLPeQt3w9CLI+rdPcvSb3yAzgQWwN7vw4G8bgHZp1tc90ztjzeHs0CCrJTddoxM
	 EOYU4SVNw8PKAyqw52hf3NJwlK3PlOwqAIPACLbKxbwSvQCaoLhVqA5ppeSioBB1JkzAK
	 hEFUyVk5KvYo/I/M577ID97YNpvcHT/ABLg6IltRxmStD0Cb4kIHHgRMWQSqlWajdz6St
	 J8mCtafhZk23Oaroo2XK+b4nqvPcYfXFalgdNtHtmF2hWkqlhO2kxUCnVp6973uCWMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Qn7Uey;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmj1hNU9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Qn7Uey;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmj1hNU9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKgdC1113763
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=; b=E+Qn7UeymNps67d5
	wrvFa7hBA91ezSgAP2Nj1NnYtcT0IIJBDCANmprLkW0s+C9UUyAivV/UM5EHTJKx
	raR4xn46utCvdckjtofqC/oGelTlmcFImAnqpr1Jbop3njDt/xgeGVTamzdN2TPG
	3FhHoZPSrRELKajEZ2IWF0X9N3DI4P8k+i7WHCuLatQgVv3jJtAEKcAXe3xwrCFl
	DZHcz+CUF8A/ddXTDcul0jZcdmk/mkOSVwWfJt9R5U1SBBF49J/RqfnYHRsmF93l
	e4TZ0MeWzzEE/SlQ6qf40ZQRru3/kL9KCBjMIim/Ib0eT1MXOIm+HFjqkMtFEIoA
	rN8qRg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c8tvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:54:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so3778050eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351285; x=1794956085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
        b=fmj1hNU9AOcj3v0oFUpHsQIxu5hhOTrTCxToJVL+QfjoTCMrvnmTwRjxixIJXqmKnS
         Xnr3atkeabDtwkPgay2V9BqIThRtDNKt7ilewROnHfcd3v26deR5o0MSOtmVV7VsIt+i
         ON2eBt9iSN2qEjBF70hrDIlZIniXR9Q7WHNbDHiEEF9P0akd5EP95QgqXv735osjgRf5
         XlQMKkG03Vel5lKdWtDKrKe2U/knEFP+nELut26ByL+Kx5qj6hRrrr6h+jkCtVOgrJe6
         TesanRQ1lzLtDtsKyOODiI/JPO9jHW7RjZt/V6cWR01Ih82mOH5btHQU00ZOuacIYWp/
         R1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351285; x=1794956085;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
        b=2R/KYeURehC7z+0JDgZofijzXY6hzjMLR4fNAS/P7pM+94LyZgfrAQ/GaxhnofUK8d
         sgn8c7YDLs6BR3974+tRz/7Rl788O02QG7apxNaiMZ0Vzr8cJGrTcynlxvTTn4lhupNa
         DC9RsP6dZkVl0pH6WE3kdF8WZW7NygBZxqjUvJYY+gkgKuUWTl0rHtk8EV5QSy1Pw7Zf
         9CURJkr4SAWZmk2wcmYYNtdM17qz/k3EpnqYuRvUTvM8uHkLQQv6jI/Oaff7iMVA49oW
         Ts4dbUCT57eWfsf6Iyhw6kqI3hHOI4M7qKOHltnJLKRRpqfw4vL16UBkA5krB5tJ4PuQ
         u1KQ==
X-Gm-Message-State: APuU4Z+eWwVb50QwmO/yYZ5K6zc2zGOaDyMucRbyaQ7l4gh0l4zkzsVk
	yn7eqGYKlIUpHu9YVYyQbaA5ZUsOY3AqmG0U2wPE3PkhEy6OJK+3O0l3PMZBCTEJVGAZl7G2vdq
	/LcbhIN6BhALqXHAFDOvtaXvK4LOEaqctM0j2NoAgzsPUUkR5CliKSNyUuG4kbpClMXg=
X-Gm-Gg: AYBFou1J2aI0rqaBKUAx5I4uL5AmEsEq/vudpgaqvzCX8q1UzfeSkbhCOUunwn+fIsE
	Xxgq0XDOVORzGCmJTuQCjd7+dfX2VYQem+SsL9vtMdtM2x82Erspr9SrDS6eMEyFrZlNkPqeGqB
	CQOBKcDqePIfJQh6Ci45MBRbNiV45K/0i/oBwAjnYS0RXo5AVfiUYADA1mzIJDDQYbFqVMVe7Wf
	t1qZ1UzIW17LQWzz37ej0i+bNpuc9zlDAacqQ7ykiqb+S4/+U6f3yjKwGkNTzEduJcAGDGtPXKX
	Bi+N49Uw2FOo1u4h3TSZDrWSbeRlPHNg7nwp1GJInVS4GIYNimABiKqpmZ7d6eN1zHcPe26HBwc
	/3lWu+JUOiAonfNTDDTxySYxyIJkXI1ox5qh1qll5FTgDowH1FWd5lzxGrFfWNhODkzmlcsRMM2
	wwaplviZSIzkE/w/FJgWQ/ZBCUMu0=
X-Received: by 2002:a05:7300:51c3:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37683b487admr1199205eec.4.1794351284563;
        Tue, 10 Nov 2026 14:54:44 -0800 (PST)
X-Received: by 2002:a05:7300:51c3:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37683b487admr1199160eec.4.1794351283882;
        Tue, 10 Nov 2026 14:54:43 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm10131788eec.20.2026.11.10.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:54:43 -0800 (PST)
Date: Tue, 10 Nov 2026 14:54:21 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 25/35] firmware: arm_scmi: Add Telemetry debugfs
 SHMTI dump support
Message-ID: <20261110145421.00002a62@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-26-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-26-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX6ni+Pjl/ozO1
 ZilyB+CoCkYGLjCj9lhuF1f2hXtSo89BdEcqBXnhdn0bXn0XPAdmMqmLx9PtIX/XdHbzVZdmdAH
 RrwqnA2Y5UuYCGwJ7mFZHUbrcPoULr9wVwDwiSBw5eVcWqYHCiWVTpB3FwR9oejFztdsJXiqr1e
 TQ+LZjrpuPhF2h8ZnzTpot6GuN7HfZ5CXdcHfSzyfkVUaJQqlcmIgSETwqDn5/CiKn+7lLLUCJe
 4/hQ3Gvd0pDQZtMExicoQH2+gfQ+gOoVufgJI8LhDdaoJLgL4xntUjCo8CSdJbBFIgNV8zu5qtl
 mIhQ12g7EWCf+p57HHvLbzAzSmgrgTgPqDAuaP7FfrePzG3PY39/p1cy3yakyeW0UuMJentaCKr
 QSkJEMpafHpqvwwaFip/1k3eDvXKFLhTYq42ptMppBGMw1ac/o6tlZ7qCvHSO7Nlicy6O1sn12s
 EzIMqQtFfs0ZXILDGQw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3a0b5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=CKzkSn0JwAB8-U6WE24A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: wNtmXBIbhyBA761OtpOjFLylp4cWU4De
X-Proofpoint-ORIG-GUID: wNtmXBIbhyBA761OtpOjFLylp4cWU4De
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX4KXsoSFAuyJA
 yqIqOAjFiOX6B9TPpjnWkK8SWzAoW0C9gs6G0p4QwYMPHx9TGbTkoBdEYafNuIEMdkZ0W0WjxtS
 uiAEeQf5KIh7aOUUgnVdDKfdDzXlxIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Expose one debugfs entry for each discovered SHMTI that can be used to
> dump the related SHMTI in binary form from TBGN up to TEND markers.
> 
> No processing is done kernel side, beside using proper accessors for
> device memory.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Seems fine, one trivial inline. I find it hard to care about this
particular option though.

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 103 ++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index c21700bd1b43..7582fe295a23 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> @@ -1683,6 +1694,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int scmi_telemetry_dbg_shmti_open(struct inode *inode, struct file *filp)
> +{
> +	struct scmi_telemetry_dbg_shmti *sblob;
> +	struct telemetry_shmti *shmti;
> +
> +	if (!inode->i_private)
> +		return -ENODEV;
> +
> +	shmti = inode->i_private;
> +	sblob = kzalloc_obj(*sblob);

Use some __free magic then appropriate no_free_ptr() after
it can't fail any more.

Trivial but might as well.

> +	if (!sblob)
> +		return -ENOMEM;
> +
> +	sblob->shmti = shmti;
> +	sblob->buf = kvzalloc(shmti->info.len, GFP_KERNEL);
> +	if (!sblob->buf) {
> +		kfree(sblob);
> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&sblob->mtx);
> +
> +	filp->private_data = sblob;
> +
> +	return 0;
> +}
> 

