Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812537;
	b=bUvnOrzCEXXI0Ci1vGmJWd9jfv402ezDv+zK/rUHHnr5uCuxLsd2bSkBSuEYqkWxXol3
	 RkkZbLlgdJuzrO0Q1+39pYm2Ha5d0qoldMwFhRVi4tXS8NIlnBmO+1jqbu7H/D48b0Tqh
	 /RssR7fKfXOx6UJvn/O0anZh80jOhfeRHlsMH3e5hk/JRIMIRlGAwY4S6ZwsYHvfOzxvK
	 8KUND60w0GAIxyl6B322yvMBHVTcMcQ4d2Hr8mRiydvUob20cB3uMxnDCsg1HRRRQZVZu
	 7gZM7d2JYp5HMbPlrs4G33rve6C21GSszCNv7XDHizHFDCrggXgvVoJvgsjU+w59Z0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oar97+R2dcLaRVk0nmpwc72qymMp7EMYfC2wL31fOwU=;
	b=bmRSYjOK5YUbxiOXKK69erdjFUIZiHm8+22iDUY3FQfVqGmcnwArmI7BOPbGjavNfM22
	 GUZGYkQAOoSGpP6/fGQMNDDFM+Z5C7gPRv8rx51ShRa0i+WykrniVVafOmPl6UhtPYwdq
	 PSCFXgsmnce2Np4TLh2xtK+Q9OcNPjRhJY0+gwNE351F8jOMPbwEY8kHl7LoHCKPbqbPb
	 BfYBMhFiolXQqRh2O7WhFEhNNosoT4zISt092vntqXtkwtLPEJ6pJIXIA+6qFM7qIwfVi
	 GHo+yWGgEExhwN5PcL2tcJCF7itjFmyOdw5Pmmw0maipbtS1VF37OvedArRBugeU0+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w1CPw/xc";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC019606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC019606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1CPw/xc
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so17123275e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812535; x=1795417335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oar97+R2dcLaRVk0nmpwc72qymMp7EMYfC2wL31fOwU=;
        b=w1CPw/xcgAAnsRih3vNd+rHB6D43IqAWaSuMDgG0hPinaYup7k3VEwkBTMX0ARLEbG
         n+jD+HSWIL6M3c77Qmi4HnCUKzqYxPyPcjSkSNZkooJFlgniYMq/6Hbn4/1EWOCSMZu0
         N2zDeRXbq+Xp5s6hA+0+dvhMFi9/bidqMxK/0k/ZyaXsDFEJTt1uOwuAvs+0ZEcVDn8b
         axbSkJqs+MD/WLvh74S2stnBOQE6NA+8yDD3o2BebWWvOAgCXoL9mkR2tMnI//PvB1pi
         rYLxVjO9/udNOTvanGxM2cYIFOrIdhins+9g3k71b7EoZf+ZiQyfxbNI3ih4nB5RG5KU
         vypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812535; x=1795417335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oar97+R2dcLaRVk0nmpwc72qymMp7EMYfC2wL31fOwU=;
        b=CKeZJSSqfPNZFGGV+tV4cjHlmCy2ybpULc6N5QOeYAeisRQ4/H+VD+8cWcUILqsHOx
         E6n6VjL4yPWl2AohgjXE+ZgC24wiHlMikxiVI/H0j9KVmv1sTg24N2N57LKrlv2FZM0u
         cKgxrSWo70ZwdZtR0PMf7P1QVIgod07GwI325HKLMGgB6TkNWkKcovLDxbLE+7rxUbMJ
         alQxY0d2Ym175V48/nYV4QT4jYM7BAykSubxx3IARnD6bYAmZtZXL8kj/MkC8ASOQjDp
         AopCNK3QreYYR7jbsDg2rUbttJUU/5s4S+yqb7mEp8giXqfvMqNRvDOu/uL758NlzBOG
         e8tA==
X-Forwarded-Encrypted: i=1; AL+hErGvHuj6xyjH7GbcXEh9ERlA8x8Em1L7kENjiyCOGcG3AzXAHKYR6OAbCG0tRaJM6bA4+F9A87uz004gf1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TjIFRt1Upp2Wwfnfkg4KVoDyXN0i0M13AYA2aTi7pqgMFmL/5
	gcH0WQ5Ww354ayeEeXFy6zkMsb2VZqJ+LIKNvb7/m9XWVEoWWCvlbgOU
X-Gm-Gg: AYBFou2vs06bwaHVay3uF1nDb6DZ5G58BiJn7eXAJ1Blk1cB4qkj0ip/onJ5olghV97
	+vlYPCV3U+L56iUqkglyp8UCV97vsPIuHW0BZ3t/v4tDrNIyMJaicCVQxvDPP5rnXcHQKOZvxRU
	cMZQcPiqywF+e8EvGNRz64pLb9aFV7DBBR60TS96vWCFAYD5Hu/YOR9F5c5W/nILOjnk4BtfZ0v
	BGKrgiC5Jlhm/CTj4wO0buaJXt4eR51qfK2IC0COhL5AVI7lnDZPCxu6XLyRLCrruq5gWsWJnF+
	AH3Lqh6G/MrlsKGqhNAFSBVx4JoTvyaaQUzSeWBQtqLIFKZscEyUeya9QNlLlnYWuAj4dzEL/q+
	duhUH4XwdjluDrkMPBL+7uGC2v9RsiDdXWSeHIYEqi1hzHXwoWzLgv6v9w731F9kEbXh0MMNfq6
	UY3GWgPsiNqyh3ZZQHORI5RS8/apuuFTvdP81riZVIADWGPjyCiFF3T1PF68MsTdS0XIybomSQz
	lOUwxRgZpewoM5Ab6x5rgQaVj6euP/62AHps7D/EqGpfHHA2fwv2cDQP1j4RJIHobCoKx4wItan
	Rf5ZIUf9YKfa
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr200763425e9.12.1794812535128;
        Sun, 15 Nov 2026 23:02:15 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm558777625e9.1.2026.11.15.23.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:02:14 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Mon, 16 Nov 2026 10:02:10 +0300
Message-ID: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
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
uses an active-high reset (RESX), and a DCS init sequence that mirrors
the stock Samsung bring-up. Backlight goes through drm_panel_of_backlight().

  Patch 1  dt-bindings (compatible: "samsung,xcover5-nt36525",
           "novatek,nt36525")
  Patch 2  the panel driver

Tested on a Samsung Galaxy XCover5 running 7.4-rc1 plus this series: the
panel initialises and displays correctly under phosh. checkpatch.pl and
dt_binding_check are clean (bar the usual new-file MAINTAINERS note; the
files are covered by the DRM PANEL DRIVERS wildcards).

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

 .../display/panel/novatek,nt36525.yaml        |  71 +++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 486 ++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36525.c

-- 
2.53.0

