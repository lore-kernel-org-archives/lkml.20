Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627821;
	b=EUNK3T6giFPnKLY0nH+Mh3dunO0v5KqCHl2UcMsnooH7TYASDTjyqyW31E96DslndKGQ
	 IM3KXyN0j/7VYGkBO8ix5SzVsytwOfxPANuLPcBFN4gElQnWahNS+XR6FeEq1fOEGkL9T
	 Bcv0HbPZYxt0LkSnAO5tmkb1gzgnHK5E/r8aIg2SyboAuvRGTewyMgrBQuRkumXDKJc17
	 kTXvLhBMJZ1rii3bgNiZRzWyfpI8E5LhojSni7X/kkuOK27/YC3tedG4WiATVdmvptGqz
	 fvmYcFUVLYnH1YsO6hWEYYHNcdNxkNYNxUam74kKTKAxHCJOBZsh6QQdQBCwpakjAdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+YlQw+0gpVkowxrzteiZMk4isWw2njHCkoWRC3kAEmE=;
	b=n3eq7YZiY+imQd9PZjYtxzeG339RdxxCjrjsglBuITwyYzy2FEeoC2PS0wQZ4EZ1kdjq
	 4spiM5aZLyckfVtt2QBX/CedZrvi4Vy3CLarBm5Zq70CmzC4cYX+PphvjlaIUK9Udoe1T
	 7THQGsvLynHjwjScA4TlaW+ZBm/Ycdpw+HXTURdfCu/JXA6Zj0dZQV3wxwp+KR1rkbito
	 pas5XNzSx3Bu+a/gEUqtmoqFDxbXK7M/FTedaqyLO41ADED+E2VjBFnm9RwwQH50Ubyeg
	 /bm1HoQ1VMKw2v1DTnufoQqIpVUlvoSWksEgp8uKeU+JnGRx5aUofg8vVVxA55iHbkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xylirNkO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5B606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E5B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xylirNkO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so23261795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627819; x=1794232619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YlQw+0gpVkowxrzteiZMk4isWw2njHCkoWRC3kAEmE=;
        b=xylirNkO0o6AS0pjDdwPMxXgTXZ/mlluoJKgtTiKds9yEH3N8bJttu8l3wzcqtnK4y
         PN9i0I6RK8bRrFoBDLSB4mHqdAXz0GRSwfAJU2/kcdRrPo+JLksMr/VVnrhpyxXrZzYl
         lPYRRjVyhbVSm/9tYcgC+4JWYobfOrcPNQrVtYcimn5O6Koc0mMmNTPTp1PNhiZ/mv1+
         oNvp2SH9TnavKxIEnLuxM/wj+LMAHbqP84QsaL7PWeghIe5L/9f70MD2AqxjEN5oNpVV
         EKc3rQiWlfA+PMD1ovd4C/BmXFZSkUUxe1+7rA/HuaMr422cq5NCNbutpGApi9I6VnRE
         a6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627819; x=1794232619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YlQw+0gpVkowxrzteiZMk4isWw2njHCkoWRC3kAEmE=;
        b=U3BMQEDbkLlmD53oLHuNnBk8IOQSWyqtWyvLEN1FkLMJEHbrLomugJihp5I/3ubcKr
         GuMTkmdP0kZPsV42MsphRuC2J2KvNlzHK5ihfTxuwAKnSnu1V8HI4/tQQ6Ur6xbr+7J3
         PQi08XNvbsrvTHaiTd9tKGqRDDJUaW+FO6sHH0pagyJgTlIADI027aTJaBkfOO8/xLe9
         iS516SGG9Y0DLvctISCSeloZz89B/fRLusgxWUeMZVrcrEu95B7QuGmcPZU2Mp59gYnT
         U63lkW3BcI7Kzj6SXHSX5scEhx2txM4trFO7+JIs/oGmcpNy5PASJKjW1FMb7ChBgeS/
         WpLw==
X-Forwarded-Encrypted: i=1; AKwUvBzztJjZuH4qsfvjVcX4FztjHjl5x02g1czLypx4DBr9A7kJdYA/NzI+QasNEKbOr1DsXnu4DAdLuAIMwB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiAQ+4A+f/6BQVVzEExUgK5Sg+FajNealO84Pj2l3REltysJyp
	JT/yXKTlU/jrFoKi3zpizaEleLoXCiONlXxhFpDNMbgkBcs4xIOeqCrrfB3tbFAVVFM=
X-Gm-Gg: AYBFou2KLQncRPnTjk3dauO6z3T8UvgonDuJRU4EKvdylzVQUBmh3LAA8fAY0ylEwI0
	CBUqueUA55XoyynzbH2DCh+L8DUXl87QsL9rRuwV+6tnb9qQXVpkdHWNUcLxbfjtirDJS4Fy6xx
	AjXLdrSo/M4i9l2hU7uQQw62YUk4LtBFMJ31cXHhzfhmGc/TMwqpF0XYHDpTZjWW6iTSLasFoIl
	3HJa4Z5zfq3r997wExxR6gT17hWNaLj1l7AlMvTP3/1qsBw3jyw4Rjouq78Ku8uAtfWtGO+yVIX
	DLxRieOHRdN7PDjekhR61UJnKAKLHYKCitgTDk+SydDp6BdhBW0D1WWWb/AZMgnJHR+l9eYQUpg
	e2lHvq7XaIazK1Z15S4p5GMJrmo06I4kKnO6w/E8hcDC8xEYzJCrUeJfxh2nO6Lsklxt/eLUjbn
	B8R3GUIvx9Hlok4DpozBexUpQV4fsIBxSbUEmh1T1vPyRzKf+Og6ZkgUBm4SQ+eugYOJTUBzOvU
	nMbuoqN8qrCfGq/xr+jOTDk67uEdsPNd+GmFTgemIX8PkAuUiQJF168G353SLVQgbHMHXtHUqRs
	ISYlk5nv118mRq09lssbrPgMXOAVhVTAjTFqjV8=
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ac1709aa77mr218843375e9.16.1793627819186;
        Mon, 02 Nov 2026 05:56:59 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:56:58 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:47 +0000
Subject: [PATCH v2 1/9] media: qcom: camss: Introduce CPU latency QoS
 during streaming
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4032; i=bod@kernel.org;
 h=from:subject:message-id; bh=quPl43LnX/SGT3RTKGubT+RV5/urfGjUwa+drZvVUvk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jakx2ziV76BQQWnKjYf0WDxVQMsZCzez0O/l
 OGhqqaYeASJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpAAKCRAicTuzoY3I
 OpCaD/9SMXULCUZ5fSQiOROoeOsKFomZlTCtuP9lSrigXPF+g/ADi3XlrRONLFzbP6POWmiky+x
 nGoS4A0noZYAUpwPo3Ejy0T2qFQlGZAPOp6suZqsVfJfdcbvFJTkfTrsC6t3s+wxF1KC3S9LS00
 N2s33/VeSrfwYZTr2Zcv7lQ+2XGzaiGr9T0oYGNBGa1f1EZoA78R/9AQUrxdxb+gzDrqi5ngoAE
 dcMq1xgVXKcbQCrltRzHGk593hQaLNeQrlXC3OYAnzhsQKsYnnKK3AD9lF0VIdG6m/jpXSHS3Jz
 RfLlzU/HYQcbKCohkxUlzS8C+PheyP6wcx7zp3FwGliOmCQlDm3SUO3AAJ17A5ZTvNFnMZDDNcg
 UFe1sPF4I1R/jjy/6XAnEfcRQ7hAPyBnKZ2AA58kJ5F5KcMoHv4LnQA9VqlqmhKwp+Qp/YIzsXk
 n9Xa+0/Q/gsu/Ku/ooKJ7w9J8ldvBpu95gR4y6WLz2AQQ6JKSeH56cp7XI5mN75HCkDeyNPV4j/
 PhvYvSWE741tHj/2o43v5KBdJMfDk2qDD36D+9mke4POmiby8GqvnSU1QIaraC6KQHBJPBixSAX
 PEXxwpOW1CK3KapuHd5Sq85p9v0yMEepzEnwBomzF5YLG+kcpV+bURcU6HGzg+It849DlZ12X7M
 DOKMl22FxfC9nOQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

On a quiescent system - for example the X1 CRD booted to a simple ramdisk
rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
interrupt for buffer done could be delayed until after the SOF for the next
frame.

Fiddling about with the interrupt bits, clearing them and changing the
logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besides
"felt wrong".

Tracing it looks like this:
<idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=1 done=0

Tracing with /dev/cpu_dma_latency = 0 looks like this:
<idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=1 done=0

The second is the pattern you expect CSI SOF followed by data.

We will require SOF to track and understand which data-frame is correlated
to which camera stastics and parameters frame. On an ordinary system with
several things pinging off at once, WiFi, display, keyboard you will be
unlikely to hit deep idle and hence unlikely to see the long exit. However
we should design for the case where the system is otherwise quiescent with
only the camera streaming.

Choosing a request of 300us - 1000us seemed to work fine but cutting the
margin finer, similar to the value on IPU6.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 11 ++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a9..52bb19f5fbf3b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5834,6 +5834,8 @@ static const struct of_device_id camss_dt_match[] = {
 
 MODULE_DEVICE_TABLE(of, camss_dt_match);
 
+#define CAMSS_CPU_LATENCY_US	300
+
 static int __maybe_unused camss_runtime_suspend(struct device *dev)
 {
 	struct camss *camss = dev_get_drvdata(dev);
@@ -5846,6 +5848,8 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
+	cpu_latency_qos_remove_request(&camss->cpu_latency);
+
 #if IS_ENABLED(CONFIG_PM_CLK)
 	return pm_clk_suspend(dev);
 #else
@@ -5866,12 +5870,17 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 		return ret;
 #endif
 
+	cpu_latency_qos_add_request(&camss->cpu_latency,
+				    CAMSS_CPU_LATENCY_US);
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
 				 icc_res[i].icc_bw_tbl.peak);
-		if (ret)
+		if (ret) {
+			cpu_latency_qos_remove_request(&camss->cpu_latency);
 			return ret;
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0d..7564a7c46fa24 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -11,6 +11,7 @@
 #define QC_MSM_CAMSS_H
 
 #include <linux/device.h>
+#include <linux/pm_qos.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -141,6 +142,7 @@ struct camss {
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
 	bool legacy_phy;
+	struct pm_qos_request cpu_latency;
 };
 
 struct camss_camera_interface {

-- 
2.56.0

