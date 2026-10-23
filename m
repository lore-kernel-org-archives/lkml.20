Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741992;
	b=k6Wunb28kYdO1v5imK12tfzJ8JbhQmeKhm/vGyE4GQRCV6SdnAQvRspCv952sVbgevhL
	 CbidAT4v7BnF81ouwExdd9BYGcu26CEoJX4+m3UFIqs2vNEdXR32I3o9x7OSBxViia9p8
	 xsVfLN27tE8j8d2PhJoPlDZr2p93jqZGAoprv+A0OmD5XPvdI+8qEQNXT3CWZ/zzGEPyn
	 KjG0+J0kVXxTzbayv8Ae7UphfZhemXXeHUgjT+mjz+rlUZPBcp/uCw2QjiGRlHEPMf0Fc
	 bRHk/DWqxz++P+mWW/HWty58msFLVT2SiXnqswCP/hN7uALSW/dlCntI4Syh8HFSh9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKDGcISKRXyb1sB9uqlDY+pTllRaTOFvJWwaXJaklRE=;
	b=rMsw7cwGMTmET/sC6TUIY7m1AiFpY2cGISC0cBdBZuEhr2f/3JjcYodN+w3h82oLRPo7
	 hAV1w06mwmrocjwC7vJjR3Zf0VMIb9VKsLqUSBLcy3aarVQ/EHSN6MSj+dNCqk1HKnGsH
	 Uhs0h8GWqN5gbo55F3xvdrq+4Yi1/qbXmgcso6SN4Sy2ogVyws0BDM5q1hKysSw0gHynk
	 oTOhwrsQ1HgzCd7eA+2buzDt9JuPDCDVVRrXLBHxnAEI83uj5U2GdzqrKsYCK9uxY6rYB
	 mLPkiezTcIBpNrT5xnAom7LCsWwdhKBH1qvAeF6zad/3bh1rj3IC5iQhJsZ6uWZhxNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eiOS3Opq;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B9606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eiOS3Opq
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-15965232451so11222c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741991; x=1793346791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKDGcISKRXyb1sB9uqlDY+pTllRaTOFvJWwaXJaklRE=;
        b=eiOS3OpqahCkc2IWWON/xelWyX4TPHoReJ28ISX+sQhBpCwrMIc6mPlvZRiBn8vvvL
         0QGmy6UNMBp+cwKIgTcHduqgWZNsD+75bVsJ8LwWnepmdHPxwkf3QHFboHpB6/uluIbY
         vZ6geobCl5/VQ04nodhtLqypj8NDEOHMJaopbIOA35Lou0fIqCLKD+TDv9hOLvfuPU2U
         G9dEc3+/bnU/mpAC7hyCkioI2g+Tr1z26urE+J4hO+JhETrc8PCMoPsx7o47y19vDHfi
         Tm9k0axGaB1h9s1Cu7GDvk0DGS5UK/7eHj2bbxe6PMlIjn8e6s9xwZVsS8lg008okPtw
         QZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741991; x=1793346791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKDGcISKRXyb1sB9uqlDY+pTllRaTOFvJWwaXJaklRE=;
        b=guzVhbozAHco+8Kcazk3pHKbqf4rzcc4Avtz3GgbtxudS/7Nzk6cvJjAeHeNpejMHP
         7m1hJKlc9OQnDcnC5z1eRCg+zxhqw/vNZL57IqwvJwIWYcew5B84qz+/aq1wXIKkXsqT
         lZoBtdtv8vDGje2XoTi+aaOdW4N5xDVERHnwyMe2pLXGtMvpo7+jmJ8tzw1f20iCzJ0A
         CaKFeX/12hj0uIk6U86FpjYNJa5JaisxYic7qFBdHriG5TOrlc3+wsL0B7T44RZxwtgH
         Gl6XX/n/YLtj11VzB0v72uf+dzRuZ1cto7ljfI4QmGRXCcT45egrAEkxHwShJkyHSIId
         B1Wg==
X-Forwarded-Encrypted: i=1; AKwUvBx4+N9bDfpHcanZZEohwntwVs9R2gUEIFsU2QMzW1kDrttCPy/H9CzSdRZD8UN5uWhq4azdnNnmeB78u0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL+VB6Dt2fxdFGTAu0qjqoo9wF1lfyLw5/YBetJpPu3BQfXOyy
	V2HTYlT4Uuq7uI8GPc54S0nueynkT4JsPxfZ4pQbzvzhj4CYxC9WzGMaLokId8QhQ8s=
X-Gm-Gg: AYBFou1QMdnQg0GfBOAqHU4iEKlsFHHvFuyonwuy5WjRNBWV68W1sOFYF4yAUHFKstO
	c55ANqIYsg7YbqUVXkxAWogKUAyT70tkoYiuNC8fXYaD6+I1+9LQYBPo+2sbT7JKfDJ0Ls/ch2p
	J0FRXRPSQGL/I1HhgBYU8o8wDLx9yxUcyL29HrJpi2orFlGHhoVY4gbEKP5CqayfVzl8AAz9XJH
	9Gw6hU++bkJysCWsWqIfFfJkvxm58ngYb3qjIdh/UI2OFmIo5c+APkqg9uma/n8ccjNQzAbKcFZ
	MbAp0zK//hdPUkQ9szUw+qmZlrq0vwVpTelLxNsvDR7j8fYeoBoUN+QfgOv/aWey3B/Wce9EQjd
	9e8lb9y6sATuAi0bVT5Wyc25vd+1Abd+qy34x0T/tY+fRsZ0o6f9BknXVSsFzbD/czaSIuJkAc4
	7DGpC10SjX63TaEPFfRFUVWE/VnRzeI4vg9SrUi7VnCRHvkYdq9+VtkpEj1HUjyEZ0RmXPsPder
	nAQQlAQO7Pte56fQbtA59OwFSir8gzPrDi/dVnW0acQMFRtc6HFcu8=
X-Received: by 2002:a05:7022:3b89:b0:196:b805:9546 with SMTP id a92af1059eb24-196b814d873mr867259c88.10.1792741990964;
        Fri, 23 Oct 2026 00:53:10 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:10 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/4] net: pcs: xpcs-rk: fix cleanup action error message
Date: Fri, 23 Oct 2026 15:52:14 +0800
Message-ID: <20261023075214.1793922-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
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

The devm action registered by xpcs_rk_init_clk() force-suspends the
device and disables the EEE clock, but the current error message only
mentions the EEE clock. Point at the cleanup action by name instead,
so the message covers both parts of what the action does.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index 698a43b75334..6f0a110e32d2 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -365,7 +365,7 @@ static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
 
 	ret = devm_add_action_or_reset(dev, xpcs_rk_exit_clk, pxpcs);
 	if (ret) {
-		dev_err(dev, "Failed to register devm for EEE clock: %d\n", ret);
+		dev_err(dev, "Failed to register devm for xpcs_rk_exit_clk: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.3

