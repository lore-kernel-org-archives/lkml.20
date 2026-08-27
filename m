Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237F48D89B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848742; cv=none; b=WyExstYNFYFGOtwUi9nPoOzLrMl3C+Q++lz5OXxgV8RAbU5FBfIMCQUSO++LbhMM0CgSLPcbiDZSfyl8G9qurYBUMqfvRSfrx6s5PpXawOXSpjh6b9vFWd3pzmKX7vaIocJpJrFxMZfR45ipE9t/hiDhCTzd4RLU5Q9EN80UTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848742; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dqo4XjWcIv7+87zpPTAVCtp8WZ2vW5hj60svaf019CNHv4Mvg1sl8vFfsK3yaddnWpw6OAu/awOM8D5aHoPCyE5u8IYNsZzh3/QNTeqNT47aK426g6AeLCzOHNIUhwp2pvEqir6kv4hJOf5AuyS9IefBSLOS+0EBsE8kSfAEa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUMOWAQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ii9VYzAM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUMOWAQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ii9VYzAM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbl011310866
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=CUMOWAQe2SCk5xCB
	T3vNJPB7iJoTQI/mjbPVIYKq/aKPmR3a9CvuS3h8HW+FkKh8VRUp97G3BOIqMU93
	9tOQ+YOLJG94c4N+WstV9Jlxqxrn93HjFBiP320Jw+BZlgqtHogv88YdXGhKJ9n5
	zQ0S9Tjjaf2MtmJm9BCa6v3UGyST5J35aLSifHCq1Wsv7/pRI83FaqUhCzcC7qH8
	MeU2orlQZS811LW5UWPHse/ZatmrEUPPmv0euDeXiefxKFOChCY/6avJpoEod/Qk
	PyeR1AGIdXTPFfEh9NlboojGReWxFU38iKBX8YVU84RO3mUadNXLk64g3E3iNNi4
	So4Nng==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5ksuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:38:56 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4574f1cac98so385538fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848735; x=1788453535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=ii9VYzAME6cZWkBdTa0kvWgLy6GAZgHjCrkMnyevQMqCoMNB+Q9NgdIXxFg8aXmT4K
         ShIxvtTii3X+by+Dv5CwRKM7UHgzdMaRtbuY6890yx6NTj8PTkQV+UT6aKLFd79bNZYI
         ASFEUzntKl3E2SmOQOeaxkkV60E4Ex0jNsD11UzdTFb//9U9IND0jfUBVLPh5XB034RB
         NYc3U5DHi6Qn2U50OX7psVEaet6wZZHxKiv4kkQ8fLcFklqWK27zLrsdJxYpUtWsFjzy
         oc5pSbkqYo1lS22RJcKBeyaUTKHefHlORp5r3DPWNEl/uioJi4GBberzT+qAM8CYhumy
         pZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848735; x=1788453535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=RsIKk7mjlTzPa6eveKtIT25aBrXzlPAuAJBZaSVrRYpp9agdKipW3yHJCr0BCCLWB3
         +E7ZVGSHJAL2lx9AcafdTA17uYtUL29b9qV6QFQD3PxrCna3iXYRwDS6BwzvCZo2KMxT
         2/qofegw23UqUb4zdDNXZ42Adpgb28d7LbrF6GtefekC+aFqfmS2iQsiqktJy/0vBBF0
         /lrAl/Yu+F383BNP+bo6g3H0k7y7ExBTqMhX0P+HZyygT6TgLM06lVcVcf9Q6/dcLoIb
         MD3CmNZ/N75l84cj4hUuc4odklAFXeFaVRf7sJsfU/wbmWhmwRAWQ1v7Cgz0pRMX5mj8
         4rmw==
X-Forwarded-Encrypted: i=1; AHgh+RqzIuYVocQzGzPZ295ag3RMYKRvfr0F9lzE5tZdRFtm1DjV9IyznPNtyvgPMUQ4NHicj94UoAONzSKuAF0=@vger.kernel.org
X-Gm-Message-State: AFuF++mr2n41C0ISj/iAezyiE46R0H3LS49aRyqUItw9qSc5UoiQRqg6
	dIJKB8gBH7zO7yMWFNIdHJT7gERIi7TnI7CWM4AfA2ghQSNwNXxR5tfYXU9ZK2kJppCQIUMca4U
	e+2u5zD0LkL2qt67Dhhtwm+qweEo4adSBPnxVgHV6aWjG5zvuopQNTtTxHpP33cALJHQ=
X-Gm-Gg: AR+sD11/PyLoeS4b8otoGmNOzZIu/sMY0M+O1mLuBMLvpftzwOj9/ZAt1uiGBXMLG51
	+fG00ojz0UqRYAWgJDtiXyzUGDD32LGMw/1mcGNAVDmGMtE8794n851SeNz6WdcFcv96UnVC98a
	LknD3Y+V8UMOTexo72MOwZmes1FN1ryHE0dTAxkhuRyWBHQN7Alt25atLer81rc68xhaWogKIn2
	f6/DH3gNn8kwV6B33Kqd81puwzLdql8HsD0mZWvXttT1K5Idw9183xlcz0rq8nWZ1jRF4UIV10v
	wO1h8184KGT7noYKjm4Milm2Irt/BTg9dFxmFnXNIAtcbC6/XlGA8bskVC66fAJS8nLY+P0ocbu
	WI9r/Kdt5NxtcCO4s50tAs0CiVdj2nDjClSH7oXhh1T3CBL0KzuHTsnpxOrx4fWWGHY0BG8sFaA
	ryy6QKplyxXV7bwnN7nfuYmS4=
X-Received: by 2002:a4a:edc5:0:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1a04aff4cmr15899932eaf.20.1787848735414;
        Thu, 27 Aug 2026 09:38:55 -0700 (PDT)
X-Received: by 2002:a4a:edc5:0:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1a04aff4cmr15899828eaf.20.1787848734913;
        Thu, 27 Aug 2026 09:38:54 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:54 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:05 +0530
Subject: [PATCH v4 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-4-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=d7XrupLvy0iND0SZlo+H0OcXt79v+Ztj+iih40zaAtw0/Y0Ue4Jz76iybjEAjucn6S54JTK5L
 TAo00bkepGLCmnXDlkD1RitIb5HJ+Jqh92rB1LduDdsAu2Qwi8YgAoY
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: MH6DNozUOBGyaiSYKTPyML4TXsbQq0VF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX4csr6ZyKof6H
 E/e4hfpjEYlBHy4OIbmnANwXvNvtFqiUOYTrbNSLjVz9i7MiUiAAW5Pza4M7cE0UgBtlWmNxZsV
 z9NNFiaks+mKxUOoXiMKapBpNnjN0II=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXwU1sGBy3z6/Q
 FNtu3UanUITtRe8OTYVo7PyY0i6evXqD59Kup0Y/D3i2Qv9WG6M/AkLGtZz6tyM/vhrKKVJq3G2
 Xu+aEgzCJWEaSE+TXunJdP/w3dpRAJ6WpyBLw2IVA66PDOcqhPm5aRQbCASIes+LHdrMCvhq7NP
 do4UUFC7R1AVOUTW+N4oHeYApPZbeAh5GvpP7/0Vz5uoW+0MkFSgegdRuw9xonHeIAfGP2XZSgs
 1PhhqanpM3j6vCccJIJipQkUwq62unlqbHpQlZwB3YHTBYrFf0AWqZTEE9O74uueM7b7MUGE/VY
 fcwR05Z8RHDYhDjFhlQP0ljxf+rlOpXohFBl7V7HJ8eV5YIIc3GGI5pr6YpaxmzMLdTaNYMxS8X
 RRHmoGfblWPAgupM9NP3zMUaFJ/vpAtBwj/Nm1brpf1OxlnYSEs8kW8OIN9bDkQ3cgeGv23wlEG
 wnxCpfPS0PCUCmTbliQ==
X-Proofpoint-GUID: MH6DNozUOBGyaiSYKTPyML4TXsbQq0VF
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a906820 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

