Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882588;
	b=u3KKW3OlFAmcNRdPWg6BqS62bz8Fe67omCNw4trG8LzcXz3LQvt7Nlg8tvmAMQEVGNmC
	 g+/VdaiPUM8UV18rhfC2x5iY0rpazZkWg3dIbSbkI8vbNsgBGOv98Z/AQA6erynv4KAgI
	 XJQSjfnHUvOaHZ21wBGQPAjcifX4eHMKJR/4LG4w57IGDbhF6xoQCykwv28J7jjMO1Q6f
	 FsoddRfrxb9S3tET2aYz15LDVRM44VT3O+dtYMFXObzSR7vbKFZGqLkhYOoY2yVj5n67G
	 0yiv48+tX6jjaHVTUnCMdT18VPgH3y45NJzKWM5U4BZIoBcFvsu6/DSnJ1pRbxuKWnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f1HiuzAgbnoiP6XLEgSVQ76HAxeufd2AMG70LmlGRec=;
	b=x9BOULC7kbrxTvsXKNcBqUbqi0mBZBlavXVwaUG3mr6sH7IqtqGVdtOG7dHptrKaDVfu
	 HOZfh6ZRXgPaBfHLK8VeVCcdfaH8ziri2XyvbQLfywg/fBVyIQrSyOktnsAFxQce2Najx
	 vas05NZm1LMjsMPnk5kOw3+Ptaa66vcy4Ojvz2FlVUDleMFil5bW/wRbOyIwC7okHoSWs
	 y4BJy+40INfQadbV5ZJBtfmpf6Zxw2J0wb9VbRCfy6AwUia5xNCqRLQ33De9j/AUg/tpY
	 hmA0o0or9KK2alaA1dZAzOqTO6FIbFKYm5SflDeF8Zf9WO3bnoLHNfA6AFIcYVptoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PizwXrXp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FGtEvaxW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E8606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4E8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PizwXrXp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FGtEvaxW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbXhn1795256
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f1HiuzAgbno
	iP6XLEgSVQ76HAxeufd2AMG70LmlGRec=; b=PizwXrXp+SPjrmqdYg9i6ij5B1G
	TZmW+sBXMnfz2c9Y+aqxy87GCWrhPL0G7LlSKAYx13IGlAGMpRLJoPInG4OMH4hH
	eJIFRvx1Vgz3lmQix8QsLjm/kMdkOHTO9XIHp/q97OO+KxiUBOPzuhluNq/YHunh
	g2lGmA+HI9Yc1DrczktFzBFiZ2SJM6D3rfUmb45SfsCfZ/Vun8x+YOQg1GZcDo+g
	7noF6UixRadUdlv/nWdxoo3v60x9gwF9Swkt4D+uyWj3iE6buZ8jUdm34plvOiK9
	Rq0koMe/EHpLMEIHVYHwgbn453Yp1uiimiIWVIESeUol7c3WZ1O1bR3WVRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9stsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:56:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so83809485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792882586; x=1793487386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1HiuzAgbnoiP6XLEgSVQ76HAxeufd2AMG70LmlGRec=;
        b=FGtEvaxW5KKcAB5khzlZF5TTY0puzq5/dNS4AYRkBQ2kV4v7U4wed65MbME9/sbbl8
         IZo+1wYfn6gyhugmRvqoe8m3h1pksqqzJDB+ChCgv3A+JZlpXKgo7TDnnGGI5rw3c9ts
         zLXOeid/TirWP88v12cr4ti8U358o57nw+taK7+T/SKFGfBDBRIFHgGh+k+GSxQpT4x3
         4G+fM84/ZGRHPnjpAql73fM29E+wQnBbnBXeZOZgsCya8haC2Iexx7IxXVZ7t/hk8L5q
         esQjhthhcCnzeFyAMx70Q1LY2+McRh4uUA7OxSMPNbYJ9cZFv7QW7lchIomUou10QowN
         vKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882586; x=1793487386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1HiuzAgbnoiP6XLEgSVQ76HAxeufd2AMG70LmlGRec=;
        b=JUt+xSQrF4yjmibYpEXz+JwWC2h1O96sPvfdMoDnhwoO5rjMt9eRlgzwTM7DFGyahX
         X4Bx3SKCjLhqsA5SD/GLio/RssF/IFIRcqHnvfgV5D6ICe9k7eAzNyAnFpzC7u8yeT7a
         gSEN4p5JqbsJNdJ2uiJwQbP2bQLFGKh2iOd8mzWE7UCbXO4L4YjUvEyN3z/ORJ/Zb7Te
         H8qZoDY99G5dPvufJA9X/8yG6Rn7Xg70tG0BhScBbpF/an00U9UacTdGWnTOxzSGrKfL
         57uq6gNxxYmShAoVUBqH+YFQNlRYnECIcQzjU4LGPHEXSTy27L4EbEtFr7VnOAhm0pCT
         Fnuw==
X-Forwarded-Encrypted: i=1; AKwUvBxBPMrltqZlp9ikrhyTVw+vN9wkNGGlhEsVx61qaoDwGF8SfPXWBVce8sUE7Xfoysu3NtN44bVaBPOCfzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjZ7W1MfS4m2O20m3RRftrxng74wealOkuxXKHHdP5P8PZrd/L
	lXs8/FFYjcLhuj8JDQ0+yq0PEVoLKrDHwWnUPNs8Epo8Y3m8wkOuo79qaBKb49YX3zno+DB6I22
	04Qi6BLNlgFCKA1KARdvoupvvJDLemjrHcn8ru95oRzwq4lIDLNlpljiUAF5MPuybU28=
X-Gm-Gg: AYBFou0UHLysyOR29wvqejWZS2garpa7gjuBs3J2RC9OiD5BDmdtlDgAs8H3YxBsogT
	YIUaw649lkLOtSV4IijjTU9EonZRL4rLgZLTRtsRmyNoSI2EEdUywu5Cj5qbLhV3eZ8ezS2gipD
	UXsstyWyt4Px0RJfokk0dGA8MjPtQzRD/WCzg4H9LXxIMBhkRXGVDtMA8snh2d8UUmNNWovdla2
	RCVsg7YRsnyx4rGVbNApcDpYimfNJB6njCtSRUCyqqXRNqYOQxx20BsPK+V9bNGlmQQ3Z7Nmsw6
	E2Lccqmqjikdq3RZosQGwDb1P070j1hZSrNGjC4Yd27SoG0HtAuy+gcB9Nl5pJ0FSiyyZpsIQb9
	VkjOiV+W3nWx+Xj3T2NCRFlD851I=
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr453552185a.40.1792882586495;
        Sat, 24 Oct 2026 15:56:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr453548885a.40.1792882586057;
        Sat, 24 Oct 2026 15:56:26 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm98564145e9.1.2026.10.24.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:56:25 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/4] platform profile: Complete class notifications and registration cleanup
Date: Sun, 25 Oct 2026 00:34:27 +0200
Message-ID: <20261024223501.1420953-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: QDCw6kAottKtMULWnRzNbj4av9UrPrhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX3HyU0jqLgFko
 fIWxgijaYKqXs4jiHeCsTEfoETxN54nLizHpc7W/jseBPRDi9MEo58RfKXrhGoYzHXXX0jorqVp
 zDofRCPAqlOPPX3LOO80BV1reuzd0gau58ccggPci4OfxptYTI//Zw7endbPndSGEYrg3Co1kdC
 dJu2HAIg/Ti7fYD5vDBCSZmrQXqyt9kN6isGpoqQBtYNMBklwjCFY5PgFmPEwt5IMbzW9hgoAoI
 aPfF6kGjXNMYlD9XeaNElUVb4UR09mOrEhD286FMvI1nbMZw+EXKZ1bLX0lCjTMdmGr4fPB9NGE
 aUIulx0jAaHhEcCjTxlaAhFSmAw4gGrLi0yeaEJ1EqecmKMYyP1UjvXrD/ejjxsISOuf1XWZNGV
 gy7mRWIXzhMkxFnLdXs3dlhDBMaBlERgEt8Is+3f2LPLVogZ50CHawl/NeYZiM9bqMP5uCy8vLf
 fXNkFJfUpqoX7xRevVg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add379b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=sNWLPp6fUqVo4Qx2xT0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QDCw6kAottKtMULWnRzNbj4av9UrPrhu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX8neWbtRU7Rjz
 1gH3cD+x0QMVs6EepDxCMwh6Cj2VscELftLlqZNA3UA+2lo4jzvdpQBmXTH+a4+fOR6/h2q14Oa
 aamXZAG73kTlniix14TH7Lcum3MWjI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240091

The class profile attribute documents POLLPRI notifications for changes
made through userspace writes as well as changes reported by providers.
However, a direct write currently notifies only the legacy ACPI aggregate
attribute, leaving listeners on the provider's own profile attribute
unaware of the change.

Notify the class device after a successful direct write, using the same
helper as aggregate writes and provider-originated notifications. This
also makes notifications available when ACPI is absent or disabled.

Restore aggregate attribute visibility after unlinking a handler whose
registration failed during a sysfs group update. Keep aggregation exposed
only through the existing ACPI interface; the existing class devices
provide firmware-independent userspace access.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/profile/core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/profile/core.c b/drivers/platform/profile/core.c
index 57c3dad2732b..a850942131cd 100644
--- a/drivers/platform/profile/core.c
+++ b/drivers/platform/profile/core.c
@@ -256,6 +256,7 @@ static ssize_t profile_store(struct device *dev,
 		ret = _store_class_profile(dev, &index);
 		if (ret)
 			return ret;
+		_notify_class_profile(dev, NULL);
 	}
 
 	profile_notify();
@@ -330,7 +331,7 @@ static int _remove_hidden_choices(struct device *dev, void *arg)
 }
 
 /**
- * platform_profile_choices_show - Show the available profile choices for legacy sysfs interface
+ * platform_profile_choices_show - Show the aggregate profile choices
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to write to
@@ -366,7 +367,7 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 }
 
 /**
- * _aggregate_profiles - Aggregate the profiles for legacy sysfs interface
+ * _aggregate_profiles - Aggregate the profiles across providers
  * @dev: The device
  * @data: The profile to return
  *
@@ -391,7 +392,7 @@ static int _aggregate_profiles(struct device *dev, void *data)
 }
 
 /**
- * _store_and_notify - Store and notify a class from legacy sysfs interface
+ * _store_and_notify - Store and notify a provider from an aggregate write
  * @dev: The device
  * @data: The profile to return
  *
@@ -409,7 +410,7 @@ static int _store_and_notify(struct device *dev, void *data)
 }
 
 /**
- * platform_profile_show - Show the current profile for legacy sysfs interface
+ * platform_profile_show - Show the current aggregate profile
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to write to
@@ -437,7 +438,7 @@ static ssize_t platform_profile_show(struct kobject *kobj,
 }
 
 /**
- * platform_profile_store - Set the profile for legacy sysfs interface
+ * platform_profile_store - Set the profile across all providers
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to read from
@@ -508,7 +509,7 @@ static int profile_update(void)
 }
 
 /**
- * platform_profile_notify - Notify class device and legacy sysfs interface
+ * platform_profile_notify - Notify the provider and aggregate sysfs interfaces
  * @dev: The class device
  */
 void platform_profile_notify(struct device *dev)
@@ -650,6 +651,7 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 	scoped_guard(mutex, &profile_lock)
 		list_del(&to_pprof_handler(ppdev)->node);
 
+	profile_update();
 	device_unregister(ppdev);
 
 cleanup_ida:
-- 
2.43.0
