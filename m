Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373665;
	b=3qzSfzDkQXBxBejwNxJiO45Fm2tn0z7gk5kpdmdGHM0Tun/E4kiBZb34Qt9jLpYLMTJz
	 SWS5ilAv4/v2nnhH6TSerqrH7ZfdfqMEkzVvdnmEBjRKMlIQdJlJGYjgfSw/TgipcHrD1
	 wOd73u5V7E4MJ0+IVW13bYy3BHND5+t2bCa9RbAS/zzRra27Y5u5Pl2Iv3gzPltK2BVgt
	 qQPaqx9XGbghDwcaj5r8z5pe3ZMlFB/cAgr/jNL/ySUwb5Ky8MKsHWY69eYj38IM8maJa
	 t4tCAv3HfNBLFGg3hyr3//bRr7MyZp7lA95+sW1KpgzOL4cPPbA1wGTgS2r75R/7vCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK07HTPMYsE=;
	b=DWz20vL1/m/9SozBtj37XnPX2d3+LKWnPA8AepDlIj2j+gRWbPHzJC15bFsnvOt8RY1P
	 gpixyzReiwYbGW1J63QSabGjrjBU79n2j+r+uMQ7AD7RjtyrE5XfMiqM7dySm3m8bttZl
	 S0jPNsDe3WCs7Pjmp/xvSNIjEq6t6TNVWf/GfdP832FnO8NkeUNRBc6H0ir4iSq4dyWEa
	 w/g01QcHgQzNIGiwsYfUXc6OMNRNx+ncjEovPGfJMH06IbCu9lIL6ZhBhLNNyxWvu5G/T
	 NUe30ok47eMeyIO5QboH3uUSH7gk4mwhh20JZluqRFxRUN609PS41Ef5IGlsNrrL4pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is2eDw+o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=beciiupL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3255606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3255606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is2eDw+o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=beciiupL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERBWr2494578
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK0
	7HTPMYsE=; b=is2eDw+o/drrlO8mUmPy9wbZBprfadno4l/KkKbuwNKOMSLMQL2
	eIAc6ypR9D9asIhA/MUElCmHTHmdS0z61YvQ10i9A5ty03s+afRnJSWHqm3J+kaZ
	rZvOZhPpdF7sAneV7bhoP5gE+vxoVaEYL1VC/Y5FLMrtqHUAiza/+Gn5BUNf3Xxq
	LM4va1ttWB8lyfQSOZPhc19iBk5nMrcJYiXiNaiE75WnRJt6yVoINEkI0k8WYsUm
	JNFrcB8failP3+8V/oOb/L0q13jzK8GVtBCQ/DipJGgamreuxGesgCGFXIHwjGa9
	o42OUof0IhQU7frDkD4NkfRmUfGxf9AgxdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3s5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:21:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso172937585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373663; x=1793978463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK07HTPMYsE=;
        b=beciiupLGg14b9ZIRn00pwmpENqmROfqjZMBenarothwqIJr3PB4ebKq3f8BY9PsRC
         ylPcbeAotfvLHAwIqUb+S/FdHBp3++jU4IbnbDKgfUCCB6X5cGmjF+qrGCeom8VAkne+
         Nuw6Fy42eusp7mGIla9CJHKsImuJIeleZ6IkW9jsBc9kIeai4M0SeVLXVRCxjWAfLfOo
         udP4k8ArWIeBLhsflOSXNo9MwKdXfz351wrFIXwFWYlW6cJppQ0WIojH2DCjUFvKb1lq
         ikfEMkIhRWRRMyep4Gi9KBSgrhxTvUWFJkb9BFwMLtlENVq6CyqLWunzJexjIRsx/P2X
         BXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373663; x=1793978463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK07HTPMYsE=;
        b=fizvWel08SRTi0Pv4j84D8urHx3Lkhm8UcfcDGdocfUBqwrEMlzLCrxY5xhfBtlJ5+
         2A8Rrx3X49Zfd9QIlMZ18sh3F/0CIpbp109DCRexqxwwKqEEaHwxGbqlnmvRKmw4ChSn
         kE/eZxJQkBv8/UqnWuFs+O+Wn+2zzilAUNcgRWpUpxhwOhcWWfNaoIA+XHovXnOhEJeM
         T8T1a8sudTq1SDEqXgwZ9A3T3jXbTq6W1E6qLi5BBEHFgD0l8vz2bMbIoo6e9pfYTrx7
         ojqfMxpBe1Pimb1+YdVrKU2u7jcsDiq0enVfKWKf1APdLe950IU38dEtWOByLt4cACco
         +1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd3ier4y6/WaPOMAk8KNYQbNRWLaRJA66zvX1dftXTA8wgFRBwmTqYxW+kC90y88VLkg/Mo58MvFd1fEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWoE9guqa9OCpscKv/99t/umO3A+W//rDjaghiCAsKATGPio/K
	ZEcd9Bz+zUzXqHBUDS4Xe6SNI5H6sKcxcEUCzu1PZ6XOjrfeTwj4XwViQMSPPn0wRKsuLax0YDZ
	xB2HSkWeOfRY077uuK/pBZgqmUKpR3JFEd1dc1rEF0oiZPP7wxAqQZIxkbj1WCOz9ZkE=
X-Gm-Gg: AYBFou0k7ZR4twtALibWDGO1ScDoI31OwHgFZXAUOTDsyBQFxIdGvN7XvtoLvwAUhA/
	UU15pOqevAH1mjvGw8ly7QGbWoUld4Hr6u//j5RiPQHZOlwsgUvtUl14E92V3/Bx4UP9zgBUycR
	TLQ/HYO8DFHMfj4mShYtUav9VAH1i5siYpGR/v1ROsoSQz0+pkKOzp/HdsaCGdJBwEy5oyfxDC5
	6TwbpEWp0T/sixXR++dfsPMj0J9PFzXg058/jlYCAzAhaLNf1BWCzQDvmR3A95cnYLE/aNlI/QO
	/LHM7/4AHY+ahZDJi4gepC5coY1xpO6iMLAaTyqug1K4auQSrpNSz+OR2DDLQo4HjiwAQkgZBD0
	c/dGA298ozVdkxMTqTLLp7tsVDpPOcVlv1mxacZWZ1+ku8Oby9vjYBfqyj+5Qmw==
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id af79cd13be357-944217439e4mr452270585a.19.1793373662713;
        Fri, 30 Oct 2026 08:21:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id af79cd13be357-944217439e4mr452260885a.19.1793373661793;
        Fri, 30 Oct 2026 08:21:01 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm105732875e9.1.2026.10.30.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:21:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] memory: atmel-ebi: Disable SMC clock on probe failure
Date: Fri, 30 Oct 2026 16:20:56 +0100
Message-ID: <20261030152055.280193-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dWU+lW1XZUsON1uVforDhInBvMK+7M9QnKSnKSK5E9A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LXXvtQhu6R3DuDcLTc1io0pSkK52E7jxYEMj
 PQ9ZI2DgImJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS11wAKCRDBN2bmhouD
 1+ZxD/9cveLk0aYNZU6/ZDm2z8I3ln6xbcr30h+oGeUWaRXMV2v0p22Kq5sQenJIRlqauutDHr/
 h3AS1sAyfz6MY9ddT9T63Xiojw0sFMiI6/w9CP13cCLbSHjpTYfU94joYFi0BOrkhDjEdtj3YWT
 w3nxAyiYJ/Tix3wIH36cPCCHCFkBOoE0uUN/ZgVGhIpfmUq5wfeAxtRijwCSKEuKKwRvm6R3+7s
 UnPgxRkXOntHBwUED5qaIlfAxjKfiCgnptev6qwqD6iHadDv59b0ZtMS4iQwq2ZKczy5O6w1PD3
 xViUFR1U3kfeQGsfoqWxeQDvte3EsS48iDMaA/TBYZkXySl63G0YZhj8GOn9ZrUfsVrgbZctfbd
 zbHyfUvunKEqc2ezEg2jcbgXi7tPzkMAf9UVPffBrXeL54IlyprOt6hbN0M5jOSTBFyqUwq8SnX
 mVyZQ0chCWrnchpEV8klQ1MALoGyJ4BYMft5U4NJeGyjtKjjxEm7U5347a+kUBj1y1jsE9CtqqN
 uvnSJ7wZUZLMA8wnce4Gu0zlVrxxd+gzSb+2Y3re/Ty9BDhu9otY/4ueiqhBPJtQ3mcrNc2Yz6T
 UMdZIzDZGGHwCLFgLSJNbHc93wsOO54s65ukkk1oUiBo1zaSXGkdHa2orqEAXj+ufrH66BxIgM1 aK6SJHObYL+HVWw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXyfTyymChpwvI
 SYPOPXu7PS7o8wQhzHh7UlKM1DgP9AktUecyUgJXvK0MG6Zij5eREeLgrK8v6DAPY3HRgzilL6F
 wfY/2gtlIZhRwXVn1z/k4rm6M+RksCgpi+80jjtdsm0jz4AjNzhKBKceEU/lPJWJWkbSAscgRzR
 DvCFV648d3JkZiyDyc8+TzdbIvV1I9uo0TBKyU9uS8b4cozL0Y9OUSlBmWq7u7RdRoRRk6eO+r+
 311NXJgp6+qn8tsxASnD0dr7MYv8iM2PpFUmvHN1pNcJRiv6mGBp6ASUxFkFq8WsF26lqvYcvf6
 ueNLWTiBgTNpWf8J3i0U4AXkFO1bdgBenTCtvIYQtg9TUL2AyFPMLykGsvlujYlDMwudV7vrJxi
 9AQhzdHfITDJGWbY6oAbvA5pgNhxeflI2XxplRsy4VG5tHUO3Ic/soWoC4uiF3ty5RmIFLnXIt4
 2EHvKbQ3BjuvJcaycZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX/LOyC3MXPRDJ
 1iylQdoOuJDMXKVslI3UHhNyr6Bbw5k1oS910HPcbOrNTtb9DOKdVwfa8QZjtyrJ4j6cBviSSh2
 jO4fX4hSlHKCfECZGPIow92DtpC+c9I=
X-Proofpoint-ORIG-GUID: 54Gz-MXvJf9uzZyZe34aKKogqqLLzByU
X-Proofpoint-GUID: 54Gz-MXvJf9uzZyZe34aKKogqqLLzByU
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4b5df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=BSGzfMJf4aLG5m6vmWAA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

Unprepare and drop the SMC clock reference, if probe fails to avoid
resource leakage e.g. during probe deferral.

There is no remove() callback, presumably on purpose so only error paths
are handled.

Cc: <stable@vger.kernel.org>
Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
Reported-by: Wentao Liang <vulab@iscas.ac.cn>
Closes: https://lore.kernel.org/all/20260917101623.2146392-1-vulab@iscas.ac.cn/
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8e236c81-01b2-4274-a213-11c3f31acfc2
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I independently developed the patch and then checked the queue with
pending work of iscas. That one has issues and other complains from me,
so only credits for report.
---
 drivers/memory/atmel-ebi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..dec2441173ae 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -562,7 +562,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	}
 	ret = clk_prepare_enable(ebi->smc.clk);
 	if (ret)
-		return ret;
+		goto err_put_clk;
 
 	/*
 	 * The sama5d3 does not provide an EBICSA register and thus does need
@@ -572,14 +572,16 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 		ebi->regmap =
 			syscon_regmap_lookup_by_phandle(np,
 							ebi->caps->regmap_name);
-		if (IS_ERR(ebi->regmap))
-			return PTR_ERR(ebi->regmap);
+		if (IS_ERR(ebi->regmap)) {
+			ret = PTR_ERR(ebi->regmap);
+			goto err_disable_clk;
+		}
 	}
 
 	ret = of_property_read_u32(np, "#address-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells = val;
@@ -587,7 +589,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(np, "#size-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells += val;
@@ -603,11 +605,18 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 			ret = atmel_ebi_dev_disable(ebi, child);
 			if (ret)
-				return ret;
+				goto err_disable_clk;
 		}
 	}
 
 	return of_platform_populate(np, NULL, NULL, dev);
+
+err_disable_clk:
+	clk_disable_unprepare(ebi->smc.clk);
+err_put_clk:
+	clk_put(ebi->smc.clk);
+
+	return ret;
 }
 
 static __maybe_unused int atmel_ebi_resume(struct device *dev)
-- 
2.53.0

