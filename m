Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7694E3220
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411203; cv=none; b=sDjB/uszd6bGvfvXE0CDciC84BmVBOaSIbljN2vICLS6lLMKKRC9Gj+t4SUg8MR+muMJJoZC02KF1TatqniUEM8556gx4oj/vbvM5qxvQ2R4gMfPF3UpGCF9pebztBpBjH1gY4NgwQAosRfrJtLFY7f4eRYomp9iZF3DTa5jy+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411203; c=relaxed/simple;
	bh=FcqLpKSfKJ1yko+5OFV+nW7H7B0lBHV0bW98aHKRh3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEJiPjWGyGNtitGxoxejoD1uPuHZQ3KONO+neMDjNSXRKGb45SJWuIrt9KluTqFgOm2bAqTNhV22opU25BXOEutntx+k4/BfaJFUxXExnqH8iF9pEx6E5grkjF0r8Q7m5grqs8qZGzZJUNWMI8cTgvrdlC3UWoKqT2xRTdNpv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lajoh6zg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGFc6+0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lajoh6zg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGFc6+0C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ym332688775
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w/w7NyM2M/WyE9YFhQuhHJ6Ubd2mIWba5kyEyLKMtE=; b=Lajoh6zg6aeyfvP4
	Sa5jc/Rmq4UMjtfNhnnjO80rfSIba2GV5TaiOWau76x3INtb7/usAcQRd5Zv+r3c
	vG/LFFOKIGetdbNWidFyyiZpa8ichrbiSxW/JPSfleiKhdI83HYr/6wBqu3Okj05
	YHgkcypdjQCOcxRBctbhROuOs8fsWmlNVR7r4Y0ayt4ExE3XhMX3lD6c0egctb5d
	9xeoUOzlLUSrcWZlCtxKXNudhBTOQQXVQYWKEvFIEsppL2LxtdegQwYF64omDzYa
	eEHkEjOLxlhZPc3qYNGrCiCa0ZBEUDnpF2NZmahPzUuAUIYsrhsPderw7RC0AQkJ
	8gCSvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0rq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:00:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338bd59032so3133581cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792411200; x=1793016000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w/w7NyM2M/WyE9YFhQuhHJ6Ubd2mIWba5kyEyLKMtE=;
        b=XGFc6+0C5KfPdctG8Z81tRBNg4V0qAUwwlJD27mm9XaNSzChxs2ifOyFwRXZhYnCdq
         H/iuEeVN8yg6QbtKhzLBxxG6jSpXCeu2j0WYKe8Gu8UZ5UAvvmUR+JPGl6F/sQePd/Fd
         y/1ymhV6uau9mgunvhE/PP+kLSGbQjJGORBAYDkIH5OHAKo12gY8el0LjisJsgm4FpwJ
         KbYlJ47rXgVHmnNjGF8X97HjkREmv2C90RUjmLLrFhW0EMRX2nEwIivRKxn5dGIvrMSQ
         jWckeVvYC0gOSyirOAj46hyG1sj8hu4O1nujh+vMOv2TsOKYDmq+z5siH6bsjI2//GHS
         0fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411200; x=1793016000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w/w7NyM2M/WyE9YFhQuhHJ6Ubd2mIWba5kyEyLKMtE=;
        b=WINvka7GAshZpdWI/i4zutG5ZszazY4LE4IjW8krh3WxDDQofL+PRIBMnKR56sEufy
         RZbj0LHQZp1HiYKAeU+YmbrBKnyvb9F087CirbiPEJFXpB0Dnu59KPwuxt7jfrcL7Tnk
         Gm03EJ6uoJSwEWK4Ck+ErT8nQnFpIe4qHcSIDob6iRsDT58+TK+7RP6lUlhL4dKNjF0U
         XKojLI8LRV1QUekRCjrKdIJ1xb+edlEraf4FYN99Ke+tnPdZebcGmy26rE1f/F2latgd
         jcIvH71wDFyoIayPpmTT/6ag0j0ZcP2A/lVMowF6XJVTY7ISZypn0Qkib3C85M/STlts
         eH9g==
X-Forwarded-Encrypted: i=1; AKwUvBwDsA1LTDhzdHhe1ShRrQB4XGJBGVbch6kwmvf3jAF8tA/ipB9ECmdIjnpniUqhstbYHTKCNna9TbqNbD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxIPuU/16c0fLAgkpfvtyg6hLdIMZF8mqH7t5bs2nss8169dHx
	Nswy4/0Qu9cptWz0AFIqkwpq3iUPx1Fk9zAiWaTd3GeliSzq0pwY8Eu9JA4O1eCksHAoTEYOiJS
	DwIM9kk50AkLtGHDNxBFp4eZnAVl0GE1gtV+oJRXNd4q6/lP7nSZGNPLaBUxz934V3OU=
X-Gm-Gg: AYBFou3FSWs6sKrRR37SJGmJVgsAsfG9v9reVzj20utKZqwu17TibJKufKBrxhhTww/
	vdQdkRaQGCkAjdmuDm7JO1wi9GCZ5tnBB3u3DlKymD6933EUbyxXRWCyD5sNsuYECOusXJbIN0C
	cwqpkk8vFeWvCvUUML/HiLW0MrSwj1Mxx6XPTUnDClPFaC/O4Epz/EHk74c0ieeoV2A1FX8h6Y1
	G7N6nJTJ7hvfSD41BCrESRQtE8ChUN3676pbJXqumijZ7jvYf3zshfS8SIxa+39p/N3WmgA9syf
	oxkqioznyFVXNE2/Imydq8GJJznfqmixXQj2GPJLhKZjT3MoBpEyam62gV8wSsJh4DHjSvAUdy+
	1isBp37UALv+gxUpF1Ny81A==
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr134121091cf.5.1792411199608;
        Mon, 19 Oct 2026 04:59:59 -0700 (PDT)
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr134120601cf.5.1792411199024;
        Mon, 19 Oct 2026 04:59:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce122sm364995966b.32.2026.10.19.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:59:57 -0700 (PDT)
Message-ID: <0829d45e-a55a-43f6-a9f3-f445337fa00f@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] regulator: add Qualcomm LCDB driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-4-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-4-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX8xg6WqgjEgR6
 6jiFJukVHBzU/fh+ESYoWIJ3bmc6hpM9BXQnLjukZjFhr5iPgN031KP5ouJlYFJUCqqNXnZbb3E
 oI4MgFPrNbzZDo9+1rmzs4YRR8fNyYU=
X-Proofpoint-GUID: YnlS8YXXYvbxTiweI-mYsoehwHzBI5dQ
X-Proofpoint-ORIG-GUID: YnlS8YXXYvbxTiweI-mYsoehwHzBI5dQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX1It0vP1Mo+Mu
 BK7eIctXtr+5+8TLSXM+ccUuXOZl1/Q7vxKO8JkIY07UK9Xfx6YIhB48aFpZ3GcDHgNKGBudbzE
 yCE3UGgkpU2gjmLAKCemO4V+8uY15IF28k1kDkKFSTsgLK1z7SN6i/uea5CP6WYrZ/tQ862y5l7
 bFhpel0cu1wxhf7mSwdRaDYRxWzJFVG50GRjaaTR4dzKySowWfx9EBr8LaJYPqyeuYQ7yG0/+X5
 3mpbhxKrappUaRqtk4Ug7GWMSgPHqyTA3SHSAAmSqbuvPzhYH0thHNWzMzkCLVJYP/sCgMyIHn0
 iToOlkPi36B0OZ+P+JHrNELVUJERqOcrGiKd8yESDoJdbC9VOBni6h6i6/GUFzcoPJCpmY7viDe
 DXbF/Y9ggE3EDqhx0prCVv3/Tw3QMbknP7Tx5wML1/KA+T8FvJWARNZIKMMm1wsTh/0wGBFuBdt
 q9Of4CDeXZArzpoTzIg==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad60640 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6RkV1gTEqpm7dquCeG8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190047

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> LCD panels on boards with PMI632, PM6150L or PM8150L take their bias
> rails from the LCDB block. Without a driver they only work as long as
> the bootloader has enabled it and nothing turns it off.

[...]

> +static bool qcom_lcdb_handle_sc(struct qcom_lcdb *lcdb)
> +{
> +	guard(mutex)(&lcdb->lock);
> +
> +	if (!lcdb->enabled_mask || lcdb->sc_disabled)
> +		return false;
> +
> +	qcom_lcdb_module_disable(lcdb);
> +
> +	if (ktime_us_delta(ktime_get(), lcdb->sc_time) > LCDB_SC_RESET_CNT_DLY_US) {
> +		lcdb->sc_count = 0;
> +	} else if (lcdb->sc_count > LCDB_SC_CNT_MAX) {
> +		dev_err(lcdb->dev, "persistent short circuit, keeping the outputs off\n");
> +		lcdb->sc_disabled = true;
> +		return true;
> +	}
> +
> +	lcdb->sc_count++;
> +	lcdb->sc_time = ktime_get();


GPT:

The commit message says to restart up to ten times within one second,
but sc_time is updated on every fault.

Konrad

> +
> +	if (qcom_lcdb_module_enable(lcdb)) {
> +		dev_err(lcdb->dev, "failed to recover from a short circuit\n");
> +		lcdb->sc_disabled = true;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static irqreturn_t qcom_lcdb_sc_irq(int irq, void *data)
> +{
> +	struct qcom_lcdb *lcdb = data;
> +	unsigned int val;
> +	int ret, i;
> +
> +	ret = regmap_read(lcdb->regmap, lcdb->base + LCDB_INT_RT_STS, &val);
> +	if (ret || !(val & LCDB_SC_ERROR_RT_STS))
> +		return IRQ_HANDLED;
> +
> +	/* Blanking time, a real short circuit is still reported afterwards */
> +	usleep_range(2000, 2100);
> +
> +	ret = regmap_read(lcdb->regmap, lcdb->base + LCDB_INT_RT_STS, &val);
> +	if (ret || !(val & LCDB_SC_ERROR_RT_STS))
> +		return IRQ_HANDLED;
> +
> +	if (qcom_lcdb_handle_sc(lcdb)) {
> +		for (i = 0; i < LCDB_NUM_RAILS; i++)
> +			regulator_notifier_call_chain(lcdb->rdev[i],
> +						      REGULATOR_EVENT_FAIL, NULL);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_lcdb_hw_init(struct qcom_lcdb *lcdb)
> +{
> +	unsigned int val;
> +	int ret, i;
> +
> +	for (i = 0; i < LCDB_NUM_RAILS; i++) {
> +		ret = regmap_read(lcdb->regmap, lcdb->base + qcom_lcdb_vreg[i], &val);
> +		if (ret)
> +			return ret;
> +
> +		lcdb->uV[i] = qcom_lcdb_sel_to_uV(val & LCDB_OUTPUT_VOLTAGE_MASK);
> +	}
> +
> +	ret = regmap_read(lcdb->regmap, lcdb->base + LCDB_ENABLE_CTL1, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & LCDB_MODULE_EN) {
> +		lcdb->enabled_mask = GENMASK(LCDB_NUM_RAILS - 1, 0);
> +		return 0;
> +	}
> +
> +	return regmap_set_bits(lcdb->regmap, lcdb->base + LCDB_MODULE_RDY,
> +			       LCDB_MODULE_RDY_BIT);
> +}
> +
> +static int qcom_lcdb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regulator_config cfg = {};
> +	struct qcom_lcdb *lcdb;
> +	int irq, ret, i;
> +
> +	lcdb = devm_kzalloc(dev, sizeof(*lcdb), GFP_KERNEL);
> +	if (!lcdb)
> +		return -ENOMEM;
> +
> +	lcdb->dev = dev;
> +
> +	lcdb->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!lcdb->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get the parent regmap\n");
> +
> +	ret = device_property_read_u32(dev, "reg", &lcdb->base);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get the base address\n");
> +
> +	ret = devm_mutex_init(dev, &lcdb->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_lcdb_hw_init(lcdb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read the initial state\n");
> +
> +	cfg.dev = dev;
> +	cfg.regmap = lcdb->regmap;
> +	cfg.driver_data = lcdb;
> +
> +	for (i = 0; i < LCDB_NUM_RAILS; i++) {
> +		lcdb->rdev[i] = devm_regulator_register(dev, &qcom_lcdb_descs[i], &cfg);
> +		if (IS_ERR(lcdb->rdev[i]))
> +			return dev_err_probe(dev, PTR_ERR(lcdb->rdev[i]),
> +					     "failed to register %s\n",
> +					     qcom_lcdb_descs[i].name);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	return devm_request_threaded_irq(dev, irq, NULL, qcom_lcdb_sc_irq,
> +					 IRQF_ONESHOT, "lcdb-sc", lcdb);
> +}
> +
> +static const struct of_device_id qcom_lcdb_match[] = {
> +	{ .compatible = "qcom,pm8150l-lcdb" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_lcdb_match);
> +
> +static struct platform_driver qcom_lcdb_driver = {
> +	.driver = {
> +		.name = "qcom-lcdb-regulator",
> +		.of_match_table = qcom_lcdb_match,
> +	},
> +	.probe = qcom_lcdb_probe,
> +};
> +module_platform_driver(qcom_lcdb_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LCDB (LCD bias) regulator driver");
> +MODULE_LICENSE("GPL");
> 
