Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA3444162A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788637; cv=none; b=tTS9CMs2dOdUFSSKrs1AEhkUdve3qBjOxNl6TB1/SOPFDsGe1bpvE2uDb/OshzWIYvwXNcbmL6lNhnioZaEZaqs6M3ZkllvWxGdESGlI9eBj+rNUu+9RuMBmoPxcnfm5rR0jtm3e3UyXdnbic1kTQVEqG60d9bDVkgxzhksD778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788637; c=relaxed/simple;
	bh=eT6fsLMbR2UFOkDeve1mfrjortSWd6vQ21sGeyzPJH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zq0qHu4yZslvGe6HSU0HXQBBHe7zww5LC7gMBvNoGuBo6vy4ZBz8zSV4xP2meew4Uw63/ceoQqulrVNU7AKk2kA7yhs3X+kBAjzRbjF/iUzdtKquYr5JuHvW2j+nvUJOOluGiHY77enSP/LvJyIjFU4AR3WtAr//RyNZhEIpTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX464/J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ij1NV7Fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JX464/J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ij1NV7Fu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55Tf72436411
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NynDrnHfo4gRdlUbmNX8OMBngvYIhwZ35iVPdJaj4Cc=; b=JX464/J/kz3FmytP
	qTNVQLk1Eig1Uydwo6YyaYYNPzRD5itv6JcUaN96VOIOornTBHL6/APxv7PyeFcu
	kW0J2lcWrn7LytvFbVS4IPXtrV7BLjfXWUHoGkIOQFGbYJ0mOvU7RdZNbssuhwzd
	RkTNLQnMZkOdfluOcFAWechqQhmah5i4u+VywGnOzX9EXINcNgVPo9HXq7bYgkme
	fe/1b/bKp9vOAKUIxblU2oG/B600bV8PzbNhQhzeiV3081LpwmFBgUv6CMNYwnVS
	tB8HGSJwT+bzjBzNddL0h39ihuh1uHHfiyrWKnel4G588bUTNOf5W2Yi9pNwQLNT
	BDoYUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fdkuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:03:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b8c60c550so5769506d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788633; x=1792393433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NynDrnHfo4gRdlUbmNX8OMBngvYIhwZ35iVPdJaj4Cc=;
        b=Ij1NV7FuHUIzBhLfw9WU8HG4J86dIVDpUiR1VWjF0jwXZcLdcvPTeF9nMZea09IL+o
         qUDP3oAYYcMjJofX7BbECOJHJe4vY9BhrcH79VOEVHjiKl8OocjGNJSg5og57eY3oDgS
         loMlWVpuR4uiplcLHPhE41GHP90vgX3ET4rTK0CAA1T70nNrp12BgPgCnd0evNQIHwbb
         S4bHqnNY7inNICKoNU/Gu+IaVRPhJquSOaqd4s4hMW1ouv38X0m7fWUMw0CSv9J9er5W
         hpuuauzYQ+Mt3XSNPpCRWlyXI72q1GkjXmFUjD8lJc0yGGWTeBOJJbYz0aX2fYdxKpW3
         GkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788633; x=1792393433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NynDrnHfo4gRdlUbmNX8OMBngvYIhwZ35iVPdJaj4Cc=;
        b=DQvq0pQDlGTvFhObFHklECiu6ySfj1P8+Ig1Kj1jrSUnRcr3jWnJri0bApcWYE8NnE
         w/kDqvXghXWIGVw+tUz+ikLWkLjPqv72XVOB2ntiD9kWMpoYjW2GdymuFr8VULCbcmvb
         v41Egxkis3821gTQB07mKzsKwYl5JdqtKAdyYbgkQJu7dWIGsmYPfJZTJwLxMhngRcLT
         Rgo8youJH5iQz0i4oyXVJqfTHFCMjFgaxJTf9uYF4CQJ6vaDyrfd5+DDH5RKAILNwzOn
         8ECfccqRGpXf2wRpZZOnczvQKVnvzIJ63GPIQ6SMrLmkuV0VarohykERsXbKBbeYHuFk
         hLzA==
X-Forwarded-Encrypted: i=1; AKwUvBygdiXmM4jKZRhysJCzUL6elaa3TuxAS0i0ELH+E0+v3xsJ5ZYnX17A9dyKik1fUBzDGfCSJK1z5XcVsLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy3et+Ih7n0nxZ4tfUqvCv0ptDe5wzUSxEwRqkzD4qpIB6ILk1
	pGea0TabTBdvKY98sMNEeVlbIXSSTuK0o3GMMsbROE++vz+W/3gQDwkMGLsGF/w/4yVZe8sXxQc
	lkOyhMWtN5d+3CDWYCWD1M8P+C+phh8a1+LXQusv6r48LUPSodgda/VMQSwdaUriY/Cc=
X-Gm-Gg: AYBFou3oWfszMy7QjrqCzyT+RfPpZ+WjtFksSShRWE64p0fm+2g0D36miW0tmAgzATj
	DUdPnxXMjOHWrJ9VUoewqposetoYGJZpFjxV0IVEvPZlmmc87g9BBrEY6/Mb+HoTDo4/GSalwPB
	/0KBpkAnCLE1f1MnpEJojJwSTKDpcQor4cFt+pn3ckX9O+DuR418UovEdgWxpGZTY1uCarwN8F4
	waTrVkXRQzcLypJPAi5ZplTEJ/9X/Cj93BIuwOIKJ2D+Dv8r++0LoeTO7mJHnvjy6eHZ1IlFMPg
	fp7UgYvi+nSCcYuuO4St7jn3iUTM+qL95rdEvUsnnTDBZVf+lYxOdXzfsOEg1KkqNZzBs97VkAp
	BPAWFRbIBgc12aalD8Pmps+F5faiiCk+Kjqr+od4=
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr1338995485a.70.1791788633424;
        Mon, 12 Oct 2026 00:03:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr1338993085a.70.1791788632921;
        Mon, 12 Oct 2026 00:03:52 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm425187655e9.4.2026.10.12.00.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:03:51 -0700 (PDT)
Message-ID: <0dd23635-2456-4554-b5d7-083acb05a8fe@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:03:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for
 CSIPHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
 <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX9Ex+8FddSet6
 s826B9JoZUf9RPYGAGGuph2qKncIpLpFDSc70ofvsQvymmKhUxMdTrPMNeme/d25tZrCUdt0cIR
 Zdi0Crc/q3rX3hFdgrKgSUWpX31dm00=
X-Proofpoint-GUID: 3KHDVFIZ2LL2q7eeYJVk6mgZr20zQqy5
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc865a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vXUyycre0_kZgye-AP4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfXy6kDtUM4BnTc
 NUeUkYDPVF1jnCp/U50A7kVNyT+HSF52c9EkHYZicIGP2tNmbsPYe2dXCrR47YL0C/lfVCziMRR
 QPCYjpM1EdNPwMQnqBKGHIWev108XzW9/BPtP7UTgvq6Eg1tKm9+gFlAP3ZRFOM+yCKpIBRRLLe
 4gAPPdS5OMFoA0OpVAqtHfUbddppCHiFpphEHqTbQsrLnFy3YjLmme22AdDdNFKcJ61t8xgUkXt
 6DmjZxKZB2MdL2geTH6mo41oNvRlApKrauk8TeM+3HnhJwvHcD6pelEMy/tNmMl9pqN07EK7l+W
 rABCTvcrvTHD3na/daaEJXb1ILcRrfFfTJN/XqGCleeYUvq2BsO20L91cefHeAqYl9tWRliP7t7
 h7MWQwTb2614FUM8Ii3qv/wUSG2R85lJ42P8blXjfnVgw2nlFKYPyK4Crd9nXFCgS26NOw8LArU
 V7HSnfXRmrtHjPhde6g==
X-Proofpoint-ORIG-GUID: 3KHDVFIZ2LL2q7eeYJVk6mgZr20zQqy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120027

Hi Bryan,


On 10/12/2026 1:39 AM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
>> routing table (one VC per stream) and NO_STREAM_MIX routing validation.
>>
>> enable/disable_streams pad ops track active streams per pad via a
>> per-pad enabled_streams[] bitmask, so that multiple source-pad
>> consumers can share a single propagated sink stream without redundant
>> or colliding propagation to the sensor. The shared D-PHY lanes are
>> enabled once, on the transition from no active streams to at least
>> one, and disabled once all streams have gone idle.
>>
>> This is opt-in per CSIPHY instance via the new streams_enable resource
>> flag; no platform sets it yet, so CSIPHYs continue to use the legacy
>> non-streams subdev ops unchanged.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> + static const struct v4l2_subdev_core_ops csiphy_core_ops = {
> +       .s_power = csiphy_set_power,
> ++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
>    };
> 
>    static const struct v4l2_subdev_video_ops csiphy_video_ops = {
> @@@ -932,17 -981,17 +1133,30 @@@ int msm_csiphy_register_entity(struct c
>    {
>          struct v4l2_subdev *sd = &csiphy->subdev;
>          struct media_pad *pads = csiphy->pads;
> ++<<<<<<< HEAD
>   +      struct camss *camss = csiphy->camss;
>   +      struct device *dev = camss->dev;
>   +      int ret;
>   +
>   +      if (camss->legacy_phy)
>   +              v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
>   +      else
>   +              v4l2_subdev_init(sd, &csiphy_v4l2_ops);
>   +
>   +      sd->internal_ops = &csiphy_v4l2_internal_ops;
> ++=======
> +       struct device *dev = csiphy->camss->dev;
> +       bool streams_api = csiphy->res->streams_enable;
> +       int ret;
> +
> +       v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
> +                                             : &csiphy_v4l2_ops);
> +       sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
> +                                       : &csiphy_v4l2_internal_ops;
> ++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY
>          sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       if (streams_api)
> +               sd->flags |= V4L2_SUBDEV_FL_STREAMS;
>          snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>                   MSM_CSIPHY_NAME, csiphy->id);
>          sd->grp_id = CSIPHY_GRP_ID;
> @@@ -968,22 -1025,16 +1190,35 @@@
>          ret = v4l2_device_register_subdev(v4l2_dev, sd);
>          if (ret < 0) {
>                  dev_err(dev, "Failed to register subdev: %d\n", ret);
> ++<<<<<<< HEAD
>   +              goto media_entity_err;
>   +      }
>   +
>   +      if (!IS_ERR(csiphy->phy)) {
>   +              ret = phy_init(csiphy->phy);
>   +              if (ret) {
>   +                      dev_err(dev, "%s init fail %d\n", csiphy->name, 
> ret);
>   +                      v4l2_device_unregister_subdev(sd);
>   +                      goto media_entity_err;
>   +              }
>   +      }
>   +
>   +      return 0;
>   +
>   +media_entity_err:
>   +      media_entity_cleanup(&sd->entity);
> ++=======
> +               goto err_v4l2_subdev_cleanup;
> +       }
> +
> +       return 0;
> +
> + err_v4l2_subdev_cleanup:
> +       v4l2_subdev_cleanup(sd);
> + err_media_entity_cleanup:
> +       media_entity_cleanup(&sd->entity);
> +
> ++>>>>>>> media: qcom: camss: Add streams API support for CSIPHY

Thanks for pointing this, i am working on new version soon v2 will be 
on top of csiphy changes.

~Gjorgji

