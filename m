Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3EA3955F1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380258; cv=none; b=UdprVQxFsHuljExxUliQ1ep/iZp6BugcqImTOJKHXeoxyQzGaHmCMHsSBkkFTlXQjYh61L+KT33RC3p/+DCNP9DHIKtJVQIuobGQSvc4yro/rtlpZOXtVV/Tl5ufiE/25WxqvFhPR4n/uMART2gLeRN34qwlOGB8+0bkgkWtkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380258; c=relaxed/simple;
	bh=5yT5XBjqsEv3D8HNbTipP9IFk8BDzIAWoxf+M9L+UbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXMaxUEc0nsk648hlloYtM322VYiFl4QHoN7D3SvW0zE5vVzTAYAzapZwst8lpSY5+T8+YxwDYK50AkZzPt2DW+eXlDTOE4Yd5rNJlDquD1SK5LuL4NXZKqjNPZPqxWEkZvTY5sHvZXx5gfyu+7oftpidYMktaQRCC7ul2Z6Hw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKzTE0q9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDfgYdES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKzTE0q9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDfgYdES"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHBLf2796893
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fJookc6jcAF
	EyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=; b=cKzTE0q9kggbsu9YuOq1kAkuDdR
	YJhvVN+czMppY1U0nol/0Nu9eJg+w/VFZzYpLp6tDgr08w/mOjZzQMor1M5ZJ43s
	aqFqFF8zPGXQ974shwBrtJIoDDhkVNz9CXms9H9Ur4Nh5EJh3egmeDqIa8aVm3HB
	f7W+dmLT4Bpgj5WrbBijZpdzHBScjhtTOCpC5WtmF8n6Kg8j3e12752VkYVhsUAV
	euJrXiqfaKFvPGVbkivLLcukuLJ4/t0MfC0ImtQmBOwomB4h1Tyd5aDhFDADBn7C
	wt5VIxwjnf6q4IbxY62WHm94TJBj9F6OQtfzZFVnS5QgaNIjYXnDEWEc8lA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9qam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so3046855a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380255; x=1788985055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=;
        b=cDfgYdESidR6dMokROHzPdPS8e9tdav7tIvsF4OL3ZQ+j3LxsZan36mh8Sa/25WZym
         CIhHiC92vbEE4ey95nXm2ceSD8qj90nfr7YjJFoRj4dL1eBFmIinNmt+wD0njslciXa9
         ZV6N24pS6BAe89ToZ9cl+2LhWic0Boa3GZ5kYpJ70w8EwKQ8LCshF/XyagFwEKsei6L1
         JQI4N7vytjOicx8c0elZfXaOYI5XobnfiRcxO6E8pZXuO6DM6X3vShocP7NU8P/FAQSo
         O2ekWAE4zANb1gyxw3h33Tb8aaaXnMLbkRJ0Lwg8HJGa0SsZrwZrMcuGpHff8c5+lWdk
         iQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380255; x=1788985055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=;
        b=OxESsuaIrmsVeX8zsw/w/UECoJS3AillnBR0yB0ot0J1EcumDl5pGMwarBFLzLNk0t
         drjSSwK1d4eP4FT8O3AtxdJ/xMb1hfJPMnHkJcb4WIHwzDtMWW+pcobzNtSNF53+Ojpo
         ARc67OwgpNgUbBd7yY1h9/iuTokFnR9LEVC/m/CHnQlHuG/rwqadI5JANI55fPHpTtI4
         bipIl50RWqUL/NuDVSAYgrJ/dhlOAQ4w78+xQtZHV0TXHa1JJwiGqzbdTfypwC7KJqfc
         hJGlLVflACV6bg4cK8+5gzypoIdhsqVPXuH/nXodRsNpCbEQeAGZhc3/Lul/sBkEvwa9
         pYWA==
X-Forwarded-Encrypted: i=1; AKwUvBxt0U8aOT86EmZYnX26iuNEyH2vwBHCZGSgSe3vcRgFsJmfaKy+wnqxZyZBCDiQZXDO+lrKM7xZgfULOMo=@vger.kernel.org
X-Gm-Message-State: AFuF++mOi63pyqK+mKBQxhYwmLvZDfFeAhdL3nU5eW32lXI5EMqHxdcz
	okpoB4gEjYz45NXtb3v2vuEkVwTNKymdgQ96mTEPhezykLq/Waf023c9JZHA+gw7YJTButt+OjG
	zfbeG46IPpSSChZX51HIF8u9GN0wDf7Nu39hJFHtsFzmGitUhY8J5sJbqfw0Kk+jXEVM=
X-Gm-Gg: AYBFou0tCQl8pH0rEmbyYirqpMvZ6+7mkRMqk7mcd2BAZ0ikkB2vrpjUwpI7PXVPFJQ
	sMIdjU4uGReIhXbG9TM7AGrNsAPvhg7cJJx/fXi0etfD67jptXFJbgEyh7RTSm1mIvhK3B0j8wl
	EMYVj1ZtiyKMzCboVVzvAW349IhL2E/gc2V20S+TA7fGOD3eiDhLpnhO3QJwbPxZzrPCu5HwB2P
	2Vra8+pkOMBoVaLAVnGt2Lz0MJeFKZujInaC7tILhXZ6cyhVjHtn99evyisTRSJTNbUO3+0DkcH
	g+I5s+abAS9scEq5GeLagf4EkYotY2GMMLa0E1IglRzYJL3UwjOV6zGmx0hZIt4fTDSvcf+yAxp
	LUtnK0fQfRaR+7soR5Qcw3KVkmWE=
X-Received: by 2002:a17:90b:4b0f:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39aee238df1mr8817743a91.21.1788380254736;
        Wed, 02 Sep 2026 13:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39aee238df1mr8817663a91.21.1788380254041;
        Wed, 02 Sep 2026 13:17:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 5/11] drm: malidp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:34 +0530
Message-ID: <20260902201640.2024648-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IXkmxVhQGbmJONbgwgeKwflSy7eH9lbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX3b7mFki9Omhv
 oEyeJFo/uVwmc7HzVBmPj22BdSZcbbd17j6n9dA7Hy+e6wjP+eoemJQZvID4oDMW0eXwDz475FC
 FxcJNAJI1uDhu2+rIsTrOwMiJBgzp9R4ZY0wL54cfpslFcCQKk12SJkVNkBp1jloxGttj3XOc4y
 Pg3LYrb+DvLlUfWb3cOMyzsmkVU4QWk0s7Iv+0JVBhXbE+AVCLyJcf86sXntMbOmk59+U7ezZl3
 OukzaBUXgk/DLSYJST2ozlWK4SDq92Ud+5D6f5WcTSwr6j7/v4ogKTxYbzls1TZXFUnsmOR5CV7
 PCsf4g8PUrI9I7xaiuKEYj2KTnRy+a6wZwmurxlih4DlscIYy1HpXSfgBPOdhgqrb6fqo2gwKpb
 qWzyCQRZJo9+RdteLVPWVg1vtl48TIarbJN8XN22zucSspOtZRixWKCvfIALU9iIe2ZY0bnXyET
 GmunFa5RCMBEYTeMgLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX7H0KvaxG7Taf
 kAo3nxzkVvjzIByti/eLJpy59y08iVmbo+ZVJ3kzXMaB9NF/+Rh9xG1E2FZo0IDhWdtxsfHM/gB
 ATzQzFaFyaBysmth5deQsqgSFyCrj7s=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98845f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=JOjAg5lxkONN77W759IA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: IXkmxVhQGbmJONbgwgeKwflSy7eH9lbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 23fa942ae4bb..3e17513c3114 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -758,7 +758,7 @@ static int malidp_bind(struct device *dev)
 		return PTR_ERR(hwdev->pxlclk);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -887,7 +887,6 @@ static int malidp_bind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -913,7 +912,6 @@ static void malidp_unbind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct component_master_ops malidp_master_ops = {
-- 
2.55.0

