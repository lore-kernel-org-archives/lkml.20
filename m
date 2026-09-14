Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DB47F77D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390137; cv=none; b=XayDA338l8RRCMRP3g3s6iIQenawm0sapWYUQw4H14xNDx8EQAPfNwLRG2x/1lfnqUigu7FvzbJTeAfRwD1/rYUiBSLuaCTksOcXdBiwmpWZQC++er5MvtbWR0w7jlcESdhu7lI+YopWFsyEarF04auL9yu3rHy6xdqWOnGQ+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390137; c=relaxed/simple;
	bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nL3yJOsLbYH8bV6SoHXTg1mY6q3P3YZSeHdnZ+kNiprRXMfsz0gdHshfLW0klitTfBohU4UFRd+7P+pzY5Htndtr505O7bE2vvLmWBQ3yu3140tyDlzRy29Tq3TZSbNU+U89JWlH5T1QlvDusjLWu7oP9uhfbJhLL5uXLwFBu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lc9MRZwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdT09wF4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lc9MRZwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdT09wF4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRdMi407460
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=; b=lc9MRZwrSqa/MTc4
	O4wJylvJl/f3UNjh3DpSJ97EZ9FzEAuPKL5paGJgCNE/G53q9DrtNTL7kbgLxVtj
	vQrrpvjpY1QtpnBVl4ZfvsNmId3+ul7ETdFW8yccnVaeOaTyx8OKActHxQl+Hs7b
	qnPIYGbr6D8bWkKxlRnjtRzTJvVVB52zesj/X91KR2wsb9ZzeoLun2b/0HS0vhxr
	R10r+sxgFmWAAGLQJpSawl8DY8PqFiR3m1RfWjtt82cyXA0s2INuUH/Ntu2ZTOlq
	DE3EEoVyeaUtgen9LiNQ3kOEpwp4ag1i0ce8UMNG8GrTp5LJYXUAre72WoW0asHi
	p9hvXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f27c80a3so638650385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390133; x=1789994933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=YdT09wF4a1k3UGnrLNnSKOld6zcISW3QjIhbXlc4RupZjyb+zTDT+6cYzLl9+CmFqR
         IUpdHuyE/XghlXqN2g1xRXtUr7Eni+TAb2Omtvsj4XTnLhn8W6jbyPobn1up64IGacsc
         lihFNYvJGhGgFmEan8ubLQtyBQgS9Y+skmsEyxmXPRprfC3QgO09v9Os2G5kpM0htYJP
         cAUGWaLLw7VG2ktpNjQyrUZpGxCq2xzJVYkVbdMzlxWgxKl13FR0+19NCDFVFgNBVZGv
         Zc3BG1oY5KC0M1tc/JGVAycpkJBJBALW+qGuOjGzThgmSXPhCFtT9GZ70of5j5U0tXrZ
         eg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390133; x=1789994933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=ZxrlxVc7IkE3gs8SNEcC10jlQlFi8knh1cG4T3C/eBJPytrZ4t44JYfl5NUECb6l7g
         jjh5FaPVaCuvQ05XQNaSuAt5QM6AQish5BSedJmFQTaY/bkA3EISr/HmP2BdeeUwSJUa
         GHN6ZcEaJWcqnd4wFsLMhJSjmWXEwYjqVe4nC2V+fByTjj8EEnPmBRYr1VU3cxeTs2x3
         V8iZAEFY3gtgSI7opmbS8GI1+24YEaZQMTjIMVm8HpVGQhvaWxhfl6Ui/3GBtVqU7lzT
         1YPA3h2CCJpQr2ooBPHMpqrA1ECqXO73R7DoYLDM0iUBWIB0UyWnEbdgU3s4d8xv8SmA
         kYTw==
X-Forwarded-Encrypted: i=1; AKwUvBwwgx6AS3OVtP0M+oJzyk2Nm8vtPJR54rYFKC8J4VavSLADFTKVxSgexDW0t7lAtzxytTnEMZZhDVh0CPE=@vger.kernel.org
X-Gm-Message-State: AFuF++mpP7M1UmHst54Q9UFpolZRPcXaroXz6zamZEAnCEXiREnqI9b9
	jFXp8NrpicFYtQI2PamvzpyLPwN0ZiCFTsVfyNZsrwF1kT91qhoyKyVJvrHgNRv6qZh6OtEu10s
	UWM26DKc01YPfuZxJ1qKPqabgMEJ86EUgrOEHaDZxnBo8FPvKMndzyJXS6vU/GMHPsTs=
X-Gm-Gg: AYBFou1Tm2RbCU6PC4kuSFF8UfGgbuCatRtMGBZU2Tu337E0HBWTiyKRDmFmXye3CKu
	3x6chf5WtGi6EG5rSdmvGJyybOe9oYLUlZ3kQZMWhu3WK4jvTNHcuiZE01SX2SpJIu/S7GZ3CLA
	PsGOG96dW7mmPcJR9f66ZcUt4TqC9Lt7Ngjxtg0Dg6qygIhhA/DdG0yOiKJYfkU91/T2tsHboEk
	3JDagHTol4nk7PyPDYOzCadJ14/8GkQaCnA1JEjrPBuDFivXNNnLNKL/QIjLz1buG5IZgx4RW+r
	GcNvKk9mfTc+38uIiqY9lARtUI4mT5CQAWKVEZk8YgUQBQgbyHlUdIRL6ho9b8w35z3tHVHaKxX
	O9OYJHsqO
X-Received: by 2002:a05:620a:171e:b0:93a:1ec:748b with SMTP id af79cd13be357-93a29803c94mr322313785a.20.1789390133101;
        Mon, 14 Sep 2026 05:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93a:1ec:748b with SMTP id af79cd13be357-93a29803c94mr322304985a.20.1789390132535;
        Mon, 14 Sep 2026 05:48:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:18 +0300
Subject: [PATCH v4 19/52] clk: qcom: gcc-qdu1000: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-19-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zetbPQZ3Dm9nRpJv0rQZRQaSGvSI0Otf6X4
 XVZn4bBMD6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3gAKCRAbX0TJAJUV
 VtFpD/4p/u7Mw1156YQBr1m53B/NmtwRqhgQCvyqt4oaZ6EeA45oeQ3PjNr/d/rRK6uUUDVG937
 kPaO85kZsRdfGW7txbhT0Hv+5juDmn4Qq7glT1/YOKPyki09rYrzNveEFv3Vuf+OIJSrjPB3kCV
 pLuq7TBJ+89rXfSf5ILlyB8RNR2aQrWJWy0a1tKvlzDSkRo/J0xkf3TaiJPW1hubvmiuMUk1l0Q
 +KqFUaR2Knj/fEjw59UI9dtax0DEuO8GeXwRwwYySmDxISTZOr7IdLmEAYBKyXYvW1PBGvG6VE1
 S6xNrHT2exN3K+NLnXsyD4tBbMnncOecoPCA/M+bSZWv4uoHCRczJ/ZYujj0enw5RaNUpoclK5t
 KrrQkgkjlTR4eLX0/lXOJD0vHOAg9Sw0AD90h2aLopQAMHOog6+W/Okm+oVGW+l8PKjiZORAf3A
 kqs/NKozbMMKcrNXTDEADluazarAUVCobwdxs9gCLaeoe7ZumQFrIzO70qs8qZM4R++ADIuK2lo
 Rtz2R2al5kQsEM2ycF+7Lul7sfCcXaSikEWX69wmCNWFR+HQvtHBu0RsjmjkV6L2tri8TqEF9hi
 WduGL1plk9t+ejtnGMABAYJXjidslEqB+/jkZWXlGGvcsTfTXII70b8ab52en/qX3vJKW5ai3UX
 FXQclQa+AROzsCQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Z0paz1CzComWz5bTHEuUwjK3GpB9da1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX88tfo0wLMpmI
 wrq3ALwwN0BXgxHXXe/pwJPCmgKzzFJezEog10rqMzuNrtglBDkUGwrWj6pl54B5RVvuDuJ8JSw
 Pg9jwpTc64cw/YSmQOrFjlTN6pfp6MMX2xFhcUpS/D729GI0Wr6K+vSd2MH6QceYWcEe0lvWxqM
 1KdzSarZY734D9hCr2SLNzGSN80GrRK2f/nKIjGSCqYGWpN8hQeILDydQCuIQXzSI18LQmaxYaY
 yctOLyGeSTM9kqWuwwz3dY1u3Pzt4Z8jAxea+ZiWTHkNFjqHKijh3w2a2FJtcegCE2O3F1h+tza
 ndT/u2XlDqGMBd4nt1vAJK0KIq7delLU3qnV4RP9zsfZa63+kmHVuTZYnJV/a1JfAPk20NPMYlY
 Lss9421/Vt5MaN1FVwkvnr+jFSP4HEZNI6il7nJPXAJ6bs85R8lQLEtEN6XKS9LJ9JVoXR+QXCn
 M0Z8z4n5xDOie1durgg==
X-Proofpoint-GUID: Z0paz1CzComWz5bTHEuUwjK3GpB9da1M
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed35 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX3ELTl5MLQ+FR
 ULCvx5Ykhsau4JP0K58alTNy9FFh+gFqiaD0yrFKMeCdm+ZGeV7thWQqC+LrTDplcyu1ZQJVRsb
 pugK/D9sgVmO8tOnl3SywswkZbQuSDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..172303ac4c9b 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2649,6 +2649,7 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
 	.gdscs = gcc_qdu1000_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qdu1000_match_table[] = {

-- 
2.54.0

