Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8744BD354
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888491; cv=none; b=WbJStMgyVs6HYDeyv3XAHH+fZN5OzEI6ayT0wgQKnzJbSE1GcAIG7LCh6Dmtjfi41+xfSL9UO+Gs2nnlEMKpNC7XTmwVWkBB3bg2fvR1LrNyFHkWW+vDjmu5d3nC0xup1PtEjUKp2GkuahA03XcNYbZg/HrbTnIObdCkP+zeAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888491; c=relaxed/simple;
	bh=q1oblOkj7poDWcSWwGH1w321C2ZAr0bIblEbMz1G2zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxuCfFnQPMOR0yjHvLJ9EtcvNcf1gY6/HFyBdGLN50TwO+RK9G3u+EQOrBwJ4fRjzXmEl1iEf77EJCyohnHDQkHJaZ7m3sDBAPrn1eA3i6RbbVYtKWFMH9FYz7TTSZsSmAsPGdIS97HwxtjffJ3iRa9/bS0GKe1q4O2Rj1JkFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBIb3KVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKxYEKyO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBIb3KVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKxYEKyO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQom3054805
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbbCGSENzLdyysmZk/G8+58k6DjLr1RfZM7tBsJxVt8=; b=MBIb3KVDJqtoJ/Eg
	quVFBkcmi/QlZ2wREGTMZ2u8ktO1FUBPFKD9WZhIsxadbEUVD4/Azs8DFqylZ+vr
	s++CvBUfFAhKfWV1JNTRcXpxdB+Ewt22/CcNeWKY9J9rH+0HEel0DxuPzsXQN9ma
	tyULTsiANaCXHEeSllz0Kzs7gRCN8pMFasoMoYcU/1iqrgEY9Sf+UdHFStcrHNiH
	yezUTE1/SYm1IFDgJqNxl0qwvTBfIb0Js3u07/bpCpW+LR+QxIOehdf01i8GK/Nf
	C9e9us3gQLxW05yY6RR38nJO9SICIWNNEw/QzwpDa+2LdqfSPLiNQfaBcGB/VHNY
	9ianzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuvr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:48:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5351b6bd8adso8148141cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888489; x=1792493289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbbCGSENzLdyysmZk/G8+58k6DjLr1RfZM7tBsJxVt8=;
        b=fKxYEKyOXXzIHJPhVQ/hkISaGiYqKBtYs9oxnxAmRiNb57WOLhmm5ULxPkDG/WQpw0
         jYTRzmNjzJfVRex/iIUM4CaYsFCQK5KnHCU7UWbciwwAFk/l3sCbJ/KYys1mCYzRuVFL
         sUk4kEHhjIbKh08ht4uYB2UZ1SLSQ5QHsVyrA0zjYbAjCwiMfag563Fht8o/sVk7bx+H
         mH1VYS7Z30R3ICZhIOEc8CnzbxLyEUKmEtbCKrBtS11IvyFzG9hTLfuBpR1H9Z/gKiiH
         ODN0dFSp/nz8+HPwfdZ3mcP6VDCdr2LOt4Q2T8YItBsTsZatnIxRp8iStsadkGvfoVTa
         8log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888489; x=1792493289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbbCGSENzLdyysmZk/G8+58k6DjLr1RfZM7tBsJxVt8=;
        b=GAt8+nQ/DLIM904pumYyeogtL49ic2u4Zxdivw3vriIJmGJKFFUlFRiv2LzPcL8tkc
         ZDOz6LF1oL0rdBhcA1eeVTGayqLeapXGJfVzdvA2tmqmG12tDARNt7FkVv3j51xyhg/0
         eXkA1zJclqXSaAOKLA2mv//1gHtMnPU0UcatcFfJceXAG4yZE3Hc5xGO9mLaQVPZnS74
         CrZsDN642FQAX8CkSUmqTqbeZma8VqDXYdNQPLI4y1L1r4l5tL7e7yZq/POKGkcFvA4u
         EE3weMvbhvdPrbcwoz8FajCcCMuSu2qNgaGPTrbjPCceuVy2s6C2kMMbseN8x7KZq/Hb
         P1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUsCEEhslfrvlwDAIYIqvpyo0rSvZ3MEUAZEdLv4XccefULYOqlwxgOgiX7a+KbUsAvSuM9n77+zyRjl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiVgvR/ehhAK9sUPn84uXaWHlDhDRfKSKrG7mrMCQeppwZvvWR
	dOFFEBVa4j5P3ll8LSeWOfA4nTU7Y5CMcb8cUVI2DioJ4ZPcDaGK0Vvn9b7B159cAIp3y+GZpA6
	WzW9SdMwcJBMlklIbCMoskYkoGRkt8FP2qSQ8NiQqe7E6U/iivG3toi9TKWTfBTSl3Gc=
X-Gm-Gg: AYBFou3WYf3LUUdlwXru/XFbjJmCzGUr9JjB2BbLtsx4SN9E/yUhvFWIySgS34RtIuG
	4itOyYmtCJc2TSY0ofJ7shjY0U+e1LHdd+xMVF61RlhDxWNUR7paLGgh+9RWqULL7XMkLWX/hEA
	DdlyM4DLDxy5b4f0QyRVg2bpC4Ytyesj0eNYZksOhAvEyl9lQDI/z60GliPfdEIqIJq9J37kqUq
	flWnk8no0QLXz13cq1mQ0Aq9wb5okPHk8JpBarP2ibcj5vl793Xa3paLsuETp+LNSH/a65N+CFq
	xivX3E5dkDOGGiPuQ2GoGE+/N+N/ORYdNSLapUkXGJliD4Uwl1RiUKFSrJecM0HPxPjdDoou6Cr
	gYI5VsCvkTnHzEVuzceooGQ==
X-Received: by 2002:ac8:5453:0:b0:535:d603:a454 with SMTP id d75a77b69052e-535d603a579mr70468941cf.4.1791888488510;
        Tue, 13 Oct 2026 03:48:08 -0700 (PDT)
X-Received: by 2002:ac8:5453:0:b0:535:d603:a454 with SMTP id d75a77b69052e-535d603a579mr70468771cf.4.1791888488058;
        Tue, 13 Oct 2026 03:48:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766751sm572939766b.12.2026.10.13.03.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:48:07 -0700 (PDT)
Message-ID: <389ce112-6a15-429b-a8d5-84149a6ee9c1@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: don't fail ACPI probe on a missing SE
 clock
To: Rahul Pon <theflyingrahul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930111627.1121-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930111627.1121-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mUkOBPuuhRJ_a3KDac5niEitckCLYKrG
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace0c69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=24bHpHeKglZJ4w0ReRYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXxXcb9CaQOw9t
 J6NJhO/fb+7bQCJhdfrLEHk7RCc8DQlMCjTIX5+bFKLRzFo7M22aloff/YSSgXfaEHR72swenc5
 VVzKLZjHp4C820ANQdBTHs/+uF2ns5k=
X-Proofpoint-ORIG-GUID: mUkOBPuuhRJ_a3KDac5niEitckCLYKrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX2PYmS2QmvFyr
 O0+f+6e4RW9Cds2l4nQ9JWle15VVrhKl6h/zcNMV3BiIKk97qHf/LT0R9MBbGGtF3hzjgNwQSjd
 fJtQlAVPCBaLpmdOVHg8aQEFLcMzsDqg4jjcJGDCnGdKNetdYymVuCaGInErhqukjXvoBaN/qub
 T8jxJQor0VthxMbENAPTEF0dXwJXYJvlp+00r027w54sxnzUA5UYjxOsIJKg52IlVBaX4PN15bO
 M2q8KtNbIhZ4eQbcPCqpxXRRX9fbk3cxNyQU4FyDwi8JxP8rimK+l3Hg0OHAPoxrS6ZWnQibOWM
 4ggvhLxgK2I0AdPclHIK+OnbrRSf4n56wAS4D6a5rc2K7NCBI9tBkiz1s5sTnnG4RzV+vsfAqx3
 Pbki6XGfqCT5MZcBC/BYybRHYtdm0bt4Up+bvBWGot0n3QlBGPmU4y/BD3mp4oFcvxZoP2fFzVi
 APVg7TjarmfyOUURllA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130042

On 9/30/26 1:16 PM, Rahul Pon wrote:
> geni_se_resources_init() tolerates a missing "se" clock for devices with an
> ACPI companion, whose firmware manages the serial-engine clocks, but then
> calls devm_pm_opp_set_clkname() for that same clock unconditionally. It
> fails, so ACPI GENI controllers such as the I2C IDs QCOM0220 and QCOM0411
> no longer probe. Before the OPP call, the error pointer left in se->clk
> would also have reached clk_get_rate().
> 
> Treat an absent ACPI SE clock as firmware-owned: store NULL, which the
> clock API accepts as a no-op (clk_get_rate() returns 0, so the I2C driver
> selects its 19.2 MHz timing table), and skip the OPP clock name. DT
> behaviour is unchanged.
> 
> Found by code review while bringing up an ACPI-booted Snapdragon X2
> laptop; compile-tested with arm64 defconfig plus ACPI and W=1.
> 
> Fixes: 5b8a39dcf909 ("soc: qcom: geni-se: Introduce helper API for resource initialization")
> Assisted-by: LLM
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
> ---

I think this fits better:

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 5d524d9a7373..70a3bf64ffed 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1350,6 +1350,12 @@ static const struct geni_i2c_desc geni_i2c = {
        .power_off = geni_se_resources_deactivate,
 };
 
+static const struct geni_i2c_desc geni_i2c = {
+       .set_rate = qcom_geni_i2c_conf,
+       .power_on = geni_se_resources_activate,
+       .power_off = geni_se_resources_deactivate,
+};
+
 static const struct geni_i2c_desc i2c_master_hub = {
        .no_dma_support = true,
        .tx_fifo_depth = 16,
@@ -1366,8 +1372,8 @@ static const struct geni_i2c_desc sa8255p_geni_i2c = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id geni_i2c_acpi_match[] = {
-       { "QCOM0220", (kernel_ulong_t)&geni_i2c},
-       { "QCOM0411", (kernel_ulong_t)&geni_i2c},
+       { "QCOM0220", (kernel_ulong_t)&geni_i2c_acpi},
+       { "QCOM0411", (kernel_ulong_t)&geni_i2c_acpi},
        { }
 };
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);

But I'm still a little unsure about how the clk_match logic plays with
lacking a clock. 

Konrad
