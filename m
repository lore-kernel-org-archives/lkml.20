Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069527;
	b=Vee4DomWMdMJsyePPpHRWMC4iBMHDAg87CpYqAjoKP8Rm5xgWhFLIFf4XvosR6wLtIgl
	 GhjTbLHv+f9b3rkgaaMtz68DioOKn/43rkejiouNHEPcZ8nFjApyW/DcqVEjpmRw5R0dy
	 U9na2NNvMag8ynSZan8ebAo4xBSRvEpyE1kzQhb/tFjoZLvjTr13UmTv6HTgYWeeZTsbC
	 YyPsPv+O57KwyEzrBSgI4jf8aO9K9D54Q8aflIx7Cx9jg6FKHgINCcRAzDDibcGFSIzsX
	 8Ssrm4WT5zvN9LJYDVpPGw43gwuKGZyvYM84L0l31AF39vPJRqQx+R5TpIiKg62tedQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
	b=l8cDnQWTmCl++Hp1QlZ/IYvM3KgKkliZqhp36goHt1Z67RtUB1tDe+IebUNg5xARGN52
	 Fc4nYj5WkdrMNaVTeHrn/67SWxEH1DWcG81RX9DDI98/oYXJr6GGPid2gCldJdqUAXuUq
	 RaXBSjYXzugfFhmGsyyQJzKgxeE2HUHWUao8dPAjRf9R+N2MYFnS169f3H0oWsu/pYSRc
	 xVztcQXnf9XcbVt2u8bb1lTaWvt3ug/N0sBYif/t8e5EtdJWwvkQgu1Khz2n+FNNOKFIn
	 fWTChysquV5wMZBu1xBGXp94Nomd3CiWWs155sHeT0RYYLy/woHsMhDdrIfHeIcamXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A393hABq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4149606D806
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4149606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A393hABq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so14781035e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069525; x=1794674325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=A393hABqw0oW7AioOwn5cS9BWrcfS8piWzXGDf81itg+9+iSYzqW66wKvUGKXiw+xt
         NmFkM2PMhnTetXN8fw7BDEni7+mznw5HJ7xrUSaVIkNiHUiZPa+SnHN2JsrseRFGKid8
         8rms5pR3GEEPirE6a81M293Dh2fk7YjQxNBRoY2pALSOVA8O8Kg4Va7B9hbk/6wRtIUl
         kMU745T3dMRBlB/phv+pmQUFxHsKMjroBVhfjLXlG6SVhfOPwqV7Znck/KZsnXUfGPDP
         5QmAvFPOaKwy9P6LEoHwdWbDA0SbTXQFR+uJ5ZWnzGQ/6GbkmnUuSEJFBDKe2ypEq8Sv
         gTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069525; x=1794674325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=rE7YrC7ksSO+JQcmhh6PdwAZKExQJ1habC7vHysWn4Kea8N1HDyq8n++8VRAOWUznV
         vHS9p7r6LjY3kvBTkHexiofkVR7sIcEz/2B9wjXFE02EUwq5DvRpKczynkZAhmNordcX
         qkU+JH10Egb1w7Z714RQdysV9/HOEqdUx5MMcv/cg7kpSoINmsarhxA5AIRlxn6ZsDqj
         q3HrgB7/kGDhAcSdFrm2CWROFi8iTTAMK3nPTJ9eXtlQWcBKv7PPx6mS+J+M6HjnT4f+
         jXPUo0UBqnYPFf935+7Da+Sta/IZaTd2xDL6qUjhRM9/lY8ujRIxJJxRIVHNsZGAyNGZ
         dCtw==
X-Forwarded-Encrypted: i=1; AKwUvBxmNtbEto9bReTlGY0YcVE1mkbcIK5zw4d1IqofKdzN8j1y5X6cCcFBpcCC7d5obITDEzDXVfeasbucBvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QCmJAsuNRigBUjPQXgQm77F9Q3Gge7E+E1KLRFD/OiXB57H8X
	gqxty0TEZRFmtfTkp0t1hypHjMteiS84QhTmIADweXhclxNbYb5bGLKy
X-Gm-Gg: AYBFou003UdmuIbv1e/SEtuIU0zCJlzuJxvknuEcG9r+lsDP+iujEZNJIM2RyMGg/9V
	3m/Cepf+l2+EeiymSlOxc9KQ9/9O634bApFKvSy/JH3DoWpf/5mtE1NngdXjZdCn+hNQ5jqHerJ
	irqctg9ia+JKNVDOdJAcfmWr38hQwqYU9oeWyxWA5tQX7vG+2nOOosfGZefP1KezCx0FE064vb5
	QaY5YvuXYEmLqCohl7QxIPtIPfpxkIMakOztw/WBGhBMw0BtYj2QxiQXAncmGpOBYJMi77URLHQ
	6VNuZmHkZFO24ZfhnIAYCMHbwZl4043pRMs9W5/PiSV+fZot2Vwy0yGUnDwVv70nkavLb5CfY7i
	WH/FZLfdC44gVvE8sZnvKOsAYLAA9AO9DMwkWndpoWhIYC6glo+GuJ0v6EZuZUWwth0J+3UEBW0
	Nf3xVgCsQOOaNi8CUuxYh6x+KgyEhmIFEzS1a4W5rKcJx6aiOF+e2h1pgkA+Y/h76uKKWHnFSJh
	qnH9CZqJyGp+bKm9hTKYZNslDvlEcMNymN4o/wtGAPWfKMv8OeFbEbDWNQ+FXUNqH3/tNx+6GRj
	LsmfueNO0o37mn9J3ZhhROybVlksDa96QMPseCvbacS1FdS9/+MIqXPCzYXNkxViaMKAieIUY0L
	bn2sR4U3oKW6XdDsPWsTYTn5crU9lK12zEx+q
X-Received: by 2002:a05:600c:4e43:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4b6de0cda6cmr103703775e9.18.1794069525041;
        Sat, 07 Nov 2026 08:38:45 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:44 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:07 +0100
Subject: [PATCH 3/6] firmware: raspberrypi: Add blank line after
 declaration in probe error path
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
Message-Id: <20261107-fix-raspberrypi-firmware-v1-3-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=S629c7Z4Xh+sglZqK1vBTNUvrddrb3hrJoBprGdVlMI=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRRKvmUqipMs3O8VSLIOMCtBnbhE0QXH81e
 C4C8oRlDxqJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z7AwD/9pd7aiIrAynLcKb9FZZcrsV2F1QUrisJGkqRDCLN7xfLaywOcPb0G6vJZtb39OEDBYxQA
 D1ru8f3o3AU3eOVuqLUNYCUydtzQ8GyfXzm9isRNUSQr/3uGVaNumG6+xN5dNJfVTnJ+wk12ggA
 mYKbfocePmPT43p0NNzX5sGHTWD8lMhWZqEdGzQBBXi2SemzCXLLwMiIuV07xrSno2TOUJfnb9V
 HteKk+PMwroAA2XtSv7NKWAx+DCxV+Z+ImFfbLmwduVP2XY4K/59RueEniB9m8gSxy4MJBVnX/X
 SPT412YBFErr0Yjm/ezfwJ8oJsEFY+YSFqFGDxOpSDqD4tlXXDfQrtF5pE9QoZESVLsIoISSepa
 Mlj0vd1zR6M+YPqCpgVpw52Sjfo2Gu3CcaHLj4hgzNRuXE7cp7Yn6tNUM999H1zTb+LJOWA1hcw
 vsIJopF3j5GGcCR7UL1Xflc9FI8ZAXI36hFJ50ik48h63RCHtJmfJeOmORYVdYCLMGhqcAKRp19
 CYAUO72Nr13KDRTGj4MX7yX9/Rf6nHO9XR95DkwSzjz6P9LN7RgXu7eO3NrGOyaMucIVW8B86KN
 Zo3BtkhFjWSS6AlUu3/pZ1JvZa/QrR1HKHCeGwUyvdUNYLw1NvyxAGCb7LlrdCSx6TJ4HEZDt89
 ngLM+Mt2UbknpZQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add the conventional blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index e0c91719b4d0..04163c3f385d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -315,6 +315,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
 		int ret = PTR_ERR(fw->chan);
+
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}

-- 
2.56.0

