Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445872;
	b=Hs+VqB2BAGhpbS8yaDi6ynJRxHa6Lk+xuvs1qWN2uSuiCSasJtvZfKBFmy0HNtbAHN86
	 JFtKHOdMlO0sV9lMusDT2BUdSkeyqve5pTjy2zyMQ2ed8opVvfad/mNqsCLLK/P3jKgy4
	 B06Iu+EX+Fd+fEGUX81f6Jj3OM7SXpn8992ctFL9JWnCApLowY1qfjfILYibierU8I2g+
	 e4I4r7CXdNeMPckZZXbjr9kpxoTS63ddytGCdzWZMjR3Lo+ZQe8vZ4mI+XosuNXVpkK/t
	 KDp+lwSgc/w8szXsNEyKnMJDSdZmkVmWp5fQtu0hllx+UYCpKoe4l8JGzDDXXIQqtkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QmrHElBsf23IMUbwK9YHUtTfXyB9Wnisafg9C2Jpagw=;
	b=OkcyU8sx1jnuVFoBkI2OqpHNR74r7P4hPjEu8I557Z3whRdoImQPpIamK/iCqGWYwFhr
	 mf34kyBKalj1XkU72sI1sqrkFPyFzALrqIG05GtQyYbFUUyYvuV6l8Wfr4gDsGBEbEKA4
	 v5yugHkmpUU5YneYnrVA/sWEOOgFCev9vYhgUO6g9paTQLzX3Juf1N8ERb5+qb/Y8edyU
	 4aRPyMsQDP29DZREP6uXjz/Bf7geiqyqBegq3UsOrtYhbI2U9C65tBq4LfRfDXeFGBars
	 Ofl8ivQTHfQYkZvm1jdDicALSt5yFdU+GtovJdCNoTaU3YIkX7+shhN04hnj+8TsJpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KXt3r1WY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXZmDXUW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178A606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6178A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KXt3r1WY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXZmDXUW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaL6p3098210
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmrHElBsf23IMUbwK9YHUtTfXyB9Wnisafg9C2Jpagw=; b=KXt3r1WYwM/ozZZL
	Ay7X1bna03Z/ceKESF3colMRSF3IxKL1iW2kMg6D9V8i9pYAApbObGZKvVfhPvjn
	SDgWKYRaPRptrDd1RTvsZG12cZAxQ4a6ku7gl5lGlKnOa2L4S94KvRYXi1CcRq1n
	5T94zN1qm+HX0v4SyTENGIY1HghsOfRP6AmmqWbhmOQ9ySE3Nmf48aoKlowz5N4m
	2xD+FuaWWiwQBak7CjbMJF1qx7yFArdnf6u0j2X2wT/2XGdPa9JITB6Zwa+2xwir
	XFxTVBsue0t2VJclAbm9ACypiHoMgmHii41Z61NnsfkDZzlK1eE9SJCzGyr4zBKf
	9MMD2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawmsb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:11:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso261922a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794445870; x=1795050670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmrHElBsf23IMUbwK9YHUtTfXyB9Wnisafg9C2Jpagw=;
        b=bXZmDXUWo0WuBsS5DkZPCcFvT9bPNWGXwTvu9wMrthjD5EptbLqVzFQsIbl6SzZ8NA
         L3MjFYFV2B4FqxfY9FxsKdUV9t3sm0oLQzFrbnJi8XI9TPSg0WHpdsSiEPgm7lp/2fr0
         Q7xnCAR8a91nurUhIr879Y+ot7IDtN41boB6Om0FDgulCjaX/qj038W03OFqTjIbTP1A
         Lt0pBO7dk0DC93uEvDEqBKaagJnIalCOkZgenw1KG0M1IDreE5iEoOlpwwNpXMYyqJ8G
         j07H+i5TJg89BlKPhrXIXkINKrYDsG6N6rlEvJQECrVt1+mIQ8t6BQSWWbzJSRz3NY7u
         zKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445870; x=1795050670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmrHElBsf23IMUbwK9YHUtTfXyB9Wnisafg9C2Jpagw=;
        b=LTKBOBUhC/o+tSGir7zf182KGRmgT8zSmfT4GRTEEQSKcVLyfi4xGQAQiX9KcyR7qN
         10ZKkqQHRUGs9A5CQh3s0RONGdTcvCH49AZM+ZHjJQINivNl5BiaMtAZuZZAcul4PY0D
         swMvjGY4sSdhf4LB86gVilfNNpkDGy24Bwle/48yx3Xw34xI+0iAc3LyLveokd5ZiDqP
         RE8G0i61X9o5d3XsxMDn/FtDPenr0+/Bd0Sx7JwOxJjsUmxWAG/xrvAe7whdOfjVVb6K
         PWgbe9KEVDKky3YC3wziTtL0iuUpNPNKVzFLrYaLXNVG0JMXghSZUZi3EHXFkfwB6lX5
         HzxQ==
X-Forwarded-Encrypted: i=1; AL+hErHWju4wOCcuDJ3I4PsY+KxzvhqvVmZY13qxWYC5C+7niOYfDQO63LptFGn6nsKdGm08gLypzCr7IsdbC2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v53FIR2QNeJnM0XMiM3s+pU5jnUgDRgqYfpYPLSCc3wjIILq1
	Otnp0LsEGuEB4tkuNKC2RMroY5N8eSkzT6/vPe7PNJMG5i7xtPr/JscOyFV3Ca2qSA8W9RurSXX
	a9cF7ZJHl/h9OAzoXmW8ixz3wNaQ5dnwwP1Dq2LJF5hoXZlCHHqy+VvKHoV99SDwNUt4=
X-Gm-Gg: AYBFou3I+S4IFoyIfLge3g/knxf3E+N8tBCZs9DMaAhmiX0XXJ+BKCsYmhomBmcyD7x
	zMrT1os5zqcqtJdpoufqe6ZSE2a4v/73YcQYgaF3nrO+5RPIvrJHN05STV/B3V82DSIQKhIh1i/
	RqFNz8kCkRXD28eji2n0+2dwE+hzajxrFWNBoRwWG5xcjXubcsf19v4TRqXtDcu0VrA5Posnbr0
	/qqxsiGIV1K7hfUQqKoQylAyLMlrWhcnab+tOqsdH08VY2NHI7T9+x0U08t85r8RSAL58kb+3yB
	oD2Bn8mrQpEpAEO+miYHk7piFi8A2qsN0mIQaxeXFroOtMZb6VVrtgpSP+dIyf0FLfzKXnof04p
	fwIT/ixWwTLGRMSQ7126FNjGmcfAIPWmsSY53w9ZS3P0/O5QmxlWJiemU6E7PlE1H1WzgIvT1QE
	Tp+QYeBdSxMsZnmAi645PLSBb30SwMDg==
X-Received: by 2002:a17:90a:ec8c:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b197c92162mr618434a91.10.1794445869823;
        Wed, 11 Nov 2026 17:11:09 -0800 (PST)
X-Received: by 2002:a17:90a:ec8c:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b197c92162mr618411a91.10.1794445869284;
        Wed, 11 Nov 2026 17:11:09 -0800 (PST)
Received: from [10.133.33.225] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm1599325a91.11.2026.11.11.17.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:11:08 -0800 (PST)
Message-ID: <0fa09b92-3855-40b0-af6d-2c763235b15e@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:11:04 +0800
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
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261110-gio-framework-rtc-driver-2026-10-12-v1-2-e4164178183a@oss.qualcomm.com>
 <20261111131424.51869-1-jeff.roach0@gmail.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20261111131424.51869-1-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNCBTYWx0ZWRfX7Atk4cyoLBu+
 FebFj+H9bRSNT77tSxn8cBEuHQzOzy9DsWC/TLJaNwFqQB7XIWL1Az8BZbygdpJc2wPha3liyfl
 uAtUeE1VvIlam2xpEgUBttP9rEbgkEs=
X-Proofpoint-ORIG-GUID: Or4v9b4w1UohFCpyw4g864vzVV0RSVS1
X-Proofpoint-GUID: Or4v9b4w1UohFCpyw4g864vzVV0RSVS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNCBTYWx0ZWRfXw22hCCON6ysS
 Gyq9hgReHHZlNIfaoS4v85OAjFAn/Z45YLtnNpw4PXpvDsotOUHTtuMc1UA2IBcXawiAW9NKz6G
 /A1z86U1QwFFqEhBi061nJgLILLsxOpWPfUuqEGSKUJangnXfryFi26/jxgsBJfvYbOFtkdfsoU
 T0Wr3IHU/G/qF8ZKJK1hs4CvEkKJJSqaXbDAA9TPVB0hOKZP/4qPdtgJiZhsEqmPXiSb9ELO/BQ
 EKzMu0hT/ECIMGABziK4OJjKECd24L1OVWL8oR5b8sT0siOKAJtbOs+jB4+NuRV3r9lVPneroE/
 x5oHc9HhA3I+DEP7bCm0+eK2hEDlhGYfLEst8lS+Nel23C2cxt6t0uRn0Nog4NEMotwEwltTT8C
 kEVwedzyXx3T+5z0+cJiyewOyusgJdKt0N5J8+Iprm45yvF2Gf9Ik/++p8TAznoWT1L0NRUvkeO
 dzgJMoYSdGRmLCk1SEQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af5122e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Xxzc40YL-po_xb4s3SgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120004



On 11/11/2026 9:14 PM, Jeff Roach wrote:
> Hi Fenglin,
> 
> I tried this series on an HP OmniBook X 16 (X2 Elite "Mahua", DT boot,
> qcom,glymur-pmic-glink, 7.3-based kernel, firmware F.04). The RTC part
> works: rtc-qcom-gio reads the correct UTC time.
> 
> But UCSI breaks when pmic_glink_gio is bound, although the commit
> message says ucsi stays on the legacy interface:
> 
> - pmic_glink_gio loaded at boot: ucsi_glink fails with
>   "error -ETIMEDOUT: PPM init failed", no typec ports.
> - pmic_glink_gio blacklisted (patched pmic_glink still loaded): typec
>   ports and partners come up, plug/unplug is seen.
> - Same boot, then modprobe pmic_glink_gio: the RTC works and the ports
>   stay, but UCSI no longer sees any plug or unplug (old partners stay).
>   USB data and charging still work.
> 
> Happy to test a fix.
> 
> Jeff

Hi Jeff,

Thanks for testing the changes and reporting the issues.

I tested with all clients switched to use GIO interface. I confirmed
that battmgr, UCSI, altmode worked as expected. I should also test the
hybrid mode of only having RTC used on GIO and others left in PMIC
Glink. I thought I didn't push those client changes so those drivers
were not impacted and they should work as before.

I will test it this way and get back.

Thanks
Fenglin

