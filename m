Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613554;
	b=KPbEDCqktblb8ttFSeGbm5I0mXnwNvGqqyDmZSpI9vjlcskiF8wOU53amlBDPirGFgHS
	 oI08wZmX8OIV/tjZYMipptvT3ilAIU8yZWB6duD4g/csWGywvzPcaURKgr+L+oo058R1D
	 nuxdzAo1fvI7UdwvSh/N/kbgQccPOad9R8qOqZ0cVFjMwyPaNzfcxGeLEfDtfGzWbtBIK
	 G2jtoeOGvEQ1T/HjnVa+c/9+TA6y3d+PkYo/mulPuiqdSxGJ9Tm8zQRXWAALycNDEJpYf
	 iI0EYHEVHdTyWBDAxmx7bK/320Kc+RV1dDZiGPxoTCBLrKgPnwraTLumE/mSLQjgk0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DvLqP/tFCRw+lDS6WYFmF22WIsggD1RJMNZO7NQX0Jc=;
	b=ZU1yyApaFte/oXTNLiRgufwZoSuBLwwjcWjCRcvELO/1wS21Mb/rgp3jNkTHL1KdgCTR
	 F1GBBmKmahvB+dXcMN75jjU47jFTueXFOO/+5xO+LYs6/R9SyVlO7NoffBEe5qLi+fGzK
	 MoW2gQI6Jw96TX9haME0ZygDRG1EaY9kta+exiIVqTl/jeXnLT9fz9dXMo0DEU9LUjiqg
	 7HtboVEFULtVrWxsE1Kx8kRo1GidU91MJEB8pFiCPtYsEgsD98Rq4N3b1jc5P2/SAlnHr
	 7ZE++c/QLzQXIT4mvwNU3cqJnxTl5+Al7ipDxBFzvDPM/JWybMyMZgNzl4S3jlU3ECw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctdHG2pg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHzd1pG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8448606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8448606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctdHG2pg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHzd1pG2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOuQ3086531
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DvLqP/tFCRw+lDS6WYFmF22W
	IsggD1RJMNZO7NQX0Jc=; b=ctdHG2pgkaQCYWdXQm7JOTj2bSHBkT/Kdf70Gzfw
	vfeGb1ztNVIX+f+hBwpNXGc732fuW673AIMV72by+Z1LoNgJgIx1M3ZdiIbGv+zQ
	9y19vQJ+VpPpsw4/14hqmAMg1vyr6kcg1JarJZWCUVn6e3qUAcg027GTqosZ6889
	d1ew500EPfPPzuqftIbOjo770OdBMtD3Ql/r76k09+LlI7MReICFflm++aLQXPDp
	BUN/ksGQb3w0oVzm0BdunQF3DZzA5KHiL2WBqvtCllJ7xAGQ2h6qoBmjVjj5r/ks
	JWgJ1HV5HM0NyP8jKo53WpIKgv0xKcIMyc8SF3VObcBuaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka617w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:59:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so459363585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613552; x=1794218352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvLqP/tFCRw+lDS6WYFmF22WIsggD1RJMNZO7NQX0Jc=;
        b=kHzd1pG2eqtms50mvSIRtxABHbW6bbKsrPDc2Mbx5dlY/5dZNRjnn9p/pTbVju2Xjn
         vo13Ne/9kBdNKi1i+6Gq+NvC7suqZoNR2FCbCkK7c1kxM+jkj0MKfzHEhIG/m6YP4iKi
         oD9mdavN0bUf7nmQHSla+W/KIc6GeJrLrs6l4Z1zUOgR8Z/9oDzHN4ZHJz3UgIbQ2c2k
         pfI6hPcKpZvtnta4XZuvp6fu2HUxf8s+Zu3JXmsmQcgSjrbACDBkGDx1l73vqlvwOpv2
         wUTs5edpeVMamCt0qXZnVDv1a/Qw4aPX8mrrj5RzJ88M0AnkBQjGEh4tOb0mZ6hpaGXI
         xklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613552; x=1794218352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvLqP/tFCRw+lDS6WYFmF22WIsggD1RJMNZO7NQX0Jc=;
        b=PfGqPhp7yIsG/7lRnA843oSMj0PdnLYCNBqceyB+vDhSgmFh1dabYga9s9eb7Z2Ge6
         juGYeg2m1lTW8SROt8tRX7I0iC/ddFbMBFdE6VYDIqKo8VNcxqQy90zD/lDiqn1JDSSp
         QkOzeLFhttdq3qFQvMGgWfMlgmZdBA+V7APPJGkpdlDB9NTEl7GQIYtrafR2zKv2wkQU
         lA0iqsAZ83CrFxxJQV58jRGmw9U1ipXz7K5K472W1bHxFTd0LqiYFKy2fj+nRQDlpUsw
         e8KMJSE7lSQoMYLLQwxWEHMhRYM6Qcyj6RWbUxeIKKWVnuIYBdiJPQczWsLe7BfMqQBm
         x/9A==
X-Forwarded-Encrypted: i=1; AKwUvBx6my58DU74+m//yyod4D/0Du7uqTrLTCGe9mSydoAb35cdomcWR08CNuu5mHaEz4n05vrCA/ggNSyc5L4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBOyJNRV5iCmVwnZBiZjYK848RhFb6dj44XvRGusot7n8oEl9x
	0oMAgLVdk3F3CJk0Q2PNNAOCs5BxKsunuqZmvkbAjWYnYNfafZm3GfkP8z5hHYPcR8EewfLgoeh
	6VlTFbGuKZk98+B6CqZ8a2qLXGmAeuTm6gQ43Ij4ntRuMj2lPvN400oEsKyzoWqpnbp4=
X-Gm-Gg: AYBFou303/jJP35iYqFyiwQbPvSUY1BUUBE3L8lD6m9zp6mqKHRd/Rqb/wLlFZaraSh
	4yF9y1mGHjNkTHbcYDIVR+puiEcRKLdrrGvcRkHNj5NOT1zwP5x2MZ3j2glaomRC7Mdau3iG7yv
	J5ERnt2lRXzZey/VwxMc5g2+1g2PVsLedGYFf42ci68O9Rj7R2Ag1QUm5LJUDyJaPj+o7InfAXi
	6iO66sJCRSs+upkuFey1OE9mohhp8kS3VPP9RnYLEzfv6X+8SL2W7nEwN3+QZq9ib58nB6q1QZi
	nmDv4GhE06Dc9WCl5WWmvSU8jjdMeh3i+rsnw3ZjiJ3glTDKY9FLu3GTqPBBYGxfDul2RwsP5mw
	5C1ms+XtgIo+8OaUetNVQFhkyGjdMkbJc+PnbYyRXtFSxoB7Ey2cJd4gojjfxqY6LVTg3JLGr5+
	iDYbtJT8Vulcm81I7ftsv8dvBEIoD1NL792NPDId4vfMA63I1PpBT1OJuPTlln
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id af79cd13be357-944217cece5mr1518816185a.69.1793613551867;
        Mon, 02 Nov 2026 01:59:11 -0800 (PST)
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id af79cd13be357-944217cece5mr1518813585a.69.1793613551287;
        Mon, 02 Nov 2026 01:59:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07551e2sm1516515e87.84.2026.11.02.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:59:09 -0800 (PST)
Date: Mon, 2 Nov 2026 11:59:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, chejiang@qti.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        stable@vger.kernel.org, Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Subject: Re: [PATCH v1] power: sequencing: qcom-wcn: increase WCN7850
 power-up delay
Message-ID: <6n7g6tamgj4q6k4sslwllqnidobapv7groh3tqc73lmzj2xw6y@e6ya2ozqa3pc>
References: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WI_rI773Xt_DdEnzCLIMmcFnV2sZ4orU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX+tLtwluVytsE
 1iRRnOY1VD75MYrKYC8o2mdu/2HXGBV0lL6Fh4ovPITGyGmEH+ijGN2Jj5xv7205VJilpkgxZ3k
 mOW7IVfPIovyGjseeb4sNYVoToQzKgI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85ef0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=H8z_xw01dn0BF6GSKEAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX+CjYdJuO5G95
 sIFUBPLJduTs5KATZJi7I9IZmCuedOZs6ksUcJUI8XNYXyDvpFcIuLmJhjJpMR0CeXRRcWD0u7b
 LvV8rP8xMykhwnOLnLbEj8lypDBWqeQ4CT+WSGokthl0eENGrL+JHAte1T3h4/D4vnQVUiKfcFN
 Z0F8W7MCg0NeJAo1KxrxpfnAS/tzZDtzJDnJHnndvOHklKlx1thR+LXqoawHi6jOJj7Z4I2lImU
 pbrEqiD93u9a9PwqeaGJVgnhwHwq+AwyBsq1Kh9XHf4JR2A+p9vssw6AUJ4hGO45y0VYZQItwL/
 bj3Jg2DRGnRq8Ghk3eMAOOSy6tPc2CUxt98ekUgGdttJLK9abJBZlHQoufjtc/O83RRGVJM1N5C
 +Kf/EtDL2PYaz4x9r0Ye662Vx/AZdBRrmv06WwmwnRTF/GNwVihyZzo80KdTj9mR1rBmTnxmq+z
 7HvNcZOHPbGVH42o3WA==
X-Proofpoint-GUID: WI_rI773Xt_DdEnzCLIMmcFnV2sZ4orU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020039

On Mon, Nov 02, 2026 at 05:48:00PM +0800, Shuai Zhang wrote:
> When the WCN7850 is powered up from the Bluetooth side first, i.e.
> BT_EN is asserted while WLAN_EN is still low, the chip starts from a
> cold state and is not ready to accept the first HCI command 50 ms after
> BT_EN goes high. The first command (0xfc00, read QCA version) is lost,
> hci_qca does not resend it and fails after the 2 s command timeout:
> 
>   Bluetooth: hci0: Reading QCA version information failed (-110)
> 
> When WLAN is powered first, 50 ms is sufficient, so the failure only
> shows up in the BT-first ordering. Measured on the affected board by
> which enable pin rose first:
> 
>   pwup_delay_ms   BT-first boots   with -110
>   50              9                9
>   75              23               0
>   100             21               0
>   300             20               0
> 
> Raise the power-up delay of WCN7850 to 100 ms. The delay is shared by
> the Bluetooth and WLAN targets, so WLAN power-up also waits 50 ms
> longer.
> 
> Fixes: 2f1630f437df ("power: pwrseq: add a driver for the PMU module on the QCom WCN chipsets")
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
