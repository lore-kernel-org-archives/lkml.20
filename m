Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE487388E6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256264; cv=none; b=A+kwy2Vuxix110QCbQ+w330mnTNQokPtvy04zBEuGwAYESXSr81imUZW14hzAwGXsHC555q/sN203ktZ1eD0qfGqCPWO2G7FqSW90amf3DhBQ+Z0Qe1FbroJWK+mD4GBaO3zBglThbbe+k2WZchDp58IwxEvRpvguDyc7EzHiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256264; c=relaxed/simple;
	bh=YReVS6syWbb01W77iJ4bbfDqymS7FWjvd8udut2aD6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b+3s+4WySHNsDCLGh7aymNy23/LmY9hxRH+DYpwlODKGVtkFuagrItwx0kvxRKrBZ9oWuuJJFr6H7fLykvux92vadnvjmyhJFrIEog3gaBp8quoY1PKtC+UlQqfXI3iaPZ7Or5OVUukZ5dvJFDN8dfa29PIhFFkORd0unyLuLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDLrhKJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YL5Lub2e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDLrhKJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YL5Lub2e"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179OUo2321946
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8ZwrW2D/37XuvA7RvoqHHm
	6BwB5O0hZzk7QEuCCfRiY=; b=GDLrhKJKg9bgtEjGHMXv1rRCg3KKoais5kV93F
	BP3N8hKhknNcCKKRP4CUuiTQxHW7iOeg+qGhxh8WXq4z+r14nXsZZ2siwfwmDA1/
	mEdCeQUmyvvCIbrIQS1/YkVYVlqRalcaC2b8tm1xO+KVCzIqBbb8Mh2Fr2VW16HB
	ZBewNMBBYNxm1neOSpLYd/EV27TPuo8JCg9yNWI9aBhkmqh/WywbCCSZuZkDn/pj
	rj0K09sQjkLwk9hox15T6XOCSMwv1ZqyX2vKw0ZwNEVSAYzMjAMMWL/p3mhRp0H0
	T2Nhy3Gi/gHzMBsZ5nDcLGGf/C/WaQCFMJBbLbjZNg2j84kA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchba79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:51:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so1126071a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256260; x=1788861060; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8ZwrW2D/37XuvA7RvoqHHm6BwB5O0hZzk7QEuCCfRiY=;
        b=YL5Lub2eMpyXpHbNrmVENExiN69Op2JtFwgn4Ygx8+nKOaRzeMQJFDmxL7bdHyN3Hj
         XrjmiSu8AUWNvhY+EV1oDvs65mKlTggY9sE/FjwuN4ao47Npa6tTGxai4PIPe7kv6feP
         4iH7gaRHCQ3Vwo2CQ+U+XubozSE2HDiQityIaFN5s+E4C/5C9G0ae9ru7hu0mQa5hmYO
         duUwhRTR6vG/+3sriSUe608hEOElde92liOMJUFKZJ1ubfJgfG6lgrf9+AoJ2GJRwYEo
         viVS+0sl2bIdTc0Z/jqM5RLDVCEAabXrGdBfWZ47ttAypaXeGIAIWr5lUl/ZzK6aKTV+
         z5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256260; x=1788861060;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8ZwrW2D/37XuvA7RvoqHHm6BwB5O0hZzk7QEuCCfRiY=;
        b=VMFXqxoynC7jXocLcniFYi1ifzvRlpbLOB26MPdtosRyArpGb6I8gh5FWElvbDAzXV
         UUZp2xcNwuDhOArhadfD567IL7alb9Tp8VmoMpXxETo4t+zT4E/GyaA3sRQWFtTTxXwG
         AFZ0fFerAifv4DND7Xw55j5nlOWHOCJsnrUTF/lpEH/c3Kb8HBTB2gEhr0iR1LijhSAa
         aq7WHaOfUKRjumYQRDgaeP83C/gK3irwuOebNu0MGqoxLefSbt/UTIZqYQsazCNYsgIv
         UgycvbDKgOv4HHM6CWRwCI1N9AiKZnaifnKeG/fw15fb/teD2W+qS+duM4j5GAOf0cTH
         IqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeKrgjVHmUB55Um37t13YnDQL58RtYsI2WrAJ1PC5haO9GbdbWbysNYY4CIM7y5b+8PpSc0w09V9s3D3o=@vger.kernel.org
X-Gm-Message-State: AFuF++mducVMwKW3A+Mp6CfBIlQcOigyYvUyZmCEjrBId+zUjRsuF069
	/BG3kDBaXAQSnuMiWybc63cnkeh10zLzMjBcKv6Tp+XiyDCkPgT1q7BFY11llFCM5NYd2zo+y6W
	y+Ja3pAZTEI23n9B4Lq9e/tpIzikyrSDFpW/cpoERiUmr2eXoINGJoKX2gIBsWcmp0Is=
X-Gm-Gg: AYBFou2VJO5jh9kckNJsB3wqQZwX0CfbAqJSCGFqPBPsk/Ix2+P2AL4tHQWfD91IGM6
	rhqG2/kwWJbMNdrxZZhcBtA3jLl6uVcK6DmE2u6VN59UMZ77ZMJlxoohRdqa0fJnCryKPDjC8rJ
	cYcv5z7HEw5sZWG+FZCTORs1uQ9FxYp0iexPIarCFbUHR02f9Vl434R/HaBGLvksM1d0n59PnEN
	1yG9aUOzRXD3LHpCEJUJnde9AeVgDwXk9T3waEbopB/IS4ROwHXy/bbdZ3emMR4zKaYMlVMs1YH
	H4eNk1w8zPTFci4GTq3+S5ScQL0Jq67YuUzl/xRtuaOVFJZRusENQZKeRMpMy7+rRoBXtXXB/f8
	0Ysf2uu2iNmfsOLb/+pjvqBKYZQ+EaCw8LR0=
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr38126682a91.23.1788256260455;
        Tue, 01 Sep 2026 02:51:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr38126632a91.23.1788256260006;
        Tue, 01 Sep 2026 02:51:00 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm22943531eec.12.2026.09.01.02.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:50:59 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:20:54 +0530
Subject: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP2flmoC/yWMXQrCMBAGr1K+ZwObghW9ikjJz1ZXJA2bpgild
 zfq4wzMbCiswgWXboPyKkXm1MAeOoSHS3c2Ehujp36gM1mTdfY8hhe7VPNYnS5mIO9PkeJ0dIw
 WZuVJ3r/pFavF7e9K9U8Oy/eGff8A1A7IYXoAAAA=
X-Change-ID: 20260901-probe_cleanup_uart-60bb7d0df5ae
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, naresh.maramaina@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788256256; l=1890;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=YReVS6syWbb01W77iJ4bbfDqymS7FWjvd8udut2aD6E=;
 b=3tglF5AuwCfbTqZLtyBFfDJ311lwFjHfz/cV9DuFxbxICvceVUTsaRayIvs4I0MDVHLRiqlne
 8PWKtPTSa7sCD/W8Mv6oeaa89pO3yI01pvXFZ1H7nLg+eTPnzPgAkLV
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-ORIG-GUID: glHcsFSMmq_oHhPU7L1CCewxKqxvAnFm
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96a005 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9bSrCySMXrS-07SZ7OAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: glHcsFSMmq_oHhPU7L1CCewxKqxvAnFm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX0tTKXZfroZcF
 fXamjE8jKSV6OJPwZDJNvKBsf51gjowev06MKAtu7bzb0XJzMNbHmwGG7SuQTMyUOWlKDSPkKRI
 IF9SXQ6WiPRLAeJMASjAsmmhswGwVeI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX/bGSn79PVF41
 mMG+zgJH78j65DXnmvuAJTRGEdj1BdxZLV9aVLkeN36mbfzOCs9h2Au9zJdu6Ykj1hJ8mRPP/fO
 syyPMrAaIPgs8KWQzRdehag4VVpRxqgcOQ5HdEqj0w9dWOV0B4xcJFPnKRcVhHxfuj3NR8A8IUB
 CfUYnE3MgAoBvsWYZGS8a0orcjIkW4EX+4XKLz8V3pLFNsMJJIQkNSb8KxlgeEQvXm02W0+9AEA
 JagMkvcFC4ttfPnKJ79xLv4b1gDKLALqhaAfGbwgZoo0qZ820+RyeUebKvb6uHD8EGSdFPZOTD+
 2VIeCKHel7VvBTGbFAcK+2u3h7U2ToT0Bf6OiG4JFxeBO1Uj/8NSxcgv9x3asrq81YKSdVSc+ds
 5sGwD1xtvYhXuAuW1Yr5vTEmaDYG9w0pg1CDhFlxFkYXd+iMvaNzeSNRkOKNoU6Bbk84FODGcwb
 NQouiqTrULj0V9w2StA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010086

The SA8255P UART variants attach PM domains through
devm_pm_domain_attach_list(), which registers a devres cleanup action
to detach and free the PM domain list automatically on probe failure
or device removal.

Remove the manual dev_pm_domain_detach_list() calls from the probe
error path and remove callback. These calls can operate on memory
that has already been freed by the devres-managed cleanup, resulting
in a potential double-free. Also remove the unused pm_domain.h header.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..fe961b206645 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/panic_notifier.h>
-#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -2008,7 +2007,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
 		port->rx_dma_addr = 0;
 	}
-	dev_pm_domain_detach_list(port->se.pd_list);
 	return ret;
 }
 
@@ -2032,8 +2030,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
 		port->rx_dma_addr = 0;
 	}
-
-	dev_pm_domain_detach_list(port->se.pd_list);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-probe_cleanup_uart-60bb7d0df5ae

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

