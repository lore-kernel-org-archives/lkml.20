Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487054;
	b=PV3rb1/02R2qFM+AnxeT2/3wd+AoNMwu+0+cLm3EQtN5lk3grR8u+qJDvafxYT+v1pky
	 REpba4UEbaPYI/Z3SB2m9aTbrceZbA9P3KQVhCaSTYVkvNiDQSmqd6yruo/VHkZS1IWBG
	 M7A8Ujye4UwIGneGBrNzv/gXkXFoNsMjZo+ocoumLe3B5z3Cuy26xScrcd5rc2xcfG6s6
	 i1eCZdWey/Si03WwAlcoX8AJC7TmtGtZHwPo39WiEHW4MwH3ZnF227BYmnnIN8iawMgFh
	 G+fgY7+cp7YQjS7gmccOUvWkz6t5jdAwAOri5xXWn43awIbuOl/Hkb0qulKTsSjncPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
	b=MHl8mIoh2KfxOrsTm1wxysn4V7pFAceZot/PaRCEa46lqeZidUAGBke/TCX39PRwWaIn
	 no62tsLutlHBujXExAUGCfWa8amUdFmw9tzW0xTeuXCO1j/W53a8+rJtbhAFdk7o+0Zup
	 uUKE1bMWRSy4IvmamajBzcOjxDz+9H70mtxQ7nuU57abdckv3/ZVag4Y80KKCZQkhLw8e
	 rQyuVqxuTFXCDaRse+b9DvbijMT3bIjsPAc0rSkvCQwp56h6EtWZmW86eLcESRfI0qWss
	 mlorrPMFno3UVIpCkg3moNrOo/BBD3gojL//4EjmCsod75215LIghhv1xB1+rcAt7EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2265606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2265606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8QrUG1254226
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzX1TW2NwI+yWssGoHbGc+/K
	6ykZuk0NhVu5SB7QmUk=; b=CP0BhtAmyCT6JyLAkmqWdyIfIqbOfM4Nfxl5Nrdu
	KmRJTmyZosrBtw/iaRX1wdVgSBjVPmUIMVhWovX6ncpqb9k9WXXADINBVivRrH0q
	TbLtJ84eSTo0UiODkhGpq4usdA8zwPF8z83+bxw26VUz8YVWBXoT4OUEyYGJV6Hy
	OgFc1mR7lwPS/vEnfHXLIdHIAO3H+a5M657e0Cav7BGQx7B6qT0TPsmMJxpLhtty
	uuZHLlvmiZB+dNueEAJs3pxrSQyBMvj80JBx9FHzhsiKpg8dHXXPrNyE39DliMTJ
	Z3DLcT0g7H9c2ntNhXDqgb+0OGyskd802zcs65EcThsnsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9rbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so616473685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792487052; x=1793091852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=bSpvEH87sYF5X9Do9f74ghqyunqFSAT5x2b5vT7JYTeuCIK4yND76EmlHKuX1E2t1W
         zdLOmCaCEg3BctVhP6zkJ9NubH8p07JZ9b2DYi0qkUr/GjauUelho4ssezuiIst0asKW
         AyqeSqy+e6mGg+vjewwHEEH3igSEFtLtgvRwEBRnckY9aC2P13f1QywEVoQZlAWJToZF
         Uat9pTO+aVyo+JvJxYMkiHXYZw9F/qYijHVa9nfwZc0FWs0001yyhPS6evjhaLX94B9c
         nwG4AtYlpOachqr4KjTuycuMZTyZY2eKMz8/qUnZmZGWMfv0Y8MIoPoahAGcKQNZkrJC
         CWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487052; x=1793091852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=lkyBKkvrZfVbMt5kyk858flZBmlGpuBTzw6ojXrDux+WOgpfFSSrKB4Lz3EmkD9YWW
         x9exGq6K2hNGd7DGs40jdwInmfsF9vN3G0S2ToZCAplUsM0xQiI/kiyE5mUDtDoaxJA9
         fjERStfiGmJO8FNGcLffjRZCIv786ZgO7FkNHsCW26D+uh3W77uvlNXiwHej64qcGKoi
         WVi6MU/Xx8yHxiA/hhUvQuWGP2NH4JFZ6PBTrZWnqO3f5sxkKiMzoEDrEBLhedNz4KDb
         J6Sp0QObXJfBknvHWjzdMAVSvu4f6lF0LOkwd1nZklQX4AWTGTtj7qTxAScl4KmOd9Pa
         RSHw==
X-Forwarded-Encrypted: i=1; AKwUvBwavEqROj1B+uE2/IeQJ+4P3ThB++FdSlSNsbEWrQ8cgSAZnhE6L+OZyj9hmz4XMIgV0NrRMeNPRO6hLN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqk/K8/ifA9QeH/x0HxOogmXQrEe3rK0aclsmONJylOjaWYimR
	MLaWnZE5AgsxyMA8CJwu9NBVU81oAMoUtcJtAbDDCsPmW6Ih509yNfIo1Bgt1gsN+SHqLkdjV7Z
	sxceTFj1+KcpgZYNgnKS6x0mfW/anWEsCqUhQRcglve8iSBb9L3XjfvZeXHJr00NSVSE=
X-Gm-Gg: AYBFou3EPB/fMZ+vHoJ4ekWgW3wjZpOgYqG/MIaQSQpbm3f3BRHICxGNZjlhkr3VOft
	4QInkN6VXziecJhak21hPY8d7Wl+xS7//lWloQ6d24waGFK/T2HJIL4rURRFjFHudol8nyFtYqz
	Xyq2YZZwO5I/ywBLboObT94Mou3No1Jn3ZoyCOq23bnRVZzc6lHXegzUdWeIKRChR8NQWgKwA/Z
	nPUemfDIzOtTqQQmkN2QVU6OO5iugHaSWxOA2v0vo1WwsCN0MHlwm4VzwzBLDmMjJH6aT8sqrZv
	QNo4ZrE8U/uA1pZdJJ6MedIP3SIoWJvFCZQgFjFX2F2CiVy/S2FEAenkbv2HS/V3O7cWgobPmAE
	vRWZs5YcpXQP7MHHjvSH8PMy8FYfLMcs0J6Eu3a7y8VUd5PTH118uQDcpQEUb1gPAASz0lTc0fE
	5K/NZLwo6ckeIS
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724721985a.2.1792487052071;
        Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724715685a.2.1792487051406;
        Tue, 20 Oct 2026 02:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2531830e87.42.2026.10.20.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:04:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:06 +0300
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
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Message-ID: <vs77pfhgismmyrx4ftmsrl5hylwcjpxirnjdw46c6wu2jcvczl@4wbizp5p247u>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
 <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
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
In-Reply-To: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: krD8Nv0DKkHFEbSnUVAGCqwAg-6E1lNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX0xOi8VMrsGf2
 D0szIxQ280iATqZq+IkXcXMZtgGSEJsHyfxRkyrKv/8msQzRlPI1BIwc+fsusiQW70xOcoSs66L
 cgcH3/QXs/j+Fk0rytPjDUkQpqsmvraiwlxSdNA1qFO6t1W1DJG7+wGXH7wwsivj+5LoihpEZdI
 ibNH+i6MyMsQj8+kY9ExeEaeF4UhkP/B70Yesbd61MIOab+/cfbTebB0jfMYjkgn0MBC4lMmTiu
 7fPDmpDalR+fs5jD83MxMOO1dG5PCt0LHTLLmME6U+kHtTZWQHayzJU2FWEZWpjgy9Uvp53nSFD
 0ScoO9w9KKnh3dMCADuvIz+UPl3Ix0/JatpfP4mWgpWjQANSrfoSAlwTYcI/dMvi0Mcqzlt8apY
 oABkiC4YsbRYIbhjrZIsqLFd2b7+O8+gjAlP44RbG3moVAyIoAE3RpRFg7Z2+DnsvoLW325PdIK
 397NCGNJdrZmFo/DFGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX+ctkRpwYPxtR
 j1qME1+JbfrnP6xGnVfiIT6XcOqMVtFFF59Ec2mRbKtwcg1/RmQKpYejFQyKREYxibTNVZATWl3
 ioqNKg0Rqz3VwCZSt3A7lkYC93HQKRE=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad72e8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_XvO8LXBJ3Q0iDersrIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: krD8Nv0DKkHFEbSnUVAGCqwAg-6E1lNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On Tue, Oct 20, 2026 at 10:35:36AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> > ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> > unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> > cannot leave halt unless mmss_mmagic_maxi_clk is running.
> > 
> > Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> > and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> > because there is no bus driver to manage them, but missed this one: its
> > siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> > mmagic_video_noc_cfg_ahb_clk all carry the flag while
> > mmss_mmagic_maxi_clk does not.
> > 
> > Mark it CLK_IS_CRITICAL as well.
> > 
> > Note that the halt bit is truthful here and must not be papered over
> > with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> > silently resets the SoC.
> 
> Will the right fix forward be to grab a handle to all of mmagic
> for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
> a workaround

Most likely. Some of the clocks might need to be removed from the voting
model at all. I'd say that it's a separate set of fixes, possibly
affecting other platforms too. I have it on my todo list, but it's
long...

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
With best wishes
Dmitry
