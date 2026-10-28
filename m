Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220803;
	b=0K+2meedNh9AX05S9WzqgkBqhHt2P/hu2S5XoC0C6cJPmIWgdBRCRutRCNNvUess3plm
	 cxotb4GFVyLsQOJSfmuvsOB0kk+ZhAwZo3CsUwJm7ijd+4wGabGqjdoVd5tJ/HEdfQu1F
	 2YGuMS8xS9xypf3cBdKO/xTKtN9TsFhF9dOlEGT5xSeO0b5bkOjnKbEIy/LGmPbPEFBsF
	 yxKFnpNeRMvir08NCHg/jomjobjN9le07IwifSCz3gT8Xn5iKcu3b98pg3w+4M/ijzuNu
	 /ALJm/ofcCf0VKzPHbxgFhRR9vdDBG6WP0NP5cvmOMFYYeSqeQr9Vxt0JLYKObgUpSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=;
	b=bwV4z4helvMdTz0z2o8X2zBLF/ax8T+6Mw/DUjoiIAggX2DvAg3UwxpQ5c9bAHbTWrdE
	 sL4HPfpL9gopHyr1zCiGjeG3aYnkARAHSmBdc0KtXx2sXTGM085obGXUJlXcG2lgEQzSN
	 wHi49lmzHnVBvzKzaTZVZ8niOoU8/EWNCwmz4qTQJl0zpUey+p1r0no1rzYc6khMfyS6G
	 7qlmtU1FS/385WbPXBeLgl/JNMtaeqm5R2i0c8U7YCztpfB3Ekegxieky6ZI7pksRhOHN
	 kU3WjZqeO8s2xlQUuu/6nqIMUvv0KKR3lzlvc74VGKt7PlmqS+9Dn0dERaobiN+eCww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZGd+AUG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXSce0ts;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D5606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1D5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZGd+AUG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXSce0ts
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPIex2995031
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=; b=CZGd+AUGG5FYlgYi
	WPFz46znG4KOED7sG2NZvn8FMa14cfExsEFcZd75edwjxP3mZRiK31XHy6m9xM7K
	esfFnYoJx+6nyMrxOVoKrkKI5XPOXXzFbzXdKnQ6TDsUBNC/OVeKOp17nFXAjUVI
	dkUgPxgO6ZRh35glVehM+9wItK1csJeSPu7irfHwQf1ZLdfr6X9OqlpZqKrKSj8j
	6C7EU1x86bcpk1U2bnU+4gUrJnU5mjbkwoYbmcc9BVJi4FdQkHD7z+skz6rTt1tw
	CCpkZt+/s5yfOZLlnQwlJd2L0fg/F+H/WCBlnTbRiwi6LS/V1V1J/erKz1NIQDuX
	Fw+AfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurscb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:53:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2502293eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793220802; x=1793825602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=;
        b=hXSce0tsVpkHeG1IFwhrf/Uf7P8Pte0xnMJpospxP3K/OzliEJ0GmxloxAkD6PFBZT
         M0pUf9mUXXBTBoVHRsm/TZvJI0SvxahTIcztzt6ymNoST6j/ViXLDpyugmkeAjctGkaI
         JEHqNM6eyQs01LSsb7PvWM+tAFmbqpNu4W99LsYdhTeZGtMA4D3RyF91OZQkBM7n4YH+
         PaxmVLNpSEuWRAXvJwVEvPzxRCHud87CcCLMHTroXciJBb0rjzpqp4YBM/baXkVppFqc
         k/Pdp2EMWP1Q8AGtdqc23R3qfCHebaRAYsgZc8O03JtSSazQ2stbGU/8Pv79L6lRPv1K
         JOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220802; x=1793825602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqZBwE11J0t99+Ss0XjuV1OAcN2tykgCPm1UI9MOnHk=;
        b=KSK7QM6YT1OvLfYLF1YVVqMbGOqPGco5Nt1VgUe1ppA9OzSO6B2GmZtzn9osy6wERl
         VBFjcAbYfSZIno5yR/62c/lDb42SNLrnmIbKWkVc+sIqwzaRCX8aFrOj8o1gl++BvOgC
         /0Ht6UXGJDlivHomqLoYcf8P6/mQXOT08atmaagT/Unk7pG4NGG/n1qafTLpzTfIMp4y
         +esisIO7gBrErRUv3bq9vhmxYEchmolq4aqmg/T0SULsVyfcQLItXIw2BBDi/YohPlqn
         dEgvlJ0Ses5yNTgf0iEwnKQ6+Z26Q+GnwZZilIajPGU1ac64gUM74ZDOfHPRBFi5BOuK
         BiNg==
X-Forwarded-Encrypted: i=1; AKwUvBzpmtDVH+bJwuTdqo3DmyH/gtUbUv49HC3hQwj/3oeWxo99etKKKUzx1HJt1VmvtJE50dGhDwjf5FiZi6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvG5bzYXp4Dmv5/KRGdqH+uq/i9Usj967NBnJMb2UZ36tJK9G+
	xKdJ+DX/VCm/dYp/c6MzYUcr5pue1RPyxtd6bGRybwXoLSDL9+hXCxuFgrqfcdl5iS3u0yJdu3p
	dm2jkJ+pSJ/yYWnN8qvUUohfLKUOk5sEhqIZOg8lffuDkGgpfcyLHAJs4g0hFRgiseVA=
X-Gm-Gg: AYBFou1+ZqsAfuOrfwjlfgvv+zQ5ddCtinCg/6h9qNrzRc45YU6qGIRRM5OnTb0Xcqu
	JCtZGQPevo1VzGOoHBVe6XkCo0QX5pviMHybagov9tMmxGkast6veDfmgWdhx4yFLnNNsJaCoVT
	lNC5ED9t3sNItiQLvnrrzajiOzc+PEn0zdM+l1ifSATaHChx+l5oK2j1PTJ9PMvg8uRO6AkFPbU
	lF8P1xuZE6sayQL0/uH/D34RAgja6zoIVBv0OyZ3xWDdj0jh5BUxucTsNyLeGhu7yyuORfFhjMX
	AGcxsNcXRkAND1Ai2AA/7/HCZgSChWZ1SdKhT95qrrW7dGYqIbNOQ0d1nF4ywRAItoUvv9WdvAu
	zYi+MUb7WHtcZ1JqIFH8dL2XWHNwGJWEk1FzDmc9CB7tsUTqfeXVVm3PpgyZiDOrxL2Pasvtjh/
	P6P99Ft8vCi//5nJJGaK7kJNVAFHUtfLk=
X-Received: by 2002:a05:7300:a210:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a2014b145mr4791380eec.17.1793220801615;
        Wed, 28 Oct 2026 13:53:21 -0700 (PDT)
X-Received: by 2002:a05:7300:a210:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a2014b145mr4791335eec.17.1793220800867;
        Wed, 28 Oct 2026 13:53:20 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2396276asm8729769eec.22.2026.10.28.13.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:53:20 -0700 (PDT)
Message-ID: <ad0793bf-b9be-4697-8ee0-0e787ab47ae8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:53:19 -0700
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
Subject: Re: [PATCH v2] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
 <auIWsA4gTWzwFGVo@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <auIWsA4gTWzwFGVo@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX9WPNPg8AhaN/
 yqsNVaFAarPcSSNDhbvrcVMK4OGA25FDbkCbsBPdT+vkib071X6Fr88s+bLFq5ObElp6Ue8dMzQ
 4P60gXfM7FCT73/kJQ4bsYqVlGA4dDRRzi+iswBLbXc06aCv0nxZeuWx62wZBEZGrHXmxaXJc62
 1gOMK43P6sJnGLsEUQPJSBRbz4z2Q/GBOx8Kxrq+1LRf3HnfYJ0I6QeIycI22ERmpNvIyghf+Cd
 WM6A34+NhDJieMgFi31iJKyxcKaLmfMHDeFPCBufIflCht+DHNeAGcjfhav+qyUCJxSPdodUq3O
 q6Gl4AonZ54xwi0b3qQ6SLfxhawKexSoOzvcHTc27ntX9nuV9u70qzr+0+7HhtPujkCD+wlojlt
 wqutHLCTTKp2X5xDZSWAku4H8rbCCUdYBGmoTmv5g0uqh3FGmwytQg57yKyF7C0wRz8B7MD5dfg
 yCTYE4NKtcGg2tsWzFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfXwDg5bE5hCMSG
 ib5Si18yy5QtIC0FLrB0Iy2lqoYxEHO6Vquyo0HTQppwNKNSbWAlx97s3Hb2hI5CwAgvSPwXBQJ
 cP9exWL5ox2kit3NiLSZ4t5YG4eyi8A=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae260c2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XTRlVznK_LMGRA666E0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: MM5kF7wiHpKbALXxaHuLv6eWHjpZDkUJ
X-Proofpoint-ORIG-GUID: MM5kF7wiHpKbALXxaHuLv6eWHjpZDkUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280083

Hi Frank,

dev_pm_domain_attach() checks for that case itself:

int dev_pm_domain_attach(struct device *dev, u32 flags)
{
   if (dev->pm_domain)
      return 0;
             ...
So the call is a safe no-op when the bus core already attached it
(the common case here), and does the real attach work if it somehow
hasn't. It's not redundant, it's what makes this call safe to use
unconditionally, unlike the devm_pm_domain_attach_list() call it
replaces, which has no such early-return and fails with -EEXIST
instead when already attached. That -EEXIST is the bug this patch
fixes.

Regards,
Anusha

On 10/28/2026 8:37 AM, Frank Li wrote:
> On Tue, Oct 27, 2026 at 10:20:47PM -0700, Anusha Arun Nandi wrote:
>> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
>> on the CSI2 PHY node. For a device with a single power-domain phandle,
>> the generic platform-bus code (platform_probe() ->
>> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
>> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
>> unconditionally calls devm_pm_domain_attach_list(), which fails with
>> -EEXIST because dev->pm_domain is already set, and the driver treats
>> that as fatal:
>>
>>   1. qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>>   power-domain list
>>   2. qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>>   failed with error -17
>>
>> x1e80100 is unaffected: it lists three power-domains, so the generic
>> code does not auto-attach any of them (auto-attach only applies to
>> single-power-domain devices); the driver's explicit attach is the
>> only one that runs.
>>
>> For the single power-domain case, call dev_pm_domain_attach() instead
>> of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
>> is already set, so csi2phy->pd_list is left NULL rather than built up
>> by hand. The three call sites that walk pd_list for genpd
>> performance-state scaling now guard against a NULL pd_list, which is
>> harmless since scaling is unused (scaled = false) on every SoC that has
>> a single "top" domain.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..ac25e1e5f1c3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>>  	}
>>
>>  	pstate = 0;
>> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>>  		unsigned int perf;
>>
>>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>>  unset_rate:
>>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>>
>> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>>  			continue;
>>
>> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>>
>>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>>
>> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
>> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>>  			continue;
>>
>> @@ -233,6 +233,10 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>>  	const char **pd_names;
>>  	int i;
>>
>> +	/* Single power-domain devices are already attached by the bus core. */
>> +	if (csi2phy->soc_cfg->num_genpds == 1)
>> +		return dev_pm_domain_attach(csi2phy->dev, 0);
>> +
> 
> why call dev_pm_domain_attach() if Single power-domain devices are already
> attached by the bus core?
> 
> Frank

