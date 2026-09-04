Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3C34248B2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505801; cv=none; b=BP7i9tjXmlrW/SPnhphNVszNr8ObrA6DKp5naBtBXxtdHChuP6zX+5JmauS/bHs+LKCskkx3+lk2AVV5JXgG9cEAOdiLArJPGd8mG2CfDv/Mws0SX5NN+hjq11nwj/AT+0EKepcoEFkvhBXaaQZNzyrw02FzJrxbJODXEEKuKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505801; c=relaxed/simple;
	bh=4XE9DmDTZMH334MsifVc62h5MaGK/g22iClMDz1bcPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k6p9TWQ+hMLA4BVEnpDb8bW7ogcgI01t7KwT3XfKAtx4XF0O6G8wmNUZ2MdTPWZ1vXzDZlUrsSvMPlxNDKLFE6vyIDb6q7SthY4o+AaPhdJyiRzAOK/Ma+Qq5ziJYAzP+dWK3Gphn1Q83axT+OhwzFRCdga/q2m7Z7NokqL0ep4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUKO4FBr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUKO4FBr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so418591f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788505796; x=1789110596; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4mRkrYQfw+SaUox7nNL84QwuZBh15RG8cp8OLLTinps=;
        b=qUKO4FBrQm+WI8I7EvmZQpJbR/rea33stAHOityXdIo+YXW7PHmaCJLtcLicu36v4I
         tLZ1B8JJN3uDiYE9WXY9Bv2nGc+susl6lfmOyb2B9aXmlW9a8gIhg6XxpKcb65qOc4df
         UKcoS8wTrWQtlqvsc1CWFRgupEsXmmbYOfVROMZ6W/3PcCMrvpTp6tWTkLoAiEA7VMbu
         uSyIsHNC+QvsOnor+SJhlWqonhlO0oToJxAKLoBXkf7v+BAM53yKtJq0CNiPfH8KSAYJ
         9ygCKyyfr2KHsQX2yJUISWYzjny7n7ysfwNTVJ1k0P5ATzoFAslARmf2N90hS6kFkNCh
         9+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505796; x=1789110596;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4mRkrYQfw+SaUox7nNL84QwuZBh15RG8cp8OLLTinps=;
        b=Nd95hssm3ONcBjJ0RRdpAXmppcTgBqTMF9+m2VI8PXyOASCWlDjpJEDQyfHLkbyMow
         hnQvCB7FirJDnkqMp9gEMN2lQT5OqBs3kMVqsHJV98Y6R/dEgIyv034AEXP4bKeydnDY
         8TKVwHErUXR6TKIzSfoCMJkon6XOnOsD8SbiCuye9fGMLoTxIswQsRYNS00+8U1AXdfi
         9WkGLSQm3JWJEWHcDgUzlntSfyB6/dFfUam8aCNH6HuEYHuKGTrYqvwA+z5Vbe681flk
         9nmjHODv4A3XEzmvimOtOh1RlNstPEmlbM1UYr5DtVlOz16z8KTw3tw9lxiwEsHrK30k
         oeBg==
X-Forwarded-Encrypted: i=1; AKwUvBwcF2kYP5mfB+abZJ6eKpcl4VJiZ+tmG6Na44j39sXPPem4mKxLrpzYe5x8goKI5Ga9DM1A1Bt2J0KHnEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m2u3sT0LXvYbQOhXNfWWjG93254WRb7PwegwAtiyInEeWZ8VRK
	qTI9zHXAlVokkD2wT1x9KiWCb7zuiGrcMJaW7TindgKw2kjiiFilQ4yPC4FkrfYenMo=
X-Gm-Gg: AYBFou04ipt8qpZs/dolOZZ8gJ+W2LAFPfhBttvmb8+xHkllQnmi6jThPHhCn8CKewe
	o9U9iuVU8D/ModW6uwdkPk3eVboJtwLn/HFcmsY5Lmbd9Yjct9KNgtMCS6XZhqEbRUkha87j8WZ
	PG6y64fdaPfftG1EfqJYeD+6ccXfyRfZzQmqV4s+pe6CmtDQzIG9XAZ2a3WcNEzGubAw9Q8tSbT
	HKpr45/l0WuGRA6ugfPET1Ev2dhfA/ZKdoojPpvW4No5caYBrrYBWnxQkKvgkx62Ycue+DhV6ny
	CtTwnisADmZzQrQmUilL8vFRG3uyb0Fggyh9leWlQabsaJFFuBX/nFoCVM/valzETRKrmAGUVCg
	Af4q4E1ixplxaeJc9ksSqVEdaIov3KjsKgj9hVOgBrjPgzriPifBoxiRwPoHGCI0igiYrDp8kQH
	M36KGGQpds+ODnMVSCJAeU/5gwXvhpqSRXJY3V3AVehGbnN9fu7T/XpYXG7qgN4RNF1IN4nqK69
	FX+wS2I
X-Received: by 2002:a05:6000:400d:b0:485:8c17:9774 with SMTP id ffacd0b85a97d-4858c179a52mr1092686f8f.54.1788505788386;
        Fri, 04 Sep 2026 00:09:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm4059605f8f.23.2026.09.04.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:09:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 04 Sep 2026 09:09:42 +0200
Subject: [PATCH] tty: serial: qcom_geni: don't ida_free() the console port
 line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v1-1-02e18c31aeba@linaro.org>
X-B4-Tracking: v=1; b=H4sIALZummoC/yWNQQ6CMBBFr0Jm7SSlKYZ6FeOilimOkdJ0isEQ7
 m7R5cvPf28DocwkcGk2yPRm4TlWaE8N+IeLIyEPlUErfVZWGSxzYo8y9WuncElSMrkJS/ngYXI
 vHCkyBl7r0WHIRGhca63XXRh6A1WcMtX9F73e/izL/Um+HCXY9y8zxrBklgAAAA==
X-Change-ID: 20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-4a199c25fd84
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4XE9DmDTZMH334MsifVc62h5MaGK/g22iClMDz1bcPg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqmm67rVYyRnVtcNx9WAQGST/9pLaID/n8GdHmJTdT
 vxa/GZiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCappuuwAKCRB33NvayMhJ0YS5EA
 CMUanBZDEa5UKkVi+ZetQhSAqyBJ6xnxb+/MpOP8W1j7GaqJ30Q8IcBnUcm+w0jxcoh1lD9oJd6oaN
 f0CTTHQb0pFevbQqnk/mx2zeKvpHLqx+VFQuSGKsaeh3nZyKLkc5xLSG2/3ssht98+/ydJFgIi7LEM
 /ieev9Lb1MwYdR1bphHgLqIlrKDy9VOi78GI4EKKtYXsM9H7WzQQvz/6uo/3XG9YuEhKjMKCi9XN1M
 GPM5XD+RhMg41unKvV+rT5bSK76veF+78mpPsvHQkCf0gtgyazs7rPIVS+XQ4/BN+PhhIKWIyZaqtB
 SHERntUc8g28MTmYtvCcJ0f63mRRKnguSgorsDWauXgZfvrWG9xrCsHGOG3o1P825g8D3dbdIqG2FP
 h9+LU1ZdNnWnloiQwgBkXl8gTAac3w2l09vwIcHNaBOpJ+D+K8ZPQtUgVzob+R7jBuVEApDSIWr481
 FB4JnDfWThAhGHAIG9FpwqUwoWA/Z6l63Kf8Ak8DOQE3HqBOo7GKLt6LnmOIPZKYvPAZewMMOlVcEF
 gEemvJG5fANDMaGALaHZ/cU/3ofG16kdq6OK6HyeW9w69WEdZp3KvWHTHJjopuiRQYa+nWRFu7MfFc
 J2+vAc+OZHyfvom4UyrRMnAJ1Xnc+FjWbv89fOqooOzIO9u7lCNU2pV2gkPQ==
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
 drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..bdbdfd7dfaac 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1979,7 +1979,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
-			ida_free(&port_ida, uport->line);
+			if (!uart_console(uport))
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

