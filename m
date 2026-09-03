Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D91FC0EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460656; cv=none; b=CYwdlS3S29bOYWcy13GhJN4cxxShMSRsV7lOp4FTehVmaLA2+dC2Ed+6OfuSBHo7lx0qqpys4RxOj0pXIRZshpqu7Ug/sHKarh4voKZ7GsJJWG6UdgdAmV6HRLrPStDDiknv94fLgQzkfNkQtg9uIMZsDuSDCHbCi3yG2msjxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460656; c=relaxed/simple;
	bh=s+J+DB3T2OYS4cexx/6gamGsabNdYDCNqoTXrneeivY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxDObzYVN5Xy44cld6AzXcdcPzSVt340jFiOQUxF6jWWHYOy1W0w3/4W/5svHy67FPs7ALuA3BV9VGbNHZo3+XMm+3nAdESrkM5U12LIA8CI1wns0pkehrBRHtDb8Y4PB3zkbuuLcN4iAsUtB/O5mYudlgPTe/XkvrYr+6p1T5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLWz09xl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXVX72BE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLWz09xl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXVX72BE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G31iN1698861
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3o6Eb4jJTSo
	LrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=; b=iLWz09xlxIkF+wp8KxDFiA0gqlq
	vBTYohrPJNGHAzlV0eciRMMxKsyDbaz8ZIRZ/G0qXWTkjVC5ZRYtOeKesfb2D2HS
	GDR31g9DpSU4u229oqSKrN9BK5UhoYHyuKDmTpOHEsGHdqggUXWd6B9hkHxEzfOQ
	y5QIYqJpJq8FJKdSqdi0/hHoFxyfqEKLsvAtSTm9RWq7WEez/IAsds4bINt3luU2
	1UN9YnJDx838vW9yc68hGaIwHR/jAI6gXaJRRWAtE/L/aMrCIGSjuioJN7tjlfdH
	Ze9+tBFtwJ0FThxdjU++kPHB2HnrC3AZ3x5wdy4K2anw2I4YSfusnQ157YA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvgvcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:37:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6c166bafcso1786505ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788460653; x=1789065453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o6Eb4jJTSoLrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=;
        b=FXVX72BEdemAm6Qu0wuXLAWuiuHZfELJ+c//xLSubtnHuBZjEHhe8Um7tn5gTth18x
         zkyX8yreyjvQ2kfJgtjTNETdR23vYZzX87YbxPb7uGuKLM9z2SBZxhsBLakno7K1qJY/
         udVPfNa+v0NzXP29QvBHffvtiaTrd3qiNi8dwUdlKp1RiaCBrRRAdv+rN7Gp07sQJa+n
         IXr0Zgcr9XPd4LjnLJqFdWCeXpZm7C3shYj7xIOtkPGPoBO1WbuZM3F0kd9k/z9jmCjU
         rRm20vNn/ya+aI9RiuXGI2CWQrfN7Tt4AnXG/NcHh2BNTPFRNy1sL4qE3FwKy1Fzffnc
         Ceyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788460653; x=1789065453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o6Eb4jJTSoLrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=;
        b=DcQjbi1Izxsl9+GLoXe1UAD4Cn1oPmWh2XE9sShBMCbuLKxcI1l3OxtZ1NGE281p5n
         6kLM5TN2D2N5f+4AIw/ad1eod8xTLQ2KKF3Tw82Wg8g0nyJanNZ/5eKZmxtYSvPbZ/tD
         mMC1DhXZUP8+GZdzExK3k/wmYNQ7BjxDoneWdUUC8UTOHzvemyYzI4uiVKKOe0LSkEp2
         sOXneDjeR464x/S2aJB0VvNXy484J1PAPn1XWo63y29O4J+AiYJ4hSbS9K3ezGj8icCN
         mN63wVS3dykQKxKZbgvW0RMFhttWOIA6wDs52A3m6wJRkXbSv8w7g8bmIEQW1Ewuuc9Q
         pTrw==
X-Forwarded-Encrypted: i=1; AKwUvBwk8buiZqUVB5Z7o9RphnEO5aMD7pDT5H/WrvaZCZ1bZsxAAyzUC+BtzlmJXr8kvW+laCnTEmWAUT5O8bA=@vger.kernel.org
X-Gm-Message-State: AFuF++mp5Y+f69UpM+cJiM6KuYyjvQAJ3xuEMLU7hAlEYtPPtnMekLgp
	24MeNllGYrelq6Cs+qOIGqrgT+GWcWnVtT9+URQN+hKdDt4F58Dqx45r7hKgZjNigwLELhTtNni
	rtT5afC4HTLMjH5IHxiaXaaL3FsQNdoJ94K+2AnnXg7yHp6pxuStRsf1p9n2M9Q1bp3E=
X-Gm-Gg: AYBFou16vs6jXgkXpFkFdjbrXrifNHE1gb528CMB2tLF0yg5ZxH0YKZ9mKzR7C3mFuK
	tG1LO8JKjgihGvxUODFU3y6SQWAAlRdZZxSERdgJ6bHPTL7WCpOr/lX8Zk7MViWW7t0W0d2EEhw
	j8YKQOa9AcGgKdq0WCVpEdNy/j0ohA6C04FXyH2V+ukM6GS9Ja9X8VBgevJEcviSUmWsqCDjPsa
	YDYcKkFiPPwMawPiEP2RkwigDIpfhlheDa00zzV2djhQeBR1xwpaDXww5DYws6C+vWMKzoR/UdL
	z7GqGTqYUGMSuDJeSKc2e58805nL1NTYG51HulPDKbGvAKdas7iiSalNfaf/AEj+MCzNGCYivZz
	PC8BvxCqGDBUxoEJAeYQtc/7ENL031rs0sxvkfXkbWP79/Uo=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr634153a91.25.1788460653223;
        Thu, 03 Sep 2026 11:37:33 -0700 (PDT)
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr634088a91.25.1788460652734;
        Thu, 03 Sep 2026 11:37:32 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm6620095a91.11.2026.09.03.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:37:32 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/msm/gem: Add modparam to disable shrinker blocking
Date: Thu,  3 Sep 2026 11:37:25 -0700
Message-ID: <20260903183725.15835-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903183725.15835-1-robin.clark@oss.qualcomm.com>
References: <20260903183725.15835-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _KanD6mXMSWoU1R4ZicWgIK5V2L-TfKH
X-Proofpoint-GUID: _KanD6mXMSWoU1R4ZicWgIK5V2L-TfKH
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99be6d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RQ8Jhd0wILkaI2gFI60A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2MyBTYWx0ZWRfXyWEth7PZ0Phk
 Skg3faGajKbRKJpPwauUsAISx2EkdjgRTTHobSC0b/ZjRiDzba3Gp75quu/AuAA1iM3sH44woHD
 S83S7b8ACGTI2mHNxtPIxNpBdBjlI0M1thNS4LO5cgEYn/2BygK2czRq4xHBE/DQtBL28jb+jrG
 EEBqNC5A2qyV+/Qel4rqFxSVCVTvwgzm098FwW3LwxoYjWUT+w1hvyRscx0WeNUdYb54ci3usOG
 DO3ut0fFr3KA2IHufnUN0nckhvLGArRUcCjIhr2uDTR9OD0U/13UK+kHu3lb/E5OX7PNXzVcViN
 2nXwdAZyYdbp/vmCpTuvD6/X6EruVqZqw29V8cNl+Ss3MwriklcmMWCX4zMetmgC07LwIWaS3X/
 cL606xQir7dsd6bBHuo1GoDMxouHO244hHo8HjZX8aIWNQX/0X+J/8bAcaK0q0t+yQkykeHSoox
 ECRjMopzY6yfCjLqLVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2MyBTYWx0ZWRfX20m16lva1oZW
 OEwt8uOJQXkahjoeB2hpvjXJLJJDE5eR93AvwKIRK7zjZkX1DUSaoA45Lb/WsadTyr2xPrB2p7t
 JPvrp9Prf4frg0C3jP01c3PtUw5eyvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030163

Normally if we are under enough memory pressure, the shrinker will
eventually start waiting for BOs to become idle.  In some very latency
sensitive use-cases this is undesirable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 3514d5c84989..83ee032cb21d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -19,6 +19,10 @@ static bool enable_eviction = true;
 MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
 module_param(enable_eviction, bool, 0600);
 
+static bool eviction_can_block = true;
+MODULE_PARM_DESC(eviction_can_block, "Enable blocking for GEM buffer to become idle for eviction");
+module_param(eviction_can_block, bool, 0600);
+
 static bool can_swap(void)
 {
 	return enable_eviction && get_nr_swap_pages() > 0;
@@ -26,6 +30,8 @@ static bool can_swap(void)
 
 static bool can_block(struct shrink_control *sc)
 {
+	if (!eviction_can_block)
+		return false;
 	return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
 	       (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLAIM));
 }
-- 
2.55.0

