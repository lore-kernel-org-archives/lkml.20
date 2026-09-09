Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9D391829
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976662; cv=none; b=VIS9QiyO5BrHM7E4W/0CTDMJ4aLQlmGv8hMEwpmxfvmtd5MqZr37oIZ8RS1oouCXa2Ido6sg8irgT1ZW2BxFTh11iQsv0lbiQGC1Jum644uGL3FrVUooYtx3dfoOXpLZ9alV092GBxd39Q52woyyqAEArkocymjMJyVI87z1KTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976662; c=relaxed/simple;
	bh=Cxt2K7tteGjufMAiVoyzlqfyT0/SoeqAHMUFP7Ll7a0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L2QYleAXRjxlgd73ofTCpel278KCZ3IzVU1KrH8imSM8BWdqWKlOTsw42dFdEFHvT08b22/l3NDjF/9tbRaSRzQ/u1lvKFhgAe4xHyoQ5zcQ6v665K3j5ninO+cKPqA515qVzOgBlfIV0lFS4czdBLcOa+5PKaWmuGFEKr1qEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHGF/z+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaVleLdY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHGF/z+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaVleLdY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7dC62600152
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 17:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=; b=HHGF/z+bPnFdGXFK
	04jQGAdF30SCQ2cD2GJsYwaeNJWRZ9dbC60PpdkfHN9ZNYiUg0MFhgq5OSix0c4p
	lv7Q96+ZanIqBM4tfXZJM0TlettLBvnNKugrq08YZWQCFb2AnV6FchvQ1QJWKwcI
	pOicLOF0ddXz6dO4R8sdpViB4768CcPFcWXLMtgdHAazqP4nJWSYxztTv8v4pVsS
	Xjqh+sGTM1HjlG9qf2zSyb8YlniSGAfJCzQomXeZWU2RMFA/cmQFHS7o4GW7doUv
	KhRAnXoWsdIlf/RU/03WqAoI6ZupkqkxEidSQImueahnYJSNBrNCPD2HXd6nwndA
	YonHug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r1eux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:57:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so206403a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976659; x=1789581459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=;
        b=XaVleLdY/kL/IZhY+eKdLdCmLRyB3EscjD7+ozI4DdO3USPZ5OpU9s5CX83DLN+Lqb
         6BICtBF5Vz+FRVdmTjzbFlP+xrFYN7fkqjspd03LuaNAeK1nWzCWGYjCpwMBeKnM9TRP
         l1lAHtvhFB8q8bfMEdJe2qcvYNJcZK1VpNBEMd4vq0aZa3FmA2fp6QLQXu4g8yfFvu7B
         Pdw5pOGxlIDyF+Sil1SvNN6GafWPnJ2U0GcpAWSJTgOaVfcFvLGoNYAc+8yfTE9Y3Pz/
         CijR/uvPDzx0jXOzhvOWdZxK3UYB3cE5m+TviSpyy8G4Mqb+cULp9T2saLWqY486dIM3
         M8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976659; x=1789581459;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSiISWtT6dWHOCthkdSh/uRevScOeWXykOKuvR39TfY=;
        b=ZwoeE+JFVFvid7P7B8n1Wu9MhPb5d0HLu+4YvyXjOh0TN9F9W5Ytkd0XEmzKdZOPvD
         BIYf0iD31Hd1/qyWyvyni5HI8N95MSWooxTHbSLavSAL7ug22vcGDfV7T9LeDJc27IOM
         K3nWb0vyy7DpUxY6qH7qPhi4Iqgag5l2n+wB3pGQS2qOaZql1tsQYooRxu85PKQEHX26
         WDdrq9C038YdKwHwbYer2DTvbz5Z6g2wZEecV1BJz223ZBP7bV+nLpdT/a28GD6SkxT4
         K0seQmfyYa6gFmNWVmNsGMg4LJ2AS4kbc/cz2pcoEaJmCFadgleqNI9qSPBcqrhlX68z
         ktuw==
X-Forwarded-Encrypted: i=1; AKwUvByfPsY418WmNTWhqnXv55m0mTChbPuN176WyX7LIa+7qeanQiXSDXc5qI0E2/srWkcTEp3RKcdOhCifmAk=@vger.kernel.org
X-Gm-Message-State: AFuF++nMtHXuNYM/Q7K0YoZEn61k5PQ4PmBFt98LsPT7GklF5dgY43um
	KeetVIzHn+x+3jSIVvOQnTLtyfNVS+8ofhSUjZ+Ugzpi3d8wJeJehUoEbmjGx0n4yDwiVB3YDMN
	CXXEC5Xvrr01A5/xU9/8q9KheViTP0E6h56B78SBCEmixtOynsX6Jt195pqyC9UUUle6MBMCXLn
	Y=
X-Gm-Gg: AYBFou34yaetV5bAipXTwfNGUtv4YzAUdffSDbf1Vw1/LZsBotj6fOVpEPwsKmKlUXQ
	ntqZKlBGkIBTFN1zZOYMwAN5iEW6sP1e23wR4PY5v9pnOeZF1lpMCd8y5UN6tyWnKWQqaj/kP9N
	gEhIQWQx2+6IemRtcGdzIy6gGc0LlH6zBBBjLBT4lmXj6xU1iPG0rE8uOneMgvIwD4ftymwkILp
	lRkYxzxTiRJT9mGaaZ0zjIFg78mW7gZvRonxQ09NvZD3dvajhYkMkmZBGZ/JTWpS/XS0HkWRyff
	rVB2uPIDlSkMVd5fi9bLVmA3W1sr1wBjFohXtxpyZIS5H+EjEpRG93P/4t8Vuph7f1b37d4ghiV
	KkDJRNIxskkcZ3g15PUpiVPzjjoH44eJUV/Jh0SUVwgGxAEuW3uT1h1Y=
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr400192a91.29.1788976659307;
        Wed, 09 Sep 2026 10:57:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr400154a91.29.1788976658756;
        Wed, 09 Sep 2026 10:57:38 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Miles Hu <milehu@codeaurora.org>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org, Sven Eckelmann <sven@narfation.org>
In-Reply-To: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
References: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
Subject: Re: [PATCH] ath11k: modify null check logic in
 ath11k_ce_rx_post_pipe()
Message-Id: <178897665757.2048605.16667073298414981118.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa19e14 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Bg9AkRiC3xk1yIgQLLAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX/9kIQOF5OeXG
 1Q1A4KjIwo4LAfhagXiR9ljUA+1MSQTuvuKBPvo3sDGmJQz8M7lOQ47lM25drn+oGDA/GcQjTzm
 KJgyscNG3Fo2Fe3/n4B4mo200IYhF4+uxih8pKZn94vLllG7G72M7R6ksxHwaTUUGwVJZwii2YC
 z4FwPPydP7WfrG2wHB4gOUyXihKeqX5nRpjrk3X8nLwyXoOmKYxFTG522qzRVUl9UmTWTeVNMmg
 7dAEFKlnXd0BEvV0xWrdknoPcbcAHEZjqI1r0S97mOwOVgwEEpc9Sauhl12tEbHzlbnZzMKaj9C
 eJClCNQ4k6EFPAv1Hq1E9hnMUUN3Me99lBJ6drvgLJ14VNYTvXVfCHudK95F0tlCeH0fEKkMWXr
 BRlJuFO06uxdWYZm9KR8Wak4fF7pNwrHXPTIP/xEUlRv+NiX0l7iYQKKUBzbobNzUAqmnZM9Br/
 QzZCVK2ifJNMY0dZrTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX+bB2Nt7Vx+hr
 mi7m5qir63rB6Ug+RzmJwMLztRmDedpDzcFnf3DoPWSf/t96GEolpjQxOVYb8Coj1oisN+rFQUB
 Bc1KiRG3+XaetapMDBkXYhkL1j6eNRU=
X-Proofpoint-ORIG-GUID: 8ls7G4SBzIMLXvWOoeP63Sq8PJs521S0
X-Proofpoint-GUID: 8ls7G4SBzIMLXvWOoeP63Sq8PJs521S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090200


On Mon, 09 Sep 2024 11:08:20 -0400, Mikhail Lobanov wrote:
> The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both
> dest_ring and status_ring to be NULL in order to exit the function.
> This caused the function to continue even if only one of the pointers
> was NULL, potentially leading to null pointer dereferences in
> ath11k_ce_rx_buf_enqueue_pipe().
> 
> Fix the condition by modifying the logic so that the function returns
> early if either dest_ring or status_ring is NULL.
> 
> [...]

Applied, thanks!

[1/1] ath11k: modify null check logic in ath11k_ce_rx_post_pipe()
      commit: 52953d149ab4da0432d54b09f3c8add42b4d4a82

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

