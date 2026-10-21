Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591343;
	b=ub3/u4hsKUXovwBpvOyz6S5qJPU0tOvd8LpLbn0TleJ5xsF9CKZlZVXIi09wJ5J868se
	 S+jmQ9RvJ5lRw09a+Gxl7hyArdFfTr/IHbmUvgsmXRDxmX4CFljVMWa12GpcLmXT3NxMG
	 iXUJz3Z0tGj8JBYb+bRQnkId11VeBqG8dGBMwTNeLkehiMI5Z4yMPtD7Ov9GU9nSJGvqR
	 g8EoMxz03tgmMHW4djpgEtdHq24yWexcz/SKXkDfttwfED/BL1IKRmG4hx0LTQHH5yIxB
	 wvD7JO6y+md70ytNcKsBJ1T7EWdScbTqa0HVMgQXexWRmw/75WEjiqwytaDKa20AyXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
	b=zT877xuCeJhrVvuhFFykDWBBuJWU9hdWkfYer8Ft6ShvXHxPLq0DCTo+QSHyKm64b63b
	 NzVmQj4CJYah9NxDBqHhtpEGFXRzFLfxKZiIttI+oL7u9YYZYQKREH7QllpCmG9B7WC8e
	 1kLx8+HxxM3mNZgiCj9mUU43fuPxQgX1sB/aW3iRnWt+qjykIHTSPL5eO52ha2Wz1yIak
	 QSKJd7TFWrRX3DgmdnXEXwjMbEVsOrIZTFXQupgbb7MuiqqgzX4cynXFDzVkUdPiMdZ8H
	 OFnlpoPmZl1vBEiXsfhopEtc4bIKP9nFBX3/e2YJjQJqc4MplBBR6srv7AGr7qlib/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672ED606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672ED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDN1XW402428
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=; b=di2bf290CClcfrhc
	jKzh/qb1Tyb2Dez0KXF5lHo78AqpupmhKBvOqSewBsyOdqxvu8biDiIOPyNpDgNn
	d2H+AVDxpSzD6SSAi48DYV6INTM+aWRzxMRvYt7zzVaJR0YrSzKd0NqQb2s1Koxw
	khCwHPAmM+fkf3iov2OpGJ1FNwprBNQDSN5/a7u4BlRwjlXAxBBzWu0fN2Z8bRWD
	eoWHsFeawCoo70HcizOlBf/b2NwqNtygHmlwUS0W5ZZ86SFNhcWOzi15TcM8z7iL
	Fwe6fRKCa50MEhq1XertPSk1M3PByLk2NwK0C1sjzRa/I4/dAS9HCOySsLp9qVqY
	lRPUHQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr5f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8250e0f6ec9so199313a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591341; x=1793196141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=YnYgPettYe3RxdQG9r4/qhTs2eKwPOLdC6Zxq/RveeV2Zov6UiKlbawF9muxkq1E5a
         OvyPyzANNyv1v+NYqWm0LotFp7BYa8VkXIIV6O4Ciud5WueCaWgcn/TZkCWWpE//ek5q
         /9tYIutHlofKlUEUA/mvIkNXKHxAYc834V0fuu9jLcwgL4Zj8KozA8fomjlLha1ciKYl
         KSPBCrWYnx6kDUPVwdSZax0uhdX4rKoWmoe03D2OMvBYO50VQt0MaBO1KrUGfH9izYmV
         qF8iQ9JhP9qfeIxF7codRTaesY0y6JnattSV5/1OctaueqiS3zH7R0J4/VD28fZ5BmVt
         uICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591341; x=1793196141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=qsn6QQfSslpNih1EtKxXbRO81OMHAzbGGpUwUQvWIAhDw09Ma4eqRJWxqad1L9mjzg
         yD4Z4KbGKgY/ThwVeT1U+PUXa5kxB3Ihbp0kvO1UCLNbJBFKFbAX6cFWcGaPNea5xjd3
         uLC3oBqmEllTAEIBlbZ7zBTTv5vdivtn1IcZ0XCNccxR+Xo27HjV923ISA3nHpngeeVV
         K1ZOE2FrVbZZ4UbXvWhROnvydLur8EWYTBKCb+8VNfTXcxl3jjgg5atr7wM9jH15PbNf
         cD+pw3GgQNNCa2M0OtEd9tf4fIzRPAgN702VWpoM28wE9fW3TTRdISJlxfu0LN/TdP/S
         Sjog==
X-Forwarded-Encrypted: i=1; AKwUvBxBJQR5CS8UZbQOksF/asmcupf6TbX2YCx/yf79ArZ4G2i/EnY/IMB1gGGbjSvC6TSC1Ml1DhAX8PbvaQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcesgqSr3jPTMuohRrHhZB5zwwhWQK+03OKltPU2x6buAquiUH
	H8TAQeLYz93Hcpivx2glSbPrLBF8MjQmGy0kADF8HySQzfal3mE+Xmnfd5y50KLa3MG1U0/14Eu
	9kzr5aEHoqAeHzbTsG5dnEWgXFTsck9OuAgWSj6uHaN2kFsh49rI70DuXU14E4yZwTwc=
X-Gm-Gg: AYBFou3Q1M32T7Gp9JBo7+0tKkGNDIkbE4jVT+rtvDaQnFk0TU2mapqE7UGKwDPZ2L8
	zeBJk6A0wmoj8awusz9/G+Db7WQcoAFVUt3KX7kqQ9L9noqZ1+5ZbQw6BaUntJQbNMz2CkBeOLu
	bmpdsfTVP7RVX3esaJsHkTYA2ZBAWubbNu/Y19UGvcJ/Fgf54CeHrJVyJ0voM/0RJOMiAy4J0f7
	LWGrHeEh3R7MxmCkvuenfKJnkHW5L0qpyccRs7Stq0222GWlbVPhYsgfWzr7RHH279pxOEGARZg
	MZySTy+688/7fcoYVSKExmM+j7uJL3E7CnR/ofpNDxkGhP47mBurFajISbM1lmNT3x7Ciqt4zLP
	9Ltw7jTG1NF/ua2TzC8kqcA==
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213763b6e.6.1792591340810;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213659b6e.6.1792591340150;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316a2b3sm856108a12.35.2026.10.21.07.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:02:18 -0700 (PDT)
Message-ID: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:02:12 +0200
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: McD1gF8Ce1OV9vJPod4R1XK2FVboNy9m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXxK3onVo/zO6M
 5qR2pyXr5v/5EbOshXRqsjsamQ4tWMvUtprtRHxGoIYdc3d+fHzymgz2+8Ltot5qnEks6wABEcl
 feMagdfaONM/UJpqp46HrZphDvj2hQQ=
X-Proofpoint-GUID: McD1gF8Ce1OV9vJPod4R1XK2FVboNy9m
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8c5ee cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0yJHs1RHlB3dt4QKcIA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX1SQ1MQOZAnk1
 PERfquBhl2mwCgpbfCVR4f3pODkjf0MGlnpuyZ4BR5wDLGIfrGJ7p6txq1zlbGSyY5Ido0YOVXs
 eI/WANhSZ7Stk1nNFogsyeLc491aC82enQmYeGD6FwIuGhVMo62VXNDQVj9I4TOZqMvIC+njE8+
 vXVyYAvXU8UsyIwAVW7F24tn4cC8wluYOQdR5ORPIQJWTQBbE1tJLNYk9lggvzn3PlpD+ZDysKF
 xnCXy0MkiM05tk1ZTaau5ZSf97R9iL5+3YMXyOmdxRA5l0Pq+3krs2glIafzKx9aIHl/C4TzE97
 uJ3MXk7Aea6Jgr0NqfcW/cMF4QnUUETSBWebKVabxdqxEGPGCe6WT/zlx+mKsoSmVeXdo3rxQQE
 UZ0Rfvud0iVUm3THvrQYzrbNbThEJ/eLq2PRBUwIDoaUWc4VgvJFWUbvuCW5/k0aEl80/PIl9zC
 5XDckRbPY6g89apwXEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

[...]

> +&camss_csiphy2_in_port {
> +	camss_csiphy2_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy2_out_ep>;
> +	};
> +};

Please define the endpoint in the SoC DTSI like the glymur submission:

https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345

[...]


> +&csiphy2_in_port {
> +	csiphy2_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn5_out_ep>;
> +	};
> +};
> +
> +&csiphy2_out_port {
> +	csiphy2_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy2_inep>;
> +	};
> +};

likewise for these two

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
