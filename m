Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584833;
	b=hxX1Tl2rUMWVvKEI2bvwllO636hDo6QiFDF3s1wPrZ0F2QdZzf1JZa9bHthQjxUq5JBC
	 VZr5ifp2pdMS42uyH0+F0H0jejWJvNbzwck1eExMzbjuIP/PNpozIueoIpPPWvyHLAjTm
	 k/ulCsJYVPAhSQwYwqgPcvKJE2ZA2Xmktj2q1B/AEp+jxwdNYF8czz+SH1Ez63+KQGq5D
	 9VbBRLQXfjK8hqm00u7sSnoe9bUmdyPUdWTq4L3BeDZLl+e8N0hux6oJj8GJYH3fhyT9T
	 ot2f1ilV5JrJiM5WSjN9bVoReJ/L5pYJTG0hVIowvO2eqCxvMkIihHI8V7XK71PwdGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
	b=2kf2XdQwwDHmFq6iB9yP3X0LrDZfnEtrjQgxY1/8lbh7olX9kZh10DMhlbLOMhDRIA1f
	 4r8IE2mwdl4TkYZCOVWAORdcBAFZRWsQ6N9Xw7xDSnO4XiBshnK8d9ci8eFeAI6JSa9/W
	 HZ7JjWZ/KJnulSCUVSAJLKThYwhwDaU7whcI0BGt8zWgpv1HHLfmUvjWeu5ZgL7gr3X8m
	 cHA+Rn0o084S06FMkqhzVy0JYZmW9JK5fgCxXThyU5Rh7zdXaCt249brfzxpquzIwWFbW
	 8RpcUy76x+b0uWxzLTsCZU66Q+CK9MhyEVg7EraEJ8bHGY/sxM+oITJaoHMGCA2/hpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n4egnpxz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IStitQ2T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AA606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365AA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n4egnpxz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IStitQ2T
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5t11189950
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=; b=n4egnpxzMUjory/A
	EgpxLjmcnRjo/g0HqrZ3k1+S5ZhHMOrlwl1c6HX4lCY/+KurbdpSkhK0VSO7c82O
	le9ef+plrlRoqB8I719JVmeRxofV1IOQSyTsDzV2YBcwuYkwdpYfMMr4mDCjAj7M
	lvRG/lHlfk6udEk0GcftmLxA7lkn0T4nMDk0tkU4LsuNFC5nOk4+Ml60bpjAKyFL
	ZJGeQieIm4ne4VwBjti0xnBkT7HgO++agHVH1l8x0v4y/6cVpH54nME+W/hJV7/K
	MLc+EcMoN0Kz4umnQV2cokbUc2TUCyEOdSX1J8eUU25ZY1jsIhnPQWqO/pyGX7+X
	R+XxAw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufk1m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso1043801137.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584831; x=1795189631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
        b=IStitQ2TlnbGRbMsuaUy0bSmAbsl3uGIZMXp9N8mU3PcUWmHAUZHQ+SCapFjWmzAB7
         NO3MZLctan6xAyxOT5+R+EmSDDMqcH17rNDYXsJm+/abgBvzWUD5cHWjDnhJa4eeF6as
         PxuxehHp0pC4zMPifbyfg7zPmLGsU/hC+ZzLkMybhZcrRJCvsHU6PEHg52esZHJc0eu3
         fob9pzMwd06uJUmaWJzQ4+Pma2w+oRIM7f0nX5cjPIYgzNjRDGrWjhAc+Ac+GHdKNEqv
         uETW/Su5gZYjO2nNOchJrAYDDr0cjkiVq+AANP3wkxVFL/ULHxS61HVz6jECbvnn7aPR
         AnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584831; x=1795189631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wed/p4dMAXGXPlOgd+Od6fs1ryzDmeVuvcuAAb2oZD8=;
        b=peWLmPLJMLcL9hPF0v+eXmrGZ+Z1R9ZZrzaNBIpq8rGBSHS/9X+FDp9u/w9KLWNWQR
         mKX6gX+QoAVzwSPrTlHS23az/6O0ndwvJQyrAhLzUvCyc32TEUOrRG3lUS+4QyAJxcZ4
         p04AJtnruw7/c0P9b9hk56rds58bW5y6e4P5GAc/cra/tKr3V2ZXyh5jtGew+PZRqtrO
         ob3F5yCK9bJyjQl8dSUjuPaa/NVwwtNmyRjjnkb0jvqc7FVKU8QKjLa5RbSFWVLpScMx
         l8HEzRhov43LWyavJEDMq4Fi1Otot+6mIQyZ1FOKIs+y6EtEmBEfNX4wpPfjsUR3SO03
         6bsw==
X-Forwarded-Encrypted: i=1; AL+hErEIRQ8kOs03IXBXB4GGEOSePvSlBfsO+gLBZ9I7Mro7ee73cQPJYX66jopm0wu4thYRQtht/kyj3dax7Ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qnXfi3HKZ8khefFkhF4hvzz/8kCqz0ld+zyo+bE171IQ8LARA
	sOPiIx0ZP57RkWWwqISpfkqeFiv82khea9o/pFcRJLT/NIk4cZ0M9cnGUsbat2K/NhF8aL9sZNM
	VNrPcmWf2zp70pki0GxadENBHp+p3Uewu76uSFpvAGAiF9O3oYBqWjZmIh+u94tzvsjs=
X-Gm-Gg: AYBFou3BqB9RLTLO6VUcmq+30ZrSoDk69al9AxNpEQmvGNvmftIJOV1TFJdRMJJuSos
	Xe7WXI6UeR015Zia9nU0MpC+8PkeNotZNQgOPREP1CJtdKG7HkFlFQX7AjyKXkxPcgE4sSsyou+
	mAKXh5ZSECBMNQyPY9NP4UmnssJUrgRpXgvuWRO6gm3/G9q0uqWqZCwA/mBwd1vQTE7uTFhFhwx
	goy7GAd/uE9/rU1wgzFi4mFACij2q4+SbLSVf0XG6zuGojmkhfUAPNqERoJQDrCaoGzQkGnpWjP
	yW1SSAjbYNa5isVsk/1/YOmd/hk9n+6vqmxpofIeQYxuXQ+m5YV7EB0O2FGq4/MY+bwAAQoBbWW
	hV7k4kKeEinowOwiWh/LiMUMSKIeP05IFJ/rbTTmz/fvqGdfKJE58kXeAwysCeioFrb7q3jAc+t
	tzQg==
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr1050073137.29.1794584831365;
        Fri, 13 Nov 2026 07:47:11 -0800 (PST)
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr1050056137.29.1794584830870;
        Fri, 13 Nov 2026 07:47:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:02 +0100
Subject: [PATCH v2 02/10] lib: string_helpers: implement a CLASS() for
 string arrays
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
Message-Id: <20261113-fwnode-for-each-prop-v2-2-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t30FPQpb4Tnh5cjxh+syE/bSfLdlIjxN8NWgVucIhbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3zxDfNmTZ1oYpGu3oDNSKeYhLlJcTGJy3w
 i9b5ljY2i6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 wzyeD/9liUwDxOgRuCtILa7ZmLSZouUUEBMZOFZYeJfLbxqPj5BOO3LrGyZBB4eot1x51iaTeaL
 seAk8C1sdvB1kdjX6QVoJ0tGLj3Ws44IQ2wvoebYW9lUY6deKsomvMU6U17LDKO3L/XaMt3FDjV
 e6/HReOyU8IGPJLMZdufybX2gEVS+Xi/MPiHXevqmFcPKSwOoRFNfchRO8E4tIOUoEJb4mIRsQB
 0rsnTeD1IDzbiN+9o8sigSIZVxc7md3ox8EmjUHcINHaClSoizGKJ5TEKAEW42pw0xIgalLcI/B
 Ta9vfewgPI6i03x3Bf99tJUk+JJ/arujVKmdsdTxAe1iIPmdsl8VIfL2upL5GNduYQ5LxyQRP0R
 wLCEUqksltK4bnonaZfrLbsYBG/jMOWQVFyDN5lARrMSAUS8set0dHoSVQRsG0HnuQymrmjVteg
 zDr9BzfXp7bdlYHJRThjawEDJTtrr3tqtNaBw9IHETOLc55+W5EbKbDdkCm9uib+NWXiiKN04kZ
 11miOyx0tXie3POOHvpLjdqe3gvgfBX6bMxZM7yAGpfgwWV66EHdGZMIXgHyKMg+vVC4m9mKL8k
 RoYXaq/lvXSIRKxVnv8lbV8T4AeSEaWmxBot0jOg9YtsPA/2tV6pyP2JS/lri4VVTt05v3Cpxld
 d+rv30AlQOrl1xg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: wfLHPvZNtYpV0j93oHFdPmajR2JJRWtT
X-Proofpoint-ORIG-GUID: wfLHPvZNtYpV0j93oHFdPmajR2JJRWtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX7OW5wd88l4ew
 s+/sPJVD6SqT1jhe0s9/VbxnIpyI1wRs2F/WnpBXkq1TfJAhGOSF7B0e+Po7sDvzHnL3BteJ1c5
 hCebJaKF/bjDmTPDMhp7xfXT7pXDMFAqdVGJIvWItoADQjXHJ0APsJIkth3XxKlzQrpTN0HEMrq
 jxo8A0EwvhzSgvGAdX1avD5DV0gwK4yS2yZypSmAyZ6Azjv5Mdt1S4++yF3Vu1TQ0rKS/AD7DjY
 zU3g7o6W4Kid7mppaEUvYkFz+fCRN+mIH/xWSVd+IDNji3ndTSEI4aymHUZ6fbOu0AlDFSb7Gzc
 0LotBwBiKOSUdAzc9XMmDcmfawpM7JjIPedq3H42+p7yymPWda9VE/Uw4pG0dSfQiZ2t3Lh8lVd
 JwwXVmA0o8MvLC42aSWxWDFV20RW8NZEi9uyQ55CZ2UBovncCqGLnMLMZKeTmmwwLJx37a9Kt9Q
 P2YL18Kz3/nP1ZGZawg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af73100 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXy7jdTelP/6dX
 +cLYMCNCRams0kPtNg6XChCzO4mDGA+gbB88vmZ+ViAg1qiquLwhkUjfkpOb6SLKGo+Ehe6yckg
 bjqGm2OWQMB95YF5XZptB0VYl7ceY+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c9f08066439bdd33cc26e2054dbe1ba2e867aee7..4db73bc7d4623cf45954cc8794c5baff6fb23241 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -124,6 +125,12 @@ struct kstrarray {
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.n),
+	     ((struct kstrarray){ .array = array, .n = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

