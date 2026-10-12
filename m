Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D34477FA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789950; cv=none; b=NKvJ/tML+yazv9gTlFxZzKOcCdyPpUNtfMdOlgXZT63K9Hd0QUTKli1OKsYzaFnz/pqgyXWSzjPb38kWshGq+0Ml3BezZFJLBFmWT5TBuGyZQvKyx1v3Ug2HV+ZZF8dRJp7d+or49+Q0yvfLsJcqJOKLjADe0k9uPpSXcqMA9Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789950; c=relaxed/simple;
	bh=2zyEq/VgBCcszsUxIMduV8bFDSXymxQnEYZbjCF+dpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UObBSLCy47iHpmYWNDCknNHgQ+X/z48YAfaOSpusU+/prFB/NfUjXgn+7z/79UvwJMJsKm8bJCs/rJqMvZpD/sGvF12QDSos/qNjGZoaGKY8LEfMUDqjLsBtLUUULa0n9rQqBRfmOK0oEThHUWsazb2mLcL467tzFZ89ddI6IrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN13EJaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fn6AMDbV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YN13EJaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fn6AMDbV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55wbb751220
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVrFzhkPhx/K8T47whMXfQOfvS7XMcsmwu6sHgWPleg=; b=YN13EJaIvp73y27D
	Zh3me5UNfED3vH0Uxz/8SyqWMwoEJj6KnD2XLQoMmAJ5BI4VezkUmO5BwgUDnSXU
	ANJBjSN+RB8Yjt/0CnOD89TKVnl095sjcE3vpUbsz97Om+pg7Xw6fKMdx8dxlGKY
	Pycw7YF7B7aFQujH1w17S5dmkPvzIkxwzuP1/U/ca51JOfY0LZnPZKvKjKFyFy2d
	kmQ2sMYa4cKe+tnspfFXqJ5QFR8g/CmzNjKf6nAH2qXjo/d9xCFOTCzS+s0SIqVf
	/X9y9LyhPGnV5M8xvpTK+ScWcKNqB/hN0kEY55pQ8OuUwe1Z7aA07RmoDJ2Ra5Cp
	sWefBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed7xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso320403885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789946; x=1792394746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVrFzhkPhx/K8T47whMXfQOfvS7XMcsmwu6sHgWPleg=;
        b=fn6AMDbVjs8D6KIImLZCQS/QigkBG4R6jZ1k6ARKZK34kfGWNZEs/T46uvskRfC/oC
         yHgG5HnERcqvgLm+U4FNimuf1u4ctAdL4swQEi/qLM1rqLXltfdhz71JDu5ARAnRLm3I
         XdyiN/HbXwaDmDQbIPGbo+9/xUYH2F7MYmuB8SYLcSwxlvYTcHOGMcmOEPbGrEQKM6rm
         6g3j8qq8oeBk8Py4K0d+L4OveI2e153ivAJ2NpZQMLetMGKf2pF83bWaYKXviz91/yoI
         fwm7Q1Tb2r4cXWpIsvmSz8RsPteGJHEzqUUyEJ03IAQbJuIwQYd/k9KYeZkQABm5wMdT
         IWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789946; x=1792394746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVrFzhkPhx/K8T47whMXfQOfvS7XMcsmwu6sHgWPleg=;
        b=RLZvhVvhPpVzH1Umnp0zcqPeWUpXvsu/QjBnj+y3ycHCfAle2YzT2sTE0qzjcB+vRO
         x24o6wp6f/mg5Id8btYRfjo7Me34GWJgGGfv5Fhp+1seODXuE7wDQajerZOvwiDiLdvn
         7xY1lCgJMZxDIjp4owvlNV5Cml5e26yYVI8c3XBpzXAybOhkcOnXJWozFJIaFi8v+Jam
         ehRiYOurmGuRbgsIAh9cvkQtLhwnI19zM1q0LY8iQGuc0XE5u88MK+Zto/hPEs9pfEtm
         25Vwp+/2ov4PYBoBaZt3nS9bD+uuMYq7jj1w6oaRxoPmKM2AaYhroEQnWbMcUCiraFXx
         ZRjg==
X-Forwarded-Encrypted: i=1; AKwUvByieBtpK3ZZBgTVgHLCirsNqDFefocKmnNHjDXwGNH0IBugrW3iP34QKZwdXC6htvxjuVia4V2IGH8imXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb4N3R1Swv7Phd8ccFGLo1nWyeQiGfXrPGvvFTy6LPc2WPlqov
	Ut1r7m2Z2uC5iUI/E5eRYheHOC9ULQCNFqRsiy0uTy+83unUVU9G5F7GRm5VC1NtPfE5Hgk7vuT
	yZcaM/8mQhvc/V34aa6ThIiHOZotCWECEFkE7rh/LLK3fNg2Cpv9YnD0CUW1UQlCF/Cw=
X-Gm-Gg: AYBFou06XCGnHjm4sLK+CNMqGnwQVHknJrnCijzn/D9U5zrgLDMUcu3yW9EfLmQEDQL
	hluE7aTg4AFS1guAajJueg1trVDlA5hTFKwrAsfHWJm1QN46gWSHRIvloEeNVKx2lniLoi7/ECk
	R14Nrq1d97+b663iO930M6lBz0hJ620Xs7zHfVzP9vlTtma2BsUA4+Mmy4v+/+WBKafjhaZqQTZ
	Q8ZYUJXWoRrp9ub0YOxrOU26yqFvolEcxR0Kej14GrE4zLALKLsDtPbAhUeFijG0+Pyz/+WkX72
	5PGIpvCmBpluFLUlUxSAr0Ufwlc8cVeVVv7WyWlUsPd+HPRYhQeZiOIGbLBDuA1E+5pkTLMX6/2
	WpOUmF1WAohHiPKUCiiMIFcF65ZxtjNhtSfRYozU=
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr1472632785a.14.1791789946177;
        Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:939:c71d:8d15 with SMTP id af79cd13be357-93ebd229eb4mr1472629785a.14.1791789945613;
        Mon, 12 Oct 2026 00:25:45 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm122840815e9.3.2026.10.12.00.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
Message-ID: <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:25:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121515.17207-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260915121515.17207-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3N8nzNwv2y8+
 WKK8sWgKAeute4IqwyklPg2PmrL4CxZg+R+ncBy5UIofTbIPfQ3+M5caTALvE2/gjlIYxDxbb0V
 Lq56A8pFDBvNEZPo7wK26STpQ1QJbAkOgl+piCspmC0yhZJ2t01huTYW/nF/ydKLRIichFk1i07
 0rARcgsHL0LR4n0+vbMhgzjDHpDt/O2eJq/1lGBI6HnI9HHeQqKsVfqYDdShYAJZ3XZlskjP9mY
 JTg2eY6l1CbioV8g89XWIcHf5VJNyA0ug6SLcp5Whn99vZK4gAcR5cS908DyP8kGgIpuoSZyamM
 LGRdyXMtPyORp3Zbqash1WAUk1SdBVp3HO554YIJYjBDrwdB6GvYXl2UScEYvdyrqUGeJb1tbys
 AbK4cI2UBh+gFN/HGtatWrGDgduHbgKJzozg/4V/tZSqsrmj77v4iZMfakl1Aljj+TuMvpIjo0u
 7vHeXUkVeULCsuHrnZg==
X-Proofpoint-ORIG-GUID: 1GLjMsh-ofQ72ai_9-cp9EKL1jTqWVUV
X-Proofpoint-GUID: 1GLjMsh-ofQ72ai_9-cp9EKL1jTqWVUV
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8b7b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ZovgdgjKAAAA:8 a=EEfcIT1LpWLEK3Zwr9YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX1qDaYXDAkGae
 TKpC+QI8DP+063k6EhK+nkBFCTRwNdGZQmJ8QXuw/qevl/Mt8+f9mnAubLmoEhaVNrNU9d3GfVF
 pZ13QhIy1bp3D3KpoZgefHDKL7CP4YE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Hi Hitesh,

Thank you for testing and verifying this—I really appreciate it. 
I don’t have the SER/DES setup on my side, so I’ll rely on your verification.

On 9/15/2026 3:15 PM, Hitesh Patel wrote:
> Hi Gjorgji,
> 
> I tested this series on RB3 Gen2 (QCS6490 / SC7280) with two GMSL
> cameras behind a MAX9296A deserializer, one camera per CSI-2 port, so
> that the deserializer subdev heads two independent camss pipelines.
> That is the case my own series [1] patches 6-8 tried to handle in
> camss-video; with your series enabled on SC7280 they are not needed,
> and I have dropped them from v2 of that series.
> 
> Results with streams_enable set on the SC7280 CSIPHY/CSID/VFE
> resources (patch below):
> 
> - each camera alone, repeated start/stop: 5/5 and 5/5
> - both cameras streaming at the same time: works
> - the second camera started and stopped 8 times while the first one
>   keeps streaming: 7/8, the first camera never disturbed. The one miss
>   is a sensor/serializer settling issue we see on every kernel when
>   the second camera is started within ~2 s of the first, unrelated to
>   camss.
> - CSID test pattern generator still works.

Thanks good to hear.

> 
> One problem found, fixed by the first patch below: with the streams
> API a non-lite CSID registers 4 pads, but camss_link_entities() still
> links CSID source pad MSM_CSID_PAD_FIRST_SRC + j to line j of every
> VFE. On SC7280 the non-lite csid0 is linked to vfe_lite0, which has
> four lines, so it asks for source pad 4 and the driver fails to probe:
> 
>   WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
>   qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22

Hmm, i need to check, thank you for catching this.

> 
> SM8250 does not see it because of csid_vfe_fixed_pairing. You may
> prefer to fold the guard into patch 4, or keep all MSM_CSID_PADS_NUM
> pads for the non-lite CSID; either works for me.

Yes i will take a look and verify with other boards i have. Bryan has comment
for that as well and most probably will be removed in v2 since the 4'th line
on full IFE will be functional soon.

> 
> A note on the test tree: the series applies cleanly to next-20260911,
> but our board runs the qualcomm-linux qcom-next branch (v7.2), whose
> camss-csiphy.c has a legacy/generic-PHY ops split that yours does not
> know about. I ported the CSIPHY part by hand there (a second
> csiphy_streams_v4l2_ops carrying the legacy core ops, and the
> enable/disable_streams helpers calling csiphy_set_stream_legacy() when
> csiphy->phy is not available). Worth keeping in mind if this series
> is meant to land in qcom-next as well.
> 
> The three VFE fixes in [1] (buffer done gating, write master
> selection on 17x, VFE reset with another line streaming) are needed
> on top of your series too for two RDI lines on one VFE; they are
> independent and I have kept them in v2.

Maybe they will need small rework afterm stream_api flag is changes
with list of SoC's which support stream_api.

> 
> [1] https://lore.kernel.org/linux-media/20260914133416.1030231-1-hitesh@ebytelogic.com/
> 
> Tested-by: Hitesh Patel <hitesh@ebytelogic.com>
> 
> Hitesh Patel (2):
>   media: qcom: camss: Do not link CSID source pads the CSID does not have
>   media: qcom: camss: Enable the streams API on SC7280
> 
> (the two patches follow as replies to this mail)

Thanks i will look at them.

~Gjorgji



