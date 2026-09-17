Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E44E0208
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672898; cv=none; b=TNUKr+7nqon3r1pYfvIB1YVeUYeNK9TPILOG2ePl+PL58t/jw4FfTpdhLrtv8GgOlu7A7zgjfgr1Sf3pEnybQIYreXguucj5sJqZHOGpvKHSWlxwua6OfHvWHtW7RpnaWla5YBQ71t0OSbQtjXNL6XOHwGFsBXcudfRgBQd6vUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672898; c=relaxed/simple;
	bh=/rPZmwXCrcOeH8Le5aXgmYbzSOgrrCcjBpW7zNJII4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikx+xcEo+4YoS14cIt2wKGGMKX2ulBhYfBc8h1lEZLrICSYxgGdywTJZf6jx8Ys36QNrYMIjMk6epXGQ71/gzGqV/1GUYawB2JuI42mPJXtAee+cWs1G3o6uLLASUpJmmlMsYrpc/5PrB6zS44T4fvRV0Dcho+c398d3GgGNvd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjYZGbyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2Cm/v92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjYZGbyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2Cm/v92"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5ebX2887276
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LE6GawEmp+QYZ/dzIcsSal2zY7Oz2bE0cZ0j83mXjUw=; b=bjYZGbyo0ADmeDSF
	ajNeZNsK+OBesh+93HSIMTi7kaQAw2PBsrONL0xq7gFy1NDuQqYpBcOBVJi1D0Qk
	0IXPnFUqx608WMHYjjGDjkWW3cSVtVcituUWpqlGdfJFtIXKgKbl7wUTVAoptKHS
	w/0IoQ7ll4+Vfv4vZBvMxDYtPvE2cm3Co2q4IcJurHOdSKTST+B1HofQxJO6LuqI
	iOMcPrvAHR50PBagMcLle4lbAA2/yXeaAivKrUwG+EBhllR04Er3Him4ULFna7UI
	MonYEXri1nWeP643wN7IB3LlmsVX6VOps3p7nu+Fe4Ak80CaBZFKy5XDHM6INf1S
	OPa2yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6hfqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1607319a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672893; x=1790277693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LE6GawEmp+QYZ/dzIcsSal2zY7Oz2bE0cZ0j83mXjUw=;
        b=Q2Cm/v92lNqRnYk14pM/zdpz4zGdS5Uj7wSjyAPz7max0GXolNuG+UOfHS9Dr/zd9T
         0iyF5biRZ4s2EcCUgZRcdr4PKhtTkmnPk7E21Vp4bR6ayVV4buI+rvqDQGZuiW4b4w3g
         dAJ5YQFgHgbwkDK4k+qgqC2JYPHhHptc4xYWESPmckabDqVi0Vq535N9c0RzKlFnVjar
         TD+zBE5qFkY4BAPachla6X+IbGYQgNZtKa3qltjX5PwOV8wZOa5M2koVaGfID5VFB5zM
         Kwa/rp23ZVFt2+PEo8qhEcjJU190lbfEB61SxI6LoXTVKaUa/V65eEVuo+8qNuMQP0MX
         XQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672893; x=1790277693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LE6GawEmp+QYZ/dzIcsSal2zY7Oz2bE0cZ0j83mXjUw=;
        b=LfFn8jAiL6iZnOQ+iSWmirCpxmw2aCrPjpbsWbDakSX1t/ivzVhh0aby7+QdHp8dR8
         oFN8N5Tw8q2/BwBY1msnHLmSOiErpDReo4oUo7O4lObTiptNDlZ2+/UzJc9VCIeo/n5G
         QwJcm5z0mLf2ddtgARuO+C5j8sdqcJMYRnuFcB5mgtKoxS59aP7bhtqgfjQjRFErC2zI
         vOLrz8ITBGDfrZi3fG9T8EIkVRCUjywNSagw9KVnHFz2Y0SpOzHDuI2LQ6cztf0ZG3QX
         cTReEHrmd6/JspXu+OY4UsMwoGGOt7vWIVfZa2wOTGwrIUeuer+DZK4Y02U7yRVo6CZm
         y+Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzFeKPXPBMnxwMYBOtdZXs+GwfPTOsJK4LnMbN8N4Wf3TiMV1YLgNSrL6SVpiRdGZBfPkBP2FCEPr46w6o=@vger.kernel.org
X-Gm-Message-State: AFuF++mSDRJyQLYyPSqrN4VhrOpdjCdv3qXpQmExyQFR8eh6umFixGOL
	8d9UKOpCe8jHwaH4PiWTf2lW2ZV+slOPm/mXnArtm+mR6EfLKBp3uNhRUmHwCgJypsq6HyBQ7vH
	IXX0ALyr8Ni/oDeLLHeK6Ep4DnC9GWFLJj/Ugdeex/NWnWUsXeH8h0OSILIX30kOLEVA=
X-Gm-Gg: AYBFou3xzM/jyA4kBjls7Oq4m+TEuuyQFWu8WPNjLfa0C27CFnwL0/SOdEjJQ5PAK7V
	lhmparGW2h8esgvXV/8RcqC3cAq39GItRoecsuwSNdoRONcfENNyTCT5ZUAB4x2MOdHJ3ru/b+L
	WQkynBk/194WnQFM2JxQMqommebpfB2hOEVI71HNioq+1IUxLExWo5lewq3/FuEOcGdmbX9XzhV
	b6L0zUXMeno64aJgq7L2p8iBetwVnHHcvzobJAMrQjeMrwJ8uxUphzC0Y5KBY2cZfwNqNmkEbs2
	vRXFDPA981210pAbf+xjjpLnsbD4aXYimsKBnQ86XRfOhahFPg7Mw8ovJN1qA6einG0WPe2Knp+
	a0tvIQ3vNXNn9twcYxGTUrAGLhcB+tvfIERU=
X-Received: by 2002:a05:6a21:700a:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3dd8c337f78mr30055637.10.1789672891602;
        Thu, 17 Sep 2026 12:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:700a:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3dd8c337f78mr29981637.10.1789672891018;
        Thu, 17 Sep 2026 12:21:31 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm34608769eec.23.2026.09.17.12.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:21:30 -0700 (PDT)
Message-ID: <2e298351-4b00-4871-8ce7-fe6f11e7b03a@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 00:51:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: Add support for I2C High-Speed
 mode
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
 <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX8uFyqgGTWoKb
 dYSgn0mPNw68z6MBUTwj5/fJ2X3P0k/6QqNDe+3Bi9tT+pIINooGJMtw6YaxxAIhGec3NCRQhDQ
 eba+k/XYuzrggxdo4PIKsblYDgFTl97VEjErAV1PETbbC5M3VwDywBI2qr+fbDA+8+s1fj7xpSe
 bfuta1c78OJDhkw45WICvPvBjShgphTvik74pGOrn/M6Y5zhbNYVY5kovAjcsLa7CxO6Pjk/qOA
 6Uf7tEodTuuSvwWXRaPBhzcQiFjtoWtfD6ZNzEe3owdXVFfjmTgJKIIs9jAWFMlqlK7aQlfrHKq
 IqKYR2bjHV1tidW4QDdHmsMgoTAtas0sY4OrSDkKC+xt/mSa4eeNCY7Tm6it0Lu/u9hfkRE8tDr
 xwbPb1jTyf3SE8Sv0PjE1CXTWuuYFBXsnN6t5FxXyathoseHHjaTgpUG3OtQz8q2r93azSU5wuk
 yTtFxabRlmKMeKJvKhw==
X-Proofpoint-GUID: LygYGm_sWl7yf6x8dEewoIx1f4HJI26Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX5Qg6edcTrIxf
 rKy3+Gx67uJJr7HVl7+Fr78eSdz9ropzgbYWpJ6lQKW768+q/3NozbUXoW0tq+JNOHHkHCrgDGc
 lQ/E4y5Y4FLqNt3mHsUyMzcgQTzYpKo=
X-Proofpoint-ORIG-GUID: LygYGm_sWl7yf6x8dEewoIx1f4HJI26Q
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac3dbf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/ba+GChBmZZUisokHISCpA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=c9vcjAL7SRaUaix72DIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170277



On 9/12/2026 6:34 PM, Jyothi Kumar Seerapu wrote:
> Implement I2C High-Speed (HS) mode for the Qualcomm GENI I2C controller.
> Detect HS mode requests based on 3.4 MHz frequency and configure the
> hardware accordingly. When HS mode is active, set the source clock to
> 100 MHz and program timing parameters (TCYCLE=28, TLOW=38).
> 
> For FIFO/SE-DMA transfers, use HS-specific opcodes I2C_HS_WRITE (0xa)
> and I2C_HS_READ (0xb). Transmit the master code at Fast Mode Plus
> timing (1 MHz) before switching to 3.4 MHz for data transfer.
> 
> For GPI DMA, extend the configuration with a CONFIG1 TRE to pass HS
> timing parameters to the DMA engine. Add gpi_i2c_config1 with
> tcycle_cnt and tlow_cnt fields (defaults: 28 and 38).
> Use the set_config1 flag in gpi_i2c_config to send CONFIG1 TRE before
> the GO TRE in HS mode.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 127 +++++++++++++++++++++++++++++++++----
>   1 file changed, 113 insertions(+), 14 deletions(-)

[...]

>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   {
>   	const struct geni_i2c_clk_fld *itr;
>   
> +	/* Check if HS mode is requested */
> +	if (gi2c->clk_freq_out == I2C_HS_MODE_FREQ) {
> +		gi2c->is_hs_mode = true;
> +		/* For HS mode, source clock should be 100 MHz */
> +		itr = geni_i2c_clk_map_100mhz;
> +		/* For HS mode, start with 1MHz for master code */
why ? can you mention reason too ?
And also instead of 2, can we use the macro now for each speed ?> +	 
gi2c->clk_fld = &itr[2];
> +		return 0;
> +	}
> +
> +	gi2c->is_hs_mode = false;
> +
>   	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
>   		itr = geni_i2c_clk_map_32mhz;
>   	else
> @@ -219,7 +257,12 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)

[...]

> @@ -836,6 +886,13 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   	gi2c->num_msgs = num;
>   	gi2c->is_tx_multi_desc_xfer = false;
> +	gi2c->config1_sent = false;
> +
> +	/* Initialize config1 TRE settings for HS mode */
> +	if (gi2c->is_hs_mode) {
> +		peripheral.config1.tcycle_cnt = I2C_HS_TCYCLE_CNT;
> +		peripheral.config1.tlow_cnt = I2C_HS_TLOW_CNT;
> +	}
>   
>   	tx_multi_xfer = &gi2c->i2c_multi_desc_config;
>   	memset(tx_multi_xfer, 0, sizeof(struct geni_i2c_gpi_multi_desc_xfer));
> @@ -883,14 +940,25 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>   			peripheral.multi_msg = false;
>   
> -		ret =  geni_i2c_gpi(gi2c, msgs, &config,
> -				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +		/* Set config1 TRE only for HS mode */
> +		if (gi2c->is_hs_mode && !gi2c->config1_sent) {
> +			peripheral.set_config1 = 1;
> +			gi2c->config1_sent = true;
> +		} else {
> +			peripheral.set_config1 = 0;
I guess default should be already 0, isn't it ?> +		}
> +
> +		ret =  geni_i2c_gpi(gi2c, msgs, &config, &tx_addr, &tx_buf,
> +				    gi2c->is_hs_mode ? I2C_HS_WRITE : I2C_WRITE, gi2c->tx_c);
>   		if (ret)
>   			goto err;
>   
> +		/* CONFIG1 TRE is only for the TX channel; clear before RX call */
> +		peripheral.set_config1 = 0;
> +
>   		if (msgs[i].flags & I2C_M_RD) {
> -			ret =  geni_i2c_gpi(gi2c, msgs, &config,
> -					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> +			ret =  geni_i2c_gpi(gi2c, msgs, &config, &rx_addr, &rx_buf,
> +					    gi2c->is_hs_mode ? I2C_HS_READ : I2C_READ, gi2c->rx_c);
>   			if (ret)
>   				goto err;
>   
> @@ -1037,6 +1105,7 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>   static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   {
>   	u32 proto, tx_depth;
> +	unsigned long freq_out;
>   	bool fifo_disable;
>   	int ret;
>   
> @@ -1046,6 +1115,36 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   		return ret;
>   	}
>   
> +	/* HS mode requires QUPv3 version >= 4.3 and source clock=100 MHz */
Supported for Version >= 4.3 (instead of requires)> +	if 
(gi2c->is_hs_mode) {
> +		u32 hw_ver = geni_se_get_qup_hw_version(&gi2c->se);
> +		u32 major = GENI_SE_VERSION_MAJOR(hw_ver);
> +		u32 minor = GENI_SE_VERSION_MINOR(hw_ver);
> +
> +		if (major < QUP_I2C_HS_MIN_MAJOR ||
> +		    (major == QUP_I2C_HS_MIN_MAJOR && minor < QUP_I2C_HS_MIN_MINOR)) {
> +			dev_err(gi2c->se.dev,
> +				"QUP HW v%u.%u does not support I2C HS mode (requires >= %u.%u)\n",
I don't think we need to say required version, just reporting supported 
or not, should be good enough IMO.> +				major, minor,
> +				QUP_I2C_HS_MIN_MAJOR, QUP_I2C_HS_MIN_MINOR);
> +			ret = -EOPNOTSUPP;
> +			goto err;
> +		}
> +
> +		ret = geni_se_clk_freq_match(&gi2c->se, I2C_HS_SRC_CLK_FREQ,
> +					     &gi2c->dfs_index, &freq_out, false);
> +		if (ret) {
> +			dev_err(gi2c->se.dev, "Failed to get DFS index for HS mode: %d\n", ret);
> +			goto err;
> +		}
> +
> +		ret = clk_set_rate(gi2c->se.clk, freq_out);
> +		if (ret) {
> +			dev_err(gi2c->se.dev, "Failed to set HS mode clock rate: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto == GENI_SE_INVALID_PROTO) {
>   		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> 

