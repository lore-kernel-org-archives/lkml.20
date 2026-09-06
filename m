Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC731280D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709677; cv=none; b=M0MzEqsr23wh9578l81uANMG0aHh/fDMDVY4JMDtAp0TpKtp49WPMIT41EqGh3x6bKRPmcfES7aNOmRNMmP8UKw/Q5oA0EqOaKYBSdNamBViPiAFenRvI7KYU1ZteoCO+/lVxts8O8x1z/Wwr6vjThLsDwByjJB5NiPvv6lekBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709677; c=relaxed/simple;
	bh=Qq5Z9pdI3WCpDQKVL6vyoFgxWJ8z9w4v5ed7QbTfgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSEX/cyOy+BEJuzsWteiF8vLtTsopNqzFhBz/FiaF6e053oNGZTaRiOsn7sLG6Ktl+7rIm6+lWLaZR7LJUE1rvZwH25UEK3cdfDw9nXCharZ3siN07e4+g20XFQiAMqB5VRKNff+p8Lp7dAIf4w5GdZczPEZ7z+z1KMEf9ujT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiUod8Q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8puf4WH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiUod8Q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8puf4WH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EX3m1087941
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 15:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=; b=RiUod8Q+hPKtNg6q
	lOXnR+TICE5yki5olBYNDrHWNCOtU3q/IZRU3XGjns/3X9fkyzBofWf31R74XR6U
	7QMBQQwzUHhPY7MHjhAz3qaN+xo/T8A2zKHop0jI2DZNmu/shOcxnZfWWqwOUM9i
	d/kc8sJ4vnTNrnOzjAZEEY1mfgKIztlmGi5jc4jjYyLFrL0NhHbieSDUKVe7eUor
	qLjEKRl7OJ1B4+nur1BLBCarGbTTb0qKFUde1V6T6F1RDkDFQA8K3agv6v1uS4jb
	dx2DKBHCStVhzqRtK0s2Lgly1iVNlOBKRE/vbXNjL12mVJAPt2dtHxzgzocQpRWo
	BguGGw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jbm6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:47:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so2216092a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709674; x=1789314474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=N8puf4WHvKZeOPFPPpMOLkJmF1ptBVZX43NUnAyqVTHxMHx4aLB3RB4jQhCAApLtWI
         UPfBffSVBs1NeGavyOckItqcvB7YVM6b69x2jfwi0ulx+L3NN0YNM2RRC7OoPlsn5u9p
         TfenzrdISMIxiA7GpGsY2OFWBcBel7YZq91lrnYKtTU5G1BfhHPHZXXK5Fb2HN8NRjQd
         zJLlFmm7eRdxJzlfH6CkdqI7bwtMab4Jqs0nbd9zCZMCGbdC9sL+IOvzutn4n0xEpupw
         foIYCDG39M7Lxk/+CFMrBZRBf7itb35ETyCT+FCCJKrnGYURzHJF0rhI3Xv7SopixA1A
         0VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709674; x=1789314474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=It3wJ0dESUGuq9YTJkHsKyfQIRQwYlb3x9wrfrCpOyUmMO9CAJ+eSvnH5ciW9vTXz/
         GOcbXHBgTxT5ikbKHiEAmyKHFBZFTNMGXc1Gh2+Th50KV5XYXhf/Ymci7pXahZEQAbRe
         QpnHFv9kRelqOKp1a1gMn1NorQlEtktK4nKFnsNbMs+iWHELv9phrLqCAfRHuZZQ83vl
         3N17UmsJ5MmV2h5EyjsT3vWjOqi0KgJH0ot5Ad5Srx8d2kc/GEVWNwYEhqJVWiHxzMgr
         7Q4k3+LwgQa36M15pEGx6aZQMp0aG7TQTCSKaucXIAq3VP6NvGDnZZGUM84zH2I2/7Fu
         H28A==
X-Forwarded-Encrypted: i=1; AKwUvBz5O2ZJ+zMQM7aMQGxxdhyOAaSC3dTqf7ip9suskRK4M40jzvE2bXPTHG3E/tkLZrP1zacfFwl9GNVA2Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++kvZ211MTHS1NmFbvPPPq9Ig5xU+cjNviEHkClVNeCyExlh5NaY
	Zf19X0SaT89tRmy5OJblW5F4aQf6ykPDfa21nMhtkmBeu5xZfrsokAT2O/Bm0GShBHUauvsJxqs
	oNxTmRrerHdh7H4GqbPY7xYO8Wx3hqP3fkh7ymWdcP66EpnDd3+A3S1zW0uw0WAgYCnw=
X-Gm-Gg: AYBFou0F11+z+EEacj+PNYWS+GYsfjZ1ryfbXVspyPjLqYJWT7opHI4fADysITZBVsq
	232KoimhyiFGzfJtgayKQxGAYz9cg6jioMqhR/4SsRfkp1PQCqSfDe93N204d7mrSB4GFEOckS8
	r/5mNnVjf4WGzBKGtQJoxMJ/K7xWZbDivm3wJ4GZ1HqEecU4iogztOmmm/d76ZFav5exuNFDQ4u
	3HRAbPK6J9dhv6dy3k4aSCWljKUX/K/jLFdlblE2jWOmStp2mj018BrcrplkiuAzBSEcWR/VVpo
	Gdn7a9q+L+unxfFNoOi6cy0+9TEXGwzRmwcwsHSpApZwDsllqx4Ha9swPRRjlL+rYf+dTjTbWHx
	GlwXVzjWxbU7lBf6FjMmlbB24PaoQ
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362730637.8.1788709674497;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362685637.8.1788709674052;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm20951125eec.12.2026.09.06.08.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:47:53 -0700 (PDT)
Message-ID: <b0089142-45eb-4cf7-be6f-45c9889b3756@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:17:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xGyUaqqLNWtSHyqstTA1Ev-aSLJLHYBm
X-Proofpoint-ORIG-GUID: xGyUaqqLNWtSHyqstTA1Ev-aSLJLHYBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX5fuu15c1smb5
 M1wYObqPurX1F3v/gQZ9QPrUfaTVOCcwAQ6cKwkA/tVLaxo8Y5ry0ADaJQcf6ys3inpRjsM/4uP
 Gke8/ria7TWwmgd6ZEKa+kIXPm/Rg4laxu7JCD+Nx3MY78ErBwPZ/r3ZWjsNitcAwunjNksx9ca
 tv+8vt8USQ7nvDdTRUYZkZdEgmcVEA163nJfe9QFtu6+VaRIZfRAA3kHiS8cJ7vovwnhL39cNIQ
 HyvV+k7vIiESuaJV0Qg5y07pFoGzYN/FEQeLMJI+7UR4769Z1Y8YpK6J7yr3sp8nsevokqatAHq
 bZyzNBlv+m3VZL7yFoHUIglKl2XYMNRmBzo54HlrCSgvAprgw7staIcoD0JP95hgMCpmSXEVqn8
 1an/tipXRlxumx5DMLxHQh1Wan0vW6ukJDG1/bl4bzCBprzixdgnZXdFILHOI73UagJHAOLuG1Q
 aMVmnSekEMwT7EqmtjA==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9d8b2b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zWu_p7zOJ7ruh_JjBGAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX5EzXie5zIX5m
 YSYhjFYzMX3SFv/3bZSAPnv9IiWWK9PJkA/GvBcRAgxzWWnRRdWeR8qIvmZFuBBuU7C2LOl58PN
 BeunJ8kZBY1NzMe342hlAxfk/SdoNK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060176



On 06-09-2026 19:47, Bryan O'Donoghue wrote:
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
> 
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere.
> The PHY side code normalises the input data to register level meanings so,
> replicate that logic on the CSID side.
> 
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
> 
> Existing bindings are not affected.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>  				     struct fwnode_handle *ep,
> -				     struct camss_async_subdev *csd)
> +				     struct camss_async_subdev *csd,
> +				     u8 lane_base)
>  {
>  	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < lncfg->num_data; i++) {
> -		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
> +		u8 lane = mipi_csi2->data_lanes[i];
> +
> +		if (lane < lane_base || lane - lane_base >= lncfg->num_data) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
> +		}
> +
> +		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
>  		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
>  	}
>  
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
>  	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	u8 lane_base = camss->legacy_phy ? 0 : 1;
>  	int ret;
>  
>  	fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>  			goto err_cleanup;
>  		}
>  
> -		ret = camss_parse_endpoint_node(dev, ep, csd);
> +		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
>  		if (ret < 0)
>  			goto err_cleanup;
>  	}
> 
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
