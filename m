Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946950;
	b=S2JRDjO1rxEQwFatiyAUGMA4BT5qh4w1UjsYU6aqGVGVKJ3xsWFvW/Rv9Bh61W1VSdoT
	 /74m7hbKjFYEuWjCINVdCWrMKu5mlMlp6/CjoHypCcdNbg43OBDfUXTUQOTnlWb7XhxWY
	 WH3Y4ch5BUSJUSZET9EygwtzL9OManonVqd0XMCBDRGfFs5NvOsQ35PCXVguhTHM5G/4i
	 RXkgGQuspMEzNXn6y5IeSH7NxihJgOr53liWKi2a/8pOzZeHzj2TDhOB1tj94bFKtzV6e
	 fOaxVbEQwd3qc8dr1G5pDph5xh+jktK0ZemkRKt6oGwBBFc2HqvYSBs4P7r/MmQqDYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=;
	b=J1RMiMcl5HbEcyIjQ3e3DH3Kz00C2B/IwjHnZO/X+aRqsjaJp3FPX2VG0ULE8m3v5Ef0
	 5B9mVGXbHbnx7Lzftrcq5L+Hz6qNKnkj4X29MI82ilesi91483GPDCTVl5H7OsnRnT9ix
	 iuESXk7VvszMzm5q7OzYMuISU0XwSSIrOf5yCoID+VoxSzzXSbNJSvLT3gA7stUGs4aK2
	 COvy/MQK/tVxmPREWeMKEAwYk0wR88cecqZktG9JahCbwo+tX5eoDxAa4PK4gC3Sk3VlM
	 mQ2JaMvrygZxtsq1HZnVEQRZcaocFNfg4hhYLpNPy0Np5aE1d/ZxVROI4T0GfUaeHTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gsAeyLH4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YO6cRFze;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5232C606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5232C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gsAeyLH4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YO6cRFze
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6403aN2780123
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 06:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=; b=gsAeyLH43045rcAh
	2/hFbqSuIuICOl92IQYvd/0DQZRJDqn0TeVKRDm9eVnQYXxjtE3xyTcSqgDFCz3R
	S455QSbL7DivsWLSuf1zrXtcTjFDSuDhwaSuReQJjLdgIxfhHK+sEfq0wtBs/xSm
	8XAjjClQUEkWBq8hC7avhaIKVpWA9yjPcvJ/81VS/B9sztQ0iBb716NcNqmXcZM+
	be//wcYJ/bG4I7idm/K9FriKTITnpm+Zz4Wb6GQB0t3RgeV6+/axtNtKkAuVc+r7
	frJSVn+hgcMAb6xI1JetNlCZJgn1CYpKBbq8PuFpb5Itrg0Rwbu4YZSTNG+muJKA
	LCQWjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1c2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:35:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eced5a4cb9so3307045ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793946948; x=1794551748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=;
        b=YO6cRFzeorDgOYsZEc0kIF5pDxse5ZSNIYTI7KEjWmS68WOy6h5sP/3Kuowhf257G4
         GfIHbp9dgcclCJjlkgS3l5Irf3CK9e9igFftEDcf8TtjxiCwQojU+GFcUJosGZzkVY9S
         l03MmAdg7jWQle58+mha0G87C04h+Yyngsz6FfjZuw7lwH/2HVJhh82BBYNAX9qpuBa9
         NNE3dmiD9loPyl8veg9v5DBmpDfJEGrr/KwIle5IotK4jH8KuHyfuM2/vAn9owh882Rs
         CFDV5YZoV6gNGVNuSWXmJnImxgX111i0Z4nWfQA7eJL4qBIJJxUs2kPJaVZDuUEE+WLs
         bbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946948; x=1794551748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=;
        b=aFyhm+APMl5780CZcqxzbznABXz6t9OFu9dKR5uXCQ5UG27SP5tz4cm8wAKbIFAfga
         O/qNPAMiDbREdrRHKXYQRxbEHpQzCCLKjJ3eZLaxYjBuA14JBwbSlRy4TZA2Iuw0VNe4
         emKu4SIJtbJ2sTPe+TTwbuyHwN6tWYtugYFL6JoyBYq8BAfhYqIQ9Vg0jETOqHgEFOtg
         gfJu7yzeLOEds8X5suYaWOe6pqKcoSQLwGzRDONnSwVYnN+skH0Hyag6BXKpGeciNGIX
         dkpediDfmqPD3jN6WV0Vo0MQZfWi4z9IASucYgD4+ch12oAU3uTnEE3KbRJVk3wxfxZW
         dRjg==
X-Forwarded-Encrypted: i=1; AL+hErGlW1hS2/HSqLpQiONscBXC8BKxnZ9HK0If7lULagjlVcHNpLgnDfuMlwu9uI2Q1tp7VJgj5oh0tFYvQs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GLrRFDR+uhKiDk4V789XHC+PfUlVAVjUJLSH/wqgd/LgXygAk
	1/27QayWTi29YoENPV0+nRtI5HBO5mNFmGDZ+HgenBYWLrXMLi76gFuIP28TvYYYXRiU3RUUQNe
	jDyaRRCg6ufR1nUyXrdo+4HrqZz8i/QbOLGUHRZyp9JRrc4HTc3yT0ZH+N0/tedt0+D8=
X-Gm-Gg: AYBFou3/ot96blEZzSoYWUS/V5wKlLcW9EfF4ZbptOtZGL1xXx/RlsJtpbpqBGjESIM
	/pSQxe7NbtTGdMU8VwHFdUFhmY3GDEewmb033lGy1o6wLwlmHDfPeIeko5ioWTZRB1dz1blJsWt
	LPOXUfj87/hkhgyABaJADhEw3bJABWkdUGhkhTxOaRwgTkohyCaywb8K+85KaK/Iz/AIPnkhzuj
	/vvRg9kHixw3xL0bZpvbiDsJl8G6I4XFId1dZO6Tt6GOoXegLZE6NplhqcTIJXp8H5Y8a4C3z/0
	FV8v4zaemuDB3ffD66KBJcqycqmdTAmQPUXV1V7+tu2qlN6BwRVlSeJFCjiykZcl4MNflcYeXYA
	4JzU/0wg6BSIoa48QVNJvo8tnpq5AIbl1SeCboZU9SW/gtv1/yWpoZBjbhw3Ej8YE2Z7i6VOO7g
	w=
X-Received: by 2002:a17:903:f8b:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ed40ad5971mr20472755ad.30.1793946947727;
        Thu, 05 Nov 2026 22:35:47 -0800 (PST)
X-Received: by 2002:a17:903:f8b:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ed40ad5971mr20472565ad.30.1793946947269;
        Thu, 05 Nov 2026 22:35:47 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d40998sm2193875ad.34.2026.11.05.22.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 22:35:46 -0800 (PST)
Message-ID: <561c0f8c-3252-4802-9d2c-ca1f93c65247@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 14:35:25 +0800
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
Subject: Re: [PATCH v3 0/2] Bluetooth: hci_qca: Reopen port after power on for
 QCA2066
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, chejiang@qti.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20261028111839.2148515-1-shuai.zhang@oss.qualcomm.com>
 <ygy2hd47c3tb4vr2joiiy4bbg7rd4pn66x3co7iifv65cvnrf7@g36i65agh6p3>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <ygy2hd47c3tb4vr2joiiy4bbg7rd4pn66x3co7iifv65cvnrf7@g36i65agh6p3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed7544 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=scBA0uvbmrWxsdo9N8MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNiBTYWx0ZWRfX8npkxa/VOmh+
 +aZo7YXkxUfyTMRioyWXn9hgQbWK5U8UbocUiYqys3SEnBGcTj/+Lm1VYMrwvvcuIbhD6xaCGhR
 Pu9NzmEoEjI1KJSx+GYqoqWmiugVggg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNiBTYWx0ZWRfX3iYKcG1CPlWs
 gKLa16eIoyaCixom6Nm8XV3VCy97D1c+KchSujLRmnU9U2h8rBUxUGyh5st7IuuZktR6ob+e5aM
 kkwmhWO3W3mIS6CN7NtGlYkcymY/Snp9fsfh0oLhY1U2GtOjM4R/rFrKN8WBGcbeTw8dduwBHlP
 5lg2RKJ8JyVSJImobnrmDL0pFUoMYW4ZMbKVcXFr0Rl/q5uWP7S67KE56BFSF2HVZeE9khpzc9o
 asJ4aL2eDDI1ysJyiE8O68qQQjEtUFSOrUEaQcqoUxuB2Jj8geXx5OIpImRjsmS9CvERJ+o9vAo
 kHVfjLnKVpVmghZKnuBdSeWxEiVaJNrwzgxf1DwLZsJDGJI3WWvLJx78b0QrKY6/rBk82+/n8RM
 U6Ziuy1JgEM4iMVApoG1qYSoiTamwYYSa7x3TXKSbNyUwZRnCgH+X8e5FYkcUJkpwdySuI3BN9v
 Rt2aNrGYTj8VTbPacOw==
X-Proofpoint-GUID: H2tT-R0bF1KzrWc4ccAF4iy8VSn4hzhe
X-Proofpoint-ORIG-GUID: H2tT-R0bF1KzrWc4ccAF4iy8VSn4hzhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060026

Hi Bartosz

On 10/30/2026 5:29 PM, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 07:18:37PM +0800, Shuai Zhang wrote:
>> QCA2066 needs the serial port reopened after the controller is powered
>> on, otherwise the host and the controller run into RTS/CTS
>> synchronization issues.
>>
>> Patch 1 reopens the port in qca_power_on() for QCA2066, as in v2.
>>
>> Patch 2 keeps HCI_UART_PROTO_READY in sync with the port state, so that a
>> port which failed to reopen is not closed or flushed again.
>>
>> Changes in v3:
>>   - Patch 1 is unchanged from v2.
>>   - Add patch 2. If serdev_device_open() fails during the reopen, the
>>     port stays closed but HCI_UART_PROTO_READY stays set, so the later
>>     serdev_device_close() and hci_uart_flush() use a closed port. Keep
>>     the flag in sync with the port state and skip the port flush when
>>     the port is not open.
>>   - Link to v2:
>>     https://lore.kernel.org/all/20261016022302.4003647-1-shuai.zhang@oss.qualcomm.com/
>>
>> Changes in v2:
>>   - Use a separate case for clearer logic.
>>   - Link to v1:
>>     https://lore.kernel.org/all/20261015092224.262158-1-shuai.zhang@oss.qualcomm.com/
>>
>> Shuai Zhang (2):
>>    Bluetooth: hci_qca: Reopen port after power on for QCA2066
>>    Bluetooth: hci_qca: Don't use the serdev port after a failed reopen
>>
>>   drivers/bluetooth/hci_qca.c    | 46 +++++++++++++++++++++++++++++-----
>>   drivers/bluetooth/hci_serdev.c |  6 +++--
>>   2 files changed, 44 insertions(+), 8 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Just want to confirm if there's anything else I need to do before 
applying it.


Thanks,

Shuai


