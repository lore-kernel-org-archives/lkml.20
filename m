Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663224;
	b=yGcpYGdbJEIYyAxp6QOs75pZ2uS9cQostoNLzX555eJk+uvJKoikUvmCiCEYTijF9u2t
	 O3aHFQ3uyxlYNYbvl2GlQWAtuRsFJsU3rbntwrkTz9eEmXaFUbEjQUgtd3bfFw3gE8rdG
	 V7AXbaWqKvbjzTMsazCh23UKgw9bbK/SR6Zn7h3emJUEW1xkZLkIQvp8pq7GLX2DBDn7d
	 V/+1jcUkb/xVOcme9bggOLakBBvCqdZWI9P9GxWuRX6RlyzpYVFwoxBJlBqqyd4KP8faG
	 CyOD8usLtgsZPWJf38BBRf9/6YJNLwY7F26YVAmZz7hyhbMl0rqdjSff0ZmMP1jWheA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
	b=KVw+HFDajOQ9sTD5Cr6MAQATHevZW+1q3f6skuB/ZnR0wjN3RqcR5lkvaMddLPlCNNzU
	 QtCekqJm9JXEC1plkif35BqmWfxNzr9lZVHwICGXmgiCFS4bvFBP4ues4hspBUEJMK+2W
	 oFNX3V+So09XbLURAa0DhtK4kVhKQYyx/rdv0xatBVW3KtnAVjmiRAt0lnS0OOXS6V7dF
	 G1sYXy2SOYh8fxTaGTt0g7YtKHzD4EQjL1fCpzPrhOTXTNuVkCU4dbYLFC1XnJqmlzw2g
	 7S18PSnRQ3WXtmupTIx1AlqeBc99AA0sIIN0F02FxnyMJd0YsWqXH/GVSZsQ07fXb2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exD5LrBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BQO/0gRu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C454606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C454606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exD5LrBP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQO/0gRu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wRIf3276452
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nRY4XoPC/fT
	Tj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=; b=exD5LrBPfQi0qNdb6I4BRaNhOp3
	OpCMep8qiXqjl7rBA6UErjuJFw0Fle/b7QDuf9mxMSoNRBoZxdoArsR8syOqcDon
	bB4POUxsS6wZ8hZiDa/5dLPeSQRol5JzujwKu1gvXTtWfbxyBx9+GojCSg7NnkWx
	YJZ4zCjWqNExQhY2X57MSPrsXsaJ3i+BLqX44QiMk6US+Y/QKHQjbVcJGqtqfrtc
	DXZZ2rW0hXxNdaK0dWTbW76sTkDk35F2vyCdGC/fkGcv6pJiwrsOxe3f06OeDb7N
	pkMLURkkqgYBxXy1PbqNzUYjVnOvnS5nWp8s9cYXgg5BOY4hvONiz2+YVTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgydm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08be1c84so30542545ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663222; x=1795268022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
        b=BQO/0gRucqhW4IomlG+Oz1sq1pXGDi1v2mrbLE+b0tji35SHvhAq8BbCGYBns5/N7e
         Qdic2RS0XejEdLXGQjcrDJ2lh2ujKvniS0GqiM6o0ZpZwmuqqVxJLMRC3KBeNeqK3pAS
         aEGJqz2eX6fRIKHQKeaH1TBmLbNVh95NOmZ4MZjgvXzFh/wzL0biMn0XAIyS4pEMPtJJ
         sxUx+OcKOo1f/Lf68qKZMhfaNwzFlkFBf+rqV/Ikr3BlJLSAVnO7KPZe/xu87deDHroz
         qZRnNQ/kSPZe8mALARpFjdm5uzS/duLLmkdutMcW2tUKIntTkB+UJhIrRKz0lAAKxmXY
         l9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663222; x=1795268022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRY4XoPC/fTTj5dGjdgdpepvvgO6GFYtbSOpgqo1W00=;
        b=ItmLrBa1wUWw007gy5u7Kd5nwltDQtFWecfNJTivmIt0Bx+o1kxESp0GFsGr/FkW9/
         Q0aqBP3PBBkcGcl+TPjwmGZcBU/QasdHoT0nxr2uoeBfTIX+ohD/zQPpcsyPQbJQe2p8
         Nm5MCfCC3+sUYWwtQ42yy+kCjY6GpNUHhxAVmoaqBUtdjr7Fnen0Of61RBaFkKPgQfrr
         khmt3GuujpBaII5V+Lve4zR7nzqpsEVPWJqxd5rNEIOQ3WPwI1RZK0h2VOCe9idwyXvi
         aWaxbdyp+WdhljH23Ownd3IrPJuJ4I5U8Zj2WoLDlfK43s7rtbcqX6fvmOlWJbDg6mx7
         LCJQ==
X-Forwarded-Encrypted: i=1; AL+hErFHEYNcbgZJsmrw7cFL+MHzrff8OhcUWTXWMF9X7987QYK+ZFWe5QhPxMD4IRrALqcixkuSVEsICVVZd1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NI1uDMJz1JQvfvMuJO5RpUVBHRlniNMSxJSzqzmd3y3vpxbLO
	JeWkrWqmQz4h1Ajscu6EjYlCe9mEsWXcnMsysRhr20ViHL6ZYZ0UEobXXvLysWwvWDsYVFaYRP7
	l8QbdxvZfP+87P7s5QoP433Rinjuqpp4qRiMu2Ttq30seM0j9JoY2EGFeWlYjvPai9ek=
X-Gm-Gg: AYBFou1nI7UwLY4ISlYPE/9aYykwhHQ8A/hqhOvowKHZLBk6/y1WjmalmJ1GaiQclzX
	K81DDLD00rVbkbIB1Ur6McinijgJhcDw3x1xgMI1E4QEoZLA3m3bHh0eQeQbXsrY8GMxMb+seon
	oIvQbWZ3udwxua95oomVNNTyqF1cy2ejkzKnnuFlubWkwmZk+13+vcY6rbnfwUaG1oIqSWyRTUw
	1++pWAd1qZXdkAvndlKJX9PtnH6IYq63kNyAu0Oc7vIixHQo/EnjjXEeweWOuAIfQEbKiqfQP6Q
	FUSAxvcDQr4rh3ktC1IFY8HUabHw9e8yjodeRxiuQDVXlMf+KpkTZ2UNi+5Ep/gfVu6oM9DBpOx
	VPWjzhXvJqvhcTWJdxs71b4E3jaP6Iafeh/YvheYdpU0f7i9/+5xcBuTh71O6wymJ/nPkhpyPJd
	rKN4Te1LQOy21dv7J2xPhV1iO+jES/c4zMwQlO
X-Received: by 2002:a17:902:d58a:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2ee0d9f2605mr51752875ad.1.1794663222354;
        Sat, 14 Nov 2026 05:33:42 -0800 (PST)
X-Received: by 2002:a17:902:d58a:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2ee0d9f2605mr51752655ad.1.1794663221893;
        Sat, 14 Nov 2026 05:33:41 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:41 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
Date: Sat, 14 Nov 2026 21:33:03 +0800
Message-ID: <20261114133304.989635-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af86337 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BXiulqRx7wyGqYsMR6YA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXzB6GJ+RJygcS
 1gy3lSF2ImCRcvr4JYN+FLhzpu4MPCbrE/MkTWVlNhzuhCK9Np+Nosa9gYuxDLlOxXxE/HOgPto
 zYKTDqt+ptuBxnK41q9G4ZcN+h0rcm0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXwBwIKsy4Ucs7
 G3rN/x6ibqH6tvyj0hNvkDW2KZto2TFczqSSDkrfcQscXcHNUUltdk/v1R+GePOxAet/11ZwZGz
 L8R76EGSxgbmrtafQfLybjVNfVebKmTRQTZVyQRKla0CJaPbrJ7Iuqg0ps9nI3Zg7PCUVCKIcIu
 CbVG5AKKIsjkVl8R+pH7+uAWZqWQsVXZ47UOUtfbZfk0V+FxIi/ZVf9B9IqcOjWtLbGxOcvrwtA
 VPnkVv77yUxhmwJI0VILnqa+w0+pr4QHEB6qh4qQMPbAy4bmOMthNuixTw1RMCplcqLPf/0/l9w
 LlbQyJ++liV/QtkjhpDeeN7N7lquZllw9kFF+JEr8tJq9OvvI3I2ToGa7WtWUlvictEdi7/O+oR
 acEjASLLphStKWB1CTSMAmpl12pwMNTM3if62x39VVjVKn7ydJn76VUkItumTk1KZVpRob3SnRj
 kF28j9fEj3266BL2jhw==
X-Proofpoint-GUID: r4pCGMUUal6OTnU4-ftrG-QZw2kFe9vr
X-Proofpoint-ORIG-GUID: r4pCGMUUal6OTnU4-ftrG-QZw2kFe9vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

IQ10800MD is the Dragonwing Robotics SKU of the Qualcomm Nord (NordAU)
SoC, which is used on the IQ10 RRD board.

Add SoC ID for IQ10800MD.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 5e84c5a7666a..5b8f1c817698 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -320,6 +320,7 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_IQ10800MD		798
 #define QCOM_ID_QCF3211			801
 #define QCOM_ID_IPQ5211			802
 
-- 
2.43.0

