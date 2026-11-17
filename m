Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936804;
	b=a2/SnGEMAv9P/lhOf8JCbgJGoXYWhN1qnKXwvFIt1oBTOx7evsCiD3rxz0YDGZGHPgMV
	 cSXJlda7iLquhFRtsI/ByOzu/DNd2C25WLxHQXNLc/RcCU0dF52DuQkjIM1qGr4UfK+Nw
	 f4FhDfIn/WcW/I6h2+dkLsE9+IuPLirlzg2FzAAFGqFrkVIcwIOm300ncE+xn2bqzy//V
	 cnrclgr/4T6dVGn5PsiSITEnpYD6XFc2z+/Zb8dP1l5FzapdMzA8Kgtr0/LmKJL+AREsR
	 xD1w9m38GxOxV8zh46gCQlwTG0QWXQW5OSXISrpIqdLwI2lXRCM3iz0sv5QlAdbOAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=awuFfcelAs0Wjf6OuNr2RgHXNyYZSy8TMqbcVt380gI=;
	b=ZBzbpT2wzStuMy4vZFB8mm2rDB3VILQYMBKf/siAn4JdP6akF7KMoD5JcasnUTz2apwT
	 XcEyQZjZ0+FJ/u6sv0der58jMAJDut4R/uoIE4PhVXqC+J8WVbcjPKWmgsI0jwRwYecer
	 HiTO5rL02tkhaa4EE5A+UmVywZUuTfzL+xS69S5L5NDgTzOKkvhyMEPD4dj0otsbJ0/hq
	 lxOpLmFJbtZ/b4lUrl3EV3wMeNy3oCqubLMi7McXnxHk03cbzP2vrQrYZCd5u4OtRoIWB
	 3bUTIeA3GiLdar7ZTZDOAgBWYKk/sdwkUYQ7Lyf6lf1g9crToqrU1eyAUBEOex1pINg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xxF5l/iZ";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3807606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3807606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxF5l/iZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso9773955e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936802; x=1795541602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=awuFfcelAs0Wjf6OuNr2RgHXNyYZSy8TMqbcVt380gI=;
        b=xxF5l/iZ4WWzXuzdIiuUHQ17Y91hemkI1btooq4TNrPXBDiAa3rv2N60i85Oc+1iZq
         dNATRBOVcp5xosWJpAexBevO4R00tb8qfUEMQsLYDYnnB5iTY8+f1lzjbFZHdnFgc16/
         okI3C7frlcI/zCISXIZKbseumnm2qB6+dZiWjwZZB4qXd1cBGXrvjJ/WNm9+YQnqRiNw
         /wtzd4xBjsQRG1UKboQ/GULCfuiGc11yeg3uIIulKDsDB0Yn5YCo7GjUZNAQXO3cPJyN
         V9KxTB9HJuUZ85MAZNWqgeLNAwdreKm+Bk+ANqdLNyBzjhHnwZK98xMBCTtNnnXf8PF5
         5tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936802; x=1795541602;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awuFfcelAs0Wjf6OuNr2RgHXNyYZSy8TMqbcVt380gI=;
        b=WQ6oYwla2sABXc+43vUC/3SdLUVzFQ8hc1ltKCgETNqw8i84UrPch+ANMY+i9IoOa5
         uihQs5ku8J/2sLEHFfB2q0ewbNRoAU/s60Z1Ax0ZdqSpaCSLjD59gTGX6u5KT5071XiY
         KJlc/4uUYwgOWtS/lBYAAMLMTEGOgEA56yZ7BSlbkRpkqWiWexFDRwKtGSFIj2wmi8/w
         hSHEZ23FZwkX/SldHjljvg8+6scbNqK3pDMdgB/K+RvR2Skr3wZ1rFqZlKHO5jqzaJ3K
         Bp95Ra8eAv1sHPfZKT7q06LhU3zuHn68sunzVSMG69v3ieFMXE7S2zx2N9ONClk2TCbS
         eFJw==
X-Forwarded-Encrypted: i=1; AL+hErEG5Cz3istT9BMFNu5qqf3hLD2hEqZak+R4S1l7grAt33pToS654CWki7WxzoUOEhRKcVaQxP1k4RgHurE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lrr0QXKDCtEiS+46qhOZaii1aB49HUJgfQBbUfvg6vCi06yAZ
	u1xA+QPDsSjrvUytjhxUI0MoANmM1S9qmLUxFHvSpQ/BpMe7C5dg3BpO
X-Gm-Gg: AYBFou3ZzVKchAPRopt2KTRZyB2rTbIvH31e0DoTrU0NoAgFHHRqWiuVKuW9u2IRQbR
	IOo+SNvey5mmrazz36mYaHEMF06cJNaGJHJw/ITun3uqD/4g/7ArcfZaxn8j/uyAuEt+rJcXD+M
	2WhOoyY2wV9lauyUFflMtjBxBRrfhw3m8GqN31AblRXWEh6toAj4vyojsZV49o4Vb5kcyCBOT7O
	MrCKt7tKTotNIb0tDL4z3h7FtodOaYwWZMMesNjAFezKSZiPmDMB8//wSTcinAyUbDCRYyDkemx
	CusttRrT5ZtGdlcE4JqvlGvAXusIaDy/gv5C6JaowaN7/vw0TUCiHC/MJvw3WH/jfMq0QCPgxfZ
	uX35d0/NOzYQsxJoSNYubcrfmj8xtJm3iIH+e9E9RF1YRYlAuPGQi3MSAufi+cEMUHVaGrpLg4T
	p1nFyJsFmVzyD76hDJiz7ojHzaEIaeoKWYsDzVbSsVH106JLIoXQR42RX5dgMLKA+Cdc1TakCDY
	nJSEWPR3JyKHzoWr0NrvEf0g3ckgFCycjMnxX3B2KPAYcQ9z5DSNPcgnnImvFiUVCRsL++XKS73
	HJy2V4dNnA==
X-Received: by 2002:a05:600c:6746:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb78332fbfmr83538165e9.0.1794936802335;
        Tue, 17 Nov 2026 09:33:22 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm79269585e9.5.2026.11.17.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:21 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v3 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Tue, 17 Nov 2026 20:33:17 +0300
Message-ID: <20261117173319.1852638-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a DRM panel driver and its DT binding for MIPI-DSI
video-mode panels based on the Novatek NT36525 controller, as fitted on
the Samsung Galaxy XCover5 (SM-G525F, Exynos850). The panel is 720x1480,
uses an active-low reset (RESX), and a DCS init sequence that mirrors
the stock Samsung bring-up. Backlight goes through drm_panel_of_backlight().

  Patch 1  dt-bindings (compatible: "novatek,nt36525-xcover5",
           "novatek,nt36525")
  Patch 2  the panel driver

Apologies to Krzysztof for v2: I sent it as a diff on top of v1's own
(unmerged) patch instead of a complete, standalone patch against
mainline, which is exactly the git-management mistake you flagged. v3
resends both patches as full, self-contained patches that apply
directly to v7.4-rc1, with the v1 -> v2 -> v3 changelog moved below
each patch's "---" line instead of the commit message body (also
flagged by Andy Shevchenko on the related grip-sensor series, and
just as applicable here). No behavioural change from v2.

Tested on a Samsung Galaxy XCover5 running 7.4-rc1 plus this series
(re-confirmed 2026-11-17, kernel 7.4.0-rc1-00023-gdcb8b91fb779+ #30):
the DSI panel connector probes and reports "connected", debugfs
reports the reset gpio as ACTIVE LOW, and /sys/class/backlight/ is
present. checkpatch.pl and dt_binding_check are clean (bar the usual
new-file MAINTAINERS note; the files are covered by the DRM PANEL
DRIVERS wildcards).

Based on v7.4-rc1.

Tool usage
----------
This series was developed during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic). The assistant converted
the vendor init stream to mipi_dsi_dcs_write_seq_multi(), drafted the driver
skeleton and the DT binding, and drafted these changelogs. I reviewed every
line, validated the binding (dt_binding_check, yamllint), tested the driver
on hardware, and take full responsibility for the contribution.
Prompt summary: "convert the XCover5 NT36525 vendor panel init into a
mainline drm_panel driver plus DT binding; keep it checkpatch- and
dt_binding_check-clean; test on the device." Review comments are welcome
and I will answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: display: panel: add Novatek NT36525
  drm/panel: add Novatek NT36525 panel driver

 .../display/panel/novatek,nt36525.yaml        |  83 +++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 491 ++++++++++++++++++
 4 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36525.c

--
2.53.0
