Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503666;
	b=g2Jus0sa2mxCKCceQMWUUPHCVHJ85arGFFDpiwNk/NATvmd4pwoI3xOOhj7B4PUM+QrR
	 zIb3CgUUC5WToVmKvDQT/Y9h5rnPnTJxTy2D3AhzqQEC71nLrF5KcX+/XAJvKRtJGUOoZ
	 GijKI0xxgCKmUOr9ytU5sbmo+7c2hp+86MYzovDnC1fKiLYjKaoAYTcgC2OV7ORN8NaSy
	 0mR9ohlyUuGQ0XKTFJxHugdUonqBQ7CEheU3P05VDvvipAjmJqfr9l4e8SMxgMehMBAZF
	 zozac5lbfOmiuBhOxUP8aVt4a5cO68q7+5N9pl489nIs8TUSpp2Oe+WcT66yRGn43rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
	b=rxjrSOc/1fB5DY0DYHp03ZEuAm5ff7gN5M3dBTUw/AWqPepDK6phLtXVWhmrR4CjGe6Q
	 upKoqMbwSPZKIOI2fntUSoWj4IgbKmTUI7u6giQpZw3D6G6PEG85E2HcKQ39u3Hj3ZENh
	 J9oTgNG4xAFD03TST5VG1Ou1PYEMyj+TZadWcEfVUiPIZbfbxWSGiBJHwFM5WgTHGPAOG
	 JD1T+dj+i9SP+uJC0e+j3QVXgPGUDw97OQGVV8Oq7pF76qIxHLrveqQ7UBPNPM6aBb4wk
	 r+exuJULw0AZfp5lrTeKsAP6so8BHpusFCmuxeBFv2Pduon8eGtDM4SYyGSCvzCoC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHAxwnQs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CvdMkMjJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414F606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D414F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHAxwnQs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CvdMkMjJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9slL882029
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=; b=eHAxwnQsXXCfP4yr
	Q096nr2TbnJ/fgyB8Pb1zZfzWKCgzShCqiS8WNHps6n+3+0d/p9dkcIDao0yZzsh
	jpja2Mmw5oFAD2PmFtlolgE4o1ovxx4BcXKBsaTnrIGVc903aNetY8/NXg7B85CF
	OlF5Tz01ZgUzURPvLLyGEozF7XRjN+WQFF17ZLDshpjyYB+/sT8zBDxzyO3ryE6K
	4AZsrE5ixjTtGFRBxyl9+nusA+g6dV1Gt9eo1DFYaL+F/2BfmGnH5s+FMGTkiIjq
	tta9h3TuPBrWnddHG9wwJKRZeP9xe+abSOdEzmDRmUX5d+Oht/ZLQso+KjkIEaMi
	xFJOfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2pe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:41:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533758f24f4so5067311cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503664; x=1793108464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
        b=CvdMkMjJ0p+GBiESr+chPfofjRVU8K2CTTg81zEBhHE6x5sD4XPh8pFjST8YBzAiTm
         bQ11B/BZRowtmN8ZEsEgEvaItK2aqkBic+JS9Dl95Zw8eZX/TtFHIPjk4Ja9lcSd5VwK
         i7SsrLbzDfBb2DuLCLTG1nJL/S7FYAZzlevFhU5/34uau0BaE49qzZvQuvjNEWYEtUxz
         8qdCsv8YtN8p2QP5Q9AkkYzRakBwQxJWtifHHXV1ZRIs6JHn49bxU/9w4IcRiHdXLe4Z
         EOhUj9MFGwcVW6mr2yMiXVeMmuagRhmA1ti+jS8OAuUmWDQquEvoReflq8ReyhP1Tlwr
         vKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503664; x=1793108464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
        b=W5x6ggm+Wvl07VBlA0hmLQMglaazwTKSdQe+l3OWW3DVSRZ/otcYzzrYDfZLM/p1mC
         ZVo35sJHrcwUr/LWhxmdaizfokuEyuP1uTSEqrQqKI8IWHotCozbDXJAWLBcwvffbtpn
         MyNOz/1d/LO7+2c+ixQprws3SEjGym3S45z9zvjFVU6QagSzVzD4sjUUvCs1FeEo+BBI
         LCgaSmGAv72dVgpU2EQRLkTlehAFE68cBd1zSNt5BAvtlEzWlGc2Oe7yTyOZSgA94yLt
         biwL+4TdClbohUZYgWZtg5A6vWltun52DMnDq4fGlQCUsTI01Zj3Egusm8KhS9aKsxG9
         V39w==
X-Forwarded-Encrypted: i=1; AKwUvBx+skyY9UsfkxsYqQdQnNiObX1LWQIZDxhTlOtJBLm9IFY/KFij2hLD4Hpp+aCXS8E9uNqvPsE+nr0QWVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9XW6MDp2jeCA7L/hKlSqBbUg75D5sFEJFkg8cWbLAHhkHsb4W
	ocV58tOeu508JAYY6ue9pBfBn8E37N+1tDp7yB5Mu0qEwxWC7OmeOgu3LZBcyvM9FXa9OZgd50G
	nSfetgHnzs6qqXb5vQy+VLfzMxGGDheWDzp6zYCBne6qgtcJjwFGTNfD9aHDnTyVv84o=
X-Gm-Gg: AYBFou1luEBRpxrLGktXvU8DMsnTf/IY7Q3QzqmHwpNmdbQll/TFE2z82stwT8lvja7
	9ZfFxKEbX7QbDWeTLa/t7WNvllGZNw5fkb7UqCdewLTek2/HJ+rMVCNPQFsBUKIq99ReTbQ720X
	jQmgRjPJV5hhVjU94ZHIN8sJj4r2jcgRH50C/B2sQNgLBiWu1MKGQEw1ps6Z3MmjDgZo0xognWo
	gPB/QkmWADWC8WfrLUR0MQX7SE+JiDDS6I2nP2lDiXlCKLkjssQ2IT1Pv99kNmISCVDfR/3vKi4
	UvvlFmHpPK+GFWeX4LpZ8r85M+JPz5l7ggnxSTNoiomKXmHpEvM4//mW2JyPz1lO5AGlWPEtudN
	U72J+LWQMvnPyOxNHUSrZbA==
X-Received: by 2002:a05:622a:3d2:b0:532:d67e:bc2e with SMTP id d75a77b69052e-53645a1a28fmr204968841cf.0.1792503664032;
        Tue, 20 Oct 2026 06:41:04 -0700 (PDT)
X-Received: by 2002:a05:622a:3d2:b0:532:d67e:bc2e with SMTP id d75a77b69052e-53645a1a28fmr204966841cf.0.1792503662173;
        Tue, 20 Oct 2026 06:41:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm487237566b.27.2026.10.20.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:41:01 -0700 (PDT)
Message-ID: <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:40:58 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad76f71 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZZu2SShvvRyxSvgSXh0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX2wuTD+VsLABf
 a1wkvSwxvO5UFJ2AlIGYwsuYu9+audGwZ04Kr5L8ATvHx9Dt1ujqa4SA22TyypLVePpnIUXc2ye
 OiQUpH/YPqXBcLLW1XPlTgZy10pf9hU=
X-Proofpoint-GUID: C9BEE-iVpvFF8jkYjI1L3J0USxSuplhL
X-Proofpoint-ORIG-GUID: C9BEE-iVpvFF8jkYjI1L3J0USxSuplhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX/2J+DGwyn3xd
 pEmy9ReCzTUeGkj2fB01DNsXUUjtXo0ciBkZ3FdhojY2I8Pp8MmwfJ5kM83f1mQ6MIFUMpcR7SK
 AQjowKv7ZXbqOVpZc0m+4OKpKcv2MKEPStCVwRxhbWRvM/ZEfqZ60zlLs0lvHf/yvaPA6DyHNNK
 +M4TNGDpZKA/of2ehZldgMzyuA6bRHWrnPLWKCW+dKXtK8Wjlxr43FIDoWsSv+9ck9uQZnTc6Y0
 XmOyi1LHvRo2BuYu1YIzZbUgXHI6EKCgSxT7UjcXP19RaP6C1dF1tQ2ojE4Yxc7bHuubILriCvp
 rtq4NuWvfbK96LJyHPTJ7nHRuvVfdF/QK2wMv9DeO00mSxLy1I1e9omOAT1ZIe8wMkyVNS1PSFb
 Ap62fDuk3mNuqUSPXqVqbZaCrtsQAjAqsbi8YVa+TufVmxOSdjFZeh/EqW8L+eTWefWX+cejy7N
 ZWZTHlRycasKexbaUcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/20/26 3:08 PM, Cheng Jiang wrote:
> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
> to come up.
> 
> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
> 
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
