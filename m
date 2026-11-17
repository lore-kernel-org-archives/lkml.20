Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933291;
	b=Z5/K9xmHnoIcamaWPLUvuxl4p9Fzpb/z/qQB6ZRODUCJGdL2+7dG5kLC+eKgptSKIPd7
	 L3UhUM+hquQTW6q6f8z1+AB8QciCyT9tEObqeX9z9OHDZN509Pv4KOpW3aaDI77kpx4xV
	 wcQ/K4IUgVXGdnbE7f2u2xvia8YiSkP21o8l1g+QtJJ18NOxjxePrpASo3iPeptHN/2MN
	 8f0GWhmeyKr9kYoblegn+qrf1woO6VVaHXa20KE2WvqADwZNPH5G1Sd4SMRFxods4ZTyt
	 HVpXR0oc02O9jvwaqpsc8y6kG5DEUsPsD5n8ZhcRi4d7QPuJyjSKPjdasey1syd8DNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZBaSreAQQFD38eDt5XDYtncmNV8/eCgCLVjMti31nAc=;
	b=3V1iKbn5kwIKTIPHQKkXqnUU883MVg37d/mGZzn58+VXTwiaYvN17nHeATZjsBWrisKX
	 nbx8/2GREVPKZRgNOqoQccLuLKvnCzMt5+biur7vaJJhJlQ6Gwzu4qaeWU3d61igvUMmP
	 r65cQcvb9pejVsviSj1WUoyVlrvCSrRMifOaKGPGVkuTm+BZQr0igcwnKxWgtjuVs0M6r
	 fFOd+c+S+qqRhectMkT4IZ1rrUuzjv28nWmg5zK2uAo+aoFkP/8g2s2CM+WPIg4+MPknB
	 /u2H5q6p+VXfeVua9iv0cRIFFokQk/5qgoIrON/Ie5/dAv32S7VhHVTqdawnw3bJ9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vaUlETB+;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57D606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A57D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vaUlETB+
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so2502464f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933289; x=1795538089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBaSreAQQFD38eDt5XDYtncmNV8/eCgCLVjMti31nAc=;
        b=vaUlETB+vOEJri81xxcqpDV7o1gmBwNoKIll1yEKbUzDZfcOE4GFtlHnxjJkxluxuX
         rIMqVyrNZzIsZeQbSVmQ+ATuofnYLJGbmAWHndWqcfdFPGqRKqtg4qUYgGQ6LP38WQ4U
         AYEBXj3AI0/jRwz/6QLQoQmMFH1jS18CfpQHa/pc7CFNNbfoEQyaRi6sx/RjJsUSv/sg
         DqoQf2/oasIQWrZzBs+0OGZHw9Lg05ckzP9MbdoFjTbe06lczKWzMScHYTD1cduf45Yj
         L7Kxz1Se3NVZta9XMbDKbFazmiKsS3wZAC2bfi0KYyWlkFWBc2YAJn1EhTA5KtPoWMgY
         MkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933289; x=1795538089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBaSreAQQFD38eDt5XDYtncmNV8/eCgCLVjMti31nAc=;
        b=F1EOwaxQ8h3h9ItzP2uq10G+Ilm4+BTPNqfvYoxS6JGuNpw/SmQ68WqXs2g3ZKhXTZ
         p7Fqpdw0o9/Z37WoXRfa1xWaPJKhfEwV/kZSCU1secWVjwLL+2TdmgitN0X5mhNC8aom
         Z3wjeXz26ngZcmXxJo1fyK76vHo65Zwto+FffQEE9Y6pkVEdCR/ESsG6cBmrVx1GK/6w
         jHMgsKJadOISrioPf3NNSQqpaxMzxifqxsoBTEeO/ZR4YykPARgO7RnKmaZ5xW7atMNo
         /FtEFLFmZRoL7WsaVCsbA/heBNSMYziPZCV47SSdjwG87WYyl9pE4DNlH9JKwkFs5lEW
         z6Zw==
X-Forwarded-Encrypted: i=1; AL+hErG9BOCKmuyQJIc19xcc1pxYnAs5y62KTT4TlEvdbp3F563TL9tqKsHFFquUpnhYMJaXzbVipWVnGOsXx2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Pu6ZwYIKmP7TMaYR1FUdD8tdPWHFgmGPVblP/E9hE6q5pS+b
	o9/Om1Qfd+RoySmYE00iW64imqmFpzFl9d/0GqEiBTPkhFdgZ8AILA0S
X-Gm-Gg: AZFdTZecg1Vrc7Sw5KGloTCWk4+8c3jdkNtxtPmSOM1yoyPNS9DpacIxdt3kixXhSib
	hp4qH8W0GAiyUH3xtRXEqcEdM0hUFyz/BQ1unfl9lnYYRleSodY3bxxqQN0NQNcTM2O9Qh6lElI
	DTRKi0U1X6+OD6u2aQrYFytCIYq1VI3Q0G4vBxWxwOEq6XRvRE/Dmm8+PsMe7LEUCBBRQMdcudJ
	HIpkNuGyFzVlrBbmqmHSYm7I4pXN6Pf42cePVWT9rBtcbqPiReEqQGwZeW/rNX3lXZmlgxz89Rz
	ZSYxyeRfiqw3llfcwW0cOqLFSpukrBRj+WJhuy4zoZJMiiFl4uRMf6ajgIyL1y7yr6ygza2+e4k
	Aa6wOZm439RcfruUKh4TxkzwuUB7ZsHu1WZJn+tQ25f7Uv5/126w1rV6XS/x/YUpoDzkDytUX0f
	Mn/zo5nC7CSRYaRSuRjYVbWHAY1VG8+I6k2cwl564qf+se1oJZB5nVOmgUlZ1a9HkmSWhQYyEJZ
	nCBjv9BiOYLkPLyfO8cBn7ib2dQjRnCzdgbH9vsAsesOYmxWX41emvALF/678NSZNpnksHVrj8y
	MFTPNBt53vtKoy06FlH8kyi5kgycqfFoyo6U6wdsY3VRe1T4nR58mWYsClVSswBZ9w==
X-Received: by 2002:a05:6000:26c9:b0:497:bd30:8df5 with SMTP id ffacd0b85a97d-49c6dbfff6amr32598597f8f.2.1794933289343;
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:9260:9c28:f0f5:e091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26672248f8f.16.2026.11.17.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:34:49 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 17 Nov 2026 16:34:46 +0000
Subject: [PATCH v3 1/3] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
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
Message-Id: <20261117-sdhi_hs400-v3-1-b4659189db69@bp.renesas.com>
References: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
In-Reply-To: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794933288; l=2532;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=7LlFxU+mY+aa3FL65wAmN2QrH54fIPpf65zJ5XplIvw=;
 b=5yeqRCbIbTitgunEBm3UNWIii168HroDOpVc20vDDV2VAgNMfsum2AMbBy4Ep4qKGIISbBd7t
 aLTf7kPvpLDCpheJinJ9+9EYrkx0eMV018cY1wgONeRUYs9ZFVwjbAp
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
whole register is saved and restored, as IOVS shares it with other bits.
The save/restore is only performed when a regulator device (rdev) is
present, as the IOVS bit is only relevant in that context.

Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No change.
v1->v2:
- Added fixes tag
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 4f8ed1d8efee..a93e613e9821 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e649ef20990..56286431fd2c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1465,6 +1465,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1494,8 +1503,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);

-- 
2.43.0

