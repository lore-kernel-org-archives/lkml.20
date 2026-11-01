Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555222;
	b=WU6oDZCpt0mdkM+Say3BoZidqqxbU7pe2zy5oEv0HxCGx7GlHfdT+Tj+aftNDeCfYr+8
	 2LkHo4XBtDVsuu+QBPDlzbvPCBjIT7lpZ8V0fwphgsLWfGR5ZsM6cqJ+bWnxkq8AAy57R
	 AtYCG7KDKzhqHS4bHO5GYXPtgiifNPcH1SR43awI+LP5h36bzAyXMntx2befnDbhlDy6h
	 OG9oA/GYMBuiazInV1a06Iz0JpjT7pwatJ8OMpYKfPmKXOLr0qqEHLa8dO2axgcBzosTP
	 RaDW3pzCIq1pd2Vi/7bDLrw2uuCRJFAdvTwJ/ghqaSnHeaZTWY/nIlJVSxwRfzJFIxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
	b=v7fVFd5ALG027/NmROR69phKdhbT6SUzcCUDYzRefvB4TwnOF9boM/1GLsITJ4p276xV
	 I/Z0jVZMbMvxQpLr7uD50J0IrHU/l/kB4b0TTvMWWUGSELXL0PU1hoTdabgpx4ThtYGgz
	 WS8womOx+6Meg8+/9Ram2+AGmlKKQijaXVErmOFAY0yGYZDKhwHjNWfUOQH53xf/Mhj9v
	 Ex/et2oqYOJm29J332Slpy3AgZ5dEYT/T/2Hkn3tcdOLjgnXs7zVQRjx7netUcrIADWcU
	 5g9ecm3wjib3FUDWBv8TtQ8xbft9Xnmb1d5PFp9Z5sN+jr1GdBIlsseTZMJnxPJavEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKPtJDu8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbUuqmFX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B632606A334
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B632606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKPtJDu8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbUuqmFX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQmMl889526
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mvo7MCBtKan
	n098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=; b=XKPtJDu8wpATNUaHOSrcLWKHRrX
	GG9UFCnkz+yZgT4HBYLpojmQUl3SaVFwbTsH/SXX4W18qi+4YnYgbIIEOlEiLpjU
	LbtwPlkg/etINSgUgklmHMepSBlIlTjyFMADs8NAnSdMkElLcnljWzaBM1xmS4kN
	MF4yY82vsZfAjNXfLlDDIDvjc/OPSF+vtwkVk6IGleDw7bAWwRWc95ckx0hpIzYL
	4R2ZbsB4m4SY1FAY/MvlVXIVvvp2voWMqAere053sIpcwPcpENLZALsQHvCOBPi1
	CiG1mBQrSby6qFREvBJ1bYez0AQGjNAqJ5Xw6TnRRfywxj0DkYmw1VAbnpw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ekqkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:47:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so3194692a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555220; x=1794160020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=XbUuqmFX/XeOxTYATqLKIpr/jf/FW9/VCRxewSTQjJLWZy7N+HQONF3nbnQvPPhvZK
         m5etDP4FvhTGdsOyt5dVc2RRcgY81hcW6TV0xwzLKmF1CMisSz02NHIpPMrCBD2tIHGx
         hQ7CV2ykT5nbUhTP5pAX3cTv96edrGJpe8s2QqPOn1syPA6gxtaFPyq6RasQ1fGSDyqz
         zml7dRN5YHxiHuJTTsKacPd8JxFjBtvl5uNB2lCg8FNQefbpW+9SjwTzV3iKv4AsIVHc
         O5oXfEF43youMSkeLicy2ZH7jETH1MBU5Viih8HTEBQAoF9Z3Awz3J+5xrdTf7PuippW
         0xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555220; x=1794160020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mvo7MCBtKann098aYa75VWbgfs1Qzr3HITJBdPK6Xtc=;
        b=nk6Bdzp7Dgj2w3mdyUx6BsaWHraW0YaQMb86oHScxtsYDcaQRgl6m5QQm4xghxi1NS
         ly6s9cFLRlN4pxIszDQnPukYw7Rr2deeAE9k91v04WJpIsDY15ObALY+AWnLpNbwcP4C
         a2wLRI/tl4JJ5zYk0Q+f8yUkcCrFzwEBCakU8uHdUOi332vibUERX4+ak9a/ZGoCO4LR
         nQdvdiQfP/o6HUV5b3RL18sGZQTti2O04icfGLwmQAEW0o4HT3QF7N53XqKr+gl5Lx+0
         z3NztakJUZdqjNXY80mQWSd/T/086AYxrSZRH2fuvcJtX+RqHWRWfNcETUTSS2S4OBwV
         57nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGsGAJBi9rHkXoo6ehNtJk3yzaGDlcZ2GjEOsu8zLyj9fdytG0+fHzGrjcXQocFWiuy/T4R1YAew5sTQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y49OfRI8h28IcCEkR14XIahS3p4ShCu314FzLyLTgqH6sZdzU
	61HjAWXesQ4+GYVJ5nXaH7d3CIWn6VOt1TpmmGoYqlMp30V445K2ZjkStI4gOkJkd2Y67NAi2ol
	jBo2PAzzMcCiNodj6VwYNKlfv00jYL+mAALkbGZuGJJrxrjFNdKJXurNMO6irqQoUEmw=
X-Gm-Gg: AYBFou3ptLU9Rsuh6wbekcV8b7vRsFHvnlsV1Km/cU/vKb+BLP9oeRlyT9z39M6OIOF
	1yCYCwmIocjxEH85560iB7r0AL0E/1lknFDQKjAUlfhcpRBmVbQn2JbZ4U3PwIWgg64dBbaW72e
	DCbJLDE3AAtO78bWCLe4ixR1P4j24sf0UGBbGsja891GfO/jFdGL947yRphddq0LdyvXZ5avK/P
	3lEmkQQEhQNjW42bgMdBJx+qK9evZ19J1gsGD7mV439/D0rlttaQ88OWfvdKME5N5J/vuBn8nX+
	wn8FGlJcqG8JvSvyMv5gVPO2aK57FAn50oU634SPbYN+6Z5WhqfssHL8ay+KY6kZP7bW3IKi3lx
	Zi+17QzBXjG6UmYBRNU0fb0fX+IwOQmfrS8mji6LAnKwRS1XOgRT15I3gp28096NZwvDdpNA49+
	G81vLic/V6pCtlsAMtYewfMQ==
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr7095222a91.67.1793555220371;
        Sun, 01 Nov 2026 09:47:00 -0800 (PST)
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr7095205a91.67.1793555219884;
        Sun, 01 Nov 2026 09:46:59 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm10839408a91.2.2026.11.01.09.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:59 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] drm/msm: Inhibit IFPC for state snapshot
Date: Sun,  1 Nov 2026 09:46:28 -0800
Message-ID: <20261101174631.23637-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX8ItMuMH4ipRj
 0C1ffJMQSAWTMdNKGC5DcjfCoY4LeNYKODqdBSxMQfJhOiGSAAEOT2u0yMGGT6B79TkmJnQqUds
 2Gjs5BPgVSk1MGH3dQVti33szfwP5NUfZw7Q04jItjeSwQ7yua+Ll6xcDVjj8OpFMO50Awlcrq2
 6fEuOfFODs8TMWiQEiHlvhtwmnuJ+lrNTdzqFxuS8yOXPAWbXck2tZJ/Nzre9bCJOlc/Tx8OWQf
 z2piigyjjo1U+QBm5lazZ/k8AgTdZTnudO0SoM//zq/okxivaPnt6EYQAy/KxljsYkrTWGlvySE
 kTGeWh2VD2+NQQVNaTwVKtBbCmrRaHL1ljA7dBMnXL7GqXh5C/6W3kAt8v1yER2QBQWT/UZjah8
 OYSbfWn4ScTxxiqDdLuQiBmziMZNSN8QJx6hJEcCguJB3V5FoU/yHAQZFm2eAj6ea+a+C+ksD5w
 4IEq1TSPh5vqXCkcPOQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae77b15 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jgQnFmZX3A3noQDnNKkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: mJTZ5wkjkJM9bGuKXiLUXgInyh2bqj_X
X-Proofpoint-GUID: mJTZ5wkjkJM9bGuKXiLUXgInyh2bqj_X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX8o1u55cpadQl
 Y9dav8aWHLU6yrU4e3hHdu8Uj4NTcjrCD9GUOrNhSMORZVpOuL8TXUWM/jDYFz9ic+EW0/tCc/d
 BqEkKJeLSxujCOsbJCQW0TYav54n+Lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index b0ddc02f67b5..224401b4ab12 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

