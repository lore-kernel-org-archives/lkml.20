Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640013;
	b=KrYf00cT33Gi+ijnGcCteODXtKmvkZHzskpc/b17tsdEhB9KLy45cVfh8VQvJtT9i0L0
	 3uF+zwxiEVGAVCwjf7KL3bDzaTwjZGEQld4HzSysVzBlDATIMeA0kcuAcr0KgRtmGJNTc
	 B9CBYsWSC45kSpzG/lT/tjMWR4OXNGY/kDpum19YQNkF/EpJpbQWaLMytPYRrsF2zj4qt
	 4BDOzgDCAXMq2qV+P+JSkKe5PKIKW49L6il0cyBvgEYyrwkkFVTK2qyAJ5m8a2ZZWRxuc
	 /F3Qz1pWf5u5dYT4ARqBarHlaxKKSQ24eTbM52zjtp4qQgm3XAW32nNMoNlAZ6l7FJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r/WboLhhvDmVhQJbnTSwViwOgEjv6oVEPILntAbBAew=;
	b=1rc9tsVIhlgBOpH6eQg732GyKIWLr9ZZ+1yMfLqM8X+y/I2rqdoBNY/QMmNlSxsKqzGH
	 WA9zvy7rsh4DWQgclrvq7nqxbXQ+70a21Ej1R+UMKU7IrusM8bXBH/AeFLwJC2oZ0qkAk
	 T555q3+GmQ3ZptHZ8SMHeJtxD0d9ZxYZSW5+W3pvx+6kMxe1RmDqtJKSSCJaWvVKvInQO
	 DYK5I3FEtknT+Wawv89YugtTBCcZr3oYhE5yMzK2wZWp/w/p48cisUj2Nsz057CwTfnHP
	 8c8kH3Rqn278PhACDkDcOLIfx/0Mm04UHLm4Jo+TMF8dqvmqfiKwJq6twrhVorxtDhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Gx3lGv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2gugo83;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D160A0FF6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918D160A0FF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Gx3lGv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2gugo83
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZOuT246747
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r/WboLhhvDm
	VhQJbnTSwViwOgEjv6oVEPILntAbBAew=; b=U5Gx3lGvUzHDBeDBNSBPpwKzlva
	esSfDhf9M/mt8sqjqFFipFzhuRP2KnQFsyxX5iDD1fKYOS4vwxgpCuHxNThajY+9
	ZxhYv9LB0FHJHmLaWiKr9AWrjBBbVw+ZIlifI3i1XeblJkOqbs1u7EB5YOoYqe4a
	h6BUmdXy693kW9FhcjnC+q7KMkRA4edC47IyTdOhqkBrvOfSvAhldiyMSRyVt1u6
	QzstlZ7Wx5Poq6cJKrIjwmCi5JWUkeUa82sNYcfjXblqzjVq0u9/VKWqTQEB2GNS
	29uwCKMXKg2GSIo/MEIexuQqSdKiSptfjRGuP/o26PA0tsUR40/a9ExdiBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmetjrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:20:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd65070d3feso1932043a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640010; x=1794244810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/WboLhhvDmVhQJbnTSwViwOgEjv6oVEPILntAbBAew=;
        b=R2gugo83YGBfrzUm1jYyJ4OANHeLtukdiTo27n1T9/P0tvHZ6gJG9Fj33DD+dbFIAI
         IbhsTbhGGJ/41bxHbmPdYSDGs8BbZmnnJNxJdInjlkvvT4zPdzjmQAdgFxkp4sDVLJfQ
         jk/1KQzJWYsPhCVaMU+a/jmXEblxhKZu2Ea+M5fM/coE1WzZulgkmTqNpZexgq9kaPV2
         pEzmxccvg9OTx3H/1a6u+4Rr8JiCXtP3ysEHVduar/DsWZwnrxXUzjDfBA3sHVDxcWwK
         udrKqtvATTHOMvO4UUVvRlzwYOAvAiV/hpqXSTRmvMQGyFgeXfU2ckFixaQbyMbsKTD8
         KZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640010; x=1794244810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/WboLhhvDmVhQJbnTSwViwOgEjv6oVEPILntAbBAew=;
        b=ENXKPkejfWmcEpq/3HUtGdsWGP7LWMtY52OtDmkRU+AxGlrcyPz9+VI/ARjEhr/8G8
         qxljMqphM6PqvUWc6bT7zl8tRTRbCTXGBmh+GEzU8xMTl09cwSZcixfXSip+lneHPafH
         ps/60KjQsAO1yoxZy+rQyw9sS+rNkSRn1+R1B56aYLoFhbRaXxLtEG8VfwxT/CxVywqw
         4U28AAlVRUR295a3z7DzrJFj8m7IH+DpkpMCqwQd0WaWJ5A+RJ7xz24KE4aWDmU6/HyM
         iOn+MRqRiTaxKLzL3U55YzkQFwACBcMOznTmgHQOEzkTK7ZTUwzznESBHs/Y83cHCSfq
         f0QA==
X-Forwarded-Encrypted: i=1; AKwUvBwmMEPLs2ULzqQ9XhD+thiqDQJ227pS+aDZvF1oLitXahgzfnkXPpDmPJUAUiQCHW0A8esZ4E8DcvcG1a8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR1cpYU7YNS6xl0QBBsyXKFudTjxjOyqC8nZ55mQQEv7sK1eBU
	nb6ACG7xWGuerL9pKtd5e6L6rpEJNQEQd6BeeadSg+hVibJQvYxxgEgtGp88aGhHcOAr1/Klqzl
	7WM8VdjMX4ghpz8GxhIjbVjF2lWHB4XToP54Zb1dDDc+1T1CID/CWqnp2LpaVwwa0J0g=
X-Gm-Gg: AYBFou1+bpd2AL9PCM/qRMVBkTnIkJZL53j/F3jxZnJKk1ZjvGf0TZLWRUMRFSrKHmG
	1JoKOD5I52i6EsZvR8PuSxeL3DXomswzmoz0FOtN7ZoPF+LfRgwh2aLigpJe54nTI7hegaT3c6v
	wG/d8kELwa7kv9esx9Q3f6JyikUx7B/TG5Odbt9ZmJLUDNtLr+kLJYZS2tj2kKSxgwyziD7C1G9
	6vHqvKd3qqlxE+niyc6vaUi4T86PV2FuJshUjLHajQvGHcpt6fknziHL9lBXPl53PKmSbYW4GEM
	dWHYj5u1n9wGw+HYrUOSk11T0VyUlH7m/7gHEhJ/lo7EHQ0J9bylbq7K8AA33bgZIbKEoPWsS8Q
	PoTpptn/9YGFBl/8I5OSoVapf8eHBh7vbRPb5H1yX6fNLItlc2mv9DZOCfaCxtEzyydKn0Hz9J8
	roAdLzJ/DKMFeL2h6/Oix4Aw==
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:fcc6:2f12 with SMTP id adf61e73a8af0-3e928632c18mr5575750637.4.1793640010368;
        Mon, 02 Nov 2026 09:20:10 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:fcc6:2f12 with SMTP id adf61e73a8af0-3e928632c18mr5575738637.4.1793640009907;
        Mon, 02 Nov 2026 09:20:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9637134sm2275551b3a.11.2026.11.02.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:09 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/4] drm/msm/gem: Decrement loop idx if handle lookup fails
Date: Mon,  2 Nov 2026 09:19:59 -0800
Message-ID: <20261102172001.508440-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8c64b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXx3QtHMf+/epk
 GueXmIo+q7W/YFPDe9aPobqevzk3IqHXZotWk4sRv3jDJI6VoaXR55+KkCSygtTTgYj+1qkXeQj
 rHHQxhL++6GBpUbjijMDVm2DrVg+/clQPEK+rI4GxvSsXDn70aawPoh8rFQ38/oDwy3uztyZPLb
 Cy6D5vRf4nPwOqcO/JWI40LzYvIEyy+XPw/pzU4MGRF0NPiV2oZO5RT18nhewJ+GzNJVP4dvyTi
 KyMku8RzOxITPtfZSK7WgrKzmprsi+BH6BdXuIjXC9PVp2ayjvdl5LWcj3pIDlMEfZpJHm+iYdK
 PAB5ezGzbZnkdphegOoju44riBEellm2xVJf7k4E9bdEqjcClKUIVE5q/9WdhDow4dLu3wlkAYL
 QnhSpa5Mgvm+39TRk392EFfEVscj+y7CqYX1BnIws/D//7GrvIyWMQUQAXa5MpVjO2Hv5zpbyhj
 HPbSup+b7B5Cyx0azcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXwmosk4dVVHHK
 +PiXWU6RDR14tgcfiAHOBBIt9PPM0c5IueXT/9lPJMIruHYmk+iuSVIWrVn8mpPtM7wELTzyxwG
 lr1YtDM2/21zppzo7u0BiDk63aQKJIw=
X-Proofpoint-ORIG-GUID: Lbbo9oDR43UKAlg71vxX9RIzflb4Lfm9
X-Proofpoint-GUID: Lbbo9oDR43UKAlg71vxX9RIzflb4Lfm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020069

In the out_unlock unlock loop, we should skip the op which still has the
gem handle instead of gem obj ptr.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index bd1c3ceeea51..3177461d7ad0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1110,6 +1110,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
 			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
+			i--;
 			goto out_unlock;
 		}
 
-- 
2.56.0

