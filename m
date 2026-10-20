Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485343;
	b=rUU7oGdBvwUF3IdQqCbeA/9cE8GYnVBUE86fMAGfx0tJyeqGFwiClD9Xn6oSIsE39WMH
	 1aAq2Mhh7Vwwe/yQRakpJW3zQnzSmYabAgmgboTNHpRxNZtwCuHo1UwvlGVyUKnc/n8yT
	 TI33LF+DgDeswgZe9cUnyitmUwvXh8EsgVbt2qomPJoRHPRHFQV9cA/JZpXCLbmNlLXag
	 9Jwq1bnZyN5HpQw4zfG1ZYNiRXiHTh2uNmv9pZuzQPszUvc9hJshMhJ7mRBl3aD2Asl+5
	 5huuhMOK8u7FrCBiEJ7Pdn1VDAFx+9fyaL8ruJ+A8XIb2GwuX426keU1+a0QRoNlcPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
	b=pMlDvvdVeUQuUbLztCABz0DDLWYrwRBw6mVcN3cuemTZbe21rU+3GrXzR4PEIwTJmRs3
	 ufa4CIgL3eiRh19XBCzbubTgTjOHUd/EURcoo375hMs1lhnSWcKDDpayRKhG1LcC8i1tm
	 bx0CrArSoO+2hKmrScTpDtGtRp2yoCC32GymUbJr3waARr0bLCtLZdYSNx0zSMVruUajS
	 c/M/P2q6Dj1LYdn118vxPqnKR3f7VkUl1pHYbEB05W+mlClgqxFYKNTYK/u4DfkDn24+k
	 qMKkPupslH7aTxgimsFOIRTxlAewti2+GGyUm8g3SgXgf7I27WN3E+0p00miNVO9Gbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g7h/aEHm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhc+erN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E601606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E601606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7h/aEHm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhc+erN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8LDMq1211286
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=; b=g7h/aEHman4Gol6E
	CvpiHjeAH/SLbNfmctNUpdPbVFcEqKeaYquVqQ7tvJ81dTk9UuUWq3OwUZCfzwum
	Yr56PXCEuHp8SXPchbM7VjBTAtXEi8M8hNPRWkiIe/xjKdEZ7edA9nXHcuYO2leP
	26Ij0z4Iv4fFvJeoQ1WGP6iKglkKcBHQmVYCedulvTjgWQXw7gKFzYAx7HLGT5Cc
	B9EFiqbZ1jZnxpVloiLaBFX5geIjp/AKdS9d+IhbLr3H7kyTUibSpdXtvx/hQrMe
	WK+jv7Y4+nhN7d1Wdhtf+kEoH7zDz0CGAF0GYWDpzwg/b9KZZgUEbZUK164/+Wu1
	PyAdug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1n92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso96290685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485342; x=1793090142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=YDhc+erNuHoEArksnXS0nlFMR7Rh9plINHyZvPm7Nde8xlcPXF2Wmy/OoayrsvFJln
         E45w8oQhwjbvUPeUeP6fdr/ACsBkgl6G9YKgIriCvHwhb9kmWdX3kCyhGy9Ls7FR7ffU
         PKXOhrE4HtoCML4ZUTB8Zzk0NU/wUrvMdkcaoVnjUkdTh4vPwthQqvlLAFlWTbzMDI3F
         xsE7zFGrwr1PByIIB6B3nNhLsAEmMX4ICeqbXZybA5b6eMNfWuJ/esjx7QoXI3Z4DloU
         eh5wHm4/IDSYUCp5eStPNMVTt4S5gm1RzYuu7tV6W4i+wbXrkuElZ1xD40Wt5vyZKr4x
         4psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485342; x=1793090142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=FzFWoDslgbexUVwjIkQ0sb4O7S8SlcQwV8er2S7bNHC3ImfKXIP0I9ZPBVd7OiXkl7
         MwnRU2ITHR0otgzAw5TI5oOCndWz7Ac0PXr+XY52LfOySWTSvzyJQAUszIkTNVsutk4o
         Gjx94M3j3T1YOmDkqZFSTRB305MtfVRuuSMRDMkFeonh4GfxbmWBJ2BCOhnKAW8/eqml
         gqWlwS24pZpuKXxb7ETsuKwwYOkMePu/cAStiXi5f/TnIHhC750h9jfXGBixn44VABfV
         96ceUCv3ULb2Az4lShPv0rXsoA+YITMtz/VovgpYz54S+GO7HFmCR5DYf+FJ9iTghI0o
         YVQw==
X-Forwarded-Encrypted: i=1; AKwUvBy6nXZAjz+3TpkuB3ei1TrDY1ek6DTzGytwmAqbcO/mlLGWHJ9x6a5rxiFj7Y87UIyYpZH0ZzJjDNqTqAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbqxXAiKFJ3zY6J6/Si18cWq/xNZGQze6JlvmmT1kdAjOgBYy0
	v0F710ZK3SbvSfJ955aHtTg17ZzNJtRhvnOniHXmPJ1Gt7M9utYJF1rompkyJSe+2BkyMefrYU7
	YKgGMlxJU4wOSfrN+PtSQ9fCl12RBLVf7ZU+nID92ACEQydBxOv0OjyoQiyn0YEKWPuU=
X-Gm-Gg: AYBFou2q1G9Pb2pr7eCMxbfPBamtQGjwpUa7ViJ0FXSHBDW4KKxMRSu9FPIfMq4QMp3
	Y9mopUUtsihHsJz9MUJsEukyQ0ZdGVEbzyK75G8XM+YxGXxqBco2p6Iw8NKAqoGRLdTDimTqL27
	lqeLONPqWtHLR+rw29AnPFLUQCk8fN9Fj30PjmJMiWjXMt4Rn9ATvGiyEnAyMr/yw80EpO07XQP
	RAZrA/iok/Fj0Z1VFA4n2iNn6zUD7JIWOLnCSdQB601XW/pYUKqBwnXTPocKFXtYSpE5hcpCEFf
	Zckn4cevOgHmWuDRh8dj+OWSC2qc7+U1ifpttqfXxBcy9bkzCHYPPff/jop+1Ojgtd6SyMk631R
	U3MYrKL5+pGRIM5eYcc7z4A==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945704685a.6.1792485341357;
        Tue, 20 Oct 2026 01:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945701585a.6.1792485340917;
        Tue, 20 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm5053676a12.22.2026.10.20.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:35:36 +0200
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
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
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
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KYf8qjf74vl5uZ6TP2PgL33p6-ApV2jO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX0Pl3NotBbhr8
 nF8bfntqp9MgN7mUmJyoO9hR+7C54Rne0fI3s963vlKAKFMFCl116fBNAI+ust8KXyi1ZuKSsCf
 LdnaqnUP6/+KzHzDltgYFH76BSeGamg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX8a2KTgchNwJC
 7GEsGz6Y0Uu+7ehCAUmIvX6980oATqufTA42Yvkz4Z0c/LELI1brobWNluOtg3LnMA0a+lVj8oa
 gDJdLODEpKWp7QqMgoJ5eqw8T5h3RL8CEkhK5t8ldbih7I3rLMh0K5VabAXOwkn+aEWWj3DINz0
 1fwyOuk/s2r7ZQL0FMSUvluTiWKLTUPQ46uTStxUfi75jXmgwGgLUQZaGL/PEpLAYgh7irzZ3Mj
 mKXBqczrX6FLvrjNJTUm/GAgWsY/39d1CxcP6F22AehpHAQOh5PJUi6uHFlUD0D7W58yHUh52iE
 3WJ2gTzUx2FSdB1fyVDeYLdnal/wl0mZyxAd8ERA0d6cXrwYVc/+Ldf5/sBYgo/HBExXg/Zcitp
 jdfHd0V77hD6bJvZ0YnHqfLOSofaU2GdmrR8iU8tO+JuRUvqE+IldyfM/3gmPE3YURLXptWBjrW
 ouKu5uyUCFB5lcZLslg==
X-Proofpoint-GUID: KYf8qjf74vl5uZ6TP2PgL33p6-ApV2jO
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad727de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KiQJPOv1UjsmjKsQXtkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> cannot leave halt unless mmss_mmagic_maxi_clk is running.
> 
> Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> because there is no bus driver to manage them, but missed this one: its
> siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> mmagic_video_noc_cfg_ahb_clk all carry the flag while
> mmss_mmagic_maxi_clk does not.
> 
> Mark it CLK_IS_CRITICAL as well.
> 
> Note that the halt bit is truthful here and must not be papered over
> with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> silently resets the SoC.

Will the right fix forward be to grab a handle to all of mmagic
for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
a workaround

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
