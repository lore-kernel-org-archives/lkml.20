Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14463815FD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370142; cv=none; b=PYezMqQJWw8eKgBpqQ9Y1L+yT31vuztFjfSiC16aX6w3oKhrDXhNEKeXnUZkDJOkEsntolyv76vEdpKbcnXavNPz1aYEeHCewd7lCFBLi/6TE6HmaCINQMP1IX4/UC92qjLw31+1ItX1m6ZkZanhkEOExZ7vDjTbyl4piyTXP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370142; c=relaxed/simple;
	bh=Z2lb95NyFj5VMsmWjYdqmvMmkWFzhfs0R05riKxv8DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtNJeCVU844AX/AEKClSqMzlkfIPHSk3Yk8gPg3PX7WNWDmjdNWjrPnpEXGnF2DDNLbnbk51UJi1avPkTBIfENVVA0/owCUWt8O7SEOtrcp/g04TV+M0aoW0q/aTZu2LaBSq/DnLUp1SN0XPCIb66ioXkPlcnX6S9fltraQO6SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eho/KnpQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eho/KnpQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485850cbac3so1491469f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370139; x=1789974939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYDvBl7Hf5spaenerJy9kw2Xhfgsi5OoXNIquuHbSV8=;
        b=eho/KnpQZE3yB4bnYaY5/s2r3ETWOcLDS2adZ7o4nWh/tRc+IzN3ru9ZNOGqQttN0/
         qTYfv0wsYpwmK7nNV79YdZPdZcpFoIl0G9QKscysTcrqfG10w2Ui3InGr/pd2DtQ/mFE
         JJA8mTVBf+KH9W0tJhqnfxBhHpsh9PGT+R7XVhW6Bmz1BE7dPw3Q1s3GtXjI4DQPNZ97
         zzDOzFRGsLSEXzRY0tzIBcvkQQLy5eLmFNeNaCkb5UddIMoO3O+R6tDaasMfNE2l9+P3
         bTJkY+xZyKUACCe7XG+Rdvv6Mb9UWYfoW6lw1AlKWLtLhh4yPUW7EFDtA4YcBiXcPnCJ
         b3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370139; x=1789974939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYDvBl7Hf5spaenerJy9kw2Xhfgsi5OoXNIquuHbSV8=;
        b=aPJzUEGBtKr5SGO2u7EAu1jeLtUYgq52BVqSqdR0Nfn92B+93RZdEICnOOpwM+spke
         hcLm/Jb0OJom2qSMf1w8vcENey2bgnfWNdpU5x8OlN9NGccvu7bBi2CqfZygdF4It18+
         IjiC89vfGNkA6x/hWoxWgzV/k7GJyyM3JBHhjW5MSiDHrPbLFMdyh2q8GnJMYApZmZX7
         VfKA0IxjDp7HF2xWVv86/QxydpBc/Ef/7Lvqb9QgXuz4AyBdWuS++CEfgzrwv7t8+4b9
         FvPMGGtJFDPDujxphCWVj3Pqj9rzwdHzP+JTfeAL7VjAeLpTbngxQWXUzjw9pubGeR8u
         K4SQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4TYyy6r6ZIm5LXG8DjfEW9UlBPakwAQpCppoGvFhyIbOLuT8AaoFEXYNHktsFm0YQRRz+5vFTZU0G1o0=@vger.kernel.org
X-Gm-Message-State: AFuF++nLYlsxNf+oCPL4GKVErllq5GDq7tUA+TJkKD4Gk9loxwxjptKN
	ZBk93nPz9/NQNLxYKq/JSMnl5+oVYeHMqK54XB7hduDoF70ZL4bDg6Z1
X-Gm-Gg: AYBFou0mQUlZpTRhqe+SODCOkaviYwjh1RcZrtGCG1GMK5Ao27/SSdFONuaepHufmb3
	qPbQoAZjkmnHNyB8ODMuuzaugbUUxQESyzpu7A12C187Goa61mtcYVvNee1KLIYJ0AjjkgRvkMG
	+TK2TuJQPVauxDTw9FcHSIBqc3lt3GIn5I4Zao5ARik3yRbWR0I7RnOhml0XChkxGB1YBV3W/x8
	IECMFbvzufD+A/8dsKWGqDANja/Er8s95PXSonfjEjycnOm3B/g9W+QRZEQ6CwL/ULhC04LiXSR
	+mniSTykkUWdolA/jTm4eSLS6+BpPBptUdv2dwELAofnFUSCZMiks3H4C7ih1mwMgJFVoTCJIKR
	Gcu7E5N3Q4nWuxG/6cMcJnosaIhzFAEODC30Hz2mOsCyuSYgyWrw7BwELWq+zG6QFjH1EUnoDz8
	BygbRcY3QyxutOt4lYzT7GCjPfuK59L/AnxsJvqS/mGP6BoO0iTrcOihUEc0FuRJRvQBPT9u0F7
	nP6dQUZZsfdlzJOnTlG2Mf6Y5FLivZgysmL9IgA
X-Received: by 2002:a05:600c:a00d:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49e7a678d2amr12314265e9.27.1789370138746;
        Mon, 14 Sep 2026 00:15:38 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm24472558f8f.22.2026.09.14.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:15:37 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v14 1/4] ptp: ocp: unregister devlink before detach on probe error
Date: Mon, 14 Sep 2026 10:15:28 +0300
Message-ID: <20260914071531.11640-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914071531.11640-1-maimon.sagi@gmail.com>
References: <20260914071531.11640-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devlink_register() runs before the dpll setup in ptp_ocp_probe(), but the
failure paths after it went straight to ptp_ocp_detach() and then
devlink_free(), which opens with ASSERT_DEVLINK_NOT_REGISTERED(devlink).
Any dpll failure during probe therefore freed a devlink instance that was
still registered.

Route those paths through a new out_devlink label that unregisters first,
matching the order ptp_ocp_remove() already uses.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3d26ec1f7b9e..401b04f12d2b 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5119,12 +5119,12 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (IS_ERR(bp->dpll)) {
 		err = PTR_ERR(bp->dpll);
 		dev_err(&pdev->dev, "dpll_device_alloc failed\n");
-		goto out;
+		goto out_devlink;
 	}
 
 	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp);
 	if (err)
-		goto out;
+		goto out_devlink;
 
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE,
@@ -5151,6 +5151,8 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dpll_pin_put(bp->sma[i].dpll_pin, &bp->sma[i].tracker);
 	}
 	dpll_device_put(bp->dpll, &bp->tracker);
+out_devlink:
+	devlink_unregister(devlink);
 out:
 	ptp_ocp_detach(bp);
 out_disable:
-- 
2.47.0

