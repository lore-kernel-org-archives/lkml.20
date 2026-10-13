Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3216472530
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869254; cv=none; b=TqS3K9rQchpWCTmupK+72nbXebuXTWOL7h1k3kGJl2QjB9WwlYaxxxUTXNSnmoeDAfy5yQym/iI3GiUF9fa4U1cPahPaqTpTsmVmvmm8TnqOyAQDUusotYKS9/ycrxeLuctDUB5sV5z+HPHLLRrl0sPcbtexC8KTCBPLpLnT/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869254; c=relaxed/simple;
	bh=p8v7zGw+jnmOL9ic9pcmIw3cEU5hBsK/Ef+eTcjY3ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EySa6bDXdnqgL220qBtsc0vhPvMn7d5pPlShqkhFJf6OlLQiF0IbYofSH2HNig0HzavZv76Zve0GxfM6slIKJXYmF+OGwuVzhL2oG+1It6SpJBHqri0vKgi+c3Vi/UY89DH55oYfOf3WdvOeoDs05lwv/ieR+YsQ6nPS/gtBY/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WogzpvGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbcMln+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WogzpvGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbcMln+z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D211f84071792
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/6a4uSy+t25RmWcX0cupcRr5bplqRSqJY2Uj5L4mUs=; b=WogzpvGKwKg5qgPR
	tkI01liBHEkX2Ij0Uc3i0FNYsQw2ycg8nvf6h+TAGJh1gpMA1ZXaK41Rx1rJPV6G
	bhxffOnzK5UuZWcbdAxwyxVIvTo3iuOvZo2vNcNKXM/8mBb6orKxjgzlbkoqy74N
	k0jsmB9LxGb63/WMU1PdAAc/P9WZvCyxuzHQZ0Bw2alp8HO1x6/J4rNIuPTeM6cm
	ys5iLrrEfbjwU1Yneor8wvL0fnw4H6RItgHHy4MnLLqAxgoV3erFWofcKl+qMjsZ
	aTNFmgR4vcCL2TLjmlLFkBIeBeGTYu6X0mNJz1dNtEGOWqYlufSeLKj2cZ09f64r
	GrHRkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjttpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:27:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso2234129a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791869251; x=1792474051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/6a4uSy+t25RmWcX0cupcRr5bplqRSqJY2Uj5L4mUs=;
        b=ZbcMln+z0+ir7hEN7Xu6QnI9NhX1xfoYX2T4MN9MuYwPVrR3BOVWzGRuBQFCy9KxBy
         4LTpWwbmbzwvPAG/CkeNI38nUA8HUQz+G2ICJfulnQf++xYqfm+cE/6uGiB3vLttYBGa
         GbIS6M0I35dgJMHqIbe4Jk8L6s1pgdoOG8PDqxxhoo1pBotaGos9p0lD+TSXNpcVOWHD
         Iu1z0knADi+X/YEDdmBMJVjguIbyD6QRekmY9/Jw347opblqHGFazT+WsBRg1chGPL7k
         u/P0Kem2O5wXaZcb8C62RcTJ+YTUothhCTaikehUkSjwIRwKgJgR0BHac9STaLWE/vP3
         voYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869251; x=1792474051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/6a4uSy+t25RmWcX0cupcRr5bplqRSqJY2Uj5L4mUs=;
        b=CyBGdR0BLdGpoXSKQk7CBYcduCUq/XJR/TTSoDztluzw4019dtnXLHcuq28Tc1bDR/
         L7hLZb5L5mnIPUuTc+SKTrs+uH3VPbLhSUYEIfwZbtB4Vf37O0rRmj4D9blfWQtpRKfs
         wJdWUqQg/vLckhaXdrkrr7mjggzIiQCftq9HyTBt3ZYfCZa0Z3UUOrXigT5CNRs3QcDd
         e7scUG/+82jQfP6CPlGgGhvxsK+3hAxwJo2o6TpVrY6E2JrfREdXvW3UhFIMGvW2wPa6
         BhWwwyWRi+MLnSkTCtFFpqSUC23KATeMCULWi9Xm+B9RpRXR+YofVu5Acjd/kmmZsg5Y
         hpNA==
X-Forwarded-Encrypted: i=1; AKwUvBwPeyb2oxwJEmFlMms9ryMDi75r+/lq8HHhMboMh8L9wWMKk12NURlUrnGqSYyfzi1clYCrGDwz2ZK8sEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPKNqyOnkBOQmlyCTb0d1kmRf7F5xfEgMcYwn2gEFTNszgv2CI
	HzUmDWKFs20dHMPWLbCyrH2Z/G8cyrLZ+CtXFUGhTnw3AMYkbPKZlBOSXsvr9xtjKQmK0pe5vps
	iVX7G3sUUW66Hre23u3VXMXPWNB8AKZuxr5It3sFcfqEr8u3z7JiIv/RVu9guun35/uM=
X-Gm-Gg: AYBFou0m41opfy3JvLnX8uegrdC3r+qGvsJKRoJP/f8y+nadaf8oBKpGyQjLOYQ7Gy7
	pq7asfSsfsx9i0wMvB7/X4iz8TC1Q8nPPgfkbEIvkbGAy4yj2mTU8UbG95BeD1l1Iit+IenBBFj
	Zb8vhzcC8xUicCnlYpID3QChgmNtyf+oX08d26uajzqH96G6vPBvU0k9gWStXm2mYuichN8U7b/
	y7O442tl1+fulKmEYpbAfRFX7GcVqp6ZWwMjvnJIjkGYbOZXjuGJVTAWuCJZcJ4qYE8P58wNxXt
	OBD+JzZDEW68kLbcBndXyUkSYrhBMIZMoSHnC5TkO9o8nhybR+Ej9b5aeeszQssuWORFGAeyO+J
	6Jg5OBk67Go9FykAytjULxWf03cEIumuH
X-Received: by 2002:a17:90b:1d48:b0:3a6:582e:5e17 with SMTP id 98e67ed59e1d1-3ab3ab25b70mr6161952a91.48.1791869250787;
        Mon, 12 Oct 2026 22:27:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1d48:b0:3a6:582e:5e17 with SMTP id 98e67ed59e1d1-3ab3ab25b70mr6161933a91.48.1791869250307;
        Mon, 12 Oct 2026 22:27:30 -0700 (PDT)
Received: from [10.217.218.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm19468684a91.5.2026.10.12.22.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:27:29 -0700 (PDT)
Message-ID: <903bec3e-14a0-447a-8652-f57efa58cb68@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:57:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
 <7cc05c51-811f-4949-9fe6-10580ff90eea@oss.qualcomm.com>
 <bcf5b148-d4d0-434d-a020-deca2381f5a3@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <bcf5b148-d4d0-434d-a020-deca2381f5a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R2rtVlv8xHZcYTYPCiqGknX7MrqOfl_d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfXydYgI5Wd5VcH
 AkpzXmWJvh+iAMQRDTvMYqbLqfoa+KIHXgGUB5+VlwC2SLCZnMY8hnkQYDel3CqxWCW/xnlP4x/
 c+ckdxa2boyMH5uOG4gCFWu4x3Cu+Gg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfX0GM+b3Ca1+HK
 kxDr0KqWUGfA5z8Po9UmrgRxnKfOfdMNaANTzUklGAh0KJJ3nZkggWKWqGpJQAtiDty0+vN3EwT
 Wy/Whs2DYNNS5IOxsEDFq/oyYSjGspmPNYgKxcwtlH+YPAJqexLztqvrl4L0Q7qKTGG2GrUsjwP
 hhRupgxWl8xm9bflaow/lr9uVku8163OnzcXmDAJWv4uPJrBBQT2ksdUM8F+AZp+RcoFiCmMIEc
 P0DycHrN8g9YDVOFr+2lCFSMOZCxWU0BMHMwsv9Cyj41ukNzy8VrtgSiZpFhX/ioHSBrWM3IXrs
 aAk0M385BWxfsCWWRYZwqEJebsCPQrYDtYv9Tmjf+zxvYoz17Uqlc4PskgfZxjSFE+rB44exVl2
 7KUpEqOKnhAhZLwdzQZl7ho0e9djwb86Q0rHKh07/NcFE9TESw1Vxj9bo4PswZlmq/IdcB+ZkEN
 cQGRT7IzWB4WOK4VeZA==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acdc143 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=jt_ap3qWCKZ60gYu8XkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: R2rtVlv8xHZcYTYPCiqGknX7MrqOfl_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130021



On 9/7/2026 12:16 PM, Mukesh Savaliya wrote:
> 
> 
> On 9/3/2026 9:44 PM, Jyothi Kumar Seerapu wrote:
> [...]
> 
>>> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum 
>>> i2c_op cmd)
>>> +{
>>> +    const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>> +    struct dma_async_tx_descriptor *desc;
>>> +    struct gpi_i2c_config peripheral = {};
>>> +    struct dma_slave_config config = {};
>>> +    unsigned long time_left;
>>> +    unsigned long flags;
>>> +    dma_cookie_t cookie;
>>> +
>>> +    config.peripheral_config = &peripheral;
>>> +    config.peripheral_size = sizeof(peripheral);
>>> +
>>> +    peripheral.set_config  = 1;
>>> +    peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
>>> +    peripheral.cycle_count = itr->t_cycle_cnt;
>>> +    peripheral.high_count  = itr->t_high_cnt;
>>> +    peripheral.low_count   = itr->t_low_cnt;
>>> +    peripheral.clk_div     = itr->clk_div;
>>> +    peripheral.op          = cmd;
>>> +
>>> +    if (dmaengine_slave_config(gi2c->tx_c, &config)) {
> should capture the return value and print, as it returns specific error 
> code.>> +        dev_err(gi2c->se.dev, "dma config error for bus cmd 
> %u\n", cmd);

Yes we can capture it. I will update it in v2 patch.

>>> +        return -EIO;
>>> +    }
>>> +
> 
> [...]
> 
>>> @@ -1066,14 +1136,18 @@ static int geni_i2c_xfer(struct i2c_adapter 
>>> *adap,
>>>       else
>>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>> -    if (!gi2c->gpi_mode &&
>>> -        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
>>> +    if (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
>>> +        (gi2c->gpi_mode && ret == -EIO)) {
>>>           /*
>>>            * Only attempt recovery if SDA is stuck low. -EPROTO and
>>>            * -ETIMEDOUT indicate bus errors where the target may be
>>>            * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>>>            * bus indicates a stuck target, not a real arbitration loss.
>>> -         * GPI DMA mode extends this trigger separately.
>>> +         * In GPI DMA mode the completion callback reports NACK,
>>> +         * BUS_PROTO and ARB_LOST alike as -EIO, so the SE_GENI_IOS
>>> +         * RX_DATA_IN check below is what distinguishes a genuinely
>>> +         * stuck bus from a benign NACK: a NACK leaves SDA released
>>> +         * (high) after the STOP, so recovery is skipped.
> after the STOP, indicating i2c bus is in idle state, so.....>> 

Sure. Will update the comment.

>             */
>>>           if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & 
>>> RX_DATA_IN)) {
>>>               int recovery_ret = i2c_recover_bus(adap);
>> This does not appear to handle scenarios such as an I2C multi-message 
>> transfer where the stretch bit is set during the first message, but an 
>> error occurs while preparing the second message (for example, during 
>> memory allocation or DMA descriptor preparation). In such cases, the 
>> SCL line may remain asserted low and impact subsequent transfers.
>>   > @@ -1292,10 +1366,8 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>>       if (ret < 0)
>>>           return ret;
>>> -    if (!gi2c->gpi_mode) {
>>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>> -    }
>>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>>       ret = i2c_add_adapter(&gi2c->adap);
>>>       if (ret)
>>>
>>
> 

