Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197127;
	b=MIYpjrx6bUvu1TZWiLlXD2iHF381NSlHce9DsSEJXGK+toGDGO4qz5rdNZJm2soYK1LB
	 ZdEW9pdrLw/IaQjlF67mp2iIPIR+2ysith8g5Ug/ztHambx9GWHLbkJ1hZqAkYgu8g8ei
	 MZkjoqNkMZiItIWH0T0Sj7ckV3NZBOekDZupw8ULjt80b8vtT7CdEIvekW+l1bxPxFfhH
	 MTWQq7aJhgSzClfvqKXEJlvFfP/+P2W4TmKOvW6pjI+rui4D4QrAj7o/wwhpD5vBdUbfd
	 A7ks2iBycNh0pKjUsoD7yuEQ0LuXqki4/LOMvSqx2ZN8OEU6hqCPk6BOL/SVmBoKJmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x5pMrzNqhnU/C2P6XLQ8m6/Y72S3deTQkrwYq1kdoTA=;
	b=Ygn4xO4OMJ2z6TsCnNajQFVsqbq+l9HleW5xoZsnc7TfEMYmDvxCtlycPH5d/aSUyfOn
	 BbLed5WEVAkasGY1paqeUGEIeXUGB3jOfgQPCTUNcsVIXnIFd1LNf9FkTt/bwTe82Xm7l
	 LD7d22FmIs3jDxa4+BWV+UN30TIOo6MscCeGXTKmNRKExNjscwDmaKy311B5FxC/y2pnk
	 DWUHDo8CbFJIWshgaKNV238QKyb9jBdhPP4qBUF9lXDjxa3Siv0RvUBqh0Ob4NwEksus/
	 82Bwb9Omcfdiup7a+uoY9aFugvjtTvBzotonUYlFDP06uzds/E7YRI8G9zGysuq0Heg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7TLlDew;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C84606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7TLlDew
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so638780a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197126; x=1793801926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5pMrzNqhnU/C2P6XLQ8m6/Y72S3deTQkrwYq1kdoTA=;
        b=D7TLlDewfvGsFRADJTjmPF8rrR4n6LzIhjICYp/le+3pDRjbxkiD4agzf5lGE7L7ND
         YR0c6Y1GYict88qgmGuJFRmPWpJ12Z5k90qpP0gvG9o5eXazBhdgN9mGxuEh0bAJuu7c
         FdK3z4RCRPFa6tTjPWCYRIBB9qhxHMaqiYS2BQLZ+YSJfQDtW9VZIDblnPsOFRInnDbq
         mpth9IY/s1EJ3Q5oKkSz5RLa1wlru717pLCc0xzU5BE8nHJR0faQRHSl3Q0d4U5tmJzi
         3OndwlReYc5K2q2wXK1BkqnvkmjjeGTyspnt9Kn1T37Cxy7XuABQhZwNDcwwGFd5q7ZD
         zG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197126; x=1793801926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5pMrzNqhnU/C2P6XLQ8m6/Y72S3deTQkrwYq1kdoTA=;
        b=0+wlY3GJYbX2ZqwEHTh99PAtWMN2YkW9QlyUhRoi7fam+UmnpIjEpZdhIvR6kloT1U
         WIM23w8UTgIbWuv4mSFkr5WGnIWu0T/UYDxVWgBuDoent3Ge2oSH4WD0fzZ96U3iIvd8
         JCFbnT+HLf69acUFKJAMy3eVmFlaZZnsm1j6fLU+UHeK3L8ucFlPgyXOgQ8pcYByQlSf
         8OXX5vh/A/+Dm4sB7q9HK18+aKvH86NPfvRNrlShWfwcQjL7X2FuoNDO0+9hwaPjMnNq
         XJcpKN4ScbGtkjLCLqVb9hZKkBSCti+v1sK5gOFX3XNLeFSut9NAFXYIECDkgNWHAR+x
         AkQg==
X-Forwarded-Encrypted: i=1; AKwUvByhcN99IMhDasg9NOKmmOkNQhQHBVIDvyW1YEYLKV5qf/ITC/t4mEpY0evkXkdqwhtlTCmbwu+t7oFY3fY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxW3/wgvvS2/Uh16Kub2WMy6PEYXyHGDIfDSW0AuWPOBqlDTsl
	np1t9rk6jEkBXp0F1pUhEEdikggR0iyvk3j7avaybwn0vQUYefvEMp2TgIZLTw==
X-Gm-Gg: AYBFou2o1q5XnCU9lYq8ilIEHGnWsIByQThP9hpwxvpU6XWC5Xcm1bpm2MmkLRi5Svv
	eDJVfqk5BVjhY0MdvnxB/xVvu2FtmbNmhGXonkIHsD0MVS5hFlY4c186Ie03wmR+iLhnfyoorVR
	bmHUgAn3E8i4vC5hSUbGS3gyfikFpJHHBrzAYZaXTZ4VECBxsBwtVQujO6y/2JZU1uqK4B1B5Uv
	zNQyg8C+nd841AhPjQcc+o2vmEDJ2PbjzuzeYPHbdNW6X2ZHknxBcxlkvD3v/LVyn4mW+voN5hj
	LezM2FixfKXmvrj56s/uTHiwEHlClaUq+Oy52XXjQy66C8ZiyAVsWIXBtdVEi7x0o6/G5QexnEj
	TFxcsnACX48rFULawLLmBpcRv5DzZhg2TXoEkufpAthyVi9X/yYesld822XUdl90q45QRfJ7eiX
	ICl3kYCibvCLRv19XiV0yZsCCFI21pf8dv4sQI92vqtm06t/4MG7QI4XnYSlxuGs8eTT1MfhTOk
	rjQMhgC+Kh0mUa1Ct/vFSpmsm5cDJRJX2WRakrLfqi6wKV/J6CFqkGkWzlRy+YzbLDkuNiob8TQ
	pLK6tMIMnFFl/ZX5H1Bs7zDOqpWtjmYqxy8ZtTAKr3wGyc/uXRdtsOj7/vEmT8FI9fbikA==
X-Received: by 2002:a17:90b:2886:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ae581d5d09mr1702502a91.35.1793197126435;
        Wed, 28 Oct 2026 07:18:46 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a0482e9sm3437223a91.0.2026.10.28.07.18.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:18:46 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] wifi: nxpwifi: cancel channel switch work on teardown
Date: Wed, 28 Oct 2026 22:18:16 +0800
Message-ID: <20261028141819.7556-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028141819.7556-1-enderaoelyther@gmail.com>
References: <20261028141819.7556-1-enderaoelyther@gmail.com>
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

Stopping an AP while channel-switch work is pending leaves the delayed
work armed. After driver removal, the callback runs on freed driver
state. If the AP is restarted first, the callback switches it to the old
target channel. Reusing the interface slot can also reinitialize the
work while it is still pending.

Cancel the work when the AP stops. Interface deletion, type changes and
driver removal all stop a running AP first.

LLM assistance was used to find the bug and review.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. Not
reproduced; IW61x hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 473e81304ca8..384ba69dd058 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -1638,6 +1638,7 @@ static int nxpwifi_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
 	int ret;
 
+	wiphy_delayed_work_cancel(wiphy, &priv->dfs_chan_sw_work);
 	nxpwifi_abort_cac(priv);
 
 	if (nxpwifi_del_mgmt_ies(priv))
-- 
2.56.0

