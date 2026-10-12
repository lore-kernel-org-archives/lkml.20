Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E13A1691
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801839; cv=none; b=kAg0FbTCXiWIDoFFFb3d+VkQa2pZV8oiakt6IyNaZCbe3IHLTeL7yBsazHbMTvXLy5nXbXHQS0Kw0RGEtCF1oWHHpHnGk4DP9WgA+71UZChn6Bi86ZIoq/m95kdISg1rKwxxA5IXtJm7+ru44LNS6lwJqtZArzxaWd21CENVBV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801839; c=relaxed/simple;
	bh=BNdsjpIcrl2SvMv2g05d3FRuaOWoOiHQZm5siBmAQPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1S1V3UAZuKhNVNhpYB8MoG10N3k+lVcntZ04iUxbpAysscRBFSrKYQFVCw98qqUD+D91M0RIoexFxx/JeMXYK2OyT0k05nmeRbKZhpGVrKbrIm9NSGMtPu05R6ycXgN9L1V6995lhdelBPDFRjOXNaPo+OGz5hQ1484anvNAMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNLoHXUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8ooR6nV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNLoHXUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8ooR6nV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KmgC1439204
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dNk1oee1aO8oZn2gGB7+4wyF
	LBZMDyUH14s2FZUuI/I=; b=SNLoHXUTbWKSGXvlPd8V7i5MH2+YdLK/EVxUhfFO
	kPgXexU17bpswyHymlFb2GIMVMKhkxrcGIgebMRmii692mZclyxeJX0SgQQ3q8D+
	4whq/8SBv4zjGsx0/dGPHMOcj3i/+g79tQ7lPmGiiVjHqSyR7O2bIK1cdoxMMAUA
	nrSvx3RvAQwxuDardNiRfSsgR8P0LXzOUubCAcFg8tkX7pE0onh88sMuMZeEple0
	vIuXYQy4c9mPFNoFJamPceKv7PxOcPAbwmpcSe3Llw/eKG0ZWXCpFaI7Sqggb7Vk
	e3xnDBg5ZWr5+YM3uvBFX1V4Vesw6Y7a3XUsf76qIew0TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkhnja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:43:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e61a8eb087so33013355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791801836; x=1792406636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dNk1oee1aO8oZn2gGB7+4wyFLBZMDyUH14s2FZUuI/I=;
        b=i8ooR6nVS495+wuPSU5AnTLbDAlGSnXa1/p0unowW5EplHmpT6VjKPekW3kY+vybHA
         UsKb3QA+GHnTR+XwOlgwu19zF0iOYkvJGJvERgQrXpWuWx8+YS1mGBrZC/vDDa/Ur5ID
         7o7MGuYf2MUVU4R4QvvZw2Azv5Rveur5LSbHToznetDoaSLKKenUj8emFLO3X1EZI7le
         eV4jqIaWeUTI68rtB13Jj+11c+SidNlPqK8tzric1ajpnWeQz89W1CSsNKlpXxrK2BNC
         vGW+KEaWVwzTo+jGuaXl5Z4YmxB7CNpf4rFysL6szzJiZfq+9tRilOjA41vceYvNJW0T
         QR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801836; x=1792406636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNk1oee1aO8oZn2gGB7+4wyFLBZMDyUH14s2FZUuI/I=;
        b=tY/86Qv+tnFKn3fMA5yklUrK3zENZ0a+yr58wO/ew+yWr+UA8Yqi4c3Xjz/2bR+tu2
         rOC4rgImSB0O11IUZjKLgS8jaQwGi54Doe6A1a98wB18cYbUQtH9H4GFtnnKn+y8Z/3p
         WVEexYpuEbchEqRIMxAsuvJIdtMxGDFcNqh2+ehjR1q/56PMEyXl0uBF+K+J4fKajPqT
         SR4oCcSauReu8SP4jXgv+BJogKwigZdslGU62x3X8Rr4FZnwdqkDI9SLSP7Z1peizw/5
         1ZuHech5dMJpnQVh19L1tCm91Krz5OP63W4FezpZiJUzFuEaISN2AK4wd1FFjaKTohKo
         BVzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3xW/qmK/4apuzkCshd1T7ClIY9wDLOaaZ3cOkitoNFdsgiO7IIUCNNrlMFqGbAF9cz3YYs7navPr93u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN1Gd6IYUtzr0UjsO7JLjMGgKUqCyZcYsANA0KsLdvdgeXNxZS
	JG/vbTJlBSNCJ0tNV3mbEtzN9FEezL3bbZkwSGA9UwK7h6l5YmbN4aLqPz1mdep+Ov3QtLH4wZU
	ruFhMCCLtKEOKQDhpkWB1uOqcgIgJVMMcl7xhRO+TUBwFHQye8vGlgugpiukTB+vli34=
X-Gm-Gg: AYBFou1Hxg6gAvNnJ9RxZeoM2xgMXw6sSTWpj1py8hBZPRZJfHYDJUbnn0A9dB0virr
	w5biImQ1lgWAGfSegu5iYZhWNCuDWEUGH9GUtoR5NJ1Hd1stv801++h7EXkgSiiOvd+mVmPMZ/o
	okH0lnfa84fPeDsz7/04Zzk1h1dgAC0AIflkT1pO5cGUHCVQqUgn05C373l6g2R2EHlN2O8LVKI
	KBc8l+OA1xeyZMqWQ4el0Laoy21Z8FCBBtf+JVNyBlTKggmtZXodwmxP8zozscEh3jh0+WSobGP
	6+1ZCM5Vr4hffWhIStpoMdpCdhoXQUIc8wgXlvFU3hFqJh5bUmmqGJ3BCDk5QW9QZ6eB4vyi1Iz
	vNdmduh4prasvPFdgNrmsdMErADRb
X-Received: by 2002:a17:903:1d1:b0:2e6:2868:e57d with SMTP id d9443c01a7336-2e842f319b1mr86209435ad.49.1791801836298;
        Mon, 12 Oct 2026 03:43:56 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2e6:2868:e57d with SMTP id d9443c01a7336-2e842f319b1mr86209215ad.49.1791801835817;
        Mon, 12 Oct 2026 03:43:55 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8c6esm39841945ad.61.2026.10.12.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:43:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:50 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: sre@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: qcom_battmgr: report the USB type from
 USB_ADAP_TYPE
Message-ID: <ifk6e5oefouaw52ms6rngezuvazbdoagak7sxpziwazifwvwdt@lonlpjntuq7y>
References: <20261007123932.1664-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007123932.1664-1-26rote@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfXzSm22XxkQNGN
 QonyPU2MhJiLjgUmQiYeDljPt4QYPmEQ/2OcIMSpg4a5CbRy5B+DdPebumw/T6kk7kATmbfPvci
 nGewtx2fZUfYdMWIa4PpU1gV2vy7WW18ABdaudjkWabHqteaAadOVk9IeoMVriwmYJhqIESZtlo
 PKvhPVKRE3vcNdw8mqpSMRu1GmrBeRx4LtpQy1x2iYJkYbkTGtcEdktZ/jWfr3Z7CZ+uhWTtTl0
 TfHCqvVvnrVDKlIzwAPzJAEkCPGgTW2RDeqc1kHiEricvgpQVZgFyElfebXxflU+tkQe+I3TOlP
 odl86sWWH08HBrUo54UoNCocQghnjf5yJjROJ62ly57KQS2362/9oA2k7mOEPswitGoutz1c2zu
 C4fUu9BxtrPJDneKZwuezk5wLekus+fhmGDql5I7i+g5aOKu3ps2YV9z7mTKopU2bxB/OBP1urB
 aFzHyp0IW10EX+OUFrg==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accb9ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=sRrwSrtRdHjplqK8FsoA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfXx7JQPhjn1Qmj
 H6SAJV3fpgtjB5XElqfFbOAfdYtBXULXDH5+6GWStkyeEFa6CV20GrXoR+sCwW8nTQMM4IyJtfP
 0LnPP4TBY7LAsIdearSMWf5cmx82yJQ=
X-Proofpoint-ORIG-GUID: BBSdChuPkhSS5DCAsiGEyHZdtWLOjf_z
X-Proofpoint-GUID: BBSdChuPkhSS5DCAsiGEyHZdtWLOjf_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042

On Wed, Oct 07, 2026 at 09:39:32PM +0900, Joonhoe Kim wrote:
> On SM8350 and SM8550 class firmware the USB power supply reads its
> usb_type from the USB_TYPE property. On a Kaanapali (SM8850) tablet that
> property is 1 (SDP) whatever is plugged in, while USB_ADAP_TYPE reports
> the adapter, using the same numbering as POWER_SUPPLY_USB_TYPE_*:
> 
>   PC port                  USB_TYPE 1   USB_ADAP_TYPE 1 (SDP) USB-C dock, 5 V
>   PD       USB_TYPE 1   USB_ADAP_TYPE 6 (PD) 65 W PPS charger
>   USB_TYPE 1   USB_ADAP_TYPE 8 (PD_PPS)
> 
> Qualcomm's downstream qti_battery_charger driver also maps
> USB_ADAP_TYPE to POWER_SUPPLY_PROP_USB_TYPE.
> 
> Request USB_ADAP_TYPE for POWER_SUPPLY_PROP_USB_TYPE instead.
> 
> Tested on a Lenovo Legion Tab Y700 gen 5 (qcom,kaanapali-pmic-glink,
> which uses the SM8550 path). Only tested on this device; the SM8350
> variant shares the property map and was not tested.
> 
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Add fixes tag, with that i think it should be good to go.

Reviewed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

> --- The downstream qti_battery_charger in SM8350, SM8450, SM8550, SM8650 and
> SM7635 vendor kernels uses the same property ids, maps USB_ADAP_TYPE to
> POWER_SUPPLY_PROP_USB_TYPE and reads it on every USB change, so the firmware
> of this family should implement it. Like downstream, values outside the enum
> (QC chargers, 0x80 and up there) are passed through.
> 
> Not tested with a plain DCP or a QC charger. Once, when the USB gadget
> did not connect to the PC after plugging, USB_ADAP_TYPE read 4 (ACA)
> until the cable was plugged again; when the gadget connects, the PC
> port reads 1 (SDP).
> 
> Kamal Wadhwa's multi-port series makes the same switch for X1E80100
> (a new x1e80100_usb_prop_map) [1]; this patch is for the shared SM8350/
> SM8550 map, which that series leaves on USB_TYPE.
> 
> [1] https://lore.kernel.org/all/20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com/
> 
>  drivers/power/supply/qcom_battmgr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 7716eb9e1aff..b24860d2ded2 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -975,7 +975,7 @@ static const u8 sm8350_usb_prop_map[] = {
>  	[POWER_SUPPLY_PROP_CURRENT_NOW] = USB_CURR_NOW,
>  	[POWER_SUPPLY_PROP_CURRENT_MAX] = USB_CURR_MAX,
>  	[POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT] = USB_INPUT_CURR_LIMIT,
> -	[POWER_SUPPLY_PROP_USB_TYPE] = USB_TYPE,
> +	[POWER_SUPPLY_PROP_USB_TYPE] = USB_ADAP_TYPE,
>  };
>  
>  static int qcom_battmgr_usb_sm8350_update(struct qcom_battmgr *battmgr,
> @@ -1513,7 +1513,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>  		case USB_INPUT_CURR_LIMIT:
>  			battmgr->usb.current_limit = le32_to_cpu(resp->intval.value);
>  			break;
> -		case USB_TYPE:
> +		case USB_ADAP_TYPE:
>  			battmgr->usb.usb_type = le32_to_cpu(resp->intval.value);
>  			break;
>  		default:
> -- 
> 2.43.0
> 
