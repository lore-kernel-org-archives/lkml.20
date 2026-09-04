Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061F47F2D8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535185; cv=none; b=uxITo6tKTFFWlEkyYK4ehnMTMF/l819WL9xCQIkmmzvoTvFc+2WssjkgOqH5mxiOlQGPgCVb2O+yOjz+gTHpfS7aO7wBhz88aq48c0UDy4waLf/bG6HiqzGMDW5SSXbMBOmMaxSKUMXYoGhaxfue0HAawMqUq6JJH3SCDMpzbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535185; c=relaxed/simple;
	bh=P6usuYnYXMY+lUKUrNREdDxz5CBWnzz3JutftfeRACM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YURFMrFi9wyXVykZHkzGwpXNaEVZx9NBaG0fHAYquy6Wdn4meSTNkkgCUGNffmzuGqUoKNt4nQNhhdZBVImt3tadleyaLDsizftyUvaAcpZfhslOvgVTm8Tu5DvuKUMnFWJCqgTVy61uQfLvw3awFsv9kOei784wC0oCqomL1jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypB/pPGL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypB/pPGL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so972651f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788535182; x=1789139982; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EClKw2P25D0a1RVoGnFlThEd3iOKLQoxQmhQa7uzg8Q=;
        b=ypB/pPGL8Fc+P7mV+MJnowyoI5KfmYRJgG/C4Ge60cW4Y/jdZW/DHo2u+sZmNiBZcI
         iVJr854bjdySrNaeCQ+8bhHuBRT/KU7fGJHn/gHeEyQj8/igXbT8AUIxBY3m3WMM9m6C
         I2DUYZjLmsxG0fimeyWmJVjkE2FnS3Ye0JW3o6yiOoH5OZNKr7YGR8SjbXZqjoKeYxwR
         VlISiCYPJLsUtgP2w2Ghr78KCRMxLGdrUTUPj5rr+k6LGfBEcgg0AXDuIjg6s1B6tHIx
         4Q9VJjB/TNHN/nDGInqSRzhxuoni9RPgJCAbAs14lkNweBRE1vd8fEwP//kVL/L3ZiAN
         7RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535182; x=1789139982;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EClKw2P25D0a1RVoGnFlThEd3iOKLQoxQmhQa7uzg8Q=;
        b=L+by6PkwtHwPNrapEyNdlQjNSESH2MVeqti/cE+Jgl3tEaDRFNK2ojQzTgivMAiSHt
         q1TpryJSjnaakF+XAtycdwo/f5XUxr03LkOpvfPPPEFZhDjSFl3DScGAOOGjVut9WOF0
         0w12KO7FpZE0cXPKMOeSehH37TXctNYY6PqvwFX/0cRfLrB9GceBtEz7drC72iPs6YFq
         lL6uIwxfc/h03ZXtktQhI90A55IRuJ5NT5LWJounTLBecPKfn24OlKyEJXGXGTzHv5v0
         m2VsbCEaSQNsb0hji2nWfJKB/d4upf/7081eootlb5cNaku+LENhCC6GNHXbvHjgozTQ
         dueg==
X-Forwarded-Encrypted: i=1; AKwUvBwxQhn6+dmuO1Y8tpkC33jWxuIEMGKFSpdG2ahDFFbhZ5jzOUXaI5VbRjLNt85ThonZRBLARwIaz3nLJjU=@vger.kernel.org
X-Gm-Message-State: AFuF++lhQthOSxXrkMJLVpyQR1nR7aDnXjQTGOQX5lO9LUhTfnx/qPxw
	S1mIPUk2TgJiXOpTRnBCQJqQUlnb5VqhONJTEfE1e5eUv7X7BhE5vRyhuujTLgglg2A=
X-Gm-Gg: AYBFou3ZZSEnvTIzes5LnjVKBD6pqiouaX7cfKh+C+FXDpLnNov9/8gRNO6jrpa+QYy
	IXI7BchxD03vaa2Xi0L1LTREU3RtqT1P6Mlr2pyqv4sWcsxIn2YFGS1SCCpq/kH2Mokuwbv9Agq
	RVv5JG/E+t6aVP7yfBamNIKQG9dDANW71zW3nUf/wvclDGVYEFYUr73oetNnzUPJ8AGFMqDRL3x
	vRCL6sz+ZTKjx7mBwE1+cYk6RFBmSJknERyNpTSu9BHJ0MkdQxTHPcIaSs58EE4Dx1Hj5Q57PES
	InVVSegqaeXqmoZeIgFvVbh98YffmRwQNsM9gw6bl+UPYyQjWy71fv6NoAYVgeAaQjM76GcGOsm
	6LA7x8uwusAhEvVr+BB9Q7glKA7zPQtpzEweBAmYeN49uU1RxcbOk/vyB/9vms4IMPQEiNUd5tt
	eHJ86P2/fuIaaQedYvr7y+BU7Nifjeec14gXrhmv7Ry9/80EQclP79v27YPUWIc5+tzRJzTiCzy
	Da0D7+IkpO769HVVSLC
X-Received: by 2002:a05:6000:2584:b0:485:8c16:5efa with SMTP id ffacd0b85a97d-4858c16617emr4578538f8f.52.1788535182108;
        Fri, 04 Sep 2026 08:19:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm8026663f8f.33.2026.09.04.08.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:19:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 04 Sep 2026 17:19:37 +0200
Subject: [PATCH v3] tty: serial: qcom_geni: don't ida_free() the console
 port line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v3-1-541757ec8a95@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIjhmmoC/6WOQQ6CMBBFr0K6dkxbwBRX3sO4qGXAMUhJWxqI4
 e62uHLt8mX+/PffzKMj9OxcvJnDSJ7smKA8FMw89NgjUJuYSS5PvOEVBDuRAf9SS81hnnxwqF8
 Qwgq5SQ/Q40jQ0ZIeNXQOESotmsbIumtVxVLx5DDdd+n19mU/359oQjblxIN8sG7dV0WRc38Ni
 AIEcIlCmVJovOvLQKN29mhdz/KCKP93yOxAVbaq7SrBzY9j27YPnVpDNmsBAAA=
X-Change-ID: 20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-4a199c25fd84
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=P6usuYnYXMY+lUKUrNREdDxz5CBWnzz3JutftfeRACM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqmuGKflVLqbR9bLN3qKodFe1pGUkr4HK/19hrR+SV
 QcCHJQqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaprhigAKCRB33NvayMhJ0Xl5EA
 C9tH5rgY/NKfN1CytzbbzmoycanIKnMeI1dFNqQ/P/5WdF/CoV9V3GAsTGqWGzYFEHjh01MEo2Nxic
 UIDyup7NXmp01DiIky8U9WQa/GQWU/WiXKgq6Gt8n1ULKUDTPGY0n8rJTYspyCXDvnjUu7gCaQcGas
 y/Ja6Ws0ENZgPkX0xWDKiZxmYIXPzUuTZfUxD1ASM6b8lOr4QNIttg8k3Gs4yuH+l6K1kuKFNbqUwy
 eVR8sUJjJen5BIrQtETpbxFWja+lyGEe890lrCQP56fXjYx5NTR1M3o1tnqa6QOkk4/248KyvI8iSZ
 v0L+6wsxGpS1AKP94o36ck0FhYxfO8KW8p4eotVInyz34HqSdEyjZ0hiGOrnynOi5Hv73SWiQn4tHV
 SRMuclfT1SLi8VXLhRMPGxowbrNhte3xj2RdnsKBKBqoD/BucqXvZLt5P/n/yUui6vzJnlfgN4nbAw
 4myfdDopBDwYb+SVntwOW/gVxyUzKAkr/p7a/P7UoGTAUL5g1sKu2g+V+1wCRQLaOggS9xAs5uYT19
 LmP7xIQf40oF4xN6YRZo0nJpPIyLQSlzyD/BR5rMk/5L2mpghiGZHrLaijnL81gvG9C9hH7G1eoLCh
 jGitOnDC9JLX+8bcIIXZVXqw5ElMzTEyn2+4Ip1C8thsEpAdAYisnUON4xiQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The console port (qcom_geni_console_port) is a static instance whose
uport.line is hardcoded to 0 and is never allocated from port_ida.
Only the non-console path in get_port_from_line() calls ida_alloc_range().

Fix the qcom_geni_serial_remove() and the matching probe() error path
so unbinding the console device doesn't hit:

  WARNING: ida_free called for id=0 which is not allocated
  <snip>
  qcom_geni_serial_remove+0x58/0x80

Fixes: a53be6945f51 ("serial: qcom-geni: Remove alias dependency from qcom serial driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Also use data->console in remove() because it oly return true if it's the main system console (Konrad)
- Link to v2: https://patch.msgid.link/20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v2-1-0e83d8df410c@linaro.org

Changes in v2:
- use data->console in probe() because uart_console() return false before uart_add_one_port() (Konrad)
- Link to v1: https://patch.msgid.link/20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v1-1-02e18c31aeba@linaro.org
---
 drivers/tty/serial/qcom_geni_serial.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..1a36e9fad976 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1979,7 +1979,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
-			ida_free(&port_ida, uport->line);
+			if (!data->console)
+				ida_free(&port_ida, uport->line);
 			goto error;
 		}
 	}
@@ -2015,6 +2016,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 static void qcom_geni_serial_remove(struct platform_device *pdev)
 {
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
+	const struct qcom_geni_device_data *data = port->dev_data;
 	struct uart_port *uport = &port->uport;
 	struct uart_driver *drv = port->private_data.drv;
 
@@ -2024,7 +2026,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	irq_work_sync(&port->tx_kick);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	ida_free(&port_ida, uport->line);
+	if (!data->console)
+		ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
 
 	if (port->rx_dma_addr) {

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-4a199c25fd84

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

