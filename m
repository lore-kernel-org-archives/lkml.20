Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1031399D0C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131130; cv=none; b=qZRLTKZul7rGkcAnNuq8wsL9xECnXODP1EZYIB0MS16WqVoNVtB9PzQollNI3nKfVE8HdryBWKzvMKKFRajfFx/awfVQD14X0glE/W9nWv/Ar3W1GdYPAfe/NBRV+XFH6NZ9g4T0gZfan/YGxZU+0M3GlV51qLG31whtC7V2R54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131130; c=relaxed/simple;
	bh=L9ZFiyAFmPsRderO1/Rh8bWC0nqqw4eZS58Lu9GM2YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmYhNelvZlwHoX6hxzD65z3ZLq1Sxo0yxcqXqQJQGtdEi2eQD3fDx6GjnuTThCz9vicl1A4uN676wybyVf8xEGNsrEPYGidRzd36kz8HUBJfpJDSu4xi916Dt5mGMCqjNP7FNObQztvELgPKzkEq0HwyegLsHpRsylI4bmAMt0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2DX4C4K; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2DX4C4K"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-16079d54c17so296527c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131127; x=1792735927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JY0PAJ8qLoMlN4L9aNAG6FBeK4r0HomK4GOKTTjBOY=;
        b=V2DX4C4KC5EgOE4gzbxBD1swceF+drPnKz66lXurb0IRsJgwq3aAMjt4UTJQKxKQFz
         Jlze47oOKwp01hhH1fk26x9kVNgT19HCKIQIMApaf8bauH68i2a40aJEdBo8d9LhMIGk
         KMFxVRmKW2KQKwe1n8yVCPJJTae4eY5VLX/kzBr6BC16iE1PIvOsbe2L2IBU1QaYy/dG
         gjImftdhKoDPXFG2ymTA4tp3sr5DmlER8ibI8jiGcvnm9129YEPNYgN3cjqOTLvt2miZ
         M54+oml1P215mN6wAvBW3VK56zaiiGEBl/p7IajwaoYpBQK60L1/TIUWUPPOexKI1huO
         Y/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131127; x=1792735927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JY0PAJ8qLoMlN4L9aNAG6FBeK4r0HomK4GOKTTjBOY=;
        b=UEzRHW+E2+bqn/Y9u5vT76NPTkKhmFqaqvi4NnG11Zqm3/6QcA5P3gBymd6RdyPpBe
         n35yoJ4hf1XG/5pKONMem7G6FyWPBsU2tboj2BM8ptyQnakTInxoy5r53p72o4CYAVtm
         /QPUdwQU164qrgnLquGMouKdMdPuQaD/tAQ3ZXFwK0aZGjDG0ppc1HSBjCCs1iEONFYP
         Bu+z2iUAdN68D9JTJo1PaJ7vYYoh3ZSvvBN54nPjPQ/k69sJ+dIRD00bXvQRk0L37610
         KvZ92fr2oVIIOG7ZUEmPM/pLqaCKhw/Lx1nOBEvq0BdfFHSjtKj4CqGytuoeecU4kYlZ
         H5MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmLaDxvuXmVpaaZhO5f/3r38sw/GvfD1RAtUfYWCLOBDXT4m0+ccL3LLlUQmbjhlSQOXL1Jn4e3TwlPzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF9qkMf2MxDOIh95sF/cKVREKI7Xcjz6oHQCl//5KH+tmGSrgL
	lxu7443YZh2c5sfhIzzjLkzNks0DjgR2oerbC9nGd+sBe0qzKvLjMwC1
X-Gm-Gg: AYBFou2+Z7pj0kICiOP17udcrylLb9+MBaCViDlzvW6cWXN4PKZX0sVxBspIDaStint
	sfhItHG+d45B3XGqSx4nyNcbM7q0rmvfyY1XsEc9wEWssHuIkY8KYkGjDqGtrISZT3l8nh0dqZN
	TeuIn5dteRbBPqBFjN2jVPYiaSJzPT8/UWNiKXFg6GqUOm79oxzNA1+TeltvgfhhiQm51RANYlp
	MG1cqsIx8aOFajXzNO3L2AdEjeafgztDPa1ixVv6vSjrKYi6C2PumQEqBBTxoUQcfbMHmxbZ9VH
	gcG0p7+LiBCFhnzRbzD8Su62oASTo72x/85J/0BxpoVPYMaMqeXs9Rq+sa/DgoeSK0vYAKBaVPz
	uhyld8VjltNwRuz5A3w+XRIDt/mDgtD9TOUK6Ox9rTyvTRdiRXhR8kX3VJrx+I/cW1biotn5HgI
	g3vR25ulCUg8t8l4qPI9CNuFg7g5Va3mSNEJvyuw9Kyl7eIuPt5z/oA8OPIe3WybCsCQ3PA9lPt
	BO4lQbd8SzO7jAhgb+agkgox932+SjVks+QvlOqRhrXFjw=
X-Received: by 2002:a05:7022:ea8b:b0:145:287:ce91 with SMTP id a92af1059eb24-16a5c6ec19cmr28597123c88.14.1792131126858;
        Thu, 15 Oct 2026 23:12:06 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm3755480c88.13.2026.10.15.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:12:06 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/4] can: janz-ican3: don't discard the IRQ lookup error in probe
Date: Fri, 16 Oct 2026 14:11:38 +0800
Message-ID: <28add8d0570b72d35c65c19b2365007cf0aa15c3.1792118040.git.chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
References: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ican3_probe() collapses every failure of platform_get_irq() into
-ENODEV:

	mod->irq = platform_get_irq(pdev, 0);
	if (mod->irq < 0) {
		ret = -ENODEV;
		goto out_free_ndev;
	}

Return the lookup error unchanged, as the neighbouring CAN platform
drivers do, e.g. commit 057bd6168d98 ("can: cc770: don't discard the IRQ
lookup error in probe").

This driver cannot see -EPROBE_DEFER and the change does not fix a
deferred probe. The device is an MFD child of janz-cmodio, which takes
the interrupt from the carrier board's PCI device, and the driver has
neither an of_match_table nor an ACPI match. The probe should not invent
an error code for a lookup that failed for another reason.

Build tested on x86_64.

Assisted-by: LLM
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 drivers/net/can/janz-ican3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/janz-ican3.c b/drivers/net/can/janz-ican3.c
index 1efdd1fd8caa..a65326b0f11e 100644
--- a/drivers/net/can/janz-ican3.c
+++ b/drivers/net/can/janz-ican3.c
@@ -1944,7 +1944,7 @@ static int ican3_probe(struct platform_device *pdev)
 	/* find our IRQ number */
 	mod->irq = platform_get_irq(pdev, 0);
 	if (mod->irq < 0) {
-		ret = -ENODEV;
+		ret = mod->irq;
 		goto out_free_ndev;
 	}
 
-- 
2.43.0

