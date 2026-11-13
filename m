Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595371;
	b=HeygbZbvaZnYBiysAgdaSWFfD1lboH2VzdzdNJCTQhThkF4px6zqMcihufhHDXX12/E2
	 lNAV2pguACd7URmBdMAmme7m6PH3X49YcGAvCw7UznjI/pH0yRyeBV22kKda6ebTG7PC8
	 CqGlnDjtynZVOxz4APXw/4IP8Q2Q9DnlHnSQhHXrtGgR99MqGv/ce/XfFpM9+v0+t8tL5
	 bgIgTXzw5DvEvEqEWmkz9WCjMk4jqtR6tejeXi9MoYCzmIDAJMOjFfA7MnG8SuswanVvT
	 yNODJ9etP2tS2odYNZgz+hJVKz2nANUMhmOARSH9EiRwsSpUAbEGScsXIS5sHxiVniw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
	b=q08D1vgOODcZsUzRzhEGenhwLeDScmp5DKGYg3vyK8Sazd90+Vm1CVLEpmDOjKpIjXyM
	 IrO+Tztjn4xQGZaRmzx6hSZ8E9ucyXiL8L9/SIoQ8Kyi43dtMTYnEYbkHbncSSPojSbCQ
	 C0V034VZ6kYjD2P/8QhYyymNCIJKPO93OxpitXgWBYgxYof28v+tC0bi+CjYK9Q46s/8I
	 ZTP2swBRj3/41O4adNaWhK6dstjBtBzIVzKV3yiD6cKp1SoH2/t3UuRqgAwSYG7oPrIce
	 rSFvKhoF3HIOeGiynbS/+c6qPC9472F8UrWrWv1HJj5EuXOmillJpzkIYnK8wAoN1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTuBpkyG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFSJb+ad;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E3606A66C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7E3606A66C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTuBpkyG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFSJb+ad
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADH3gej3868382
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=; b=oTuBpkyGyai6ayDd
	THPqtJfQxsHOeVWMJ0sV5Ce+zlRb8MVEhhSH/OV0tf30/MF7V94MyP5Af83c1+FS
	aa2QObsgCrPSzCbgNu87Im+/v/+vYSdV2BmC2UhjuDwgGxRQfd7LS9zj5KfaASLr
	z2L1GDM/86mecLZlq2vdx95ch4EQ26+vm3wKAtyvXzKP5pPkrs0nBWe4lAjtmbE0
	tS59IRGqOAraIPU+lRJ0v6vjuHPEsvptuve9ivAbDkE9fRXT4icB5rtEN2yMxwhN
	YbKlmj0OtL2DxeJAMe3jktToLzexdkmadYe947dLh8PXBeloaFGXGdzNBuFwxDAs
	qXj4MA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6ma8bky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:42:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b63b9665so499381c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595369; x=1795200169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
        b=KFSJb+adaBJLJvzeG0seYunchIK+4lfE8ey78mCZ4etUdARkzmN6Q6Qod+2915lf1T
         3d4NQ/k8SlrXM9FFBV2oUNtbUNlTRy297p1SX5ZEjWfs3y2Q9/XWzZhTpoK5G6TM9MEF
         pNE8yxlF91g7luQ+3w5C0PPvoI7So4ZYay4sjQwh6OP4vvKTdIC3sCdCt2qrX7/XcR/z
         L8jP82Jy0qbXuV1MLqHw9ORtljoCzaVS4qzoZMhHR8Yed7/9EJe9MpqA1n/jygQHZkX+
         24B0Kht/B6R7An3+3rY7CF1B+8XPnP1MT36A90jBgwtu3yQZE0TVe9Tbbzkq0I4hUO/l
         rF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595369; x=1795200169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
        b=1/ptKVEytntF3mqBt7h43nSr2Av+ql0GG+clwc29537qe8u598/loqlzOmRh2AtgSr
         49fbgLtjr5Xf4ryuxVDqIvGMRWY5ib0NfZUulbNs+WVv1c1n+5+OYCleXpfxgE68Q3sz
         CNcxJtkzDC7WNzt7DmPeTOPqFcA7WGMWiDDE6XyAXQ5SuVSldzdjh/140HaOnKnv7vdQ
         7Y5UojtQF8tNGgnuHMaUCSqSBgt+kGt+NISXp6rIuwurkxJdavGyjh+tE1dXajQnbDHy
         ilZnRfe5XwCDPHqNpc0Li4RJQA4Yiix5l2mU6Bb66XCd0VzjrJ/NKV6lP6j1jxg1kn9t
         JwNQ==
X-Forwarded-Encrypted: i=1; AL+hErFqBSe7dFOhDzFwFm+gH1wxnG43Ba35sA/JcInf13js9r6cJ8kGYJDtdvxccj4TzZzfXzZqwgDwXRtq4Og=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j1WupNLLNWzZdOcn4izkARwvXCnS/6/KqDmDEJAxPInRtYQ94
	IWeTcwzImegzO0DAUurzvCwAsUKvHsY43SWwJMx2trLsm6q2Q7qA9VQtB5RwWRFuOCB9Bux5cyW
	LiyMUBMgKvP6nSEyt96r0xpziuxcbrVhT2TE1liHQd1HbBfjfQAlqHZ0AjGPm0wUF9lg3zSMPlr
	tYOA==
X-Gm-Gg: AYBFou0TTnqtF74dZ4u5GErDjlxjWHF0VYFGN5yFEIbT4YAoHniCzjELxVnAiC6piqt
	a+F15rmJOlMGaregqiOWkZLV/6TH+KJgV/uUqCqjkiDT4ykO8Z4ssKumgCfQx8SBiHEGRJHaIzj
	M0TTSt0v5787moSJ1LgWZvSRubXDp8jLy3heByKkEogWW+N8WRDd2s1zOwpt0t+EejgNrXSUpsQ
	Ht0DuvOclJ/9r4LhVLzomnhhTwneJUBtC6zcEkaBsD+M9K8zsX8Sh/UkBQGO1Dq16/US7pKBPVL
	E5sqUJs6PZ4jOhC6hlJ1/wJoaxX4ILr3LYBQRVEuIZtzOSfQqR+Km9Hnsg0HRRHTRwuUuGIvd4N
	aRs5qFpnxYe+6oG58Bc82b7xoz1O8Jod9pGTk9CY4XfIdx0EQMGUcg/x8ki0fXkrBwU9s/fo0C+
	WCNvpS2jNyhPp8ygftbBjkUHg=
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2812415c88.27.1794595369090;
        Fri, 13 Nov 2026 10:42:49 -0800 (PST)
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2812394c88.27.1794595368577;
        Fri, 13 Nov 2026 10:42:48 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm6327679c88.10.2026.11.13.10.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:42:48 -0800 (PST)
Message-ID: <826c1746-137b-4a5a-968e-8e0449a25e78@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:42:46 -0700
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
Subject: Re: [PATCH] bus: mhi: host: Only expose controller sysfs attributes
 on the controller device
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org, bbhatt@codeaurora.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111115659.11943-1-slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261111115659.11943-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0PMfb8odS6D5Dbm4TNxPL1TZgSiYYmZQ
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af75a2a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=48XoENhhM4yzJEw9bqUA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfXzEYxD15EHzxG
 WxNGJqCPuxMnABB4WXLr3xuTADrjh73COyED2M+qNM2fIrUL8sWdQ8iXU0E4bIFroMz4TyxijGK
 L+oEWtuKUuWx8VUbk+/58dxkzIHC5cRP+HoGZs5vrkyo/VOff1UV2UNvyY3I8/PG9ffLc1rS3eJ
 i8D3Ny9FQAmPolVbJrjYyYIjmFdzdGwMNjH1IfVP2jxnilpP2tA3SQ/6gZkrPP0Eby04hh0lKZw
 QUesGf/5qK6ZBZMlSfaNH1bbHQc39UNmgQ/h77Z3UpUbOk8Goz2kdGnWYpc9p+s51XML1gY42vB
 2uH1OTS/3IDQnohqABtI1hlwSg7v7Qz5ocqHzArktONOF+9jqYH4Sfrq19TVzPhn+CcZf3B1MJv
 uvhFBVeMgD7w99Fb1+tNZQGT/nAZSz4Q1dANCV3rnn1mHcruUFydKtcEfscgj1BJqmFYpRJWLa/
 ThoqQ7pmTYrQoU4qOtA==
X-Proofpoint-ORIG-GUID: 0PMfb8odS6D5Dbm4TNxPL1TZgSiYYmZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfXwnhU52Pw6lqw
 CpXJ8g5W82AXAeH5tTrg/uAbVLip9L1jS4keEZJPUUPvUy5HWmSCweWs7KqdMKlhiAw5So9yBJx
 wx0tfb10gvBHHkjVKDgCyxMUCdwEqaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074

On 11/11/2026 4:56 AM, Slark Xiao wrote:
> The serial_number, oem_pk_hash and soc_reset attributes are registered
> through mhi_bus_type.dev_groups, so the driver core creates them for
> every device on the MHI bus.  MHI client devices (the per-channel
> devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
> each of them ends up with its own copies of these files even though
> they all operate on the same mhi_controller:
> 
>    $ ls /sys/bus/mhi/devices/mhi0_DUN/
>    driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent
> 
> This is wrong for several reasons:
> 
>    - The attributes describe the controller, not the channel.  Their
>      callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
>      or issue a controller-wide SoC reset, so writing soc_reset through
>      mhi0_DUN resets the whole device while looking like a per-channel
>      operation.
>    - oem_pk_hash reports failures with dev_err(dev, ...), so a single
>      failing controller produces one log line per registered channel
>      device instead of one.
>    - Userspace has no way to tell which copy is authoritative.
> 
> Move the attributes off the bus and attach them to the controller
> device only.  mhi_register_controller() now installs the group via
> mhi_dev->dev.groups before device_add(), while the channel devices
> created by mhi_create_devices() are left untouched.  No functional
> change for the controller device; the files stay at the paths listed
> in Documentation/ABI/stable/sysfs-bus-mhi.
> 
> Note that trigger_edl was already handled this way, through an explicit
> sysfs_create_file() on the controller kobject, which is why it never
> appeared on the channel devices.
I agree with the rationale, but this does appear to change uAPI. Are you 
sure no one is using these on the channel devices?

-Jeff
