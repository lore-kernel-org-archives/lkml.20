Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF2549AA55
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478826; cv=none; b=MHp82VIhQ0MbskZk6qaqLTzpkrDoMM/gdLTq/gnx+3NMVbSrHbO4sYB18AYKguRgWjxbiO5lMsNKTS6fOLp1lqB0RSRSmLa4mj1oPW9XW74k4TyTgaJiJnWT43rPkaLUiWWNa6lJn8DIuoKQoNorXJRLCC0fwo4bp3/AqcSxj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478826; c=relaxed/simple;
	bh=XMZcz6kYBdTUSQPlM1s/g5+gV03lvS/f/BpAkn8eNuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YV+n8CbriEJpvMbq+PjSxj6XVJNVY7T8quZImIruIAl8NRe5LwcBAS9K/punZE6J0e4AKG916xDe+z4PQ/tl6dm1Ddl33zzsS3WZtkkIgdE85nK8DINwd+TKTZvCGQQqum28muxrq9jLcyozn9oeTvHV5vAfn1Vm8BhaEPOnS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuC/zuaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9EqlGsd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuC/zuaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9EqlGsd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0JOT4181148
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbqlJQjQyZug5ULzZ6y7JKD7Ojfb/phQ4FDoOtOPOVs=; b=FuC/zuaBUxqxNEe2
	qH5/epyShHcCw1cchQDsHN1wiKCMlgk0NU6hwCQWJIJrknym89MmBUggFQo/FF2A
	qWF9kNstIb7t0OgUOqMzez26mOrD5QOUzMjTybblCQSGXS5SL8wTlPpThQbkk1zo
	/0AJ/ypH/tMncHakRUBBRssr6XlouefATcBULaaTKxkTcCnrU9kqpsKTulisBI9o
	Z3zc3q1vdGdl9T6tX3x5npDa7MWGD3vx3llrvqw/ii14KoHvBgXwg4ZUlW0zWldM
	4NfLraK7+9MxB6BoeRP15tlTubLnhmn6Alx7Itwa1Snr/n6OlD+8oZ9d5rPLvbVB
	+mRd5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1yvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:27:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso364713485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478823; x=1790083623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbqlJQjQyZug5ULzZ6y7JKD7Ojfb/phQ4FDoOtOPOVs=;
        b=L9EqlGsdUqO4MtB6qKvGjWO1XBv9s41n+BxPHK59d/VwiMueofyndYFvsGIUqHIJqg
         e5Lqwus3Re4vfFif7QiMj/dh6uJ9A537Se4N38tqQJ9YdMeIUacQxzlYl1OTjPv1iRce
         jR6lP3BzCNU5TZOgIXY1+qR5mi2s/1H9SR0/ebcgOKE3furUtcXCwVSYBIxS6cdYdSlO
         nWypjqJAkUbVSFSnLOiG7FC3bMdvgTPUljJv+JhuyZjG0+gDouQHR7pfvsR1D2jk3nbM
         2jp2ChE0Tzh+6COgHtVXFcK768QTK5V5vF7nZ9IF8Zykw/VqfhM1A8BNAXXjVTqkGpn8
         63Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478823; x=1790083623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbqlJQjQyZug5ULzZ6y7JKD7Ojfb/phQ4FDoOtOPOVs=;
        b=xW2vvXb4LgYvaa9+CrgnlR89Tq2wsXmdyfRSZRGwXU1pyc5fQ6W/ysjAupWoYKKrta
         U9Bcspm1RWmzwrG1jTx/v91e6io1h0ssyoNOTrUGvH3xHuZx0h3BqoqU2ab3j71FwRxm
         OgcgD/t2YFG9Qid+MhtYarxYYlmZmcLXkvx8iRwMeKOFuz/HlndreBuFXsy9kF3oHfuU
         Wb6fs04YzFcnsBEpx4pc75WDa31ILxiLdlbpgm9bqeWxVIuwgIf9KZgbdQtSjxn/yDOA
         ZY2gsOcmPfB4xDVnbYQrLNa8ZW332D9Gfdw63g0dIMooBezc4Mh7JmdoFzONMDwtJA02
         kMSA==
X-Forwarded-Encrypted: i=1; AKwUvBxyVZxWhjP7oWkktTMxca1p3XeWEu4TQvloAu7PFdPM74u67regLBoJxYKT69jCuecqX4oCoVhhIL2iE2E=@vger.kernel.org
X-Gm-Message-State: AFuF++lLXLk2qvwi92gq8afd5rOA/4hz31u93gOqHvfy11wCNbG6oSKh
	DQ+bmtPVoAemB6qhT2s0zhQJSNrjZlLF4uMeizU+TJzr/FzcsOOEaQri1dSiUmmfJLyiT75U255
	o7KdChYrcOXvTEAD4FmPPm8cYrBBDS4DMUq/gdooLf6AUmW8wRM2Td6FfQgPOLx0ZmoM=
X-Gm-Gg: AYBFou3qoSfXC3R8wBpSUcT5HTdYNpStjoGS4afbdD/R5a30pz6cDhPIUxdCjY2XnvB
	CCr+sFFuXm8NLVIGMfdHFx15NmYZcV/A/nLukmlCbhvCuOQqtraNFURqdybGOzAQG9eKdlF2Q4T
	ykg4nlxqykC76apnSDfjHEAMLgvOx6CV3fiUKsyzGqVuqPbULlKLiiCGbR6aQUbBJXrslMweWUW
	r8Gd1ojsm9FhYeMHGvmq+IWduM+z7LGDdLogWdvaaijBku2cG4EOkIW4SUzE2bTYgKFd+1+WchY
	iWWYAYRT0zboEVF/pHzdy5+zyMh4FPutnzz4NP6x8HoOQIVVIq65zVzhmHpGDWEYwBEAHv+0fPF
	m4Nj/BXnhnSgtL8M3fgaCNwKtjoOeypx3XiWR
X-Received: by 2002:a05:620a:468c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a29bbcd86mr982049185a.46.1789478822884;
        Tue, 15 Sep 2026 06:27:02 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a29bbcd86mr982044885a.46.1789478822427;
        Tue, 15 Sep 2026 06:27:02 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm1248906185a.37.2026.09.15.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:27:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:56:28 +0530
Subject: [PATCH v2 2/2] tty: serial: qcom_geni_serial: Keep console RX
 functional after deep idle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-correct-icc-bandwidth-vote-constants-v2-2-f78eb611204e@oss.qualcomm.com>
References: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
In-Reply-To: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789478807; l=1650;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=XMZcz6kYBdTUSQPlM1s/g5+gV03lvS/f/BpAkn8eNuA=;
 b=nOXSuI/UktldwjJpel37rGs1AWfUJDxcbpM3fdZBFC5keaZcGMeKYtaK3LOJa/rHbkvaviqxI
 Lt894M0YUpnCrdi054NmypRms2gV2khkH87fVp87rBot6XTAaGyEhGr
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfXwOsgyACy1aie
 I8NJvc4b5bc3rMP1K7tcrNCEYtGOpxXaY86L36P27i5izESyLDHutRR4Ma5k/YyfZ9n+/194hF3
 R1J6APM74wqCvlsrWbxC0HE9AZTjXTkAFkFAWRVZfMTZt8uKfRuCL03ChJK9adaDmspWu7Y0OBR
 w9lWo759dCccp+Ftjgdg09AfMOYU44tbfPNV5dgfI+ihSboYwTXhsJGCjb2mVfvdT6tI4CgmHRL
 OgPS83Oss467sl1z5NE//EkCNwCXGbMKcRoL3v94v5vkJzRFEc5YmT+3ufwtZkFzshx5atyu5Uv
 tg+RJTPnFQX0nvm0GyOmv6XUFeBYzmRjrosWWu0ZIckwKv2UBOmaEQRotWNSD+oTXAYUiLLIhas
 UHshiI2u+DFoBzUY6pSTuT86tZs4qm80YynvcQb4BDFp/NSH7TuqSczLSQORCalid6krOFRnc4+
 iRw/Zy2WE1o91OxMheg==
X-Proofpoint-ORIG-GUID: 6gG_-AizxjDP0O-axKssjONchjfhbBjA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfXwvPUHA4CLuoy
 i8cx3J2dRS4byuPUmpsspwdEtY3LPJXBVQqTg8w1p0IwtXDft3N0+nftnUbyev/GIssIKSHu5+e
 WvRy3fDrvBOIahyrBg1NkQrB/HirTnY=
X-Proofpoint-GUID: 6gG_-AizxjDP0O-axKssjONchjfhbBjA
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa947a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZOf5TxNYE7tYtAAs_IYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150195

At baud rates up to 115200, the serial console uses only a 1 kBps keepalive
vote for the GENI_TO_CORE ("qup-core") ICC path. This vote keeps the path
active but does not request a QUP Core 2X clock rate.

When the CPU enters a deeper idle state, the missing Core clock vote can
leave the console RX path unresponsive.

Use the 19.2 MHz Core 2X vote at low baud rates, while retaining the 50 MHz
vote at higher baud rates, so that console RX remains functional after deep
idle transitions.

Fixes: 7cf563b2c846 ("tty: serial: qcom_geni_serial: Add interconnect support")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..f7e81b652255 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1482,9 +1482,8 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
 	 * only.
 	 */
-	avg_bw_core = (baud > 115200) ? Bps_to_icc(CORE_2X_50_MHZ)
-						: GENI_DEFAULT_BW;
-	port->se.icc_paths[GENI_TO_CORE].avg_bw = avg_bw_core;
+	avg_bw_core = baud > 115200 ? CORE_2X_50_MHZ : CORE_2X_19_2_MHZ;
+	port->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(avg_bw_core);
 	port->se.icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(baud);
 	geni_icc_set_bw(&port->se);
 

-- 
2.34.1

