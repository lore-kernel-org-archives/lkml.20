Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741982;
	b=vpSpx9bntcWBtIfn0e5/wmKdmlJ9+XlXh3it8FVG7kST+GPk73CtdPMqOELYW8rq/wJ3
	 PbB8BaQnLGqc/c44L1TvG8m+saRoSJUq81I/5D+3ZsRNz0Ke+Te+jE629JzoXm0IxjEsI
	 D5y7KhuzAPF5w/NJG9oTS2xlbvFHYlGgCUD28JVcZH3oejagtYUC4PYpGp0bmBj+MmZua
	 O5fRXk+cEVusYQ3+ACaPePrwC5ww1Wc+IS/RiYJ3ucuaEdRd0HNvMWOrEIna9rVKkxOLm
	 WJzvroDv5Wuywr8SznKmnIWDWm07rSLzLzyHYM33ND9UogRbZE7rPMO5AJmRhP+7jSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LOqLZKJMT/w+vtW751BtQ1dEmz/kTbksIe//V4Kzc00=;
	b=AnGzH7He1dhojNAkfEg1S+ZrfTNS2rEZzteCMdDhrm7sHJgdPGFQrIzreSqdODThbENx
	 ehsV1RWgpKTHugSccB56HoUpCFkTdeXu7eGpZeoj9uLLa4u2YNBcdXLap3Mi4/b8Tq2iY
	 jilMkpH5lg28IOUUTjIPQsLOVfeZHuaP3suglh7TnVf3gyPDUaGaTebvvoUjJ9sN4+wIp
	 ahts/aC8bYH9kwEfTDQMW3ZaC+HUsGFgRByXR2UXQMNIz9MYUFF0xroJEdIl+7d1xpVgG
	 2FAMhG7PjYmMCbqZQPB1sh8OX0X/kr5dhZL6rOnr+YdMvZ/etCShDFlnRGZLBef3F1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JxE1+eql;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JxE1+eql
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-164f08a9e84so136556c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741982; x=1793346782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOqLZKJMT/w+vtW751BtQ1dEmz/kTbksIe//V4Kzc00=;
        b=JxE1+eqlvJtU4CQrWSvo7l2FGQCcRo1EVf+I7y3D+30KAgPqweO7FHNoAJueshagAf
         H8b5fzC7vPQVcNLJJstTuRNv6jtGaCIoz00QV7iLbDDSh5o2Ft8nwhAKv7UlvqS612+k
         c50r9vZJk3QkQt2mRpSlpKs2+TO4h6oGQjMP4Qn1hCAVW9BEmO7rOnNVsLpYYTH8Vols
         BtOrTOV7Th762QmXqnkpaL4g5fMeilhLuYJr6yjM6nBVmzdUTfuL/gAwVwmzH27wIy89
         OBlgDBbGsvrBgrrZ9N9TzHCzDJGEcnAN+ioxuAXpdznilpqqdcxiYM9Awi7n1qjahN0n
         Fmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741982; x=1793346782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOqLZKJMT/w+vtW751BtQ1dEmz/kTbksIe//V4Kzc00=;
        b=TFR4h40xd1THd5Jxt1ldv3Y622oNSyivWchpyc4Wixl0oSqN4BgGVhSVWjD7U29juQ
         G/MmajISZR5gplLQRLcVQDBMFCcboNmaRheZ68nty03qrN1T4bhmWRsZBKa0BVrblvM3
         4NJm4sTs9goZD3A0AMb+LHoqzQK0/4LbkQvtcLEQDKsJgZ/jWctu6CFct3gksLc/XjCa
         o9ZHXifsEonwUOC+dgTwFH5Ue4AVUNHp/rEVV1MyhVoztLub6afxkiWEkPGnD8KbghcA
         fo8s3JDShVSksvPIXKVtAoj2acwZPBkvVi9mGYCT+LUib8elfFD2avUpTOItHHKbENXW
         c+Lw==
X-Forwarded-Encrypted: i=1; AKwUvByVfxyuqyR+WywuooCafkEw5wF03NtqOKP6Jp7bf7z5DCXaH30LD09Rgh3pP85Dmbm9Tf0pRDYbIJohAzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhG1P4bqESYP4be/lBrT/CnWzJwZXIue6ZXtfmwtbxcW4zTU60
	eKeEwauHpXrzTM6d8smA3lprKT/gG4fC84GD1vzoKdOCxGLPLFEnP7dB
X-Gm-Gg: AYBFou2ef1RnCiBRUeF+l0tORC+HqVHqKnE/FKGeQlOjMAjGP+6Is3TWt8gzT/+pl3+
	4a/eCDeytjItkzFEbx70ZKqDE0sYcMMFCTJlk1mRXLqVC5/jlRBayghieRRMwm94dTxSPy4iSkb
	tG6g8Ux14YpEd7AYrlMjYOaXXcZooTtU9x/NxIICVvNE3crHfPjPQDDC+xeEyUNYGZm1kKVY9Bu
	GdTjcT2tsgnFoUPagMOUByrXrGlo0eCbdTLbno2pAewnZNZj6IPrIaCPeZ9d3LTMZVwLGZz3oRE
	6a7Kf7r6vrkRq2EGEHCFvredeP5yXRRdwkbCQT8tt2TECXIr5pgQMrKD/esrcaz/Rj7MhNdPTBs
	pH6Br5pY+dbKkCXuEdPK3Sdm1kvnXM59rC83GEac7eS/vjKPB17gpvSQ9Z9cd1ELCswDzD5oR3Q
	BraARxhtrzS4/G8/eSazTjYyfN9DLb9kaTtyJ3sn4frk9Ipi/DhcgKJXtqmvCnHSJfKwLoro1jK
	U0LVHbbK2lg+zPPUqtbbcRLy0Wm5Sci1G+zQPdhZppvjNkCwuuJB+qgY1oW1xU8H+d4rIYM51U=
X-Received: by 2002:a05:701b:2914:b0:187:a2b1:7b3a with SMTP id a92af1059eb24-195c77a82c2mr1718936c88.41.1792741981479;
        Fri, 23 Oct 2026 00:53:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:01 -0700 (PDT)
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
Subject: [PATCH net v2 1/4] net: pcs: xpcs-plat: fix runtime PM initialization
Date: Fri, 23 Oct 2026 15:52:12 +0800
Message-ID: <20261023075214.1793922-3-coiaprant@gmail.com>
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

The driver calls pm_runtime_set_active() before runtime PM is enabled and
before the CSR clock is prepared and enabled. If the device is later
suspended (e.g. during unbind), the runtime suspend callback tries to
disable a clock that was never enabled, producing:

    clk_csr already disabled
    clk_csr already unprepared

Set the initial runtime PM status to suspended instead, and register a
devm action that force-suspends the device on teardown. Without that
action the CSR clock would stay enabled if the driver is removed while
runtime-active, since nothing triggers a runtime suspend on unbind.
pm_runtime_force_suspend() is not checked because the runtime suspend
callback cannot fail.

The clock is enabled on the first runtime resume (e.g. during MDIO
access).

No upstream platform currently enables this driver with a real CSR clock
dependency, so the issue is not reachable in mainline today. It was
found while using this driver as a reference for the Rockchip XPCS glue
driver.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e669a7b248ac..11c4239bfd74 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -275,6 +275,14 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *pxpcs)
 	return 0;
 }
 
+static void xpcs_plat_exit_clk(void *data)
+{
+	struct dw_xpcs_plat *pxpcs = data;
+	struct device *dev = &pxpcs->pdev->dev;
+
+	pm_runtime_force_suspend(dev);
+}
+
 static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 {
 	struct device *dev = &pxpcs->pdev->dev;
@@ -285,10 +293,12 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
 				     "Failed to get CSR clock\n");
 
-	pm_runtime_set_active(dev);
-	ret = devm_pm_runtime_enable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, xpcs_plat_exit_clk, pxpcs);
 	if (ret) {
-		dev_err(dev, "Failed to enable runtime-PM\n");
+		dev_err(dev, "Failed to register devm for xpcs_plat_exit_clk: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.3

