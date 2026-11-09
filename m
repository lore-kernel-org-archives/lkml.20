Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261444;
	b=AcBYZ4mS6YaQf6LTLaFePkT66U8x6cSY7qpZYoAeHOcYcMTKbaVVQj0RUjate4HJqalb
	 WWOos1OKBAkPjHFOD+ehndBVVbYydBhx+sZS7ydXBJ7ke7tEBJodmWhmZInQ+PAmtAx9j
	 n9U9lnO3dYvcwPI8I7jsiAE4CdvAM63jl57RjpIB1Vccc2l2L9ptz/z8nHDaeBwAA58TQ
	 wTVfW1xTGpM9Lx4tc6H67iZEoTL1i/dNzAz75mL7KmKBey/LIUY9kaIkP/q+I5DcTSSG4
	 leljirZPSOybf3vtOBzamINvc+0ECX1a1yrvzWm92hJxY0dle83PGqIhcKA4PFcBXxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
	b=TwMzbMYOz7pKcfe88XJWn3bINo+SMpJwPcY2oZn3PJKkG6ttHBdj2+6WHQmi7irkS1+m
	 ms/XgXU5dn84g4tJWzb3XXrv4Ek4JblplPxMjgufyfQ1HYMxhTl9y/ll+etMJrafnMefJ
	 kDCs6zf9PhpdCDj82DHX3sholB8q4ubRxQgo6qnU9v5H10IYfDG4CZrXGGVZPCKUDSGmo
	 arTjVJQ2CNRhoeU/xOUtckzP8zMs5RcvZgARQXo+idETEO2LBF6rCO0qyQ+rxsse+kNXv
	 7ZQIAZ4D/Kd+NwzvuGjMDUVlWZgOdcu/jybzEoq/QY+C5eNTCeDAW1x0C2HWzQ0o+LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bROBw/Ff";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64983606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64983606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bROBw/Ff
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA2Zv436034
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 21:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=; b=e1VcI6mF4e8vaywo
	BP2JNRCIqHssN0C8xO6Zctry3jEKmvteqTjRhEneMmvzz90PUDh0+aSacce9EAYb
	SBGo+9EwmJ8YIEDQGxJ3CE1I4ob3yG3mlEbFtk0ViV7XnQF4VHVoHxbK5t902JfG
	CZLg6z3J9gD3zgrCNMw5RQCM3rrHuyONQDtVSbxmfsSjBvoJZu3wi7H23A/8iiTr
	36EiWJ7SEqEcIJ3zXD2H/J2HIj84nVWDfhJoe/+7KxczykChI0kU176cMMYJMdNj
	kXFBVWZj4l0DCSZ7sxIthy9ceHbhEETDizISpnPuCTfZ6I3AHjKOcpQ9QwDIEtd1
	dV5NaA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcja6r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:57:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so2352026eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261443; x=1794866243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=bROBw/FfMK8VwRDHkxTvvnAvfeP9mwtDx9xXEWSiFLlTEWtzxNqMGHzLWpgWnIlL66
         E1uZUpUcCcJ3tCs8thPWdQKL8DKCA3txpmnU0SXqHXZdxaNS7b7+dmtpaA7ggvas1Vni
         ezBRGqMCcDgfsSExFw/JkkQnBFJtymjyn+4AUlTYoIzScjeNmZDhisQBmV0Bmh13fyRo
         AUovlx3Hkrx2s2dXdU9TMHTT2nZF18tQ5kelA8RaMBqKAZfSEHAVzmqZvsPZ6ogK6iAh
         U8/33gjFY/uXcztsLEIQXx1KTdBJZht8SOt07EXLmnrJvtmUpM+KucNSMX3Nl9KX4EE7
         7YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261443; x=1794866243;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=m7hpNKhHgwkk8wiF6TEE10cbEx08eVSRthFQ9tVMKKCRbRhZ0ya5n0eQySaJZ8fIG0
         aD7e6Cheb/TuC9PRfCr8qS3UQ9OvKX9tf0d2TblnlUq9n5NEiY7WcVIt+Hs/iap5OWg8
         wyHL2ynQiLoQT0PraouryWCAfezHTRfFWEBsHD5KkdK/eu0PpF8wjf07nOPEnhG32PJC
         Uqh4P8VF54Za7aXpgLbA+3AcZbNwRg9qBDcgaiVc5AV3dxYR1ca+dfoIyaYwoHx6H9o8
         ETxNY3WqIa0QFyVyjo9jnLdGAetpC+1bdhWC24IbpdKXHoJ1uaG3R8YFX7rs73JuZ0b5
         AhcQ==
X-Gm-Message-State: APuU4Z8+I/wVF6i45yAxDFJ/n7TXOZdmFFOFhZVKl7bZf/1IMrwInd/s
	SBAKs3kgrXv9UTM3dZSBC7jT/J/X+eCLp8QPzUfDLUp6xiU7CIXjOMcs6lIRVm3oMJAMXZLuOdI
	wz8u76L4o20RTWUEo5jiFPBNYf/ciAOtyZowluzCh+NkbxkoNMl9hr47e54k0Xog2FpE=
X-Gm-Gg: AYBFou0PP3zHgxGFuqoFHkdbPIGXzCo3eHUUlE3RV43CW3wsPz3VxZcj30HaauqArPJ
	2oVB73yQflR/oyhpjwO8StdfNWkSHUP/77n5cwRDTkixDDXg+JfbvRG2ZBMbPZAvVAlmHGmJAxd
	baU2bwQr1MmueTHfrTC6aenEDfW9G03XDY1loJkS026GD9uQFYj6eC7d/Z9fBPIGkqO9ZV/zref
	WJhfp8zyFo+1YY04sDgDW1E02t/ncn+smpJ3isjmdFG0oSq0a3cwwYdTbeCjUwJ8zj0lifr2myb
	vN3Jxt56lUrBDWQLgEAV/FVU6OS48fNlPhrN86GQHwXtrPOkLLiIBMbCqjIFYDCcB/t3MYcqKDO
	srN4K58fHwn3M0nwDnlpLs+I4CiYVFoBZcUsNsOqx/M9tfhovtcn07WZbXHkoiyj+WmSdjdkvK+
	Jq9ykF208CC2aY96IT6j4vKP++FAc=
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817959c88.14.1794261442589;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817919c88.14.1794261442019;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm2048895eec.23.2026.11.09.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:57:21 -0800 (PST)
Date: Mon, 9 Nov 2026 13:57:13 -0800
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
Subject: Re: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261109135713.000049d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-2-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-2-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: wmstK-81fQ6vv_lssn6jGKYXOQIxCbRp
X-Proofpoint-ORIG-GUID: wmstK-81fQ6vv_lssn6jGKYXOQIxCbRp
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af241c3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=TxbN916H7FYpum8SNwIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX8cZITGSrL3Yb
 qe/eWwKyirVWuGfOEJO6oIKqtUhzQfDjF2VXzEMrE1WcTAmOtyEtKbQ/dJ9CHD8ErDxBedw3VdB
 YNDhMJBZGGCkIzOaSs+Fq2B7tSpishA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXzQ3Gqqzy4Rgr
 C0pMkNXC8AmJL52TdJjGCGWtzXTjfGf9zW2vn7NvXV6Ryrje+W+gjcovDszvfBs5CBJjOJODhcb
 Lh3IsUKmGAwOLsRKLVNb0YHPIvcuD7T2tBEPiILgBxluhalld1iyfNxl4Int4mbz+PHPUhkAP6D
 RELmAniN2UCRElRnMrRcjwBNN3grVrkwmSbRAH6OsvME2D+Lq94C+fF/7JgdOjwfgYgYjr6baxL
 lkgQpBENDLBEff1B2eooDGiyboWRGZC09vTqfsMAVn5bstjVFsNFlWTIwn/CTJzv7u8Ov3hQCPU
 zi8ZFuPt3X/QbqMpKp9QI6nC7RjIKl1n11/KxyxC9Df3/Yu7dZyKbZbhI1dO43qVwtJSt+8ZdyF
 Eak0f8oJGZG2WkYWzzT3TeQwXUFD1grGZkgpJX2Ar7Z7WdRvCIo+TUrAv9mZ4krpbWoxPnGZUap
 cCf3bVXDCz+8OLPzlvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On Mon,  9 Nov 2026 09:11:47 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and incosistent multi-part replies.

Spell check patch descriptions.  inconsistent.

Otherwise seems fine but I'm too lazy to check all existing protocols for
that minimum size!

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..55d9cc487916 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1873,11 +1873,21 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> +		if (i->t->rx.len < SCMI_MULTIPART_REPLY_MIN_SZ) {
> +			dev_err(ph->dev, "Invalid multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		st->rx_len = i->t->rx.len;
>  		ret = iops->update_state(st, i->resp, i->priv);
>  		if (ret)
>  			return ret;
>  
> +		if (!st->num_returned && st->num_remaining) {
> +			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index 8583159059e6..b295006ef1fd 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -33,6 +33,12 @@
>  
>  #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
>  
> +/*
> + * Common minimum size currently required by all the existing standard and
> + * vendor protocols.
> + */
> +#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
> +
>  enum scmi_common_cmd {
>  	PROTOCOL_VERSION = 0x0,
>  	PROTOCOL_ATTRIBUTES = 0x1,

