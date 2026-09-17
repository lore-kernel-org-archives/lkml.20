Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8353A1D14
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614489; cv=none; b=ryUPNiWAbwq75eb73fGCkQqm/ONir7lm0hq1hpDWVrPuDBy8qCjcob7iCCiCKnEGhUJa6soTAF23dSmebAN7DI1khJkdmKtlfDfT+k6M8gFIcSsLEBGZLdPlmD6Xtfh/hJo6o48ryd9mRs1lRDNQxcinJG9B9m/Oqq7G0GkzpcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614489; c=relaxed/simple;
	bh=BFWJBTnLF1aE8X+tLyBABld1kYZc7ehMNU4s+4XJNu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4kUVkpeHSWn7nX12FpGC6j3GlR+25smjutOLBFFuYZIt4o+VQYZuTXTFwMEtOz4W1InAeZaygZ231BWUPi4tEyScxc0tFPBUXzNgQJKIBAOXjA3GmsJk3lbZim23CAuFfkJfceLG19IknJKP90M80Cxu1ll2TiPPzzYARRq2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGUyAhsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhYRd0NT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGUyAhsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhYRd0NT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0skR13402897
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=; b=XGUyAhsiSSf4ibJL
	HJ8s5IV447hEWu3UaG/napa2e7oeGY2/hn73H06enD1j6ojitvTEhejF2dW++lIj
	GxIiwVm07MLDhvwm45r1LAu0Fu5DP5BRIS4kwMSYEagMHrLLxZH7kELO6PqO70Ug
	gBCz4hCSi8f1YWLAXDKBYWrzF0pTLev9GCaocAu9TH14CT/+PlDIH92MXeaLm7N1
	ePVHzWCMN6vilRGoYrcPUT1RS5x52BfshIRNxNMVcMAMq9I4CKpd1WnqNjNRTPVx
	1tpjoQQwPUw63P932dObFXjSxKqybcBVBMrwIkOUnqW2G3kUysRL28EVG5H8NqC1
	2W5jVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d27na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:07:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so509697a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614474; x=1790219274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=;
        b=AhYRd0NTIH7oyVPBFXTkSA7EGe9O9QL9kopnn1H9vFbsFCxRTpulraWKNvsqF2dj71
         t5e0/gh9mTNzldCkOOY1pzbD5cWjzkge+WxLCmpPui/TfLp/FJhcApMrq8K2GTgtvu9H
         zxFUbgQTpSz83EOteY56qS3nV7Yoe9oavDc02KOWSd3Ccagu1bbP1GOpCWLVcJx2Fwpm
         1jtIlUIKM2Ub4zzZ6xraRpqEVoEEXu9gy7DTUIUwn+mPkioNK/a9JYVEj1/hMCPZH6O/
         O1kt+Lxi3VTlnNwIUsOJQ/5HNBAr7aM3oUTwVBb3K9/t6kr8lb3HloVq/rC8DpEzB/G8
         C0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614474; x=1790219274;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=;
        b=PsW7MgF5iQs5+IGdKjiHZAHJVByxOm8rUfWmZOH4Rvj+GJSaOWi9D8RrcmSmjiILj8
         c9Ixx4rZXZSNvMldYRxLj1NCxJSfzBxfSBmPHs4MsunnsJUSWlRWSLbemNkMIg4Pn01n
         QAmwuJ+561FB2pJcotwdCueV0TMYn3KaQ56gkllILAIN0auQOKiJVAjXifheSDG/SzOz
         wvU5hoNONWbtUhQUq980veqX2cyuC4ygI3zjsc6472fVtgdCQZXdQLvgdpUgli1gz674
         3tBstWQNZMWTalAZ3nn5BAO5OUPxDsOX6o9XFSNydyi0S5bf4Qy2C938gTFH2AR25J/H
         zZJg==
X-Forwarded-Encrypted: i=1; AKwUvBwNPrO7QswqvalhwWa5Bf3/SL5AifI8G1K0qxiJ32A+P0447k1P1IgknFXMIrUDLiNDrY5b4OLlLNS7IGE=@vger.kernel.org
X-Gm-Message-State: AFuF++nTR+WZLOcgnvJrmZFPBdPqwPoqrlTl9x42d8YiEFtf6To7Vq5c
	trdDKw7xQMJ8JxHulwIN7Wpzx6ou1TN4oeEHPNjGJf2a+0a6NCmM0E29x6imJ3NDAvxlzivV9ud
	JKrVsHAOfE2NGjtjwdkeVx+stUU79o6QlahENbYIcJ1W6Us0o23KT2D6aLKn8gT7No5k=
X-Gm-Gg: AYBFou2/vxVN6I+moeRRyxtRUDUcZi4KKbXHYKlNGw3vsAdHcfdMJrozmYLjI5ugrFz
	6Mboh7rHnlh1BdZUvgoubIKbQ48wNBoiRMyHE1wuJkpaST5k+F+SEIvX1Gc66ucnowt6vBt4Y2i
	UWMkNlyvnsEC8XVkKpty1K7zivMsqQlUHXoXJJ8IBInJc3wELo6E1LtLGIuGrp14+ArAOlzhGur
	CbbtLltRFxKk8FNCRASQw/5my145zT6HPQjhsjTFOAF31sqNjCAUctJLLKNZUlznLJa6ea+j7x6
	jrLldQNEinwpqUayvNC/5KJbaeoTXrFTcIfOas6rvDrpyQjfr9YR61i5BfV57wvHRTDmBzB90Ls
	uIx2UIcjg/iVidqkVaas0KzyD1fI43ruePoBf2DzxXgxcyAo3aMQHug3Jz24E0Cx6SSCN504W
X-Received: by 2002:a05:6a20:4311:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3dd5f448831mr11834384637.8.1789614474170;
        Wed, 16 Sep 2026 20:07:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:4311:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3dd5f448831mr11834312637.8.1789614473570;
        Wed, 16 Sep 2026 20:07:53 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abae95csm2452404a12.25.2026.09.16.20.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:07:53 -0700 (PDT)
Message-ID: <670a6d6d-2d95-41b2-b64a-997a39d4f320@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:07:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix chain-mask shift on 64-bit big-endian
To: Michael Pfeifroth <micpf@westermo.com>,
        Jeff Johnson
 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <aqqoAVbsVu574FwT@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqqoAVbsVu574FwT@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uLJDuHGUz8yeWw31OZpUrL9cXwZa3MVo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzOCBTYWx0ZWRfX6kWLAkbkrSJI
 DOPhy5Gc/5wpSTOMcDQ5eKUsdf41wI96aY8unW/EETBsgtswNXHM3TPp6tO8c7IDic+4TVmy1rL
 Vx0JB5Sj423MNbSi3Nc75G95llz9toc=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab598a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=81S0BUt_Dk-okXjJcTQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: uLJDuHGUz8yeWw31OZpUrL9cXwZa3MVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzOCBTYWx0ZWRfXyqgzKZd44YEv
 sCg2t4+WJNRRTHCHaxV9ZHjVEy3zcnvk8Gc/hcvpTFYPpLvkoE7MQR9D5Xiy6kX7GYQhMBO5jUY
 2G8aUT9lJ04lVUOP3QL3Hn/Dh+9Zg+lh6EpEfg7nxUKIrC3gv7yBPv9Itee4ETIU84SjB8X+/Yh
 DGgORcYGJS7r3aS+EJhuw1UcWq6jvT1i1AH0oudD1A5bOdqdBWUtRnlSKWW61k2aOyXofCr9rNM
 qA3eWKhVGNvPHTKbSeiTw8qgB9wMWV8lDcVtG6SIA0kRcSg20hzJhbdBa2nD+mm0hDqRQBXoILH
 gvEidnLBHXQbvkZ6hSg3FtmEQbD2bAgFodbL9hpVYybPxzG2AkBrVxE4h8IvIae7fOMRvMz0wPe
 mZyu/8TTCC+hOpgTZCXKd5fyye32c5tjjxcXZCGsT69J23AfykosegPA36h0pO0gnuZgMl2eFcy
 CJkjZP5s5AL16CAxdsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170038



On 9/16/2026 10:30 PM, Michael Pfeifroth wrote:
> ath12k_pull_mac_phy_cap_svc_ready_ext() derives the tx/rx chain-mask shift
> with find_first_bit((unsigned long *)&pdev_cap->rx_chain_mask, 32).
> 
> pdev_cap->{tx,rx}_chain_mask are u32, but find_first_bit() treats the
> pointer as an array of unsigned long. On 64-bit big-endian, unsigned long
> is 8 bytes, so the u32 value ends up in the high 32 bits of the word while
> find_first_bit(..., 32) only scans the low 32 bits, i.e. the adjacent
> struct member. rx_chain_mask_shift is therefore computed as 32,
> ath12k_mac_setup_ht_vht_cap() evaluates cfg_rx_chainmask >> 32 == 0, and
> the driver advertises a VHT RX-MCS map with all streams "not supported".
> mac80211 then rejects the VHT capability ("Ignoring VHT IE ... due to
> invalid rx_mcs_map"), so the link only comes up as HT40 and never
> negotiates 80/160 MHz. tx_chain_mask_shift happens to scan a zero word and
> stays 0, so only the RX side is affected.
> 
> Use __ffs() on the mask value instead of pointing find_first_bit() at the
> u32's storage. __ffs() takes its argument by value, so the shift is
> computed correctly regardless of word size or endianness. The chain masks
> are always non-zero here, so __ffs() is well defined.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>

ath11k has the same issue, interested to fix it as well?

anyway:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


