Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499970;
	b=JGpHK5G7E0Lsq7XQUSfzpHgHqw3zk1UGNMCrWwavjM9M4M8Y1E2wMd/yYXBFCzJPWxXd
	 7lvdL0yV59E/SpVQWoOCVvpG2AqIZd2TCo561/DsxgIvsX5fpkSZVZ20B1fUjx/xfR/i1
	 0VzeUgbSNgfCIPtjbw5Y4lpWX1SYC4bnqTujARqcJlSKKkPuspwXVQVMyGfimBIvsXouU
	 QUmlUNSW/YWRJ0IwRt7o3UAWuUjIeYQjeRqafaLpC0zU4YbHG1r49HyyQZA9CqPxqDkob
	 lXc23/MxRrVd4gM8oGTdw5CirIhEDo2wi2yr/2liQ1+Ij2Bqk4+yc04vMERrrBq26pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0T5UEqM37tb/Fx8FSAIKKRizP5JlR3aPXSNzfInYCk4=;
	b=xCm0Oda1RFMz6i0VbQn/ZLeBLPXsj4PgfSk6N+WdNrmvJZK3Ne2+blkwwHqsmupZsN7y
	 IInE2ow6NgG9kpUCcg7eikkKTGP8JcsiVvSmxiqhfHl9/sGxh7LiFN5iuGVCs3viCYnv5
	 jLKZ493X0qHjtXiqDMi2hIwgb8rd1L4n0/7BgHc0Tn4eMcd2/wn8bAi3Mr7pKqN/2Zm+q
	 IOeT9ae5BulH6dCpmn9xFlTJg1vLmMQ2GZGaoyweuqpqFVRw3fKnTptqVhFg3eWokSjVx
	 WprS2YOJ+VhqB7rWbiC44DVDhUCh55OJkqALrs9fnSLERLKzAzkzEPtxdNhkJbr0hTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZeMs93Ps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htxbZtye;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C729606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C729606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZeMs93Ps;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htxbZtye
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3pu2562780
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0T5UEqM37tb/Fx8FSAIKKR
	izP5JlR3aPXSNzfInYCk4=; b=ZeMs93PsdDZMD1/kWpZmnfrC6xH6EbLOAhwL5c
	xz2xmy2rycvyXwLFCkPTbW0telYh3W7E9a5VJJZhxetu7C6BRP/eW5KwcQJ5FkJX
	Vvf6gum5WLipzwshGrkTftn5AHKpUc7zIOkfEBiKPUYQ7EvwlBBlNeIgzUPPOv3G
	TooMUpDA2AgdHP/JQFw6tCLjzx5Oipnd8cmTFl1vfM3J9u3RMdVHXG9vezYsuWwW
	UvoODsi1dvHAQ2ZShN/4jG0nkrxiXBgfLF0o0FwWNCpU2gqUxYcATOOee4ZKGGWV
	uUG+8sN0L4/ZhSR7Pi7VhsUn7f7s1WytUQmBjlANdWPjjKIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5naf3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:39:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so652514985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499969; x=1793104769; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0T5UEqM37tb/Fx8FSAIKKRizP5JlR3aPXSNzfInYCk4=;
        b=htxbZtyeTqA1Nx8ed69uwpgtZh5I/LmthxxAVPqnpAGiJRGUkMF6uEnCViokzvaEuE
         C9FNoGfssgkpSqafp8OdMXT+uYxIx50tfru/7uez77m9BUt39thV9ATtXwCK+N7+07gI
         WqLgZ/2miyTgiwGuWIfyZIcVjUFTiKWEoJrgXT68KcwxFF+nhxc53qTUvGD53FNlmawO
         x//N4MZDTZ6K08UOPorV1CMugElGsK0CKwO91esiZQ+G39PXrCXGFeLt4sewFFOjhMlq
         +IWaURDWPbR1R1Xeqf6D672yfw1AgcAHjdWaDpc9i+//RWWk7x4H6Ta+Is+96gNU6nYH
         C5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499969; x=1793104769;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0T5UEqM37tb/Fx8FSAIKKRizP5JlR3aPXSNzfInYCk4=;
        b=NSjjN4GIkPImVOh7QUVY1froaCwxXvuazse4YHqF5WxEt9elHncnpb0w0lWsdEsepm
         EkHlb3b2ucnQ6fqn3d2rPGW4H3HCpMJ27WuolWpQokkbLGn+1bK3nc1Zf10RtPCrtUk6
         9x07tgO0IrdRq90MmCF4QLzq9sWYj25EAbrEzF4nnZcVlexa+Vl/I+AeWpnNJdZPSAFe
         Lv5MPTFiky1AYC0GlXcPDVReTuM9UR3TxMJNxOyFztbQDFbwlMACOa4HKhnXD+GoXYQ2
         FxvZ90q9ku7MAnnzdZeEJW2X0qtcXUTrfTT3uF65TDusY/MnCe5Ke29UmlrFe4Tu/M7W
         7Ytg==
X-Forwarded-Encrypted: i=1; AKwUvBygUCNalEWykXEqQG+mXwwzWSrOdXX7t+djjLlfxMH8UJoozvdBeIM5YULEzzev760573m5UG4NBtmgx+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6q+NpkR3zS4LhYs/srMB3LuE9nGwdwC8seT+eeBJKbowLN/CT
	EL0xJU6rwFSmLNA2OqMP/sG4uAsny8sgbrAqfwdGW2qU8ggB1X1Aiu7EeZuYi0db/iX8fUOcEIt
	c8jeUwVD00fwUDpKt4nPShEB8JZc7w9aDy8PkjJ9YJ2a452tayhzizvNsf5NvMcl+u5w=
X-Gm-Gg: AYBFou2hEKeMfFM1r/HQgvvrwHFSJengnnctoRV+HTz0zsfbnqFxv/N9HumnJitvnAb
	432WePie75sKR9p4KQPK7JcgMh/UXqiy6H2rqO+vXd3zNaEyg9iZTHKmVExG5JJciJzOPSOb/L9
	5HgnZmhyXibkPPkf4UAmh6Eb7Ej3bdmGpMBdqRHgLHiNj1GswG6dGJeHTbcDMJUUpbTSDuFBUkW
	7gYoRelGIlJE0RZfuKhoSkYoAS+/FhRjxRvMnNXVlYgltldbWlbB0AL0rRKU4gMLTdWZj+z2KKM
	4rAQvNzs61bqxQiln0FGL4GvES3GaoQ/iIPDsChpSHnNExd4ql7dzGZ5mr02J9HUKZgb8iAgwBn
	2ly4NjDcjNG1wzvJDdW3RY2ydq4YB
X-Received: by 2002:a05:620a:40ca:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f29d53d0fmr1784264185a.43.1792499968672;
        Tue, 20 Oct 2026 05:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f29d53d0fmr1784260285a.43.1792499968107;
        Tue, 20 Oct 2026 05:39:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214b5sm6333982f8f.41.2026.10.20.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:39:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:39:23 +0200
Subject: [PATCH v2] gpio: sim: constify struct configfs_attribute
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPpg12oC/42NQQ6CMBBFr0K6dkinELSuvIdhgXUKkwjFTiUaw
 t2tnMDNS95fvL8qocgk6lysKtLCwmHKYg6FckM39QR8z66MNg1qtNDPHEB4BBcmST967r1Al1I
 UaLQ71oYqrLFRuTFH8vze+9c2+8CSQvzsdwv+1n/LCwICWW/R3irj9ekSRMrnq3u4MI5lhmq3b
 fsClwDnb9EAAAA=
X-Change-ID: 20261019-gpio-sim-const-configfs-attrs-60c742e31416
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4412;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8YkCpQ0uPMvdW5e+uh2l8mxg+nfuAwKAw6RIAitPodU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq12D7i3xI+Ac6Yk0QcvsqpeKUEM96P6XzUjPIU
 bw79yL6ZkKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatdg+wAKCRAFnS7L/zaE
 w9rPD/wIthpAwd1BvuDuGO83CW1fAS9atpoLjrfCDn2CmlMsNukzsX43QzIGTstCbLibFedvbQU
 ToJK0H45EFSXGIwg6VMqM0F+7PunZPphud7D6avToKIg1iBvFNNzj5JKmLMXBi5GzTazn+fcP8s
 E6SKbUo8IkJ2Nj/TIIDTotJN3fVo+KSj2m6+QUiHS2wApsFBVgtU51GXXhmeLx+61zyVwriK4Ov
 gC4JXt997pC168xg03B7KQNOs7dTs2OkSWttf9nriVm9+jXo2C7TjSKOjh6n/ItPmKVMh8PwHdc
 Ra8F1Tpzy7bZ2SB1uiVzmcUI5eaJS+wuliwOXXY6ZZgIhyT5zU3Jiscoher1cqJkIgdncTMVaMb
 wZmt0z5dQrvR3o2Bghtj/aVpZv5/2zeSxcAZfWkn9D2Zm7ZA6EuAHAEBIXumCy7zIrlVAlmgwPC
 +c7gJWOczGJh+6RRtves4yN7XfN1z92heqRpZyrMH4IbZjckT+aah87vKCJTrGHzD2RV75GdQTZ
 VSdUPFoZxLnE0GHb1Kp9pv1hKOgqMwgMdmfUuavG6AYOUAYEFumveQjParkilL3ZV7WbCCyWERZ
 rCmg4lR785xp50SBRE31u8reVbDxQo4A4adAvrc74ITs1J0Au0bHEc7Vzx5t65Z6RTMEVmfm/jf
 Xot1MHZ6K0MeA0w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: SV44oSt-Pw_LQvN5OvoF6BbNPI-Doc5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX1ekbzOppTL0c
 oIN+kdwGVK2X9mMxaVNL66FnRaa2EjUfC+1AXphfTCao55oEOzsLO45urdnxjxbEQl8PiyHpgI7
 EyI2utoP/KrE0M+I40tmBEme/+2Y4utcIyC1ItXfabDtKuJWgva3xQoNWila7l/m1Sw2G7aZanH
 I3icuBOl8PUJ9RK7Yqg3Lk9xYJY45kOS75PeDJgRzJ84esmW0cLyg5BkO0zUE0LU+OvGZLEpPSE
 WRJxqZAfr2w6TXYDDVrB0s2wNHceAFNTgQpLaDwpaJxtsLShqf8DQshAbBjGZzXvmJFdRPl4jNF
 8pHoPiVZjjh4eb+y7YpFnxNqANkXpJUtDFFk2K9pCV2Y5MWkHYMHD9rfIfnTs/pVFQimLLDc3UM
 EDwg6I96vc+wDlGG1wbSQ+hVDDoowTJu46sTDr6Fo/sEyxKfnTyaVHFB8YqIB4Mc3J03L9KuQ+3
 DmXoY9+FPMOZ1HpaQdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX4HibVMWZ8mSk
 ++ThYGfuwxQzunGGsi5JWUouCNxTA9hwY2DuRkrnXgdTrszTRu56JwwG75QV/YXDz4vOX5IVQjS
 yt+b/r/LQL5JQkRXfSpOXJzH4DHBLTM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad76101 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xbmJlAN1-OECOda96uYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: SV44oSt-Pw_LQvN5OvoF6BbNPI-Doc5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-sim const and
use the new st_attrs_const field of struct config_item_type.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Closes: https://lore.kernel.org/all/20261016105712-707634de-c955-4c66-957a-2bdb84bca3e4@linutronix.de/
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Constify the pointer to configfs_attribute AND the data
- Link to v1: https://patch.msgid.link/20261019-gpio-sim-const-configfs-attrs-v1-1-e9f919b32f08@oss.qualcomm.com
---
 drivers/gpio/gpio-sim.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec042670fc5706b4a93700e652cbaf3605e..8f587be8c5e4155290673d28fb048824f5bb8863 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1037,7 +1037,7 @@ gpio_sim_device_config_live_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_device_config_, live);
 
-static struct configfs_attribute *gpio_sim_device_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_device_config_attrs[] = {
 	&gpio_sim_device_config_attr_dev_name,
 	&gpio_sim_device_config_attr_live,
 	NULL
@@ -1154,7 +1154,7 @@ gpio_sim_bank_config_num_lines_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_bank_config_, num_lines);
 
-static struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_bank_config_attrs[] = {
 	&gpio_sim_bank_config_attr_chip_name,
 	&gpio_sim_bank_config_attr_label,
 	&gpio_sim_bank_config_attr_num_lines,
@@ -1228,7 +1228,7 @@ static ssize_t gpio_sim_line_config_valid_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_line_config_, valid);
 
-static struct configfs_attribute *gpio_sim_line_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_line_config_attrs[] = {
 	&gpio_sim_line_config_attr_name,
 	&gpio_sim_line_config_attr_valid,
 	NULL
@@ -1364,7 +1364,7 @@ gpio_sim_hog_config_active_low_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_hog_config_, active_low);
 
-static struct configfs_attribute *gpio_sim_hog_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_hog_config_attrs[] = {
 	&gpio_sim_hog_config_attr_name,
 	&gpio_sim_hog_config_attr_direction,
 	&gpio_sim_hog_config_attr_active_low,
@@ -1390,7 +1390,7 @@ static const struct configfs_item_operations gpio_sim_hog_config_item_ops = {
 
 static const struct config_item_type gpio_sim_hog_config_type = {
 	.ct_item_ops	= &gpio_sim_hog_config_item_ops,
-	.ct_attrs	= gpio_sim_hog_config_attrs,
+	.ct_attrs_const	= gpio_sim_hog_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1444,7 +1444,7 @@ static const struct configfs_group_operations gpio_sim_line_config_group_ops = {
 static const struct config_item_type gpio_sim_line_config_type = {
 	.ct_item_ops	= &gpio_sim_line_config_item_ops,
 	.ct_group_ops	= &gpio_sim_line_config_group_ops,
-	.ct_attrs	= gpio_sim_line_config_attrs,
+	.ct_attrs_const	= gpio_sim_line_config_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
@@ -1505,7 +1505,7 @@ static const struct configfs_group_operations gpio_sim_bank_config_group_ops = {
 static const struct config_item_type gpio_sim_bank_config_group_type = {
 	.ct_item_ops	= &gpio_sim_bank_config_item_ops,
 	.ct_group_ops	= &gpio_sim_bank_config_group_ops,
-	.ct_attrs	= gpio_sim_bank_config_attrs,
+	.ct_attrs_const	= gpio_sim_bank_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1560,7 +1560,7 @@ static const struct configfs_group_operations gpio_sim_device_config_group_ops =
 static const struct config_item_type gpio_sim_device_config_group_type = {
 	.ct_item_ops	= &gpio_sim_device_config_item_ops,
 	.ct_group_ops	= &gpio_sim_device_config_group_ops,
-	.ct_attrs	= gpio_sim_device_config_attrs,
+	.ct_attrs_const	= gpio_sim_device_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20261019-gpio-sim-const-configfs-attrs-60c742e31416

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

