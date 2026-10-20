Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491049;
	b=obPuu52rnjBlTQzARjGc7oM+TtaLAxfAjTHUQbeXlu2uHyYrjIpgVCrUiXRfGerVawfz
	 NOSRzmmhsBpQSQ51gIHruaRrMv0jPC1yofIXWDOAIrjedc+XfbAeGmZa+1zTSBS3r9V8r
	 Tc4+3LBe0sv0SkwSwUUiJsXcPT5N4Or6K8QSfP09AW5oD86HWTKk5mHcVkhJk1gUJaRRh
	 Hr3abXnrYJwlIlTHjPIOEimt82rrExW9+VRH9itd0yirJTGrAHVuXyJrYgWOfmoXNqWsC
	 kETW2SrU2waH9QDXXuAYM1GVRFs7MBorXzz0+rjpaCid2+S93xCs/MFcRd7+mYKFIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
	b=BzX0wOTk98kcuzrOMsCZNpFIEvaPzD4h4ejROXB3RG2ma/dll60iAx7l7HQpnGOD+dHv
	 kubgTQf1gDLGBQDHIhyWAAQM9r/du1LCxY03bjqXI/igME6gpgc6qu1+XSwJ3LvwwscEL
	 B2mar8IP3cjZJTFMZLd0TGWcTnv2OlwMKWXbRyxeei0iHpggC02XGS+bNDA6mTM8GSU2z
	 M2EKHS+48Goe3Moi844xehWW211qPyjuwb3mdTtR0TLk8Mq3TPsiIViAJu1qPL9fMuJW4
	 lQ2Z7xu/gc1hQDlBhlVDdxTOdXyisPCubuob77pHIbo+ea0v0rvW8U0oWHp68Sb/vDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bx+azzKj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ddJ30F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E160A2635
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3E160A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bx+azzKj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ddJ30F
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8D4Xe4033201
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2ws4735qh4wR/HsDhw2lJB9b
	z2bPEpAWvlil4rhqeZ8=; b=Bx+azzKjdEpWAZ29MxriNvuN/bpRtf4SUZlWdF7M
	sBmGqesvDT9x84K3FFggEf688tCYYfCBDIRh0dqL2iKUCw8wl1hFb8wkFcanZYsD
	tfGpZsuT8NiwfjTxiQxp90UAMaoDU7LOurdfXV6Rkt3OYwRZz+TdSQh82i3iC1uO
	YsxSiA5Jdp9Z8avezlbGbUFWiH3cbBIARD1ET8VAlaEdDjNBRCJ0iU/IHwyIKW45
	V3dSddkwWvDO5ExUlG4qnjLwu64D7rKSKDrYbK3MR1ckJkTWj1pgT1mtcX1HOHDZ
	50qpRgs5g25LIjdGIvIsIovUTAgowlMSfVnK1CggL2Kj5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9yam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337b591609so40541081cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491047; x=1793095847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
        b=i1ddJ30FBlnpMa3/PtZMQZtAr8t7fGAkTMTkn94NJsNkI48eTCXEiCj5yNO5e9aVAA
         I3/kmwbWuQjSAdsAKcwhPqbF819F8KA6usedje1bRZ+2YgmnAkUb0cj0ro3N3RjH9Jh1
         fpHusyqxaN5ftI6e+9axPFHbkWZH66+mTSyGw5N4cstg5HxP12QcXfLn/ND+BixoJTzy
         Qs84pNF0pYtoMuLA4DtIb7/tGSA/b9w+5LpFri8PE5t/h2OzkMzpnkk+DUoYYZzl6cbN
         ezDFTMIXeEgDIaEKnMwR/GIUCoHtfkIVdYtGpPZMyRIa7blII7jE+Dr8CM+3vFCiabPf
         n0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491047; x=1793095847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
        b=ZhOyJ/elJLtXzjUl0z6kY0yilQKpCBC02hIcFrbopoeNoGl/WB82wqTufpDBK+ayGr
         BLEX3SQvyU47bXPl3NOTVwHXcQDxBglnvo9RQAXIHIA69PLkdprwdWvLl+zt44ksl4jR
         wVbrkemx0TvzxQHVb1I6Hpr/9WdksTfJjKlZuIzjKYeRpvtGdahKxqB71Gm9uwk1XdXO
         2J2aTnK/3UHiQh3DgiZrmE/72TRdILhq05Xtq4AFyhiA+B+qfpLHrQyqwON/19Mw7kjZ
         XobuiKzDmtgah1rE92B/fg+9M1iOnG84jcABAFrj/hqzcr/JPP7EwV33LSSYrObG4NYP
         7uyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7sg68fNWevTAhY5KM0rkvFNgaHgpibJhhxsjC6a+lAphSUB1YpChpzYzCFKFjfY33Y1G4TUsoJKkFoyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaEAAe/ahK0NTiisKy0A3orpixiM0QYFYP5aPyc69uJbj288R8
	yGhgFC0Nh0gDV4TwwSiV8bx7ehh6Ox2D5zdvRcJvvECwToLkkmMI57IspfJawLJcGVVU6meWXDD
	//9yOqIVxvHQEqxfuMp+qPdyjHM6Euo/wH9xVvDM5F6zk30rGVLh97zdLoktDrIb28GBsoN1pno
	c=
X-Gm-Gg: AYBFou3E6Y22NyhzrNu6vfw0ZeyMaqIRpbioAtBVQdlwl3XKtXvW/gkRwGQtkULTvqk
	8YmwmBKNlfn2PSQ6KZLWaC459KQSNlWen3f5rq3KzxSoov21ChsJdMaBkqh7so1lGxwO4C01YEw
	ySMFaJtWlYCxnYNs7jeU6bKSphB6wlNmCXw0SQ+XdGLk5v5jF4P1QXa4VWLKHRdFXQk0o2KQWEb
	I1BN/d5NhS6tK+vpSvaoPGUrlWshgoraig7o85Wofn4Y7/Sgb5tRr359aflJPzlOBf31N3dSb8i
	SZ/EgvHGNLUmMyywFrj93u2A1NbZlelxJKgHfgP6Y91pSiOWp5eBnwUiTjceyova4EkfaXCN8Lg
	a/fDByuIJw6+JbU49v+INFsTZymz2/n/0CZvwq3i9f1EyDirvtJROBbXBRxR8ddx+79sSFcn/XZ
	r+eU7fuSyDd/Pn
X-Received: by 2002:a05:620a:bc4:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93f29dce8f8mr1810485185a.73.1792491047346;
        Tue, 20 Oct 2026 03:10:47 -0700 (PDT)
X-Received: by 2002:a05:620a:bc4:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93f29dce8f8mr1810478785a.73.1792491046763;
        Tue, 20 Oct 2026 03:10:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fceafsm2479209e87.4.2026.10.20.03.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:10:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:10:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while
 the PLL speeds up
Message-ID: <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
 <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
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
In-Reply-To: <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8LSRVsAi_Yq7G643rg_appClNIwEDu5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX9qmocfgV8/SN
 C4GTe/joZNDoPThtO/+RzH+HlU39rQ9WAlT89pGewQu99ffw9O3kke+hTCx2URoW0YlVyQUFVk2
 XiU/s8XKGmqL7OEpNTMy8KFEqCrvohu/dH98VOk1Spn7Nrhdb/5BG6kLX0cekESMi3nm9VQWk8N
 RaJCP/WnJPaftqsmVpdPb7LisAPVZdO4Wyjm3PR4Ftydv63RX7lX4pFRvjBOpViecjoJ9a+Pfjp
 UBnYhUrbROuPhLNbEM937gS0eBuzcaxSbllhy1vylmXpW4R+R913G8sq7kx5E/AAqtdsCWPzKgh
 NZ7dxiIOKn7o5nglmU0Ijk6s03rxKpUJcx2ym3XcY0Uxw9PlZcsyts/aEUMKP5TeMAu1Chaahic
 SdP6j9AvTYvuRIri+DL8B6IMufW81+oK/fJejDIud3s7NJSFSdVm3ujDDYIyFTWrtCUh+Fg9Yzf
 jzh5Octt1W67/1mNRfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX3gY93GCEJMmo
 lPZfayYfRag/kjJ11Nl+fZCogLnCD2X9xuVLhiu8H6hw0LXI3arr+5RrenLaMr1OOwEMr4NUJ8D
 NeeSoAz5fWkECPO801xIGfo3TZQRKDI=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad73e28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=et-XlBO-5GXiIU7lIcEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8LSRVsAi_Yq7G643rg_appClNIwEDu5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200040

On Tue, Oct 20, 2026 at 08:52:49AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > The MSM8996 CPU clusters sometimes run at half the rate they report
> > after going up between two frequencies above 600 MHz, and stay there
> > until the cluster drops below 600 MHz. The PLL, the muxes and the rest
> > of the cluster clock registers are all as expected: it is the ACD that
> > latches at half the rate when the PLL is reprogrammed to a higher rate
> > underneath it, and selecting the ACD leg again clears it. The driver
> > only moves off the ACD leg when going below 600 MHz.
> > 
> > Like the vendor kernel, run from PLL/2 while the PLL goes up and return
> > to the ACD leg afterwards. Point the SMUX at PLL/2 at probe time instead
> > of XO, so that the cluster does not drop to 19.2 MHz on the first such
> > switch.
> > 
> > Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
> > Reported-by: Christopher Obbard <christopher.obbard@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> LLM has the following comments:
> 
> For old rates above 1190.4 MHz the SMUX output is old/2, which
> exceeds MAX_PLL_MAIN_FREQ (595.2 MHz). Downstream does not do this.
> clock-cpu-8996.c acd_safe_freq() returns freq/2 only up to
> 1190.4 MHz and MAX_PLL_MAIN_FREQ above that, and pre_set_rate()
> retunes the PLL to that value before the increase. The comment there
> says the main output is what keeps voltage constraints satisfied,
> which implies a 595.2 MHz limit on that output.

The 595.2 MHz isn't a hardware limit. It's the rate at which it is
possible to start using non-divided PLL output.

> 
> Up to 1190.4 MHz the two approaches are equivalent: both move the
> cluster off the ACD leg and run it from the non-ACD path at half the
> old rate. Above that they diverge.
> 
> Either clamp the SMUX choice to match acd_safe_freq(), or explain why
> old/2 is safe above 1190.4 MHz. The second needs the hardware limit
> for the non-ACD output, which is not in the patch or the cover letter.

Downstream isn't keeping the main output below 1190.4 either. After
pre_set_rate(), cpu_clk_8996_set_rate() asks the HF mux for the target
rate, which makes mux_set_rate() set the PLL rate and then switch the mux.
So the main output follows the PLL up to new/2, e.g. 1075.2 MHz on the
way to 2150.4 MHz, on every increase above 1190.4 MHz.

The main difference is where the cluster waits before the PLL moves: downstream
first lowers the PLL to 1190.4 MHz and parks the output at 595.2 MHz, while
this patch parks it at old/2. Both are lower than the target rate. Following
the downstream approach would mean reprogramming the PLL from inside the pmux
notifier while CCF is changing the rate of the same tree, which feels incorrect
to me. Also it wouldn't lower the peak.

-- 
With best wishes
Dmitry
