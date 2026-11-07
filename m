Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013317;
	b=ipMtggRMtoIPClEZJBdIiVa0YC7awhEn7o/resKTl2lSuJmrcT1gyuEs+AufS2+lD1o9
	 BRCMsPyFzUDojJlRV0iFfc0hZG90IqNvWOg3Tz4nuUrZvNwDPWNBONkFCPoFWvtL6STU3
	 h2SDeuNMnmz2kaZ4HsEOJ4E8zBA/kwahPjgDYI9pCeAu2le/HlHFbViflQAdx0b9/Jwh4
	 Yeqghzz7SdqskYl+5sKCluALK+K4QxZDneQ5usU/TKq+YO5hW425SlnwXgZilXzzsophF
	 Wc5whZ3EvIKcc4j9dlVCZ2szREPDf/R6WLSjeTfgsDbeScx+7wFav1pZlTxg4DNDjaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cN0tCITC8eXPQy35PjW1mWs5jmaxcmaoAKTS/bpvNk0=;
	b=uOFy5fGCKCDCkz/uh6NvtLi1TJQ0P1O88Fy6XOy95TvYROXXYt2rKKG2khxe4V/4rYYy
	 qJp4WclqfkUQsbwdYKhDpvjdYOMRz2+Wk6nLT0kD8L5bTOFj+qjlEgg2MMOO9nxjymWU2
	 Q3fhnurSPD5OTQlt2IWVbFe5QMVdGgCeuutzn1VjnzhD9pqkpZKwDMSuJPP+z5p7FoBbM
	 fms7orzBz2vbitMWeQ9169K7SYIQutU7Xhgm3thMqDaHqyQE5VvJasAWvYYjOfeLeNw9O
	 p5LE7M3tGwfIuaD1C/wfQDukpNtS6aYtRG/fmrY/68zNguIAMNL1FFPi8tNILstojgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tt8i+Av0;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45DB606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45DB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tt8i+Av0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8435655e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013315; x=1794618115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cN0tCITC8eXPQy35PjW1mWs5jmaxcmaoAKTS/bpvNk0=;
        b=Tt8i+Av0DNcEmrTRD5tlpQBbGP8qftkJlX4dqwthTFr5v4WAADtmnT1c3SFS+AAr3d
         R4zKMpeqTdYFDDTtN6URosa41uUgH4uPp5XeN4sLHAfALjOQCNc9CbaLrSd3Hoxl1pf3
         Ub8WDnR/bWuZpBHRpjjSQyU+mab7xTsdGYMlqNhuESPkTk3GGTYIPO3ZLy3klWsceKWV
         8XYTHWw0tU7WIppuiAtzwi+K1OtMLA9pa0niimLmmANSMvH60OB0zjlXlQh5ouWHgbfP
         T7fx+5u2aU1N3l6NFO/ofRmrRl1o/GsIIow3AlKfKfWXFW3f6p7BqOOtuHNYq1Pgpn6G
         v5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013315; x=1794618115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN0tCITC8eXPQy35PjW1mWs5jmaxcmaoAKTS/bpvNk0=;
        b=yozBiPJVslwtQVTJtH92QoSzBbKvmdpLIzM85HQIRhHaDoKSe63SRuUsRRn1OtD1vQ
         HFSji8VACbMU85G8SiwAsWDb4LDzesDy0zhQr6UG3/9YqxkZDxKeWlMB0P+elZPW3dWs
         fzbFCjFO7UvSaND+/rvDazcq6+8lfIJQG0MteVrVpRGcqSrw6w1qKKCknYOP8DEBeNs4
         jFen/KGcH1MUQapnqRu6htnK5Wzv3WXy7n0P4Y+FXX/kIuc8WZ8kdfknomo2hIM2AWg9
         l6j5G7Wwz435Y9VGBghr0G4DHZ04h17WjyqoUFqa/yecD6MlAFSFWNSfcZZ2pON8Annh
         NqHw==
X-Forwarded-Encrypted: i=1; AKwUvBwjz7m3l+YCxFt8HLXOE88iNzM1O1WpRs5w5Pg7P4SoIHF425hc0b7r7AF7CW6upBBn+19ie+9XYRlL9VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HoGcCsTTtfInazV4JfW+y5g7xfWuAt7RUdmNVaJX8PC4YpCkT
	72gPvWqHobrwW+biFMbjH/rZNZWMy+SPl3l6C/RBTAdCUizuGISXNQpxCqAdB9AjUeO1cPlESxf
	R6P+7
X-Gm-Gg: AYBFou1fsXg87XgjD4lmHpt1fDgsLCfZ4U4ewAjfEVxLMiLeX74kkpQBwF3I3yEV/v0
	H+69+OemRBUZ5DbntU8m1YPOFoZMsfKjlDitgbM22Y7LXbr8oGebp0cO/eu3mT+3iW28Z3k4smp
	cgL7J9TZ2S5smF1uFg5z1biwmSMJhTrOI3Nr2ek98/V2YWQi0NhKS60bGhrBIHOgpgJXVC7Lg9W
	eFCSLZihrRW/Sxv2wdlJ49TTP4uQdf85qkMhchsQi1NpZWojMlo1HLBJY4t7/mMY/QyeMtHjj+G
	+umX+g5ib3O/eWhlwNZ6sSHMfy6knZPO+Ljs6cm9Q0rMINeHUbUyWrJE0BT1F3nNrdos883Uam1
	d6SnD0dnpLLaaq4DiD5yHJTuxMdr8cjVsXUmJ1HtOUinY5G85p/1RnLQJ9092Bd6ym5/wKJ126j
	/CpUzlWh11Cjvq9aHNZAK9WbOePMhKftfEZmfxVb6exHNFR7FOSR1KQrg6iD7OYmzTUEf+i3lRO
	UVXu7d+bWSnCdi1jo0pYy19kuKDZxyZcyaE2PFA5GyCcRw1sI4rhDGZWE2xs+MgF1KkvRN3/sl7
	0pbaAfmjJanHCaZlOmwVQg==
X-Received: by 2002:a05:600c:4eca:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4b6dfba9e37mr74959715e9.28.1794013315215;
        Fri, 06 Nov 2026 17:01:55 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:54 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:44 +0000
Subject: [PATCH v3 01/11] media: qcom: camss: Introduce CPU latency QoS
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
Message-Id: <20261107-v4l2-frame-sync-v3-1-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4141; i=bod@kernel.org;
 h=from:subject:message-id; bh=MC2tO+LZrLf5zzRExbvRDUfAuASfGGTJ0bSBkOMX364=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh8SVPQ7ia19gMcC0jbaypy+nmjcM0mq86pL
 xdSDos9LOeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fAAKCRAicTuzoY3I
 OmUVD/9FCrMRm4VbFvpsZRtaoYFlduya415tQSN7ulIWwMib3VyJeCNdnbEoiEDqd2i4rWUkXwX
 zov+H4UGSSI85kkAUDP6x6PEfnsKyTmhjcmeteKWBhG8XmQf8GX7Wxo0Uev4viWc4aWCIqB9ari
 wMcbtcBVbqsKiRL8F3bQULtX3NlJiz7YfQ7HVsexSpxA3AyXnnpQwkLJVLk9AcCesCGRK9/VLlM
 bX3urLZ2Iet668qq8rRmJ6yezoUWbLzVBqJ50a+xzrzmcbsk6REOsOoly3zLsDeD7EFa2qIN9nz
 vbQ1iFx8uI2e7KpKqQz5ziWHCmSzOxPUsJ5VZEDlHjpfSGSbWoRTDt4zyAriT1t2fmEuOu4UR5j
 iWIEq5+53cZc1QY9f8PbKCmc/2aklt7RW0yjjErtnsnf03ZUK3wOv6u/blWMDwgHGQ8hQxmMJ5F
 uITYVmjuzlB10Fp6aerh/rH87rVAvmNF59pqnsZlSEopdY3YWfJ5jDqI58WaPUKMo7PcFFrB23W
 WicdrDVFBl2D+rVrttNoluhBnSzb3Z53cib1c2D7C5ksiNZIcYd/DlkVNrkkQj6iif6GyXMZRsf
 q3SqCLUfkhvYkyufFNrJjSAl31lismh/j0uV0c7f7g7WryNBrIEXL+O1RXqcISgmHiCFdbKckEF
 JrjUlHGyDXB4Ayw==
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
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
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

