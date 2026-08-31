Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4053D9DB9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180276; cv=none; b=MpNuN5yMG8T3DnzGyRq4U7rL5JHfJDwRCxA8ZQkPNMuUlfx++nWmhaH5GW0ba1cd2n6q8uCfFw6t9oAvMTdwRnKqu/IHK5Qov+DF6Zmepm/plgXkHVfBZLhsAck+lC4FbUuF1DYnX5+yavvKor9EcCDqSczbuDG/03sam7FuOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180276; c=relaxed/simple;
	bh=sGKmCuPxmyzFf98LzZ0RiPxg9naiQcwiPcV/ZiT557M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X3pnv+x9G+b0SbMc+aC/9HYHhfDXDN/PFaqAJVb56DUrBH0OA7x2ya0yBoPTjOo6W/8e7z4MIt7yzKnXNyoNORq9mYLhIW5gk/XY4AIeYUkSbw8UQJ1LuWspCxpyHUjcDlK2Xsy8NQnQ6239RRMIVuisoxEFnfvwnr5GCqghZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7ech56X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5ogYWrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7ech56X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5ogYWrd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA7lY3517869
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=; b=Y7ech56XXcnYBjKJ
	XAfsW9r17NnlDFeItMBw/Hs5A+cBW6miseNOuKkYKnZaJvn8wlVUWpOXeEVApqBP
	H8rklCW6t83ZhK3Pfxiw/+lhP5HQHio6TxDpDB9ygrRzaMD4r/fsYJevak/Z6xeQ
	mCrK2+Mq7+PEWla3ZzWQzbUc/h5wmxu0NPGVJ7k0I+rbVsWY8YAijhFW4OBhZiTa
	S/Fjd3vRND7gln0OjZKQxHR557KXVfF44VGQ+lLWKUhUR+r4VU82YfvGP0bpwiAJ
	Q/EOV81aNRBMw3WJnPGzqtgQfEIDHZ2bptyKhl48DGCXyvPAqNyuc7zGEqJ9aWYh
	Tri+aw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h90v9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:44:30 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ec3b429610so5314509a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788180270; x=1788785070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=;
        b=h5ogYWrdTJ489POzUyggKmIArkn9Tr0ZySvmML3pm/jhUogjLQQMy888/IsYL9ximD
         SAKYGneG7uyK6tR92gT4I+RfBav+uEjI44U9kMQzi4gn3tebYrHUh6jyXTrnvvuGkHSB
         i2jguFzmlr6MDc8RrNlWoRXpezPbyzkJu/hMPJbkjHWur9XdiZ0IAxji3l4/M5gIJsjR
         dKegXuD4YMJXeuGYHOm4hYVxizhZ/ALeFa8zZJ4ZGbWEa5XNXEwt+rBFaWe2pqeoukUt
         LXCh0w2GYiytWpFDdC8W2mPRCoEfirHUtmFNPozoDdciRE6/N4jziZ/WIO+HrsIQWI7x
         PeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180270; x=1788785070;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=;
        b=rlm+HVV1I5JyA2kQtZVEST2uV2GoHdBQsijHRe0GPoQuwSL+lOpFGcdf50Dyr/8D2S
         01o9jEV2qNrjyiAK46CzJeNvkCrUHZkcMgOGQkbNETWJxDx+HplwzQEJXXbKn9olP2Kq
         IKSeBam0IvGN8srT5sZknhjMB3hPHNqEMOuLiUZ23WvEA8aWfbDh3ccTojjsZ4Oo+48k
         yOU0eiDBtbeVwclXbvz19tfaR56LCbpsrba2VGcw9bqLkPEqnldp4BP2c3QhTl2bFNyj
         oNNT0Spb1JGiInTCPAm9WT09fZMyfFtQ8LgBOi4V0lqUYz+S90R6qCJ1IHGP+EqV/KgA
         /lOA==
X-Forwarded-Encrypted: i=1; AHgh+Rppv1GTdyJ4ZCLFk09eUwqO9U9H2hOprDiK/sv4QJrfqLFMRS0QCligjqcIk3VW9zTgdCOz+LUYAvtES48=@vger.kernel.org
X-Gm-Message-State: AFuF++ntEknVsW/TfjdLNcqLWmN8Vy2bhsU4la0jCS3+dSIPs+YrHfaJ
	ldOp2D4oANTdzaHu9vHCcjPEw6YKSFNGvcxhgtrLevqixuEM4I+iV8lBpQnQNg+tqCxXhBXHfgw
	BLvIRp7OQqCZZrs8ljAtu/MVpnBzdX1SBP7uJkNWmrX4RBc6cVFKradp9MDzzwkSa7ow=
X-Gm-Gg: AR+sD12WJ24WXrkuchXkMVPXmzX8erx2T6X0aqf1n3zfQ3O4pBelR6NySmD4hKuQXRb
	nIPkJ9m2cE3pe3338OvWUEO22Dl6ukikM84MiH0oamBoxnzco4grsHnN5eNq80tIZWYTtVkUigm
	JZrU9IemuIPv7ouk7Hr7owwHoJ2FDMU+Dd843QiS2LvE/N97FJGf1/t5yheKMCSsUkqWKItUA/o
	wvhSTexuwYFv/qKGsWcDlqFadC9mBcrNK5TnwnFtDMT2dktkad0IbAYRUwD+vWFcNHo2l4KsH1T
	LGxEz00CSCsKZp7/kA/lHBif82NOFxTf4iNur1OXC2KJTFqWBFYovKbnKbrnMXYrOu26sSVulnW
	nzhe8ytHrMdC91QmtfErsL0Y69QL7
X-Received: by 2002:a05:6830:7007:b0:7e9:e257:81cb with SMTP id 46e09a7af769-7f6878a21e5mr699798a34.7.1788180269642;
        Mon, 31 Aug 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:6830:7007:b0:7e9:e257:81cb with SMTP id 46e09a7af769-7f6878a21e5mr699765a34.7.1788180269258;
        Mon, 31 Aug 2026 05:44:29 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7e92c1sm8011113a34.8.2026.08.31.05.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:44:28 -0700 (PDT)
Message-ID: <4f8a2731-4ea4-49d9-924c-ebde9fc58170@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:14:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
 <ajLbyqELjduwbKC_@baldur>
Content-Language: en-US
In-Reply-To: <ajLbyqELjduwbKC_@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a95772e cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1-MWVyHvgWiywHnngEgA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Pt3fQAGU-7axfrUGz-V7o6Q1nI2ULmJv
X-Proofpoint-GUID: Pt3fQAGU-7axfrUGz-V7o6Q1nI2ULmJv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX0HG0NDbJJDWc
 3pUpJFzU+BMW34ao2OEp91xAyxX92Q4Mz+SOg0E7GpfzzKWuWf32t7DGfhTDZOsck242R9ZQUY7
 Sh+X9zGfyaSdaIkPd0d//MUTh5Ff/IU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX459R1j63DeJN
 aYPuWMzShMkUsiBZxnnvBkpQNyHlMhkWScjWhPBykapd5Xk6tzF8cwH/K5Tg9KD3drFW6SK6cen
 SGF0Q/pT4yD73te4WsuocwX1cP8SjayJ2GYXYrNQxen14W5pQLTjMgmFWZbTbZrRLC54yct2Zu6
 1gZEORfp1zAuxZ4r/p1DTIPAi/UGm6ejZnE9CVjVf5t5FjqOE3M4kDJF2JRSflgSW8VTXd9OUwf
 8n2MnwzKGNDv2/ZpawOJOG0WsBExnj/8eRauIj24RLGGCQnuMIuFpRhGDxSaCkfXctdtKACQFyR
 nLRWTk+mP4YoBvCefijQ26URxvoNO1R/kbPuzj6GPXqchCnXgVJs5DXk9oYjcK2TwstG/PbR0M9
 9HIcOma8XDYl5M1c9Na+zJuSYtRpKMbj2eYGTVM3TFXkyl28xNOr0rODasOs6cxnQNgj7vUlYa9
 OeCzwMQj+QeeCDug0Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310110

Hi Bjorn,

Ayushi is no longer with Qualcomm, so I will take ownership of this patch
going forward and actively address any questions or feedback.

On the Kaanapali platform, this panel is already in use, 
and the regulator range is configured as 1.65 V to 1.8 V.

The NT37801 Specification v1.0, Chapter 5.7.1 "Power On Sequence", 
specifies a VDDI operating range of 1.65 V to 1.95 V. However, ldo12 
supports an output range of 1.2 V to 1.8 V.

Therefore, the regulator constraints have been updated to 1.65 V to 1.8 V, which is within both the panel's supported range and the regulator's capabilities.

Link : https://lore.kernel.org/all/20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com/ 

Please let me know if you have any further queries.

Thanks,
Arpit

On 6/17/2026 11:11 PM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 05:51:09PM +0530, Ayushi Makhija wrote:
> 
> Here's a link to "v1":
> https://lore.kernel.org/all/20260323102229.1546504-1-quic_amakhija@quicinc.com/
> Which makes this v2.
> 
> You also ignored my feedback.
> 
> Thank you,
> Bjorn
> 
>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>
>> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
>> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3837f6785320..6ba4e69bf377 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>  
>>  		vreg_l12b_1p8: ldo12 {
>>  			regulator-name = "vreg_l12b_1p8";
>> -			regulator-min-microvolt = <1200000>;
>> +			regulator-min-microvolt = <1650000>;
>>  			regulator-max-microvolt = <1800000>;
>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>  			regulator-allow-set-load;
>> -- 
>> 2.34.1
>>

