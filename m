Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC5525A67
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685143; cv=none; b=UFfAXDGj8TcBMtzdjwNi2OOWsuxGvvq5xDZ1x4pre8fzfkJ1TbswmTJKq1ZTx8Ejwn2uR48s8kVXm4CB7qg615IZcPqUCtpOotA2cgYTIs9VX2ZvvUXircZ9/S/Vf8KJceKevq7Yf5irWKeaEo4SZEhNFR2Xr7DJg8zR1RkbeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685143; c=relaxed/simple;
	bh=ToYpGBC12hzJhRDzJNwcgUv7r5Jiuiuajg4VXkHeTd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6gYftxKN8tZEaLrTYgX/wIy2M6hFbCa2FL21mqbBE+bqcZryLfA9Cr10ruVAPQXw/u62ETZ1hYFiyVR2PL+D5d2HYSCSen4BGQXIZDYANW1LWRopZU15s0l/ynyyG6+kA18Qt1pu05uUhysZQc3Z0cmB8XL5eK/cPM9zP3ipEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQG2xYl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMYP6guv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQG2xYl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMYP6guv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCDtbB3850839
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=; b=fQG2xYl727KoyxLp
	EOeFYRBJvqGpI9jpk7uSIpK7yNT9gQi0/G+CaRI9kVksPo6t0S3Q3fuPXA9whmmT
	Xr0dHocg2JvbNcypT00c/gG6shf2DbKvLOPxME4rCFCUI2XyOK56Dp1GrPipuO30
	QVhsctco4q1wLTM4ez340OiQJkWrg0G6Hoa+AjuDRv946mYwjW/nwRTQVCNoxudb
	zT3KOLaUOTPf0XPhDZ6V9omoRg25Xlyx8LHqG1xhCKWgEivjspcimuPMpC9rI3sL
	n5SbgvqKWJfJH7bExbYKAYG3o2L6UQmZybXhT33VK0mVlhmTKwiBBO3tj7htRNYW
	OhJhTA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gf1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:32:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso1410385e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685140; x=1791289940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=;
        b=GMYP6guvnSqXDmLU5NKRDgDhDbitO8Oh1z7t0i79yY+gQnqnml0/c5NcjPoOCpfYmh
         94gWbI6KfSPVW2bYMs+B1rzOpM42XNTcqMgUvgZNwMq/GCJZumFms5hx0LXM5xh4oJMI
         Ay+TX9SA6sxK7J+K7dyB3ZeL0I3/v8rHPCy3LG/z8JrC1/wTLVX5t1xYnLXVHQU93uQL
         gYPeXaolPD2UFmpGcH1gQ5uU6TXLpn08ghtTBzbAjMtjWNq+n2hgg+Lqs5Gw5ZGKBczU
         ncggGI/GSgAPiCXTSK8igzRg8yjYIiEP/BOHBJ1TZG+9IuB/oIWjtEhwVReOIQS2478t
         PtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685140; x=1791289940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=;
        b=Jzfil/6ICtGrP0cHGOsiSJ/iAV7EG8qBq1WdYGc9vfHCFcfGrf8ctQHZYkUA1nDnpN
         vgghuqf3sF3MxX0RxHGRgG2x9E/+NYqFbg88fp4ykG2FoP7LFfqjGRFkmGvewVz2b/8/
         demv1zZrfY2ltI7NyeCyTjd6Y4fD/yOxGbzIhiNuB7yWvNGMkQrQFT8oYNNS7A80o5Ll
         tm/RmSFOnxdIZAwwb0PUEumbhXgyd/Kf/694CgNmGft4FiaEA766oOTDVATnSYFz5oo6
         rTmCcjoULMrTxTMMY0SvVWpGJMvsgSVlqOTSj5ZYrambc4nnllQJrtmbeYsiMW+EpBIf
         jFjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMeYvDplR3YMSbtAY8eLb/GxbYRoS07qGJRpw4Cud5XMO9pTwKk3nSaygeXXGV+wwE/0PI40rMDcB7+BE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgqJuF4jrwqTVeHJOoPUaIpl97xA75xlAvGwvtDBRAjcO55s5d
	g/ApwlEkFL8XTM4GiJsh2PRitf/IgATYN2U0B5G9fkkWPBzcLQPfpsSVF+8+iz2ZHJaM9Xc7o1H
	PSMQl6GSX7ZYWgFZ7qpoOzqBSe+ST/3aTdrySJh7kn6eyDzP05Td0NGIvWL14pAA1IXU=
X-Gm-Gg: AYBFou1oFsoC8Rl0xVpYHurCEVpiQnCqIgpac2+NWQAvKvirb7gqDUOJoRYUoxXafwr
	IUojW2uLcISZ49q36Jk1E2t8idq1cDbrQQGCP0J/hLBocZlvD9Xz3JIauqWH+R4Bvm2Uz59CSaN
	Qv/aRJkGIRkkm+9xhNDNfTISnyQvlf1Ji219RZYji2hUoMMNOyvcjMCZ6j+3pc75aJiElItHilF
	mcE0uY6rp9LUnJPl73O7t3+R0MyP/+29i66VDgueyflpbODLT1+rd9mvmfvdz/Ej/65Nn8pg9on
	6jt9FiL77IOH3FwJVzPWyhiXNoNCkcc2gF66mL8LmGnD9O4G9aHXeKs+pnVVrjRN4tVoRvplv8y
	rs9ouQ/95DHsD5/q65SPtJyJ9LGL0OQ==
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr4955724137.27.1790685139355;
        Tue, 29 Sep 2026 05:32:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr4955713137.27.1790685138812;
        Tue, 29 Sep 2026 05:32:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:12a5:a874:db1a:dab9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm79190355e9.11.2026.09.29.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:32:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:32:04 +0200
Subject: [PATCH 2/2] gpio: shared: fix no-device, fwnode-based lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-gpio-shared-fwnode-lookup-v1-2-57d54811de1a@oss.qualcomm.com>
References: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
In-Reply-To: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ToYpGBC12hzJhRDzJNwcgUv7r5Jiuiuajg4VXkHeTd8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqu6/LzOv6mrMl5r7HjPnsgpGsJJ+ZPF2DuUvzH
 ru5c0lNJG6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaruvywAKCRAFnS7L/zaE
 w/WbD/wJ1bbK5xvV3eD2wcwN+qguprO9o3atp/MhYHrNvaJ5lWyX5Az3rh7yZkIVEEmFhUx/5aa
 vZk3FyeiF5ZVD454FZjbWsI/9ztR3iHfAdDyP6eB/u71hWgG0QQjWSr0VGpOQJuKtHMcpDrglfQ
 jxvG+aWZoctihJt+psY0OFibxens+3vf6rSPbQQFrzVwlkbDHyuYcnjLiisGTsUr6TU3ErUf66N
 P6RIiU77Ns7gvzDncX/ULaIpLEwhdB4oo8PlPkFcUH6dL3Y5f9ee63Q6uUlN982TmM1ZV/K4rMi
 9Lzne59vsyDY0Prl0WL+ULdnyP2CiIOGWN2IRThYDs1fmPdvTVFcDo5R8pcnXF4KtaXfW28eC4m
 uk/euBRFcSkqHebtsTldNvSUivUkHUpwxpbIZvCTJ7v2+BMQPfA2gTyAPkFV8FUhWgw3dHJFRGT
 wUIo3c0V9NmZmDHdjpxE6xKmHy0CkdqnuLnmClp0LPQp+nUNLXRzX7p0MV5sqlERvKrN7EQ++NQ
 HkTws8kWqN8GVPuQinidtYEKa4UzfbdynultZhPsmqYo/WDLaURRsrrZ5bys9j+EC/jGoG9dIai
 bYKsj40DS/U/c55b4lXgbt+l17DPGBO9f/PAz6FkHEAVzzrkjTTtMua2ttmgS7AaXtqZNvVSQO6
 PYt596xOZFOF7rQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXzffUG3LFFlE6
 S8LYkaWSWoBdDfziAiSD8gnUAL9icoxNPvMv/VI4cfnBg7UQ9/stUX1R+3APeqKgSTjX74cJrGN
 fOKPGSmPbVkV3oucVg9thbmchbJF3zU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX4wkWMpiWaYGS
 LkBlpwqopsGM2Fs+fXvCAMCVn/zH6blIRtYJ+hH0W7b4arYX4R2qEcqdpxPFzFVP0jqIUO2bCNh
 MU4i7zkKcp6Et3IjTm2KM1Ak65EsG6eXu1yMZ06EyAYBqi+duDYQCSAHu4bhHNVHqyCvkIDFItq
 LA+mnQP2QQzFmvqKgb86gph2xQtrVE599emrsqd3OO4JE39v9pn/IuN9A2OONHHsuDFHousGB1M
 y6kWr1qVDDtPrl6rCyw6P0/EQV2ikzvhP2+JoctRIJEWiAOj44xTnf4Yu+9jzKFUuLAUgmEHBHx
 /R2P7oHi2wyKiqQLzG/jM6Z75JeATeGrG8TvAV2Vbot8zqsFpIJg6WbBBFd45ZekugXHzhBK2vn
 4FbW70QV+oFw4U6YpWsOqPDh2d8KqFeTd34Aw/ATa2BUfbSbdu5oJO8zw0mbPUb0kSh22qBhuCB
 1EZ1nwPtzElvx2fDXHw==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbafd4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rks5i3XnzFQczMNaDf8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: e4pxqtlPzET5ItK8KF0KgSY_FHlIozRz
X-Proofpoint-GUID: e4pxqtlPzET5ItK8KF0KgSY_FHlIozRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049

Fwnode-based GPIO lookup with no associated consumer struct device for
shared pins currently causes a NULL-pointer dereference in
gpio_shared_add_proxy_lookup(). Add necessary checks for the consumer
pointer.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Abel Vesa <abelvesa@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..acb420d77d2f286c40888b2d2660eea15f79033b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,7 +449,7 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
+	const char *dev_id = consumer ? dev_name(consumer) : NULL;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -457,7 +457,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -485,7 +486,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
+				 dev_id ?: "<no device>", key, ref->con_id ?: "none");
 
 			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
 			if (!lookup->dev_id)

-- 
2.47.3

