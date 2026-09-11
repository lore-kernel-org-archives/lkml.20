Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24A418340
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121993; cv=none; b=uCO37T34/KaUSzfa5rritWyxSLCGiyCI5+NCRRS9sWjZrykVkBJdNtzs5ylYpVD89xRJrbul5bNGbPebAMRTJ7jfJm7qkifPOwyBQE1E4QWb5OJ3Hdk2qxAw/+YE0awDQNVI3QmJZLTun3X7DKx5Exs2i33vYwz1wmJb/yTtXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121993; c=relaxed/simple;
	bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X02uR98kbTMac9ZvZBSYLNJ/jUcY/xCmR8vS/9h5nv+zs7PIq9QTIHgDGeKHmUfnrfjcyNumMV0rYR/aHEvB7tLZZt/bKyEwcaVTtodlxsDccBJqv4Vu2NdaUvTZ7WCqAzQ4cExcHiJUBmd/zHj/9JZw0wcs6k32vU63lVzBKzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGrHmxuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awgza2yo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGrHmxuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awgza2yo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfAi3844952
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=; b=mGrHmxuZgXMkVtCi
	8DlMRKIh6kDJfzNgMkAUsAqMAHbuJTVOX6PD1ei2I2S1vuBAMmPgDM8XwEj7tePo
	upaxFnyDlMp1opOpejlbuW6qZGz6TMpCcxLirPwkKnkvPy7bk2NIU8c6UAa1ciyO
	l3aDWtsiOpAZCAjWNZMusuBA/49fjWixQbQyVkskoOXFDuEVKRLCHfd9S+9e1MK9
	qh+DntA7aE73/EXhN+Z+tYMEWu+sYf53Sj36LsebF/2n0YNEQ8lyy6IaJTrT0BV+
	gWIYXicRPID8ddkTTPkbpJh5lGGliJ/JjWgCE+HIijbldBuLjiArO+uIvbZfo8MH
	P5FIGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q42cqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so63180985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121987; x=1789726787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=awgza2yoUQLddkv00NTCAaZNDVXzPuAjMH6sC9Uz3H1VioiaAKBwgj5BHS4fUK3590
         1vJ/v/jZOLHbArqT4zqA7qohTClEj8+hsnHWb06og1wvn6ST37SV4Z+82DTYFHfpC+vU
         uanmuNdjSvRgaAy0b8NFMEL3FBD35yHxA6ILdURkIRo1y+xdvjvnt4XFQJ7s5e4UV8ml
         h2Toxp7IM2HgAGHdBu2BivtKiZVMhchgdSHmQrz1mRaNTuNbaRk9hOI5sY4HBPAG3xEI
         30iWvqAxSiVvoxI/ACEPpnmVoPsXEfA+TjDXGxzp3O+Pde1ip+uw/TF/6noaGRw13KVz
         ylcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121987; x=1789726787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E73bc94ffTuq70m69c9VvSOLnrmjSy3jB0QpLQgdU1Y=;
        b=RysdzaGdLOROM0l2t2DFdPxcNrbTafp+Ya23Eqa8mPjZ/xXPNcBYlaSRKHB3OGh4Uq
         jre4tnzEjodZosGTbzfvgW9L05vaAS5/Dg0qQhJx6XModtyCoNdxGrhq6j68ZguG/lGI
         gwS9OgX9ekCHrXF/Ki3AI0t945KxO39t6UjHVKwCAczMBkE7hV8o3gy5+Z+jnMzQrySR
         IUsx22VM+CfpPFxk+f0cSLRASDRhAkrAbo1DGpRSkhpAEn4VbVCwFe1w0fIo04ycFQlY
         QkJrc7l96X/v6fggqaJ2b9hNQE1eraYVvH7yxZUw6oRk9Pjsj8sKlXZa2IWQvZvrdPmf
         ze2A==
X-Forwarded-Encrypted: i=1; AKwUvBw8EnV72465RbXL2qDLzWj7BDqox5uIcvNx5YI62nK2fJqwyaC9IrANFmlhsn9N//Eer9qNs0lFZpVKnXo=@vger.kernel.org
X-Gm-Message-State: AFuF++npiFbH3Fog9NAo88z8+qRAlFq3lzAQAPlWkMI/JA/k/yZhTbTw
	r7+LM78GHuMF8Iyfd1laRq2NiqU7k0ejzvU0FADT/rFhJjtsssK6Z4hnHPP9PzLixYKkHQeSB2K
	+5wR0L0+Xj318rGSPJ5pJGeMFPSIuHCRKPzJWMiP9nxrljIEe21tHUbcfxAdKBJqf3iM=
X-Gm-Gg: AYBFou3TZzmcvW8y7HDCBxSTIPJ015pTYonZjYUyDHEDzbs2KMiO7xViJoDvy075sTs
	eFDem1IpEeE5JdSGz8E32abtiiCKrR9/GRkCRm/aTQl/FxtrtrWAju5RLAw9HkvBNhTGA+r9kUl
	lQdBClRFYsPasG/s/Cs3czF8hDIQApM7PTuWqjw7D5r+3MRfj8wwNbm+VwI3g/b5Fc4ouoNDxXe
	biDjeHICQ1ToilAs0UNkU+4UZUjomtDWYYo+B9JEx33rJG/Qgs2CYaLcNs2EydyJ9F/qQiw9R8D
	pCSzNoJVZ9m7zHGi/Ois8XRBf3hkE3+WjkMArGjDGZh6dMcfyYKp4DS2UU3kwxafRHG/H76BR6O
	RrJhTv8pj7a5lYNg8b9RZZsg=
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438846485a.4.1789121986420;
        Fri, 11 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:939:6cd9:1fa3 with SMTP id af79cd13be357-939ea0e6c84mr438839985a.4.1789121985851;
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:14 +0200
Subject: [PATCH 06/10] arm64: dts: exynos2200-g0s: Re-order properties to
 match coding style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-6-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vco5czYvy8Dqq8yCRPA7S19Gw3sKCZ5D1fpl0hI6ESk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wr3HcGmsAwVxD0+CL0kWH34cqmPGClsJVqn
 IvuKMIV2mOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1wU9EACWsjwmfkQv7ieRcIAag7lPpS5DcrTqm4TRiK2v8XxLoZt8D12U6YK+Z+cXJTI0W8QTphY
 czKOWH7V/JYVgmBpA1GP0As60ahUJ09ezo9KINsAwGz1ndkD2OK4vPmSA7hhWNtJQBmFZ6x+O03
 Hf1EZKtee/BrR4uEAxY83KMA8IeEev5sXD95EGdTwj/vsn2C5KfKMIi1zwDI/13mK42lh/KjcLH
 +1zx5UexwYXulkzG3DbQxLC0Bt3A70KKSttynvc/dUiqRYDqipMRYc83xwiQ0FJnEGyBCEM34FX
 OvFJ46MGpWwDVxo2uQAQFoEHOyeNre8nHY0hI8noRC0qJpsGR/4nNehsXPaL80RVSx93c14yAFs
 9mXgFMRrfRkvLBUUSUuF1Rsi8tqoa6Z8f3wtD1ovE0xeVz7gqLqaKWZ3IGP+lNACKsCtFbLjYQ7
 NAfjXPbRPLz/3pWOezTZkP72wHSgzjWuSpRL+Xh7e7iGeSc+OiQmYbG+NlbQjSBpm6CRbCQQ31w
 nwmnKaDaVAkEhvR9u/tZgOJevrFcYMCZUeT17hRQTBKiNYaXuJWvYFSAYR80FT+Qb8VmxdEHmO9
 L/S4sHaQh/Ahbht7OrfrWfE0EGjWQNED0MH2jz8sHGqKUZ3CTRsRREZ0hLtYTSZm9PPEVUpZJmY
 913o/nlTqWv0/xQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: x1b6OLg8MHOEBjNVEfXCsGo74HhEdNe3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX3SjdVz1bqNtY
 VolJp95qFMQB4yGM63mVozSxF+MUGKfriHC8k/qtCZeyyiQPPkBf/HxX/7fuAn28IVGKEXs8qVn
 DLDzu2EcwWUmTmJ3JtvFP+shl3JNDDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXzVXUNKNDKb11
 fca8eRmG0yjdV/LyTWmdSlPSUDIk3HRMK5nwwMwPXmIBs3yiehLNPR4qjWklr9Rriv9WwAN5fd5
 9QaauzUV258S1U0PSg9BwKSbolFsQ9wAi970Dde5I02qXnJQ626X9zQb5BPQd6kXiHzV8sqrxuX
 sYuFg6DlQifro4KDRcBJNiuvO9TrAJDImrlXrukEuJsxTaC7Uuo5XJnY2UJd8kb9WEX8IMM25g3
 2lJwI2jPetqVKQ1YQO/a9JFoN+7eiOCu1fvua2PypP6aj2okGEgnZBaUbL00K958Q/T/Nh2ACRM
 IhbWm8j/wCi+FGH3CfnfIv9DkjzuaTGkr3R7K4efBt9zQdOuXNi5Efs63QEVn0NWZGhyiVZ7utP
 fiXLFemZxFhwDMFb4DpAwsFSbIoPrgVhpdsWix7kvnCbczdijWXUr/POw0y73pznSFLG9vKm8rV
 1SEpk2g2vFpyuHDerJA==
X-Proofpoint-ORIG-GUID: x1b6OLg8MHOEBjNVEfXCsGo74HhEdNe3
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3d5c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=webegsIPGkF9SanNryMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110143

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos2200-g0s.dts:72: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 3687bbaadce7..30772bf77252 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -48,9 +48,9 @@ gpio-keys {
 
 		volup-key {
 			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&gpa3 0 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
@@ -67,9 +67,9 @@ reg_dummy: regulator-0 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		cont_splash_mem: framebuffer@f6200000 {
 			reg = <0x0 0xf6200000 0x0 (1080 * 2340 * 4)>;

-- 
2.53.0

