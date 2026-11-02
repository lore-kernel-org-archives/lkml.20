Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=5cmj1xgK8GvClMNZyVDHv4Q3hkNidH1K8OQCu11WzsKH75uer41C2Hwpu7hUC1o6xnm1
	 /sz1BnSEKhNIDE2/8jCL5buO3wDeRxr1MyG3JnW3FDIlU6+G/fmW6Do7yKX7o8vXQWDr/
	 3+pNCPQc6m7Tnx25OWiZrvqdzpsH9Z7G7d0ZbrKoDY0Yk5DuLqRdMQwslusCZCrb5hHcI
	 4Sbl/Hhat9ddt2mEtNr6eaJz3hco7+LZK2RV7OUiUQbDiavB2Ha7mRfPQrHqOOJniHW6J
	 MqEWVUwsokd2tUUeOkrco+ojuQAO+9dyLbnYxlc7CSoIkPrxj80m6MnVkdUrI1vAyqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UttVKb7MWslvuojwoH1mw96vCZ9byntzzqymS3UyJsI=;
	b=ONQuPw3Snx1BnOyme3/CmRwMuFBGdhv4a7dj6H0zLg2VTvy9K9nXEaNHpzg7igzDw+WQ
	 sMveLhAq2oSjDBF8hu/+klPddLnBLZ+RFRzItnferyQcxHjAPfQQ9lJ7dylFzdkuK+wlt
	 JXzfW737UdegomEral9dzH2fZne9pZQfgJoo5o+KoZncyhP/i91HbHGCyfnS/7wBBAJbJ
	 S9QeihdRWXmX4FWSifPMmSfwVCjiVzCxt8nUAhfKWOnO5X7zkG8f1hXVnqltnZgztkMhE
	 XwxLAbOT1xrOv5V+3aLMW2XGSaYIOm4zyAyR4m1nQZ/c3foc4C5py/gUidAQepYJFsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="exnL2Y8/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1XHx4hM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA45606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA45606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exnL2Y8/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1XHx4hM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2ItVeo210679
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 19:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UttVKb7MWsl
	vuojwoH1mw96vCZ9byntzzqymS3UyJsI=; b=exnL2Y8/JnVvjbjSfuTYD8Xumt0
	Zlgs47QV8kvS56AE11qpAnVESj7x434Ofy60fnejMpiPwSHlcrDrPWOnvrWOoJxE
	X/h3SHAXPRY7uTlZL9N8S7jNiXvMMmqIFWEn7cXKhz1u/3zGeYFs+d5m3j4x6iom
	EU+8pU2jJRJ9j1XirOHjQfc8V+qHACm9Ssj05EMrK/H5CaJ3kUOFZzWqkB+h9w1B
	YiQME+56ZvDYoWS6zO89GlG7HEUrphkU/05Tko+V4BfzLCbjuyzjuRFPOMHJgrzz
	PLA2+QhRY9TjeTzAZtYky/CwLrVT92gGp4bMXV6I+Q5u0GOddkUNIQErcRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r00v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:00:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2683701a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646023; x=1794250823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UttVKb7MWslvuojwoH1mw96vCZ9byntzzqymS3UyJsI=;
        b=H1XHx4hMj1/PRLuApEdkAZVcOlIdNXaT6UXcssaLSwVFeVuga3vL6nahp1ZRfX4h5+
         uLsg4GbOjpKjCgZXn1RFwzx4Ml6LrW5TShbvXTU2EajMXG3OMSBM63+df7oyRZRkFCnw
         RXNriCVbtqy6z3+16VPQPprLrKWDoM0Ee9Pxl856nVpB+Z+N++bAJdl8avH8rj+6m9/L
         aoCYAvlehwYybAsz94lw9W6VTBuwf/tbsi8PkTmpQ33Zk9H/otebSfH9JEJjOG/mAF7z
         k7u822Vd2qKZZ+Jt3nb5A7j/mZYQoWcciDAajqsAGAMjt+yNVN6B7IdT3vvhEc/ntRUi
         xCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646023; x=1794250823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UttVKb7MWslvuojwoH1mw96vCZ9byntzzqymS3UyJsI=;
        b=y9EdYz7ksYoVNLmjVaNpaAHbORZgaJIaqu9grBzrBMsoqbHYazjQsux1ulM8nBDha4
         g5M7sCLf9Not2qmvlgyDv4g4HPw/aGQGqPOHTNEGrdY9d72V6kSxx1QK9jcWEMj1NyOp
         31V9csm2vtfcMKR/YhO2iG9yH7HBHRh99qL0kGsV3lpynu7qX5Irxuzrymnm7axF+I2M
         4IkgK+pychBcikbfG1pRus5MBnhMJSVMGr+EIpb80zeNyyPMH9NQWnLeNvwNfNprHOI4
         WQduBz8FKaN0SX0LIAMWcn76hFCVbRzlvVMAyFajxUXLh/1RJv+WElj+QOepKpXfIrfF
         o8yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA0Aq7p158ZPHCPhcBlC0kN/Z1T3pE5KyLyJFipBrzK4PII+1Elm557ixHCDYAEfEKh3fBmeioEmxWx14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pzy9xhRJBWr4f7U2aazcta358SMShiNY7VH91r+Cdqk6/H1+s
	xNbxioFbMokHXH0ZLNhkS22QVtyjg+CQCsl+S/gA2UPyvyHLXrUqJKh7UHYq09wBJaD1ydgJOit
	hqoh/FyL1IZxT7O0TMWy9faSt0bKL0vaTZDW6ioq9Lm3uwgq6L0hb6UGaCXY9YVmgrhY=
X-Gm-Gg: AYBFou2DWvIvqTrHjuI7PjCkc5xrdRVvQ8vVQ1cz6cxq62rmn3J62TH7eszorY/hmy1
	YBNiPTWdWUP79SBaFYjZGmqa5U2vRZiwfYK2Dq0aiaGO6o5HKXsGoyteGA+0HaNeqCTsfR5cT6L
	HFMpum/BOqlgjf1+b5aziZYhV4m/eWw0qk4Z4Gw71snI/QQ5Nx12SHuB8vYT416AK/AF4+nufZK
	6QgJONaSCGibUrVvPnD73ZRSnU7dtk6MtmXqSIQD86398WWWcZWYvP4Ha/J4qj9AFHOuFIPpvIp
	XXg4CmGDt4DvuHgc9rm7xDwisBxuAfYtBNZQnM/4zVd/wWr1perRbZ1bs8j+DaMLODssKH7FO5v
	oghntR878tw9nYR9Peu0FnwxVc9UeY8KxoQUm2daJ3Bqhn2Vhx3anPVv6Cacgc+//aV9lqhRvAS
	60d+cj+imofsnVAIdlsorEnQ==
X-Received: by 2002:a17:90b:1d47:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ae896f87c2mr9662325a91.17.1793646022627;
        Mon, 02 Nov 2026 11:00:22 -0800 (PST)
X-Received: by 2002:a17:90b:1d47:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ae896f87c2mr9662286a91.17.1793646022177;
        Mon, 02 Nov 2026 11:00:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c62984bsm444552a91.9.2026.11.02.11.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:21 -0800 (PST)
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
Subject: [PATCH v2 4/4] drm/msm: Inhibit IFPC for state snapshot
Date: Mon,  2 Nov 2026 11:00:07 -0800
Message-ID: <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: u0QOlRfxNRwZU3PMS8Ch4DFP0XbUhL7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX3V3x1n8DFT4f
 66Scbw8rbAxeGHWlmMfpOylvgLSp+LB9f+HC7LRPy0/rXvew5RdcjrSxZlQ/Qwp8Go4mN+rZivW
 acVlip7ahz8AtcZgta1rP5skNb9xzYji4W+4vr5sOzXaBumrs7htVqY1V08xCcqLeZG8AFsW9QE
 KZxBxMQ2E8r8pwOpSInXpPxFTf705cBl/3ETAc+Pe4bjK17YAup72x5egEspaPfz1Oh13A6d1jA
 27bxr6FW22ap3IhKVISnndOLKTd5eX4NY9ZVlZ+IAHROod0AZECoLQ4ZhSoIc2H0VlFnBILLLmt
 LnXWFUIRQaaG3TRLSPtAuWxQumY5fQcF+Io0PCzvUlSJ2gXy6bG9aiIkYnm95kxzZFzPiPyQWMy
 LFdEGWM0ZHfx5OHFRgIkkXfsndSvW2FDw/bYgklEa+WIQkSbIK0dIHpuytEMCGyziOne4jkau97
 CFkD2N9XC66M+OcpCPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX9v9UVBJovMJW
 4t5WLJeXTvIo1z7EjfceVsLYrDfhSHUMuX3KrjUOjeyjuhvdJ29uAqewEFOR79qEgWBKEGjEjYc
 ZDT3gHteDWaydObc+oXs7XOQl+IV5P8=
X-Proofpoint-GUID: u0QOlRfxNRwZU3PMS8Ch4DFP0XbUhL7A
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae8ddc7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jgQnFmZX3A3noQDnNKkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index aa59b28a3392..29209c23fcfa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

