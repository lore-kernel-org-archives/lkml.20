Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5218B33A6E9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971659; cv=none; b=sJnbgSUFxqZF4PieV22VrAlKTf1Z3Z/VI1kTnprU51CRjtxkB/7PJ1somDKUduDuQhNTc5x7IqDnXOE/JjKpRil99y7vY+Okit57UFP/WIb/sXz0bDbmEWie8yjQ6rVagcEleIHd49Bs+lrcUeDCq6/H9j1Yzr7zoR1E15IUAVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971659; c=relaxed/simple;
	bh=DDCwiFdOEWDOjIDRAPl2mASn4s5v4PeO1HLREQ1I3Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRQaI6eBtTQWxkH0mJGND1C7AEJUC5ZEH8dwHl33NW3BjKaWv3/4ztD443qzvXXAcyyHuZaYWWQgXmBCNl9CAh2k8zFw/bxwT6gNsnq5wnBYIJDqLC6PkVFDwLX0DiXl3WoJSt7+TN1uWMJNPKLwez7o+a5xOw0Aglqbx9u1KKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKHleN61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqrc/WZ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKHleN61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cqrc/WZ9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z20P142981
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=; b=AKHleN61R0XMHr+A
	YHOVYbonYMvS0O6VQQJlwEeBId9nVtuq87ti1dPuAKd0uycg55iT69AK+guterpt
	zpijdCgi+HlpnaIKJBfvmCekVmnJsVqvZr9JVgQrXKaGYb96GHGleGltuP33n9rb
	hz+LMJnWJJ9WhIx9khWD+teGxTgmIOq/LrUsXsxMEiFX6j1CC3VCIX/I5krG+G1z
	sX1p2pxbVEL4R5GGQeuxd/Cmin7Ke8kYU9louZP02rnf9nihBfXVy6+1HE2l5DyZ
	7GrAr7YygdEGTjWJvzdNevgGwvOHTpUNi++xxyJloUlHxwhBRxqhuHIpuIMwjWK0
	7SLw0g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1egtan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4016591a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971657; x=1790576457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=;
        b=Cqrc/WZ9efRFf3UJVXZteFWfrHlwMm5lSnLBWW6xaeAfXXGa5Kcw70Yb38qXvziG6o
         EJDRdiXk7X3y4xiW2dY94KfNCuPnhFDuSjk7sJl0ZD4+IUBROQzgNceGapQej5WaZLFa
         9GQ/PmSMdmyVk3bXtFygsySLnaeoYocnIw7OrI8VrMV027zuIgC5L39OgPHC72aDHsWd
         +4mxEOXLQoGw1dqAwNaYvFrit5ok+LsxuGUbkmxw0wzrFjYTBPDgSX3b2tXQcPMyAij6
         152haA0wdmVRoR5nqYflwg8kvuv5GtsPonOE+0oIFZZqkln5V0mBq1QJpHnmqs15sngS
         LE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971657; x=1790576457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=;
        b=Y8lVRGNYNDEZBeywSjNCDJPKBOuB+eeyfnKqFJ33Nlc9gnFW0ZTYsj3E+oNEH0nwpF
         OXffFMfE6ZuPBzsOQhtoYuYiy6RhZ4BNJ2bVlFKaJyJsrd57Q3l5DOI26vyqygncgWPh
         rwjljqr1C4yya2fL4EWK4e/Pxq+bDdmHVSH6GgKjCpRyGvVe3BrxJ9ilJOroZSsXaLWf
         24ulG8YhgRDw3zbGUQ6I6uVjaD1VRwNfHlVhRBZPP/XsWazyPB4EYpR35R1skArS0nUO
         DYs7Hi4cx6wn5J5wnu1VJpVrh9+1vwxY7082kq1YsLBJmARmWaTWu3LOSFwmNBZt7Y6w
         sjXA==
X-Forwarded-Encrypted: i=1; AKwUvBz71lBEbwzIAqPlPzi4o4MW9g4HzU51RRiFsRrgrXLSSK6nL8yNKHvfWa49TkxBaPTsjS0uGo35fE78nMM=@vger.kernel.org
X-Gm-Message-State: AFuF++kctLATVwVkEJuN0wekU6eKdI5cXHz87W9I/CkhTXHKtfjq4bOa
	tsygxaZlqZ7pBLN7/SZ+3NzxG9lTEgRRSlAKHK0zw0CYvScqMCArxgbWwCxH1nKx4nkNv6GSVvS
	2+rXzzNbp2Kvu/V2K/EwLOrCuIL4bpymCnKZNCb7RpLf/AE/ysgr/Tu5NAhd8dtKmIE8=
X-Gm-Gg: AYBFou1ZoGRA/KuOJIFOrjMU0xHoKE47QfQqWjL+3HH+C+elzNrNvzKhKVQOvBarx48
	/1n26PKUyPPgSbPMpTPQ7B0w3xvnK5tG6huv2W71EyI819QnvGFjK6qTS5qVJS7qLz7YFJey8/D
	fjOWtiQEi6q0kyGcMnx7rcPl/aL7Twi7V05Y1/dvjV0cALP5s3fNASSHj+GQwBNRIhXScsyC0BA
	wBBdxnyDtqkQ2gbI1uylARfYsasdikAISpiCIR6ZceLcKZ1igbs9UkqWScPtg/nk5dSVUuG/HtK
	Woknc/u2I1sdfqj/X9ackWhRE5MzF3GQsJXulz8p1MRsEg27bKtuzEAOyLqa0rLwwTl0v0GDZMR
	xZ27c2eJjrJz6PARWB9qDeIiipNhZSzWvaaru21tJ/txDhwPn3zxWuLb93zZYF/BUt3nd+NqLjY
	Zxk0DLfXStFGbm56h0sSZDXL+HfbWiaQ/GMw==
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10578833637.57.1789971657044;
        Sun, 20 Sep 2026 23:20:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10578785637.57.1789971656651;
        Sun, 20 Sep 2026 23:20:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:56 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:43 +0530
Subject: [PATCH 10/11] clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset
 entries
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX2cxQ+ccCs/ZV
 uVN9lcZBXBSWzemaIPabzO5U4kGbYR1L3AQk4Mn7UJEf0X6mQPaXABVhylTe2T5OdDGwg45AFDl
 m3GfxLArEkguHwdvwYvMK0mg6lz8Gsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX2uXshiN0jPXa
 V+QBK9UfgawwWsMOt3GK1kEODsrI78iWxL1VYNvjEtqFaaPHdrApSGbzLA3akU1P2IM9KnUMWYW
 +gnTt5Nwks9GWD93AlSaJfpju77ebp4ISvVk5e5cAdH+GWltuqAFvBARsCjSJk+wfIExGCcWsUn
 lhqtU38fMxtRw96L6iqWJRTcwxZ+I5Mepny1ctSmg/KoOd2SgFeQcGkZ9O4cdVaaYPS+0O4FiUO
 duCcRSWZmyD+mvmQ3eKpZHOea5h2spX6XFGD+JhPn9osQe3xzpUrahMZ0IBkWmhKa4koVQowfw5
 86dnXIwvq/LMNEK2P0yCav8Qxj4PY+iJy1jZ/kuQmG4YKj8hatri1JMceaynDvy+lUBeNpSqQxL
 zu5AWvzyLQubXdmE5+GpxXIPahLP50PE+J//er9YuUxtp8kyzJHrQ80NVxocPh1PJ4Hn8OKV5T9
 fBgeYBCKdWQOETMrVyA==
X-Proofpoint-ORIG-GUID: c9m7NZxBGLGiwQmhiVM-9etA0WdJVe97
X-Proofpoint-GUID: c9m7NZxBGLGiwQmhiVM-9etA0WdJVe97
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0ccc9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6Pt1XdrthJ013FYkzXMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Add reset entries for the UNIPHY0, UNIPHY1, and UNIPHY2 XPCS blocks.
These resets are required by the NSS block for proper operation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 76adfa8bf2ad..d15bcfff1759 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -2601,6 +2601,9 @@ static const struct qcom_reset_map gcc_ipq5210_resets[] = {
 	[GCC_USB3PHY_0_PHY_BCR] = { 0x2c070 },
 	[GCC_USB_BCR] = { 0x2c000 },
 	[GCC_QDSS_BCR] = { 0x2d000 },
+	[GCC_UNIPHY0_XPCS_ARES] = { 0x17050, 2 },
+	[GCC_UNIPHY1_XPCS_ARES] = { 0x17060, 2 },
+	[GCC_UNIPHY2_XPCS_ARES] = { 0x17070, 2 },
 };
 
 static const struct of_device_id gcc_ipq5210_match_table[] = {

-- 
2.34.1

