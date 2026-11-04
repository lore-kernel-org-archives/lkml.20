Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795406;
	b=z0AYXvgFgW1dxeT+YxP8ebMSMEyKq7rRI4LOTSzewt9NmgTNYyWl7zK5YmIptl1w5GNF
	 u/8jZy7duE9nzNu7M0VRbNMSkQ2zlMehKALLNhygoYrl2GPsUtuzPh0y7XEcYQl2LjPB3
	 b1ysXGLvOHoXnueSljAFFPSjIeRHQll9e5SoBdvH+0wOPnjydON1YCHff9QbeUuvH0SKg
	 te2vkHyrY/qB1+SQyjkuLQqOH3G5JUBWfAg7SQpixjkXju/jQXdt7a34Z1Ybsd+EF38sF
	 Udm8xhxzrLXNaKVFMUxAdA9z0Gcv+tKp33VrfnT4FU37UcLie23Lsklu7ZS89CfdGmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
	b=5BWxKNYFdtMDDwIxC5kv5x6EnAEwMoYn4JwQQAvcLcF5PaVJosr7lfuoCt9o/Z93M9B/
	 u80K8tZyyfyX5YfN2ASxs5KJNirzFwIp8YvC4ffnIOzpGxsT9ARsz3nfDk4tON29neJ0g
	 DZHKTmvh9xL/a8Gd+hGc7V83wABel4EdtG+cr2S1jul+UtgUBlGJmHmlxy8xQDUnm/Hzk
	 Uh6Eec730VUxYehLEa9/HUq1DV8xl7JxsODNkYoFBWENgsxBPh/j9/7zg46aOi+0ZD/bs
	 3kuPxoUfENjzlcsTUdVeJfsxHgulIcY6R6dWgj1/INAJb8h2cWe2lUsJy4EZZFnMLSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/gvVvAi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmLH9o7D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C2F606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/gvVvAi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmLH9o7D
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvuj119388
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=; b=h/gvVvAi6eAZK15C
	MLNXzeqgMsnkuBrkhrUbffgcVRYn6KMDV61wc4WoLZ4MDmhEFmeI56Re3fM/2KCS
	a/+ywz3R/Svb6BxVl9E21ZTPBvyio77QMEABtmn7n6WruVf8gQQ8fWvDF5SX2tU+
	XJEXQ5JvixttG9bieUVHoGkiN+US/XQSFskO3vM3eSe5GhFlxZXwIUQDTtuWm4iX
	yK4ey3jfowr9yxNcl+EBGjftHiMX0fBmfhqxXuNcha8pMrVhnprahllUQNei/ato
	HlINbkSDh1LmqD+1+q6aC7T2t/Wu8F1Tz8bbcz/uWereBiREB6RIkYNUfwhlDqNh
	ZVMaog==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0a0a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:30:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-999e34e2b39so263241.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795404; x=1794400204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=AmLH9o7Dug/NxxS/wAXjHeyi7VXjb8eCXyCh47ad0QWVgwxC5WBzWLpUu32H+YqZLB
         vFYTG3sBWUxwkqsvrJbS6/rrJWXHk3T17RuGbcSsqwmaTi/wwDAxdCxExEjOIxT4m1uA
         EQaN1zpHNg3/AG8FzE92mb3IavgJgzp1gnIwaE3rIAcD8vDranIMh68CFq3NcCc8T1HJ
         HF4u4KKYgGvOWFNZFj6IqlKTWUafS6yTiWNPYq2C66r7//AHPPnzNOtXbja/E+1TqD7I
         YwiYcg28dHkZ3PI7Bi9B3fUMREROGU8Z6qSwWLGShk+76UmTgauhGJcDJueZC6f4PYUL
         um2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795404; x=1794400204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=CY4rAMQHyzvHTX6qj0DfOIUFG6DY+ly61UFyOBrfh5T2upiS8qEntIHk0aVq2Am6ve
         66Iu53ucrQy04/x/mi/M0CbKq2kAb6S6F9lc2O7I7KBTMPtv10ImzVVmoM8B3ajat2m3
         dYwIidx5xFJkoSq70r5L98bpRDOPPFVRSxc6IwkdFqNDsfCrxP72Fp9eY76XY3jej2Ze
         vG4TEdVs04nbw1YLzSyTzN9fF2JRfL0/33ch05SJn2XwvAbQM5y9lLf4jzsgsFqKDUK+
         coOL33rOWEwUlBycbIJQLp1lSix9hzAppzap52/Mp+zulc0vdaJEApMFQ8ScVrXXhkD3
         PzLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYO0hDOI8sg6eDv2CnbAtH7RJQokKoq8Bs/MuKXRwZEl0wqbRytxCZB76ms6Y78/05dKrVFfyspUE+5Fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o9IEc2bQJGqMBeVOZyO37RmlsRJqAaPLVnCGT9nw7wPfTFdrY
	SIut3BekreStnWXeVcVXyw2tno45ZDuNbGLYHjkZfxBdoC19OxY9x4OKP9ZjJLKFV34i5utI8yx
	EVMWeT/D6QLwMhxL9G2jmLQ6sh9sGxkLeLgbaUNbhFBSDyuOrXHU0HUNck2zSErntwwE=
X-Gm-Gg: AYBFou3ES/o9ocWFMjqcMzDqdlXBZiMxa90qsDBpGRQpaDO0ME+PVdVI4QLdcNOsSUI
	h2rGQXNnSs9XYaMrby0W7VRf0pWWnOuWTPvJYSifC8NPOrjY1fx8luyWo7+qbgmJJju264yp+q7
	FAzZs+cD7yiwD4hNkw9LS9q/PnDu2htKmDHsalAEhGB17NLDjqRUrT+M+zxvJAbZbUfKQ+lR0ye
	sHmkZEdI9TZg1tcbVgIC/7HUyY9cAMrVGxXYOxBZcL+Jq7GLACaM2f5VFDs3cxmPGXO4wqAY73+
	TAqA+MhxPUzQG/O96QjYPYfK3YCdplWC7ImrzILOkyzNbBINJvr9jFclUMSqRIIcBzPqvPCbhQG
	hY33yZV83R40j1r5kz0U5LTw3rh/Ne6POhY3U9w7CL7jp+6sH3uCbf8n/rQ+3IuzDhpwy
X-Received: by 2002:a05:6122:3677:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec68833514mr6056993e0c.3.1793795403923;
        Wed, 04 Nov 2026 04:30:03 -0800 (PST)
X-Received: by 2002:a05:6122:3677:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec68833514mr6056959e0c.3.1793795403413;
        Wed, 04 Nov 2026 04:30:03 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d3acsm62408966b.71.2026.11.04.04.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:30:02 -0800 (PST)
Message-ID: <cdbdf12e-3679-412c-9a66-f9497c5ce832@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:30:01 +0100
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
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: Convert subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104113358.1634256-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXwJ+4VYJD1Tez
 DjUznsiFm6nQo65n9H6VlBtHczASUe5VGBmYCCzbcexiuD8Z6lSk3Gp1m4M7T5NZZx+f74Y9qLV
 uhhN0m1v227I4LTtsZes7+kyqaAIMvg=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb254c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: r-IOWaBpeuNTMI2zinMr0xR4h6rtXRxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXwejun8mW0nvn
 ZEFIpAyjL7LCuj/BmUQgYMgXUs+Cc9uFbtWYK/a9BCDNeKm2YFHiv1jsY0r77XeTCWdru8NbPaW
 FHYoi2I9LYMkzIbSeDhbA+vxmqirr1QYhKIjRr8Y9NQKWlcqT3bVRpez9cWJjBf0bChgXPH5js9
 f9GWQITy6GvFSUljzquYrpQ0faGfALWydnXlx5l5aRU3V6frPrP6aw1oXv+rVgwO5udFFI/Pzjw
 c1PKda05By7QssryBsXa5Qwb4Vxfs5ywMoKc79XOcA4rEL1g8zjOKns3fG2FDjGVmdQS7zUcu9+
 zdkN8xHANQXIzIGAHE8GFlGoQ2WaGtIJVSIJ17Lh8mdLDQmaqFh2P9b7KB//hGRbvKgbYqvHm5L
 W0hSrd89/U8pD+FdUjXYYZDLXge/YNepLCgQaexu+cnVZpo6Q3DMAZl72CxhNV8UB1icPzzBuGp
 CWV3e6x+x9Ln912fd+A==
X-Proofpoint-ORIG-GUID: r-IOWaBpeuNTMI2zinMr0xR4h6rtXRxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On 11/4/26 12:33 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
