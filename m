Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584893;
	b=dIVnIJcVSxP07aWVqHCG2tBwjsN8lIPcBx868DT4V86ZwewA0LaMi0uQqFIRbMDBfnUT
	 WqdhOgrfN+asXbVt0A4T9AU7JBzw6llTWn33AB3jhy5mHQwqYP/KJp7uySOBkfNtxCF6M
	 2mqBO31J/DR9PRjrRXIaFEJFWryUcpPvRkyavtdcuQW8Ko+FC5hAWPC6RxwgfZNAipDCZ
	 8CMIWnFoTS5Nmqy07qIGOQFoppwQLRbohlkiqn/d8Ig1+/gCDVZhV6ShMP1ZP9D8YXB2v
	 g9mpDT2Ccb3Q1zztA/h7ai3FoxNgIZt2gjpS8r2F+90lFc++VBntQs3v+C7p+YLvBxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=;
	b=Z2mHp0hX8Ul2e+R/C5yDdh5+VGX6LXUeGpd0Mq6ukuVT6CFjAlh9+hfdNzC+mq+/Qdtu
	 K0+o9yg7mE4q5uq3990rtf8mBnSfl4O92gxmgZmfzgil+ZG4aQNC69v8gciKlOeGGcf8I
	 B+B/SibdY7tx8JHzXZwakMXNQDRC67e+o6YewNBwEePplT5I12KKJ0FhI6IrfBiTjDonG
	 Y2GW3Wmzc8TKAW2GeZebC13ge86INCZCWQHM8Hn+G1QWDHhIAsVRF2yBZaR2FLZWXhp+4
	 515RGr23XoGxgGrF8u7uRG6gr77oFci0r5hR5IJ46tvbWTYRS9IKhK3sLlzk85UfDjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CTICO5AK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H8uMcr5f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4336606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4336606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CTICO5AK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H8uMcr5f
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgBxq325206
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=; b=CTICO5AKc1/23NHj
	vRylIXMNZ2hJb7CG+7eP3MPlqN/vX2eOrIjmVYJZJe0/AV+6BWGUVaaV1qOy5Gn6
	P7hcaUCeFrXgZHOH1YJesgPwhD6B14b5vSMJbJeBoxY8tpXWTRRgMTGXUTkf37+u
	vgCRKGTFOZnDADPkmxN0qed4QtX7/9jtMGjVC17A/umLYGzZbYHVoAEhfWCCAYur
	VTTbzOejGz85bF4XCql73A0isRJEuri4JvY7Eaf6s+blmoUf9iUBC9cRSF7ibOfY
	Mx0ukPqGSQAWMjO1k1UaEGG1iDYe4npfQDzvUta9Ebg+/23F0n41M1kiD/TxVddW
	tc7rKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3v4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:14:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so18077785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584891; x=1793189691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=;
        b=H8uMcr5ftPh1U27LaZPyXlMpj2hLGenVMSQ4tWzNBdE3AqwMiaZjVsIlyKY5eIOVR2
         5GzE5LdQddXD8jxPVR0TeSCliESdqSnKtskgv7EjSHNBGI7slPiDp7X+4AmI6qCe/9Xr
         b32DdGopt1BQyxMIwNi255rLNRtE9n9raGmjIwuYN19UXaomyo/6FyPosd/sEphAxAC7
         9dodSnyKGu8/G6sS5QGGMvqSYOpGWPLaXUx6p6GFsO4zKnr9xLr2PEA07nFw4fECuPCf
         6ElD66gB3Fx/A2p0fasI9sWWisc/W+7VHeawUGU9buUl1T8aFk8OzYmOMmKre+OyY/df
         X8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584891; x=1793189691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ei7rZX4fNOALw386GDA8pu8nx/EWDi8f/9FWgmK52No=;
        b=YxvM64BIO07jDrgrrb0j+x7uc367zYVc6wPxXRtNUwb24239O1mTbskq1raavTgrul
         a7kjaSyCe2Rg5ARIcElWXhytKwgGINDf7Ww9HcBmtlalKmPDG1Qo5YHWU6S6PPopRl4G
         ML87K6zxxjyJAqUfkePY5QlCvEduu0YiNGrgXR6N13xY/44vRIlMCg52GorjAMi2nniS
         IiAeAQT61zMwuPFzQCKAsUjeGYULqsbOSKubLP5T4S37oSmQskvCb7DtNHWn/R6dChgJ
         G5B42mOweKG/gjPJszdSdiVeZcyps1ifCf/3uJ+zKueDPLj+SDM0zB41kE7WFj3v1niu
         tTJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwblVCHQoB1qQdE1phMU9X4Blekh8/uZubRttVhgN5tjq+U3wd2ateM9H+v0WwRTVRhc9p7GmJCWgqnp38=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYJFKbaEYLZSV/37ORXESkPbN3V47cOp0LyctJHewrlTo1ND6R
	ZpqLRHFdOheT08coWJSd6V/qLjXLnXzvjUBEcKLRyE7et6oVg8N7uVifiO6Vn4GdrDc15hkwUwV
	q9t0Xqs27uCU9vlzzhhJSFbHStBW7QCPS2CKniBgHIdsIcUoPIJ9fvoUYid0cH2+KfTc=
X-Gm-Gg: AYBFou1hKnGgzmWTCZNw5HjJugcGCKVfziOzcWyzrot40GeuqFE5u7Td6oImfCVioq0
	FOrEOJ9/uBSGXSb2z2GihDDsRLOU7Ce+Z65tT5zzKDbjzkisG1foXRS4m6Wx1i9OUdQATdSbLMw
	nz2icIk17+9ZGrny2bHJTvcv0NvyBERqyovnGNL3HpjGcGaCChDdBy881kj/NONcFXR18mKQckz
	4F6PFoDUQcLDGxcxFdAXA40sWSZP6lbFCc9IH4MlznlsSnH2aiPvVI+MrFlO9QfW+7MjIc9O9Go
	mXzIjnrt9y16buLFUbUUyQXDFbT2wUSaFIiOffr4KGg/PJ/o7KyTVah/NFIGZ96Pc4nv63Cs7Yk
	3wkyWIovouIwMMud8gw0Khg==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr440953785a.3.1792584890838;
        Wed, 21 Oct 2026 05:14:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr440949885a.3.1792584890411;
        Wed, 21 Oct 2026 05:14:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db05esm796300a12.10.2026.10.21.05.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:14:49 -0700 (PDT)
Message-ID: <5cee2997-1192-44dd-95f7-b495bd360b9a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:14:47 +0200
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
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: don't disable display PLLs in
 the unused-clock sweep
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: abelvesa@kernel.org, andersson@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, quic_rjendra@quicinc.com, sboyd@kernel.org
References: <801e79b4-f45c-4f23-8b8d-5ac301d77e9d@oss.qualcomm.com>
 <20261003140257.3790-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003140257.3790-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfXwnIX8ZN4hT6w
 LF1WjwAf8HuuVlMF/oXXbSV2V67jw5jCoP7A6PmNALSeM3aYk+KWX2IIEMYMzJHk9eASLQZbCql
 fMn5KEXZGMf58yqwyylOn8FtA0Ib4qE=
X-Proofpoint-ORIG-GUID: 4yhOJWfJFWVo4ljk36bCrkVujD_ndiUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX+aKdHSnsvazy
 mPoGDBIizv6FFj/hdjrzm2YBVZl+hH7llSqXPGi8srdQ6OxXiqaj6lwVFMCIgjs8awPZz8tJSDv
 7muCt1PYA3NpUKEbX0l/TCw0s2UXmhtKfzdVdznhp/lVgNl2xXjKuapyAMui7rN/94BBG7zIoem
 Di2R4pp+j44WVcRoBVyxESAAOa6Nd/hMTL0aCWOlX6nQqIMNB9Vq7u54J4ZuB3vqESaRJHiCj1A
 gxcfrjylmSTM3Om03UzThAx//ZD/wsg+xstpa/wSO4dz5jnywKxpfz71LtSNFG8z0wsphlAazwU
 erRvtxZHqY9wYkwjm0JIyyzj6/OaaaxVukj9KnRJMnAb7MG1p72O0WGtOkUREPl3NtKXvJArJV2
 g+iEe11BXpS/7eBQi7GevF5NhZt9gvbcqD9QFMI/bBp/JRHM+pcxYg37hgg+rfremgfRqzYXo3d
 KjcS5x2uMJiz9iPPe0w==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8acbb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=277PlhdCLaeriRsjFVwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4yhOJWfJFWVo4ljk36bCrkVujD_ndiUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 10/3/26 4:02 PM, Jianfeng Liu wrote:
> Hi Konrad,
> 
> Thanks for the pointer! I gave Brian's series [1] a shot on a
> 7.3-rc4 based tree with my pll0 patch reverted (the trivial
> conflict in the pmdomain hunk resolved by hand), and on this
> platform it does not solve the issue - it actually makes things
> worse.
> 
> With the series applied, the unused-clock sweeps for the display
> providers fire at 1.4-1.5s, which lands *inside* the display
> bring-up sequence instead of before it:
> 
>     [    1.381597] tcsrcc-x1e80100 1fc0000.clock-controller: clk: Disabling unused clocks
>     [    1.468038] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
>     [    1.468194] dispcc-x1e80100 af00000.clock-controller: clk: Disabling unused clocks
>     [    1.807670] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
>     [    1.808271] msm_dpu ae01000.display-controller: bound aea0000.displayport-controller (ops msm_dp_display_comp_ops [msm])
>     [    1.810010] msm_dpu ae01000.display-controller: bound ae9a000.displayport-controller (ops msm_dp_display_comp_ops [msm])
>     [    1.860460] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0x90020000
>     [    2.002334] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb frame buffer device
> 
> The reason is that the mdss device's probe returns early; the
> actual display bring-up happens later through the component
> framework (controllers binding at 1.8s, first modeset after
> that). The driver core only sees "probed", so sync_state fires
> before any of the display clocks have been claimed:

Oh hmm.. perhaps fw_devlink doesn't handle that case..
+Dmitry do you think we can make it?

Konrad

> 
>   - tcsrcc's sweep at 1.381s disables tcsr_edp_clkref_en while
>     the eDP PHY is still mid-probe (the PHY is about to claim it
>     as its "ref" clock)
>   - the eDP PHY provider's own sweep at 1.468s disables its
>     link/pixel output clocks
>   - dispcc's sweep at 1.468s disables all of
>     disp_cc_mdss_dptx3_{aux,link,pixel0}*, whose consumer (the
>     DP controller) only binds at 1.8s
>   - disp_cc_pll0 is still swept at 1.468s, so the reset-relock
>     lottery from my patch's commit message remains as well
> 
> The outcome is again a ~50% per-boot lottery, just with a
> different and harsher failure mode. In 2 out of 4 boots the eDP
> panel came up broken: the top third of the screen shows fine
> green/black striping and the lower two thirds stay black. On
> the broken boots the final clk_summary shows the whole eDP link
> clock chain disabled and unclaimed (disp_cc_mdss_dptx3_{aux,
> link,pixel0}*, tcsr_edp_clkref_en, and even the eDP PHY's own
> link/vco_div clocks), i.e. the bring-up failed right where the
> sweeps had just fired. On the good boots the same clocks are all
> claimed and enabled. The per-boot variable is simply whether the
> sweeps at 1.38-1.47s happen to land before or after the DP
> controller and the PHY claim their clocks.
> 
> So for this class of problems - firmware handover state, where
> the hardware consumes clocks that the CCF does not know about
> yet, and whose drivers enable them later than probe() - sync_state
> trades the old race for a new one: the trigger ("all consumers
> probed") still precedes the moment the clocks actually get
> enabled, and the decision (enable_count == 0) still cannot see
> the firmware-provided state. The original relock lottery remains
> as well, since disp_cc_pll0 is still swept at 1.468s, before
> mdp_clk is first enabled at ~1.86s.
> 
> I do think the series is valuable for the module / late-probe
> cases it targets, and I'm happy to help testing it further. But
> the pll0 fix still seems needed, not least because it can be
> backported to stable branches while the sync_state work lands.
> 
> Full dmesg and clk_summary captures from both the good and broken
> boots are available on request.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> 
> Jianfeng
