Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516334;
	b=AEhfwgkhXQ9xlPTYjZlVvYtm3mXxp3sHBeToZiuMhcM++Znd8cLZU3KnYPnI6cO095XM
	 sc5IIFOuNrz6vGRKJ1+yA82Ky8CbnKHSezxXr0eQLSwsGctoKY+Eky60U77wraKhwjPbO
	 zXmRfMZHU2EpTJtyk5PuvwpWLzy8O+CcGC4Xt5aSXQSmmBFP8BBljQjNBpPHEjWj0muUc
	 RS2f4AzFn5bg3E33mbyZOZpGJdutrFxgZ/9AxFg1yAni1UJp4+n0t+AFXuV8Hhm1G5GIh
	 w3kXgBMReCoZf+72QV977uUze20fFkOKrLE8yU+QmNsvDU0Tk768CJXDEo0MF2zNdTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yqx6DsUclXi+OHVjns7RkQq8F++k4NcXoQVKPQfimpE=;
	b=eDmD1pIzEZS8k9oVdS4VlsS2MZ+35vx63Yn3afqjg3Lb9mf/VdM2QxGqhvHOBs2lE7eL
	 GXbikpQuoObMsw7Ch+WW4Tfn2e+HuY14bE80LZ34VmoPehbA/7hVAZ7PfOQjPLFzP/LPU
	 pOaeT/149QHU7VRaY8WDERQIAOI4dCQWjn4aymsePOzQPUfU4N/xtzDm28C+qclbDrRza
	 b5FjNeShauCe716Qhoi8amE3Ky1RclkEAv4yZUwt4S2nRO6ru7zDkup12qtPjGHNkMHOO
	 R3lppHkG5YSlxoOLOdVbwdycLIhMgRG+kqK0cwoLVP8dy/5hAH69clKYdImmnMk8npg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flNFuw+O;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C460A2622
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722C460A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flNFuw+O
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so1541315e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516333; x=1795121133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yqx6DsUclXi+OHVjns7RkQq8F++k4NcXoQVKPQfimpE=;
        b=flNFuw+Oe7caBoEotRe/EPdYZkd7AjWnpCMMSANsoCokyNv6RqDIQpBXUCj2njv3WK
         2xR0PI9NLFOj/0ob9wr6Yqwp4Rr21sEPqTQr5UpBe7m6mA+380RWpXxeQmpKV0k3S/Xt
         QZT5z/3CU6Xw38wabpE9XwW1m9Z/cvIEFm5gcyeChhyTeBAmFEG1UaLPn3X+Jw1nMNxB
         Xn3PPFcSxbyEe7iCDGpsbmvxG6lUSxyWIA2Ht7ObGm2unNs/b7/OFZQ91SHBCzMfudpp
         sS3LtMKkVXT1jpWhXCoqfXoZmOuP4BWe1mSYXwQ/ajoUOXoTNHhUoG+tWocOpRFtizv+
         Yh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516333; x=1795121133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yqx6DsUclXi+OHVjns7RkQq8F++k4NcXoQVKPQfimpE=;
        b=o4IwD1ISasnXqCu91it+f99CzE2nNt7+YyZ/N8zuPNEw0tZcl04o/34hxMh31dSC0h
         UBBWPrBsWVGg5S/qwTkjUUnLSmEGQ+2swSJisRytBHPx11n8oPGnOYKhal/hPYLz+Xn7
         Ofquvynx+3o7BsxCrSE8kzW7JRxR+DuCLjOC3JCSQT7n4mHrd0C1F8jq98SYvW+7OUDh
         Jq4CqxxjKrbu0sucZ+cDI1sM5OXVIAvCo4p6bKV63BXuIbMbkHjYzUtgU3HWRSfAsdJK
         u77aWMJbKvyHYYCVSt2QDaDECeY8mJyZKJofy0HkG6CnELOGaIm5IvMmnj22LjbhtgUi
         f9UA==
X-Forwarded-Encrypted: i=1; AL+hErErdbO9HO2mNgqb8zyyrxLYV/hlKscE9sykxJYhOu2x0eNyqN7UMJnGKiQVutKHSF32aGooCEkaCwb/+Bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jZT+bB75aa5WIjzQMnnPqwIzRFQSJ9duVBiXaW1sJEXkOAxcV
	Mo26wGJ6ocfGwiwj+7FQzntglSpb3iZ7f3oRepCSgSB5z0ss7tWMrcaj
X-Gm-Gg: AYBFou1l3kTJrGHuNckwL7a5aH57w1t/kT3wOnrlk3W3zXLdAz4Ti72PfhLdPwH1mEe
	szq3x1UxaI4562lF0XFuVwKa6fc9PRTnmmAsY848BwiTdayu2Zm6kgWCI/8s/fWgjz/JTn0lycy
	I2S8Y1A4hcz0UTaW0MZirUSY2E63XqbocrQGyHPd5doJgSdQWGzc2JXjhTcIm7MOAKncet7MgUS
	hde75I86OcRA6UDncniU+09yLLk7p9Fdqt/pWx1LLxGKFFWGl7S/Ifwmc6/WZ5Jp6kHVn4rvI7E
	rBH38GswgKYWA9HDNxep42yu/0xdS7e1S97KhZg/VsJExD6jEBWW4Bv1X1wRz1rVKBNXIsKqSH+
	OjF84L1J0ppEkaH0BhuQDjnq+QMiKjnLrMEx7xEdVJXuZMY0FLNIKq2T4Ipa/FG7k2hzd8BKrY9
	946vJY8ycZviMY3+lT7VWlCYIZbOUj+6Q9gvZsYzHAr8Em0iI+b2mq3mXmVC+/bWubRliKPAeP5
	UTUfshmv7I3r8mztrv5NLxCW4H9EOjenTI0SmQbXqDNlD+WRaFtH4rjYTQj4yxx3QmMXPl+JVuq
	r+Ncnt4waPYIxmd3mjORWIxoWbGRmauaxf5U8YJICEY2zOHYsDebsET8s3C3oq0CPZj9qbD6CmM
	tGns9BkEwMs48
X-Received: by 2002:a05:600c:4ec6:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4bb55a93ab1mr7495085e9.29.1794516332680;
        Thu, 12 Nov 2026 12:45:32 -0800 (PST)
Received: from LG-gram (117.red-83-35-151.dynamicip.rima-tde.net. [83.35.151.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm1160885e9.2.2026.11.12.12.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:45:31 -0800 (PST)
From: suso <gmsuso@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com
Cc: jaehoon1744@dankook.ac.kr,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	suso <gmsuso@gmail.com>
Subject: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U
Date: Thu, 12 Nov 2026 21:43:25 +0100
Message-ID: <20261112204325.4696-1-gmsuso@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The LG gram 16 (16U55U, AMD Ryzen AI 400 series, ACP rev 0x72) shares
the same SoundWire audio hardware (RT713 + RT1320) as the 16Z95U and
requires the same ACPI flag override.

Tested on LG gram 16U55U-G.AU85BN (PCI SSID 1854:057c).

Signed-off-by: suso <gmsuso@gmail.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index efd664e1c34c..93c9a112240d 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -154,6 +154,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
 		},
 	},
+	{
+		/* LG gram 16 16U55U (ACP 7.2) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16U55U"),
+		},
+	},
 	{}
 };
 
-- 
2.56.0

