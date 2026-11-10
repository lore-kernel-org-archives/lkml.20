Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309257;
	b=rikKwXpHURGt5SlnnZSHhDvxINt77V9cVnXs6bCFKOg3I+zlAeY2rQ0hgliP7ecKd0vS
	 t/xY95zRJqztqgFPznKOy1vNg2tbvJfTuAqoLZUaED5KWBMKTiNUsZxGnRSBEaHbq+AlF
	 wTzBLDeHGagxEtyJMD0MWODIN2BnH/6X95+Xr8VLpmhmMXff3hrpiy40DRtvcmRskDAJy
	 3xchu4b5hVwK4SAMOUpAg2lLT0mhVK8jsH/XMsZq5r8vyZKPMrE4Xr1wdL9OovWMMIF9w
	 4tTXIql+DPYhZEwiH3MU2iPsuIndk4KSgJw3FNVmsuHfiWBcVEPCep19/thsh/KSEOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cmPq1xovx31wY8V3YqLuXzHjOU/A8Tl8hkT2pJxDB0=;
	b=a02gQaWWDRXz5enls1AxQLGQYL2yJtevtnEohvrI+bBZ6D7GuTyX+yC2/sDz17dyBXxM
	 O5/Er3OAVC/ZyXE0rTSGD7PJsgDD/BbmWuv3NmZTaeBK5p7Ed47LQZ4yn65yCYZbNKCkJ
	 4GgavpKISVpvxkP3GHv66yqHFOLa+Z97mTxnDKzr0nWsS8Ri6HiiCkWuHE2EmiaFfLmXr
	 GBHy/bZikZ/zDsM/2CaQCSZ7Lmvkz8XplMgyUcxpvKf28Rw9W/fhgHqkf2H6ZiO740liS
	 B4+jGhrKVfXdCbin7iuLzj65IWigxFMJmQq8wHBAcdeChS41SQTcrNVUlGsMfbtSM4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whEgGqij;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD3E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whEgGqij
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3106553eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309256; x=1794914056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cmPq1xovx31wY8V3YqLuXzHjOU/A8Tl8hkT2pJxDB0=;
        b=whEgGqijQSILV6KrKPrl7DR6X0Hr8ZyZ0F+U95wxJ5yN553gCfwFMIILJpN1Ue0c3+
         DyAwDdzrXHajzSVmVDGGWiKYcfVBffIovDms+hLlDkIsNjua0YbuJKkAf/u2nLzZAANf
         GD4YqVyXjmiWIwusmBt6KjrGLsqg3BklO+ipkyBexKh32346bos5/CPbYPH1CwmcEBIU
         g8n9/jMTecJ5JzfqiB3BBg+CNz4Jr6iseEuQXSdPl9H0nDgj7IXbQUNeuCkP7D/NXnP8
         1kuEVHOCbN7tUqWaVlqHkvYdB9anRnflK2zc4Sar7uK5mnf5HrjtP5nVx1JxCyx24MDL
         IpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309256; x=1794914056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cmPq1xovx31wY8V3YqLuXzHjOU/A8Tl8hkT2pJxDB0=;
        b=YgvxupEuRTjCkfuOXRxC4e4F0wRdVbdqFzfCL1j0ixLs9XCm1+3x7ZUOAi639fZ/cE
         b9Ume2lOAPagJiXZ4AHTBirRBTMKQ1iZTSeN9NwV3NCsozpf06OSshnjrTJbO6Y9razG
         ZF11mMs8p5um2vvNhEHRVvIZYjDzdd+hG5Yi5LUxsw3wqU72iOlKLMoTYCOyfDeomGq6
         6oLKSoYa/tL1/V6Sr1jCzPhyyVxDhtutHZG5DRp3tjfDsLUWP+wPeMpj5obhFpwoixZh
         Se7eYgf27gBFpcSUYpRuDctEQfxuMSR6EMaUNvxinajtKv7K/WeUerfOtZcm8AMGw2dU
         1iSg==
X-Forwarded-Encrypted: i=1; AL+hErEppJPyiZ8qAJEoOKumLsF6xshYvyuDIlODJh87wYw6YgSZJ3hohuhfmAtRsWsDGcgZDDoMgfgxEKkLlEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lBrI5grhgfBfpIA31pcpu1UHuvw08df1qY0ZNSIrTkkkwji4w
	DqVDaFjTG6NJO0TMuoXzcAcBHFshNBicLc63qeim5Yn6aW9IA73TNn2n
X-Gm-Gg: AYBFou2dC+aucNDt4Ziq/EID5zikAvpAdVXyS0ZRgrCM0aB+LO4W8lJavT5sJkiMJue
	2bfJajoNW7aug7nrX4AH76qgQnDy9eQz1lD/JLjTShgW/vm/8CSwo1SzV1m/2hBt28nYqWPWKe9
	mVP92Ncp0Pcbklu3iqIAMmbJ3/QMaqE7RPKYARKHsB8+g9WG9P+rK3dAZifGx3+srUJdlpeVG1d
	Vh1u30C+Ip6GffxoHuJ0Yf/AEqEtwmq3iCwdKQAtiIQQCv/Vsnfsqtni5Nt5A1PcgaOY5YZ+Nd5
	z0NLqzu3955kpWsS2Mq/zafQmnjSkKya6TOmis1Z0Yo9A8qlpGHl8wqP4IVyTU43RSESUFB1MqQ
	I7J1pxSTbUUYl+KGlb4dgbtCrzY3SodKCCZCeD0Y6AgsSmH+N2UGGYTRx+lSV6cqd/yu7WhYAjv
	HNifLDIhRNqAvRSI8PqQ1ofw+JYURZWuxBhuuI0wtPEFtu1qr1UoBGwFPzjpReV8D1G0383FVYR
	QOQcdDYAZdNnme18CFxYYrNNWqiNnt00CDiKc6/1hRsThFf4LYxURVSMMpzUnwK9/FW/yMH3rs9
	nyY2UJ7I7Cm56n6GpKCBMT+tEvqwOBNM1n8miaEeMeSyU8zTmA==
X-Received: by 2002:a05:7301:78c7:b0:375:87f5:ccee with SMTP id 5a478bee46e88-37587f5cedfmr1886929eec.29.1794309256012;
        Tue, 10 Nov 2026 03:14:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm5908119eec.3.2026.11.10.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:15 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: chipidea: core: cancel power_lost_work on removal
Date: Tue, 10 Nov 2026 20:14:02 +0900
Message-ID: <20261110111402.2504885-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ci_hdrc_resume() queues ci->power_lost_work on system resume when the
controller lost power during suspend. The work (ci_power_lost_work)
dereferences ci: it touches ci->irq, ci->dev and switches the role.

ci is allocated with devm_kzalloc(), so devres frees it after
ci_hdrc_remove() returns. ci_hdrc_remove() never cancels power_lost_work,
so a work queued by a resume just before unbind can run after ci has been
freed and dereference freed memory -- a use-after-free.

Cancel power_lost_work at the start of ci_hdrc_remove(), before the
devm-allocated ci is released.

Found by static analysis; not runtime-reproduced (needs a chipidea
controller losing power across a system suspend/resume that races unbind).

Fixes: cc509b6a47e7 ("usb: chipidea: core: handle power lost in workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/chipidea/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3461dd7..400e4ca 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1246,6 +1246,13 @@ static void ci_hdrc_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc *ci = platform_get_drvdata(pdev);

+	/*
+	 * ci_hdrc_resume() queues power_lost_work when the controller lost
+	 * power during system suspend; the work dereferences ci, so drain it
+	 * before the devm-allocated ci is freed.
+	 */
+	cancel_work_sync(&ci->power_lost_work);
+
 	if (ci->role_switch)
 		usb_role_switch_unregister(ci->role_switch);

--
2.43.0
