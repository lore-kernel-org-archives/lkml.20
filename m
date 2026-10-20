Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485231;
	b=f1ITwLIj8os4CkYHKu0M1k5O3LxpqyvY7ywZ9G0V330UckVlEQgQOiTIJSI3S8e1kGBF
	 uflw3NTTVtpXby4VXoQREr0l3sQyHwpGseneHo5mZp4J2jHM8xYFDTovcJYGXSee3q5/b
	 UJICpkFRY79k/rmBLSqOf0jTw/U7g+D+tMrMbPAwGvCOczNvZA5jm/TepbOnpXLn6fT8v
	 llHtfpxArLSEkxRdRxNm0S+S2VqoIfllT7EmdTgAialE5WLuVDjXRpJ5uwympcnna/h5H
	 P1Arg368pFNF1SyKmN11wL5fN/yo4ZM/bO/m+BcRHW+PHiZnN9/UKQ88O50JNJyiSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
	b=cUOfCMu5m78HuN1eBwDrQiWyKZ3VLLPNMcxT8rc+2BVQvKxZlU17FzDJhd+/Nje+I8s0
	 C32uFIvWvSaR/Ida/PdSLr2rU3GXHfFvX9z4I/kNFXLugtDMvdlNTmd223NMeFA1uo65l
	 XJo2F9cI2yEZLdeVXhVrpbpWDHwMwropNCUY324gc//DWupVG0NsFjkBTGvVqY4o/8rsC
	 BUSjuI3Av/D1nxPRvXSBYr3ugBKKrFU6519f0Jj2L+rIEABmzXKlXpiAc+qn/3GIT6xy4
	 D9Pyh7H0+WTgOnExdGQG8MyQvnqG9baiBsKSiHbwcLCgkQ4PY5k/iDVJ8cuK3R1PBAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vf5/NbzF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtzhCEMJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24831606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24831606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vf5/NbzF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtzhCEMJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8NNug3485726
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=; b=Vf5/NbzFckgIDw9m
	VsqvR3HDMlTjgkw7l0VUPY9u4e5S13jBuNjqRxzdCzhAtqSC9gKLyhfGqx633Yur
	BS9opZcTtSpFIHiw7Dn2mcALKsdmfc4MXGqYNpio+zTi5v3dicw5UvE2Un2SlQtP
	gSgsItsKlqACFEPDFt5m5j898YxsY5jOWqkWYyKD9jMC08AvLiLXbLqAM/dkLXj7
	+vx1twhvhv28KrB/Yzbu1Ly29bB2Dud2PWUDx/qa3J9sUzcoli1yo3KQCt8lRcAg
	1K2AjWLG/mariazX6pOvjA9nh5IqnT3sr0KrveXsU/3vw14MXxEPut5DRciObH6m
	bif9Rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1n9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:33:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso96254385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485229; x=1793090029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=AtzhCEMJMpyfvrrLeIdeQXRvcXZivcWsBn08uIlh8vRANUuu1aIEvydRhlqPccJe6Z
         /6Ev8yEvbXT+YLi+LseFVYcR26ceeJ6FF2hiSZLSSw19qCb+/g+QjN5H/fcy+F5L1oPu
         ZDZg0hj71CXUDk3yJjvsNAyFD6DRh7rQXN7zy1Y96cd0PX05+9rGB6S1BsZNsn5OAir0
         evuLk6/gw8CHZEcZnKlxC5hfGInpo9YtqnAx8s+5wobSyJ5ZBMgbwVVLWzmdllFcg8/t
         Gx1Jw3OtgtWLPtgd7V9cpeU0qpO1qxR10U6/vZUFoFtvvAb4+qQSotu7zUgn8QBFLZ5s
         dCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485229; x=1793090029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=HG5+CZOZW00n8SiDP+34bDAEEmxgiJx2q5FSWWzxPZhPBwH3VsVQTbJu3ELgRfwFo4
         QH1g0eWZt/ebbAOUN9V6yyEJ1M1+3pjpfRW+T+IAtQYhDH4/cF+vcORV4u6XjlM92cLU
         FLe5s2keGKAOjj51DSaCDDXFbOfyqw26pxcKq18uNaOdzRAdoFADe3zwcWxiqC5ixJMJ
         xN4CgDzHZ6arfKi6/ETgkKe3pbU59+yXgUw1k8vdL45rdPQmldtDzwoYl7zoqV19dxqs
         k/6lIfQ0oP5tXZy7xouhUCtQKXjvWzS5bmLyjQrmfvIgxBi7n4/1b8c6K41C5ZMEmM+r
         /elw==
X-Forwarded-Encrypted: i=1; AKwUvBy4kJfM39v9yzdEuoY+fqiRDNUBWFo3+k3qQc85CkOe5nyHxS4aE0TaAWwz68zgOurIhnSdESNPAPQr65M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAMHhCpfmZ0ufnYxG73ohvE7J6AFahePw34Hh7CVeO6y3kV778
	FdyPzg3l4FB7fzx6FnMYyKFXA7J/x0HQq0URDrtZdQCdl2UBU/R36jTds3mmEoDEvUvW8wLSTjM
	UCz4Cp/5IbECcF2HXFLOZHFJ4FjMD7jMTJNs4LlcYDF0ba1yDezU/ka8TQRY1Xq1diYE=
X-Gm-Gg: AYBFou3SC4geHwMqyZDBO8rBLUcopSpqNl4PYk2Y/40B1nYZOB6mY+Hr2+4Sg4P4Bu2
	2FKjb2EoZN3F8g+uvdMD+7gK90jMkuAWOLWkO9OZCv2niRV6qNIOOxEs+34ZG4Gtyvf/6TsjXh5
	WWu9PgzjJyEisZwPWiRkGdP5XNfbg6h4K0WD1abjjgwPvY+jpI28sHU2vfUpGmg98A/XV1hD69L
	PBdpI8aZ9JrGWWzXEGbn2lkNraTNQyC2lf23p20oVkvHoHZQtU0wYlu8JZTv5PSmKOybFMVgSvN
	QHqxWDNaBMYb3J5HiUIgkILCjgvIsutqqz6sfznwlXVuFiSE8y/ZatWt3kH1trCX0AVSNqT53di
	Wp2Esk8q91Zhve4UKHZGTsA==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876114685a.2.1792485229466;
        Tue, 20 Oct 2026 01:33:49 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876094585a.2.1792485224147;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf123sm456787166b.14.2026.10.20.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <da0ec4b6-db66-4419-adc2-9600d8cc5793@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:33:39 +0200
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
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad7276e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RaLkOdssimeRB-vWfmoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX24bqB9WPemy/
 JA3guQ2F1Hp9Bb9lLXDIwmGlWHy/esRAnXXP8ehp9nRqw69m9a+ufk8KbTh2eT2WeQF+T4cg6tE
 g0bTsBQdfLrUdmIxg9BhM3hEQ2H2zrs=
X-Proofpoint-GUID: Vajs8y73xI0iiChhd0iIhOa0PURe7hk8
X-Proofpoint-ORIG-GUID: Vajs8y73xI0iiChhd0iIhOa0PURe7hk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX+w12R4KmW2Nk
 cfi1l0lI8YDdNNo8Z3ZpRODP6e8WJ5vx59dekCPm6NeivEKHF4CPEXCphn+eVSap9CPsU/CnRnJ
 ycX8B0xy1LJSqkYnTu2qx4pONEtk1ICzQWXQVMyyN5CO/tGNjYY7t7klzozbBTRS0Qn2X9F56Cc
 kTAsqBzYDCqiuZzFnA5oX3WVKBHHAlWmhDQLwPl6KKu+Eu6PH0Mf7OY+yC1ivOrl52Ne5FZ056w
 fCbe44rAJbRboPpmueo6MlAs5lA6Eabida9kecJqk1x7AwUEi4upPpMhK8uQ1GSIJ365uDR0sw2
 /BromaRMKLs869il0WdGNmw+L0f1+dIasKyepgTI7E+qWeSKxtwgLvqAhcUflNWZoMwlXN/azfu
 NUdk54VUPy2/aeRs/25QmXLgF2mEinKEajSjJrv+aETPEwYGwH84fvtQcMA92ucGjClegN+axn4
 S8ICS4vv8CYWrjGF0CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
