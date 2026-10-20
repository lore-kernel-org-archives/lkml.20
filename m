Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498441;
	b=hRVAyEkuNbJ5OOe2+0RVfJm/4o4n3XJh7fJUdaRIealqQxESrkRrcNkk6eMAsll7X9uU
	 6IvpcOlgQemkTeHqRjWlWuK6lGIqBWhBK6YPbOxxEu3uBB5Ohr/LzD4YJS8UXNH3NOndC
	 mNOyP+w/0oBUrqQG/uRz88h6Yx10/bR6+2IpuzwgbKza74zGEm37D4qMNrblMboJVsb+b
	 pPRLom4nicUZDtK3+AMC7up6gNMrGtfyARHqV+OcxN3VPvIgqy9gADyttH0DsTH20akGP
	 1Mlh9Jiye2hDEggw3oZVjWNVcA0dSie0SU7VnLWs3tdMX2W0OYCaXCTQJeJEEzFo5lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
	b=Q+tbD9yOcID84IrhH6P7Je9w9hGjUe8xsNvpgx2MvqgetjpoG3mDrHwTnT7ixDKsUCim
	 FlOKa3aImzvYCGM2lUflN3ihwLuKLB2zrYlbbCh3uqnalOyEE534b1YYhgZeA6c7x+IQW
	 t260m8HQ4z9bcO8/IH4vTZ5hCPdvBWyMm3fZWxFn875YxH7y4Ps1St3fM4WOmkvkaWNw/
	 RZv9pLCn8Pa+ypWSOqMk0PuxMA61aI8ihbDQacrqe8AxD7XQF+Nn1tsiH9e+iaC+/5StF
	 Fr9hUXH/2le691s3LuACAEFAuG7w6rwGSthOzAOHLJVr5Fw/fGhRvb0hIqg7JIcao6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/QTEL6y";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+7Y7xsq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8809C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/QTEL6y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y+7Y7xsq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxN4P1293037
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W2q+lbg8FZt9W6yyGG9psoCN
	ajA3HujtwITzTDuoWFg=; b=X/QTEL6y+4vBfavAGOSbpoRzqkdjB4AMtmucd7TQ
	EHxjN5AZomNfcdGUFEL2814Gnu98WBWmjWOJrUecRUOZttxweWpASb/dH4PlCN65
	wiL2nlyq0jeNzlVobS24UwiXJbxDXgeI3TXrvo5f/DmzNvSRQEv3JpwNjn23JFb7
	G7KrjiyyGjZ1gMq6vHDqPEiHXk9R7SzxC2F1cEqfVJAjAztNgWfhsKX88RmSEzoM
	7T9xy04/sMVWL2GTakYxrpYxa3ynLMRtyQcI/PDiVXGZ2xo9tau3QcObv2DkN5FX
	63ii62l6n71CtRIZ8bDSLchBu3WhlgAUNrd6l4uzUhpUuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:13:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so592128185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498438; x=1793103238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
        b=Y+7Y7xsqjcuQnE2/15+dFHbqbDgW98DcQrbIvSDdY2lnRWhkas13GNDIlGovPgszgY
         YzTb46PIxNLfCMB5xxbmgyYs7dCTq+/GiMWKRFDybXSu1N6uu3/ZyqEnDYvILZa7S3Ve
         +SHB2rBrF1OtpZZ87wS70Rs29pYzD0Jup930q8CfgZ3moDQqGHXau+oCIsgZbrvLSdUL
         g59QwlkDOcMW4RMFJQdGGTDDFNWPXtA7ZyUSWSmN9uLgkJGqW9oivih7uIUj1KIV2fBW
         1u44X+q8NydjTrm0xrUnhQ5McXUHNs9sdSXkUNuQrOdDYiMmJQdOC6fTUuL8PT//JG+a
         MgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498438; x=1793103238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
        b=PPjvwlMA6RwjWxWtik7PZZs2UrHHeUklfllxa7wd3evWS/kTPuXfnkRGaDbWdSxpj8
         YHuRAKeoq0DMgsqasv+g/aux0wYYyxastU7RNKxzxiKbK/k8Z9zK5vBfEACoDM+9ruAK
         yRiJXpXK7srVDpHha0JOu8WtRfb4B9O+ebYWPIYdHJnfj6aJHaCTgYLThAp51kbcmCfV
         5eXEmEDN3u6ezBGurNZqUsw5CO+vNrkCVk7lgBhJFvh8XZ0i6Y5cYhqr/OacUlM24KEI
         HDgzEGrEetKBtWXyMhduRH6COI9Pa4NksNxkGAGwpBHaFzi35LI0l4YhZigyH2H+S0LI
         Ak4A==
X-Forwarded-Encrypted: i=1; AKwUvBwyIwLoWu8rKQ67YhOrj6bqymCQR8fY4vJ+h5Y1e5129SZzxAk/kb/yivwlxE8Ho3HD5jQmZPKMmW5GWh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwNjGf+cux4SGePajIdC+mo7VWQnJDr5pVrHyNYNHIiKH5XYCu
	CPE8DSJis/8t4mhUAp1dt8brRa9fqNhy8njuaAvSjezkDtAOWZeyHPa7Qi/dfwxXYabYQhYQimK
	8wCdC2NV/twb5BddqHssOsqa14XRH1IFT3qt4E3e+Aa2LuQrFkik0ONMuyHiZMRY0YK8=
X-Gm-Gg: AYBFou0TkZu5GdpLSLdNZHNrvFLL8ul8Wgwndi78tT07Vx5NuVmLco3OI721i9HrF3N
	9aSF/K8ld7O6wSAsyAsn8YewR+rTP4gz8gDICwzUEPT3wm1hMPCCUnDhqVOw27+KuFmWOpI7bGS
	bFtBSmiAy5UdOXfqnXzyBZOd6/dSy8iDKwwrjdK2GPoeXEI3xuF2UqMZBY/mpCAGBtI1Xl0qb+b
	ZcAtoOjy5KkLOG7T+GYf8U3GIhsBYMiNLWpXAJHpY/Gh0aWb1T6KUJNC1q3mvPQuWHjnltwpKBe
	vC+SkEaZ0cD5puDvKj1UDyP+AeaNiDp2wU25z0rSI96g4w210z7agfnMFpk3PbY/ouhfWhyCWmN
	bj4xq64VADDETQZF7
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f29dc9d10mr1630170385a.78.1792498438314;
        Tue, 20 Oct 2026 05:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f29dc9d10mr1630164785a.78.1792498437609;
        Tue, 20 Oct 2026 05:13:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6351362f8f.42.2026.10.20.05.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:13:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:13:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states
 into lemans-embedded.dtsi
Message-ID: <mwi6zi6imuay5dkfrddevix2qorvkqxvvptdywv5irlez2yd44@wmorlob4ygjd>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: dJjS-GRXY2jXEr5kUvU2w5hgham9IHVQ
X-Proofpoint-ORIG-GUID: dJjS-GRXY2jXEr5kUvU2w5hgham9IHVQ
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75b07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1Mba6klkf1WT3IQPbzUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXxMVRB0Z+jZwS
 qVcsR04e5EuJ6IxsTsGL90EXLFKuhMNA/6ga7hzSyg/Z7ujdM6HrThp8YHQjjeextI08eyP5gbU
 tdet804QT/H0t3qBh2GWquNK1s5o04T0WdXaHFIB1ce0RXjtHKkilll6WTi8EqCRR2Y1IWagi0W
 BDltaUSG7Vz59fsLp80phKUqCPe3V1aa/CBtaRkSBk4Wu0LhnLyj+Puh8QXHDeA+wEXQIwtH8Ls
 +Y90xmLgW0Vn4X93haOC7R4QqmaSXx5v5VJ2WsLY4X1ZUldsaxj9+rSe6z2PpdZNINJKUkfkXPB
 LTswo1SGWWdf/x3FUf0DRKOjAOVUErHvOFbfdUiNsm1TpxCGLrqtSWO9n3Ma52L+tsInCjYvlWB
 V8omBcgtBmHOycFMupHUHMGYYIJh88R5oOWPizv7LekX5Zf41OMe00RDydgWnRUDJx7j7ZgTuNX
 cHqOkVfNFxHqkRB6FOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX92NtI6jEvDk/
 hLn5x+26u1FztcG3XfpNCiXZYDsSAITca4irlPUFyHp92ukdJHs50ta/HuWoDuemU53EMdljFwy
 d0tNxrDtt7ByX/Y4jSdZRfxQ7ZdAQhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 26-10-15 10:37:06, Shawn Guo wrote:
> The lemans.dtsi will become a base devicetree shared by all Lemans
> series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
> they are used by Embedded variant (IQ9/SA8775P) only.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
