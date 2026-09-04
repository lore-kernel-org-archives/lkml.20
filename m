Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933A63515D5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511859; cv=none; b=PPTgzIIuQRgbm06mStt1korlJ4C8l9GnWpjSmVyb0/ITE4TNisMmxDeRFeGgEQknrp3PocQmbZ6iPJM8eZy3V0MckgugtS1H/oPWC2W8gG+9DAQAbQDhMSBzLf/vWe5OtEjsUtkXTkzPpROiKKpDe4Ulhbt4N1V1tPbA65OIm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511859; c=relaxed/simple;
	bh=N638MSaY/9FWa2D7AwcPHSmd0cuTobWXPfkN0K8ftVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=smTIP0yb4x4qdf2YODJKrfONM7nIo2m4R0AP2lU30WewTOwDof5l8jlNMxuWrfUoGQVZhGPWJQBCzARuPVNbM3/KjkyABMBw372vRD07+or/34tfsKaSIk1RYk0jPtucb2K6vk+qypwJbW/Qs14Vh7wRkSYVI5w8hIuP78HmX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBV17fUa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBV17fUa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso7102855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788511856; x=1789116656; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y3KK8ri6pIRdV8UthsbD8GyihBgeQCr9wERNybPcorE=;
        b=HBV17fUauIMxN0xCTm4ecbxQ5Lp++ao8Nk3vFgPaq3o7RVMZzD5imFYUBjGzd4W8Bd
         klNiPaZsIUVXBs8ocYGoQ0LGYNZKa8ZeDPuR8GCeSaiadLVj1spKnculHz7ZAX1ilD8K
         UvFBhsuTA5Cpw3btclQnsJCHQ31I/UFvBPBvFUqxiyBeoOlO9hpjY42/VwvXaS4oq8K1
         2Gmi8+z2fYkD4X4QhPTfbDJsQJkp7lStnmaKcn1HXUJm+Gm7ViJQBZ2hnmAUOj/WjumN
         T8co2FhnBJTQQtc1tApcHWpeS+kV0Ux7f9IzK2D5EvbEeeRgxI7sZ6yvB4RjvvQtEzqd
         jFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511856; x=1789116656;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y3KK8ri6pIRdV8UthsbD8GyihBgeQCr9wERNybPcorE=;
        b=EDSqj9+BBom8qrwLfg2rfOLykJI2xuLhberGTq89jJjt7AbdpWtCDigkAlLTcvM15d
         Nc8wqJgS0dLY/7ezmuJM5uVxhQo+xzrZVqV3aQfSjtfIjydrxY0p2ZmfYvY9lqq57iM1
         uGsVVVfV2XPkcLyt71E2O57FC2VTkKy4ISNpOSXfsV8mUocyd2SJS8SGaK+cI7uyD4B0
         XnAy5U96m9v+kx/xnnduChBTpQgAJFND3eqfv3pvkOb/klgg452aSKjTblVu2Chk/eEc
         NAp9WUGF7I8svM7HsD/RJeqMriMAiaKKhZinG3g5+bE5GJdp3mwmssNeFktvxsh8WvBK
         rFPQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6ly3JPwrzypaxrEgDunKYimgZTWQcciwjy+h1eBzoppwLHOsTT2JdvPsPiAWlM8hNn/y14p8FPQudSZs=@vger.kernel.org
X-Gm-Message-State: AFuF++m1QmhZB9HLfyjQelF2qGWDwp0zfGXrlOhuCj1rb7iDMboVPv9B
	+bexwUnPv2458Oc7cHTti+5uNmjjAb2C53ilOeZHOGnkikbgym28UXW/ZcEc6dLQg00=
X-Gm-Gg: AYBFou3IorBiDkWhwhO4hV1iULzOhBSOiMWLO8W8/2WtCcNYTJuhxCIn4mZv3wP4W6I
	SLjY2WkPcHZvZsgoPLUimQukA0L2SG6wrbZS0xgIzi26oHm6xm5qBiCP8GNeMxrQIYbMHv0G0Vf
	/5g2oKmUqiLlOJ1hDHiNgCytdKZC+TiFRzF/zEXMZN7s5Rhv8gwlR+I5iyPlrZoaUTcG9oSwRnS
	IOIw2FfnTBRIufl2tQhgvS1A7Fy7lKe7S5m19Q5xCDrT9usQ6+SdE6rkcdsonG7AKK8eN7SOQVr
	8ZpLZxKJhHH2WcwLPNyG/l9Agc1Kyqp+7TxQuNCDaetVPg9yoRGQ/fHX/SWhfSjntTunw8lkb0c
	1UGVLXFPue/Eo7tQsMwc6fsAR8PLJDw98BsLuDaWEVRGhUHYRCtmzfZp+YG6KWZ9n5fTUeyaIY4
	fUXtvnSgEwhpfOZun1HJ9vTj1aAfWdSAWWpA65F7RE4l4objH0Jk+3X+fcPmzrsGnabZTY2yLzR
	166O/4J
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49cf8252497mr41832305e9.8.1788511852012;
        Fri, 04 Sep 2026 01:50:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm48748275e9.2.2026.09.04.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:50:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 04 Sep 2026 10:50:50 +0200
Subject: [PATCH v2] tty: serial: qcom_geni: don't ida_free() the console
 port line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v2-1-0e83d8df410c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGmGmmoC/6WOSw6DIBCGr2JYdxqg2mhXvUfjAnHUaSwYQKMx3
 r1gj9Dll/+5M4+O0LNHtjOHC3myJoK8ZEwPyvQI1EZmkss7r3gOwU6kwX/KteAwTz44VB8IYYP
 UpEbo0RB0tMaggs4hQq5EVWlZdG2Zs1g8OYz6Ofqqf+zn5o06pKXkGMgH67bz1SKS768DiwABX
 KIo9U0obNRzJKOcvVrXs/o4ji+FZKl6BwEAAA==
X-Change-ID: 20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-4a199c25fd84
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N638MSaY/9FWa2D7AwcPHSmd0cuTobWXPfkN0K8ftVc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqmoZqFnTd1hm7wJMx0uIr+YccCAr3W1OH1qfx3Ufa
 MdFhOJWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapqGagAKCRB33NvayMhJ0UWsEA
 C6y6ABoiD8y3pN2EG2g9aIz/L7yn/7Pjpr2xf80pz1js/Mv2vBSzsTl1m25nNLdFICtKWnBo0NJw4L
 B/vMDmYgb/MnbgOfdW1QxmEvQVhEoDQExgXLu4P4QreEMolkf9YvoqsxCW7/Bhb2am2hR2Q5Yel2cE
 fFDHaLGG+h9sAlmKsaWz40pu+fkbI2oLfcU3Kv3OzkxsHuah+IrFGSNu7UXKSz/nu56UL0OZLr/lsY
 /A5Zzz3QPSJj+OzcGoFSawBVytUZc/DJrgkxhEZCpUVxMVqt9jHVeqgxbdIAhVRQF6VuxDeSfFXIrv
 vDy9A98gcCREMeGPSzn52AuYGWD1LKDoweC+lp+qDq64xdNaTfLNHLNsIQAcjdv5vgOJHfTnmQiGY6
 srpF5pfQi+IAl2BjAIQkKmm5kHdBZVOlaxb0GjoDRrNVF0/e9nU9P5pqm8udD/MVdsUluqBXTbjCuy
 IIPPfebBgt2x5XYItb1TEbnkKxzwolyD8Kv36Ype9HWog/VW4zOfOCtlO4r4d4Uj7zVpqGYe4gho27
 LHmiMZMpSgwb9hM9cImpBlsYRdTZSeGFiTsGoVxvMtbFx3JZpdoaWLIRvXeiidYR61chBlZ6MYQmVk
 4ihdwKSUZgrWIW2Rmu/8kzOVyPOhxpLnzYCvVfWeTo2F0gITFq9pyL+g5HLg==
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
Changes in v2:
- use data->console in probe() because uart_console() return false before uart_add_one_port() (Konrad)
- Link to v1: https://patch.msgid.link/20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v1-1-02e18c31aeba@linaro.org
---
 drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..b47f8d5bb295 100644
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
@@ -2024,7 +2025,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	irq_work_sync(&port->tx_kick);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	ida_free(&port_ida, uport->line);
+	if (!uart_console(uport))
+		ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
 
 	if (port->rx_dma_addr) {

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-4a199c25fd84

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

