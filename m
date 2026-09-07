Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363D46EC61
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778693; cv=none; b=oS/kJE5OIsNgioe4pIjz1eGzmiHbOwzLeSMUCAXMHN3mwZQXbx5gUzrUyDSjXCCVg061tUdnu8RKwPey+TS9jtaIXAGcxERvt4920+JwjJjesMfod3uEXsCVmJYUKLqanN8T/NuZBFosXbWayLcUxDikd1GhPgA0DKO+uIPbjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778693; c=relaxed/simple;
	bh=226zFTrt61gC5bUJe6htzJbBh6DTMpofqMeezkvIwVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcVW6AY7XAddtF/miF8LMdy+ItCyTQYEH63IxcMd7yE6mtZBtYHaqlAAGvysMtmgcnTBOLKIq/arc9FE4q6hqdfYjcbUbOW4I3d7ABLJxPoAqMrgoSm+egcvrdaOzZ6dfVwWgzI8NCx4wXVfOtFeS84vac3fMTPX+vwDfAYbw7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkvbUMDt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GprQ5nRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkvbUMDt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GprQ5nRQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Anbc33777980
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rlgWTU4l5TU2Z3+onQ2BGvvK
	P4C66DgncaDRweKJZts=; b=dkvbUMDt9tIZsDKDnW/qumgRf0QCoKn5DITnjLmh
	09vpx1rYA6zQJtZew/7pgFSenXB/eCXeg6CNmQBsaURlD0X549nMthQPOWaVkRwR
	clG0iVrhlcekgF2caXDAI3A1nipprDRsu9UaMTkpOHTVWN/r/4suIF+E/OjxFHw8
	QZCH4vfnAUlU3aW9rcVs81J/P/FLmquBkGRldolZ4VJg6IVOq2BAaobr7FG975zG
	i5zajboEKOrLseTmU42I6pXdkQHGPQcPcBPYm1V5Qa6/1aFvSN4AZc+4wJIVU2Zy
	v1dvJzE/XKGO0aWY7t7Lq5yHKO4SksM6X9N7N5gkdBkWSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygqwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:58:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so616055685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778691; x=1789383491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=;
        b=GprQ5nRQWl0kq61gpkpZiRJFz7cbahjbRSnDS9VCKXD3mRKZM8Z2a0ADsRqgVuPnbl
         Bne3Shr4MLO0Hl1XtLYaUTkMPnfh/UPHq/msL4LPrZWtDNGCS+86teb6JHguyBJJBQQ7
         FNr32RTiRZImgvqTu49Q13GbH7GyKANJMzMSio84xZSArwmAfxEo2zMKtF8ttruRWqMJ
         ei738JA6YOXHuxoKRnN0MHfBZbr74MjPe+l6dAWBJM7SHNYLwx13X5w45TD1MlXD6GFM
         7wWqyYGESGOOJWoxZniv3b8n8P4nr6Hfn5pEfaknL92bMmT+u034kgBD3jQ6WxTXsabN
         nX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778691; x=1789383491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=;
        b=fxf2QgtRaI1fpWUhZPkc/meCYWPb/bHRj63od+CdwODngtUjV2DxMrLOTjBxg8XrLF
         0qQG+ZjKU2W9wwgGfY4p1tQKVwtn0lZRF1Uu+rYvnve8ka+3B4uh8AlRe1gB/N8KHY2E
         jIIqpjQ6sGRgottIMEotcz5/vdmSey1AYJM+yz/Jx+Sj9+4jaC/pC1CZeNqBZpX+gQW2
         WVo29M62YEgJX6l/8MY21ij0HbfCTkp7zCO8J/Otc4yZPNEl24OYi/fxNG6qeotcKFZE
         zI6UXE/2cSkbyK7TprGQ4DjTvSa7sa1GQ7sMqOXB4gm35SKKt9T3LbA5rTHr6owQSGDt
         gJPg==
X-Forwarded-Encrypted: i=1; AKwUvBxaZ0t83f6xAXzRaXlTiVHyBfvM9oBhhSbNIMYDr0GypKF5mM/XngZ0SkPf5jgUt8P/9wLp2M+mQWSToK4=@vger.kernel.org
X-Gm-Message-State: AFuF++mkyZZW/Bwku5yKvlE75K/ibFO79NRCZ+1nx7dBFKvEOxHCqxL0
	Ytdx8zWXwWm0GNWT1+QZRRLG4+fEFM5kvcnIrp7TbsnQdMFOq6slqAdyHCFoO+FYsFMvgap9FfC
	nojq9/sCMjONLHXSW8kvxta7eZq8XtAcn10ZA7WaKX7JbwN5Ep8W1DTTS36zaylXSBKM=
X-Gm-Gg: AYBFou1pXTqBIDCf2TvGAsomlH/EoBaUMfjozIbSoRVtbPcsUfUPOx45IbjblQ9dsq1
	nssiUYAc8sxKmSvure9CdK/yJvNGseOLe2PwHBBrTuNXFfhGJtwXxZYIsOWLcluGi/e5GS+k2Jj
	onzUgK/Uaa7iE0g0ySwIFSJrxTFUIA/MB0IiJ/hQhJEHCi+x/yBZxZKVk1oRFnyyg+c2BqwxUNg
	ow90UgLiqb/kuybM+fOBBvRLiDdLuj0A+pvuUsUNr4QxKp7Jn3BUsl/PuLmc9+Laq2z563GVLpK
	+Pl3bJx4bauB1IaqgDG0dBfHFJzfQ22c6gBowwZiEW3YzM8YrW4NkXyUPdUEh3+bEmI+3M6aOi1
	iYpqQNzAujF9OIA==
X-Received: by 2002:a05:620a:a495:b0:936:883d:89c6 with SMTP id af79cd13be357-9398043579bmr1824664385a.28.1788778690491;
        Mon, 07 Sep 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a495:b0:936:883d:89c6 with SMTP id af79cd13be357-9398043579bmr1824659485a.28.1788778689899;
        Mon, 07 Sep 2026 03:58:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm200216825e9.10.2026.09.07.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:58:08 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:58:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <bif2vhuzfskrniqvp4acoxfjvpyypr533ulwpvo3f7pwkcods3@wa47jbyowcpr>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-4-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-4-4a53381cd038@ixit.cz>
X-Proofpoint-ORIG-GUID: U0bbHjmjR0rLgGyRj3dgyAlGXvf0blni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXzZxRAUAFCHMp
 nxmQ8kmnP3NLCapIKkY0JYoXp5/SsiphmXIpPOdqAbY8EGCLRBooBsNtPeNYMunRnobeXfhIB4X
 E1fJbEZNy+e+arROthD6o0GoEujTs1BTZrv/AznsldGmLh4uDR0bL4mvhgNGAMyKUte0PqvF+Eg
 w0cwWIiuc3YlNI2DnSOcH8/mzj5CCsLixFC01QroVKZXEgi4yInf+uLW80ZgmBfknK1rHP5hM8v
 weDCLk8oa6gM12JKUPnku853ay5tTAzxn4HiHit9h7VgIOB+u9ULPUcliY+qBL7uuVS3NC3fdVJ
 +RCVV/0xqXIpNEtPd9/+DQHotk01iqRbt48DJtCFTwOSHxHwqGUwVGzgMNTW+RObFWX056fYnRy
 3oCu90lhD2fJL89kY5/VycmvjUJ4M5IeUDodMPyGEik/Efg3Pgf3su1L2NVFlLIK3gZTvQmpr43
 8eow3fwl/hYwxWTF+ww==
X-Proofpoint-GUID: U0bbHjmjR0rLgGyRj3dgyAlGXvf0blni
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXzyX6/3GbAka1
 NY2RCLKLIBKwDrOmMskCUaBbbbiOCqcQKWz9Zwu13K/Z+Gu0lrPaeZitz6gA9+nGL0RMT84l1hl
 uVp5jlk1qQxqltBqF0IuY9p7ROVPFT0=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e98c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070120

On 26-09-07 12:50:22, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
