Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098262;
	b=DgR6E0KzODmr7jvDjROX/u1iBqm03rZx4hmjrIElx9lkbK2WdvbY0ieLW+vIjCeOEQYz
	 wJfyNQ/ewlOGzdpAT2UQNJKd9Oy8CHrMjT3GIzrfQ1E7Qm40q8ZAfyGTSR1pE7NCIrzGc
	 vfJSCnufIzx7G2zFrWY63bObISOE/yB4oJPAuqk3gDw7/YvMMUDmx7+JSGBuzZSYA7XWJ
	 xKSvxQUfsjY57j7bL4bEY8hFAvXQbBvQhquECxBHRYWitEma7FGSBzxVWBNnNMPsTXaMm
	 pNNvYASQ4xnEpXmhOc77Iz8jrH1eLVvqIcm6GYT0DjsBAFzb42VvfVvFvXW3bQNPygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
	b=IGPee4sHNhaOUqj1Rl5dmvOhVZcNxobXOg+1n/4QcYa8y/uWnUF9GKd3qcRVhe/kmafG
	 vsl49DzcYvBHBtAvZ3WBA+4jr0+W5QpAaTib3H/zH2eFRQNN+aMnv3DX4SfORObUDHkJL
	 9aaKTg4JRM0bgTwCkdwbanVmx0SWQjrtJnr5SRvmuHKfeOUBRXX5h3O/N06TP19pt3OpT
	 cXiYseIUzfVOncYEt01zfaAjUjijuVbcDCbisOAOpOuyekXKFpFV+GobP2N5iHUmuN8Ns
	 3cNy1PgyFfb/9zdbM2/JfGarPQNuUCsgNR81LYAmeGwKE2KR1M5igb7ZeTY6WzMCVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSykaSTb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNBEQLf+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA8E60A3819
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA8E60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSykaSTb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNBEQLf+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4mK1935912
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=; b=MSykaSTbVz4cVpJP
	W00TAT5epw9ybQl4cthSPnp9x+GSgX8L3NyPaFpoucf0Kn7bIEWzWipawrbAwDT9
	ZkfrWRnF5/d2nvJ81oqbtfD1fo1oKAuqcfgguJadZfgocV4JLiOjLbLQzTdVOfZP
	8+3K1HJj1oYQNSrIef2ByCkxlyyTAaJ6LNH0HdDkecXGl2xp4JAuvJbyBq7TtafH
	SD+pu0p4+usHV8/iVFpewdhdJycp0FvSQ9VbP7ykPpnaQjuAL4RSwU1c5owvZ30H
	QGfu5ZfOw93rRldrE1RdWygi/hgBBSUkvMOBCznzIZ+2RxPQMeYkOb/08d/lRzDt
	eiugHA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtep9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c5ffce3f4so5434876d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098260; x=1793703060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
        b=QNBEQLf+XUsTgInZ7H4RYs4xB6D/FSyykh6R2nN9ZfXBOAAQJbe9GX8i+HU8zP+2Mi
         RXiDO8xqEriAFxjWfFYjxVWGk2F8afVp0jxRYkGZneTvDy/0FfPMh6OZK2aHcpaozNj9
         G/6w2z4dEA6PY6jASKdSfxYGc128nTPrrXvi86/554dMGOhl984kTSwPUaNzTQmWqUo7
         ajhJVVHvm4ldPF74pYc7apdmjzcinWwi3HGwNgaW59IRuZiS0sqXf1ZWmnUMww1QD3vJ
         vyxTT8sRlNQ3/0AyX2stAquChxdcZqHUGoQ0Og/ITAuE3uS23s+f47Ve3cWcoTf7MD3F
         RaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098260; x=1793703060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
        b=Y6FTKzCo9fiZy2HcYz2kzJ2J/yYnswlvDh5uJs1MQ/stcLDP84qRTDBgmSnAXEi2lt
         JDISYo+P+FE/vipGtotVvK2clxtrZwFZeWR5Tj9ntg3owBijMKiCbLu+BHT2FA4SMKkS
         Qm6ZGh2fN3ORg/HFgD6mvtPrS7pVrZLqZLy77E0JyD2gsDOCNc0VvqNzb9/fUdq+RUVi
         Av7EUojls7sZGESRL3zou5UgQ9u6hdo4o+LD2dFZLWc27I4bSPERYQjrbVfTQLR7j0ig
         do4uWpx7g6HXv2/Hf1d4o2UjI7F1a1HwHL8YzXC5ARC6adHPqP6ivDTk3sCkjJp8x2C8
         0N/w==
X-Forwarded-Encrypted: i=1; AKwUvBzGlEchuyv7nUnFiQLwZMJxzhWXFk5Rz2kP+DmxHomEztvFAscIPrE7mPp7/CfgM1kOA7CkRt+S+bbopCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA7JZLCoRjDYgBS0vjZ8Xqwe71QPqfN4QWx3YyW2v236RL1sR2
	EHqpDl534LI6AZEv45vImEMNwQym6r2tjTb4CnTD+VUlY+LQB4Um2K/RYIOzguoDkWExwf+4syz
	iZ0UhMGlvIBdKjqKT6DrV9oSmLb7wcsvXqmA1/NkUExiFH+Gg6zp97+5J1WxzLBDhXHI=
X-Gm-Gg: AYBFou2cCERhyAKZlMfiNjnpbpjARDkcduyskboCwMoO5f1Yv6q6wDEqbQq1UdXGLoZ
	gZxj4P6EL2eY+e6OI3Y+u8NhHa7NasQ3KFJu7eXAktuGgVEWKqGRhbk7Ew1GLjAXtNIZL7t13JV
	XqOK615TidJQC1r1u+KFLXurnrKz/2agd6BZ7nrMQPYVcYGWwgQ0N2rmBsSovDXF5eK1JLLe+U6
	nJ7Aquds1GSZAep65hv8IbWxUxFf6fBAmYIyFeHI4tS4os7OxZMYsDHLBUJPiucVmAiGY8VTi49
	R8cmo+tjgfg1OMF+9EU7PHoIJ+ufi2L1gcjRaUCO42RAB7MCalBGS1p6VvMasXWg39xrHN/TslQ
	djSX69SJqle1QUTTXvhBMFzR/xnGhkwcT5ZE1WlXEYtlGqznbQ1KheAbqXE401JG/MAUfhSY=
X-Received: by 2002:a05:622a:e410:20b0:536:27d7:abee with SMTP id d75a77b69052e-5383b3b5b67mr149413341cf.2.1793098259623;
        Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:e410:20b0:536:27d7:abee with SMTP id d75a77b69052e-5383b3b5b67mr149413101cf.2.1793098259161;
        Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm430409566b.64.2026.10.27.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:50:58 -0700 (PDT)
Message-ID: <5884eb89-5afb-44a7-83f3-642efcbcd284@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:50:56 +0100
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
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
To: patches@brar.si, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-icc-sm7250-v3-0-aa303226298c@brar.si>
 <20261026-icc-sm7250-v3-2-aa303226298c@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-icc-sm7250-v3-2-aa303226298c@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x7h5_OiMygWJlAFJ4niPlm24ei5pqJMu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX5LD1u//IaXE6
 dCPgFYxbMsd4WQU6B1vdh5hJmIEiICxDbPP/B0zKNyBf0jWh0e4YYs1wLO2ibI7loSHe5OQiV9v
 XaeXX4JuSZPi4Xruva5TNsIpz2DfufQ=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08214 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=w78OluAnvVQzWo3CabYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: x7h5_OiMygWJlAFJ4niPlm24ei5pqJMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX2qPHjBxWPCoh
 i+VLfzwSS/YNm6HAUj/Ur+TR3urGc3xu9cetrdS81ojZBGC8tt9YYv6JhpnjeBJjNWksVdoo4q7
 zFpWrCyuuuReMk7iTSUIAxt6wyzmmN5asDykWJr9+UqN0YFDN1DMBlJoOaPnfLW8jaYSTbYmkry
 DIjT5qxYqIkDDW03KaEnDGGxuec9GK/sINHp9LgbJzBS7bZb0PVpav4d/SizhcXS9BEMJ1O6gBO
 f9dBGoYdacVax2lbgN7eJTPlkQPuft5SpFJo9/SMQnkbfzGQCMu2jHPlfi2TgMTyYEW7/JWPDwU
 SD5DsOIJYuAaWTcLxl7RzFj20UwluDnWonVMXlK1hCCfKXGBvEMF7oLQDwM84qUXXUJUyUNaMIk
 94U1pIY4oLtOq2qucUWgdxqp5e58caUZV9RNWBmQIgo2MMkNU2GFbnA2Lgcn8RROdgPxdp1xhhA
 pblUH7q8MJqPq8r1hGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 6:48 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

[...]

> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/interconnect/qcom,sm7250-rpmh.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qhm_a1noc_cfg;
> +static struct qcom_icc_node qhm_qup_1;
> +static struct qcom_icc_node xm_sdc2;

You shouldn't need all these forward declarations

Konrad
