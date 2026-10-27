Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111508;
	b=luL5KzFZ5c2u/Pjchw3LyRGOqINl4wNCkGWWe/g2wIiorcSJN+wG4Xx6b9xRvRufOy30
	 /TE4DvHTCnPg0d7q8R4SXfnUZLHWXgGaIZJmXwyyGnH5y0fhSf+F4EB1BlL0qRZx7tnY/
	 iYeO++81k+PlJUonOnTu8NsWWK1POKGC9aa0ItTWqGPmQnrpzxV+OUqxwIMoFsSfY7WJ3
	 hXXRK1bxFIFjEn2hNU0onz7Oo6LiYM1c9eWL2eXRu7FBTtO+FmERyMB2+vW/L3e5oO8kz
	 tdAkBzjKAQpNBxjDoUIDnBUjP9+IIc+w9LRefkOrkX5yFoKZbmtmxJ3dSiyRHTFVSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
	b=DvFNBQAcIXl3AZCPPMX01+4AScZCy9OFd9X44vOudf2K0o4nSn0oCFRyzU07TPN4rF9J
	 5ac/VjSQzP1A6DntMc7z6aja+rcRm7z1ui7vlupiUHOnF2K1eLFv0l4IS7uxSng6t+sZd
	 5y8VqbiZVQ4xFmQ9jGI2vbdIMcBWrrAJyD+AqNUF5+sJlsi+jFejHLKQZz8nFBUs0IQqq
	 +6bwqo3O2RjgANDXQYwiVhfeQA/+xTcdLnH6AMaV3qvlNf7i4BNgcfoJp9GzcEvPGCEa4
	 wfSnxg9Xht7dsp1SJKhAFU1ewYdz5talvQMH2/2fisR87tmIEc5bKpKCETnCkNLcDig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i+rtoxO0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDFQzwcs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E3606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i+rtoxO0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDFQzwcs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo7cu1486574
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=; b=i+rtoxO0Noy20qKm
	uYJ5YCbW+8Se7Z5KqAT+4MTHNH7Tk5vnE+7P6LhYkSFvvWTwpU2OMlZhuyekZWkM
	MdePTZiVPh0iXmOWlx3tfH6tCdqcZCr45Y5I6vNFMQkFdHMucSNsjajaCSXDe5uA
	0BLEd9gHtBOWQH8CsEpx8uzBl21U2QcSAg8NqTqbrtjND5KjrzTWnyQtIJbQvwpb
	tt52HCsZd5gqChQeQLy6RIvtWiNvooN0NhzvA+RvOZlVgZiLh1+EMwcjlw4zz7a+
	EnAJJVZpPtJcFKKkeDGujrHGXSVVO6cZjiRLxo8liKqrd5HUH/G6vqw55CNKZG5D
	8qXoSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2ta113-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8e16d22d8so70148175ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793111506; x=1793716306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
        b=FDFQzwcsVN+VQyVMwEc0zOwbZJJmVWYg0F7b2ToVFIY4g0BPtv7kdNxAjtiStWJMV+
         Y3ZQsG0Vg3FKcICRWK3D3qCxZWjUAI5hhI/BGIYTM4Pf4xz/o3x5LiZLoEBY9NDn08Tr
         WBdQwvJwTIi/qmBHG6FZRWK/W7B89d0IM28Z+DZhb15BCrzKaDQtOVxaKmZdaPZCg9Xj
         fVVISTWl28PEocWpF1EqGbNNSHLMawIqgHdBkD3KUT8AAkU8Jmu3AHOtkIJj9/NF4KVy
         YJLogtJPJ3R/ypf+GIzycEc9uoWTB/jhgsvTuCT7xwsaxD6y7R2eeIAwUIOR9KUuorfl
         nH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111506; x=1793716306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
        b=kfR4UsX/K0y60BFMxUJyGc/TTJV8Egmij6s0MDk1IIIkxXVQMbgxEOtT4Uq44fk1QH
         DYpiPvShmGBQIVhDhWjQXX+7ObiKKTksKM2nFTC7v7iNdAAWB924XvEXzVQS8CNUUSRs
         3gguaBWOM2jdgnM5uUrg2cC5Ev2S6ozqUx9NZcocThsAJP+bs/QWY/ZFpkYtJ/zMk9q4
         QZi72ujRN7GkmVd3dzSJ6d3q6WKu2u2NCwMNuJPWLhPU8szJLJoG1HnMFQS1T4gzpXG/
         CXjfihM5ovz1bu9p3LTn+dRp2IMHjHY2GEgZK2I6l4W79EQz7NgKtf9klC1h/1utT6yN
         9XXA==
X-Forwarded-Encrypted: i=1; AKwUvByP0WdHxcn2/dUoN+B2nEgGf2QBb/qrNVCGynDpLrHoDQjmsh5XQqvzzndlcR0+IsFLR6mr2QicMN71KpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9ovKW9QaH4/8O5zRy3jtA3h8ITpafyc9oO+NUH13XEFvHjPIX
	iaLYep84SCKOMrTDxqC9peHvjr5CjnnDK2LtPD8xcRo8QRvaQQ2k2kddkHUfESDHfYsXqU5QcbN
	pVv+f0gj+2fkru2INrBY4vKsogtD2JtJazOgfjBbZ0pX5YaZGpbsww+0zYUIOe38yfRI=
X-Gm-Gg: AYBFou3rYDdLN3pxhgdbvbb4j/aZz3zGVEm1hgAaG86gix01vSVRkPAMIM7Z/UwmSQP
	vLa1ivUa9opzik8J1ISxHymQl3UdN4LuSalyjBH3rZguVuUmcT3McwVY+PsyVXaffLDz5csbwu9
	zm5Nuz88HuN6cMEvdNH7b85jMI4bqjjknmYcewypriA3NCixug4QvsdwZ/znJSru+L14bU9MUx/
	jEF6hJnX7bSaKbTIh3pSZEff1UD81o2uKRyw7sjWmxbfhFTfzyPRVHcxdjttVdT2G2xy7JRqcl+
	i4+HEDHlNYTbdthX18J3WAXaLgOttJMZLvvvEVlJeQg8rsnqUwHE/ZYqSntCv3B/2xQ1EnEVp/W
	DxNbvSXgX7w9tCJXNIGmVokP/KUeFWBuSDgqxhlxk82/ZoF+kZjxDwaw+am0GsgqFytivIVs3Fc
	/yela0AQ==
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr90167165ad.15.1793111506177;
        Tue, 27 Oct 2026 07:31:46 -0700 (PDT)
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr90166425ad.15.1793111504651;
        Tue, 27 Oct 2026 07:31:44 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6454a29sm10749995ad.9.2026.10.27.07.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <b88efeae-6041-4189-a559-a16be07450bc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:01:39 +0530
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
Subject: Re: [PATCH v3 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0b5d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ee05V1XPiC3bpTzN_coA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: b-WKUyUzY3d0NiMBdnA6iXReYef6-DUJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfXzIAdtTEb+P+3
 ep3I5P0Mbx/XZUoXC9ZV8x1sEXB1FuWFgLuuHoATU43EnXumHbCpea7yC+9LxvABaAIJKcMQyG3
 yyE+3ROmQiuLKmDoHJoYEQN+FG07+kE=
X-Proofpoint-ORIG-GUID: b-WKUyUzY3d0NiMBdnA6iXReYef6-DUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX3qT9Sg3NTSSg
 NgoQrsjU22+Zi656cVXoLmHhDe3Ih4MGij40THGfoTItXWVQpYHhxKyRspA7Yz2qXWiNgd9nXRV
 0x5VJgZcOdk7UlOXUQkULI36aYtPG/S+1++9fNCa6FcqLQfEzLn7GOFPQldo/eNsDfZXUf8+kax
 Y+P6TJQ6Hgm6F0h528vrg/yJnrGFl5Y8zzscUIl5+t9+LEQxRmus7mB4ltrE3dXkKyXlgij3FOk
 z0cFcr0sHUBGJdf69BoPgzuR0Dobt6s3Itx3gNxcVk5N7/TAVvZkd4+81hcjgR7YE1JkznqZIN9
 h7KplRYAfljjp4CMR/PEtiz3wg+22sWQfDmGsBnHnzlTVdwLBB87N3Jdiw3agyH0ua4hD3NLiBh
 U7PQyCr/MuNpGfW2AbwhfdCE5cGqiUd9vj6SoBQ4+PHno9IwTft455wPw+21HQO+eGCv63mfVXI
 s69rfC4pekey5WBEmZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270057



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]

> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum i2c_op cmd)
> +{
> +	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> +	struct dma_async_tx_descriptor *desc;
> +	struct gpi_i2c_config peripheral = {};
> +	struct dma_slave_config config = {};
> +	unsigned long time_left;
> +	unsigned long flags;
> +	dma_cookie_t cookie;
> +	int ret;
> +
> +	config.peripheral_config = &peripheral;
> +	config.peripheral_size = sizeof(peripheral);
> +
> +	peripheral.set_config  = 1;
> +	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
> +	peripheral.cycle_count = itr->t_cycle_cnt;
> +	peripheral.high_count  = itr->t_high_cnt;
> +	peripheral.low_count   = itr->t_low_cnt;
> +	peripheral.clk_div     = itr->clk_div;
> +	peripheral.op          = cmd;
> +
> +	ret = dmaengine_slave_config(gi2c->tx_c, &config);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "dma config error %d for bus cmd %u\n", ret, cmd);
> +		return ret;
> +	}
> +
> +	desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
> +					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> +	if (!desc)
> +		return -EIO;
> +
> +	desc->callback_result = i2c_gpi_cb_result;
> +	desc->callback_param = gi2c;
> +
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie))
> +		return -EIO;

Rather capture ret and return it if it's an error ?

> +
> +	/*
> +	 * cur and err are shared with geni_i2c_irq() and the GPI callback
> +	 * i2c_gpi_cb_result(); both write err (the IRQ handler under
> +	 * gi2c->lock). Reset them under the lock before issuing the transfer.
> +	 */
> +	spin_lock_irqsave(&gi2c->lock, flags);
> +	gi2c->cur = NULL;
> +	gi2c->err = 0;
> +	spin_unlock_irqrestore(&gi2c->lock, flags);
> +	reinit_completion(&gi2c->done);
Safe to init before dmaengine_submit().> + 
dma_async_issue_pending(gi2c->tx_c);
> +
> +	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
> +		ret = dmaengine_terminate_sync(gi2c->tx_c);
> +		if (ret)
> +			dev_err(gi2c->se.dev, "DMA termination failed for bus cmd %u: %d\n",
> +				cmd, ret);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return gi2c->err;
> +}
> +[...]
