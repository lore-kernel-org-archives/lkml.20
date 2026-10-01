Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601D4A0901
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842704; cv=none; b=NFDI+qmvSaSdu48eSvoDTKWXa/1vZC6xrNbcFseogt97r3m7gdNSGdTpc1gHVUUMF0z50AiMsiV8b77q52GiNoaEFcS8QPXSmFOkWNASgXh9cZvQa8h1r8gt92Prp6dzT3a2y6gotVaB/NqThUTVWYS/a+sufoCdl6RyNzXuNbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842704; c=relaxed/simple;
	bh=TCgyohw+AWQA65LOgmWJUJD1+H0EpH84h7CrghymCRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adkI1i9r51pEEoCJeBpS/Bm8VkjH1br6l+l8CnG1zlgRFK/MSlqGF5lRFTPu9su71gUo6hUy9sB2NKNgrKEkWPwGsEbeo7WD8biu+0ERS83LSx804l4y4v1IQGFA3Cli1Iy+UIqVjvpYbtzblUHbgHZ4O8y5+h/Q0SgaSe5Mvtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxsI9T1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSo4XEZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxsI9T1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSo4XEZC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xlVQ1661060
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 08:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+nTuG/oT3SPYUz/JTYbRb74HGriVI/q5a/7xYNgat0=; b=mxsI9T1nT6UlPJ7d
	L0toRWkWgqvu+yU2LqHbKXas54o3hi82Jgvz+ouaySdnJ0Z2ZAp6ceLZ6JsuWP+x
	0wOnOmHGTH+n+SOIJ8Soc2mOFvYW2zP3ns6ftqC+gwOH6DjYQzZvXu08WSgDkEiW
	jXk+UZB016MqQzTi8V7g/R0LnZWh24YP9P/56BH6ReJVixG+kyC7QVti9fqYKyPU
	IwFbWay9EouJHCRplPSzvXCR8AM6ASEoJk3yNxMXRF7q+z+iAuvreEyxnSMlG9Gd
	uaEH7rylMXhI0o0ZFUz9Psk0HnwSkaLW42ce/X496luS5BQM0pU8h+3/j4LJSraA
	WKUg+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pk7rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:18:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso113798585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842696; x=1791447496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+nTuG/oT3SPYUz/JTYbRb74HGriVI/q5a/7xYNgat0=;
        b=dSo4XEZCRuSlFz4SFaR2Y7uROn9zER4VnrtWZUmHh6XZYlZkH8MWaN34UOcL/tqnbL
         edsmVT50rRGtxr43TH5glf8F475hrDtDDCPtjs7qrbbLQ7k0TNoUXExVPZitjVz0MnfN
         UqZUtLx8B1qY1fsnU51DymaFxHXZ3Y5W+6uYGoKBvDiCEkkjoPr5Ai0tirdxbx4ztUae
         1XouzrIhOn45FIkTTg6+IDFaEBIP3UVzMJQ5MBS+8FiEhMwxJG4E/AVIR8oU0Wj4Dc/E
         0hRWSKJh7/4XrH9uj4DW+HOuPasL1tzcPVaWjJVoDZZtM83THdIaqekJu+15wLR5DfYx
         rO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842696; x=1791447496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+nTuG/oT3SPYUz/JTYbRb74HGriVI/q5a/7xYNgat0=;
        b=w/UMF14dlrkVhlOe/9uoD8fY0imAUCBiJUNNU9DKIKVL023DGE1EkSe4/ndBNWloMX
         J9kCDo9QoTaCsi3y3xtewCM6mf/0OFeg0RRxLTR7Wav38kPkE9Znx3L5qo3XinArI8DJ
         lowig4RrqMnbojZmgQ2v1tr4nbaFU6DqONEItQ5ihRUV6GTbvypKT0gdkOzeStCuX9gY
         lb0d/4LnuwHqTZxaWB3NkG8D/bX29xrMki/8q/ONAAj0qrzbKlLdXxpWlsPDAHRpjK4K
         VwfxP8SVep8ixshqyKo8n3cYfbrnBfjx19kYwIziWKEPwcQPb1TN/xN+cnFF3x2rfENw
         EfZA==
X-Forwarded-Encrypted: i=1; AKwUvBzj1zpNdYRxdjCczinVpvV9Jop8WW8samyRgcyr4a4tY9MN5B5nKcUSWGKMdseOigfgTTBuV9iOeMDsDHU=@vger.kernel.org
X-Gm-Message-State: AFuF++m9EgeALOSkfd4rEad7UMWY7JuykpuD0KKVa9lmi+PV4GlHBNI0
	al8xwERxrc9K+1/pkvTpihElxwKIJF2MGLWHj9QIFXrxJQVK1XyzB9O5i45VITKRPtI9HE2W1g7
	dc7vHwBkNFbVFEgwti7znX16rO0PnA4JzVB3OCCFEhaOt6thRw0dh+HCrasbrIKZcOcv/32Xy+L
	I=
X-Gm-Gg: AYBFou08o2p8LMtZx4aRtibHnDKuMB80xgYTcr7fd/yBX+cNkTZpDozef8mV7FQl7B1
	AcsyQNoTcKKO8i6b7nQYIjHQHl+Hru0II16IGj9ajffB41FjgnfrB/WO6zv79bnAjADv22OWnl3
	3w1wBgb089Y7i+WhhV7vd3udPqxPLUgIfyqgqGTEbzxGvLym8N/zLpiLR8Yz9anDHq5BxhKde77
	p/gYp4nXLJX8es+dxgnZzr1s3bdi/nljsu1CMmaneisjzbJKzl/v1MjF+Cu5RyP99XResL8AvCS
	zbLrW/5NQz3ru+GvVJghvaBioJslcM56RYnhoalSLwuC5NUUSspRa9LzIbVw3064cVUlyW332PM
	nb+0TL/S2HjMwB8KFwHLL8A==
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr736925385a.3.1790842696266;
        Thu, 01 Oct 2026 01:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr736922585a.3.1790842695754;
        Thu, 01 Oct 2026 01:18:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca537c3sm631601a12.15.2026.10.01.01.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:18:14 -0700 (PDT)
Message-ID: <801e79b4-f45c-4f23-8b8d-5ac301d77e9d@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:18:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: don't disable display PLLs in
 the unused-clock sweep
To: Jianfeng Liu <liujianfeng1994@gmail.com>, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
References: <20260930092904.5222-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930092904.5222-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vr5slmUEvQSQJ5EWo_jd8ndoUo1xOZ1A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfXyKMm2wbJk6ZL
 gmgNjLrpTk7Uyeepy0InvEUDJsSZ0Rkt2FCVs9BhuAqxoEu5nMf7leT98UMJ7Wa2MKGKsoFaNGp
 8xWRHSp8onLCqc5998gID0EkcosrHZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX9OwTMB3i38+N
 8p3vtIPeKHeYuv7FKOpNjj4+Td4vgU448zzP7dOnE2dTydYSU1NVhIF3KQOeQTJIQh9uMyVypSj
 1Quj16jvRZ13ewMSWYwKNZ/LPs++j5uR2a7Zc1sHObK2H5Z4cJoqrii6522QY0YweM4si7ItKUN
 /55KfKJ5SXmDRZT9bCqLowB2pOqocgFZEoFyoqwe2juh0nkw9P6Q+HoKay++dmvZx5m4L4x3gXK
 rL4FTKO5f8GSfavV37PkHtEs6q66XuT051MZ8zp5pEsUal5o5iRArysbvT8QKGnfmDGzNWx8R94
 rhxNyrqye2YFpw4F6tZfqCmFNQeDi1xZkEggHnXghtYDJZ5Dchf+OsFsSNjYjRqVPKtoxP7r18j
 zAUvds+lb5bS+shokOvePFvw0ynp/2HW9vzzk0eBLZ+tr4DsZvT9MyEG/xmIHnRvGXB4UyEhsHH
 //bV5U7/IwEE1jSA2lQ==
X-Proofpoint-GUID: vr5slmUEvQSQJ5EWo_jd8ndoUo1xOZ1A
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe1748 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=woKDG2bF4vgdl6vZBDkA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/30/26 11:28 AM, Jianfeng Liu wrote:
> UEFI leaves disp_cc_pll0 locked and running for the handover
> framebuffer.  clk_disable_unused() runs before any
> display driver probes, finds it unused (no consumers, no
> CLK_IGNORE_UNUSED) and powers it down through
> alpha_pll_reset_lucid_evo_disable().  When the DPU driver later
> enables mdp_clk, alpha_pll_reset_lucid_evo_prepare() performs a
> full PLL reset and relock.

Can you give

https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

a shot?

Konrad
