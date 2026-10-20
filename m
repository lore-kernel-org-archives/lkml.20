Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500700;
	b=Xg2/IWCvzR0d5L61iEfNbJ85a+QH/AHRPjQBdlMR7mZ3dkigGmTZwrXnTvEzY3uDJN1m
	 8U8b5mScQfmd7U5gCdFTvE/M4Wc0llJsvSrU7skeDFAF7sMv4F84PccLtfyOYzNQ7eqOk
	 waZXqa0XUZrdhBgP1hausIuaK17MLSier9WggC4Np9+eJ5nHfEUqvRDo335zFiMKsHSHv
	 UuHzJPY/YkUTxSGkXxKBnbrR2VjyIYlwGQcaBgF5qxDGy6kSvIxfyhCcFGhr01BxEZ+TD
	 kq+jAs1AfdmjA7Eg3RTlrZZ1ZNGbFbSW5QVD68seLNYIaSP2yO3Gbsmg41TlQlX0I4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rr5qnupZ01hcs8l4he6jIrxQZlpNO9qC8S24R6evHNo=;
	b=ppaWXSf70X6R7Za5inVqioD14ijV+iZFsCNSetfLTQ93TcnnI/TrCyW2kbyq9T+gIicf
	 d5DXYkCokWWhYBbBMofN1oRLMUas7ZSXiwLFCwOWhvEUDWk4KJVtmgOLDON+/BoVC3V5w
	 eF8qwtwwKf6BVBfXXtDGd8K8dcqBilQXkgTNyMfHEKozxQrVZIv2uXZV3WEn0XEvyACKu
	 wXQMqvVNVhSQwbM5cLTh7UTMvSycBl6Talib2Sl40xAMw2F/NKJn/pvGDmJRH5/UuJm5K
	 h2VO0PQPi7fmToVVKXIZUVj1M4xlNsvuaFA1KCGIXkPvKuJRj0IWszg6mM9mTTOMEwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Ni6+PenU;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41389606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41389606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Ni6+PenU
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 090CE3F4CA
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792500697;
	bh=rr5qnupZ01hcs8l4he6jIrxQZlpNO9qC8S24R6evHNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Ni6+PenUjCMz6rFbOqB5iwFyLSjOeJj3F4dA/Jya8Xs8yk/lM6xBaeT0sk7ONG0FX
	 tSPhfA2qdpLe32kC0bcA0ua/RnXHTcJhO6yiEutDzZee8++NhKSWJ8PYz+1xFzHOTB
	 tp9+ZcQMvQwLjsGHjNj5IBHSS8t/MQJSYal18lzvt945AGCBz32iXCsdnVvjmGrT2J
	 1wd0v+kUP4Rlu3+fmqUP7XDX11xTw/ZcDep+dFwatcl5Z2ZVbaeYHUvULnJ0D+NXBG
	 Jj/GwaEtKlUpFhWvRKXeB1zk79GuXW/Gx/pqHUy/SxHEQsn2rz4GXAC6X1ausx2M8f
	 OLfqycf20O4u/TD+FKVA4UEKomGK7+q8SrS5PfHpMaGmUYj2C/joS/lZh7fmkXTpQ6
	 FlQkR+/W0UBKHKdgbIVIEmkt8WyVNqai6GL9NIIh7GP4UAn8rBn4ptD9GC3WqsWh3o
	 jULpGjwKhaB0/uVSyqGoe144UG4jzFsaHW2VKGp5Ktr8ZfYl+XOASJmx24meJT5OrA
	 b9X8ODMommEPCvY9agtjtkTJdLqBv5+cPJUDOpLENWbNGu82/0xxcycGV/a9AWkxDM
	 LWAGbM2GKTztPyT8uUqJzyavewm8VTILBVIF5/OQSBvQP70bxVTZm2I50MomKhQ9q1
	 R1j8Wnwdzf62o587Xpirv+Xs=
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a079256596so962307b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500695; x=1793105495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rr5qnupZ01hcs8l4he6jIrxQZlpNO9qC8S24R6evHNo=;
        b=BSNHn7th+CpKOHN7SIOV3P5Xq5HUUTho1xdhmIq2FUSOQ0KPQ0z5cosGvBiqOOsmMQ
         5W2F+LHOQahjIYKHFKqK2h09ily6kzqeXzOYMjm7DooMLrtKESmfiiRHNNZs4SVvfLEn
         BGB0fjeVXmdFVLFb7TxL+o/KtoCQIqjit79AAwaqh/x9lGbPaNNYhSNvsSBjgN19GTCP
         o7p4kogHulIEW6l0NYOK1TZCorDMqTvttlj6PWS8XuxNi0zxt6yl/KKSDdKlakTxCpbB
         VnEkNZlXHDAjm9+5VijYAw8ZJa4nJ8NDLXjJ4U/pw4wsSNH+tSWmQWAVtKj8Q+/mUnZP
         NAMw==
X-Forwarded-Encrypted: i=1; AKwUvBzvHxGS0bmmh31aUW0hyd1xUcvXVjra2RmSTul+Ew2gHQG5b26lEVRNUWV/va/ypGiN/hL4xUZRkSe/i24=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvZajkobswFktKlBIJAr9GI2Wq32fQV4s0FXdkBTX1ASzXq1CQ
	x/zoA3yZ9LQDzk0ylxjlVY0ok72Yoo7A2N1LeqDZtHTAU+VUe8EPSep3v0aYL74HEhv6TNkSNy3
	OexzvyMYeOV32UvlP4SIjtGBFqHHp0jsndgeXrcZa2SyEmH90xRn0ddV0j3CjAu/YlR5DCeWtFN
	gtPqDhHJazkiM1pQ==
X-Gm-Gg: AYBFou2MpJQ+HhCgVM7OMFtm6voUuEtdWjMREWKuwExVDT9xKxlNzBSmA/0vzg7n7dn
	vheE9eY4AvV53/26ie4duCojgDhkiP4TWVWDgYVFK+5tqmOzBz/OPTASq9ipBnjViGGKt9eHjnx
	qxM2qtU3CFJIWkq6kRujSbCqq8MpkvUZ5+5h3g46bukPA2saqpxHpXf6gHl97LgXgV0KmwXGpJ/
	fUPfRrmNgYumki7WtncXfZTd1EGALOM6LRdSWFFPK2h5h1XuHaX35iv7+kYHhmikFuxGFc8emL5
	xDzuJZ7amIe+25alMvBvh68pfY3u+bLSQqTGpNSzFtPw484mMOh9B10oUpMT6e8/JLUGyGhLO7J
	DgMEpD0Lc3Vm5JOT5q+KiofdLO46p4faImLb+QMchDTEmZrYR
X-Received: by 2002:a05:6a00:2343:b0:89e:9c7e:fd51 with SMTP id d2e1a72fcca58-8a04ba30b92mr8137414b3a.10.1792500694977;
        Tue, 20 Oct 2026 05:51:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2343:b0:89e:9c7e:fd51 with SMTP id d2e1a72fcca58-8a04ba30b92mr8137402b3a.10.1792500694572;
        Tue, 20 Oct 2026 05:51:34 -0700 (PDT)
Received: from noble-leuven.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a05d4b04dcsm2692161b3a.16.2026.10.20.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:51:34 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liam Beguin <lvb@xiphos.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH] rtc: pcf2127: arm the alarm IRQ as a wake IRQ
Date: Tue, 20 Oct 2026 12:51:23 +0000
Message-ID: <20261020125124.1097546-1-aristo.chen@canonical.com>
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

When an alarm IRQ is available, the driver calls device_init_wakeup(),
so the RTC shows up as wakeup capable and enabled, but it never marks
the IRQ itself as a wakeup interrupt. The PM core therefore disables
the IRQ for the whole system suspend, and the alarm cannot wake the
system: "rtcwake -m mem" on this RTC only resumes once another wakeup
source fires.

On the i.MX93 11x11 FRDM board the PCF2131 alarm is routed through a
PCAL6524 GPIO expander. Without a wakeup request on the expander pin,
the expander's own interrupt is not armed for wakeup either, so the
alarm never reaches the CPU. The BBNSM RTC on the same board uses
devm_pm_set_wake_irq() and wakes the system as expected.

Register the alarm IRQ with devm_pm_set_wake_irq() so that the PM core
arms it whenever the device may wake the system. A failure is not
fatal: the RTC keeps working, only wakeup from it is unavailable.

Fixes: 8a914bac44be ("rtc: pcf2127: add alarm support")
Assisted-by: LLM
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
Tested on an i.MX93 FRDM board, where the PCF2131 INTA reaches the SoC
through a PCAL6524 GPIO expander. The board ran an Ubuntu 6.8 kernel
with devm_pm_set_wake_irq() (fd8318a32573) and tcpci wakeup support
(a5d2edb2c9fa) backported. With this patch, the PCF2131 alarm wakes the
board from suspend-to-RAM and from s2idle, also after unbinding and
rebinding the driver. Without it, the alarm doesn't wake the board from
suspend-to-RAM. Compile-tested on rtc-next (arm64 defconfig plus
RTC_DRV_PCF2127, W=1).

 drivers/rtc/rtc-pcf2127.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index ff2023908..51d8aebf3 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -27,6 +27,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
 
@@ -1251,6 +1252,12 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
 		device_init_wakeup(dev, true);
 		set_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
+
+		if (alarm_irq > 0) {
+			ret = devm_pm_set_wake_irq(dev, alarm_irq);
+			if (ret)
+				dev_warn(dev, "failed to set wake IRQ: %d\n", ret);
+		}
 	}
 
 	if (pcf2127->cfg->has_int_a_b) {
-- 
2.43.0

