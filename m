Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013541DE04
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377375; cv=none; b=mpQTNw0VmKO59PA9FHa/0cxkUzTqQIUsxYY9LqNxjJiUv2om86fLqiXhSxjJ06HHQ3drOY9DFrwvC18+O+c50BNFTAqibsUECjW3yOa5fbTa2YHB+qUAwwgA8gfu970QWTpKSarZzCwWPKM/ArItP/W6hCsoWPdHzR8KQ3DuLUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377375; c=relaxed/simple;
	bh=vCCKKBE6ZwQFp4/uBtQGW5Cos6w5H6iwmaVFeZfAI9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JSOrOrTtvZ5Q4EpIuUsmbxkBDSXtN5+7QnAeKRuXkYQLXZvVuYRmvu2sO4TmRwQHA7yEEcke5LqC8nCBIC2yVlHD2eYA4QoudZ87da44q0OwGMZ5ci3WbTS6vzePPrrmPQp78oDe3uLTBuVia00bkP9UP5903AiRWnzTYXuFz3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgDxduyd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgDxduyd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so245560f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377370; x=1789982170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nr4hj5yNrTGarILfpUN/0jwzo3TSmXqMdJdrc9XKJk8=;
        b=LgDxduydim+hDLK/NwtgWnsKtw+FNSFB4d3LvACpVBrBRW6fFXGk/scm0JQhc3dmjB
         WxpBkyHSr9FVZXizZn/VmbR4aW5js67qjrcRLmaEIkKknACRToKTZfo2Iu4xiZKUTmP6
         Rqc13h8oSd9FmgwPUFcW+yQ5HO34ranAZOGRM1JYaTT80U+OtvGwluMM76wNylswztZw
         QTnagpJUAU4SvEUx2jirbRLypSb2a+TjvGsC+I0E69QWJKP1H2WfIAmchAggzgz9onHH
         EvM6peTrnd6GrN0NIqJHiiaXakdd+SZVgKr8Yk88lhTAYd3P197mcTnIzRBUhaObt1II
         3NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377370; x=1789982170;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nr4hj5yNrTGarILfpUN/0jwzo3TSmXqMdJdrc9XKJk8=;
        b=ksDzz5VuXVxu7ymywiqKK63O0DOTdqtvrNgSrs2ebcaUOutysU9Pi8C3LYswXGz8Dm
         iObluAn0OvaytR+sjv1cI1euBDdL97GFkfST4Tdw/cV5pNLKCL7r1gcZ5oTgLAvvAO7s
         lYUdX7SPBsFnx/U/NUqawmEBSQsUoj22r9M5oTH6ZOVOwZYtbzEsSMlRqiIWfWfoX26V
         NXsDmEZbLfU3Hl6W8e5BsjLAuuRe6pacoVQ57zyy/0FOy5FZIDxbKbrm2kEpUh5NFiMU
         /7CaSgT8G1DrQdBTtIz4Z+ARwUIr27XVGsT7aLEpyW1gzISAQZi9gVrw+9j6hQSdtSsu
         wsyg==
X-Forwarded-Encrypted: i=1; AKwUvBxU7nd1Xfc9k2p/pSyVliqvQxitO8KuHHXxWdR6IQff13dJXDsTuRzzF7MK/2PGfC33IzikscrFdVs3jw8=@vger.kernel.org
X-Gm-Message-State: AFuF++kEzPJ3U3713rfEH+roxR/agBhZBmp0e20XiRcS1KmgkwpvU87f
	/wWbp7yb1ZyYaPjrEBb1HRW+ZfC2Sa79528fq6O6d5/LUJOYDeD7aojV
X-Gm-Gg: AYBFou1etlg8ESYosJRzNhkT6767huZYz00MtPIY/cQaFjPDEyWLj19hbIxsI0jc3P2
	lRCIdv4FXWhsl+2f82RUUFU+AiWzWt2GfH7S3mxPIxiBt1dGByITeQOjhryiYAPVV+zlQ+8Vm1S
	Ak8xP7uxb6Tlf2quDEIYrJNOlRyvEG6l9/vFQp+RPi5ybrA1m/4HHkFiTzZVyd81wVCjODKA8WP
	fqAtJb+3DSPZxE/GPjAO9glE2V2Qbzh7rVmM7EYhOj8XEmXTtqg2/5Du5k8eKN+n844KrXNzOG3
	bC/GX6U2DIHsyGbUBY8+Sa5A39NuXLGbsKxyq4k0pQdS4KKvZrn3nrMPwq1Yc4/nBIJ/ycCOuHV
	sya61cgniI5UtruecEc/wUvP/AnpLdPC1tX4qlx8jS3zi+zj8t4sFkYh08yLY54CDeHdqFD0pkG
	CLF7y7xAUIRo2xCJ3L95WJheBAEaboCuRio06k+10Mdhe34dVKbanj5uQAzwqpabwm/SG9kKl44
	d4giJ9G1MvR3Q==
X-Received: by 2002:a05:6000:26c8:b0:486:f3be:2a69 with SMTP id ffacd0b85a97d-48702b5ac36mr1700170f8f.3.1789377370080;
        Mon, 14 Sep 2026 02:16:10 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ebe4sm21750210f8f.14.2026.09.14.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:16:09 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: lvc-project@linuxtesting.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matteo Croce <mcroce@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: mvpp2: prevent buffer overflow in page_pool allocation
Date: Mon, 14 Sep 2026 12:15:57 +0300
Message-ID: <20260914091557.71769-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The per‑processor buffering scheme is supported only if the
number of pools (nrxqs * 2) does not exceed MVPP2_BM_MAX_POOLS (8).
This is already checked in mvpp2_probe() during the initial
activation of percpu_pools.

However, mvpp2_change_mtu() may later call
mvpp2_bm_switch_buffers(priv, true) without this check, which can
lead to an out-of-bounds access in the priv->page_pool array in
mvpp2_bm_init(). The array is sized to hold MVPP2_PORT_MAX_RXQ
entries, and mvpp2_get_nrxqs() may return exactly that value. The
per-CPU scheme then doubles it to nrxqs * 2, exceeding the array
bounds.

Check that the hardware version is MVPP22 or newer and that the
number of pools (nrxqs * 2) does not exceed MVPP2_BM_MAX_POOLS
before switching to per-CPU mode.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7d04b0b13b11 ("mvpp2: percpu buffers")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---

 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index ccc24a1301f2..848ee655c6ea 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -5086,7 +5086,8 @@ static int mvpp2_change_mtu(struct net_device *dev, int mtu)
 			netdev_warn(dev, "mtu %d too high, switching to shared buffers", mtu);
 			mvpp2_bm_switch_buffers(priv, false);
 		}
-	} else {
+	} else if (priv->hw_version >= MVPP22 &&
+		   mvpp2_get_nrxqs(priv) * 2 <= MVPP2_BM_MAX_POOLS) {
 		bool jumbo = false;
 		int i;
 
-- 
2.53.0

