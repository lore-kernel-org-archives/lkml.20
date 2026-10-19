Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D84DEC3A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408238; cv=none; b=h1nw72+/810qrxVw6dGbqrsOm1B2JauIy+T6zD5uhoVTLmSqefmrYY+emLJZymppiE4OFFEbmukcpZY6rqGG/FyQg5obvy0svPHCQfT2Um5xh2Kj8CV3hD01cxIGv9YOUA9S6/4eSS12/i5gb8l3naqiIFlsGJqdKeIPOeBCLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408238; c=relaxed/simple;
	bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPjN6ZIevKCccD+lNaNWcDyNCmxCCBWw4spf7MnYQIBsinuQx0bPFuXkgZYxnsLWgMeAjonr/AU7J6+XG6J93SFJhwhTNy77gIz7iquv32aF0myM/fVWxdQPttmY8LouDL6WOSXVOMxtSvTeer8TJjII16c4r6wrK9MAIaNqHkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIvRQS+W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCVsiV6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIvRQS+W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCVsiV6b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Otkh2752274
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=; b=fIvRQS+WNTQUDsmm
	qGhbkBQxjgT2ei53rLtGJjs34jn1NgtcXRMimISptvqNAFANvFnG/mfoBilch3U+
	oUzJiR2s9MFaFVEciT3WW9f9yspFqZZ/c96u5P/I8UoptZuJlBN0yIWONS0a6YdG
	8M2XepF5mujsbIcAzggQOxq6jh/XkaRhduBdkPUg39RzaL0pbqlPuZeQeSm1VzEL
	zZfpNgb1V+ppPh9y7etWznBo9/MK3q2c/CUNbwRomOT2fS12O+27Qy3ery++wsq+
	3q1RIhxa9PqLtBtCS/Mua3wEjyMd+qsWnfV0FNcNW+0EkBxbvrKyMZxBUTpZdaTw
	oNljvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48grq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:10:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so34530085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408236; x=1793013036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=RCVsiV6bAucELPyea3z8I+O7mNMfG+HhkXN/TuI5et+AdSyYF8J6DN+ZIFaeLlAcli
         Vb7ym+hNwxzyE5mVDE6OB9g2NtzT/h8AwztvULdpwbS+lkX6J7xmxnf8qExsJqwtcsqA
         eJg0cM3ClUqVZf5J69X5gyvAhNMxqvhXtRQ6PL1GHnXpeUc1Gv9MX+mFdoNv/3jUaxjN
         MT9lNzKPILCxsJpv4AVZR+0PUsltec5thrAxeRiv2Zc3VagVnNBIjOCrjylADjjSIfr5
         C72l+2F5P6a1cynP2nme/ta2vssve2+RrpNzMeR6xcP68L9PIIOz8WYi9wKpsylZMnnS
         HNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408236; x=1793013036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=YiJL0rfOB4C4c7ChWzYSb4ijEiWj5YlxDQ+3SR5U2NYyRsgvLoiA3jJo1f8QIzUyc1
         4lH5S07YNkaLBC/qqtSOKu5SHWweaoUT6bp5HRXewo0JDhOOp8dxkFLAz0+alm1GGl+v
         GYKlHNxnTJnvBpik/1j3yv60EZeCCneDyFXrwbAg/+oHU5TgnTXW97/DFB9FV463QOoW
         MSv4h/5C27wvor7bQtfeNMv77xyEbZc3W0tHLxCWJuT8laEJ0Cd2f6KlCj26HrQiC2CP
         rYw1j+HW41REpj7LcbO6FcsRlo/rGR4k4kC2gAi/f8Z6jdcYoKTEMAFc8s1sZ1L8QV49
         WLQg==
X-Forwarded-Encrypted: i=1; AKwUvBwGDDvlXLRbgerT21WqQBNayccObK1Yc6KCJ2yVMBmpC21BhZjE5TLDLGK0AmRgJypdFyPVPWfopLbSI78=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5dIf8wI9Tyb13087EpI3vum0PwTfNFcEnPgz8qKUAbEL+EodJ
	dyxgGE8f0NEq7QrQeCBtGdDY3gswUxx8sBFD6U1Vapt04wQHHlXQDrRz7E3khEXgMuq0VzV7jjs
	f41mAhkW50BynMPPHY+3IDWPV6CB76lDxQvIQeCkTNVwwUy5t/l9HmmJ26YPcswyRz48=
X-Gm-Gg: AYBFou2af55fVc5o44y9RjSAtNWY332/xHAFmC02qgmzkxSR2fkjiSKJbjYFkZMF+Z7
	HWN3Yljgblh7EJgLpxneRvCP4reU/2GWZh3m9DWi+ALitmjsL9uHOwo9w9rtYM5R76gOEt1pICF
	7bPLA7u69wzMCnH2u7ieaJSTBdqYXTvAdXhhyhw6EFVUdmF0/hwVaoK5LqE+WnrJwykDL4U6gUf
	tcJQynnhaHWRfCwT4DNU+K0dS726C+0LniVgcRVQ6X5FIzcv/Ors+lK0D05+Mw/BGkz49T/rgyT
	ZA5TLC2JwdURc/CnNQG4LWeuEzlhEHqhy/HgOmAkflprxUWOVfo0gh0Z3iE0FNRSkax1x7omzfC
	zza1X+GQ5MzjgRpSWj7U+tA==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306148985a.0.1792408235670;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306144385a.0.1792408235247;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm348351166b.81.2026.10.19.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:10:34 -0700 (PDT)
Message-ID: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:10:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX0yRKz0mdEeqz
 6mHpcAFkmrubeV6Kfv0wYnGoV6vIGtlUMsaiYWxDT6DA+hvPLWtD8B1RAso5vdqYvgQhnk4ohg5
 pIKEB1v+pur5fhbgWfuokFq+kYE7c4h40UyypDYMN720824eOmdzxMZqRwvUeC8uN1gPLtyWleC
 jhN8gebXlLDNaMQ3sFdfL6U+DW5I2v9+YGRFUBTDAS3niQkrH48uICdLeyQOhbxFGnV0lY8KXXw
 aj6AZE2+G2vxLDFHlFHepBteIlZJ7mjZisvq98ZUC1H2kBO5Nr4sKCr293N2GVYGZHv/6f73Eeh
 J4TV1EqdyNlcJe3fGRkFAYlZqENmxRj5JECfLiceTH+sOasJeMtFvweJquXXJcmbnrcwRc+t/LR
 AjSuSou1nx6VkTfLGuZLkctFyvLRRzMgHbpcABkwryPu4PppUbxKU955aPup4YB5v7l54Jlm/3y
 tu58CWatMzgwcOoRXug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX38IDEhBoAXa4
 VoPMXAD21XkP1VSiQ9HItextGd1ehqKELly5PKvAGLjkgozYxIrtXI5KqR32AOKzcOd+AWh4Wnb
 T1jjqVrIRhCW4HXVJ+wxYqYUulfBBps=
X-Proofpoint-ORIG-GUID: GHzJCUc8PTmroamHZfpUESoP8uVph4Jo
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5faac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qE2Ob0BFYF8f0NDtHPsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GHzJCUc8PTmroamHZfpUESoP8uVph4Jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.

GPT suggests to register the notifier later, so that if
mbox_request_channel() probedefers we get a clean unwinding.

It also suggests to skip pm_genpd_remove() in the non-legacy
case, but the API tolerates nullptrs (although it does return
-EINVAL, but we ignore the value)

Konrad

