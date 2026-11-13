Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584846;
	b=yZdlTD7s76pOnUJRPWTEoi2wei4WA+tcdQjgs+ZZ8E5fUmw0h+MS8g3HQ1sT3jw+VXUN
	 pCtddP3WG5ZCfJrT+tijMf/fxVc6jjVxYaxYlPzgWz4zUDOjYqzkf4s0bs5PWbPPs0oYz
	 xDuwpa1QfhI3DMLlHOUHnrXbyK+94fD+RCr6z399J+RUuAvHhQMgkLSHqOg1JbOlojOwP
	 hpV5lx6TaS+1LK7IWM+wKcygkOmi9FNwerV0vHHg1N/u+nYGFPoxXMIzXDSCm9lxaC3iW
	 CA9qjrGlkOq619jG1Xe701UosNTZfQWl68GtPElogswKiZdtZXuLfmRXynvaGY3UY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
	b=oTghvj9MnTfjAa06M8eGEC54auv2QBO6piB/tS7IpG8NADy8tqNGS8VoS2SwSgaK5e0c
	 cIGGpvFnpan/310tSUNZMp09nZs0Y2awuaOxVZBvDF7yu7chNzf7XWF3deQJk704ykTJF
	 eEQ7zN95OZ3uqDD2J41L3XYvi47RdBS1es/TSrwoG2/zABXPKvVeb2VNo3n7pRE3GwNQ+
	 fhbtQE5GSv9cllnFbNsdHZxVW5Udy6WI+B6I9B1xXNBoFBgWtTfnCCN0S2Z5lTqU59SSK
	 NMRX5kpRcObbuqE9TXqTSEv3QORRpRHjHDv3KELHB/PADAizk2S+/aLdfJ+DD6Kb2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iekG1suw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EoyJzVC/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F760606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F760606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iekG1suw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoyJzVC/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQt5D1075620
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=; b=iekG1suwraLe5Iwp
	M4S1mk3eVyRSu1rhTFQzNkopKjX99A0qeNpQjDdXsC611k2wve3nYNcVv7yRBAEa
	3Roh+ewvTQ5+dTQqVgKX+AD25daTjH3RFnyWUeW1YQ6sGIB3EY4UUiIlCFdafRwL
	hv+LqyAYbx1ejFXkcMSqrOwxhH8V/u3HSHad1QaUVCqZKPbwexJpqAJdbU0jfz2X
	WQkUgYIn1dbWCyrYKrdy6KNrFxZOaYT8Juy1ExGUtBTNd0+RJCe3oIa6ArCbD5oZ
	L9ogVY1HpbJsUCUnNFnaKeKQ/ynQiaFvjpl7/C459O6Cn+p7P9qOtlgO3TZo59xh
	UVfJSw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0amenj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:47:25 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6790b1d37e7so1578861d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584845; x=1795189645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
        b=EoyJzVC/TB3buxg7jErJpRxJSLKJuz9g9v4bbI0K53fDYE4C2tXgUXlGOuT5ZQ3OeQ
         puEf2MpESJvJaEE3zqLLXZoqb5O6PBJkfu9g5O5HJtiCuZ2MwbgeZZRWH1c1cUgmWeKG
         ra27PECoiyLsPGj3mP0m+LSOC9o6tjR6/WxVp2JEZ14G/4+NIz6psY2j7rbUHPV3myT2
         Ph87oyxlWCsYw9jCxhrKxZQqrHaWdLzmR/iBEvdcXIvsh8jVz+HYaKeu4njcUVbZyGRN
         1DQfdPiRRx1FCbIB6QsIdIqsLk55yFWPKAT/B1qtQ7VhWoQ5G9FTcgVqkpa13ouifCZ4
         UkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584845; x=1795189645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2ybjt8AitZmOWyIeR+WIyasX0i10altN4SUehbofLs=;
        b=tSMafd6UaItwD1F7Hezta+fMauIcqhp6lScn+K3g0ccl8U1KVUC//xrgvBHAWzqP1Z
         Iti6BAjgyUOGX3D2Rtth7PhP93HKLXfi/AiWM4U1ff4X7T/6vjwxZiY8OV4KAhsKEi6U
         aShwL3c1J5utVGAXn8ZpTv+KGu++ICMfxWC37NPwCzG5HAH3wMsH43M030qRNawn/P0m
         FbA1NLUsXBW+dmQZgITl/AbpfCnKzc60QNMnIMCfy6e0VN5LaHDr/OY17oqLrZzf570S
         FEK22q+qVVK8VnZgdZpYNZn4qxKF7+Aji6cLl6VDo3MBAN1/Qogm4csMGm/HrFEDWdrT
         Wcrw==
X-Forwarded-Encrypted: i=1; AL+hErFGbyY320m6NRAW5brdDm8d7bKtlk89jOnJ1fgZ8c7y6d8Tfi2hNtovyNNnjiqq3fuooYmOx/V3RGJYrLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J7Ch2uOqF9BGFEN0ZBrc9Xk9gSoQsMFHrAJTCGzQRWDNAzYz4
	L9XczX4PjARSsWY1L2midgNMpvOthwb7j3o0JTIOcUbdc1/LCixbVkfDAUkUAXwK8P7ef1/rASz
	hhxqY7ME6r0MRnwrxPyBR//J8gHUDN9driXcSKPtzuTYtD65dXov4+GjA6JBDiQrGVd8=
X-Gm-Gg: AYBFou38cFQ2ZfrVWBKH0rLdZ5KsC7HMQRr0q9w7O5iaJFiwB6ZiTC2TklIRxGh3XuI
	K9JhsFcr44ZzVwf6r4in7VtmEe/TmIlnbVDb0XP2ZLi+8qBaZQyDhL2nws2sks2G45WAo2kip69
	GliQ2yP6xHp4qwqQRVD1DsEF0XPFLkzFL3L5d1lVCbQCLwQjP7fjcmUDiux3BUU+MiiFCZBPxbA
	RmoA3SHgMiJBdEM59+uMQYofBuVgOo0VleoAP/40aKCdirlSCj5YOtQnyfFso95raOUhM1DWQsn
	VXj+GigvxbgixlELavFKjzyn8CDSsJESypuuHGZPTteKmjrFcXWkIIp4TsN6O0zdbPFxju8CCLS
	L5qeK9vBdgdu6od6rYrUndAFHGA0oZt3MQSN2hy14k18Ylo+km2KilqgM4qfF4g9wSCsWgP7waM
	mjJg==
X-Received: by 2002:a05:690e:bc3:b0:67d:8ef8:30bf with SMTP id 956f58d0204a3-67d8ef837d5mr1024467d50.36.1794584844649;
        Fri, 13 Nov 2026 07:47:24 -0800 (PST)
X-Received: by 2002:a05:690e:bc3:b0:67d:8ef8:30bf with SMTP id 956f58d0204a3-67d8ef837d5mr1024446d50.36.1794584844098;
        Fri, 13 Nov 2026 07:47:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:08 +0100
Subject: [PATCH v2 08/10] of: property: implement the count_references()
 fwnode operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-8-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BHN0x24xd95rb2mhrKGRQETyCRuc9VJoqjjnbX570po=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD450ufs2CwVIpCs23mOJpPGkbNozDQSNWMs
 7IW9kDBc4WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw+AAKCRAFnS7L/zaE
 w+jCD/wIHVO68ZHJpmCBcn8RSkyF/jzaZvq1EgP1/4uD5r7F47ZOwTPPMLcD1RwLlOJbHtQ0Vq2
 YFupfXTyrv4pK+6fyFBX5JfE8Ev9v6AV0ylQZOJbesz7/bJz5gSestg/uBJc5ONJAfowsfNWmku
 nFh4LKwV4kCuJbfHCtc/AIMC9Jog5Vg3GzI2srmBCp5YHcweYKcpeYt+IpKwaBldPyNBk8avMK6
 qe/hSVFsRA5ADywQFRBGIy4ghvGgq7Hz70jx0Zv3vc2j8VitCD88MMuuQbOI47szWMpMZRR6L3h
 r0JKZ9EvpgMxFQmiQWSvVjMdUg5Y0/dUGjwuYFIWMa4RylfYWD4uydrXaYlvsVBLB9sWrAniRWk
 PS7fu92BO8MRfXGHEEeVSAle7/0w7C2uGUbHJumm4PXYtRhlbawUGgwgHTxh6dA3VNvhUvWY8Hv
 EyKYOt5kX6C7sMuCA9a3VCSiDZYdVICvSLovK5LfPxW+l1ROTDoPOMwb+qBNQ2jcUj98SOAagRQ
 aL65XoBIlV+qrUi1B8uW4JLGFynn8FNrA2cCSiLP3eUeb+tcxb3vV6psgj6oTJB8qia14sf1AsR
 auibpNS867CZQSAuPWaX0Q7uymbX/MoOMumWYasi7033hymL9Vk87MJPQz6YsAG6AvZqWlKcQEi
 YP1Gau68T3bcFmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX7EzRIv0jcQvn
 rUQG5bOFKyoTyyvSf5TY68HAV9icPyGCt94jyj123oxMsaBL85y7WP6xt6nQy8WZoe7lpEQ7vZQ
 mPJS4kuFc3K/ZSrf3AG3RLVVc/S9dC4=
X-Proofpoint-GUID: qWWjUnY1sj8rThFaGynx3ZWDtYWLwnOp
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af7310d cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXzqfBqb2/32hK
 D6hAWqjNGjs4dxLpd78D/vmg8fyGVqNHSDbKxFvqrLVT0+YlU+h8RshcKvram5B5xPHLWLIkXbr
 eQp8bS+njeKUmnxsZPv9AdgqQG+KAK7aG0CFLlJEmfd4O5C0WhPeDWNA6dA/BGVU1lFhEvFfW7o
 BqtcR9LhHlPY44w6sWbJENeVL+eq9106qLHlil+DIZ3OogAEwAP9Q62F6daxsYNFNCrZbsNSj12
 GSOu+AA1MxUGhA0BHUxMmr3wqyc9xFEAC7oJRiJ1vAkxrVJV7Ki5uEeV835NSio+xLq0nYCqM9D
 FGIWJQCLfQh/oJGjG/XSINop92IsQ/IvkzKjEAe9eZ2sRFwlm7AU2hPhLvLgBQ0f17n6byAGzXa
 jjXzNxXpCFFR1MyiKJUQss8Ngx2317zZshsiA183t/JvKOAfwlUtLzQMmTm2n8EOYrzC6Ob2f8P
 4DiBoEnD7aRy6bkgwmw==
X-Proofpoint-ORIG-GUID: qWWjUnY1sj8rThFaGynx3ZWDtYWLwnOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53f2c84bcb96d3a00f3cd2371010628493d49bc4..c2f5c338b6d1e7f3515be76d21ba6ef097e65e04 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1233,6 +1233,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int of_fwnode_count_references(const struct fwnode_handle *fwnode,
+				      const char *prop, const char *nargs_prop)
+{
+	return of_count_phandle_with_args(to_of_node(fwnode), prop, nargs_prop);
+}
+
 static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
@@ -1749,6 +1755,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

