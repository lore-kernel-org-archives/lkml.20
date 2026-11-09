Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231166;
	b=bXau1WHrOtvQ+gXOmP3ryjQXrnpkINVFZKjuMBa/beO/c/DZX8+jMdDNajFkc8ABx3qj
	 Eoa51oAZye9WZCa7+4ND9Tcmk83qUttq6qIJ68ZA4qiIqmv+6eONk2uXdDoUuuDmyyr/N
	 kiC7dXg56mdVmE/pnUw5E0bO+Dk9NMNlS0Hs7fdyjYihbY1SRqOgPLglcm58qRH0gjpZW
	 FlUw5LHK8uN/CxKlFv1Y0NvAVqvIUYbkGrHih1noqrXouDhep7MtkYDOzFpl8+VG9ym80
	 eyh6UmFrYW7IolFj4Z8VaHhVT6jp3KNdYfSqIZUt+MoYLwyKV5Izoa8zZ4ppXvrJHBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
	b=RX96NXJ8wKtw55I5237Yy6VO40Ivls7N+lQozyB9csLuXiA+JN25o3rgyT1jzb+zsGDP
	 IAsRXIsX3a+vwq8M9r98b3o+QQ1L9rAlxAx2NqjwJYgjNdIq+XaGfGAjmvEQJ9rK5UWSH
	 KJi7WQ6prY3FeYNkIMtWvuAsOx+j6Ri5ojbnct79qVjkBFeGKBrUPR7VqYJvIaaqLVCR2
	 A+TgCBaGrEv4Z5WvBcuFLDL13r2FpOVyDmoVz593g1yT8/0WRjZVLF4yNeVOSnek6etdm
	 ELar5H+aYYXRl3ZSy8lvsN/2UEtR7dm12p1L0gcdm1y24kdpJ/RGDqSDmRn225FSsSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuIEAf33;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni3Rxsls;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C507606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C507606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuIEAf33;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni3Rxsls
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFrIe312071
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=; b=AuIEAf33+rrs+pto
	WYdMtA6ypYrroU5H+DcPWPiCxEkisy9TOauID34IJjIyEr1IcFCDznV+xp97ZBg0
	cenaQyHSTchsakwuhzyQFi+RsWZQAX2qIoLOn5mHQEHZLd2D+td42zrAjlWYMM8B
	Zm1TkyYfQZ05g32+LqpoBSCx4Rr/Dal6yDMp4UnWzTtvXpAEM/cFxS3TR7AiIwle
	k1tZ8oePfEtXHnffTZ+3q+63WJCUSHva8/dJWcmo4pZGMHWdDf9Z3ugTvmVYbpFb
	ZBCDbLVPn+Y6Lo8Bxhz0dPFb3OmasektxfwVEdWjvj0u513EONjM8yrqwo9GIRAB
	afBi8A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8kpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:32:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso31137e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231163; x=1794835963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
        b=Ni3Rxsls+XypYtn4S3ryGuFw1JmPGo13e/OTqhNLz3IQkNzIGusUOxKQApqlnJc9uJ
         VHJLAFwF4mDXOcXoGtA/6UDqbRozjQfXri8+h/f6zWr0bA43bO+nm/p32VXwi03TuAiO
         vJMbibwIn4b20RlOvVE/JIsAZbnNLhGmxPGQX6IY3lGR/kpjvVu1i3ravjeiBEPCGBme
         sAo/Ahajc0Jt31ErIKAAbGWwYOIcmLy7ZMqqHoe5FqDSfWQ//CwYH8xfLnFSdId/ieNL
         lSqiaUbUIbAc3+NU/bR2hJSxVnrd4JaMAvhhi43nGkMf5sxAUdGT4/NGGTaE1OT563th
         aZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231163; x=1794835963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSYZSMfbWpn6IZacmi5pJPA8yJbsB5V+fFXDT86LYhY=;
        b=nzr6M1lwCgg8gy27l8nlR0W8SwJEhOoA2mQAfh2ViTzEP3r3U8r3tvbbO/9xT6nFSy
         4mbouvU6I+rpf5Oihc/UcFcUcIk1S7cYSpvqd4SiFlqurnUCvAPlu9tnlypfjLSaWgLX
         /ELvBipSYaDNKdo/eKqros2Xhuqi6lMoeW82CGIGPvHycAfd9OgWnYi/5Lb0z2g7nnxp
         swL8yAgtHLytP7b8sT6sDtps2UgHJUBN/xy2robpLxnl3XnyaXTFihIGLtZ+6yfDzCwr
         PeVlSCEon/mji/h8HyaPPHCltZqdpt6EUlhCmVBMfhVqGRQwpwsbREHZCDjyBKfHXK4/
         FwGg==
X-Forwarded-Encrypted: i=1; AL+hErFdlaNgcJYEXav+Xn0mBbLsWRjCu9vjHpsup3WdhtH9+iL+EBPWRYv9cJZ8k8uavwx99sv6io/WrdDDb6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iWMMPJ1W0qJCQKQSHLPm6RqKiFQJkcW0CMcjiYZa7Wzm2Jl5X
	+z2l224YU7tECOBiaTB/PzUkAWGV7nF1b4dtj02LUimvMnHokyuq/ZJ8pvStVHtrcN7yhPF7fbs
	KoInqHZN3Df2qf6wnKukCa6lUC/FNrP0pZ9NK0tzMr9NCWrH3v9ZSgUp6UD406FaVL7I=
X-Gm-Gg: AYBFou1wSn3ZOwTb/fwSzO64/d3UGQKpkyF+4T57sz1iHEt8UWdeRjQX3a16mH542lg
	/4Jj3JbQKu6zwLnAfedCjgcrZj7/jJD9wjmb5tboRwGAzfLJOLzR/Wa82LUlhCR1ORtBobGoGTw
	tvxCVknUmuveCKowL1BNjoqenQWs8chQiHUVu+Kh3tIo5ncYf4d+0RfqjXfYAfMjCYWIJWyWqeq
	2HxqmkFZLxE+s1SgcWeVWD3tFdZDNrjSf4JS3sChAdxje+PbVVvi1YGAy/RFW4YXcZIDWANRQpr
	7NfVo27iZ75JVao/Uc6ZFrNTYMamzFhYGqhgZ9TIZiSdqbJoVkiiavsl1L426vJRVYmHgU0vHtQ
	oi9TJQld2rB5H7Hp1WEM9sQ1KSn1L3OSKHpHE5mlSieBDFfbwvbtbCb+Wt+CPw8jKYX70mQ==
X-Received: by 2002:a05:6122:1c9:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ece7165ea6mr965340e0c.2.1794231163478;
        Mon, 09 Nov 2026 05:32:43 -0800 (PST)
X-Received: by 2002:a05:6122:1c9:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ece7165ea6mr965320e0c.2.1794231162971;
        Mon, 09 Nov 2026 05:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm169621466b.83.2026.11.09.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:32:41 -0800 (PST)
Message-ID: <480582fe-27ff-4d14-b0c3-deab365a1225@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:32:39 +0100
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
Subject: Re: [PATCH v2 1/4] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
To: James Hilliard <james.hilliard1@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
 <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX6J2A/QS1fIjg
 DW9hqMm+s50o3HwCWVvldgjL1zYqqSfHr4AYk39cxTafQOLOx8LQLjki9oNG0u2rvAKo6KNnSVB
 wL3BTmdgS57N/dxpteq7R7p43Ev0mSaeBuskzJH7rJSLq82vAs1zpC684tHpWJ4w97TjZYs0Gjt
 Sg/U2+rU9y/pu0j6WFFSt8Ze/FJY28qHmzeU+ijd0W8ic8l5FxaUpCIrrDCmTcex6S1w3xFe+WL
 HQifpymy7u7pWmzuilcqiJQQEAkTnj/8ya15cyNvhqzv5DgSGqujfV/quunM8AA3Jm+VSguQxbe
 7TU6Sv+2zhcrPxZpt/ZkLmmrZDHUnt7JGXrltMn70jlPW3jduXAr8e/vwQvNKlOXkh2wCwTBtd7
 pxNrGkbHMLm6QIScmrOaYcM1RzHeFIftru8dpFRJ7hWXZ90MkLNv2SawU9s6XwLpGFaU5qUp9wM
 HmVWrE6BlMHUDqN0DjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXzd8DiJdLGbdm
 s/b+Dp8BvhubuQI+I0MMhxA+lECamFfx/DoRqOe6ctrPeIcDYnOZ6MZzuwX+2vrAHOqNbHwgvMX
 DKn4NypuuYQWtxDGXFpx8u9J4J0Q7lY=
X-Proofpoint-ORIG-GUID: 1V-T1YYFJoO9TT88z2aZIg0_r2U1l-Q4
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1cb7c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=X9yRgxbac6UzRlJmAAEA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 1V-T1YYFJoO9TT88z2aZIg0_r2U1l-Q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/8/26 11:42 PM, James Hilliard wrote:
> A boot-partition parsing error currently calls nand_cleanup() after the
> MTD device has already been registered, leaving a published device backed
> by freed chip resources. Registration can also invoke consumers before
> the boot-partition layout is available.
> 
> Parse that layout after nand_scan() supplies the geometry but before
> publishing the device. All failures then reach cleanup without leaving a
> registered MTD behind.
> 
> Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
