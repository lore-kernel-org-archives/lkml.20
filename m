Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F86D4749C2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393787; cv=none; b=XfUNYb5jcPS24F4RGlm9R5XRhunc94+CszX9A8kOk8OyyzppSx4wlxUpVXY+qq2NY/Qwi+BeE2VZUcwjr5izzYJzkV9aF2mvi2wjMewcGjvw/BN92SFXvf1dTyZ+Rh6U+/z+i9cvQ2gNLNNo7YMYWzv5vQwMY39reWDaAYLj1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393787; c=relaxed/simple;
	bh=6AHLyVE4QuyvdlTlYMJyx2H1xgqwD8Xf4hHWGOe7I/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C11/406iv+YvdjkBPRq4K/TsayrCPe9mnEgdaofGZ/CfpqYKSAQW33knQaKXuR+JOWxlTI0P4JPD/IfpACKkehQgswIrRBUyK6qFUulQZhmMlttWRgoDeiO//M5zya030rjWXJ8yjH7wvRpcUR80bMZzMHr2jrfWY0poPMPSNNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olnp8RNG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6hymXN4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Olnp8RNG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6hymXN4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0SXc607551
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66Ilw/BhdQorwglPgrPXKGQ8
	DdohrA6wrNblbndAVK0=; b=Olnp8RNGiwifM5mM/xgV2jCyyElqj0zcVQokDg8c
	P6hKbRv7fyRwyujvR0UdL8jQxHQQ+bQGjNbW3F+KWwvqRz+mwiaDmde+3s0Z+Eoh
	AClPlboLXcnsfIjo8yKI3GZ+rV4mhu+XPWO2lw4CW3NtyafDiX5zn4R7J1sB8OJN
	0LSKd5kzzRuX2ZvMcrKd1U2fpvm1Nh6p2SjjonD9LdAvLwoT7wZgpI4yH+EJ8Pxv
	/9nWdHC2c5OniYVArfCyOAgwaAS1izZVvKd/D0AShqUVFyWyNMx/0zgnMBvVNjmp
	dX1MLXKTheYHcpunhVnyetTT8w09jP/Ui/Nd6MOyLc6Uow==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2krfnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:49:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so777795e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393784; x=1789998584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66Ilw/BhdQorwglPgrPXKGQ8DdohrA6wrNblbndAVK0=;
        b=R6hymXN44MAuDUIwyKqbMbzdzyBAs7VtVobx4KJmMXjxpIm7kdRdN5M8B83/z5eKPu
         LkpNy6H3SEXgN0kEu+5sHpgVnAtCGjsxul1k0dNZHhilE+EmnWoY4wf/F8EP51nHDxdn
         3PGt6PG+l5v3K8qJlfeMGG5X/BV+zPe9scA6Hmm4RAU65TxsNU0nINXt6oZO8nJm0yg2
         zDzSgJjVH18bS9EFZV/i/bzy1/HVbkuaZ9tGpwTi50gJxIQn2SBK/YfbKHFWYXnZY8W+
         X3MY7uEYQOZ6TI9NQ002WR38p+5Q698eaIVWKJTxk/ZEAt62L4tOXN6qf6HYKZtolXgl
         VjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393784; x=1789998584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66Ilw/BhdQorwglPgrPXKGQ8DdohrA6wrNblbndAVK0=;
        b=qOk+91TtVzKqKtsfklcglm43LUXIrFjx/ldpwb97Nrvyu0C4VcaUVeOzXRmPbTUtlw
         1942WAfUhD9fXNWccaccPTx4P/zWbK9EIao6Yugmf6HbqKJicAAB9sk8D/KefkQ2oANa
         GgbBEWP0E9zDJ0eDnfbFXANJcdg8qDnUBXu6xCSKca8p6eBAZ64mxWdJzIVe8xlYLtSA
         nOZF6cCP9i0RH4SCECrZZIlfinGhhGgjY9KGu406Rpb2YIlWIGJxf/jhc5iJVVVAsq41
         aMoYokUtttA7aN3b/zVZDZhrc6Bt5q9CTsjlMB8i6+uOfvUoNiTVlGa0h2kFc4k6lY+r
         dmhQ==
X-Forwarded-Encrypted: i=1; AKwUvBywwUoSrxMHEozw1ND6eHRYB8ZM9XDnhacM7/WcyVFrWirwLoyRSdSqwyCjSwT2xb+DGjNGoTrRr5N+ous=@vger.kernel.org
X-Gm-Message-State: AFuF++kd82lNT92818iwGYuUZOkQbzqHG2airYueICAcXmZV37we6cOG
	ktJEsOaiX0gLfZkLuZlcLB0KJ+q+V4qSQ6ZDqdW6Nq58YPpfit7kOMUKdw6rCtHBF5lNxUaqZ8v
	kYBSs7Bhq4rJOIo7A/ZIjxMTPOooz+4gTaHAvDuPywYQPydx1MqlJpp01NjFpDm1uTdBhocJ3BO
	A=
X-Gm-Gg: AYBFou0Ly3HUkFg61PQ1LIT7F7cKR2qr1l5nt2V92Iswo0r1c3O3kbmI4vwNgUQYrm9
	Dnm1+em/6kKY2OAcMjrNrWmneiz/H5WTIWDQI/NcRCUnyq4d8uER+j9RGVg6whbK7ghobx1eWIi
	FdKe6tbGwNi55GtSyaCPR7g9FH1jJJbDCRpLxRNKKaviivsc0CFxJzU9V9kp/KKvg3Jlh7gMEO9
	7wJ5Fgs6TufJEkcDW1IZKsli1EbLyAfBJWCm4GDtx8Ya/GpenpAfV+gGxq2FiO9jePgOmtsyN1K
	a8Fk+1EpoBo+E+G5e61agVpZ5JW2svT5Qo4C6cToZEQ3TrwLEoiM+HS8TQguD1bLmot40EEm4UI
	xGRRnmdVNhoOZ1Cg=
X-Received: by 2002:a05:6122:4895:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c981aa9b09mr2352264e0c.1.1789393784365;
        Mon, 14 Sep 2026 06:49:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4895:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c981aa9b09mr2352119e0c.1.1789393783803;
        Mon, 14 Sep 2026 06:49:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm26132106f8f.16.2026.09.14.06.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:49:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:49:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850
 WLAN support
Message-ID: <fdt6ma52b4ljob67egrfpai5m5uuejqab2hj5jbu4nmro2osg4@uhqloj4mptw6>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: T32v-I0U2lJaChsaFsTOdwlSvlBpMnmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXz5E8b0iIjhu6
 2FACRZvetdrJjlu4t7/4PCqW1yYjBJIoBOAGFp9K0jjOBiKOHcyOSiymT6p37QNNaeImfvBf2qc
 BOSeiwnOUQEet5QZbfTtdQOyeF3rs30r4LoUWggmasAg0Z5udAbLBNs3Dkl3zghHWVZ0MZGJVne
 LG4WKmTRMQiQdjBqOxtwkNdYWRXcPRllyuU2+tn9DpUV9/WXT5QH0m8IYFSBQm12s7QCILM+cGq
 dixzvQDNG+lU0ni7skV5fUB75rt61RqiciLi/uWmh0qNHX6xwmeg/HUusGk7YHsn8aG2FZoU/8n
 WaPcti9IM2/qXDBFsLjOBbun+/pv3As2BqgHWSg9bzg8mKwG2oCOvNcU/G/MKAgPzHfoRzZjti4
 M5iTtBte7VVATbDg3mlQAZ3oz7BpWO75F/X0L1e8mRiaj5z0YhP9nY0lWAW6jtNFUms6EbAwlum
 A5np/+CWzp44DCxLrkg==
X-Proofpoint-GUID: T32v-I0U2lJaChsaFsTOdwlSvlBpMnmY
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7fb79 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QryoO0P2UFxYqXaw9vcA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXx3bKQQ6kKNAE
 242k8SaRHPKSfa+GPRqsqrqzs6HkBexwjMSfGDAVOgBISOYxxMQrz8Urd8p0N83/p6XHlI9mDmP
 HfznrDReLoXUCdJIMNZbDqX+We+R+Pw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140198

On 26-09-14 15:19:43, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
> a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
> PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
