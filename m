Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074F3B5820
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140104; cv=none; b=fv5Sr4bUSWcsFpZxzWCKXr3l9uKMuEyYCClladQ/PndW4SRiMcobEms//FMqBg+qXt+tvQsDLrwnt2vVAO16ZewfWOsF88ARFG6Xbr/8EekjEgZjySt/gITJuICqpjto0Y5d9L0XEi4x5tGk0OPifgEdaV12pLqao2SUh4kVZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140104; c=relaxed/simple;
	bh=FgduxqAJN/4yXlRUpfXphtaB8HHTRCIniH9Y89dmFHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gA+qwwEhyf+uVx2InZK5RtE09Hlz/QZL69SvOdSO7t62VN6O4tzAIZ6VEmQTKSkhbVjA+koG7ekc2F5ZIhzaGk6LyVmw0775IfBHLgMbYHf8Rno3vufXuNus35hmMzjVd2PTjtxKvtGfHerC/Kpa+qh0nBKQF1O819l/bG6wWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRXKtf8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNLthHSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRXKtf8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNLthHSd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6MtD04126369
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQSYtoobwSrDaDZCgen9gvuu+ITWOfQ/PJb91VAnNlE=; b=eRXKtf8t8awd+75A
	hyaIANBuZnaZkDz7oEeO347KOb1tuaxti/WURMN78h/85zCOXKh8kgfcKOLJzdbv
	QqzhxLs0ZhQwtg1N2hS7ZVJXQdse96ITb2CwgCMRq3ZV88bow3vuvYZ6gWY8EgED
	9xnRS2LuOxNjTyuDXuh7LFPHOV73qvd6K833PpNqkk+rxYU9ANEqWil+Wn5Qkt/O
	hNp492YYRDobXbJC9EZmAoiK5BxVpjH4bryQmju5V9R4ECifgVd6mSnMHhh87KVz
	Z0oUl5ZhPgbrqDtHkJ0Ch0zafePOUuDscAirYYhAhszUzJB8SZNQyAtmuzlbwn8W
	vpSbzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3jy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:41:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338a4075d3so19593781cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140102; x=1792744902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQSYtoobwSrDaDZCgen9gvuu+ITWOfQ/PJb91VAnNlE=;
        b=TNLthHSdtjsHDbHtvlvwPHRsZltBy9osRRTiF15WDiiqfIyyVhTst5Wk0Hn70/PnUj
         //q7ByqhaxuC1fXht/NFtMNAhBbviHa9GpJqhn6IV14YTP2oiauJYBRx6Hy+bXBu8Wzx
         /IDTOWt63lYpvAYIgEpiJBcpu8khySG+v3s7CfX2Bnf6+5X9EU+tJqDcdUrmKh0Uo8Mk
         lXB24aoSkH5s13KhMXDNkDpgedb6NosZ/xOBiaH4LvRKK1wNWFpgPgZt++gc9aiXCnnm
         D860eajXZaNt3UvezFq2Tawlqt0UVEFsTrWr84s7y4XlLINNaEk2EPwLI6gvgoUBYKnI
         LyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140102; x=1792744902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQSYtoobwSrDaDZCgen9gvuu+ITWOfQ/PJb91VAnNlE=;
        b=I/ivoyOQ4idsiW3YmImWJw0cxuEKlldVzMnBsoOBZTE5N48tzOivPJmD/mFROagkLY
         Jf7KJiDOKutRK1g0Ht2SdpaoyMLy0wq7kj0+uJVKJM55+Rjc0yUdi8B8jH2ENji4xAvE
         6O4scv6eo93ukNvD2rSQO9VREB3VEBGCYt/TEciB8jbXi4BNGKmW6kSKZrlwCYm1TX63
         90j8cvxPjpkAYFMOdqBst+zIcxPsx9fPth6mJT7VSTlbAsM1WU3FxVYU+lU3hjdQXnj1
         ThKQRsLP4ZlT6ooj7qOUB8XaPUExnsModgTj1o47fiSoxLQFgs20g4JF1SEbqt+g3C7l
         XJFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxze82fTgB0g6LAcg7DXkhtrRed9608d6z1Oi53dz4KxitSjifMz5KTyDDTkz1Ff0lMgG/WsMguEKlGIa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj6YAwmsUIY6/k6AWt+BmSFnX7opoOn5xPNjgTq4C53b27JURv
	OND7xQ3Gi9HXpo7FglHrRphUTqVW4SMRDDTRT+ZccUSMD3gS6jslo6ipzHYYklPtnUt2nJV4YwN
	v+L15oa3idtMhy1wGuHfhRAAPX7HAx9vVgMP67uUvKXpsu98mgt8l9hwE+W5ShwWztgw=
X-Gm-Gg: AYBFou0Ma4MYGZi3xefydYwk/BOLkZ1aDnTJ19wdvdn2yPs+ohRbkLZGuFxJuup1Cjp
	BGvI9zx0d8O907drWLYisXP7NcAlw5TCodVBOGcBFVB6DVAY5/S6yOEymX/VxHeW54y5CYkChdt
	OBpCSlzXk8udLSQc1p9skdJlyaqHdXFKn4g8OgbLKc62yLAYH6LvZENXsdXlB5wW/7MZ4ymdUUF
	cKsyJE+CJuh1VlZKFY4BgOTvJrnbZJa1y11p7fSo2eI2sFiEJtBW2wcgLSoLLyNB1a85eT73PB4
	enzRuAj4KtrsUufUlrrLMLDoIL0KvRgGst2sL/vjV7uJq1SI6r/gEQpARbkGxWjInjHNwWarR8F
	4/SlIQ39+thyjSgOkQJB3Xw==
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr8708021cf.4.1792140101988;
        Fri, 16 Oct 2026 01:41:41 -0700 (PDT)
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr8707651cf.4.1792140101475;
        Fri, 16 Oct 2026 01:41:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40918c5f47sm52057866b.51.2026.10.16.01.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:41:40 -0700 (PDT)
Message-ID: <b46cd925-25b2-4e32-a878-10ace8561a5c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8350: Add CPU and LLCC BWMON
To: me@fromdisposition.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016-sm8350-bwmon-v1-0-562fe403bf6b@fromdisposition.org>
 <20261016-sm8350-bwmon-v1-2-562fe403bf6b@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-sm8350-bwmon-v1-2-562fe403bf6b@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1e346 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=57t5E4kTxQTz6f98750A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-ORIG-GUID: i3aCmxu9aCZ7Sn7G1tddpHiU0Q-1pgsm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX23U7d6+CpZ0V
 eI0r66y5kfvpORoTnkRZv5Eyrea2xHX8uBKgLOAeM/ju/GlPumm85wP8hm62Bv4g6UhCP7HB2aW
 qSpdFhQ3FGjduVdvFXQPfWcB5f7Iy54=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfXwKBkzU6HFtrq
 I9vTW3NchxuZ2nZcmw3krrCyFvmaISWFzAmApZ4QJlKZEERDumQ/BEOO/4J27EnfZI5XKy0N309
 nVEshJjNIoTnTyvSqPqzzqLDXftcLg/R2WsZUeDhlLfGVCZ+q5Nffp+oB76PfkA3k+hegNkcML8
 D4WdQZ0lL7FGc+4MPAEWlq3KK43EMsoiFBsRerF6U0ZJfn9qierkNwjAyyPyRpQf9gJa6x08VLK
 z0VG7agwFg0S9LdpSM6jI9F9fPTOKW4rgsQVlWKT981Iff8vZZeIIaS+A/vgxTaf4EkzZAnQBI3
 Q4K/5wHWzhGw49kCrIrQDe6HL3yym82FgmXpsa8WwkjkgL4WyakjVxlQZ5aDdSkEFj7EJdcu5zn
 82vvACmtt7yV2KMhGz19lT2jU6EzmniXGNoQpYHTDhgF/jMc+5acPiJxBB8tsCaplBz1+FsJl4p
 fxS9FJz14mtSnIuY2JQ==
X-Proofpoint-GUID: i3aCmxu9aCZ7Sn7G1tddpHiU0Q-1pgsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 8:13 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Add the CPU-to-LLCC and LLCC-to-DDR bandwidth monitors, so that the
> interconnect votes follow the measured memory traffic.
> 
> The levels are those of the downstream llcc-bw-opp-table and
> ddr-bw-opp-table. Downstream limits two DDR levels (5161 and 8136 MB/s)
> to LPDDR4X; leave them out, as was done for SM8250.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
