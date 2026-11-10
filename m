Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286573;
	b=L2icX9H/7ca7PvO71+SxS/MP/tCXQx2r948itt5JdocAJwtBIZqMKaTL1zfKSUr61Glh
	 n57Csk394ok3jB9lVa1z1Nn3ILPdQflZww9qDis6ZduEHea/n8tvHobT0fQgBLKq7MxVN
	 kWM8zKn8NI/gubunJA0jJrlJE7VQRuY0+ilTsgM94mkBPvciCc//E7e3vXavA+vRb9FnJ
	 DZV+ntRj/cVEr70Vp8vrjMkEdUnimCVZ1/3eV96+LbL3Y/t0YRx6DlkrCIMpSwXL5drOt
	 AVSyZEOS897BkJFnxKft1u3aI2vQkVYdBGCdkCkak7VniapB6ZVLevZ7zCyDB+Gbdyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
	b=i3k3V6WJ61OqaQlElH5tKeOr+YY49O48dWYp0Qa10LiOhWfWUYBQkj24UxXW3DOhZTlH
	 1iDIBJetLqslGBt9fitjMi2oIDtaWVKWVyeltGFputzV6kqaKuuEWR6ixvzVBe6H5Hyt0
	 akVx6RqET40t37291BN+sDRq6e6fkp6Des6d8Q4I/FEpb33yJTZy4f2q6Wwj0s6e+Pl7y
	 Ti3pRBGXgsymgU+Yu/bgQatIdgEv6hIG71qENevb10NnmBCs/E1g72AXuRRPHTjbf7985
	 iwAxc0TEW/jvXhZlE+Qhh4DmdVqYPSww4unJEMeD35TfvTzt7PP+EYtl4Bu5eynwjGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnpTLoy4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZCjEJs4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6F606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC6F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnpTLoy4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZCjEJs4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ABBX1207795
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=; b=AnpTLoy4Rf8Kph2/
	VnpjvANelHxxBsn7Potl1+Mix4C5oNNt3kbNPtDHyRGLuQuFC6xunwkPdI/X0sQ5
	AoeUY+/NONARe43Uebg2Q4BTAC4FB1kvHWqZrl9TwNHo3ATpogr8gZWkJ62Qe2FL
	xoNeYVtCu8mzi63tpECYKWxUV9CHmNJI9ArIfVL6VEF7/R8G9XiJcTgkkOs9Z1YL
	JOlVzmcNu6jL7Aq92Y1vcmOAY2+vXF4pfRv3uoYgATApct6+shLsC/Kt0ItGnhZF
	LOIGJMF0DlMDAZqzNhoI+s9DTj6Yc+mI/2BcgO2BvFgd5kHjksrCMWKqgZ6a+5cN
	yA9g1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhfab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so350233885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286572; x=1794891372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=GZCjEJs4wdbfSlo18ot+Y9iSo/FN3cI3jk+Ow+eOtQxor4tmBDfnYt1etW3DwC8q1P
         1QdF3poeP5dJ+AlJJkuW4Cmr9HODji8jMrluqvn/p4ON4NWn7CI3UX8As68m2v43OchW
         b9GaLPK9JyGQAQxuzdL2+cV5QkzUmsKzdKe3KAK90dhaEv7Ze3uTMmFftHA2QfZ9Mabu
         wSvziAfH6ZYmJG0r6BFnAfVIzWRermX+ev1X7f5IJ6Lz6Gs2HxYPEcStTKDm8NFNdasr
         liMmnMHfzAbhq79i0eLLFRf7HK9uGvONjMI59AlZhPyDtXkTKS7Sbw2HYtbwoTkIBbeN
         fBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286572; x=1794891372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=SLCm5e0R71qyj37AyK5G8CBuvGzt1kIJ9m0TxWrsPOZvdLwnKlkrOwTFeRaEF+NuBW
         MrMu3l3/Oh3EKeDsK0rQhpKE2lj9JJL7cXALfzIJZxfzgwWUvyUNOlc7vG8QL1oipiRO
         xWRnYRH0eIIpVy2z989GKyGBAEyU05xCV1PD4S3kQ1n/+Cpgbv8/TTbI2T2oDJE/lFph
         wzyo8XjaUd91Scywwgv52WvrDpKh2meqdtgZHMZjAgRA0qb3Uyc4XESlmQ+AWzbei6M6
         aPovvBHBSIPpWRAD4ZWRMaY2g85odRKE3R6c48LqCHh+oik33iNNOsMn9x6o0lGxnLIC
         l7QA==
X-Forwarded-Encrypted: i=1; AL+hErHscLLe5B/i1Z63qn4qKKVP6PaGKpj0kRKVfOxzBIBddKiCKhNd+Btc2xxl/N2VOZAm0Ht16S3PAfrp5pQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ydgmFNVj3uXb231v8DE3r9zk4UbFT0qRTbhXJ1JXX7C5V847s
	BlGKqZUQQIJFU4X8IGb1MjMzlm240COssksNxn+bJCySBXedQqj06RINbeOQounjqD2usqb8qas
	VaxU60XPL7fX4MAvBCPDvjPjWNTHVADvKuVzHbDO19s4togfmTa05reGUvTGnwbJ767Q=
X-Gm-Gg: AYBFou1U5stzYk7eUSVvn59aeUKnw7HlRI754e+4gEu3sI/cIqjiA4dR4FJGokgDwBJ
	rlna0j/bPAQrR4bKmPaVEXepOspC3X4HlK/o0BtGvXeHWu2oSxoVHq7SGrZsFxj2fJmGE3huui1
	A+ZXgX/2tqKV2XuY33MweZ1iI7T20C/naCLn+fYW6VMba+UsKmU/4C6en0apN91gC5qDlGvjsiC
	SMnMyJI0yBMoRn/0sQtMSlZ1EQKM5T1lBsT5kR6Yc9DAB6Un75HZxazV3hK0wTqHAWW81lE7Nub
	YX8x5M0FWHHmcnnnDyhefkxoMKmeKdjromHp/OsHMtqLyuSubJ0zFNmondu1OdLkDvUW+j7apHv
	M76SnMfFWTgM1RMT7jB+vsJXLNfAJrebNbH7jTnSwiKTybQIQoLeyTIlSVC9U+NtBcBBbj1p6cL
	E8z0l7X6zjZhbig4RJtB+HA0NJaLNfGWSIohhk
X-Received: by 2002:a05:620a:3193:b0:945:d7a2:4b58 with SMTP id af79cd13be357-9479f343931mr274929385a.65.1794286571738;
        Mon, 09 Nov 2026 20:56:11 -0800 (PST)
X-Received: by 2002:a05:620a:3193:b0:945:d7a2:4b58 with SMTP id af79cd13be357-9479f343931mr274927485a.65.1794286571307;
        Mon, 09 Nov 2026 20:56:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:11 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:41 +0800
Subject: [PATCH v8 20/29] drm/bridge_connector: avoid detect-based HPD
 notifications for DisplayPort
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
Message-Id: <20261110-msm-dp-mst-v8-20-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1626;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0BzSJVy5hCHAkX2oiDIpRZW7mGbTKWmnfn6hw/d2uWg=;
 b=ar5hEtLcpwfPsJS8Yu2/xs75nWEgCc2nuCkoqEuJP7Hc/pXZdA5U9VXgPqcrHXwaWSL9ardjj
 9kEnuf+m6TAAAYlUhsTcmA2UpeKQ3GjnMpD6TGfK1pJk1KZu0HEJTeW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: ceu0UAM4lFc0wyIeFz2O_7puzEzanpuM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX5oAnyNfAbMec
 w6JJd7AK3+fC6qo0r3Co9tTeuPnpqk/yWOOG04B8SVCEx2SjZmwilVrNvCjXbKHZLSy3PyIn3AS
 snETVFSfeJrFXzjCtViaApZQKdaSS+U=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a3ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=c5AeteMbgwRpADRefSEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ceu0UAM4lFc0wyIeFz2O_7puzEzanpuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX6vmakjxnB2La
 KRiPh+TTPjuLVe+q3a/G/ARp8rgiodlZTmMKQik66nk0RLXL0uQAMIu6m+fXNirPOM9BUKdXWQ2
 1PhyB4GMNr7ucPUsjrAJd2leVm63SRUpj5mkBmuV+v6qmUk+P6nEBgIfppmBgxJEI54CoXWv7IS
 BDJljUTNOWhCj4Zq54JSR5J5k+X4OTy9dXWDNl2zMBYz2gdSJhZFMK9PmL2bbg7c4CHLo2syiJl
 Ew/pxoqy7bX44rs/60Om9YJbDcIqf3pgDE803sYhe/SH7Hh1LPZXNgKSjABCWVepvxO93iiTLst
 jyUk3NX4rzJuKbkIch2fkNYFP1RbtpPkCkyxY+aJ1xBjXQ/bHhmAHtNqKbYRL5EDC3rsoJqju2G
 qKnW6OFnsU7vGFB4gXHqNU5wGt0V8Fjo6MlYnB0qOPw3OEp4oBg69l4BAxTeKyyS8ZEiX944ovt
 E0qGIAx9RmGEiXVKbgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

When MST is active, the SST connector reports disconnected even though
the physical DP link is still connected. drm_bridge_connector_detect()
forwards this result to the bridge chain as an HPD notification.

On MSM DP, this notification invokes unplug handling and tears down the
active link and MST topology while the cable is still plugged in.

For DisplayPort connectors with an HPD source, stop notifying the bridge
chain from the detect path. Plug, unplug and IRQ_HPD notifications remain
handled through the existing HPD event path.

Preserve detect-based notifications for other connector types and for
DisplayPort connectors without an HPD source.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1d4502126bff..dbe874d26911 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -315,7 +315,10 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+		    !bridge_connector->bridge_hpd)
+			drm_bridge_connector_hpd_notify(connector, status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:

-- 
2.43.0

