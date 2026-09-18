Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215C94DEC24
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726932; cv=none; b=gwyu/6uanJhhFGrXvDC2qhJV0Cxw/Gzh97zB/hxyAgVRuDIuYVr0lo3HJuMl7Y0p5bmJy2+LQqAV2yFz0dRu+TYbpXmw8t4yfMO9nOHNg6vXexcAQQyyZ8miAxyWQlS+K5tCyGecEO0F712MJxPL75+Vk5pIU/3o59GNqfSfSsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726932; c=relaxed/simple;
	bh=5wK9/6OJBIorpDnueUEKkoBn8G72ZnSkm2xTJcs0Wqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ze4OlpY5CNk9LSmQtx5CCqiPKB+gztmGQMwlf09NeqgwSJsgp0wwT026lHOJaKlU/sKx+KP+EM5rtEHajSN4k+QlCT6nSn1SdkX7MS1Bd73ctP2k8swRWpue7YoWGdnmwYjV/lXS6YYhtle+JMZz8ZotqxLXRKD6903W9b2pRSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVtQf1BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUWfUDrc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVtQf1BY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUWfUDrc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ddxD3801914
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+Cj2ynXc5ThSbdNKXTGycnEgAYTIBHDEBAw
	0L79FsWM=; b=LVtQf1BY1sML0ruTZ1cs+zjOZRkvNdtFNHgqbg7n3JbZB7B8242
	NSBefiFVPjYXEjhkcq6UXa2emm0q7IYsq2vvafzp61AH7Yxsf/7bfRxYfkIe+jhM
	LXLGELTSz+JZ8J+LeEVNASgC9+3DdnsK0x6zd6WXr0ElVAyFtH+p5Fy4BWnxUK2e
	+4K3TzoD17xGcCKlTubabRejH9e8RqAIAuNw4cSTKX+erz/F+s/qzMKqCuYgJm/6
	c3HSScTbWci/RGGfzTUEt580584nfDF56n4D1hgrGC/srHzPJqJXfFLn6j9FCA3J
	vDsaWoMbmN61KgcYPhqo20QFjP1YyQdIANA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku2qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:22:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so109552885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726926; x=1790331726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Cj2ynXc5ThSbdNKXTGycnEgAYTIBHDEBAw0L79FsWM=;
        b=CUWfUDrck30EKsvtC+irYIdOBIrmr9Sb2q8ATqlv3JUx+d/vYxnQZBDb2L7GSeA0I7
         p2ULSnPxQ2aKvikLK5NAeEAUMPk4CXe3MU9KZBM7JhPP5VWWJB5Et7YIbH1qLpDhj2gH
         BqQGP5kJ16KnXARYWyvscbBaLShGuUZmbe1q9DYYyWKETZid3JHyL/W8h8SRnb7eBAoJ
         Lxwq3sDKMsalLqipOXr0ROfGT3aVUhFJLszj3NkOn6IQgC2ag1y38Ea4bfSoHdkn40yC
         TioD+V4vFLU/SEIPVF9HB//asBP/UGwLK9R8UP0kwuiCqmoQG7jmb9ltYW8NP78ukCU6
         XHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726926; x=1790331726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Cj2ynXc5ThSbdNKXTGycnEgAYTIBHDEBAw0L79FsWM=;
        b=VqiHlhsoFKAslaLZ9kduMl1V99Jroqmj8n9Sx7pLfoVmCMIUmi9t945/gCExZPLNgV
         zthMVKrU8w8mtM3VWNxFMPRzrH3FsASAHLYjp8ZRHhE7qS8PZHwO8s2HdGx0MTQdXGsT
         o4ZR/QzAMH2gB7XJHsf/r7T1oPBu5tc6HC+umfE3lTpHBhu7t2ma0X6O8adrUqRJ98Ih
         bRHL/E1oHRC20TRnrvtMNg72IUkTlBVQvloyEPB9ViqXX3Zzc66kkyZHMq4QfV6UeD7X
         fcslky8HkIt07lcrE5AmaS9ksz5nYpVQ44qqM3R5vIpEZ2M/z98YdSQdGrRh4RUkU9V2
         MVnQ==
X-Forwarded-Encrypted: i=1; AKwUvBybGBJgunWSr3kbqQropPsLwmRZK2JQBNPaFMFh59ukdLJp+z60cQjOXoHVE+P27waHtbsl+uhFlnbUUBs=@vger.kernel.org
X-Gm-Message-State: AFuF++k+kZL/RQKr50TfVFbyAww3WA4MHpIDRG+kxBom2sx96P535cNa
	omLddruhPGwpCj7gzC3bdjTuumKZ/wqn7RadF8QG+vCmJBwxk7y0x70FnoYqqmsXLBFi4wPUTI/
	xFGo/+xCGRo/lXPW4NI0scMFy/yYi29blPYzlNiL/r7pR3DRz0zFkiYhEOTMfxCsmM+Q=
X-Gm-Gg: AYBFou00CsbKu3+ehCjLlZDx3HEp4kwSxecgCN6eVDPW1QQuPqgwG8wdTHlCIMrh0lu
	d7Y0QGhzQsr3bOFXhoAXpni8zk5oTvxIqj0fvFzNFx4F2FFry3Ira3s9xtH1p3ZydZyE4ISEzXk
	wwecOHAmoov7WkAm7Gio42YlWnWAUS3VV4yE/NyV00bQdxohmK5l0crMPf3onJgYzFRg6eQoUmr
	MN+B6yQUa81hGvfzGPNCHKSRSLs0oF/ptrrdahEw/tEOIVFB/uMaV/qpWxfMK1/6badsO4uHcDO
	b7dBAU81bCcuNkwDwPogTLSAHMTAKnNpeRFuwh+NacefRLT/GwA5HMgAiULs12gUKxvKFM+lGmv
	+DOOxONZu/YFC5Tw=
X-Received: by 2002:a05:620a:288e:b0:93b:d7b5:8a30 with SMTP id af79cd13be357-93bdca7aa0cmr263498985a.86.1789726926164;
        Fri, 18 Sep 2026 03:22:06 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93b:d7b5:8a30 with SMTP id af79cd13be357-93bdca7aa0cmr263495585a.86.1789726925737;
        Fri, 18 Sep 2026 03:22:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008fe3csm2984300f8f.37.2026.09.18.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:22:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: LiangCheng Wang <zaq14760@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] drm/tiny: pixpaper: Unify spi_device_id table style
Date: Fri, 18 Sep 2026 12:21:58 +0200
Message-ID: <20260918102157.78605-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5wK9/6OJBIorpDnueUEKkoBn8G72ZnSkm2xTJcs0Wqo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqrRDFroFllx9nUyQxX3qbYXLD1BsyXrAOQ5E4V
 WK1jlGaEkGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaq0QxQAKCRDBN2bmhouD
 1x5GD/0ZU+BiUSbL0EhDGqJ8k69/D+Ju7GVNEnl5IUCXFqBB51Gr4ZiQLvQdKVIKhpmLO+IG9c/
 q/1XOtQde8duCNISvMPjUVNLHLXh/SJnDsNUIaI0BivK1H6lN4cvzHmrB5l9mwXFqb04n7mztfB
 DTN8P9NJ0koYKNjAG8lqpwQELzu7xTjfb+Rpiw4kOtSbaoPTn8uV0UrIssMBZHMvVUBYa/IcsPk
 bIGkntJ66EFych7kWP4Q0i3XyZNjl6mJDCRtjt/qv6YVKFE1rO0y6lZifV4fx8Qv68GZ/in6aNp
 EKYLvDf6wxyaav7GUugZKuz0EKcnn9zr0qsncNCA75jCBc+k5RRnHR3arnnnt6qed2Nd8poImus
 j5gh0dIDP3L1QBhuprHTnZdfKAEkfvF2f2QW8CLWHxI98V3GuxaedLTiRyRx8qKq3btuuuHCnrs
 3LKk8uguhtaQN4B4NcqaI9YWYo659FSUZb//9lfI7Wf2bXTNg329tor4wzYuUOrR1QzdOSS1NKd
 pf2WCqgU1XWqgmyvcnGdDq4+z5x4WeLyf+iSPf96gBZQmMQV5kGtP2+5EBZoIkjs0WUvsRNYeD/
 hkj/dYBbERArkQSYLnrHQiWGxQ0NpHa+LAZsVaR+kKnQ4X+NQS2MS7hhJh1U82YIvCAtWt7yTOb gzU6ZDEYxH6o/qQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX/SVuPZCkWYQg
 OGi0a6pkgELhCDz02khg1wNGs0B9blT65azhbj51ckw9li9AdGdH5yNm1c1tYSxY3tliWxTBetv
 3yBs6fY5/6ar5gOwHYtVsijiXkwWdwjrD5/K4XVOCn96O3+qJMqEBwLNqnEMESdqzMKkJ23+X24
 +KS3xSgXdsuK8G7ioeRXYihQWOvcjfmDREmgCv/TxFrRQF0+2hzedgi02rYiwmhsORTzoKsuDGw
 udSv+moye1cuaLYAHZ1wBdjMt0GAuCpvjVaJbqqjnnU70KgW0JucjuI2o934oNRRQGUxjMmiVS9
 uuQe5OHYsxMyYb6GoGqJ6f8K8mtnEM9J8ziiANNULlt9jV0iltQDAxTz7XjRdH9lmuWxS7jxIoS
 xXEZFu3ud2yEeMDU+QI1lxLSUFB7nav5fNrBli7NTbiSwd4LMvR49cnPkK8lQ4LFzs3mRbiVnu4
 qo55ulJtoyBWcUZaAdg==
X-Proofpoint-GUID: gYcl7LTBPDVLDTAiBWdY8FJ1wPUkAJAw
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad10d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vWZT_hTR9kbyvn0ntK4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX07jgfP586uux
 n+TgRz92UEk+BLNGs2eO/5oWKTaKneZrtpuL8IqKgufvsI3JcJ5QmldeuUjDloKB2MEsXSNsrXw
 kTCXScD5VA1/XdxOjBHFIr2JAjRK2hI=
X-Proofpoint-ORIG-GUID: gYcl7LTBPDVLDTAiBWdY8FJ1wPUkAJAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142

Common style of all xxx_device_id tables is one device entry per line,
to make reading and grepping easier.  Unify the style with the rest of
the Linux kernel, while also adding recently encouraged named
initializer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/pixpaper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index b69e7c30607e..ce77c92c8524 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -1140,7 +1140,10 @@ static void pixpaper_remove(struct spi_device *spi)
 	drm_atomic_helper_shutdown(&panel->drm);
 }
 
-static const struct spi_device_id pixpaper_ids[] = { { "pixpaper", 0 }, {} };
+static const struct spi_device_id pixpaper_ids[] = {
+	{ .name = "pixpaper" },
+	{ }
+};
 MODULE_DEVICE_TABLE(spi, pixpaper_ids);
 
 static const struct of_device_id pixpaper_dt_ids[] = {
-- 
2.53.0

