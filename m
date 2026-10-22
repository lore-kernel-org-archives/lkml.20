Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660518;
	b=XM/XUjiYhy8HTUqonDyxvChtFIunPZ6tiFniKRNTIWaMTOwJP0RD7il9qg1/2S/rSg6c
	 GbBe+QSzMH2SOAne30nqjgLfjRaQw9Y19VSgEfgt/wL2DysOxJ2k8mqyD9enxzRUuAh3A
	 51tCLrvaAqqAOzIjRj+0xPkvYGRPLTHY+MWl8WhEQc+4sOesByttLTbOz4RY0jew5dXup
	 t3GDgxKAQ70YMQ1vWJ6s8FvqHy3H2VudBQcWSKD86B59sjb0o4D167oEZ+qDS81ArzTnD
	 eYL2/F79CqOpiHf/YXPA/MnRPw2kiHel0aFaPR8/4rOVJL9eX4YDJF0OdFC0AsWThWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
	b=gHO5Ut/gutimS5AMB+RKu804NIfATsy6Qu3jL+FoStgEYdhdv65hmFJPDZcaxyPCdhzf
	 YfTz8KQb4O8YL6xxJw5LKAmt6sMQJ7GbCq4NlQ5TX7sRUQhZ6D9oEjIBO6MPKslquQFHx
	 SqcZPe1F6EE+HsG/VK3nMWWG47UcHOOhvetpBQ+438pRyUK3RK7OtbgLFWztQ11S3CKc3
	 aulJrobNuvI6fs+Y4tvmDj3gT5dUoO9SiBXhaOAOcFeHfBm3+owOIk+2r3PQsejZ4VkY/
	 PZZKEql1jXDLIEa6jUUZ2GnrRM51z2uC1z+GTpDHGRJvwxGljn8fUugcbHYtGt4hPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhSpwpBD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P++bMImR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647A0606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647A0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhSpwpBD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P++bMImR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705wk1995929
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=; b=GhSpwpBDTx4whiF8
	H+7IU3lH+queWeCYxxzD85GVF8LsYxu6vQlqQDBrYgFuliTAH047tkWpCHhxd5t5
	UosdZCVp2SlDAjrZKnRxJWR/PDRc+h6ZknnYGnf4tbnZJwA32eeAelbEkbHAXhuz
	Gz+Hxey/4HfPNvjg6PrLEQm0mHFjYeJCoaMojKbEnGmxF/YbRBiV+lKN3aGbvpue
	kCbT+SBtWc4ZLxt0elx2HVEgIatgZcK3Cx39TKaTEOfyagr80n1xCqVNP6u3ENmq
	jDhUWKefIwQUtuL+ZSdhm/musld6YKnD5E3hUBHrAg9kHBu+d2sIRIEPHz+5bPTz
	dQx9Cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsm2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so36062385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660516; x=1793265316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
        b=P++bMImR7Iyi6DfJ5uHV4DrYzUSN2FT+vJTaoAR/6EAH2QX68CKHpzyrCfURhHLipP
         QgEm7bRwkklB/wEENVUhnhxMLlETLIuc/NtdHWSZ+G2nREBzYi7C8o3MsNlWKfpmwjXe
         PtE/NaWGmVQ42M8E2/Y2bqO5PlO0qAzbvG7K4DHsG7U3Ol+cEx7WngKw3CTTuhNcjrIy
         hPFQhna0Zh0lcHxq1jMPBjjyAIT4SiX50++qqohzqvD/BvSHDw/a/ODlBc0demmltmYc
         mVZ8yd+GYMm7x5OvmNmjeYwZjilf94k622HXJO5HuYP9iX4biLl4nvUyOvhqD9CdCiwC
         rqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660516; x=1793265316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
        b=ZrPWTk+iQNUyYmefIuWLulzOFsjrwHy6VNMCT5QJC+ClTW09rk0ih8fYwjllDe+FiG
         fwgE2Ip3jhfGF2033dxbtSOYrMiEwrnSsoKB86JpmKcyF/d4uuGENskG7U/PLrsLqB2x
         ryuWv5LA9lLiAIXfyKNjWF80JagT/Ok4oC6FF+gKV4hmyMuwnKVUrq9h19wIgknpwm12
         IUiPuCxUUTe7oz4+UpI2308F0W7JMJykJ65e5dU8uG+Xswt2UOAerBg6e+xrQUauT2KW
         FBAisdD1i9AD4sN2ZhjEP3nIrO+s2ppj/p4Mw+DW/mIOMG47XueKmA9zzOJwkatpeZTB
         C/Lg==
X-Forwarded-Encrypted: i=1; AKwUvByiavjeFNjUoDM0JYvMsdptOc7O7NlI4MBpwLlVzkIGbzJPZMwN9qDXMBTpl/cAsPZb05I1OQeFLQdZ844=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl3l3vGnJyNKEDjoGvx+zjl99LxWWZTcdj8dFB+t7Q18HJsPsF
	6XgLnrIDZ8e6EY9QWG9p01v3ZP5p119ijSzbx/HpegjgUvyKkFy4mQ3M2DMvAnFMRrS1D3wxDlZ
	ExfqTFph31B6bZEtbXdoVIkhbI5ZrCRCCD+IljSVc9W4a5S2mJOhR/vT+PlksWL5LyOHfHz6mfh
	w=
X-Gm-Gg: AYBFou1XbcQPMIUPFaB6Uv+hQQ545mmcleB7535v+6wBCQ3ZlaQez7OZV94/G0x06Ao
	ekW5lxvUhiD3A+G6XOTY2P2lSlnAqtN8WpSXTUoX4UhgGQGtuUFD3IBobJZSLhuGJFQ1weoSkeM
	t/SKVxxZy4+8RlFGd1pdQN06rHdQwmp2xT07JYAWye4nd2VXeEbfRfK1EtvztDO69obz/BRL9Cj
	Nk0hdoBS/eeleKqNJi1GReqpD5A+/J+Y/y0x2kIoTag08TZM5d0KVaw/EkuN7LlGknMWtvDJ117
	2X21S2zlKoQCkUIeacZ1qleTfTbEw2VpRhVKFEeGqNjXBwQZ68yK1ByxWqdaXnIAAMnd6WrzvV/
	/uQlJwGaeTRXnacrqxIPrhw==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1113497785a.6.1792660515767;
        Thu, 22 Oct 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1113492385a.6.1792660515307;
        Thu, 22 Oct 2026 02:15:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm82138266b.87.2026.10.22.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:14 -0700 (PDT)
Message-ID: <5130b971-7576-44b8-a27b-49f3c104e250@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:12 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CucXYebEz41PriOGk5XjLQ6oC-CNTTag
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXyG+2IqviM+51
 /ZU0xbBHxeTNg9vBkBv9wSJCuEPWZiPSFSNeFK3/Y3cQ51ttx+qaWzGzzKtamL7cOJKfM8O396t
 ZqvcOqUlGFTTt8L9gehRL37Kk0Ecdao=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d424 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=f-_yMVppHRA7q8N3D6sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CucXYebEz41PriOGk5XjLQ6oC-CNTTag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1BYeQgQ1lFqW
 eD8k87RDZIWOvg1YvJpM7fP+JYGcpG+rI0lnYIEO2nIidRgDs7xRXIAky8h8pyjhosaVZrup1f8
 TI/5xjk/TVLgpBHFwoh+RGgcn+P9UtChisLAcNsWICsbLJQEZf5iJIWsJBVHfWmMbqph2YzJLKb
 IKexs+I8c4t9y+Lug3U40l1Du9OXAyAfbeFqhp1SAgXHUKoA6QHmQaC5Naa+NYLfqr11+30X69J
 cqyjDIqQfP77ITSUcxBRl1HsNvnLFXp/bXZh7ukoMHrxfNOoDZflnWlS3Z/fih6tRaHekB1KNDd
 CZnd1doLEq+24t4IHUGD3+2Wmwh/x25Smf4LZxKav+pIvx9+TS+yCk9hHYrXTCtd2xwk7BxqqDQ
 M55kh2/26kdK3Vixi5Fb2qJcvy+LfjpriMM3Rtqt5gswT2QlJkM8OdnbCeuSQgWhxz31gxMvHlk
 1TT4RE8lWuHrarllmGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The existing CQS SoM description includes its eMMC storage configuration,
> while the SoM and EVK filenames and compatibles do not identify the
> storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
> shares the rest of the SoM hardware, so duplicating the existing SoM
> description would leave two copies of that shared configuration.
> 
> Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
> controller configuration and its 1.8 V I/O supply constraint into
> eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
> hardware directly without inheriting and disabling eMMC configuration.
> 
> Rename the existing EVK DTS and its compatible strings to identify the
> assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
> Neither the CQS SoM nor the EVK assembly has been made publicly available,
> so the DTB rename does not affect existing users.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
