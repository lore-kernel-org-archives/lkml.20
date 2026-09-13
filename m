Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A73F8EB7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330742; cv=none; b=M+is301kVXeSwTlFnq7ePQ/LF9U6yKep2iiv5vapZbE+NHP42jmi7/nFmaIiRCgDmhEgWBACF0KLTF7c82ZN0EGKVxk7Hct6WiiroIJtI4/pDWeqN87OdUxqJxR8rWrr4J+RTNgEy0+JGTDM0IxjyP+yWeElDaoqTdji9wY2Tw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330742; c=relaxed/simple;
	bh=0hivd+NbwcO3jYkg4nrQUymtlVO3eRTGvyxQRmrq9cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l79uppb1UzSSUeR0/t8Et4kW+ClvqmPui7rWSyod/yXOuM7ZiZYBsFYkaFIONMzXHK0YTCyEJyZgvKpQwFXRjDfCdewZb5R7mSqi1N8X8+Ji5SuiTRQqRATYY4Y4x97dL+E7vQ4WIEpdN611TZwdvl3ReRzXSoRdLf/MtehycVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m91w9Nph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iV7999Hp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m91w9Nph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iV7999Hp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK03co1986783
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LNaJ6hYn/3P
	1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=; b=m91w9Nphu6CWLLEqAiNoxLRVtrB
	sxVozXqqT0M7UeyyO2naBT7sqD537Fm44KYZ6emfOpMDkheushHlq0IbVRwjuhn5
	/8Xf8nerCamb9Z1yCHUpr8J9fAiuPWN1E5vO/wWh6VZVP/XZwDTWbYjEcgDrg+4C
	54HflQmoperShDR5sLnr0+Dqia3Z2/fhfZSzQSXDJh1Ou2igFOTlhZJsxI9n2sF9
	MuQ4hw7mn9WcpT75OG2q0/O5xJRCR2465rFFYGBhT7Ctm9fp5I+0BLSjNgx8uzI5
	acMKO1bwdP+3n6RaBzcQxqHnJs3P01nI4BDGLo61h8ENxwQrGL4kG9PzTzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc1sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f925ba4eso451071185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330733; x=1789935533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNaJ6hYn/3P1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=;
        b=iV7999HpWCJjPyOceY0tME3lZ9Sw6QvN3eemlkk7KxH5JdmUSMHvwQ8L4oHY+zNGqN
         KJbxjFHKzBqy47V6Bjjs8DDkEj89ieIMduveP5Uvzi9BuZOtqLBwGqXhxi219wtgNBU7
         iPnx6e+jNpe19ia3XKxY3Q7ElyQpYwwpBgFyzIljfxqKRxe7JNc9JQVMXlNHOPP8a0wT
         caMRSb4JTtyRv6Ld5UZft/s/3YX6xdJ3fBuXpx6JvjCEdGv4O8bCZie+hKXfTx5lGzwV
         Da8WeKU8cZ7oSKeCoRIn1XtOt2/Oe7WUqSmwGqRNlibEfLaNGWxYf1At3yb/SoHsyo3U
         OLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330733; x=1789935533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNaJ6hYn/3P1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=;
        b=YcGzOX76eoYI3sIh9dVndmu9DTKbI+Z3m3IamKYFjAhJXmbFemD8Q8XHBradyS0CZL
         gSpx1qTgl7KSKyLKhr4C3I9IpOhtsJV52wmioNagAoU8ZbSMbtjJ/Vhco199jinOTqfi
         b77H1jNLH6q6qAxluGup9KWSJLh2MqRyhn+AcA6Wi3iScuoqKjAvQc2yOYyzkD6Wey3M
         jRvG9kG8nn4FitHgbaS61HPO/zhR9nLlQTIcphUZ/TDBl5Uqbm5rybGUz1R1je0kNiZ1
         ar0DcGYpSuJ4og8TpMRs2t0SozIPUYdyLFQJtPZY/s6nPPIxoRN7DkGieaReWpqWg/d3
         CS3g==
X-Forwarded-Encrypted: i=1; AKwUvByhMhy6r6AsQuu2dGO54mKB7YO6q6Divdu48olDfnB/JhF9gq66sYtcMo15BGGL8moAePTrg9y5UAjxZJY=@vger.kernel.org
X-Gm-Message-State: AFuF++k6wbghoEG6kx6U6c2TwGf5smAi7XhOU4DltER1ywwIUUnmoJ4B
	rCmwG2y3OzPA6q2vhuOTjJF32zHe2sLzDgp7IuBhNrJFvwTAcAa3XmTwqUDL+Wc8RTkWqNjZJg3
	g7mzI1XOy5LygT84+GojvdKWs+tOmhMI9/ACvPE3DZTqIbztwfn+QVahTDjj/IHM6oXw=
X-Gm-Gg: AYBFou1SB0I2qHGm33UyrnjujGbgQtANY8NNpT3+tZaBN/FNls1C88ZIAsbqk/Q08CM
	NGxmjZs6yA/DNfARQGlOdINQnND9RG6FAMlLA/EuBu4yFDLznh3hSg+oIACiamb0erF0BQq8wTB
	1nX4B2c+bkm3Ii41Wj5PZmQR8sikpOahHQVa4EQkpWZ8eIiS3achvWgWh2kqPN3Y0p9T/LcYdle
	46ecLz9kdFD1A3glFgtGvf9UglpBJJKGyW6WEYbbJMbmkcSYn6GuBLCEDA1VqEy5IoCMP1cNOmw
	vqb/MkudWlSdiuopTkF2jwBGZQ49cr4EieUSJYqrEzhO0d6EkdoW1mHXablOts1jsDLC7I/Ryv0
	PfqOnTS7RZg1mNA==
X-Received: by 2002:a05:620a:444c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a03939ffbmr1125866485a.46.1789330733350;
        Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a03939ffbmr1125862285a.46.1789330732863;
        Sun, 13 Sep 2026 13:18:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Sun, 13 Sep 2026 21:18:35 +0100
Message-ID: <20260913201835.250085-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xRdekbx7KIpg9MsAwgUI-mGyQxzqS8lf
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7052d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX3kScgt90etVB
 NyYGSR9py2Mtq9CgsYPYvzLDfEz/uDcjdkuMu9pVhKfeg8vnaX9G0hnnnHmmOp40dKuBotOJoiG
 Iey/MqUMu7C8LOXDEZ2FMjJXhqsmuz0=
X-Proofpoint-ORIG-GUID: xRdekbx7KIpg9MsAwgUI-mGyQxzqS8lf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX50JrgBaDxR3Z
 FKdSI4TyBTEAcHCxg/9som2PeZVno/TU+lIoTqJUZAl6AeRAB3udzufy/00UiGwQVc+5uDCMlNR
 gZrLkWDjx80WV4ZMrln/zt4xL9TKixlK9K47dTs8sFX2/DLOvGMXCQQLLKx5fRl+twsUN/vTMe1
 r0dHZwhodcDOa6EBtpr2IKoWZvwICLEd/z50CyIAKRxOeECqIIExiO/3ZmC7LkeDgmLE3gcxldf
 +dxoqDuQN70UNIJcLX5cy/gW0jOWrXoQywSiYfLw016rjuxoduetmQpKQiGPusmyAvN7UdNf0yK
 iZ0k78KfYm7kNKY54zov006bp9or/tgNbRSoxxiHNL2BRscuR5nQRehwqFqpvJnarJ7pxfNZEw0
 K44V4+Qbu8/dB8xKssxYgS152C5GAvRxojxxUdhk1Kf0Gp8hrCsoU0LYY88/moGXKD6bL2Uo3Bo
 YHsm8gYYqnM9wzqb8TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130288

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..aecb22bb9662 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2233,6 +2233,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "medion,sprchrgd14s1" },
-- 
2.53.0

