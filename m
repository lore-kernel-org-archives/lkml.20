Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C663E51CB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371258; cv=none; b=JzxY2GAvsNskkNQVPEkIB05vzPz7EHIaJTli1zonCgBvcyGOMRjwbsnmm77az1YDWHVjrNJ/UOMInedf+r1GZ6aePt9LRturTJsEhwJr7ASregQ9mjqKg4cnoZOeLSSmj9bMa8y3ZK4/mopat6wzJRquB1Nj4gbrHGKu2nHxxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371258; c=relaxed/simple;
	bh=1ey+7BuuywOfPmHLIz/6UMXpAWTAVAah4dLipk9yDGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prLqE2ERHic7KECVJiU/qcI2EssRb7G2rOmLqSQdobEte+dvgWyByS7pYds5MEqrRjYoGlfF5LJrkowknBh7ADe3Qo85qWGdcWaMLBRDMAGxpDIfi4q2uXxTAi4upN05Xou4aIJfZ/YumDQddRrYmhA01Ya9mIMe00hR+3J71a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA2vsX75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWhir8oB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA2vsX75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWhir8oB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5isGG4058214
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJ0LnXcfs2eCKZrtoDG+orKK
	jrb0m3XGM63JVNK8OTI=; b=PA2vsX75z1gcXpghMbiHotqxgTQDNnDbIsHtHarI
	T7SqbpFbUFX8pXO81QdcRCdey2Ab/gzWuCCBSPDoE07/1yUzVasxgAA+inrPNizL
	trZQCMAIpAomS50ABkai0L8lVVlPq7T3GKTLute9cmz+TrPTlixL1TgjDcMIYDZH
	ejuaCoFEUWLxZsnDES9mlg/qtdsha/m2D9gzlG9NaDDyNFXKHEGPAl9y75nYmn0D
	2cMBHE7XzGOzPVyMufcSGX2OmP4tk1ie84AQPzzfCMM7qy2FZoewgsOysasLj/ez
	BrUXzuRj5x9w1NY6C1yaXZvIJcpBY3ezZpeYVlxGKm8WUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssbyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:34:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so470049585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371255; x=1789976055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ0LnXcfs2eCKZrtoDG+orKKjrb0m3XGM63JVNK8OTI=;
        b=EWhir8oBcpBB9HwQvs19m84Lx8xJ/hKYIVV3jo+aZs3k1cSfuWO0bOyMMT2bLkZESq
         evoBakU1+OCTc0YnNmnN70l2JlX0fX6vktLyuqMFj9TzbW3HZFNstEAiD/1g5oS8J/cJ
         IITA0qCYg7nz0tq0Nrs0PHcLTljPvQb3BGuhKJLpQpZPMuXJb4Zv5ESqs0TeAFBZ+nsq
         FMaJdM1D4VphEiVTCiPI2YlpQCuGmH+MtDkPbcztOeTBh/hrKb0ptCKvoEvXyT8TRGqY
         lHQLoYdCRJ35Bhi+UyL2bBd0eQN22ce7E7L0G8nQWZ7JuXiWQMLBSMeHtdPsjXXtMge7
         ljPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371255; x=1789976055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ0LnXcfs2eCKZrtoDG+orKKjrb0m3XGM63JVNK8OTI=;
        b=bWRGOL5KM/REetm78gD+gj3R/XGw/t07RJas+Z32XdbzdN7uK5tw+nctgJkFedy29w
         +svvui5eXte+Saioou+O1lz+RgrL6y8F3sHcmI2XK89/flYqYSrQyYMGmVRGzwC/o4G5
         GytdtqKI2M4eo23Pza2kDPA4yDGJ5+Qe6JR0uBufQqZQ/ovKVurGYsRZXUk0ElLZFypn
         j2pXI2FaNtYvYIvr9FZ5dGVg/i65TgCuawHt3GsOcyrJhBFk9xzzRmJlRcRG7gbzmtSx
         856Kl+Fy8Aw4MhOidJjx5j5KbnAM/gJ0cCKZGQo+m6K08Zt1njGlCKUKjrPg6KCuwowI
         mVsg==
X-Forwarded-Encrypted: i=1; AKwUvBwsJChyLKck6KruxF1ZO6AKv1KEp+2vkYNWU3KVkzJOs+TnI0qfcmcS+IfAA+Ul/LkcaDPd/vBNbcEIaU0=@vger.kernel.org
X-Gm-Message-State: AFuF++lj0KLPlYHd9XI6MflZGN4B4dxUr6Z8hWqtKYT40ktjycn+4KZ7
	HH2fxUgrIH3wTgHMHM3c0d+yhSLQIwcftxVI4ZjvRYAHBUnPhOZv7xyngGF2rbFbW1G8nmn2SG6
	Rg62K/Hl/g1DTSMn3jlZVXRwBIHOeTCJwYzzzMQxMsAjANHMWjKW7ltgqRiwxwtIBrtE=
X-Gm-Gg: AYBFou10YcbcDPo7DINeVPtpZDKZEFiM71B/OGcgeZC8fN1RGjdIiUzHITQTLYpmJGh
	GaWhonPWvbOeWj485ltxPBtYVDDg1vEZF0gPYc+ViQSEE1kGQK32/SEAknis6HAUTGGjfCWjkKl
	gNsfTgY5R8O763pIYbEeHLSLgqwjF4D4GPRcKDPiiyoIY73WiYw5aQtra3l5qBjVLnAtm7zGpnd
	ury8Y+dnf66QzjMm4yrCqAvD7YeAWrZZt0g6CFsMgJzbJOZbC9EssDkHs5MXWlH6HSMKsn/2RGu
	CgNzFnvMOUEIyWMv7VuZhMtr6n/On3Y8P7CobJGbYib3b1LfmKye75GtuzbMiHZ3ltSrh94IUKt
	4zld70WkkIKI2Iw==
X-Received: by 2002:a05:620a:1788:b0:939:f27c:7433 with SMTP id af79cd13be357-93a29c132f5mr158408585a.50.1789371255045;
        Mon, 14 Sep 2026 00:34:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1788:b0:939:f27c:7433 with SMTP id af79cd13be357-93a29c132f5mr158403485a.50.1789371254520;
        Mon, 14 Sep 2026 00:34:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm24084717f8f.35.2026.09.14.00.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:34:13 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:34:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
Message-ID: <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX9MUdien90D/n
 SebA/IsmL8r9bkvdC/sC0nEWYvuHKMHy0iGnb8PYvZ7pwNAYDvWJto9wAjDexO7/LHZd+3l5BF5
 7hGWLVk4nQd5lB/zOK2/nFX+DqR0hIS9vJQGuzYNccEn8Q6Mfw27Lootb3nt3fjiSe33rXkjpIk
 64732QeM6le4wn0IOPfvPEj/hODmLDoc6xFln4CTXXVCzhCidze6SS+SUGIloPwYiFThHM91eVL
 1g+J/zqCmL4kvvwyeM5TGgBRupi2FVc7yfr5NAzYOJ6XQ5J+Vwz3koE3JWopMNNppuhnQqXDEQb
 SFxVo8bOKYaK4BkSUbRwpQpy8hQE/bxlNpxMZNHGEchNnlCrfcbUwhZQBD52Vrc6GFrm4KPgbYr
 gPRu6bb5u+tmVHVSKwqdHcToQtnX5sdNOBFMY+r+oc6LVlBH3DR7SC0lu1FdLDb6yoAWy70bYkL
 nniKd6l+Y9LaQkSwIDw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a377 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PY3c6-KAFs37oqjDjR4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -1RDlQBrv9f9ASw2AXD6AhOjiS6UPtae
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX6Fn2E5miNPCG
 CcmJTMZZTMo43VOk6FrvOJkPCywjI2EqAFBLqNZinNMLrCoYAWX8HE+8NWeasrP+5z3/D4g8cZY
 eLTuZ9boOYGreUlwRzVGWrO6lxM+P4M=
X-Proofpoint-ORIG-GUID: -1RDlQBrv9f9ASw2AXD6AhOjiS6UPtae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
> delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I think Doug starting asking for EDID dump in the commit message.

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
