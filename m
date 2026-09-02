Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388F44C65F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379686; cv=none; b=tasO8dn2kBgVnErx/phUxqy3U6r9U0Cv/OyfDQ+EXTyvxojFKansWVGdJXczHdKb3Wt/YxIGptQuR9MawXUOhD1c2Qs4HhIOQCPkSd8yfHrG0PHIyFooif2MfbY3G9EBUFkM9OGxnjY/lbeRY+L0CowBvJNWCpgJfNt1ypgp5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379686; c=relaxed/simple;
	bh=7irciqc861lyg2o5ao1Cr0/B5JpGbM206OChW/MMQ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzR7jRubVY3mxM6fAnabODgjRr6TG6o9Qq9Z4HvHDpCPdWxlBPso8T/9u9QRrVMukZgfuapATesrMtZ15bnLFSnwtDdUse1dTZvcWckR7WPKsOvScL2ZIyTQQTwd/yy6Q5cOs2b495baJxZoJikdWy3uEbVp2Du+MwDsYGXq/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz3iT1Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBOSCTSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tz3iT1Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBOSCTSo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtMo1071900
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1s1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:08:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfe48ca1efso18808395ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=DBOSCTSoea3Ggs+veG8eCCZ/dmvO9y6/nO+KBgiY9uaKItg22rjh8jkeG55BSRl4yx
         XZ3Iv1AfyLZtwYtNd6dCPtWayOHi5mp/WW/P+xd/T5TrLl+o/jP1egPa+rml7LySNzww
         y7szL0cjP7ZmbrjAUm7GiUP+iaBMGphpJ9w4CGg9f3w76PN0Q7DMGpE8GH18RHFR0GP+
         4O7RoQFhYplpRTF7NED2WP22Q2VghF4T5P8m0Zhg6EnTPYMY5R4UBf01jHLAFptVwz//
         roJf3OKq4C+/m2TTC1CZCvk2bA4YvPossUc488RM++zHnQhmqWMGveurCB+LFVDm80AW
         6Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=tL5sbNzT1dqwAaRNEUFP3HB9ZVBnpIWEMSZOSWul0j1+JA6VzUPRqOsoliZ/54eBYH
         1INFOYaUF+wZphPlMxD3aVg2YTfKDOL9Du1qLodrRcc+79AuI9I+jlpBVzXOSQ3+bl5U
         Q/qSeOdxx0eoPhFUNVMzZWyl2YLy+Wercp9nBYk90f6JqsD1j6ye/T06+w3ltJSHyfok
         TwZcGWYDIMrFheVPrYkK0HKMyEl6Jciz51u1npoxuiWtNJ85KzoNtcR8aIt3ELftqIbI
         bUou69FgvKyckgrd1AZLHrQbzmUeG4YOd06KrNBFsFk+brOQcMp3FmUeFcHKXq+jcL2d
         GZjw==
X-Forwarded-Encrypted: i=1; AKwUvByCL/9PG32NUGyNcYJqsdHsovxOFQNR9f5WE2iB9pA5qGRVRudeC/ywNSappFUMRyfxwdFTG/NtDf1JU8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n0NYS2YNu2Mbppg0LHjpcnJJ1ESF+Hyg9/0Vx4GEgA1ZG0T8p2
	B5PfCyJvsmdAq8DaTMudJsxjF1LxwpP/pM7kXAt+tIaVthxw58u2NtCDViq1Q8C37RdgZb+TOyY
	ASvXplXNMFQkGUA5TRAMCnLDGDZ0Jo1kaoM0KsBkCS3cNaQ/DmlMEVwboSnWorBeyzJg=
X-Gm-Gg: AYBFou2/rxk5lorHUaVFlZN+32C/7VSbEIzwuq7moM7YPe0FEpP+d6UfMdo5fwbijxD
	jsn6UbJEBmsbwZxKLj+Q3tONoXb17aGGC6IurkXM5A7xfKe+T8RCVSzbCcuI2EyDer8Xi/LhpwM
	B5NCkk6ZKxiJETLLAqWsJQ7uHaXcSMCY/NUI+37QmS6+hf5qJgJg1VV6UrfParEogz7kNCHk5vj
	pW7Y66k1NdZtO9fO20/7evpuNjGTHYC0mMAAK0TU9mFbln67j/zAcgh6SIhTmk8zv6p8vYccEeb
	0INcl1UP0GaNlwMwv96v9Dnf1bgkcVf2Q0j6FMoNqEoVKWbhjIHtD0l+l9FUsPAtNk0xnisPu2E
	ppTcd0sRdpa30AoXK+xeHNwbA6ZE=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445915ad.4.1788379683914;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c7o2W2OVV3YKDZN1x1kODOY3VYERPeyR
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a988224 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8yDb9BNchgDY
 dnoqXk5KVezuJd8Dqcf9orXc573Vxgyoboj0o9Y8In6jHDK/T2NnhkCVKL06K1j5cJX2FepdhVO
 1eOPYC+CZHFFwvMiy4GLvs1QidnH8Ew=
X-Proofpoint-ORIG-GUID: c7o2W2OVV3YKDZN1x1kODOY3VYERPeyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5nX+kELg1+kY
 Y6ysqhok8Hv+U1RKZg/7JHiBdKmOmKCFGlKwOdZcx+aHKhhwHQNL+EwG9j+VCrKIyjsiz4+Ig9X
 s/Zone8E4Jsp7BwK2lRpG+rkgG4reqi8JR1+Uuv3Kr58WzOGBn4c2/4W+8LYFGTLRzuuMY4+eiQ
 3cWM6qe5NIEkko5VlEyoH0lCAwxnUhOTLdNSE7eXAXX/+vCm3QiH/kJcFeklg7eGEZZRYo7kUUk
 eY/tizTie5BiM3A7HGEd6ghYbzTOUOB2moAV6SPIPk8kKu6eTmSOdn8Qd63YhLa/oLxzEkewpKu
 aWrFu8UeaCdjuuMURdm+ketnVLjIL4pKg+ERIX8gq5lqVlViT+TgujZ8tkozJOThPRXHrQlYWT5
 m96QvAbsusgvqdlBX4gapJRPSOA+aZI79OfUsi8BPAU6bEhM1K4YIoPP7KkV2CKKRWTlT7gqtVl
 NZ9RffxuDoKLb8xAeSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0

