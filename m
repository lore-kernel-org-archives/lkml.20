Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805359;
	b=AzkEilYoxUsTgQenS54rhm10uk/OOZtApb+4NoNY0pw9zqUpj4/QLofDcBFTFA/KJABz
	 iWB/bU0alWE+GYcuIRUYXmS4D14YG+hHYE4bI8aNi51SRlkxHYn6seQGRK0qV2YXUeKFW
	 t3VE/xAPLTY2TEWWKGN7Qp7nkzJQ04ljDqHMODSoHC5vJwLoCuX9XjyQNXNJCK8gyXERH
	 x3TNtXyBmJ3QVMIboyd4H+c5Iyp/bsFrbPBSkBJP+ZVy5cchc4gSAG+LMzT3XK+6KeSbY
	 ybrkTfVEhi6MBQKomZ5Kw+WpACB65havVbeYX9eTzGcHj/zQMpyWkmhsNh7VnPfrM4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQDvChBBpA=;
	b=Yp9tz9asz9HXAWJyGap92Fk1Wzu2tOQsQHY0gXl8VFUuTTrnj+Ey1tPc7f8tifZzDdSY
	 jnHd7srrZsHTOAlGJYnxHSgZilBnfSnxJ+jcG/fU6AnYftyQ4GihJUrd9zW2UISkQO6ZD
	 /NwrCKTxNi24hJS6DBmcjKIhy8SufLS3+YcxUsLorcds15ZxrcakwiC7BPiBzdJYEgsyt
	 PsciHrGOPrHqOkTdduL4J80JmtRos20I+L3sr0eRS0lY+MEY4GEhROUzocb6EGRME16il
	 V1Q99gq5Ot4WwsJmL9QwkoSHKQFcGm4T9bhu4indo7k+q2D8UYay4YLmZOrdUGXAiKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAdL1m1e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfq8ha61;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B319B606D802
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B319B606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAdL1m1e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfq8ha61
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4EI1fS3079442
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQ
	DvChBBpA=; b=OAdL1m1e7tCooj9OIt+x9AEFxJzyrptrgoZgFN2MQGDvmN0DNrl
	9Bj4CL+atIm7xLHPuZ6tQwxUp56OjIvQxkZtAWx0cPwU5glV8sRsUmozsumaBaDE
	elAXR64+cPpSfaJYwl07gBBW/YDEv918Kofmh6vmuySFHZUI/aT3ad/MEb3y/R/P
	XmAILFQUDLDXy4MhepYRJ69aCu6cMNKRlg3Q1Nmio+WQHeT8LMdx/YFu6ExqbtCN
	53Rdy7er9VllNRakLdlrmNHfMu2oK5iRXHNMksBpQneqg9MTAZolSxfzSvpqElo0
	h9AMmVEsoEumxZ3s01LiOmDVuMHCSOkkEfA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bng6xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:15:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so247069137.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793805357; x=1794410157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQDvChBBpA=;
        b=kfq8ha61gHAX7duIP113CuxamEm8AMZVPDeSfwjcQmC1DYIrBBQr1I5FfS4Nwo4+fO
         AcGYF+uhtyeaUbbWL/ZkGWARffVs1bC/ZCRaO69GK2vEnSrpKWPG4dZVpnMYBjLW+VFs
         c/htu2wn1Af1IJGsQMq12OjbK+0PscbCwCb6luE0Aaf3KBn1Zm+muBnWEm+bwWYd3zwP
         tVK30bNhJieAw8DjJhc2T745cXzDFTiyBLPJXx9kWOfrZeJgqq1FHfn0C/sPYfvOQBIV
         VbN72GQunqVxuLNHneRek4gVQinH3HLt1yJoCvheanXtZc+hhcxTebshZXgjPn6VnSEQ
         nF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805357; x=1794410157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQDvChBBpA=;
        b=wdcQ/BafeIXm1EhC2rO8hizG69o8Lefrq/dUrqfZdwxOZeK2iKJn25IxEz2G8N1s5/
         7isXG406ln8x0i5C9Q3FjSbMRKoSZQsi/upvoi20cXCUDL7NCnDz4NUk0FmxeWmiS609
         zCgpkbliLDxNXaIYMvKIE2sb5bxh4ERL1H/M1l7iZzVgfeMxmOSnsnDONjhDSyYfD75G
         mJF5gU3NdwHOYETR7917Q3NgREGG1dW4DD+Q93bPd+sEs6yJn5osga+TiikRB0TFjlbR
         VJYYEieWPCSjkPnFoe34kB6gjKP7WhzTlTBcyFscoPu3TLW9oMP5TAed25mIQp7OfmP3
         ptuA==
X-Forwarded-Encrypted: i=1; AKwUvBz1W1Wvzu/Ie8hx3INlU47EZx0v6YjsTJiISegLMLKysMdIDybU2xzIPL0Xr5o537clkmEWjQ0pfOBtWt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HYiGIUX0EKnpg3YT9AHG9AtWtjWdlCBakABYcTngKXksP+JEF
	LifivRttOqzOMXeVdr6Sd6nOZFs0QvCstQh7CBgK796fWULeuSHI1v+zRC85ywUvM0Bbxdz2dja
	9GIvH1ImCqsCm+DAweBF7Six5H7BbLBivrEQXZFGMsUVnzjOm5R7hmRJiRD2FMsuHwH6OhULspz
	E=
X-Gm-Gg: AYBFou3ET9xJNGw7woVIOPjwbb64gUa48CfTdJOXE3ipwag1kWY9bopsDu6993GweXj
	X8q1T0oK8aXeoDd+sdlu2M4z5TUOYq9Sr66wh/qFwVd8npVQbvev4hOGr1qOXHHCUxt4T95fY4v
	abAaHogKNECENH9byM0gdVBNDsvNnPJdWEFhmH7Y4XdZvkUT5l4Le0ObnI+Mt3IvdJMrXDcF17V
	NgCsY3VJxgrux7/eZboODPsAZKGCF585Ytd/9uJ+DJVh2XV3EsLLd+pbjtMdRg1VZEh15hU/ueO
	2wLuOotYAcql2yuOOQjeZm8pB08Q0tA7Zk8wEGm9ovnesandLvbbKobflWiCbbV00WWc30sk/Na
	9VvUjzV11hkh76zHb5je+S+6VqG7w9X0wxOmi4n1SiACYzKHjWvWTYSwnavRAFg==
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d072baa450mr5990199137.10.1793805356669;
        Wed, 04 Nov 2026 07:15:56 -0800 (PST)
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d072baa450mr5990167137.10.1793805356115;
        Wed, 04 Nov 2026 07:15:56 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm134321875e9.7.2026.11.04.07.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] soc: qcom: cmd-db: Fix probe race with possible ERR_PTR dereference
Date: Wed,  4 Nov 2026 16:15:51 +0100
Message-ID: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2576; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=MQcMMyIyhWEipHgYUA1kmj8xFsF8tkr+QmI4/dQ61uY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60wmqGr0SYcw4CYMyCDyvzNLSYOvICMFjA769
 ULwEeTog2+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautMJgAKCRDBN2bmhouD
 16yXEACN0xBTQvk/FRE3tbvCH0kH/685JGYvunRPpT2wvdtFYO5XSeN+Xs4Tl5HrK2PMxablDto
 Vij0+JWKhHHFj5dd9NGKsv0QiGKicflwC1LCvZhIMfxp90vNSGzk3osxhgiEQH9kKVfDPDO19pU
 5c+wILTIwz74I9Kx7NLginJl+YouQDyox+V63KpWodhh1dTZGjdHKjVfeEZouMj2uG5e2lYUlzT
 luBZcOt7Id4567asZwXC2LXBQoinUAV9lfTKst0Cgmi8dSPhmw2NBL2nPS3YQmpkPoDwpaLP+6B
 UwGjfT3vC5Yp1uL63Kz4IprIDKScp2MHEHYkSSrh1Mbn7HF0/sXnvH45IW/dnoNBSbDR5DEmlXf
 3KDlwduhrxGuEt1iIQPF5fYMGjEeVUGxQKoptGYb9+WGUQ925xWsW7SRHsMz6xBz0HuQobadecO
 MRsSHLathQ9vk2LWTpVQzFTeqPPlQ1GiMydMXhS1kTPpBwR8N5z/Ya/+EyGznDjDwzSbf0aC9Bm
 rXYV8dwKHg0yYrkGQTICpeNMkFRwTXSx5xg39my6su4m5F7jbrEiH1HBQnn3NptHEiWsMrBEvw/
 VDRzjRMO/6FIXmiKZxeOI6oYCENM4zmwuzJgJ+ZRpLCE4Yx4hm9moabH1U0GLcp4RyzJufwPzZ+ MNrsnO87DQPDHtw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MCBTYWx0ZWRfX5Cq+v7W37Pzl
 cghiQbYumSY2GjIAF3Ql2rFREw7R4tbR2xqFZiTBVx2HTsUGvNaRyTQ6v/d121xt5Q+30od/xbo
 9QjMe90ai1Fdo1nx4CTvAH/YMD0N34xRjA6IKuVk1g7H20844mn3ksfx5xFyn/zauY69QHweiN5
 9rQiHsHOxyTVNJKkPYROxRv2BIK4J5e/bpHMxq5mMtfh5UJpP05jggZOeqIY7u7UXMH9KZxAPPF
 OA3uywxNKyANa2AkTbKBTRdMGHM36tCmiK+tl+ZZsnCDu99KJXSkwsmX58RwhEpXnbViHBdzm01
 tQ5AI+Ko472zCGtCi8zx3lPDlAzmqkmaaUa3swoTDsD4etxceDqzkMiMCKV++C3913TnhBoQQQC
 LQnIkHl72Wv6VenNNLQlXs49wK7RZ+xPfhTTnv/QKXMByO2+MX7Dwq+L7D35c5/cHmcdduqs8qA
 VYC04ApTt8fuFcXJeig==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb4c2d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0UCu7NDXrwntZz1bfdkA:9
 a=gYDTvv6II1OnSo0itH1n:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: uawr5sj_Y2WtWfmWvjW2qj4nowpFTh50
X-Proofpoint-GUID: uawr5sj_Y2WtWfmWvjW2qj4nowpFTh50
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MCBTYWx0ZWRfXxZedhPU48ggT
 XYlysrjIuU9Cq9HaeMZ+PfhaMGX1G8jWFXVDN8DB7lzuigTvqNAW6dO0NzDHhuH3PGwSsv+fAnk
 /iiLLA+e8ebcbGKtxFN01rRjwZBpQEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040060

cmd_db_dev_probe() stores the result of devm_memremap() directly in the
global "cmd_db_header" variable and only afterwards validates it, which
opens a very short window where a concurrent thread could access and
dereference stored ERR_PTR.

Theoretical (not reproduced) race condition could look like:

  CPU 0                               CPU 1
  -----                               -----
  cmd_db_dev_probe()
    cmd_db_header = devm_memremap();
    // holds ERR_PTR
                                      cmd_db_ready()
                                        if (cmd_db_header == NULL)
                                          // false, proceeds
                                        cmd_db_magic_matches(cmd_db_header);
                                          // oops on ERR_PTR
    if (IS_ERR(cmd_db_header))
      cmd_db_header = NULL;

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1e6d9e1c-b97d-447c-9cbc-d874a0609918
Fixes: 0da7824734d8 ("soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..5d303ca0dbd0 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -340,8 +340,8 @@ static const struct file_operations cmd_db_debugfs_ops = {
 
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
+	struct cmd_db_header *header;
 	struct reserved_mem *rmem;
-	int ret = 0;
 
 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
@@ -349,19 +349,17 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmd_db_header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
-	if (IS_ERR(cmd_db_header)) {
-		ret = PTR_ERR(cmd_db_header);
-		cmd_db_header = NULL;
-		return ret;
-	}
+	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
+	if (IS_ERR(header))
+		return PTR_ERR(header);
 
-	if (!cmd_db_magic_matches(cmd_db_header)) {
+	if (!cmd_db_magic_matches(header)) {
 		dev_err(&pdev->dev, "Invalid Command DB Magic\n");
-		cmd_db_header = NULL;
 		return -EINVAL;
 	}
 
+	cmd_db_header = header;
+
 	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
 
 	device_set_pm_not_required(&pdev->dev);
-- 
2.53.0

