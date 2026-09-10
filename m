Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5073B38A9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084484; cv=none; b=ZRkPmKMoF/B4D5ytLptOT2wOtaUfvoG/4VZbH6UELj5j5KvLpxcqH6k7aHyOo2vlFdAXY0TJbmjnJm1TJEhnJp0wHDyTM640pmV2X7LwJ/vwvXrBFhOFu/HKJ2qz7n9Uru4ctrreg31i6N7+lPY9pobvwfrbjknnMc/8z3ULAhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084484; c=relaxed/simple;
	bh=xtwXIZOGEy5UPVOOx7FUe2g9BLc+qYFqk68bmhTQ99M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBHKOhejOdsO0+VfDM5x3WkMZKl6CrvAlsmK/dQEGxCa2aXOsbMxcVwE7TNzg7LwNU84E4raR1hBc/vk5NSTin2sbkJm245HXnwmluGVsTl+xNTG8cOiePPKrzET/qozqI9cK1s+s10rfBEd20uTC1ZtsNZTP81kH6obGy1cv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTiUtQcK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTiUtQcK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5302b692c8eso4572491cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789084481; x=1789689281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6Jijc6okwul17I+K9OvRXUy0M5JwDpgrdpc+hLNXWA=;
        b=TTiUtQcK8aG0QpD/SYJiUVqSfHdtQD3Ms7fN3ZkeU0EH7a3hiPQgylYaKPyTaog7ax
         meGJduErQ+jwgZmVZ5/fgmNJHgAaChs4yYedsEHHs/v3qy9qx0x/R0mnpnw1JcIw+Nf5
         SOZIe6GJA85edaMR3N6jeHbJ2IgR6TeDqW21ZKU3eN+n2K1RQVNM3MipUty5kZvDgoeP
         ZEl7K1CjPRI0y6QRKifRk9QP9s5+3eWzzCxkLjpsKvdLtGDb/RewrIPIKXipBjXGntpN
         3jmDxXJg946gfLJqU6kl1JErC2LTZMs+dMqDzpIhLmh16JDx7RiyJn4eqx9bdryzsdqy
         DkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084481; x=1789689281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6Jijc6okwul17I+K9OvRXUy0M5JwDpgrdpc+hLNXWA=;
        b=GZwsJ2mPKnlSZVEVnkJQNI6AcSNP+A1ExDQhAxyEha9I/Yd1zZY5UGuF4xYFe8tkIw
         +Jij0vCmPi/ZP/Mi/ZnvTy1ntzAqptrhmgbPYp+KlRLEiG0By/5feqTpuynl7l6C5yU6
         jHpo2E26X5/Er2a12PWBTnsly6ILfoxkI1ndsfZ76got9Q6xjNXmztQE95Ty9SO/iA2B
         h9CcwxwCP+Wh1Gsa69g8d/eY99cvVdo5ae+cIcXGiTASjc8MGC0iEJ1e7fEAbLimgA0K
         yVXB0Xi0V4k9+LtFxDy/aNj3I/XnrQKE6Ob5aNGK14A9WAd2rs/gbDYwNuDFOszAV1bK
         cz1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx2mZyHrbhDFR+8rC+trzJOjVWZBUMiBDZLVjIBw5tz4ofEspfo3xK5L4pChSHk/5O3fuewE4Lm57CrmM=@vger.kernel.org
X-Gm-Message-State: AFuF++ljsEZBZ3hyppmtqu6Sm2pslb6WC4YSRURSfDio3q9Djc+b82Z/
	VGVaMwKMoxbDxtaINGsnCN6gZ2tlFTAVY9EqI8p6i2iK9quA4IYtK80=
X-Gm-Gg: AYBFou1ZEQlkJirQhUVzdPbCc4bFV9CHnAqkUYEfjpzqgyN8fzqcJcVJbmttJJK1p3X
	j6EmweS5EL8IiYFIBU++R+mbKv6wFFGm83/CJfJwoTuFBY9fU1lnexXaPy5LeeWZYZ7rN4MPcu5
	2nXFrgAgYF3yyu1Y6Lvn674nDJDrygMUoPW80RiCMOt+sjfdkOJQQ5tHA8RgL2N107SeCtY3qBw
	fFqaS0eE0Ra4ZlG3/2xmC6YWoJ+9TKWBucg7njwMqxPXdlrLSZF2/ud9eGwWfIQs5XyAeCz+6k0
	BesgxgPmDnPvPVznstFRxIvLTL7IVJYzcvhNQpDwlMLZzqLbrwIhliBEkCddR7gDiof5dJHc7dd
	j0mpSfmUeoHbdaBzTb4+aNC1bfR7OSewZxBYAY5TSs2sBYJmiYtoe85gT+3SpIkQiplOsSve1F0
	TRKbp/j26sy1kM6XvPmrADFdCKVp1/XgifhQDkn4169WaZmB8qyPlYjoK8ORgcrv3mVO2HWl8F7
	LvQCoa7uUv/okfqRPLCmK7CCIf1RwoYzgfJrBIP0WM/226b+Y1kgAgj3IuCLtzq8UnB9YUgpE3k
	My/K6FX0DF76wkXkV8ETuDMIBXIHUJCCv0s=
X-Received: by 2002:a05:622a:1389:b0:530:b2e4:d5a2 with SMTP id d75a77b69052e-530c87a548amr28704191cf.61.1789084476627;
        Thu, 10 Sep 2026 16:54:36 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca48912csm6100771cf.13.2026.09.10.16.54.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 16:54:36 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexandra Diupina <adiupina@astralinux.ru>,
	Christophe Leroy <chleroy@kernel.org>,
	Ijae Kim <ae878000@gmail.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/4] net: wan: fsl_ucc_hdlc: allocate suspend backup before quiescing
Date: Thu, 10 Sep 2026 19:54:28 -0400
Message-ID: <e83f6d9871c4110959ca234f618b3878d5c4f648.1788128904.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1788128904.git.mhun512@gmail.com>
References: <cover.1788128904.git.mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uhdlc_suspend() detaches the netdev and disables NAPI before allocating
the parameter RAM backup. If that allocation fails, suspend returns
-ENOMEM with the interface still running but NAPI disabled. The PM core
does not call resume after a failed suspend, so a later close attempts to
disable NAPI again and can wait indefinitely.

Allocate the backup before changing the runtime state. An allocation
failure then leaves the interface attached and NAPI enabled.

Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
Cc: stable@vger.kernel.org
Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/r/20260806020541.2011936-2-kuba@kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 82796452e54a2..596f4ef053636 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -888,6 +888,10 @@ static int uhdlc_suspend(struct device *dev)
 	if (!netif_running(priv->ndev))
 		return 0;
 
+	priv->ucc_pram_bak = kmalloc_obj(*priv->ucc_pram_bak);
+	if (!priv->ucc_pram_bak)
+		return -ENOMEM;
+
 	netif_device_detach(priv->ndev);
 	napi_disable(&priv->napi);
 
@@ -897,10 +901,6 @@ static int uhdlc_suspend(struct device *dev)
 	priv->gumr = ioread32be(&uf_regs->gumr);
 	priv->guemr = ioread8(&uf_regs->guemr);
 
-	priv->ucc_pram_bak = kmalloc_obj(*priv->ucc_pram_bak);
-	if (!priv->ucc_pram_bak)
-		return -ENOMEM;
-
 	/* backup HDLC parameter */
 	memcpy_fromio(priv->ucc_pram_bak, priv->ucc_pram,
 		      sizeof(struct ucc_hdlc_param));
-- 
2.47.1
