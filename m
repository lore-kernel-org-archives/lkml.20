Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30535439F63
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121988; cv=none; b=myRpzkWg66C17MkQMR0T62kxiVDOGuxHRtTWamkVNMOizD5D7PFaJ6aP2Nla8cyz/BK2FfjB0lSFZIzB4Ok0KTumZTe1n1WIFNqJleOOEkGtD+I+D7wX2Qp7jzQBnsjWiNaCMI92JV3zKun94fb1oCTd6E/QyJ9eoeuoJCxjAZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121988; c=relaxed/simple;
	bh=4/bxEzNRfD38kLZUAytlEAXN2P69ZTTdcIuMy3hnWPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOqkEtmaPMJAJPT7346lM2YqPBq/6VqzY0W3sMW8Iv9NpCw4WqfOcIaFg+8cJZ6Z294W1pVPgCmM53/IHuA7h3/aSu4bUV8ZmGo97nesUofd+lNAzdsAlGvL0Qfm597Cmir5SI/gR5u5zGFj1Y5Y/S0n7AkGV8KtDeCNH1HoU+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biwMUC8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGJtyJME; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biwMUC8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGJtyJME"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kwPc3514011
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=; b=biwMUC8cA8y+maYg
	7EOnL2pVW+J1P7WYDxvjL+cmoIbOEQM1/k7on3RAnR1fkxXUqbPkDpUFEymm0MaP
	e/igzEvJ3fPjVyrwa/SAOJBFZ5kX92ibqQl0csc6rYEjMgdiuPGJw32s77dYciuL
	gevYXpQ/8w+DBygNQ5XNMBzU0399wwZWURYdVsIT3/omJXQw6XO9d0B5UKoWsbJ5
	yxm/l82xyWn/kGsEZ7R7a1I2fijEGpbW+7kdglnuj/RW65M+Qd3B6JpHYgaqBMLK
	nQwX9+5DB6q3wmypzP1O6DRr7miMs19kF+8J/4kYY9guyKLkTuvDDa7KbWi+YKQu
	SX6yDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd514y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so124276185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121984; x=1789726784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=;
        b=cGJtyJMEwhlP2dr2NlTc/qtN9HutS/Lr9IC6pq7LNSjjNAGPp0RehExu9EXY1I6Z21
         k4i5NfI6i2JiDyBEYpjvtPUSo1ogzJGZfssMKWNzIEZGbO8BechuXAVh/cgeLq5QmYwS
         ZMdiLdtIsjcS/TaXc1lFC6cBANWveuJyzkw9KYnsEP7BTd8cldyDMxUbXEbPzEXjNHtG
         KJ9eg/KeCyFJmUO/LlMD5KbvVl+PmiTqSZlfNagYQPdVqxewYsTF7TU4D4A4HsQ5Ymey
         cXQWqkkh/AqcbE5A6majonWGGWCNB98+n/PwF/dt4skiSsu7yihgYlMN3PsHEjgNYLjk
         TmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121984; x=1789726784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=;
        b=esazaVYOCBN9+s2PCwn4ZOSqa8KlBH1+mb4pXYQtQmAZOHM7eCzcYup6JRadq4nSb4
         r20HvWWnRhIGa2Emx3jg/Ucup845GnbtRDXTf4WEWYiBuy09XMEm7vrl/XIR1uDKoZ4t
         WKAAQjYkESJJeds/ghWRYSpXaMmXq4yIn6O4hlt6Ea7It3odnYmWDXGF+C7LxiwXIO2l
         96c4CM6PRQxtpdyRqBgkQYex2e4qog5gf9O8V4jpiQ+qaf+ZjqC5jW9+6zPcLoc06Oot
         UlEnsiunoANzMk11soci58P5QEvTqVlcehIEo6J6w3GkQSIDdreDwTQG2/4VjAEeeik2
         pt2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2y3Q+V6ii//0NDdws8+TYoWZGbXVwhtcvtsntYuZw8lTHxMrPbY8QBCf67j8ufh2P/HcVQnF+CBl3Bgc=@vger.kernel.org
X-Gm-Message-State: AFuF++nablfq6tmA8WUd7WPjPpcsWdFA6rWvOAJhu/p0LWqP99V3+UOd
	p8iapcyvdpaaDaV0quJ/A9yTMhL4OxAyxr6xH+l39HzqkmCkD6ju9VtgIgFgszEVHVyeAWjDI8O
	Oeiez9+pBR/cm59IdsdyV7VbxEHXD8wRv4ZRVb8fS6VyDprw4xYPVFDpdPIGSza2PUoM=
X-Gm-Gg: AYBFou3LLojTEAtU9Y7ST/gozp2Iko/V0h3FCnlFt9rNAaTMrRS5peEH9b5GMD88pZu
	n6mCrHT5lEFZZMxH8m27z3NYP8fvcXYnGowk6Bh1NV+IBu1vr7fb2jQxIuR/vIljuYcOjOK6ZnS
	ffIg3Kf1TjUQMglWMfGOmwGzrhdssrkNcQxWs3Ygsru3Pana515mY7nXPDotHpB8nwsbRifVFrE
	uOl7dr2vRoR83jg5OLnF8KcBmIPGcJ+PPLtw+uvFjJues1k41VHx42EhJNnTwueoW8zF90f11ZG
	ra2+bRYwW3TL2F/Eso2V9el6Z+0RTwOi7XJHc0vAL4PjJCBcpjCCnsVv0rOM1gc1iFEoV/oscM6
	OoNc4yqisBO+ZKP1zYb5A894=
X-Received: by 2002:a05:620a:258a:b0:92e:76a1:96cd with SMTP id af79cd13be357-939ea116ba1mr437143585a.13.1789121984490;
        Fri, 11 Sep 2026 03:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:258a:b0:92e:76a1:96cd with SMTP id af79cd13be357-939ea116ba1mr437138185a.13.1789121983950;
        Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:13 +0200
Subject: [PATCH RFT 05/10] arm64: dts: exynos2200-g0s: Drop chosen
 address/size cells
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-5-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4/bxEzNRfD38kLZUAytlEAXN2P69ZTTdcIuMy3hnWPg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WrRHGJwXN8rCf4lNv6t7xS13waOOMkDbARd
 KPipdvvIOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1yEZD/460+dzCxjLoRp6UE/QsKNYguHwHVVllIEInUBQ8EOFFnSMwv3wMcwtoOs4dBMxzj1ZFPG
 kPnXv5dZd/GPaSD2Iym401ZzNF15LVL+SIudgO4F5T9UP6J1WOvw6G8MW6ILfRnz7xjAzXLrYNN
 ekCtBV17gywgwUlQTa8+8bktbBvrGPw9zeukiYhSXh5CN1+wHZYxxIZgQ9WqA5xQNKrVA+f8/8F
 cDJIMe/IZvMhXVspuQtMZ4kN9QPAieFUZa9EY7LqaVbP5nDbNi6NpINPk5lh3L2g8J02O2PV5Oo
 /DycinCNcUr1d4i/vPhBAemlS1luqAxPjEKL9BKnB2mMs2H9knhCVMdPMUYus6AFpMYP+lPYvv2
 QS0sHZkLh9y2HKB9la+4xH37QhM//48BcQ7hM7Jjs9K2fNUEV/YCzGgbg4TXliYtKe47t9cygld
 X3+gLhLjhFp2Ra88yj9hD6V3bU/3pgTYwuvn04SEW9p7lYYDC/v9OqkrjKOYxgOpCHFsnQ62BG9
 ROjS99tla4pqG54rk5xtf9HydTQ5aORDi63MGavKUCV699MoqnM+mL1R8/5xznKpmnoyyGtldSP
 DpsQOk/LIDAgRx9HFebFJTGSm9NKEn9jiAz9z/0G0KHjzhw3kgVVG1d9QmGLRvz/8a5TGXXNxiB
 TwuJAwUvBVhA3OQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: OpF6cIZyR-FFjRqA0RJJsMtig-67hrqs
X-Proofpoint-ORIG-GUID: OpF6cIZyR-FFjRqA0RJJsMtig-67hrqs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX/yvQ083kjZJb
 Oc1GHJKd/CNe7VDO2afb5H0TTjqz3wokpux9dZCaxVIaDuwDX+giKSFTJp/KtMXJ+gZR4WSIAgv
 plMTOV9jgvFx4ZLvNtMjSKW9ronKu0k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXzO33MELRuqs4
 f6A9n07/pI4TqpxrDEGAhbRjLGFc8MzpQlwHEpcGUXM+QTC5oVuS0BYimKSXBcYpE9nBH/uLQuP
 x6pJb5tPFxFGhoIrXDpOUv6dpZHlLnSSCmHHk09M1c3HP6M+w4+PBOwVnMyhvf994WU5CU98d8p
 3zsjpcM58gUBtGwtSzMDLwJFxSithsvB1z65JcTGnkUOV+WAcap7awNEcHVrXoqL2VIVjRSIIXJ
 iYDPegJmmbBk4t/Y9pnEbMByjPaIPvy4Dt8rmOugrX9GqsGEZGJYksoF5zRtRw9Wptmh/6AENGB
 purZ+HNMK2Tg5JATE7zV3ZaP8el3RyVNzFq0qNtyh0SSCenbhD6CYIdOBfR0c1yuXWku6J9wv+v
 WT8t9aCJz97YlnuTMyui+ZCne6SxxTK2b0rAi3J0+S8Rg3u03lBps4/8stEiuBnJ2O6DU5dGxuj
 9bS31lN+Xk+4ii89eCw==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3d5c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hDLO0aQh0UWOkkj0oRgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

The only child of chosen node - framebuffer - comes without reg and unit
address, thus address/size-cells and ranges are not necessary.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 458f1bc6f5d0..3687bbaadce7 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -17,10 +17,6 @@ / {
 	chassis-type = "handset";
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;

-- 
2.53.0

