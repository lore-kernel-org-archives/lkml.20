Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924021ABD7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942885; cv=none; b=NMrpKXrwQozceOEmOl8JGzcMqwO+aKdovgronGUm+cnBw3OGiq9MUb9H+a4P4+WS4bSMbiygMpvnKDr30rKi8wJTDxJS6cek6KWfDoZ5qrX6VnV+ZwMuVhlgQD4ADjec0Tvlyw7OOVdX1XNY6hlr5kgiiOPEilrcYVWwT79gi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942885; c=relaxed/simple;
	bh=pJPGBRk+cN1hQVyUJDNsHIogDvWgEIuloWQf73ADokg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFzvs8LmjXPAF9/oDcaUAXLwyVAAUPSLCaq/z6zefaozKj0qEJXEP/kKuMkY3L5L7n/DoUqp6f+8lFfc3taznnLWC4hhlZTaCAfAu0LAZXXe1uZILkvLDswIIenLw55G52oEPwHSy6+kesTg0cvBs9Kd/R7X47USl2wpsg3aewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juqHdan1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWPho7pt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juqHdan1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWPho7pt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892U4IU639490
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4SlGIdM3cTMUMV+JFnfbpS9d
	9pPhphCilaasH/UUBmk=; b=juqHdan1O+ZWqt4x4J/efiN15firYzahq6lj8bt3
	avR4jDDbLTtPrv2oGg0/Pd57mNmQA9LREbSrawBwTmRqfTC8yA6F3vyleiPyICVW
	WG6xkK7P2zazzbryJiTwaxwu3Qyw9mbTlbOugxeDxxAb1K7MR3P5EfkAih1Tasxj
	B8tkI9T2WF4FobAcLqcJbiiVFYKTiJJ0DdEqA2VIQ0lG11NYCU8+fqip6SedW2uC
	mpQhJFfmGRrGFRDfGWV847ML1QAmbHl9SlMWG/2TkYRwpZDLgdZaPQ7mHRYk4F7R
	IXH0J0pSIhcA0yfSSWz7g3XbqMvCG+N22fqEnQ/LL6/goA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqj9a4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:34:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db87f759c5so24797665ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942881; x=1789547681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SlGIdM3cTMUMV+JFnfbpS9d9pPhphCilaasH/UUBmk=;
        b=SWPho7ptLsxv5hBYwG7flFC+MZnG92KitWhxtnzZUpmt+5G5/j/pbzowF+ZaGNl59/
         Y3oXHKJcpO1lE717syqexi7t/ErC9WyN2cicJZXsWa49IE1oeFEqnMy/eDXHC2oNBQPf
         ssEtK0T9HqSBeicn9JFDqfMFWvIpGLSFWSddxNFa3lSUrc+EfLLrqUYQzH4q2fDhJ+I3
         ntcqobSF4EAk0qMQbaKDoypa1G8HVWRFuu9PHc5VQjdm92WVK1sL/9PbCIfGUzZlUGog
         xlBI0gSNvYjn6WeNWPVYm1PJPaPzsegvmZxbHOB0f933EYkWAPWkkYbVgbpPorOjvi0R
         fFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942881; x=1789547681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SlGIdM3cTMUMV+JFnfbpS9d9pPhphCilaasH/UUBmk=;
        b=PbSSpyWjy8TwwU5A446ErvQAecBtT0PcCwNs5olXKbfVuiHWjqP1ObSXBIblx1EIk5
         TRYE/FMI1VNLv2OK9zGOipdM+B0VcFfyi7K9gZFKP2vHzRwYhl2CQjw6OJtW8WK7sAxV
         fKv4W1maZx/uhOMgeNg5gQ/2Y1uL3DysTsGUBs/qH+9TIuG8j5KbmuTJXnSX7IZjr6gg
         pLLYQUbyN4t8whsDoQ+O0jl1NNMu2h1whSxJtXVCdiMZj0xQ1BhK0LCWoX+BD295vQcj
         TJzQUFPkHIEuKeMCbHnaN/l70+mjeZpH2k8eVTObOh7/HH8OeOJgKyNp8+5p+xL3sIkG
         ZeVA==
X-Forwarded-Encrypted: i=1; AKwUvBzvLTg4tcyLw7XKE5m9kW5YbETvE8PzZYM/sU/V98KzixKWNPA7XIU5QA6qbcG4DR+a7wz3Uw7qp0cNbLM=@vger.kernel.org
X-Gm-Message-State: AFuF++lm1vQbqrMwPPpip2kWWLb7YY7XUwJj9Zi0oJX+j9ZQa4fbvU8D
	Ezk6/zXxWuf8cg9cQoaajwWDA1WB2Gy4FV57aYXrlnyOu5lTOSo7d++PytLvRM5ou7tIguj/FRM
	jRaiSjJiRnBpMS6cB6+PYbHJfHvQ6jnTdcfE7xDofloZsPGVaX7NcqallNE9xxMYY4Oo=
X-Gm-Gg: AYBFou1GDxMxi+MvLEJ/qmjIUsANC5JybYOLKVwAA2tz4oYqslQt4YyIZpj0lgAFhF0
	uHN2kfoH4jWsk2GIb5jpgRKDx5dPrzac7os+hSzFVU6OjJL2ViY4A85yF7p7B2SY4mh1Sun8VUo
	KXixBXQUjRrrNanro0n6C/Zf17bNkHSAQVF46bO+aIpwGG4BFObxdPKst/rGgb2eqwzPBh98+8/
	qBeM4KnyzsbvcdqjXNPqu5jSRKr9jqw2Sm0NNGyYnMWQEJrW+yZMZO02xsPMvWNaWeUUAEi+Pni
	sulA3SjyAnm2xQN5fa0BtcanzHLiRoodz4cN8fKgW6hUO2myOLKYvXHZFUactbqsM5trKkhkY8F
	b/oC5Bgk+4YtnNu2E0zG9CBbVtAyOM+o3n0f9+dtkdGg=
X-Received: by 2002:a17:902:c1d4:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2db128816cdmr310682765ad.18.1788942881089;
        Wed, 09 Sep 2026 01:34:41 -0700 (PDT)
X-Received: by 2002:a17:902:c1d4:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2db128816cdmr310682355ad.18.1788942880587;
        Wed, 09 Sep 2026 01:34:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm47133770eec.30.2026.09.09.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:34:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:34:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Message-ID: <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4uxv3gMQHvMPT4oCVMf3aFnq-4MP2DQT
X-Proofpoint-GUID: 4uxv3gMQHvMPT4oCVMf3aFnq-4MP2DQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX2PTZIJnJZjQ+
 A0xKZR5Sjv+DLlAXLM/FR5S8vBGrVGVjbAq0uJ2xW9+erg2sem2nHPUCUkd2h1CVsn0an3x+vrL
 KFFgRZkuScJ9w/u5Bu9IQE4/bE/AZHBb03TfwFe0oJ7XDJBAJk+9gxFfYvxD2j1sfgNT6aRnYOP
 jGZjRou97HatPM/MtP8L1te9BCxr7ynlq4NdVyBUkXow3h2X3xrcdqxshmDKL43FG8IVlOoMPBB
 unrsdX4MDJT+/J7qcjxg2GBzXWBHgWuR6mIRKV12vay4coHVNF9ATC0KttFHh6kzrxwaDRs3h8o
 GfnEHcJ+OgEY2Q6Q2/t5WdMCp8mSJkoP+HT8xJOAlNyrP7LgLekKqpD9AxryZiSQGTC5clcI9oe
 +gfzhzBzPYoyZdbyyEgwz2El4trze9ko60Y50kIJGxqbqdPAZF6S/UGIrsqRldlySBKvH975UiJ
 F3LodYA0lMcmAJmJ8eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX4qiiRG72twxZ
 aYV5jkFecSY9ktEco24DOZqVZ/DAKE053dkmONa0Cs9A0Zdtqy1qlwYnFESGt2ZDgWfShaBii0P
 27vaJlH95cYKpmP+hsnBvsloneCp74U=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa11a21 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IoEm9MQS1YtAEnOBX-UA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

On Mon, Sep 07, 2026 at 01:56:12PM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers found
> on Qualcomm Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with their core PLLs.
> 
> The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
> been widened to 28 bits to carry the fractional word at a finer
> resolution. The existing alpha-PLL core derives the ALPHA_VAL width
> solely from the register-map layout and can only express 16 or 40 bits,
> so the first patch adds an optional per-PLL alpha_width override that,
> when set, feeds the recalc_rate/round_rate scaling and the Zonda
> set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
> lock to and report the correct rate.
> 
> The series is organised as follows:
> 
>   - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
>   - Patch 2 - documents the Nord DPRX clock controller device tree
>     bindings.
>   - Patch 3 - adds the two DPRX clock controller drivers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (3):
>       clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
>       dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
>       clk: qcom: dprxcc: Add Nord DPRX clock controller support

Hi Taniya,

May I ask to be copied on all Nord patches? Thanks!

Shawn
