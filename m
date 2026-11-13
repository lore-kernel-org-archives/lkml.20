Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530137;
	b=KOLqu7SVSL7Ygx3CUXIVsDkynSx4JDVnuy8Om7n/ZTA3+YZqfzmwQYfLLP+mbU5dQWJs
	 a/ZSKBeerCch5c7UQYjKp/BLPAcGqaYh7WMf7pF20h6ke+ROzEWt1wD1tX5nyG6645QKt
	 rMcpb8x5L2sXxkuHk9IFJwYwDR0X1TwL6f4kmTkE2F8lIESkgQPswO79/86wN1lqK0jW6
	 u52ypuaLREy3X91imnd8/kT2ihRf9W1f8+CdERns4nPX/lTxUtf8K/LZJfFdOGaV75ORA
	 9oZw9NaS+BmGoxOoE1YkDCUIUTDSD1wsO9HvJh8h2De3p1gzto0Ecq3WEPELtLQ8Ygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
	b=JC/718LKMY0LzfgRTQfWMNCJ4XYNM7mgQ7wDbYAyGLu+e37rbUIAujHOVrqykqoSzU1R
	 1HKZDFO91z4qa48KcV5zofkCovEQQqdbs+F2QMpN4wK94BktV3xMIouSLWkbghR3d770/
	 BJ1rsdQDXlhTg9i0hYh7yvRo9h3Sq15AQTBhLXDoTdWtaeLljEFDnRnjp1lsBLCkFIfoH
	 Dadh3uGQkbolBltbjZdjHpoeTn0X0sNNciw5WAG/dzgYwXumYhCxMK6ivI7o58ZfzLRZn
	 0xIMdSZ0chjmACeVrP76A8rJSnrb5idf/1t0oMIHE43OA+OnCSN5frN8aSgiG/OxXhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJl0+cgB;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3A606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF3A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJl0+cgB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso341677f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530135; x=1795134935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
        b=MJl0+cgBMiL8RasXMldE4RmIMeOq6phlZFaQrRYv4QmofPXycKDBLd+ZAAxdt+dsaF
         OAJJyxbd4oDmtdfzK6qpO14YXfE1ZVUFNU/mbvri/HbQZ64juUFNW3bKb6DXjfLCCTlW
         pXDM+ohyzs/MW+8puI6G0cmPMi7HPpKaGAHhTAq42aN88OFADBYzkY9Tuxn9kqBRyROx
         2TRFPnL1ev997JF4h+4M0c86paqgLWbgSKjInUk0ttZ1G+F4UL4s8FIS7hmsZmI4EUqa
         11uExOjjRI/9vMkA531lOwHHwG4UdGxLCCI4U4y/PZKn2S8jo4eQyWE6wRllqjklWcq7
         owVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530135; x=1795134935;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
        b=LfDAvTRljlkwaw6jhcV8M6RQqfJBGJWbmKdGP0LITw/6C8m6cp5HgcuAb0L0qmLkXF
         wa+01KKvzo+TgL/wlNDJmehkICTgGuHJCEfvbms4BxH1vXtEKORbOjdhir4Gv8BTXnbK
         THMtOv954v0uG1xBagQzWj8Ja5LPYu99P/8gMJZ++JQtTLjaThtWw6+RHyiMgTBbu6Vo
         lWJvPkLzwNMOm8rva9NIS6KyMN5H/dvIZRF8WfK8Edq4E4WQuZp0BCUbaOgCh10OFMKa
         er0kUPqzM65O6xnC6tCS8Js9WmMhFvY1IPyqawPnSKJsAZDXr+NfPlkpOPDG9U0xAT7V
         vAcA==
X-Forwarded-Encrypted: i=1; AL+hErEP3yVQrynKk+FOc/YdRXE2saAJyso7Cc5ctrYM3Jrt8kMdwvtCiTExeqhmAvka/71BrP4VOFlxFxBl15c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IxAFEmVJdwXw+2vUSga3bUDd7r6biPRx3j8nPedEIJKKs0Ps0
	5yOyD/UEQFIqJ0SqdvvmF/owUzYg+ojbkAlaBIdex1TWasKR9IPMJVcBlsYVRodJpIE=
X-Gm-Gg: AYBFou0yMLkjwm0w9ggIkhLj0lUfV5QbFEFfgOZncmiQ2AzL/qXex8vhe6Vl1cuGgWA
	+gGLCr+q19+qlLvG+3XJQk2rYQToK9LyZypsvUNoRx4fsTKacRCFuIe2zRuLsCrW42VvBjI8Doq
	JH37QFtaUojvBP73VX7H4Gy+F+z9m30P5QcoHaFzz/p+QzTu+vljdwXaQq2bVknIeoug8NDOoUL
	DvUYaNCogyA5/9hveAU6Ousc1yi9CekHjVzbtjACLb8KOAs5PYjyAOX2DlT+pcMMfsPDwQ0OjoO
	krVHbPGeZTqSmuzITXlKdRJMHpQJeHSGHBsLy1wjdEjUB/Tcc7r5q9Rov5KIj4UqWxUM7D/NFi+
	pFjrX2yofiQUWVvsQttGWGzbye69Qpphj7brCU5QnW13k//KpMSfef6ivYRitu0+sMC6N7j8xXE
	cOBgVawgWqkMIw3HrvmcaV68bqm5PVhE4Eun9sx8RmJ//13sS2oX5unuY68ivo9XM0h+/tKqym0
	J2ybs2yxoFjEkKcb86jRu6RMfDdCY76eT0M1WVKmgdw+Rbt30Awrd5mOb8kHrktgU016xRjEKNq
	6UNjbiiLQHb6uGCI4+ii8idB+8uX8sTYWoqCl8dHR94xxc5KlqicXs7lCVfw5ux1dAaCyDYskfR
	iRTkY9dUaPjCxEJv7J/HED4KTkgKDSJvlZzzWC9S0yCu4xZ7ZNUlY5BK+0E0k6SqByczBwGpJ3w
	eStEH9lnTe7+D8oyqA
X-Received: by 2002:a05:6000:1606:b0:492:820d:107e with SMTP id ffacd0b85a97d-49c72f7b036mr1416827f8f.47.1794530134927;
        Thu, 12 Nov 2026 16:35:34 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm1703515f8f.20.2026.11.12.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:34 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Fri, 13 Nov 2026 00:35:33 +0000
Message-ID: <20261113003533.3660311-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-7-ghahramani.navid@gmail.com> <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> The comments I sent for v1 still apply to v2 I think.

You are right. In my reply on the RFC I wrote that your points were
done in v2, and for the clock driver that was wrong. It still had its
own PLL code, direct MMIO and its own lock, and the resets were still
in drivers/clk.

> Please try to reuse the infrastructure in place for zx29. Ideally clk-
> zx279128s.c should be just static data and a minimalistic _probe function that
> invokes zx_clk_common_probe().

That is how the next version will do it, on v7.4-rc1, with static data
for the regmap clocks and pll-zx.c, a short probe that calls
zx_clk_common_probe() and the resets in a separate reset driver. My
question about the MFD and reset layout is in my reply to the cover
letter.

Best regards,
Navid
