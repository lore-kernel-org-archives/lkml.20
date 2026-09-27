Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC73B9931
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541305; cv=none; b=LY4KThwPdVQUkWyH2xwcbgb+f1i8M2LpaaOYGV2EqKYKi59YgXZnAJmaelWqWMQhf1AmXL5TtVuqU0btU4xGdg4Qgk2aq2ZZjJ6j4YIITEWkSRFVccy1FP1eiM+7NVNyW42yOXMA32r6lCImwwd/ynf/yG8hfPNAdSsmfESZ1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541305; c=relaxed/simple;
	bh=3bIzl9Orz+VX8c43Yu1CKKnUt+5gibYznMOCZRoI80w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GoBsCsS7oUDPAiHDGW7iLwdU/BOhpdG3uCtRxHeuj3XAFrHECePvH0/lZLeK/ApGC0cfJUd5g6FnOGmilxmPrBamfjNqZR4ak6h1xcvGWV6eIzkqpJP8s9OHeOWIZjEa6O9P49hcXIH13GOUHGpsLQObdDUZrLPgssLSUkobR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoVQZniU; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoVQZniU"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bd71827eso1265722a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541303; x=1791146103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5sot5gf02iW9KatLlMM7GFUIn+IJuBNvzHGlsRj0G4=;
        b=WoVQZniUiYchS5zR0gwiWbRdhd9PoI4CiG5iCuczHs4ldignNhEFTIvWEAC0sot3MS
         ZpQMxNYlA+Lfph6DvpvI8EKc3RnQ2GsrrXyx5OwWT7zgtvxz0C6NULwueJ7Tz36iacY1
         uqFVvl6cbwsL7YnIQ1zM35kjwLbwmCUfkBiZtzgVLYtTk9/512UW2tjD+W2ULrpsgUCX
         B/RzdZixxh5YItyIUwnVCrV60ZmVob7/zH7k1FHSk0mZFdLAxy4BbNO4mbGsvWSZwtsZ
         oTfW3jyN2KqXFaNjSaAZzYXCCmzhpuB/wxAtbimNKJTVCm1RRWQQzGnLrNkp5M4pPS1g
         z+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541303; x=1791146103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5sot5gf02iW9KatLlMM7GFUIn+IJuBNvzHGlsRj0G4=;
        b=nz381EaR6Chm0aWs2MzZhGTm0gfsbWX1qiMv55loOCDyY37jf9aQN6OR6zxFBQB4nL
         31g3KypevlkLktBkfF991WlrnkiYlh1wSVjaqQdLgHYilUoF+cvT2ONzKGLDnGIvePWT
         OwLikCnZuZreVvDH1aw0oNrHUAgIReqlynrYCMklTu+pYqmo6/SiWXYQw0gwFtA32D5G
         OsYAFUFP4/WeX0PB94TrVoayTC9ZdjYhCK5BAImD5yQvV3ltgFaeO6rxXQBQ8P0cYGW6
         Bkft5MIScTgGjOq/Cd4s6yht1NJJd6ovXPakOaRS+XKC6u0hI/6X/nkexpS8MjyJk/eG
         CppA==
X-Forwarded-Encrypted: i=1; AKwUvBxAc7zeRsK9LUM9gChCbsFBBnRARLJ377FH1sK76TKlBjv8OeqjuOqQjf4gDc1Y8ubP3nZif+NO9r4mjVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkEHt8FoS2E9wRAu//pWxKS+M7XZHwl6ZGY5tMF1lC5Oijf+0z
	il8jQJqg0LA1kiWYNdGynoSPmTl+CrCWb/FNRUFjjyoc2Y8kNaiNQsOI
X-Gm-Gg: AYBFou1rjEQ2C+b2zPc8h9A9cknaL7MTHxMZvVlZMeWEGJKRataeN+NLIXmzOv4aNDo
	SZqerUFyuvpJlj2/ha14bWimro46gw8KKiL2P1YTO7wqvGE6QhPk1N8NB/XZj/HtlDDvetZf4CC
	yjoHs44M7Rxi/Vv5tDo01T49l/2ikz1vyOWikRHU09s00vkuDDRJ4eVIGcAePYwLOQTF8fqJVcc
	h4V8au48JLPejH2aDDFW1oSGFaEAdCCa/XB4UliaNMeF9ZYobYRV1kseW/iHgotRoq1fH3ZJkQO
	JByUudnW2L0SSGtLAkid+falk4Dl726csVH7c5f6Da0hmwlOYLcGfx6F6Kwq8bsD2bnFlqsAi0Q
	kjdSli33RGGEfhJt9mJsdi4VE0RftOXqRJFk2bEVqF6ak76bkQV2mpYMyNUZAE3jyjccXBzC32C
	yHU3/cJK/SQRXK8m0TkBqaOx8H39aMAoS9HgpCe4rUPfNgOmI4+CXJzj5Gdu1PT6TLQFwOkif4/
	x9bnPt4hkYBQDGRkAlVkV0/zoTHqDRZpRk3zQ4aUmHiXUZd0ypnr2hlz89/PmQG5QMpmxlHom71
	VOluRMUn3RsRTF4fxmnbRLXHwIp7NIyMAxfyVS1DhWggcfno
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr9550874a91.47.1790541303373;
        Sun, 27 Sep 2026 13:35:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm22752416a91.17.2026.09.27.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:35:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] tty: serial: mpc52xx_uart: move static declarations up.
Date: Sun, 27 Sep 2026 13:35:01 -0700
Message-ID: <20260927203501.14105-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid a compilation error so that they're not used before being
declared.

Fixes: 4d105880666a ("tty: serial: mpc52xx_uart: add bounds check for psc_num array index")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609260356.tJWbd1WU-lkp@intel.com/
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mpc52xx_uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
index b566206f42a2..472ec39caf27 100644
--- a/drivers/tty/serial/mpc52xx_uart.c
+++ b/drivers/tty/serial/mpc52xx_uart.c
@@ -634,6 +634,9 @@ static void __exit mpc512x_psc_fifoc_uninit(void)
 	}
 }
 
+static struct clk *psc_mclk_clk[MPC52xx_PSC_MAXNUM];
+static struct clk *psc_ipg_clk[MPC52xx_PSC_MAXNUM];
+
 /* 512x specific interrupt handler. The caller holds the port lock */
 static irqreturn_t mpc512x_psc_handle_irq(struct uart_port *port)
 {
@@ -654,9 +657,6 @@ static irqreturn_t mpc512x_psc_handle_irq(struct uart_port *port)
 	return IRQ_NONE;
 }
 
-static struct clk *psc_mclk_clk[MPC52xx_PSC_MAXNUM];
-static struct clk *psc_ipg_clk[MPC52xx_PSC_MAXNUM];
-
 /* called from within the .request_port() callback (allocation) */
 static int mpc512x_psc_alloc_clock(struct uart_port *port)
 {
-- 
2.55.0

