Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218C446E000
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925935; cv=none; b=i4VPXTVpRnRZHT9kDqRGJTHwYXjSllYCxKq3nm7PPNU4jdly/njNz4C8JaP8e7Fb/1YkGQctvxAN4gTG5G5Yx+AMKHB47OaVYvYnWHzmusYNAF53qi/3oYgT7C7kK1jG2w5gJBkBKtocbJjdazKGo9kN9oXdZFwQHVXpwJhTKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925935; c=relaxed/simple;
	bh=Xtl694D0DgWPJxP23Arvi4tkW3Ki0aks6uVKllA5u8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSBptxvnKh4ynCMKqG47v+3ZWA775m7T+F4/5cG97yyQpQG5wzeNOz5FKRYjIl7VE2X09PPhNJ21/WmwAozt187HTJU7O2XyYrW9bXz3xQWg8mNdTAGuT9sAP/lNfS0Mwq1uv1mz3wfjeX11IFh3J45Upnwkhy9HtP/fUdy8OpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgfnRBLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZKnCiEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgfnRBLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZKnCiEJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkpNk3545715
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=; b=mgfnRBLO7+xtH49F
	uQrk2QC6D0rt/5dVeKPRy/DmH+pa88OO8C9ikkle5PujDNSOWr+ncp/TaZfxF0MW
	kAILn0v2fT77VqEkeNlxTQKzOnQ1Er+3tbblX3dh294Vlas3HUGqCiXxRpjuz83y
	jGnebV9LW5jQyJngOtI+sFo47kJpO6RowGCs6nXQxTR1MaFj8yve8B9hmyq9XJt1
	mKdBVDtYW8fIJXh7N9PsDyBrXuxgOHhADfrpJakoDHy2qbY5MHooOPaYPhHTzMPY
	z0dsFrGbRlh+UrF9jXSjbydb8O+nC8aYNTOjOc13JmCPDwVMCJUInYG5leUmSTaB
	pl11FQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1xmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so9638361cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925932; x=1788530732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=;
        b=PZKnCiEJleuSkWqne9aHa7BrKmzcJjtRd3HNin5DImnC+k85Fu8xZdDDaZkIvcZZnS
         R2XhXYOn4mFzyJ4Q7R/0XoKTi/fs8gOf3q3odqZ6aVTMRuemuEnbbOXxo8RqQtvFEaRL
         w6NXTMF6jIhE1SrpN7tNdjiL8kFprs/1n0sKKwkxgDGUe9QPmu2oR30JS9YFMNuquWGP
         zTWy7KEQvhvY7KRwf62Y1WmXsb+kqvQfzoHENO6wvJCc3jV1Ra40RgysbjbiAqhVMOCa
         lEMcZChEOHtZ6xVh5kSOB+sacMwY4SfgH0zEestY0U03wqoMYlD6SEkH4RdIjqvcAle/
         5NQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925932; x=1788530732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SijLPEyLEnAofFIXZf7zUa2hkI9h99tMoUcsgWGJx4U=;
        b=gUfA/gwdCK4I/SNuoEmMstFwFZfyoaw8zPif+4x6saMTw5TSPZkPIa0jFr+vofP2rB
         OlfEO9K9uP+eC219LSqMeu2+n9NAtYEeKLV6qdslnEI3/lu8bV2uv5Wa7LrYAC8RbGl9
         HjEBxVvwi66ihyNLI7wNXE0kWwGWFk0GwoFGtm0AcXZmQLhbqSIFm2gcpzNTEuXU754F
         W9fIIPHXHDPXhzcndofeqxJLqET8usDgr+N1L4hpdHra6PlYcS2BoSAM4N8p+HURdJhc
         0qt06qEDsoGaYovRtWZmaqhz8AQs09NHxT63ETXXJvtbbP3AH0CLTkD2/g+1rT7tAH9A
         lwFw==
X-Forwarded-Encrypted: i=1; AHgh+RqqC/+IOMXMJyo603BEcV9ZqDocRV8HfHTk/0fyCstdjTZoGHKXoFoUT06ViaCShCOwlSkY50rwQxGLl/8=@vger.kernel.org
X-Gm-Message-State: AFuF++l8BoNdsUo5j9XpHxVTwEqQ1G4qeP2jVBvng18+/qRO6Q7AUyq1
	RJud3pV7O67Y6B/bP5Hc0+rkhqTgI7YYcoHqgKZPK6FhV79dpvtGUyeLHWo724X6tCwkcYbG5Jf
	FpD1+nQ+L7BMBbFSGcssxNvkWV1VoKk9HT8mqX+mFMh/RiyT2BvyA+7LpsV+N9mlpYJ4=
X-Gm-Gg: AR+sD11tY3RoNontWQTJEhsX5/ubmR4+kQ8fQEBMV+lpZMD80+6sqIRzzJt2jhmfHao
	5RNyo+EUPbWlOp7QxpuTj/jP05ZJXQbRF5lLu/k9J4WsHSDJlc2UA8Xr7H3o78Ow1exxBToU83A
	6R3hXcDZulg0JK0U4227NvtPYnzNMbu+kr51Nv57aNLH5aiFgLHJKZhjtnJhw9/x3jPj6FRdn+T
	tyq747iHOFlcCmTZzc+w55eSv+KjOZMiU4mYvHJ73oJoPT4B6UQoUlIYN2g+cMkNPfwPJmVEfPa
	n8zOQiKHJ4absKKGjFwjQss7e7fEPqJKRIfufTtygy1zDgMsMmDUwxezqDPGFfVj7CpKwMlxTlq
	C9w4jZes6f556VZt3SrG9y48=
X-Received: by 2002:ac8:7f11:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52fb94aef37mr78759541cf.9.1787925932322;
        Fri, 28 Aug 2026 07:05:32 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:52d:3ccc:968b with SMTP id d75a77b69052e-52fb94aef37mr78758401cf.9.1787925931811;
        Fri, 28 Aug 2026 07:05:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:00 +0200
Subject: [PATCH RFC/DO NOT MERGE 02/12] drm/msm: Properly handle
 msm_ioremap() without name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-2-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xtl694D0DgWPJxP23Arvi4tkW3Ki0aks6uVKllA5u8c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWZqLsb4jv2eWG6WOsapWn81xKcReH32cGg8
 b8f2ZeSuxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmQAKCRDBN2bmhouD
 1y+CD/9MFWW20kWIW0usKkurL+trqzNP9TIAiBL1sxgQCfzfMzVh6USS1UWvFJjQD2Lpb2cRPUY
 zueE7v2zYP9txYiJg6btT/ijXKexAVRb0dCTAkaBwQmnXACWpieJurgtwp9Os5drwTu0LE21x/Q
 jSMaIZmvxzwL0m1YI/bAP0yj5CzRps2vOR8q2lQ7Nhx82fEKoaGcpVyXejgpg6oV1ZERZmEOQ/8
 /yo8+D2RfcgytxDu3qYnVmhvrb+n0YFMWbqpC0QEsjdT4zeu57rEs9NOLaaKvdO3S/VMbx8nMfK
 AmezuU6D8jMVsXDtfQGmSLvnj3b4Dwn/NQcmYoZl01swFhxSW3vXlA//RanOjXhSRJLvfajPkTd
 COeNEq3ncHYWh1z2iJrhl+5sZupEuVllbtl71ZUDS/gkrwAgVeV9kvSNsO0CcKYs536hEf1i3GV
 S9rAxzF0bBxTPg9TBEMHA6tz9ydenWhocPGKJLbEU8lPrsWmJZuymriUSHLRlfEK6g6hgqCCXCn
 M+Qs90q6T+9NnNhwnmPBDuNxtijSfOHwwgARf2IAjw2VhDgs1gqKejOqzzpkGq28CEmk6w3o6VG
 1EWfI3eQStM5WvJCcRbQCZudG83EAADcQkruZ1PcZM4CdJ28ANeG8o3/S8rzUiS8/+2ERJgd+aE
 ZSEHRDQ786rt4vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a9195ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yH_xqCIoLriC5q19XfxQ0trGgmu0fgto
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX67UZe69Wg/oF
 BSQeezIJNq2Seju2nU2VTF4/6sRKox9rpphD7LaYD9SVHL+KEQfhvmKVaF6CmxN9Y4Ll9k2iX8g
 qmDK+O7NS0EfJNyp+u3GjiUl5NN3y7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXz7TLh08AhRUv
 a8goSpCn/K17ycH6gsVWf9TwaBS7hMaurM9mMUyErgH8viwJFwma+f9f7P2ZpzbhWQvw18VOPqD
 YBxDdx9+Lq6lPRGnk2gzOq3h0xHpZib+C7UCDED+b8IFRp4XimaxeQVWLCvYswJNoDgnCBwFSrF
 Genl4AtnweXaaaRmkMipv4or2XTThozLObFsTibxFEQGMzHHTZ0jVYiCHZxgIRkdJqZakk5UkzF
 kuLxcG1budXoNhkn/63ZsESzVM+SStnIlY/2Nu++ATjijZFvSGgdc7ivz2VKMrNla0TstajoBbS
 5pVCReaxhqkewgk12NQj4A9vA0GPTwVKldfxvPh0DAnckuZIv1tykNIiyQVu8487YRteQBezYla
 7ZldgRZMl1XgNOYRVcYRARd540rsfx+/pWDGqMXgxJUhywfbGrGDYvVfuRZOZeSYCkb5N/NNeEC
 BjoTlahttkiFCZR4CzQ==
X-Proofpoint-GUID: yH_xqCIoLriC5q19XfxQ0trGgmu0fgto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..93b94e330cb8 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

