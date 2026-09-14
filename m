Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E644E038
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402608; cv=none; b=eKHvc2pyEa0Cq/GNq8BU1XIrG4u7ZNwqV24hsiPU/lMVDsFpO2BcL8nKBI16aTWSsR25B6j3EZsbeUpfU+kGFLrUi6HHqojANDUrC0VPGOo3Y67GyT7ziY935S/ha1dp4+ibPrO4VvVFjHvqpxodzGE6JXrwuw3Bd27fhqK0sFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402608; c=relaxed/simple;
	bh=s1Tnk0AuVXR6U8XH5iVHbw1LZkx41GsY7RfR5uUdpKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2mUuhb7KPqlnuweM4iHyFm5vZBrqUz6cPp7igUez9tQfODGnFtItP8j3cQNhNRCFwXn/KqxGR/nw27R2tPoVxiNK05n071UohtLCIQnAFtso4VbMqrt5K1Y8XEfN0XHCrqMqhbGQ9flwQ2Gh6NgvQB1ST2NwjYvlHE1WPhRklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BL7tvRv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4+Bupe1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BL7tvRv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4+Bupe1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0ZWk830765
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCqe0XzHDMtUy40xDqhXeEHj3hyeZLQemGcSFzEK3XI=; b=BL7tvRv7BxFqjuh1
	uxR5d3hXkFVbwoM9rL1QgKKNs1H9Q2d8pvYuqZJM5dFEDhvyQ5c1YCSUCuHXuhAJ
	6T6kY5IQwxTCRo9bKiOvi9qH9g70DvXyqgDRNq1JRwFhoPbqFcAJEXH8QwnA8wz/
	0WbS7utEJjIOt1dgzKcL94EPt1670PAdVTs+Ogr5YesIp/6h2ssH7s8phJxiTBki
	FFjyevydb7Mac3ClfIv3QZlx9sIAl8TQF8AA2Mc9+JdU68jd+58mxsyCJx4wN8U9
	gKqi3gbnNVumORPlQA5L8j+XV8nEN1wtOQNDCUY6stlxV6eOwJAHojZCYLjepWTg
	aBCcpw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsuc0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:16:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4bede5bf2so225641a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789402604; x=1790007404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCqe0XzHDMtUy40xDqhXeEHj3hyeZLQemGcSFzEK3XI=;
        b=B4+Bupe1caqO8eRe17G356IrT0UTUlcdqmumt7E91NDFUWnnGG4QXz7gc6BSbndT4x
         pdxsTjbOes+9s+nB+MSBX9g9SZryj2+PaFtsVgFNoetDTcwb+U9chYxHm6fDm5FVs9X6
         NrmmaEcUuwRZiVoOvaoKFUhFKRIILtSWs5wup1uWK64cYQJ+hnyDfPJ/QpUEPcSB02uN
         qq/x9x6oF7v6CmD3g1EDXLA/mB3Q10t5OaWi12OwrrsymHig7b0s1t7/XZIJXM2NDbeh
         z7SvvrwAedCwbBAWbshgvlP4kWVeHdjUb/hvRqZq9qsopyx0f6iP7RcHMwGuuAyyQ8ST
         6U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402604; x=1790007404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCqe0XzHDMtUy40xDqhXeEHj3hyeZLQemGcSFzEK3XI=;
        b=bTwA1z/ZoOCV7lwEW8/tu+2zLhx1JaMEneAqNy3r6V4uLad26QJiZykoTLa6HKz00H
         E1wzboAOTvwXtyF4+nAcHy3LZy4iJR0pofK/KLfCAG/LmsZRHJ0AOoIcOkKQH3iia04B
         9BUKZ2kDO5Ca6XwU4jK+QDvoy8pCojv9oO5nE8FwdHBJy5mbBw8/W2/dBQBoxR+T66Vr
         4QFT8ENazOPfr+TYwE1FzWXSnnpb4rmeO7+o07RVOyZz+zgrQ/kVcvlEit0cNSFlNxEE
         iw92opjVtBn7AfrrN4WETD8/jLjIB1JJJmvzs/66GmLYmaM/fG9Irl2BPZV0kG+N2iD9
         fjQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2QSUVUIleYlJzsWB5/0PFZZQTFDDj9OGzhpk4ciaE69Zihp02W91yi6aGpQRdCuTzy1tIPDx8J8wH8s4=@vger.kernel.org
X-Gm-Message-State: AFuF++kOWpuWxDZxqHCPLU/ofbEoZ2XcuLrdleZkKjI7YPhnjP6LptgQ
	ndi3djYwJX5PJ7hRTSciDBAnVXK/CU5yIGdnTpWUtmLYV77Dj/u74rZN9COEXAIp5BGcr9rJKDT
	FmsjHYPTQcL7Gb8HZvjsgenfexB8iZoZK/eiTnHnMZKtIBH1p5liB82v43lX4Sx51quo=
X-Gm-Gg: AYBFou3M8vfaM1yxUoXIm4yUvFzR5DWfTtemnMbsVteGqbFqTfIsaJ3LkeAae5U2jGK
	TmpyQr+hRT8Wd3XPbd63TYgDkWvHFBdIjAzZzpthCZ4ch8/fr3gvu1BIEGARol+TITCF95ZCPFG
	dyTETIqO596RLw9wX9l/YWxlMddfGYnhyXNYvlVBAj9Cs661KtaoxgyEQ2v6zs4ZEQD9nLPtrcV
	XU5Q/mg7v3WsyesTDAtQgVjC9i24e5DpDO+VOpwFCGDBXbVBWQXV8oE2OULqzKeNhOInlIGF1A6
	M+jDqvcWa22do74ISITvEZ5/h2ZuuepRXdMj6/HlfFCxsqXoiFr79yWf6fTx1mSNDvjf/Iaz296
	MltD9c9t599gVwgYR0/YabHvNkqqC66v8w17dW5iaEoxokZ80y/E9rXl9+ct3jiyoKw==
X-Received: by 2002:a05:6a20:2451:b0:3d1:1b5f:d802 with SMTP id adf61e73a8af0-3db400036d2mr4716406637.0.1789402604386;
        Mon, 14 Sep 2026 09:16:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:2451:b0:3d1:1b5f:d802 with SMTP id adf61e73a8af0-3db400036d2mr4716373637.0.1789402603878;
        Mon, 14 Sep 2026 09:16:43 -0700 (PDT)
Received: from [10.249.18.74] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4f712a817sm1292816a12.2.2026.09.14.09.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:16:43 -0700 (PDT)
Message-ID: <2e989526-983e-4056-87da-7aad0f79fc98@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 00:16:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Bluetooth: coredump: Fix btmon heap-buffer-overflow
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Manish Mandlik <mmandlik@google.com>, Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com>
 <20260913-misc_fix-v1-2-558c1e4028b9@oss.qualcomm.com>
 <CABBYNZJpwkbFB8E4uHu4AcHjtR8R0CKnhj0Zesf1umoLyiqecQ@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CABBYNZJpwkbFB8E4uHu4AcHjtR8R0CKnhj0Zesf1umoLyiqecQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIzMiBTYWx0ZWRfX/jugSFcKBgD+
 amwoHMbIzUvHWjxMRs4bNxg3HwkP6X1ynbA7lxDnpkRt3tUKi40JbooCPyC0H1XHk7EkYla8Qe3
 ryXcX92gXAcF5zhDXHewyM77S9C7sSSkFFKkzdSdRv8NV7r3kn3fBkzIAErMYVHxZz+fFkRabZp
 DzVdSpYBbit2B9I2Y6/ZSzTniW3lYGNa3tUwq2BSvrEAJKyv96q7Purwsd1vlGZm1cwlcfo58kG
 drdPq5v3t9i0nh+g9jPX1QOU4rFPs+MmKpEMhGRIAYFWZ1moGOLWgkUKKdgjWXSsjbKIufznsaT
 Gk6VZLO5wEMpVe/fgRAQ66iJXw1gEiFdCWdCOyFJGsIbFugcZy0ZDTFahTvRfZbaPEPqNFVBKbL
 ro2THiUf56m2ifk3/YEDzBJmgNcG9j+N0qb0CzYQ+GNerpFFFFYSfvRpdXqWEq5XD2IO0tUOvxP
 6s1W3GzYUDn+PzzIRiQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa81ded cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P7WIEfRXt6mtrGuOy4wA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Xs_7wjEp00Cd_jNFi1SWNS_Ufh9AxfNq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIzMiBTYWx0ZWRfX3gDIAxia0u6Y
 Ok9vGbs7YnNYkaPoLpS6sadJBksJr+PVBSSw9C8hho7xYUOofgwhqK69SRCNcoP0jRkqAB+h9QA
 eNo49xzDPCYj1aZrbtl/WSs1yZy4NfU=
X-Proofpoint-ORIG-GUID: Xs_7wjEp00Cd_jNFi1SWNS_Ufh9AxfNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140232

On 9/14/2026 10:05 PM, Luiz Augusto von Dentz wrote:
>> Issue:
>> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x51b00000065c at pc 0x7f50b987a029 bp 0x7ffde88dc8d0 sp 0x7ffde88dc088
>> READ of size 17916 at 0x51b00000065c thread T0
>>     #0 0x7f50b987a028 in write ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:1096
>>     #1 0x5b4f3443ae3a in btsnoop_write ../src/shared/btsnoop.c:289
>>     #2 0x5b4f3429cbf0 in data_callback ../monitor/control.c:969
>>     #3 0x5b4f3444fa9d in mainloop_run ../src/shared/mainloop.c:104
>>     #4 0x5b4f34451da6 in mainloop_run_with_signal ../src/shared/mainloop-notify.c:196
>>     #5 0x5b4f342953fc in main ../monitor/main.c:303
>>     #6 0x7f50b8c2a1c9 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
>>     #7 0x7f50b8c2a28a in __libc_start_main_impl ../csu/libc-start.c:360
>>     #8 0x5b4f34295ed4 in _start (/usr/bin/btmon+0x29fed4) (BuildId: b41caafb24db693946c283eaea48112186863d2d)
> This probably needs to be fixed in btmon if it attempts to read past
> the buffer size. Also, since it now supports vendor packets that may

Agree, will fix on the btmon side.

> not be limited by HCI packet size, perhaps we should allocate based on
> the channel MTU which probably needs per-vendor configuration to allow
> collecting its vendor packets.

This issue has nothing to do with HCI_VENDOR_PKT (0xff).
This problem has likely existed for a long time across almost every vendor's devcoredump since controller's RAM size almost >= 1490
The root cause is that devcoredump data accumulated from MANY MANY packets is being sent as a SINGLE DIAG packet to monitor channel.

