Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A937FF5A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519390; cv=none; b=sIyKZ5n0qsfwYh++NlvyaIuyy+oyzyiWUw24hKt9ZJxzpxkPLLOoTLwxGK1TnpEpe8joyRs3cg09eupmGg4gNg/WrimF9XqqZB40ELPhU9Q2WLbLU3VW/80qLpNnW6QEa2b9CJeknn1rjNghPR1I6/nvOQrf+K+AHuJireskXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519390; c=relaxed/simple;
	bh=GQVlKxGxMPVwtr4Y0DevBtLScZlMT124U1PfUHtcSdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lOWy9EgYDlHtWMmBQE4Y4hM2z4o16v2TkgqxSII0bond9eFTVoYuIlejgpMKaA89Hm9f1SIdcdNJiWLlWo8dEnx3Wy50oa8SErXNWYJqklN06h8iU3Kd9E4yHezy06RKr3FLNW1mIm9q9V7bl0eB7H6RS6oYogMHCI0qPaAWEiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeMs0p/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lnx14Zz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeMs0p/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lnx14Zz4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HhNY250728
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aIXAEh55bTztXEvBWB9p1a
	kMVE9s1YNf7x5A3tBH300=; b=IeMs0p/xsVin4lfc+1qzpAi4VGXk1HHHNB8e4w
	YC3M+MRg00gri4KE84NmPClIybW6w4rlvU+qCSRlvo+c1OWoFnwHJqXwDcdROC3u
	ksmPoEB7pyfx8AxjmGt6nSTRoGhE+qPoRcSF+QtrG4u/URS1IA2RIS897R61lCIe
	eIxssFggUSicALqYkWPMuFjCx8X5gQAWFgvkBsK9md5b6PI5SzzJ+0WclUZdfAqk
	8KkBkveYZZjpB9NOFTCG1CB8X5sERHO5chSoPseugd63DJXM1cpS87WOsZpsiSaV
	fzne7RosNnL7Vj7YNNPX79UpEvIYrObGL00EQPBU2LKbsQig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqsxf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:16:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso6332771eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791519379; x=1792124179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aIXAEh55bTztXEvBWB9p1akMVE9s1YNf7x5A3tBH300=;
        b=Lnx14Zz4sz5Jn3tSw5zEASSDhZoPRrw9+EW7a6j1xUoHbNemuj48uiOEkbztd5jomf
         W5FMBuQqoZZ8KkYPYEJM/MAKSfCXTMBW2yDOS2fJfV1f0UAnwMUEgkP8BDbzpd/b1CpW
         zsEJNqPmetgbaF7Nb0zs2Yc/sdU1uB/i0KG7ECqL4DhZq/ILcuXMyEQppZ6oOGel84uB
         iNjKQ7AbzQMfOj+m/Ftg+wpKujIctHQ3lNzStbfPJsWP+S3swDjhb8kfGIxAoGI7alEe
         cb7QWpI+dkxAHKpXydTo5IwoZIIgFIcA/G4y7BwbaJ/YBVCgQWNwP7CCTACj/dE3eTZO
         neNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791519379; x=1792124179;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIXAEh55bTztXEvBWB9p1akMVE9s1YNf7x5A3tBH300=;
        b=gK+TpbXbe1TDBg65DcwuNoBZbMdpvdDFy5hgOOqqcRkHF8juPtoO1vRndKBAyL2YxO
         qP/1/8J1aEKJYX1zVPlvZf2DSl7aJKi5nfvHvBJNlKCPV5S5fQvGuSNj1SzyysOqssSU
         Lw6UB0cNshVE/vw9hTcPh7y7jyrsQVVyTva+HnT/k4SJS/TWHVwP0da04JQ+BdacqAhq
         W4PrMXO8dZc/IArzOswivgKv+GaqVDT8poVfLnYYUZQ9eudo69R7DhANz3k9OzJ/D0J+
         rRT8ToT9YiccOZ3MyHUlneGVLc39Tob7TOTjwTONPqtHWftBDRhP2eOx8XswjEnzN7eA
         6t4A==
X-Forwarded-Encrypted: i=1; AKwUvBxej2uI/+VpBnYPvLHwvtu0Wxt8W0/n6svvS4ZfXtlgYoPuon+kid8PRXaAt4Us/EjW3fwTis1mkkN2PLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ1H6DXmmlCXfM1pY5uhcY3c8ZTaqvozg1zMJXC3zg3Ln2kY0B
	3ObtSf8JRO3wS9rdTs21W6QiBYe56EAMzkORTlVqGLY5CBVcoBtlFGljGiY4t75am4ZqK4caBge
	iiEhnw8O22cSJ2BEsWbX2b6ZzLo9YIEvsDBGh6kdOZnfmMX9cfmP4SSiLIoEvVGDJ/Ns=
X-Gm-Gg: AYBFou26XYvADHdDruGBwpuPV+tl+yZpsdyXQ+N62hVkheCipxbTFicwZpHgmZM4cPY
	IDdYUhm6XZqW6d4gcYLLtXWe+9TiUDV7K6VxL/onzCP51tuZXtb3eab4uec0qlrb2UFnBE7mw5F
	tboh+hHI5yzyyEbBKBRCG7I4E94sMa4tJ+pVHicbItx+V5GNBB3Mxd3DLRTGcUZLqn6qecqYDG1
	znt156y2QA/pkxLYJkSZkDCWVNjvzaZrWG/wrrZxleYbse2qcZrSGOvU0nHQ+62TPtAjBL7zl1s
	kPo+SZ4VYTy4T17A8RZSrucAk41ssNshfBVEwrhCO22nrPhtSgOAz7BhlSkttcPv3aNJXRkAEkH
	gmode37yWVvA7BImQ/4ZZ1tHipLIIQG8=
X-Received: by 2002:a05:701b:424f:20b0:149:f2b3:efcb with SMTP id a92af1059eb24-16a12070956mr1211038c88.14.1791519378911;
        Thu, 08 Oct 2026 21:16:18 -0700 (PDT)
X-Received: by 2002:a05:701b:424f:20b0:149:f2b3:efcb with SMTP id a92af1059eb24-16a12070956mr1211007c88.14.1791519378352;
        Thu, 08 Oct 2026 21:16:18 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm2528238c88.4.2026.10.08.21.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:16:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 09:45:59 +0530
Subject: [PATCH] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH5qyGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3bz8ohTd4pTkZN3knGxdwyQj4zST1CQTQ3NzJaCegqLUtMwKsHn
 RsbW1AEmVdYhfAAAA
X-Change-ID: 20261009-nord-sdcc-clk-1b23f4eb4177
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX3oegkdIPjz+0
 vQnt/gquuLAhdvJTboIq9IwQgQhl4pKlvNB+7KW8+zddq5ebEfmj63IFOoK1uR6Pv9CDMx3cwBI
 fGtkdqyI0LVvPm2/TycksEFu+not5Vc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX1LUYv7YCLPDo
 OtENbyT6SSgyJL/+czsyhlrABvo3BYnCwzS62HceBkuQmWjJjFgcpgbTrNEkwbgdOaxx2bHNO+Y
 Ihm80qrKzKX9I1wbQgq3TaIplcp2I5Izv9FadlR+E4kHoYhMquCZt+OK21V56OVM1SCzit/43Vd
 il23tm4XAu/qcRw7bMOHpJEI5MsgpA8zTu7tJhcts4P0//5VQzh7rc6H5AS82JFJ4g7l0pfxfgp
 4rJ390fmrehg6ti1M7ctawwcnNRSf9y69UH1/Gv4fCjiR2c+ehbH78mVIkWAEPoCOsmgs0ou8b7
 66/4f9t1dzZuTkvq+flCydONZgBM73bw7oNiGOycJRq90jtvxnlhou0CG/M5lF8QKq1G4FEdVPH
 I4733itA2HZUqZLov/Y8f8E+HgNQDwQCC+zcmp62k/aJgd6AIAdZQ4rKqXCcSM8HuFHuSxjeXA0
 gYOvrCNkIlSE7ozfO8Q==
X-Proofpoint-GUID: Ercnd0a2LOuqWiFUlaXGweXIpTDtTfqR
X-Proofpoint-ORIG-GUID: Ercnd0a2LOuqWiFUlaXGweXIpTDtTfqR
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac86a94 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o3hcfxW_DcXKSnDgckwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090016

Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
the additional clock rates required on the Nord platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278baa5888b277fb34a135d7e5beb789a..a72fce70de45ced4635e7091140e63b5148decfc 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
 };
 
 static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 30, 0, 0),
+	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 24, 0, 0),
 	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
 	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
 	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-nord-sdcc-clk-1b23f4eb4177

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

