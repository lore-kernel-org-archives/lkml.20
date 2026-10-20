Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463274;
	b=guTouHmeuM0B8AGSMYfUHNLfw/oO/Yc/mBhrKAG9ztOET+8kf3xwD3mb2wr/F+meHJ7h
	 S52GXlyQ9zdAFwVXW/tN17CuXmVhVqeNPvNwKsQdaa33a+L6wNghyAIIiRbr5dWeGfu8l
	 K6gRioyj0o6SeJhIH7CfjqHtUQ5Q/dmBwtJghf79cdNOgGUZmwUmw7P56yF0B+c+zI47b
	 r86xHNSehBiUKRmTzKTuWP32ZtRl5jSre9yhE+C2+QaGLhEpzjSWaKZp+ip7YgQ7YFJww
	 Ty+b24OEjGYvehoUkztdHxW+KhWJHDTIL4aUGLfaE4tomNFPlXkon33brvB0jb+Frsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
	b=1A8R9DNO3B7kw+9RDkUOHIfUpl+kZglXowWEU2+XaatW0/pDmUsRrGlyQRBprX10+U9l
	 o0W0GJ2ZrsRMa9oHqrGCTNAqLeFbSbfAkhnhpw/CeDt2SxqLd4Hdc7aVWlT410ZRCCSY8
	 W0WmsvH66hbuFmej2aDsSsFfJHwhQZLLkMfCvQ7kmyzoozaVsNybtJJqOAsDf/3Qp1eFb
	 25mFRppLnjCjIOVZPomYEFO/fkueIv8AFHQcagL/Yth7Q/FjX4aZn6OuGnSIlQYiPylpj
	 uwrvECg5UEeglkriumda6FVn8VOIesgxeN+HWvcmxHF5RInNDfGisoDr7CjJQTlHdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U4R/z9sn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtrihESl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F9F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F9F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4R/z9sn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtrihESl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tTTs3306628
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=; b=U4R/z9snMyG7KDFa
	Tgbu0rA8z0xKAwe+TYGMQ+pBVD+Rj6C/5wO/r+c4td/5PZ9LshZyf9/Droq2h4P6
	RFRtc0U9oDt//9AGRoWdzDSqUVXKOzYAkp4gqXBJ8eTSm5bDlA+ZPaE1l32Bvja2
	UADGYRSAHPvh8cYPLKgrLv8V8tO8nPD7x1z7RztWY9XbPT0F8w47FNByhUYd75bg
	lrR7NhkF9Ein+g6mVwFa68okZDuhQt+3dQW7yKSOrzohnKYiO5g5q1DI1RELsZFB
	diRmgBEZz/rpV8xXMQ2FWSxQV9qZysUKhzkRofxHMisr/IAGOAOc/3XVNNFPtj/2
	utltqQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5srfa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:27:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-15c16792146so412297c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792463270; x=1793068070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
        b=LtrihESljL+NrMkNRr9q75WTVV4JeWvrS+6fU2k1psg8ngYoJiiIOCgR23DbbNaV/O
         InVt4WWMGKX8pc3Kb3OALj/zRyzM+Ghc+IsDa4scqnQX192br+n3OZscQZgY23ZmubYR
         HSDCa83/UI96cxMMxRmLNi8ivIsd7LpwBoY7fRMe/xh9+pJFVM2ZobuDt6GAqrqhEmVa
         imZGXR80SMPj3kVHxtnyF3GCGeHcDgDsAh6N4GZhhetKMXDhb0JLhmgeFQMW3+zfrdN6
         dh7bQPyxQwDN6jsD5+OIUpMc4AukLcKjCUr2AfuL+jTDSvo0KEVf/96ebFFbm+sKxjMb
         23jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463270; x=1793068070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
        b=B/6wJ+/9MnWBwN00NS3lKMlBw/6luq8nBnDEgBgcdcXVPq0Oucr9w4PpBqRtuvAPEZ
         QevFNTliked2KFNMerPZ14425szK7ItAn58sj3bgOsUN5iH/BU3E5F3QsvqFjMT4uvy7
         eDuyZPc000Ng6UoQYpq2NoBjnD+kFTz4Kue71ojDuVgcXHiky3xIYceHsRvFq88UzqF6
         of5PzQ6xF+Jy0YnUya4NXmaMQwld66D+vK7o+93+A0hVomFBhOO64Ey8qJ3x7uyKLNfG
         CAEnlqfndG5se9sUjywi6yRGCDZWzUDgYYPyRoqbG2Hy0+bidl9lZzA7H2aF0ywmzWKK
         sOyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeK7hWo1dhDJBRSYKkW35Ht6ZOVBJK8YEB9BMHTuJ3E/KpkmlKNmku3ZOyKWHjctyi9DqgM/vop2LwU+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1TrHiXHZXWmEkK1+lyEL0tQuDgSokeFJKPWSabNwjz7Tymum6
	mhl4Tz0FBu3/HLVMp/DMfkYN9MLPSncaUfr/+m2OeNv3ICrJV/jTVkwalW3my96ZOSdZYtCSXxU
	zSt1SD8tN5cMbdMffZg8iBysz5m+XFC3al7waLasnpC0eudNq9LaPNkuNS6UiQsf18NA=
X-Gm-Gg: AYBFou349Jp2Y0C4jgNlQROIlqs+WCKU04WQPGkotN6pUqbY4jVqXfgjSRnQLVHIKf1
	GTHr1mVlpS53r/YqFUqDlIMzqwdpTS9EOvYWkFfxjDX6PgPVgTaPsO/CCJJAJ6txI7FuqFcqcB2
	hYgNoxm0AEHlqlnPK3MvSRP4vRK1qzGEpup3xmy8u0AKlh0Wfj7y8wbU5z+qcwtNH5iwhn+voN+
	cKRrbJM86hlzHTsAKkEZQR/te9EO9pYgqHaUYRwB1ZNThGjR+nxCS5tRDRnlrWUXApcrIQVOisS
	1P4ktiMUWXHJNGotggbeCKrUeDru7ogYPo8GaCr35o6MggbQRBEKJ39aEbM5208ZlOsSh3CDLCX
	hy3g/s4g4ILdYnS9/0ApQHmUb1Y21QQb0Vxi/
X-Received: by 2002:a05:7022:b058:20b0:184:992:c9ef with SMTP id a92af1059eb24-18513e7b16cmr13145754c88.36.1792463270456;
        Mon, 19 Oct 2026 19:27:50 -0700 (PDT)
X-Received: by 2002:a05:7022:b058:20b0:184:992:c9ef with SMTP id a92af1059eb24-18513e7b16cmr13145710c88.36.1792463269894;
        Mon, 19 Oct 2026 19:27:49 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm37166393eec.23.2026.10.19.19.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:27:49 -0700 (PDT)
Message-ID: <ec40e4aa-fbec-4d0d-8069-f6ca80d9cfa0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:27:48 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX47Kk2YVmQfbH
 Rwm2a/Sysm79N48Teh49Uw6z6fXzH/8OuNHObjqkTQJETJLNyGwdfMv9zDjZmFtF75F4d1olJmU
 SzpCdfC16A4bN31gbBY10vRZbSLSbz9oBeKTYRkvIyNJZC/a85tvXDCbs4LqplqSZyd02RS+KQv
 2NoQyiktEKhY46IHd8Ns6dIUNICPUOjY22vKqibAXAvWgyfuJrOZag7jW75oPiIiYWkCIoeoxsk
 6YNotHu3tH/a3TWROge+z3JS6UUkOjILlLd1NTCd914Xyo4ViuyN7IrgWqhaT8bJDN1/75RT2G+
 UXuqDgRXP3nIM5rQhh0lvRUu969eLymr0xP+l1AiLBPTRqeLsXiCWSPrvbP6gEH6lHn4X8FMoOn
 lWr5BijVAxYlLJ55hHpWMbNPto0PGCO0q4hQ5gngSilAGTQx1K9rKymmQnSpG3iZ8xL1h57Y7TL
 l7MhVWBB7ymrM2m7WWQ==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad6d1a7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DwEuDAnPNnevPiDVzDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: it_Xsb71BAuLRkbjA3iLGddKOb7vC1mp
X-Proofpoint-ORIG-GUID: it_Xsb71BAuLRkbjA3iLGddKOb7vC1mp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX86ZYpRqH6Ixs
 AEUut5PwqE+fK5UOVwBulN0zrgXcFdpDsu5BsFB2GNug74XyUC+2I7fDXY2l1ebcGIjlX0bkzms
 +AyBbKiy6RIIBBr0+bzf60Ep8Zbd+2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200009

Hi Bryan,

Thank you for the feedback!

Will rename cphy to is_cphy as suggested.

Regarding the lane positions and polarities, you are right, the PHY
driver already handles this in phy_qcom_mipi_csi2_parse_routing(),
parsing both data-lanes and lane-polarities from the firmware node at
bind time. There is no reason to pass them again through the configure
opts at stream-on. I will drop that loop from csiphy_stream_on() in the
next revision and keep the phy_configure_opts_mipi_cphy usage limited to
the dynamic per-stream timing parameters only.

Thank you,
Anusha

On 10/17/2026 6:44 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 05:05, Anusha Arun Nandi wrote:
>> +    const bool cphy = (lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
> 
> suggest is_cphy
> 
>>       s64 link_freq;
>> +    int i;
>>       int ret;
>>   -    dphy_cfg = &dphy_opts.mipi_dphy;
>> -
>> -    link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>> num_lanes, false);
>> +    link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>> num_lanes, cphy);
>>         if (link_freq <= 0) {
>>           dev_err(dev,
>> @@ -346,23 +345,49 @@ static int csiphy_stream_on(struct csiphy_device
>> *csiphy)
>>           return -EINVAL;
>>       }
>>   -    ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>> num_lanes,
>> -                             dphy_cfg);
>> -    if (ret < 0) {
>> -        dev_err(dev, "Invalid config for link frequency %lld\n",
>> -            link_freq);
>> -        return ret;
>> -    }
>> +    if (cphy) {
>> +        struct phy_configure_opts_mipi_cphy *cphy_cfg =
>> &phy_opts.mipi_cphy;
>>   -    ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
>> -    if (ret) {
>> -        dev_err(dev, "Failed to set phy mode\n");
>> -        return ret;
>> +        ret = phy_mipi_cphy_get_default_config_for_hsclk(link_freq,
>> num_lanes,
>> +                                 cphy_cfg);
>> +        if (ret < 0) {
>> +            dev_err(dev, "Invalid config for link frequency %lld\n",
>> +                link_freq);
>> +            return ret;
>> +        }
>> +
>> +        /* Set data trio lane positions and polarities (no clock
>> lane) */
>> +        for (i = 0; i < num_lanes; i++) {
>> +            cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
>> +            cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
>> +        }
>> +
>> +        ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_CPHY);
>> +        if (ret) {
>> +            dev_err(dev, "Failed to set phy mode\n");
>> +            return ret;
> 
> We already derive the lane positions and polarities in the PHY driver.
> There's no reason for the CSID block to know or care what the polarities
> or positions are.
> 
> drivers/phy/qualcomm/phy-qcom-mipi-csi2-
> core.c::phy_qcom_mipi_csi2_parse_routing()
> 
> I guess the PHY already knows the polarities and positions - or at least
> knows them for the DPHY case.
> 
>         /* lane-polarities: optional, up to num_data_lanes + 1 entries */
>         memset(lane_polarities, 0x00, sizeof(lane_polarities));
>         num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
>         if (num_polarities > 0) {
>                 if (num_polarities != stream_cfg->num_data_lanes + 1) {
>                         ret = -EINVAL;
>                         dev_err(dev, "clock+data-lane %d/polarities %d
> mismatch\n",
>                                 stream_cfg->num_data_lanes + 1,
> num_polarities);
>                         goto out_put;
>                 }
> 
>                 ret = fwnode_property_read_u32_array(ep, "lane-
> polarities", lane_polarities,
>                                                      num_polarities);
>                 if (ret) {
>                         dev_err(dev, "Failed to read lane-polarities:
> %d\n", ret);
>                         goto out_put;
>                 }
>         }
> 
>         csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
>         csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> 
>         for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>                 if (data_lanes[i] < 1 || data_lanes[i] >
> CSI2_MAX_DATA_LANES) {
>                         dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>                         ret = -EINVAL;
>                         goto out_put;
>                 }
> 
>                 /* Convert data-lanes = <1 2 3 4> to bit positions */
>                 csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i]
> - 1;
>                 csi2phy->stream_cfg.lane_cfg.data[i].pol =
> lane_polarities[i + 1];
>         }
> 
> ---
> bod

