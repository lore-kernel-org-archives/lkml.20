Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D4472540
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836480; cv=none; b=nvZG2IusNIrUXZFTUpkoj1wGkiHdGQUNykePHPvRMKaSa2PjbRbfRCpdTrSC52fXmw6mqbLBsQW5ffRSfyYWtAvSHV0dfsCR2gca3gkgjtbCdqBS1NwIfmvHP0/A/LUk8pF28kP+HlzV5yOZcLpzQwy7oIcnRfK1aFYAdB5klIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836480; c=relaxed/simple;
	bh=Oo3Yt40dEl6CkZSwjQb88RYZpWxLTUVv2MFoBUQqnXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iARm8tvfEuBVEtoJImI9gIKi2OQVCMKSky6d3h3N93YkS90jDx/ODHXWVG+vVIInf0XTIK8kOtBcjNfgLK80oNATM/HnW7jimDUWjy5gPxYyZW2aOFh5uZd17+UHkh0Jt6rT4owCx8ILBXAjd3rePI+jaB5sI6q7eIy4pTiMWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKtF7ft8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d98OHm7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKtF7ft8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d98OHm7x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RCBN843379809
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LWQOzPDF8CiYTUrB5PDXuRkR+MWprvD6jrLx2fEfZE=; b=bKtF7ft8Wr9jv1Wm
	8PYao3pX9yc4I/IrRqIPrJt5TBuMYVQ4NB8Aj9GGhCTtxwoAKFEZ082teGpeGpdd
	gGa99bTZBJtPZYTR1gaikmvlcIu4PEj+p3JPq8rKKbpplMIQYjUwgIyjNCyBzFLf
	+CVhtInilKb4DrNUrqGyudlMG1f2/0nmTZV/8uci4l0pMGlXdqTXHnwbG6jr3iS3
	rvUTaIFKHRbbjKN9wyVaHf9Z5Qp1a6gBcGFH76znaD6wNqn0NesaaXla3gzyzyzH
	deRQWRYLgA9ezyYrv75u6+x7Owag+L8Pt10Ce4qFEuztL7cjhl81ZLuw9msQyhXj
	BJt2DQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7rbt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:14:28 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e4b52404so581638a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787836468; x=1788441268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LWQOzPDF8CiYTUrB5PDXuRkR+MWprvD6jrLx2fEfZE=;
        b=d98OHm7xtA+HUjL1anTCyRMk4az1R3Puqvhnup14fPsLFQ27d8PqmA8xeqrDSyvV7U
         9mee04LGH+yfRJ8yDnUIJkhTxX/k2L1/y0qRppgeQRxXkmKx68fpvyR+I/SQQSlrP2mc
         dkBB66VawYjCWQ+vXnuzqPLZMORr14Lp9ll0JvvKcPCCHNlTBRd2/FIgM8e2F9Cm55E8
         CRUL7jLguGNCmxw2rLI/orGH8FaxjvibkMfWBHdm9pb6PMCXt3bOnVdAXRbuiVR0TRmR
         0xmZfzdWGyY8nTBhDz5n0rlkkrsyV1I3PzTwc6iamKWOjue/YFmamzOoGluXgUJpoai4
         FRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836468; x=1788441268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LWQOzPDF8CiYTUrB5PDXuRkR+MWprvD6jrLx2fEfZE=;
        b=SY75GxJV/5oLdwk+RYXzIbLB5lkdTm9x/PGQ3aAPTSUP7uxtuWqpKP8k+qOW+Q5eMM
         U/z1+CCifaXVAyG3GmDRbkC0+OvybBWU4SQwirISmW7XRQXE34bw9ncYjoLx2Sl9rqjQ
         /sIXrqkOtNZyVh10jeTnLSgqswlfdd5lkZkuXCdV22fxEV08ORglCiYSB3cxnERtPuPG
         7x847fC7vx0glT5g+0jP/izPEw5AbOD2KML4iZ4na6iMVVIN4WUpYOVQh/2KjGpky14r
         s6ft9xYQ/1lPxnzd9cKI7q1cDNXo0I7KiY0zghxeFUE+ppLKp6qR72hGgWF86ra584jZ
         uaTg==
X-Forwarded-Encrypted: i=1; AHgh+RofR73E6JAZwcit8s4hza5Ewv0UjICKF+R7421vV9+RLz6jvfrSFktehbJFhHYEMOKEkPGpqIWOdH54Oss=@vger.kernel.org
X-Gm-Message-State: AFuF++kBYc/EEySXNaFWi972FvCyCir/kXMDb5tiNEVHKQZaXoH8Jvw0
	0is/ul3m+B8Y90OvWT8gyPR5/yHsGK87ABFvmonC3yLFmseJ5XHYUe502mT3mwAIVNbiPbzR+Ak
	6eKEYApM3XGAcZl4aVhPeWo8IrNUIRYHiyTLaauYERD9JGj48aE5qbG/oBdphxa10RZU=
X-Gm-Gg: AR+sD13zkkZm51I6fOJuwtnY/VXfR91aR0sOC5b+TI90SQWsUmqcS0m4F/trG4TNjoE
	lLB2pyCwEqD1dR1wsLkGimjTXnGBK65GtwpPgxEE6LcSqbM+q0fGXHyjs9oxdmQUFqcmrqGbrs0
	Ce2Ps5+bWlcBUX7bbEgntRBi4mDuf9osgOqMoBFdWKIDZI6G+m5dEtvgirXrbBnR4AvW6VrkK6o
	lcWOzdWnioTJvZqq9vgSFPTFrd/RKOzm2x8WCRgKY53hhb/JSDnOFl2H4U+byJB8aB7O7tDdrOC
	vrkH/oNklpBqr9D7izOBlMvjkotSIrYVSWXk8TOxYdN44TdhLERJLyEy8aVegnSJbdkHv+dBTYL
	6HcCvXuXnSjohRimZ2kYJRhSWG06zStRh
X-Received: by 2002:a05:6820:a513:20b0:6a3:a335:1ccd with SMTP id 006d021491bc7-6b1a03b1915mr11386435eaf.8.1787836468099;
        Thu, 27 Aug 2026 06:14:28 -0700 (PDT)
X-Received: by 2002:a05:6820:a513:20b0:6a3:a335:1ccd with SMTP id 006d021491bc7-6b1a03b1915mr11386389eaf.8.1787836467566;
        Thu, 27 Aug 2026 06:14:27 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a268023asm4383447eaf.13.2026.08.27.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:14:27 -0700 (PDT)
Message-ID: <5c6b120d-f791-424b-a41a-6c82de73000f@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 18:44:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
 <ao7vB8cDufnJZKAI@zenone.zhora.eu>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <ao7vB8cDufnJZKAI@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDExMCBTYWx0ZWRfX1MCsXpSX9hw+
 kdfuykRMe0Cg4l20o1D8DbzAxl5maJVVXulaG1N7ZMM9tQPSEjFkIoTSy+jS9xL32IjVJFlkD4g
 z8IjUyiqef9kQPttg/5uWiLGoyneiFg2S0/MrkW8bwMX2g5Gjbb8bKZSX0KeVA8oPg24kop2/KD
 4Iff3m2jUcA3w11hT6+25X8k4wZJ4tiLuDVLxELnZZ8skv+K7JB99GasGqHbyJazS3Yy/rZruRi
 eXrpTkEW/GP+vZ6XS+0/bxxpytVSQMjmyAdhF+UbXpN5yYDJr98VDmIHeEmPFVIiK7HkBWv7LSa
 blCIUoxreCPbq7s4cJ9LtEVZAiCEY+7r79jPR43P85xpEVTGTLkjGmxDx6H+TBrWfwjdkunbpEX
 ZjLM0FqUWXgGlGwZvU27iHniMa+YGzyRMG+NT+ja4ME8FFIKqz+SeIKpAaSn1YaV29+vg2YfwN2
 iQY1Qy46co7yp6Xqdqg==
X-Proofpoint-GUID: qarx4hDxWdAFrS2i7QhZEYRkomzxOgFu
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a903835 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8fm-Ily114xI1oIpI2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: qarx4hDxWdAFrS2i7QhZEYRkomzxOgFu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDExMCBTYWx0ZWRfXzaPw6ErV8F6I
 oYgCwiOAFOuBSLQ/LSNoL1QB47gm/C9KJhlSLs+SL0AG8QYil24XsofyTGDH9ipUWqKEoQyn5yR
 u+iBJNVR0k4iYuw/lc0RyPMKPkp2I0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270110



On 8/26/2026 7:27 PM, Andi Shyti wrote:
> Hi Viken,
> 
> just a quick look here.
> 
> ...
> 
>> +static void qcom_i2c_target_hw_reset(struct qcom_i2c_target *target)
>> +{
>> +	/* Clear error bits before SW_RESET; the reset may not be instantaneous */
>> +	writel(BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT),
>> +	       target->base + I2C_S_IRQ_CLR);
>> +	writel(SW_RESET, target->base + I2C_S_SW_RESET_REG);
>> +	/*
>> +	 * I2C_S_SW_RESET_REG is write-only so completion cannot be polled.
>> +	 * Use a conservative delay to allow the reset to finish before
>> +	 * reconfiguring the controller.
>> +	 */
>> +	usleep_range(10, 20);
> 
> This is also called in atomic context from the irq handler.
> Please avoid using usleep_range(), perhaps you can put this in a
> thread.
> 

Thanks for the review. The delay is only 20 µs, so we were
thinking of replacing usleep_range() with udelay() instead of
converting to a threaded IRQ, to avoid the added complexity on
all the normal fast paths.

>> +	qcom_i2c_target_hw_init(target);
>> +	writel(target->slave->addr, target->base + I2C_S_DEVICE_ADDR);
>> +	writel(I2C_S_CORE_EN, target->base + I2C_S_CONFIG);
>> +}
>> +
>> +static irqreturn_t qcom_i2c_target_handle_error(struct qcom_i2c_target *target,
>> +						u32 irq_stat)
>> +{
>> +	u8 val = 0;
>> +
>> +	if (irq_stat & BIT(ERR_CONDITION))
>> +		dev_err(target->dev, "Error condition: unexpected Start/Stop bits\n");
>> +	else
>> +		dev_err(target->dev, "Clock low timeout\n");
>> +	qcom_i2c_target_dump_regs(target);
>> +	qcom_i2c_target_hw_reset(target);
>> +	i2c_slave_event(target->slave, I2C_SLAVE_STOP, &val);
>> +	target->status = 0;
>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +static irqreturn_t qcom_i2c_target_irq(int irq, void *dev)
>> +{
>> +	struct qcom_i2c_target *target = dev;
>> +	u32 irq_stat, rx_bits;
>> +
>> +	/*
>> +	 * Dispatch priority (highest first):
>> +	 *   ERR_CONDITION / CLOCK_LOW_TIMEOUT  — hardware error, triggers SW reset
>> +	 *   STOP_DETECTED                      — end of transaction, clears all state
>> +	 *   RESTART_DETECTED                   — repeated start, resets state before
>> +	 *                                        any data phase in the same snapshot
>> +	 *   STRCH_RD                           — read-phase data supply
>> +	 *   RX_FIFO_FULL / RX_DATA_AVAIL /
>> +	 *   STRCH_WR                           — write-phase Rx, coalesced into one drain
>> +	 */
>> +	irq_stat = readl_relaxed(target->base + I2C_S_IRQ_STATUS);
>> +	if (!irq_stat)
>> +		return IRQ_NONE;
>> +
>> +	dev_dbg(target->dev, "IRQ status: 0x%x\n", irq_stat);
>> +
>> +	/*
>> +	 * Load target->slave once. Both reg_slave() and unreg_slave() disable
>> +	 * the IRQ before writing the pointer, so it cannot change while this
>> +	 * handler runs. Sub-handlers may dereference target->slave directly.
>> +	 *
>> +	 * The core is enabled only in reg_slave() and disabled in unreg_slave(),
>> +	 * so no bus activity is expected here. Clear and discard any stale IRQ.
>> +	 */
>> +	if (!READ_ONCE(target->slave)) {
>> +		writel(irq_stat, target->base + I2C_S_IRQ_CLR);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	if (irq_stat & (BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT)))
>> +		return qcom_i2c_target_handle_error(target, irq_stat);
>> +
>> +	if (irq_stat & BIT(STOP_DETECTED))
>> +		return qcom_i2c_target_handle_stop(target, irq_stat);
> 
> ...
> 
>> +	target->xo_clk = devm_clk_get(dev, "xo");
>> +	if (IS_ERR(target->xo_clk))
>> +		return dev_err_probe(dev, PTR_ERR(target->xo_clk),
>> +				     "failed to get XO clock\n");
>> +
>> +	target->ahb_clk = devm_clk_get(dev, "ahb");
>> +	if (IS_ERR(target->ahb_clk))
>> +		return dev_err_probe(dev, PTR_ERR(target->ahb_clk),
>> +				     "failed to get AHB clock\n");
>> +
>> +	ret = clk_prepare_enable(target->xo_clk);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
>> +
>> +	ret = clk_prepare_enable(target->ahb_clk);
>> +	if (ret) {
>> +		clk_disable_unprepare(target->xo_clk);
>> +		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
>> +	}
> 
> The problem is that these clocks are not disabled in the returns
> below.

Sure, I will add the missing clock cleanup paths in the next revision.
> 
> Thanks,
> Andi
> 
>> +
>> +	target->irq = platform_get_irq(pdev, 0);
>> +	if (target->irq < 0)
>> +		return target->irq;
>> +
>> +	ret = qcom_i2c_target_icc_init(target);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_request_irq(dev, target->irq, qcom_i2c_target_irq, 0,
>> +			       dev_name(dev), target);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "request_irq failed for IRQ %d\n",
>> +				     target->irq);
>> +
>> +	qcom_i2c_target_hw_init(target);
>> +
>> +	platform_set_drvdata(pdev, target);
>> +
>> +	ret = qcom_i2c_target_adap_init(target);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "i2c_add_adapter failed\n");
>> +
>> +	return 0;
>> +}

