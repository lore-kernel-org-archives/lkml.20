Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A373AFD17
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854444; cv=none; b=bqp+/sQtMIjgvNXsn6PIgWPXKeLSY27ucbj+3R92RSXB4GqIW4JhLqf+ozvBJrv1wuJ37Dbq8iNi2QBfxTJ2NWrdc/7HjuTvv0uisuHP3AB/CmOif3rmoMJBckn+8OCmdvJBKbVPP3AGPbm2ArVQGW+BaE6hQUTrxfQsSJP5k1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854444; c=relaxed/simple;
	bh=d3+dSVc+d1QajUTVYCFzTEXO5nx+Cf3F8uVePoP+3hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5/pW+W3ZM/BjxMyU+Qg5KwzIt/msmziH2E3KJJ5Ln2oxz/J6ytIzFQqIMwjnOdq5EXSzaXfdUbdIlD7Y4mpFQYB7GcP+laFrySA9ea1I2ece0pXmd9fanUmHJokAg1sio9jXeLxpVtLkfiqLHovr7s2FzlXSMxHsSC0QndXu9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkCXs8g1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0LZ+4Hw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkCXs8g1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0LZ+4Hw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886MBj01521769
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftOcMLq3GmIjv/8ZjcZBuH0q4Y4m34ZtQA4zDPU13TA=; b=NkCXs8g1T6e/kcQ8
	3LCq7wK7GG90UQimigTvNwffh8vfCx9bH5IXT8VvYqBGWLlRhlp2uUQjPK0AZHEW
	6xicy/3Q2e2pj214fgikSy45UByEJg33BFmlgPBzjKlqX934DdDxkye/k9VAdNur
	GxDfq5I5gogRGvJ4Wi88bb/cldgCOemfnalTGKWjqwZnlyg9WGqCGQZnIR4IvffQ
	Ji9X8q4pMqGsyn9qQCvqMf+YI1KTySNeRBKrupw2kjyZU46sRizOV8ncNFHxqU+P
	/amaHRs/7z4d6ONFWV2OFz24PLKVJaJ+Gxd+SF+v674qfUAKN6WP9evKAYnu+ZFc
	CU/BLw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jns9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:00:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c4f47fa57so38161241.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788854442; x=1789459242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftOcMLq3GmIjv/8ZjcZBuH0q4Y4m34ZtQA4zDPU13TA=;
        b=b0LZ+4HwLYcFmLYaoCN+5Cs3ZL9L5WuhoC6wufTITON/tiqjXKPveiq8lm9+jfYX4E
         4HGI9dRwzMMHvvbLV4F0t59QQW7qfFXxRDRB9UK8dD3JWmqM1SPojEOxUUxIhXaCiDMu
         pzTCQThanrPLwDhodfXWmvi4dwV0k5yrkFisyDGucpXO1IyipeG8MiUJ8c5pbod60p/m
         lckuvinwIt3uR8kjQ5WEVMpkFvX+p4vk5/FBaKUVnyDuZ2Z4HkIplCle1lTXa7sTV1Tt
         9oT4zwKlSAL2Ss/iQj3r6k+weeoZRWIpT/NxE2zLLWvAb43zh8fkpZvXe76lC0sKBh+i
         dq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854442; x=1789459242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftOcMLq3GmIjv/8ZjcZBuH0q4Y4m34ZtQA4zDPU13TA=;
        b=qQMnii6pNtzjogykozF/c2m0kzuDI5uHCbKgwJ7m4v4KtUC7I1XSoQteOnUPfpHd7s
         2aXXrjyfOZNl11k/+SWzP1DsFH1yETJmVNW+DTe1MGY2p/bU6jbkPqv1H3MKW3tkYAPK
         3yGaFXrKUCYolWasYkBI4eAzyjeHCmJHZvPuWABRyFxfv4h8OZ+ufGB3CAmRpFm5P1C9
         MGAPxW2CR/vABuEh/ZFPhYSchdTSDFWcAxOK4D+O83VoBO3gZi4Th5nzzhsjUyGnkd2O
         aCoLgrXIlFHTh0RjAjeCRNAC3GNJxOfVDOSrVib0QXYJd3hnSzisfwi7Cj7CqCVaylB3
         I5Qg==
X-Forwarded-Encrypted: i=1; AKwUvBw9lHBQ8lqNixifkijV+Vo1I1/X3JGlk63Y8Ys8dI4CW5x/pt2p1CLYzuIkfdxPf10M6hpSxkcA5E3Ue0s=@vger.kernel.org
X-Gm-Message-State: AFuF++lXqwjBTD6+5wUtUqQ4W9yv294FhS3S/OLFRyB5lHCKEZjpA5jJ
	z2Afnq2DyyPGJyYAiXaKPEif5NzlDcPTl4vfhq3nhJI4n1liW86c1oFdt8XE/k/hCqOSqBBe/Zu
	UTwApdiYbcj6DUTdVQztEP2ZwqU/l6y9O/IdHpDBbOiUXMV+RESshu+c425oEZoCWUQg=
X-Gm-Gg: AYBFou0Au3+za8+9GB7fRKpF6IRLER4zXTBl8qckDNovwOSO9w+4MXJlpaCL6NLaaO/
	4Nciq5iN+gV6sd9t1/PWAZsP9A378rfiJPyu/P2jNmb/7q7s9js8sWExHNeIor2KQZvilSe0kk9
	k4664H4lkxZUDf4ZQlTRHJACsj5CQCBgcDaOSOFnz9ao3kbrDZqr4AiKEzBFgQfCDurnNZf5x3U
	gu78mQYhxLVoJMY39yJJcm6VReqXgMxwgEfij1YJWc5v5PdLFiENEjVAXDjv8BoETKzNFUiueFY
	lyd5sA7Git6rPvyRoDt+HOY+0ySYDvQV4RcsCjIIFTrDMK9RfmqWYR9PL8610RMDeptYum5h6pD
	bWL494Sc9uz1rJVsMMM1VAA==
X-Received: by 2002:ac5:c88e:0:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c7fb54d026mr2461869e0c.0.1788854441546;
        Tue, 08 Sep 2026 01:00:41 -0700 (PDT)
X-Received: by 2002:ac5:c88e:0:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c7fb54d026mr2461861e0c.0.1788854441099;
        Tue, 08 Sep 2026 01:00:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669ae43sm2831689e87.3.2026.09.08.01.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:00:40 -0700 (PDT)
Message-ID: <7faefff1-5aa4-4277-a250-add84a880a19@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX9yTXmkAmnyIV
 N1hEcNHooPqo/EV/wPLZC0fQG+3Rd7uwfP1aIdc13uVq01xyaVrdesDJUrY+z+BwLv0GiKbeMU5
 OQ0oBc2fLgmlA5NSbYRnfS/uMG4AgIFiFLbvJ2YXIBwTagygrrUKnoWd9eugO+Eb83EBbUmEq+t
 oWhO4MtjuFA16V7OWU/rBlHJRHvg++CV8Yss7X0oTDxWkzuBL+/rZLzQ4UXOt+D1VUdqivlM/sn
 rDecS5sTbMK2Y/+9amBbUIPgIGMYZ+zdp2rjkkYYi6HVAqAA6b5ieXzmUXcKn7vveo9l57/6xyy
 a1yERhNlTpRRoMWD2pMMVt2Odhd5Dq0f5LBT/RnDJM4gIWrc92Xu1ch74XfCP4EkzGkSQQMyog1
 NYry2R7J7Rp05Iwl8wiBiDRPg9vRlVcNnH2LcJc/q3I4IsOtyPQVRAfF9Ucsw5UD6RVNFyxHgxu
 YkkbIhhVCJ2bJunBe9w==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc0aa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1VKk1TRdkn99K7eK9r0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: x4CqPcdQO6pPsypkfQ1lDR3AJUI5nzS1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfXxOy9aUEwe1G0
 oxhbgytAhD2WGBQgIqKGUSek8KHepMiTjSgCxosivS/EDAO+57t46DgJsGAJS1FiJJgLeNtVvII
 bRqhqg/L+C2MaBzwf2PXd/Yck72Elo4=
X-Proofpoint-GUID: x4CqPcdQO6pPsypkfQ1lDR3AJUI5nzS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
> Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
> follow reverse order of powering up, not only because it is logical, but
> also because msm_hdmi_audio_update() accesses registers thus block
> should still be powered on.
> 
> Depending on specific timing, existing code could have accesses to MMIO
> of powered off block.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: c0c0d9eeeb8d ("drm/msm: hdmi audio support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
