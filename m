Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075BF3A874A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442151; cv=none; b=rou0mOzK3lAOFg11iOzB0w5MB6+zAdiakE/UwtAv9JIKXj4VCXGwA/7a4URjhoq8md+ukewknZSFgU75mbay3GUv+4U+DM4DB1WCRq9uYbGd44ULl4w5C8F4HwdHw1fkxYwCfqmsUXGRo/cIgebhQ8q4mrU/zoUuDUnPWsV6iV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442151; c=relaxed/simple;
	bh=icP0yGCzswj6mUyjJWo0McyYmwhFhCq9CCcJJ1QQl9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2lD8XsgLVqe1zrCHs1TXIWsWy9LREySzGh4pkZZnpcZsBg8/h5QH/IRL5pmgqxCAyzGKxj63xKFOv2om4tSw/LhZopkJ5NpKCh8Mgw0FjMTuoS3EeAq2fQjfT4qhPaV4IX4dzl8stygipG0dD3i95pmvI1fxjIj85oYSnd9coc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kc6kdFcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=harMopAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kc6kdFcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="harMopAp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUsA928477
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=; b=Kc6kdFcN81smkTc5
	skQNvg0P4jBmpKtFgj3UYdoG7PF8j4K9I0mNYgd9FDGK9SsaHCpTlX063CSLTcfY
	rTsBJLTroHIUL+yvDjSK/BG1DF4bPMWUpiLo256r2FvBuLNxkg4M/uVZEO76GZOx
	sNdNLiISe+cRJhFLWeBCUdQqeeHsjxah/7kpxa6bxta9bc071wNYE+ceboxqu5zS
	XGMfYsMCswnzJd/4djH2ZZkwkqKRGRrOI2svWGTS2riZB0PnIc40sTuCefyakSUo
	aNUNVpTDvAO5Wvho69fMa9LrzwHtD+i7lJfTgmNLyMx9niy07urjSrcCqGEPrp0A
	cCnHmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2shqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:49:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so5016869a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442148; x=1792046948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=;
        b=harMopAprxyT4siDsE1mkvpyydeG1I28paemriogqIWqc53RlMQjY19jzDOPs0kRlC
         BjLNNFtvZPGGCPYiC4dVI7jTaqOg3CsHlYizo2f4TYNwzbK9/jHXId3gmt2zp9R7wutQ
         0lctBpLozZc7aWNytnweW+RvM6LbShliwFsnVddQCSraE5QjWIpVl7Z9LQPsXUUp7870
         7h8V9msHYZJK4hhHnSC3kk39IrlKg6OQrKrSpIyvKhchLKtz/abSyxFqR8w+f/SrmLRQ
         V8bissRKtqsKV5WI3oxbjr3jldNFpXkrXN2jpEez1jTMFlhJ33c3Z5mHb/XiOah0mVHA
         1eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442148; x=1792046948;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=;
        b=y51yRJbMPJ4emr1D7cFYDTe2bnkEFSR3+HL4vyjZuFL+t7zZXsmUIjWHFUB3b1H+HE
         L9fQTi/I536d6QhQpJ+LQCRZ0J4Bn2wZ6QT/VNqK9I3TGncKwxvy4DYoWTntY+ksawOr
         EcOhyl7n2QV/XRRXPJok/EL+tZ3EMczFjFk0aKLKaOY5KObeDRmQ+nQGsTpmfAgiBAv+
         LdickT2i/WxvsrBNXA0muvcy81gvpexlWGrnWngSZPdkEaarG3XLxogWF0Kxc8ecJrHA
         cDe4mm/EeUBKTJodMovUUWQQiqqkatPIODw97tXcvOPIY0M5JcFmJGwy/Qwaz/ZXxso0
         CimQ==
X-Forwarded-Encrypted: i=1; AKwUvBysv3Wk11nOlcd/4ltABKqexveJz8yV4XArcSBQbRLkij3xOjWpKwgLqAfOET0LtV6nnvlp/GCI4RmUfWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXH+eE5jMEaqQ1go96O4dmgdGQ8cr3qrte8b1Gv1EPr7cIyvYK
	dWsTfGivdhj5NQII6DN8kOMjLvYfUZ6K2fJLqbyioCSWCT8Q5bFIK+E68MSlBPaD28JLccKFrlS
	7K2SmTDa+6fP7ga7vV9asHjfyfw4KGqIkMOmOTD4FvhHNNi7p1yI3YUPFtcRleskrTAc=
X-Gm-Gg: AYBFou13oLD6gOnL1Dpwa5NClHzl9GuTB0XyA9/ToY2N/d8s+s2Oizm9215+JEn6Kv5
	r5fIoEucr+MPC/jj3QFIkM1hcHERvAzxttMKAJXh/wk6Bf8um1XLguhNwOeSpkp6nQBEFHiJwwK
	8TWpdBd48oMm6Auv3cnJth0Dq8RC+2s2liY3Y7rw3Ya9cicXbrDTy+n4EEPonmvn6mfJ/8IQBLd
	JtGtM2hLkw+iUniY7oOFE+P8vSBe4xiozCpvfMh6h4UuxypYUyAn1tM1sFSeKTG//zrdiKgpfsI
	3ElH9jKyjmjV76jVd+w8eixpx52RTmj9dH34jbkUeC/9INCWA3vWbeJtM3R3EosZQ2HFgGlPQft
	ww3olD/ZWrvY7/5K28cCkB+db7Q6Vkpug09nP6VOUx7KO0GfpKTSnu75n8UtinIfYgoAJ1wZx
X-Received: by 2002:a17:90b:3b4a:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3a89f674ce1mr3494808a91.4.1791442148470;
        Wed, 07 Oct 2026 23:49:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4a:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3a89f674ce1mr3494804a91.4.1791442148021;
        Wed, 07 Oct 2026 23:49:08 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff8d5896sm2860608a91.12.2026.10.07.23.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:49:06 -0700 (PDT)
Message-ID: <2689b288-05fa-4a51-be5d-c65fdee22ea6@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:49:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count before
 saving
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261003101944.596546-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003101944.596546-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX38uNtZzBcEr6
 uh5VPzbSCbEs3ZAwVpzUoPaXftscxCIu/OVShNb/0u4Rr0dW474BW7lYWcftbFpQyHBLN+Ww5EL
 uZd/6qUZZS7k6anB7C6fMTpAj7rh2sU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXwD8Nkc/YAJJv
 SDHybPP+IL/slLussUZdTRagj/BJUTL8uTufPMEGAbf2SuvH6GBtW7BlJHlhEzNMf9z9a7Q5m7D
 fF6Eq1wQovbiHEa0HebrTg/JaWRcA5OlXIWDgzAN9FCovy4G/47yV+FH2v3azOEBwOoC5B0JH0r
 3+9Bme0xhANcJ/gxUBIO4RRPKEwx/NnFaGMzF3q7XoroCH3vEbcIZeDHThUEL4eoGGdAQH1r1tb
 O0PMbQfaa/h7MqBv71arf48j0/xwcjrYDftIJKK5VYFh1bp0oJ4r6uADEQaD/CYBIJFI4hctaTc
 xZjXUnmnO7JvrWbJ7mKFoxFe1XmPHCrAwFj0GEiJGARlUDAJMOf++4Ia/uQeQlp//FdNpGMtxld
 f6jdrwLeh4r3jFLx9dKbTZqSh3E88w0tWE5p4LT5MPITXnoEYsByt8z6vEE3iO/ld8/7SvI0T/x
 bR7HqBuUVlzoJBPoqbA==
X-Proofpoint-ORIG-GUID: _5ShgJwGtMZFKOtDNfSqhUV_aC4YezGH
X-Proofpoint-GUID: _5ShgJwGtMZFKOtDNfSqhUV_aC4YezGH
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73ce5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=CgAF95LDYrE-zO_MwBMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026



On 10/3/2026 6:19 PM, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
> uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
> destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.
> 
> If the total number of advertised PHY entries exceeds that limit, the
> loop writes beyond mac_phy_info and corrupts adjacent memory.
> 
> ath12k_wmi_mac_phy_caps_parse() allocates the source array for
> tot_phy_id entries and rejects excess capability TLVs. However, if the
> event contains fewer capability TLVs than advertised, the remaining
> allocated entries stay zeroed and are saved as invalid PHY information.
> 
> After parsing the MAC/PHY capability TLVs, validate the destination
> capacity and reject an incomplete capability list before saving any
> entries.
> 
> Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
