Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3227A38E13F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717895; cv=none; b=akh0EUS9Zzz0WMN+QOjbXGPu+SHfZlZaZqaPaDrByJ2sO51ZDarui/vzfIl4zn9rTul0qBM0BjDG7mcN3DLiqXbz3Iofqq1AQU4uCc5yIhXDWdCj/9kEW4ww38J7TFLFxFW5MPXslmJcPZzZ7knWTnyb59BR6HqubrzFA1T2A1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717895; c=relaxed/simple;
	bh=IkrsDnnqegB3/ECKlfWt0yI1ZZ2Qq6VNCHQcBe6S+xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYR3P2zzRgQo8upGGPgIbB/0bvfsm0AjIm/l9bPClZ3rXkLSMXZ4PqDXnZH/BP+Qbd3kjCEk/evDuiWQDr8TzyVh1JZZFPz0B/yStWLTpqBxrMIAuzY0+8TJeL8M/tx8gcmT1P3KBwOkPtdZsDkG28bi1wT9rv5Z2+WHgt5Zo28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIUyoNka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVEIA4qV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIUyoNka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVEIA4qV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686HmMID1003218
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y3UFEjQQbM9
	+6AiObgG56lePG6+x1Rrs5r1nX2tH5H0=; b=dIUyoNkawSSljdZUt7syZszTtN+
	zgykTqqq+a4Jj6O6GkIbk/OoY5dDS1BCWoE5gQHDNJTh0HwccYNmcedfF4EeolLN
	SGfMvYruYP+KRj06HhdZZTx2VR1bHb8CLF4ItNNgRG7gVXdZ85ewoe2sfLtaz6Zg
	JcQvJVKDqTs259na1OnL3xEal0yzynvmp2ZZDIOH6OTgkVMCI6uNmjbPLIugOlKy
	9Z09v1ZY46h//dpQjqf+WVSsDWyFsmdRUutjYO7Q49Phsuw1EDqPq/XKFV/60xia
	hyj4n41n3tuOlhoSLN0utl+Jqns2t6lxMOriPPhk7mQ0858VsmPwVxujW+g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca3ra0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:04:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d34a0dc8so2260251137.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788717892; x=1789322692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3UFEjQQbM9+6AiObgG56lePG6+x1Rrs5r1nX2tH5H0=;
        b=CVEIA4qVJmH9jdiYR8D5dnwD5mZ8MA+ImlN736IBklyHzorNdAsHc6jhgIqCOaABK4
         KFEuP1dhiT20WTDxjEJRNFS2NiPKxhegnOsSSM7g4PLoNbyoWOZIyGyPEI/V1QJh5Ote
         ZnD19pztRYWor2BJUkkJjmr5YC+RyFBuBhKC5WXMpAqD3fSp7gTwi02DNpKdL9EAIudF
         1zfILFUpC4GmvberSSWDdcJDFNyZezM2owV0wR5b50VFNHspEyUOPjLbr1Ag/g0rbcg/
         eQReyZgComZVX7vjmoL/byi+A1hI877ekWlLR47k8NJhXyci2UwPfGGWmy2FfTxT8bud
         p5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717892; x=1789322692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3UFEjQQbM9+6AiObgG56lePG6+x1Rrs5r1nX2tH5H0=;
        b=idwTSqzJyR/DVqyYQee+0g5tWeTshZY2xYWFon49JXlOcwkksYEegicBDbAncI6w4Q
         L08qgxavuBzMtdYZnP828jRhyXwQsz7bRzNUlbqAjLso3hFZRFGOZC0fIbkdkSAV9bZp
         bXifNtWEhqZ/ls+2TkCIJh9DeLPqJ2eBBKNyei8fcJG+bAsEcgpNzunNMrUkmX1z/f3G
         DKE8CQUwRU/IYpUQItgstR/fd20Hnc3XZby+dwK46wlWcHdgDqjaxdMb7OyA7qKOu9GD
         WnrV8690xEcnyRrRhOErXrtqL0tfzO5DsFl4ewnT1psPsVso1DY4NtIsWyS5HzOCdtxU
         rH6w==
X-Forwarded-Encrypted: i=1; AKwUvBxebqMq6LMKMJs315op7zWmKGx7LTPxV4XQA2MOtSFJAnuDioMb2naHj9+FhWA0x1G26nU8F67vhX+8fr8=@vger.kernel.org
X-Gm-Message-State: AFuF++kHjZijFj91HPg0YascudJBlFYDDnIOkIVH5VGyMocFYvfnnBsh
	4X5nqaoHkPWqo7reGVw664nOBr+I4h5HCth/1alPfMjOWF5APHBjIulvrwCoB+KlKUTLxHCZJvC
	SUBHDolINPqSN2CLF9vmOKYWYBqC0b5Q9hu+O4gb2Rs5B0wshEKNIRoexsutMEL8vDPA=
X-Gm-Gg: AYBFou39NcUYNlQyTJVAfRuYzrNkzo3+310CdmtNf+3LJtwNA3uuApLWzna8FoHGZER
	tnRU+Mm3lnCBnUnhSyeVnW4xH7FuQ2wHSWawy8hLnp6Zk0kIInW6CpO/QLuWmfFiqgGpysLi2Au
	A3j7PvSlcfAqsL0W+u9dgb56Z2MGuqfEOU0lU79dXny2ZfK85EKgzXGWsiCLihKvOSlQVe7/IYp
	jMI6qpWYBB0SGmAvnT94hEMnStW7J2+l+9yf1dkCYYcFPyVGjyR2CS7Y0D0d0eYpmcHp+1JBr5K
	EhGvx1faaA/o2NeONVsfvwLEnBhf4xb0JOkus+o8UH+UTWBA262xqnucACLpYwS6vkh9FHZ9QOm
	eSeo9PLEJhP2uy0g=
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr6969280137.9.1788717892286;
        Sun, 06 Sep 2026 11:04:52 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr6969260137.9.1788717891837;
        Sun, 06 Sep 2026 11:04:51 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm316638975e9.3.2026.09.06.11.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:04:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] dtc: dt-check-style: Consistently pass same content as stripped line
Date: Sun,  6 Sep 2026 20:04:40 +0200
Message-ID: <20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IkrsDnnqegB3/ECKlfWt0yI1ZZ2Qq6VNCHQcBe6S+xw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnas5rLn4tJLnGbkANLE33vbhwU7s3abhYqCIR
 Mjph5nUokiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap2rOQAKCRDBN2bmhouD
 19JWD/93l5V/MUxpd/P1byuDhVwiHAEnJK3HlK/Ww3YXkA4A6Zp7/nRw4fSLVJ2KPkAGaR66Q5g
 ZrL8ZL7KU6u7mEWS75s8ur/FkvnYySsj0tuLL5gCGizLYHiToaxmmbkV6uziNFuPCdhftiHf5t/
 YI4fjsAzhC0EJe7FaZD0UCfNwmTp/3nCfGn8VeiIg7LsCluLg8PVlZ76Gd6jd+Dn0aXoxURNz2H
 ubMQbdQHUX101yQHPQ9FBWaYnaSBLL2BLTod+XRo/o6m7U6ftUyBCUlajvdQmfpLGtSurOmWgTP
 +pry18NSz+tyC9wXfJ5TrQNoBRRLm3rPzgMNV/sX4BdTReAS1dC4ZA4bpVOe2yqgOgxrzyQ93Hs
 FCsclhGWJwCwOy1TpNW9RG2PvjcdecrWNAW61A8yXX0WseZEqV7RT6yGzyvV2lpY1J9EoD+LjG9
 h7xal8LTVbLgvFfnlqXvTCXCgWFbNzQLLXTwgsg/O11Ks4+1lqMn/ABaens2D/4/nAcOAr9X6dF
 0a2zD69dhy/ZxDyaCRFsvrKbxGWLc8JpuSVYu+fgvEmKPcoAip+6uEX7VBenG5Lcc0OqCrrKuNJ
 P0tOqwKRDaAGCmLF+V2pp3grbCM/uHJsaV2aij1b64B4mHQ2Uaf1DITUgsIGmD4mxALZLztwXtZ kA5CMBSkEYcEZpw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bNv9H-L4pvSy_IvhEJFc-n6YvOp4hA4o
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9dab45 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=u0ryVo8M40lSrqSlWHIA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: bNv9H-L4pvSy_IvhEJFc-n6YvOp4hA4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX1VxnEqdERB4Y
 XF+o8bvCEWe5+qszroJkRXNcNutp6t8jIKbdFZviEy7L/guwqQxsa8xE/N6CnywDMzdX22W5MN9
 ELS0yAohhtLei2HCZV+AeJ/+5+/QIxlHbyLHkxcDBfhI26JynDai+WI5inYDxTiaVPJnJiCUr58
 7mCCZl30ESHTUSf+S8Skj1V7CunHiXeDqqlGt69iJ3DBz4c6g1pUQ58J6IOxObHUF0HLLQcQFHv
 wLG86C+aMeXyYjDiwNE/xLYqEDSRfK35kq2umzbAs/ynfysyDG1VlC24QHWQeCnVe6DsoasIgkC
 drV01Jh/mf1yalC5/8G/ioBiSOU9dCF1y4GcDU/RKFK16BZhKNZOw/HUJiGvP2r/wKJbF+NVYw+
 IW7nC4eOPIt4PTdDM9XdcaV2S0q+BPq4l+oSEnicMio9vJSu272Q0kpdc2gSZ5foSet9C+r+rI9
 VKUTUwGV9I++V/xz0iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX14h0mO6CHM1U
 2qfUil/L+/eMFvrc7lVpgbSrFa+kejTUf7VEtVEGEX4ofehnkACEfOoov1zh+8F7Mw6xWlmIcKo
 BVxog+T5MHXg5+ks5A2KvUjdluDuxYI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060201

Consistently pass stripped line (so code+comments, but no whitespaces),
not the final code, as a sixth "stripped" argument for a comment
DtsLine.  This has no functional impact, but is more logical because
each earlier DtsLine constructors were doing this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6050b4a70220..ea817287fa9e 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -203,7 +203,7 @@ def classify_lines(text):
             in_block_comment = True
 
         if not prev_complete:
-            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
+            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, stripped)
             out.append(dl)
             prev_complete = (code.endswith(';') or
                              code.endswith('{') or
-- 
2.53.0

