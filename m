Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583264E06E3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410492; cv=none; b=Tl3xON5o0rVNJeZVZD2qZloDx5RXFUHkndBUTYB5RGvqRfN02bMeimYATVY3HnhaqA78b3Yyzp6pI66Bhfyyu8c6Fpp2f7uJhTjYFz/ptQfsr2r0viwTqcnHcWwJ2faKKhHFkEbLG8i529IspTp5sMm9lsTTXW5VHwQPIMS3jk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410492; c=relaxed/simple;
	bh=K/8pAO/eAzqZ4mYJnQheLP+ihujFn34TwXLo1Fv1AhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPe9ovV2S3/jhABY5hv+FwSofuJI86PrMUIZqCsRQYo09aDydDd4VlHYG8zSyYILuoC/bgGEo5mTMkacpdX2UKZ+wlYG4BKnGtgzUq+f/bZohr+tBFbv9kFI5eGy2TvAJ8vw9hutaAF0zvCREUCjKelPooDFEyDoIjXZa95W+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVLQgX2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkUbQyyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVLQgX2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkUbQyyh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Z1Am2689048
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=; b=BVLQgX2G4+5ibb5z
	naNpvmFbebPYybUNIVsEbdMOcPaQtWO0TZQgPPkuEM5Oe2Flb0vJqGsT3qQPjNev
	fIFxxMJtYJ0YTRcICEBq1Um5HlLABsEAT88Rk5c/h7PMzBvVnaJvhmK4acvnE+Rb
	hDz5F04hTez5KuKKe0jQMfpG0+uprWJnuyKyxxql+riWqDem/iIv1lMAYCCezd8f
	rCyxZOcQzaXomi0jNI+/Bi1HnHRUQqZMshj29rnCENYK+o5lQfQmqaU3T9CTrDcn
	xC3LRGegAvzRjHTZeRvYPxJYn3UGQFVvn9N6R/vWBv5Q9YYMWdGzx9BwNPGmArHA
	i9FN/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0qhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:48:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso18225885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410489; x=1793015289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=;
        b=GkUbQyyh1WFTuL3KJieR/rvnJHzAls57/8IFCY0uVRUvI8zoe+RfmmPHOnQWsp1Ow/
         3JIi+p9n2LXJ11Sv5/6/xK3NUY5R0OZfi8FLnYijBI8nKdj8C6MuAVoerkCY4Un31RDp
         vW1xUQgBZsM8+7d+fw7ysLNRdaEA3IpMz0xzdXBKuQGCGBKNgwDxpWsjJZys2+BrV81u
         66mW5atxwfckC8UxQAE+yMOnxQgkabo6b2fs1S77aUP4LBJYLbPi4a/2079BEAZkQuMO
         SiU9ebcg57grjEfogcW1wQKimYnQrbKiVRBd4lh5nkTVWoPi7XksUG1PUWnP7zFILxn0
         y5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410489; x=1793015289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=;
        b=Uua0yBxpfKOw38auqLFYeNIrT70TGsCIUNAQhE8AkDom4Z3aA5xBPuhowJMrmD5W1g
         MTKkKfIRB1RjHLGbxL7b9ZgZlylvg4w4nnMx/60hG+T/z6Si98g3PTSMOYyompfnLhPF
         0YUCnVLAZvon8Gcc+ZDjW7VYkITjlS6Ec0xVS754ydsSTzjOR0i32K5uiBCYfoQMtUWt
         XrnSztH5+uJOBJMELptj5S70qE8dnTZW7/KZ9rf9hMnRzJ0bpdae8BXop9M1anzrI0QZ
         TPTRINhEvpHNRG21zqW+TMRsH2/A8oXcaqb9OUKA3M+OugesBAQ5SBIded3trj05Sgzc
         xG9A==
X-Forwarded-Encrypted: i=1; AKwUvBw+yru9JUJute9tJhMMJ66N2gVZ3oLG7jPva7iZNS3aLTOryQNnZ5VBM35DlBpNVEIGGj9uSeE9prEWkuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcTzF2RlC1vjLazOeZolDiolX5EgIJ+FONQ9T2Hf4TB2S4+nhn
	QOSO3bZfCrGcLrU9BEkuGTJ0N3HkB1sYIpJiz9RmnZfWgAOwOfNOyqH7AgAUIpiidyAeQdv74ms
	3oGG1SsMab+gFH2u07/JV7Z6B/iu9R1JM0r1XYXBNVn1ytyUwh8hTgbXqx9P8FZ2NR8E=
X-Gm-Gg: AYBFou3sgWQNzj0OOHSRnmAcCIKlCcmb2eYVjtQBxfYd7qzl92cDsjQblbvsTzrpHJO
	9hVFdWXtW4VSsaaZSObrZV7wat8ATI4FzPBDHbgPZ8Az3JNJn63DC0GMJzKlO1255rdh+FboG1G
	/MrGfMKT70Nl2DUXPPaH7nGgOrodhFfD/416FMNW63jCejp+41YZEyzqDh4LS0cmMx528sfzzbq
	UHhhr5fHr/Ax5R/cxEPEGWP36gpbbJfrQIsjfpFw7achdRGDSIo3tczlTZhqpGvkiCRIDmGhdvx
	E0sLgMVf0X7nzbLXih71vQglYq/8lltoXxCKOtbQJ28XssP5g95RDedqu7z0YGyXgvoXhRO/lwB
	8zNfJjSfxj+FWAbfnhFrZOw==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1367151485a.6.1792410488789;
        Mon, 19 Oct 2026 04:48:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1367147685a.6.1792410488269;
        Mon, 19 Oct 2026 04:48:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceb9dsm347362766b.24.2026.10.19.04.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:48:07 -0700 (PDT)
Message-ID: <2f63cf93-acae-471c-990a-c844185a9db4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX+RDtcVjJs4gR
 Zkh1QkkddRENC9wcpOBMGRs14exoYOE5kU10RsVlx7Pv2eRfI0vUBcjTnFZ3PMdgDSZi4t0hkvO
 siA8j8FvEy7Op1ogX8opC2j56arafDM=
X-Proofpoint-GUID: V421PvB9q74036tmyJ1sDhwIlZ6eDfcp
X-Proofpoint-ORIG-GUID: V421PvB9q74036tmyJ1sDhwIlZ6eDfcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX7+Ha14mcmVWA
 s0KUsJUmbvLtUKsvsnGuAUZxqE2daWaqxHT5ZJurKs8pXKHxxKeeGiQNdSpe4GUgrYoaZTY4NK1
 yqDLKbnthCjFAh7jfG+sjg+o5at7X5viow8PDi4ZIAb1PjzdMLva7vr/KlyGgb3+h5THG4YXPBL
 EorE4OHKYDCa4JCSQhmxapzEEBAiqzQS7iEIQekB1at1LBIGq8PrVP2qFXVGA3XjEMe+hW6GEwl
 YZ15mUZrSJx93ZY/O47VPb3FOUMMXkY+GLH3LrQsJbSwwGJiR1PeRKpANn1AVCMbsP+/erZ3ga7
 YP3cyKMzXzGTeIS/Wyr7cZ46HTdw7+0/7X9gz/Wt5h1H2x5ZGxwOx5qiMuOQEJuNTXrEYplN7oc
 3ARmd4kTvQm0zBEcnHVQC+5y4/80hC3XcyDYb14a+ViaWmGGVLDT3hmIZy8nE02Qj2pSbluqZp6
 D88GB+wlIBMf0K7xi/g==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad60379 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R7n-rOns-cfn4W1FH0QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
