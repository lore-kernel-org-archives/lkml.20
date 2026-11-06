Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972682;
	b=Fqrff9LAJG6Zt9GCLv1UNElCuxej9jGDWit5UNSOB4OrO3F+9bBkVsJtBb6xx36yw22e
	 lx4WKBpbgiI4FZ7mhcykIcrbEfAhLxOByzzyF3EcPx2qM7eyBW5EaNm7nSJ2o1lkOc9S5
	 rO7MEBKUevqd3wKRaaWg9OJjXthw8rxJ3fMJoWnD9yyFikCBHeEDUYKZqtre9K9T9d2y3
	 w44KAMyisDzykExUBO1THBCFJe1OEIaH+7rIRVIjduHME/pfQETerpH7AH/iOfzEbnVmC
	 6rt2d4YcDm5DXMZe+q4VFcvmosCwu/k6awg7kat6NsCzgk9zk7E4zsRxNW6J5t/NmWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
	b=mrd/pUrHEkND+4LgG9sRwV/TdO7uHlX/2KocL3adsdbtXs62k/Y4Rpc4NuaiXXbmxaii
	 UC7jwxhm8Uk1eItAZazI9X0xFlZ3W/5P4RI6myA7jAYcSDpTJrYC5WfdscQul9YAXODgi
	 vjyx4ACMN+YBua7HtFJayesHw3DPJ9gaR1owZwA/ba2qNaZByn6FCykrpQU26tHvg403d
	 jiDEabHuGo3fbopwdsTEF9dHX4Ac2CqJVo4u7aQxA1Q8AuGOmGafFW6u6HI7ismYg8tre
	 BdGRVFpoECi8rITqAddCmV0kjbwUdhvNrmQYkyZocAThi/Gpg691I4EEoDh5+Nl0auA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PDiC4gNg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXTAT4bp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B02606D831
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B02606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PDiC4gNg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXTAT4bp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APKdV527299
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=; b=PDiC4gNgTACQ/CD+
	f3uuSfxsKGX0CP4S3fWsaLNPgx3VC3hct/Ihq+YWpmaZISdIHLPTm6kCt2AyQNFZ
	FTw6kUJeVIccsQGq8zVQBnYkpvxS3gwOAH2pvzJ4TGmPtntKjvAdZXafnhzYxnHB
	O8/VPQRf9ofjXZnRRrIlNS9U7ScOzyTcxvK3uM+QND8wTi1nYL8hnbph2jsmaPCQ
	oy3bdZD5YiJjPCveKEZXnnBZiAKI+78Iopg/Ott93E/4U3GRv3W6lMFhpIkbiWiL
	vxAq/3KR83DVmDlK9cGkOYt6Ibr4J82iUbnK1mUw/wbm/IfvReAO/yuL2T2TIIuE
	s8o9pg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u04g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:44:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso175396385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972680; x=1794577480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=IXTAT4bp/fgZ3omuN9DA2WrCF7K3kHiG/IzZ/nL6oQw+NX2ApU6aI/8pXIGvif0mz/
         oC0+3RBUkIdz1fOWCNt9lsr32Tbgyp+3YWP33UM3XsPSwB3pDhbBJpAzsPDaW5p4gSet
         jBLYr34rvGbAyvgwg08RXwY6Iy2GGfbgPp59LMyWdT5LN1/40GA3sxHPE+9tdk+Osl7U
         j0+Y75NSWUYkSS+GWs/T/Jyt1IdosQ/mwbysl16ZsRT/PH//0he+xcv5ci7EwWRVFICV
         PjmMQenWw4qEFr9reVllT07xymBubtFjI3ttGEPUGYouyMlxAP4ifixlHniEv/9S8GEB
         7ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972680; x=1794577480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=st0xzvRiVfUYQO80pW573L7QvHv0mMgBPbEzucTtRtETRHzgYqba7KWFBA5uyD9VT0
         EZByRUT9GddugH+owA8rLqVqKkvM8hiPN571V7GkU42HviOaUx7EVJjPulvunvJvsJJa
         eqGzw9KmqkCGy1eXecwjz45akYN31L/fGy1o5MgdtmN1lu4MpNMxWurZPbaqM4HQyHaO
         ou5xH0UPaC7SOa1qNmEWoAih0qZecTABu8ynzGONglInJwYQ0E7BYBf8aVVTyFdv2Wfg
         RP9ETRccte+SOpCRnF1xphDZo60pnAgSYev6r+0HB/QINAKiqzzfdZjqBD9LfV6HMtih
         vUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkczQRVCE9kzu4tpbXDpmGrQjsB/V6inhq0zuwklJ9sBptIFE7/t/SkquzuWwSPlO6g2fcuBAsoEOma7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N6S1toStGv8qCfBSKxDeb286PYefi0OqQeHA06OUUIeSNAvdG
	TE2SjCMwmwTeGwz4ozCk2n7S3Bry88veHo7CsWUfzqcLib2JtnS5Y5r9k8ToWwP5ZUsblztJHpN
	p+fNtGh66e+m9Zqr1YHEkcEFa/9yFXR8WqdUDGV4s92G+t4llYV6jdV6ehJTANHXGnTM=
X-Gm-Gg: AYBFou26tYeKFGtKyw3nMu8NppafTDwmCBqoG4L75LERTVNy0osh1gsSUQjpk49rubi
	aUV7yJOI9b2gAFMeFM8onPhSB0cjTKmRjxNek1SflQsCKhpeGS45fxK69TL/fq/7BCJyCLPySUq
	k0h5gtyro9Q01WizT0S8gwh9Irj9RrvQXVTovyqoGxlRwAG4QtuB7J+8aOQd9Ul6ksrj+U+HqGJ
	4zMxkRzJRhshgVPIKpdC/OY+UY7eyl8MAKdvkArqdueA4fvbxtQuoEJv374pfL+j/OsV6DrcOPb
	ni9Wxm/J4hvmkMQoDnQiER9EYL4zTTjZQrwcXNGYw8RE/qDgzmFU7VyqJ5UEA/Tg3ULnIEgMUXa
	9VfgKlVPfcUezB6gWFu/swRmiTrlJcIR8DzokDMo58WN5kmjcpyP4LdSLHQJVweNpNdHdS/H4pV
	tkQiESxLvhZA3TsNfiUSO4uGQ9bfqtd8V37suNCvFtPFdL9SovKNjV3W96Lm8vwQ==
X-Received: by 2002:a05:620a:4505:b0:939:fde0:a71b with SMTP id af79cd13be357-945f3083a8dmr383470385a.0.1793972680057;
        Fri, 06 Nov 2026 05:44:40 -0800 (PST)
X-Received: by 2002:a05:620a:4505:b0:939:fde0:a71b with SMTP id af79cd13be357-945f3083a8dmr383430385a.0.1793972674705;
        Fri, 06 Nov 2026 05:44:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:07 +0200
Subject: [PATCH v2 1/8] drm/msm/dpu: fix the comment on the RGB UBWC plane
 count
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ubwc-format-docs-v2-1-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0CAHkr5CD33DFJQjC5hRRncFTgq+EH4OMdHJOIvKkuI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bbm+u31IRcrVrNKNJqtGaz6SLp9phvTb8z3hYdeC209
 o5mk65yJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwt7G/t/tSJYm/8LJ5kX9
 id71W+ebyB+zmaHiP3H17nien3X3Ejhb2zfMi2ieabxH+UjZJjEpCZ3Gm7689oWbu2T8M/T+tSf
 8++bNdbZ8/XG5VZv28H98fJfVfWaqkMg1EdMYu1yll7+itxU3HfFvfD5Z8cUh3qvf2LnXZ0lWC6
 umqAd18Mtt5Ny9ovsYXz+vcYXHX4V9xx9VfDdkvFP59YrNHpf8vUyWYWlb8zZrivcxRE6JFSs9E
 fHGOrK9PDc66f0qwag/yhqHnho5na1gWCZ9K1jEvTR2ugG78oFpxnnzr/Q9SjyhMFmsdK7zBaVZ
 Gq3W3nLLP3LWagowdnm7/K3tk1jn3JLNza1tzyT9xgAA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX8K4Mt9ZjV81H
 pWZ9je3n1ovA7vT/cvMdyTczaUZCcaYHFCYuvpBLGh/xc/M3taz9kRy1JESVGc4nS7LhWv1VHct
 sMfqHVqO5PwI60ka7RL9MVjIvz1AOQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXyO1OzF1SH6Sl
 OKYJ40m+DREz/kv4DZ6YZy7mK8RHZFptEn9TDaAz1fOKrBRJxA/AsgVw/qcUwUu7xx92UCM/4TP
 i2v3xBwhCGmnF8oApVAO7roNYa9qsfsiC4eJ9cNTWGQbdhSB5zzOA1z1P4QnC9LdfpfI2SRao8t
 k0OtEBCOTYqnlPSjFY/mvwxHQluEcojMAwW8NICT9x2c62JXA7XEg2rjK2LPUbSeAMBEzhZYd4a
 /TziMavEEUOWXeQWDVCA1yaY4TCmn1N1Sj9KeSbjq+iLskymgYhaGEWU1Gw7o9MX8ZG0TmyKqVX
 JTwX4tO12HzXTB8fquY+XZIO3dqg6ZePQLU2mIcnITihQN4fWkYhaA+s1yK0aQXaS10AggbC0Zh
 RGGuOHty4PlgPSK79NpSKY/1QDd/IXeNLBcoP41oGKrdrG6GVWyNRYtKEmtyLZ/NDDgZlwpBtTu
 19raoyqCYia4HH8QrLw==
X-Proofpoint-ORIG-GUID: I--UepGFTes7hhbO0nm6HMDAGkIong9F
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedd9c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=53nbmNL_gIBj0mvaGlgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: I--UepGFTes7hhbO0nm6HMDAGkIong9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

The comment above the num_planes adjustment for RGB UBWC formats says
that the uAPI leaves plane[1] empty, but the uAPI has nothing to do with
it: an RGB UBWC framebuffer has a single plane, with the metadata in
front of the data. The empty slot is in the DPU layout, which follows
the SSPP SRC0-3 address registers. The RGB metadata is fetched through
SRC2 and SRC1 is not used, so num_planes has to cover slot 2. Say so.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 590922c4f69b..a8e9a69834af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -126,7 +126,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
 		layout->num_planes += 1;
 
 		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);

-- 
2.47.3

