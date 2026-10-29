Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263103;
	b=a01NFlC5tWXh43B34ZZCgzLJZTaunezapMOrOe2DIBKZNdNhNN+Kd4EasehHJ7+XOqV9
	 enQKq8tFc7hs0vPNEqTOqAYR3O/Wa1wiNNjehRzqd/iM+7ya8M1OLSwXKaMZAHJetdYga
	 1GUd+c5c2iWrnctI5b0pw6v2GSz3VFqmi1umYTkzDzMlmMqj8IDAfOpk96/BjlajkvC0A
	 K9M38j9r39wp2QuFFMZyT14AqegSeJ128hC26FKcRNxVXMc35mo0Yp/YahIel43K7+/a+
	 kvMgP5diZNDeGUdViEZKyDYeaUKrYUOQHkRJfXVP5Xf9TZBs0YxNxQyemjoQMV4YyEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s+T48ubUc=;
	b=FOxvYqK2SVAKmbBiO4voUz6s6N0YOQ5uiWocVt+/SzAZ30k20Iti5bCnISZfosrwE9mj
	 sRTA+bLmNZ45ToCnWdWZO6QwdWh7qXv+XqdA/FHJg1ZpU195JxEvwbeaTcOcluTHmpI+k
	 buzAar60iP+zzC05r3GHKOi48mNaA1de1Gr/Ut66exDWfPygE58REKHVywdJTkzdfLdWB
	 22fMHK7OWtoKvkOQx7kvAZMruT33vzmTN/qMyNNKXE/o67LOBgjV++Wi7MTSgd8Hvd6JM
	 72IeuWl3ukwSGoSzcLkmD1ELuZwoDqmONzS8jn/+akfQdn/Da+qqm4RvjWffVYhII6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esRjHtj1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITFYQ793;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0C0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esRjHtj1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITFYQ793
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GpJq176860
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s
	+T48ubUc=; b=esRjHtj18kr6K9P158h0VnRWCOwP7sX7ffywjD0FnNUYZsGiw6a
	JUFnAC3i6RY+motCvxOzAinUsAQSSzvwikLnBt7cRxaCvEp1+je5bYBm0rcYKjPQ
	GIZqayddhDCoF9Ie/tc29XJjca+UGj307P3t5Bd7LkZoZFDS6BXZPlWCjazP28Ou
	3A48tk9Ww/7BHfXUNUsOBqc9ApUXBaYq5IKpXAZNH2T2bcafVO+YwMGtUnROquu+
	wvV+jMRA7N+n7xaFqo6qRfhrvjmnROvtc8+E4MzDA9iCkI/8zwPqBtw3Zdeh1PC1
	xvZtz3dV4aCPyB992m5VmwJNYVPpVdrscVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehuq5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:38:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338c215ed2so32504721cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263101; x=1793867901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s+T48ubUc=;
        b=ITFYQ793s+0dz3nJk5+df4Gi90zTfxDmacAVTjkCjyYFlqfNDd+eLSpH8+uLkJr5O5
         ih94xHFNAgeanh0JKMAvwaaBE/SHWKTibQiPIuPX58joe/S87gmyMegOA6400UQHgl/1
         VPFM9s/gOmIIxOgZrCl0eCpn9hPYh8Zuhrc7U4sAEa7XlSS3gYwjeIOYOG1SjSKeaIS9
         /f5AHftLs4cbq6MgYmaiGJ/1klc68ParxxnVx1+vJAVGAhSGS2+9wjdJHO0rTvYbKAlU
         5DFl4fqyU6W+IneOYDlvlqhmKyRdjf3ikZbCJq4sKPYlHUcECsuf4H7fkSOG5pvm2iNL
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263101; x=1793867901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s+T48ubUc=;
        b=SoEOsJdh14OewT8N9RTGciSMD3VBhxrvqVGsTNsrxBE5wcQRKUcGPV/GDMRICxM5t/
         EudrO1MrVVEZongBiIRgKiFEU7K9o8O54Tv5aGAJKRfAwkKnGDYOyak2qwtXJh/COooO
         ACD5MU1tAJCaOV3QGGkvsuoMOjEY8ZvYb0HTat4jS8wpGoQ1SDSbRZj0kwKQR4CU/prB
         dKQST10b4z+0aYtI4CuWoOhlqOclpmzMzxvfifO1OKgsssAGUCOsOnFm5pphitN8YVZz
         +7iQeC4i40T5lqgsZ/2JkOW3+ntP7AoKZei4nU4O3SEb+qwpXi7ZI+WZlAuHKD5P8/D9
         P+UA==
X-Forwarded-Encrypted: i=1; AKwUvBzToo2Ky44r4HdjIFrJlCc77MWOn+RQJqoykyxWEXjFtZD+sOjq9ZfQYjfoeUOI5j7t4tbKqn3YC1px+5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB/iKk8TRw0/Ru7dwx/SZZrWA1iwytlkS0nonmw/aRw1VmhImZ
	vEZqUXBHtqeaAB1scWImIO6HxfsOVXr9Uyag9YYVdisG4T+X8zRgZsNJP64AdgijizjyXSWv1ok
	JKwoYEd9P2U/3iInlDbPTfiVrN32L5BFI4vvZjWZPLa4LckIbqSzgvDqcyrG9NJcg3t0=
X-Gm-Gg: AYBFou0/kGXZAfHquNI+5I2/d49sAB2d5xWDt5IgV9fBSSie3eNhHmexPDpRuiWE+mj
	73aV5JcAk7WzfTCFEQvo7s4NY1hAYIinP11ZzNPB+Csu+wADQz495lX52pYxHipEkAdocywOWm1
	IJ/M9JechQRWxeDB+Vircs8yrRTJirLY0uDA7kRYna4Egfosz/tXnOQ2swI+k7urZTH7y47dkqH
	BW+29YR/Gsde1CBIiGm6EMrgF267gjPPeQvoIsJmDPKEsERTFBhwof8Uo2AHNXk37X+gotClZn0
	6FYDL/XUzftOEzsRxJF0CehPsA2lornPsK+zGCK3yjSBrsUrJs0HX/qeVGv8ngIuhlV3bn3pHqK
	yqTza68MEiFaMBNx1ATtc/qBvt8hatigl2TX53Bksd00Aq5KJOGu8HD/ZyHkRuQ==
X-Received: by 2002:a05:622a:13cb:b0:535:bfc:329 with SMTP id d75a77b69052e-53fcc9c1a8cmr79181511cf.61.1793263101187;
        Thu, 29 Oct 2026 01:38:21 -0700 (PDT)
X-Received: by 2002:a05:622a:13cb:b0:535:bfc:329 with SMTP id d75a77b69052e-53fcc9c1a8cmr79181181cf.61.1793263100577;
        Thu, 29 Oct 2026 01:38:20 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm74803635e9.2.2026.10.29.01.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:38:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: leds: ti,lm36922: Correct filename to match convention
Date: Thu, 29 Oct 2026 09:38:12 +0100
Message-ID: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=d6Jp+0RIHBCNlV6gtgrKIkhG26wE4IX5xBW5hZVHTBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq4wXzWhkJsZYHBOCylT4pXM3rS8M00JmhjiYIN
 5k690VVTXqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauMF8wAKCRDBN2bmhouD
 15LyD/9ltaVg1EUjpFcEb/437yVxGxymBcAUnF5XFesq4P9G1f1NTbheRv/QRPJfv7tft0Ly0fB
 0z/wBmrXN/fzJpTZBCtqQuWg+SBFZaO9LfjviIlu5zzzU8u4Oy7k0wUGWJDpBe9mjT6wNur8mTv
 xDCmOJcY3zsqTe4rYVR728SmKZBx44kwQRgUQnuAIlPA8Zd6j0o1qnSBCeLfPyJ442GQotyUo8l
 uF5ZUFGN/s5wCA8UWBHyIWW/wbGg/RoGQ6zFGOYgh8HlJOO5yNc7s32uWAJ2qKbx+S2VnW+bv2k
 mZCSjutDZg9M9srxFkkpy3mtW7LSUhtTWI46fqr4g695oX2fmNJao1YagHkLxc3743zUaiEqsWi
 Rwfxf8G98ArIu/IK4K+L5Rzp15VWLt7W54pUVY3I+Gnp4fjiofYqZ9SFo6b7ZS1LCvc+0OQXIb9
 rn1gM0RsOA+2tBwpfHKW/PU/dA2A4RLi76ur1YUWVyJuEM6Yrh8SxA65NeewyhKMLvwANuzfq5b
 prx2LzQBAxbtwS0kKYVlbnS6ishcGSBgqdRHPt2NOJmZq15H9D7+oxseZWpWcGDPib+1BPCR5FT
 4nYdM2YE0QruPkRdwAosHCrlaD8AAC+AA4fGeks6jd9UjHBudmGAkZEDEfTkcErxSb8QVkPZT79 8wo2zHzfN5e5+5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NXHMjTwwBAYOlAhFo_ySRp0u840F3gOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXwV9UwRgcGNOC
 CGkCFew2pdg3b0z5B+Z3/TcbOQVocF4ba+/wnhBJid7Ix6ZW+9OV1bSY1nOVrOi8Zgq0q+LqZAo
 fgGUvADppC9S+V8XROuDQADdarj+3HgIdXS2hi3sGdw28JSHOUEWcstD2faY5gSsLU6qWip3Hlf
 uqoH+OU8SdlCGS4dZlYsuu179LDP730DEafmJ11YhXIdDWQQvxSZT7+z5mm9v2xdpm6zUuKEfYj
 xIN+pmfLlobSnaRXwQgwcQEBkmEZ9jdEpNjCR3V7BFk1oIM5iCsygvKFhojEUfbuDMcaY3D8JZx
 8YUkQZk5VIedVeAdZkBjOoTiXFPFP683OQnTXt6GWhEz1qRIPePjnt2Ta4fIbc20m64rnWl9Hfo
 Q+OsW8+EEL7JiLrLuP4L2twsrI60SEqchLEPYTAvWrG6UmmGW6DtqeTPG4H5iN2pvVbzfKND8kC
 vZQh9j0MZ3h1ccJf1Tw==
X-Proofpoint-GUID: NXHMjTwwBAYOlAhFo_ySRp0u840F3gOt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX2ll6GHUjiEBS
 urtQaQkBBnX23PN6Uh/KwlzmiZOsC91mJlQvSBi8hUQL8JslWI/Aw8tz4z7lIHlSfCOnYp32+Qn
 OhDmspaT71AC2OB026gqODHYYrFtlpk=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae305fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=gbLkFptvmrSoAGgJOCQA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

Convention is to name binding files by one of the compatibles, so fix
the typo in the name: '.' -> ','.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

There is no maintainers entry to update after rename.
---
 .../bindings/leds/{ti.lm36922.yaml => ti,lm36922.yaml}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/leds/{ti.lm36922.yaml => ti,lm36922.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b/Documentation/devicetree/bindings/leds/ti,lm36922.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/leds/ti.lm36922.yaml
rename to Documentation/devicetree/bindings/leds/ti,lm36922.yaml
index 8ffbc6b785a3..1c267e549a44 100644
--- a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
+++ b/Documentation/devicetree/bindings/leds/ti,lm36922.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
+$id: http://devicetree.org/schemas/leds/ti,lm36922.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments - LM3692x Highly Efficient White LED Driver
-- 
2.53.0

