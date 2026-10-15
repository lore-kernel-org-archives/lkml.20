Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39555515894
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075609; cv=none; b=RORU/RFVTAuTgNqAwAALORukuPxQ6kG3IzkIZVQwoCk0htPr4do7UfE0Zer+1JC5tZXF6d/6FL5VULRD9EN9HZQ8g1H0542elwP+P1sKO3mi8Edd1nPixYpo+eFbpedJqlwfnFCVRiV8U1LwZOZRGr5XmJwQCF+hl8osBvc69Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075609; c=relaxed/simple;
	bh=NDWirnr4vg3QN9XbIRUWUV1IvDXviUNFZMI/OP0DktY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIOHBw/iuvm/j5T0M6XP9fE2Vs2OKEAm/kFgu1vtlKsDAM5rivZEiD7LFSdfgNpL84rG/p4AQYOilZvuxUsTxA5CEzlOEIMIEAYlOg+M2dSFCcWRwz8ocJuxQbbVXFnC+9jlQWZcOd5AKznFLPqXHD6FIAtnoWZJDpNl0QTkqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cU5dHnhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNc+ulim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cU5dHnhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNc+ulim"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWig4078195
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJV2UsBufFSWGkCz1dtlwgPFuz884GffidJVAFetku8=; b=cU5dHnhgydKQmz8g
	Fa6xgQFxTMpsiTuD0tUYQuuC6TlVeN3KkRCKCZ0Rbc8UkDQiIGc2ciOSFcJQGlwb
	Ttmiu+zcnKJmH9bMB+iUVmILHz6//nKM+RPjbU4izcJWj7idEz0RVYJdDDrl/IyU
	ZmWZiIPvRlMwQwR/mjJXqlgUSrhew9XnPe02Cnqt+fsQNxWLexZFoa95lRqtOZLo
	trYmY3mdI0+o6Qx+ZhhKBtzbJQHmpPUYhQVzpe/hFQY1/bcNL+hd/pIdfEmMaCFp
	c8/cEGs3Wsdo1wA5GX4TriC5LtPDTUvxA8IhGXzriB4QQP8CCi2jL2db8OGxvJlR
	dDhILA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc18x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:46:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso911751785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075606; x=1792680406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJV2UsBufFSWGkCz1dtlwgPFuz884GffidJVAFetku8=;
        b=jNc+ulim5W3PAkBGDdyk2h5VEGeqnXnZLn/HoxUAC1OidygH7DxGDH4Lsy0qUvPyqs
         DuBrDZczWsJgczcIs47xzsPTFrOctyhclERhOvQNVapEIvMxTDYyUtYgXt4AJHOa3Mgp
         TfKE8a9U/knhaycWtt3nlTubd7mORpmx6T//RCSDsoFdcLsE2bxum/5hI9NOnVjzluR0
         8cVk078PxmagLEIPNR8+Dsr+eGb8pYSetbHGwtCn2D77x+3JsXS/Zr62NpZs6ERXF4A4
         AsM9JrQul8+7IlFht2cgOIrwba6ez8flGtQmASgdaqWUHHpGIq7LT5Pi/IfseVmZY5om
         ouIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075606; x=1792680406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJV2UsBufFSWGkCz1dtlwgPFuz884GffidJVAFetku8=;
        b=u6PgQ7e3AdXTOqytrHikqDeKz0VCfJS1Vcq6JwOsh/GC2qCf5UbePW/Wv+J6gZfoRC
         m5Aj8b9f3RLz4KLZKYqHHN4we7i0OAvxCIvG6hlfseCK7nqfyi7UJoMqb1T+Kd7NDxU1
         uD2b46bnh+BN+e1eYYOzSPmhcyJnqInoQpqugjfPQzTnBglWOFCNvicvklPMMezde3GG
         NKSCf0UMKAgBwkK5jeVm7GvTLHiw90KvA5iJEl/w5pIBpqNfCFH5+FLdVvRWzbYLFBrO
         MR7KqznBAN3PfFYv8KULD/TkRJ15lWOeeHvQrqlGvysNQHpz8ugzfRwgJXm4m5tNyAFp
         9fyA==
X-Forwarded-Encrypted: i=1; AKwUvByzHb6NnuSk6XnNhUPqyJZwaedoJz0XrDWlOIfKSZpxR4Acw27+9bcLHnXoXuM+9VNeRHGSwG8UZKBvhWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH1s4u6M5tZ7DPnhLf5/mjSMbvaE9QoN7II0vTAgs+XKYSNOdM
	HPq8wxKJjMFMUWQ+H2G2JnRgdFPysFPhQW/IbuBKN9CC7e8WN/P36Hg/82/DSQ2SX+JSJ3ujKTt
	6i74p9IfSBR69jOJlne0ovriUdycI1hhkkuNL0ZtKyzjaJQyaz2YOWZu0TLIdfFzP9Ww=
X-Gm-Gg: AYBFou36yNMKEijsfUjEe96VHBtpP39VoD9iNRoDb3odOc/m/DPcZIJU5yDs8fDTRfh
	Mw9QIKVlqgWYOAmEB2Y4XPQkPCeP7ucOCA0QLf1sloGAHjaa+Af5qosK8gJ8vexIS37Cb5hRnBD
	SrZAKGnCf+IjvSUhTAHw/gdOMQKh0RW36n5G6JFI0Z8M2jlpCsBqFZzEKHahUOr0sw75uUvaPdk
	CIFgeTjOjJdZkayWiXxqtOYbPz5yHy6UlTzUwoPzfhnuM3rkfWwjZCLf3qII5OI6uY6foMVE91L
	8Jb0gtrGbD9JacU3JGEwL4+EU5Yv4x9OYFLMEz9rVTR5tHtraEXyJgu/AZqwOOhNOMqzHdM6wHi
	hXwEjRE743bjBDu0F+aM2wcbQX9Jv
X-Received: by 2002:a05:620a:4449:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-93ebd263d3amr3070955085a.44.1792075606425;
        Thu, 15 Oct 2026 07:46:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-93ebd263d3amr3070950885a.44.1792075605880;
        Thu, 15 Oct 2026 07:46:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm86840625e9.10.2026.10.15.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:46:22 +0200
Subject: [PATCH 1/3] driver core: provide a test-and-clear device flag
 accessor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-swnode-dev-notify-balance-v1-1-9e7537bd2869@oss.qualcomm.com>
References: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
In-Reply-To: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NDWirnr4vg3QN9XbIRUWUV1IvDXviUNFZMI/OP0DktY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0OdPWsRp5kvFYVqOM/F9vDktvQv7TiGE+He9l
 H3hp1ja8QaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatDnTwAKCRAFnS7L/zaE
 wy7xEAC6MgYZiI3qCgL9uauMenPEogWQJFEc9/AXz7T8xhIegqAWOgGl5fPh5cGLtcvC3T1n2Xy
 yyHH4RKt1EAz+ZaisSUTnp3nwt9Txt7bjqa2egUFNhIdWPr91RMVeWWfVPSk7edu702+l4MlmxJ
 TLi/nLcb25EG731aJ+6SQ2UoDaaS7ktbx+DHH7kX7fbRs+9mGHzbgExIayd3x3kLWCrHrTGmVMO
 lkpeHyZXTIJiym0BxasyCWHkXdg3V/jhLBgmvZsw99XQTyC4CM/D9jGZOAsbnfL+g+nu9sA3zSc
 wzKaXPtnFCgJaFcy5/wPGz/3tg+L15egtgXDrX6A77fYW10KRMAq5fbpe3ywq0yUxt1tufxu8U1
 gqyF7c6rPrye20D9UW9znOEX+Z/Pg+fOtQI+i1z1bsCScdTIrd0KfVAf3YNfZ4NCnOVPzWJ4tMx
 0uo+RAir9xNMTp2amUBQevB1GOzeUXoh1qMqad7Bj59RErcdD/WEopsL1mHQywQOkv5mm/dLw3z
 X3TBPo0465yCR3M3B+svxhWO1eEOByii3FqaEPj15D6Ka89c0omMLujHWjz/iguhipIOTy53Ukp
 9inAuBhKErGKh8ehVHcV4g00IiNbmH0+1pSPuSO79sgH8oOdQ7K6xb/qtHVR2hStjXrhjESzPl/
 Jx/r6rbl3qaLWPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0e757 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0Wdk4a6BYWEShyIiZzoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX8JwMt+spJbYd
 IbPsWpt8Y+4abl9SU5kHS9wbmwh1lesb5jh4FMo7BNa06CeMEbXv8QNYQMDsmGr4WPaZuGk+b95
 6lhXxedP+Gzh9GKulJDSPDFKRu+r5j4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXy7ZTdJpfvP7r
 fmlrFK/UjM+9vI9+avELxv3rYOLvGnuDQIH1LNswyWiMkY/PdVKELSy5pN+ohlsGXAmH5yiwnhh
 6vTG7FlE2H9OaervInsoIRAoCztTonq+IgniVBx6ZXycDjKS1xhYrOy7FBHoJ9E8I9Tedvv7Dn1
 x9H8fMC35VTDtqQkwD4d4A4JZqEq18vQ1QgwZFBPdFhkBHJXGPW1ru7kB/zFs+pI13Xrb0l+wV6
 vbiyiIZ6dQxw1Oq9oNQwuZyoltjxpBSWlOaP9wZTDHfaYo14o9pB8nnTWwJPhGNdPy7W0ZjQRn4
 mkrZUtZt03bS3Y7jP95qZrZv0F9M0MYJ4TXB0RETp3/hFApCv0gMF/81sssDZezy5vtZwLL8xFg
 Mb9bhB/QNbpbpibBWx44+byWN3i3ZYcTn05N5L8uxzWi86v+SlCDS61qit2QCLsocceX5qcwb9F
 /gEteobl4QdAU5AsdHQ==
X-Proofpoint-ORIG-GUID: HXZRYaa7luhRt_d-Ot8nZxcHxPBuWxHE
X-Proofpoint-GUID: HXZRYaa7luhRt_d-Ot8nZxcHxPBuWxHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150058

Extend the device flag accessors with a test-and-clear operation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 879eb758b5eec3f634d4fee0e4a57433fb537801..c8de370d877f978dd4a160f0094812a1d8441078 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -817,6 +817,10 @@ static inline void dev_assign_##accessor_name(struct device *dev, bool value) \
 static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
 { \
 	return test_and_set_bit(flag_name, dev->flags); \
+} \
+static inline bool dev_test_and_clear_##accessor_name(struct device *dev) \
+{ \
+	return test_and_clear_bit(flag_name, dev->flags); \
 }
 
 __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);

-- 
2.47.3

