Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48A4EE87B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559183; cv=none; b=qM3gtZe7Pyd0jjMvbgDf/ndACdyg5uzy3YirUUFScULEh0oKOPsmwB/Nsfe8fmose9eu10nwMGQMmH2GhMvq199MlnClZ9cNc/+jEhyrMzPSH7ZB9OXK3ALniw0A/13qTZWNx/yERMirRKTKzViIV9A1mQJIIBfBnaB4DuNw+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559183; c=relaxed/simple;
	bh=QiIWesU7FzZBm4bDxIVz/01jYmQAejuTJ+yo5+sOmS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A2i2GHKVHqebU5/jtbUu+AV6V+87PtAGBXeAlg6+PhFcYkOz7xZ9SDAaNf1+00jJy1pWMRJnF03vG/icB5ErQtWG3KzVPslHXKno7nsMMJaGt3eL2p+9mCPhnL6ViRnNj/lJvcAelue4Z8qqAUzTMD60xFCjHXufIYT7WAIzVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5RUp+Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SElmUuhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5RUp+Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SElmUuhr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G9313B2822929
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VeiWxyRJnXNn5vuIQ2+Ltr
	kLyhTv6TcCPGxdOPAsIN0=; b=X5RUp+PjThE3fcRsrLTk8M0Fp4NUOA0brp+lQT
	h9W7VUrkg5mmeyccN5Vcro933mmT5SYuGQ9/mq5/gU5kh1LoucnW94+aHxj+4nk4
	CMVAAfqAMAk3oY/RA4UV6VsJbKzMJeLcqOAbc7/NYFGXjx/ivIJPJzRZwVXkuCfT
	92vNwBsJbV7whWuxaxOWArb2vDQZ2ViVqV56OuMvWgX8jA2VltcO1j7MiWO14O/L
	Dh0b8OT7OuEbCHnichDtCbE9+t6Rx3lwwNW6x3uOEXfjfABQXQjGLINBSvMh7p08
	iOALUioCTJzEyqPdIdxNiIFV1lCDSTcpejbJujcEYNeEswDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjm2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:46:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so1033475585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789559162; x=1790163962; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VeiWxyRJnXNn5vuIQ2+LtrkLyhTv6TcCPGxdOPAsIN0=;
        b=SElmUuhrmgGcfBGrQIme5jNoc5ytWMyuKdv+zri+5/b3k0c3iCy04JDtPcRT2AG/SY
         T2rH36jH6GdQsnWx1DXXbD9jrxeH/XeM+f/tX13lJ19kJECITBgiOyduuKBZxGeEIkCL
         HJPmCDHZeDVFJtiAwI2xvlyZ6nMqRZKhfsNKB/JX+3EArjQgVQTtJixz3UM70jDrU+5Y
         i1hOvBcvLhAOu1+npYxU0nqMNJ7RbvOqOYh0JuUiN77jaAuzROIL02sz1OIesSBoXJ5/
         bPDONf7iW01HfljjeY5H8WATxSNuGnFrQFhtJqAEjv1XIxE2OT77pJSSx0KqL2P5trGe
         z1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559162; x=1790163962;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VeiWxyRJnXNn5vuIQ2+LtrkLyhTv6TcCPGxdOPAsIN0=;
        b=LgWyYszsjSe+LyGVxqJ5NlmPCAaxXEvZ0JsiIiWy16dE8xMuWMZcTTe3xlrE/mv0G+
         XgFxNUIwhFt2PqdIFavM+L381/58/36sdMJGI93rGxK8LHKN7uoEeAkQ/VtGKuupC8Bn
         vi263Tq7VEf9dIOcVBbAka+RjPl8OZROkr87ZxSwmJHHwlnIxIVmt3YTj8J9xyspfrSx
         5LvP5IoJcMLLScJrsyFkLxX1wTgo+LrjQhmpexfsFMAPBML/J8w4TunrnFnVcyX230/z
         zE/0VAFFOdNw8prkDej2Z+AFCtYwlUO1l4G4HoEpple8FpwJuXRMXHX7MUKLsjfIUUqq
         fegQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM1fkW+0ynIa1E7ou8vE4z/Nl0FSewewetIBKDaNBxE1MZUZV8rtKZNvXXITEzP4fZwB1zhQd2GW9sI9U=@vger.kernel.org
X-Gm-Message-State: AFuF++l4sBPV1NnyspVKIVVWrbOHDEEqBwLSpKEtHOJWEMQfJTcgu4PK
	V8xu1ReIERpBlygC5NBb4JBu3hTg99p5TSbWo9noHawVSzZvEAPfLkzy6mXbutzLW69uuTqjVVX
	v+U7c4BYOTyu20x/6+kSyohVXbnb3c6phgb5gpxRWC5VJav+Cxbc5JVwn6DboD+WznvY=
X-Gm-Gg: AYBFou3tyUcqf2cqxwb1yVx/RfwFAZzQP5CuR9RRvm6M1MjJd4EWftBRpv9u61XRUqu
	2M5SeBu6zNhB9zzQ1au+dQ/W2+4gt3+i4KX9DHuIwhTJ54jFS1ZT9teResu1OkJRFjF/Xfej7Sx
	Dd/+x1WRJOQwLQVx0nQsUg8gHOd7CBr2el0Lev42ukkvwASDFntpKZfVJwRx3QRtGVAK04GUcij
	61oQJu6RPTupDL1PvDm9Ia5mqyXLgNshAwAJknh3zzZHtR9ZmmqXeYtYbtyEtdayuR8MnXFRFx+
	+7oVLCFL1TnlB2KeF31ScH4Q3qnz2kadY2lhDfWir1zd9Mu9nGNv7ZwJkPQ39/GR1a8XHoUqfcP
	pOBDbgRs=
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr382013485a.28.1789559162217;
        Wed, 16 Sep 2026 04:46:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr382008185a.28.1789559161665;
        Wed, 16 Sep 2026 04:46:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e841f19f3sm75586605e9.15.2026.09.16.04.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:46:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:45:53 +0300
Subject: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCBqmoC/yXNQQrCMBCF4auUWTvQZhEbryIuksnEjppGM1WE0
 rsbdfnB438rKFdhhUO3QuWXqJS5Ydh1QJOfz4wSm8H0xvZusEi3Kz6oZMyZCLPm0TmLSd6YIvo
 pYElJeUHah0BjNC5ZD612r9xGv6fj6W99hgvT8s3Dtn0Ay478NIsAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-c7bbc8d29f6a
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QiIWesU7FzZBm4bDxIVz/01jYmQAejuTJ+yo5+sOmS8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoF2em/ve1us/dY9yadOl6+fxOd1jsRMWmJOR
 lvDRX0c9l+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqBdgAKCRAbX0TJAJUV
 Vv4wD/99jznWrJv19lZV3ouBRl1bG5it7f0Mlcb023yj71Kjl5Wg51mT23nV7W9LdvBiYm3JM3N
 HseoebR1mgJ4VTPqmytwOdrwgNYqazBS/vlfY0aiitCYHHxaD6FUD6G9KtXAPySMlJqlI4zPso6
 ifKY6EDoW4JBGAp525pJP1ewrJayZL9Jmh9gRy8a/y5qK0+9bO+k62EDOvpGe9SODxBmtpnMLgw
 9VSScPrlM1JLm7o3bXbuBwbzRzBZNkX652E60jMBTMcjApDw56limBpbIDz9ySq6AQNpd1LcHtZ
 iv9gRNadp0tD2ZpuQlpzv9YhduWH4oJKChQt8ClVmre4JbmATwKzVxQINsuNfU1mmSOSvqOmGpN
 wmZETjJLyaaYrpkA4GkF+2apPPfgy1D1z21fvC+9S2dlV5hfUjgZmH9HtDd2x9ILz+wfSm34zwf
 CesYLzwQVHgQvYEmBgCss2Nq2804jHqt91qNUqo96UNEROZ9cEY1cgr/3NhFp5f7FpwASmNEMbU
 ps+CaoXH9MFGgzFBCD01p/NSuZhlJz19WcFdKtwfHt3lw3x7rw8b2ncMWX4NthgUmOZwCeuYWYM
 ogHRU5OXgDiu6NTYrmDY9uTaD9i2lNgLUNl8tS2iZQswLk+Yri5WybdFddt0tXF/m6MXPLfl3s1
 zBC17096dbTbgrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa817b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x-KfI9e3SCgyUP7ysD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1NSBTYWx0ZWRfXy4OqTVJNCCPR
 A0u5tnsr13zNO6E/e2jYibi9WHOqV2D3/Xfqp0k4BHbNgq/hkFJv1d6VA0nos5lc4BsD7W+pLyS
 inMzQn8X8NhIFWYT0QRYudy2dpQfmn9lmW2dTA3wgMDdDSshvdtcggvIRbbqgw4rDpOAdbUW5+5
 1GqU8lzx5GILIW7hXSIkTVMUr6DEEkWGkGj8k3/myS3JGjBr2cBXDAnXCDb/A3BwNqerBF5m4at
 51HOS+2QYNAnQzpP24shqFCcpwjse2k6oC9oTrJGHkTPSHZ3c7TR1raUuBZbw/IBFR9WGHxW3TC
 5mqCvCHN4+/mZIq4tmbWvqIyJIJWvkPNU5ggKI+y075cj/Zdm6j6Oixnpos9wPC3qSeTIf/UA17
 IuOnyGpa9G110IUQF9W+VDXvxVN8fI4ri0IrcB7PnpxTHorbTH7Wj7x+XP8yclJucBRmlwOZ6vm
 UncpZM1XXYy3WCZNXjw==
X-Proofpoint-GUID: wLGG6-Z5NRhxPoZ1lBGYgTheAJvqTR8j
X-Proofpoint-ORIG-GUID: wLGG6-Z5NRhxPoZ1lBGYgTheAJvqTR8j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1NSBTYWx0ZWRfX3KS7uyIICr9b
 9FLdC6NOoo3U56nCkG9ZHFpSWugmnkc1RbsX0tER8sokXIERAVMNA/2Y6Ll/+7zcgDKJkGjdtgE
 vlqNKIfGkBDz8T2yDL9BQAUM0boAGpI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160155

The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
rejects accesses to it and the clock cannot be enabled.

Correct both the enable and halt register offsets so the driver can
enable the branch and check its status.

Assisted-by: LLM
Fixes: c252659770db ("clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-msm8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3426e3dde924..ef7bde361fc3 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3133,9 +3133,9 @@ static struct clk_branch fd_core_uar_clk = {
 };
 
 static struct clk_branch fd_ahb_clk = {
-	.halt_reg = 0x3ba74,
+	.halt_reg = 0x3b74,
 	.clkr = {
-		.enable_reg = 0x3ba74,
+		.enable_reg = 0x3b74,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "fd_ahb_clk",

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-c7bbc8d29f6a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

