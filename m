Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184255;
	b=xRWJkRA3DWZY8riC65HhXO1Ryd9tGkTe34ELw5YplMXbJfLd+Wj7Q+Yzo8QXhkAteI7G
	 McWtNG7hiK/4oi+0klrQCK62T3+9KkwOR8UhtTuOnVjVjpS/z9nMMRkE4e8fO5ORh8Hid
	 pPpxmNyN9F2V8+ao0jtYDh+CJbnUoqPy3VzP/LgNmr0YrPQD3iKkB7GpKLqvhrohxiKOO
	 dBxMWFCF/w2AgcMIESOojrAL+0TL32oFD7w8vqRgDpf/7kBvQqPclStTF/SXVRdhoLxgH
	 aD3ZN02pBT4oiDAj1EXF7cNVDZfMGYJCQ/iCLC+tP+p0qMB6zhI2hQkx+dmavFnB29A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=95GtjI7R3sVW6ueWEcQfS1LOsY7+in3Ai5GfoAlrQUg=;
	b=M2TdZ6pIzSCmoujA3WyHjowjJZuw9EFQe2A4GalH5eJYqdzRCBTWoMK3GuGorYGaXbDP
	 hAuR3pbDoWfMwc105GMcUPOAGj1DHHuj0xvXCKITn1/v1nKMwzfqXqOfNgzl+xbjt7qsP
	 Nu9PIvEALKF+sHwPTMSFEFga6ckgSHpKzlId2Aywl+4iPCQFqv5gKMYHHSfkVR2LzH4lE
	 rL6sDOudrnbtyOYLbMa0js2T1/ngkA+lOrWJVIYnSwISfOM6Ncn8mxRkICOaF+QEFPADC
	 KpkkUEhGXNAftdcrlYJhjuVk93icNSLZIXbQ5aVnMknjVqlJ1WynDTkHTluFEO22QlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDFArjrC;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD975606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD975606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDFArjrC
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so3535595e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184253; x=1794789053; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95GtjI7R3sVW6ueWEcQfS1LOsY7+in3Ai5GfoAlrQUg=;
        b=XDFArjrCictE9st1QhnFkwrGteMvWg+6PeFOBGbMMOv3ye5jFLeAFhx4DwGKLe811Q
         xZEGP4PdCQbmePlqERTD7/SJWyI/R3bIRPrkuOWLLviJYa/HKFa2m8FXK2vjtXFY+O3Z
         ZYjo7OXYR1zbofS+i2pwbhxsubhKYElsira6IErpRjrohBSo1mQiQVpKW3R1ZTHmhLjF
         CGaLuY8squKcyExI3qv9A7o1AnMWMh3U/kNldT/0/MVkiTBK0GrMdJGCyuagdrGFiXCi
         EySkKQrWZavNm2kf3LeK301oeIjgGVxCaF3rN6nSbXqN06NApigV6dFNZ1w/BakxdKRN
         rjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184253; x=1794789053;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=95GtjI7R3sVW6ueWEcQfS1LOsY7+in3Ai5GfoAlrQUg=;
        b=U1HgLj0ThM8Rx8KkbhspYN0I9P42/KFffN8bKwk1txgBJRMWg9G1nneHJKsOQzAsgB
         XaeXVssh9WCkkgYi+r4oDoGHatMGAOkbds6AtRy8EMaqVS5Yv+V0YgwwPNG3ZOFhlIeW
         qhEigT7no1CVYdsRe5cYF84MfKFJJCzNdPymnuc+6qIGIPK7gKAx0LVeT9+301dd33dc
         Y03fqKdtZeB/lquuJuvktABy0g997uUyjWauC8WN4dBAve8CJyEaKEnF+U0wOsssmOa9
         SEV0fe3xXQhe1d87evGgOeV9K2q0P94yw5/VYbnFe5uJh5AsNFWbJfjCSi3O3JnMiBFt
         J/lQ==
X-Forwarded-Encrypted: i=1; AL+hErHHQ2Dsi1RpCnLCjHuSHHqupE7qSFxUvPptuLx6TPDskKLH062GBpJNzY947L5BAL0KjLswOwSXsNcYlXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+weG4TylP9NpB5UXXMr0r0kD8seTNYsTNKZZOLJeKVwtML8T1P
	wPcHu22OWJItv9KEMO6gB5sffqKzQ9Km/UUO1o8/o/4Z1WuH/UGGysxQ
X-Gm-Gg: AYBFou30D3DAKHyX/bRaHnAYA2BMyUWiFBT1Nvzz7v8uzAKPreZVbEC0EtZIR5sYWop
	cVtsun/Y7u0RuGej3hbgQ0a2TACyam5ksXznMTfhSre0ELZrtAJpzSUu71ufkAkpnCLBIKR9XkX
	bHJdFn93tw+sPUwPNgI5tvgru2e2G/80J+RD8WATeLIvFI0/OPU9juksGiMCRSrnQjx9rhepk4B
	NpHUzpxRbPjSekEA5SE7qgyFqD0yKs5zhgtgADViB/8aUqXRToKwqwVWdJKVDti1JL2g3QKrC8P
	oZUA1UfbWqvnt3PzfI/AUy4E2tDgpdI2hYlonHluVEuBLiMujIqbcdV+TnBQt1IlptOorJ34Nwl
	NaORbL7bBxiENlD1VQ3LZW4EW8X3xkyxld7ysrsr2EvrycFr1wd+QnXxUFdXdTdpWMjN8bD202a
	QpGrDdwNDrqkVQW3uEGW9iRlu0opOwq0TsvvuDdHM5GvuckefboDWkJv+P4PzvOmHNtiX5eh4TY
	SDa8XxssqXu+t/+2LwuhTDHW5CDYPVR8RqJ2BE1JW9cGvJvEbUz1zNqDU138qxhm0TooM1ANWRb
	6zsBTQ3VPn7w5Wt1DKWXH5hU0la3ZgyS8iP2QQXY
X-Received: by 2002:a05:600c:4e45:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4b963c75f1bmr49563625e9.7.1794184253400;
        Sun, 08 Nov 2026 16:30:53 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bc91sm91755665e9.2.2026.11.08.16.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:30:51 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:30:48 +0000
Subject: [PATCH] cpufreq: Add Halliday to cpufreq-dt-platdev blocklist
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
Message-Id: <20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com>
X-B4-Tracking: v=1; b=H4sIADcU8WoC/yXMwQ5DQBRG4VeRuzaJO9qGvopYjPHjNoLOIBrx7
 kYtv8U5O3k4gad3tJPDKl7GIYDjiGxnhhZK6mDSiX4xJ5nqTN9LbX7KTkvj8FWM3KbPjKGrB4V
 scmhk+y+L8rZfqg/sfH3oOE6OCCm+dAAAAA==
X-Change-ID: 20261108-halliday-cpufreq-1e9c3581e2b4
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184251; l=1285;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=uNznV5UnL/siRzpE9ErXbIR3tObacb2SkxWFuaAgpNw=;
 b=WuxcfbDO4QCA9OqCNJ/dILd+E2ZTLSCHxEIrDy3MEReCDknxr57EFNTO9rHhDRg/RRzjSJHUv
 shnfvNG7j0nCjaMmZj0tzBC/SnxOteAlBpbSRw+SfMyVLB9dYt4CVaO
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The Qualcomm Halliday platform uses the qcom-cpufreq-hw driver, so add
it to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
in the Samsung Galaxy XR. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR, where cpufreq runs through
qcom-cpufreq-hw.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bce4c87573a1..3d5709eaa08f 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "nvidia,tegra234", },
 
 	{ .compatible = "qcom,apq8096", },
+	{ .compatible = "qcom,halliday", },
 	{ .compatible = "qcom,milos", },
 	{ .compatible = "qcom,msm8909", },
 	{ .compatible = "qcom,msm8996", },

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-cpufreq-1e9c3581e2b4

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

