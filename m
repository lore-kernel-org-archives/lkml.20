Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792735846;
	b=o/l7lREp2hoESuDB7NkhPFkCh+7/U292dMKA3oDRhSmLuH2VnNK1uwgU5w0f5bFDFHqw
	 VPPoymFGHZgH8Iw6TM4ekfnmuINYBgrZ5Y+4/mcGJoTc/kocdQ6yJWk9TR3t4Of5TcbUM
	 cQXlXz8Jhjif76FxiRK8SNTXRwk6+4Fulp34jMHH1E9ZwLjAv2vE8Fe7GaVnh3bC7us8p
	 W/Thh7kY1FWVTeuCOU2JV939mIRLuAVNgM4i+1HP3nK0LqyZ6iFG1cULe0w5Gzronkftu
	 72biA7rsUR2NfGNWtG2oPQyQU1tfD4ynBivo6DEDHNwjxbWLOdmGasHp3gvy7GLC0yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792735846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j02O+rA3xQoYjF/F2In/L8d0y/DZT/FPkbnV0NEuAEs=;
	b=jbmPLmNGXc0NFV3lTGAd4nVO2LaCcHNnM5F3Zfd0py8q9Rh2XOAEd4v62gv1wLlMVGDa
	 J7tXYvEokissohwqv1NARj6J/FP/Dq9vyCfCgsVv6rCv1FYJKwR/MZun9QW7kE8++k9lp
	 ez8DxUfwyyYjGqnlLU1Bk40k8NG2JZSLPsbwZjui9WidGSneusN9H6+wpus9CgyQP0biK
	 ZwwJASGIB4TTW6CN5qEVdZWH2wRovdnOaA1yvkkEuje5uesX2NDlKbkqIXzwbxpdJqsoG
	 JmgHV6EVA6SfxDVItNQ4W/ep+YWemEVGUnwM7xmOyS9h2YZNz6me06u6r32+hvoCP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfOBKLTq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9D2yMdw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0089F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfOBKLTq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9D2yMdw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Eu5G2376082
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j02O+rA3xQoYjF/F2In/L8d0y/DZT/FPkbnV0NEuAEs=; b=CfOBKLTq43SYoTq3
	xFm/ByUO8H4PCeF1BROv++ZE4sszAt7aSpb0rufwMzKMvo8ltLmQCzXZwGmnHUKG
	XclwPuBt3ccUwY5FsDjmkRETam7AhpQ4hp7V3RBjR1Lzq2jJ3tbY3M1Py33lXF1e
	Ru5UUEGUzy4FHMjKfq8yIoBMMJx7CWbdOynEA99W4KXuCwzIc0QFwGxQy2XRaa3f
	PV5aigPW20ItejiwDfc/UA/s2vMfec6nRrVF6XJCkKgxphIXrzPHJgvIrFSFLL6J
	5dVPFgYIaEy91RBtZX9jWZqZCp6dbH+dcr3hjkZgqZiKTbvCBt0Hygs9ysrhZ1X2
	1Qij1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmra5wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:10:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so1336443a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792735844; x=1793340644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j02O+rA3xQoYjF/F2In/L8d0y/DZT/FPkbnV0NEuAEs=;
        b=F9D2yMdwqzLiLWXWFzTGhHENTwI76Jx7fI8rX5GIe7MIdBUb/apMb0WkG+IYABMDTo
         1Dm+Sr8PnOYLYdqR9tpn6rAG3aMr2yCVSqPjy7YqWqzxoumlROvtjzXpKtf3dve0G3C4
         LwJN5M5KF/LiJzqHLPHEgDATMBtlLjOfsGVDH7/cQhbe3dY73HSU+t3l6ZMT98gkDVW5
         MkV8zJ6/RghvaaVUaYp3DCeDO7usndg2SUz3MhFOl3P/fjQB8r9rnLfX+VI1Ami6LIWf
         iDLq4qZPfsCyG5QATqZkAZnwZ7xkaJ3xNrLxxL1LKz+5i4SS0K73z7jBeGnh6uO9DDHk
         zwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792735844; x=1793340644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j02O+rA3xQoYjF/F2In/L8d0y/DZT/FPkbnV0NEuAEs=;
        b=ecmzFT/izjTy0d1rnlSKIc68Xo3oBneHe3SSWgdEVfomVVYkEY/Eku+mt9eyf7cs67
         c59UD8JQKwzr6PB40Lnk10so8xjfyMbwriBtDMxBwjvqXDNFIs5a/T0rQQAK2QSrMHep
         pUsXnEOyahU52BgGxiw/T1gn2qAkUq3qlLPlTnZcb+/Y0+2FavuokpsXHL6m5I+4ne4n
         YF37WsPUHZUbofFsAl58uRcjf30xYJcisz9DD8UuqC1Q4vbTPkPgIaMMa5rxEnjbHU9N
         FUogUyyJbTNAcvKNlAKxJmpVGtXOS0J1n3V4q598PdIHWWnIBcMKky/2Qe3kI2d5K/Bf
         dJdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQieKXc4Qm7S/4wUw/UQ30iji9kG40gvG79S9VxzyTyPqZHEWLhqblIRdoUvGl0/RzL67+zELiJ/nwwVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDJCOPzSF4ntBMUojcp7Ovh043dAKVQsEuWam7kB4qjHSfrvsx
	IbZJaMJdaWbSkRCnPCGdirUfhjNSpdnNxYolPmS7ROYov/om4nwf2IBLjz4TY/2+/Yue8nLH7Yp
	yQNh+BqOrsL2GIuAHwDtu1WD4NSAxGRwCyJULD93QTtDTv2b8adWp6JOR5p63obT1WNk=
X-Gm-Gg: AYBFou1yIsJJwYsYUzmX4QuHv6MbtQHMl4nbsDQaIABSr7f/Y9D5HFRs7dzWyqWwPhK
	pwV6HG2L1gr5aQQuYOzii/Ysjo2UNgM8QPYZSJWLJmm5N0qz08/cJDjJZx8J1jQK1G0TGU1lAlY
	O4aBsvV7Xi09a43DgRqqTbs8yGZOwROTJryM+ttCGrliEmf1mOqez++dyrBe5rfvYuKDWVH6Xmn
	tb+M+OUcp/+rxkeOqyYfVEISlEuWLG1n5mjDFYAypboaBg1OsjV0oKYLB5UC2DahBO70ZdQCflN
	j+3TQ5MIkWs9GlQlIXHsRUOqjeUCe4YygyJK9hflq/Y0ABOb87tL6zIOYjJaxEuTu0Clm1kHozF
	PBqYIGjRLeyvhTBKWkI/uJ/S6BgQ=
X-Received: by 2002:a17:90b:524c:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3adce5ff93emr618396a91.12.1792735844251;
        Thu, 22 Oct 2026 23:10:44 -0700 (PDT)
X-Received: by 2002:a17:90b:524c:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3adce5ff93emr618388a91.12.1792735843627;
        Thu, 22 Oct 2026 23:10:43 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm7186038a91.1.2026.10.22.23.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 23:10:42 -0700 (PDT)
Message-ID: <8c0dd87d-d054-4423-a62f-ac30d34a23ca@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:10:36 +0800
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
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: replay last HPD status on
 hpd_enable
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
 <179256808506.89747.16992632119493179553.b4-review@b4>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <179256808506.89747.16992632119493179553.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W9lZ_zrIFjdQ8m2DskqyThaQCWBXgdxd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNCBTYWx0ZWRfXxVA372fjRI9t
 wc89EgCIW4MqDCFrnO3MSFhfbTjqt2tphv4ut0e1Q0i2n1iSX4PlluR1BxliJu1VzlB9FAt5o7b
 pakIflijnZUmbVYSFmZL/ip+57DoAJA=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adafa65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KstRv3tEx54DabmpsY0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNCBTYWx0ZWRfXyOO3BipBiBU2
 nJSFwhbj5qxi0Zpx48yb4aQi8zDyvWAokFLyHDt1YeE9nEftYEiWO5Vi76xedgZOtfjlVyCrQmU
 36GHP/UWM5hJW7FKDmiagYbw/nzU44IcyEQIiePCTlfB1/b/tOBOVjhzG14wIi1Wz7Yl74GKU1e
 ShUMv7gFLz5gowK7jV7mIChwUgz0TuJdu5awZKAMOEQ5uZMQyicoMRWqKzfCt1BKklirXhOehpb
 2NcMmmWL8LpQk8DYaOc/s3+cPG/SwjVdYggQrMNNVa11NqdZw3thOgF+0um7IpQ3ZeCODuutUwZ
 7dOsV2esY5OU+0yPVkkWOMOOLTC857DeyU2ykQNN8UxDfNAmp0qw9jVKM8UndvR2YcW9tjQd62q
 TG6xvA345Ha8YshFaNABXdN0PcBqEYrohqY+5r+yMzCFk3gIsEuxgKo2WvTVAkaAfSChajDUTe8
 YuPtBjRcHX+8V7xZKwg==
X-Proofpoint-ORIG-GUID: W9lZ_zrIFjdQ8m2DskqyThaQCWBXgdxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230024



On 10/21/2026 3:34 PM, Luca Ceresoli wrote:
> Hello Yongxing, Dmitry,
> 
>> If a downstream consumer (e.g. drm_bridge_connector attached by the
>> msm/dp driver) registers its HPD callback after an upstream driver
>> has already reported a HPD event through drm_aux_hpd_bridge_notify(),
>> the notification is dropped because bridge->hpd_cb is still NULL.
>> This can affect any user of drm_aux_hpd_bridge_notify() whose
>> downstream consumer arms HPD only after upstream events have started.
>>
>> The race has been observed on Qualcomm X1E-based laptops during boot,
>> when pmic_glink_altmode reports the initial USB-C DP connection state
>> before the DP driver has finished probing and enabled HPD handling on
>> the bridge. The consumer then never observes the initial connected
>> state and the external display remains dark.
>>
>> Cache the last HPD status reported through drm_aux_hpd_bridge_notify()
>> and replay it when HPD is enabled by the downstream consumer.
>>
>> The replay is deferred to a work item so that the replayed HPD
>> notification is delivered outside drm_bridge_hpd_enable()'s call
>> context.
>>
>> This follows the same pattern as display-connector, which also defers
>> an initial HPD notification from .hpd_enable(), but reuses the cached
>> status since aux-hpd-bridge cannot re-detect sink presence on its own.
>>
>> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> Is this patch still current?
> 
> It looks mostly OK at quick glance, but there are issues reported by
> sashiko which look valid to me. If you could reply to those remarks, either
> confirming the issue or explaining why it isn't, it would help reviewing.
> 
Hi, thanks for reminder, will apply AI commenst later and post V2.> 
@Dmitry: I'm not familiar with this code, do you have any comment on this
> patch?
> 
> Luca
> 

