Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739313;
	b=naYd4acSVMkYDzk2zp7nAfiHVI6+OHD6vRZv/BFSB4Kz1GMtjCtTgvQKtS1xS4o9vm4x
	 /YNL0ndEFPf8pEXJ9aU5mYvod4ooBBEzQnUdzSe8PR2XxuLRrVqA/81uxS3NPTTsrIJ00
	 Tgonj3yzUQAD14/9iNdCNQQkwfJamMGQu05ml20SLFkoaucO50sDektgvd8S+2SHZ4t/u
	 kou0Yx0mKW80ShbARiTvEW+WswRBNpoDh0Nx3qsB3tOCGs7JatYM4QpxpoXuhLMkQjqY2
	 1CHbsjwxQeCx15NwF0n7jTjoSrrIG5kr3kX1yuzbvUPwCxCWDHIfhePFn/VmoKpfiyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=44YdnT3FrvnSPbi/6PZhMIt12/MJQAk0jie83bLJIM8=;
	b=yn+lRB9P9au37dW8UqDuGBFMkm0FYAFPQ6q56RiWvZJuqzuyjGLDhfmePVRieeSBnezB
	 Vo/JFVtTdRsTn2fFP6pf2Tw0w4UY4QqMpMABWIwVeoq5J8UEZDyzpFWc+OCDEpnhvGHPs
	 dDCzGvhs00Pcw2oeFaeXzHDC2OHEcRD45aACOhp7Ah9p2GMkD6yz059nRtbr2BCT/KeDo
	 dKMv/bycaj2cLyoiZ1Mi+dA3ZIrmmoesvEvgnoCzUGxaNEPdvoC01zrE997wvSOtjEOWo
	 DqBIAWShCPs6CZVAhGAwy4i5fb/Djb0krtSN6sRYceUrCi1oBfpbAAmQegAu2eTNZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj9AgbR1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367F606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2367F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj9AgbR1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so29656445e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739310; x=1794344110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44YdnT3FrvnSPbi/6PZhMIt12/MJQAk0jie83bLJIM8=;
        b=Fj9AgbR1+I+QzR+o8I8/tdPP/AeAqQ1cMIaypOuhBUDR18vlFrlwBIWk1yiYfk1FIV
         C0Mvpmkuj62PNA8zbSZ6svX55oIXtJ/fNLCNf1iwq6jrTE1ZCukylpDxDksONO02CyV8
         EqnlQQdsU5FOtCy3waP9IkfR+wq5oE91+fSeLQ8FEaIZIfMhs2Dnx9Ciws5f8YVv02Ao
         8tzdQBUn77JNAxZrktoKn3kYJSLyA5Cpo5eaCDC9CEgC6CD8ScQ8GaRm0jGw8jEPtQUY
         1hp34aJo30vYwt4mmt8L6PlqVWlqCs+/sojow2vnFSJSm9fb3S2K4tu+/YysI7htSpn8
         BM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739310; x=1794344110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44YdnT3FrvnSPbi/6PZhMIt12/MJQAk0jie83bLJIM8=;
        b=L3HSth6OY4PN/58R6KYDqM0QvUU9cgTHxCQOYcGV1dw+o8golF2O4aAnVQ1WncMLgl
         dVMF8PKvcEQCC25aZh7FrwT4ZH7xtNK39VxYX5iDlCREQA4x7FSLmtpMSUi7z1qZzguS
         mZvlohw7rUAvdJcBWDVWgfwYTyEnnvETW4d+hFj88uQgWBzXIZ1xjm8ltei8ggxDp7m7
         xrW7xjlTwJ0QCtmMEEBqaBSonwHv4flj3NS9mczFOMsTueELMOv3IHMnsZFU4WNjvWkY
         hfZDwiayZb5jIMjEc+ndjGMxWL6soTFx92R6Gq8Ryygu8ywgkCQetSexEaH7TpaHVmXj
         cuug==
X-Forwarded-Encrypted: i=1; AKwUvBzJqJGIVHYeY2ZlIKNFiTmroLEiuUu3n2+xC8N66ANIdwhU0avT4toTo7p8qiUXv/QDmZrfWIZXenfi8hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z94BSigFJklclV8XEU/izflLGF6kVsehw7irj0+xrWHYP+23AIA
	Id+Nz7MF4HGWNHWOH8ui//UK/KtymUWVtpdZO3u8DO5pmB2YNJJVtcj/
X-Gm-Gg: AYBFou3HDLGz801Scyomv69SWLgEROpDR9cgTBQdym8NfC7vydSx2KoRA7AVdiNBV8e
	Jt+ywQmCc0+baGqdUIPxsfJtIrtfyOWbiJQGjl/qvFo8vZ80qScD4nZHh8rKo+VXs/EatRVOoTx
	eWGoO/1igiWjPRS6r7GXtmYXCHaC/jYOaKUQjRm61lUXB1mclPWsb0rDTn2+JNigAkZFVd2WLgd
	6OWzfM+6ha+7HhlHIqRLr7rZQInoaUwPAGxrF3myUZMUR8zD4N6hb4TcVWODNCY4hnpujRGE+Ki
	7I/I0ekmSCdBTqXRd5+MBovI5Fj/MSMqH3dKXLTkSGdWo01Q0tuij0dE+rHzb36XwJsGm/eRyoD
	+dXkzJNZGUXqw4DAmu5bTXQmeQlqctqeZ225+LtyOgE85hZZ5qwhRu72D8nVvA8Ify1ON3241mG
	exr0lT4Db+oXTJF1pFFGNv7wqTcNSHyMcR2F1sFls7ct2ehstk8vzA5BlGUnQ8Z4X8jtWlEY0if
	7Y6dxOO0rAQ9l9jr1/NQOl0CY6N5cpjUco+4UTsa+ZR0jpUpXmMZH/EwWJ37UkU0VHUJ63u6Xfp
	y0kDfPVHYeapQbdVOEUcx6SAT4aDUnWYpJ40EqOekT8BzfQwmwfaMhwAyTqbjG5okSF4XcSSFq+
	IBj7hz/Bl02XKbx7jM0a62g5h1FI+LFqlSQ==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr345099075e9.4.1793739310451;
        Tue, 03 Nov 2026 12:55:10 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b43457595asm1140405e9.4.2026.11.03.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:55:10 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Tue,  3 Nov 2026 21:54:18 +0100
Message-ID: <20261103205500.14974-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 222 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 198 insertions(+), 24 deletions(-)

-- 
2.55.0

