Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E774746BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986345; cv=none; b=bdzpJ8c5JTA2u1OjsZyy4gbRlvXR7XyEY9oIEMUlNNqQ5ijeojsfe1B8qvX9oDnO4i+EMBpvsMPxyPPsE/Ljv0HoO3Z3YmoTyyKmKWcyJM07r2B2TafCuXVIfG22vKx4fJ6hVW6xJuZ+gVZOw1sfK7dDSEguHwACgeWNEFOX8QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986345; c=relaxed/simple;
	bh=1aaWeunmdxLEF+OUt09oPIltpF+Nxc0zKIMezFJWPBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+umwCTdx7Z6aBvH/orTELuiR0cBsEeTCMyyObw5AYLUJAuhZq73yBunAHnPhxlVOgADBQVJUsNIClfL2+cvyWRmBXSjtKmJpHR0RH48VdMdbElUMt+tmvsTEhcXRYGfwewao/6+1cr4bOlhcRVH+HexdIFaP+iyH/PfOQGGSFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMdN19M2; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMdN19M2"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a0so3049112b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986343; x=1790591143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=dMdN19M2ytLdg8u40MfyI4omxTam6rciRth6MVIFCvP4SjCvKcaGJCwTZrHEA1siTG
         Ldp0ZHCl/ze+KNj8HFLOj2QmvYOHAUNWs5sPAyFnjt3U3lL761mwbltow+CSWKD9EsXJ
         Cg4kRr1QKjP0pxyTuKGQvcACgeWKvzMHNevG7ilKWAse08oyTorxeuGcD6Zpw53CAter
         nI1kfA2OawpDUUzWsZo1QqsKcuPqxUQH2IihftAYtOqS6mvvFPi2E1g2aipVXgClbzzi
         bhqicSTB4/jrVfPFemWKBP9dQPlTOSAmwfYMoA7a6bzCHWxHP+n7vjpkSQUffnCO/pBp
         v7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986343; x=1790591143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1J2ZuX47pvRKc6yxdNr+hnj5FMRU4oVdsCq83VAYAo=;
        b=QrkZPHSkg3eUTFcO1XYh50zJQr3qAlDOqTfURSeB1WiJJA1zs/3DhK86Z0uI7oeRBF
         bOZnHSKw021lQCk0f4wblMM4RIBE03ANnX5MKyjDJdhISBt+NoON32C+y2v3uS2z1CFR
         8Af5gE7NM6liRWee8hev62qSuUte92HFEebp0HWSJXnUAXUqechdHVyrXab5hGByPUZQ
         LM5oHXVFYD3zHNZEbhIHKYIC6mLnzXSaQrXpZV4IA7myrY/o8LJFqNhR6ZPzZUVK9kc0
         wNdK8Zl20L/lkinlA9rTplY4IlVvepVPC+e4qgfQB3rMyHw9gtVHjKurimsR+cR+Jm4H
         133w==
X-Forwarded-Encrypted: i=1; AKwUvBxFLLZLwaKXRASSYdyZ2v8J7S24855qJQ3zn5wwuwUjog0DslbwbUxKHeV8EqU4CgixGrho9pdQi9qmMpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n1IDZSmGTOkU8aMLsDkGImAyFXjhfsJtiqYkPwR9WOSlb62VS3
	LsXl/X/R33k06LrVMYeMC0OVnr3QqEzwJc6mC9RgfqaOB6ljllq1XU2X
X-Gm-Gg: AYBFou0Mbgj97Ej0ZIsqgY903UZbzxEOZxA/LFGTcyYequpPtKXwprm8TEU29NrBWYr
	KkwfqSY9xI2gSJLQ94o3+1kYsuaDhnRn+lvDc0gxtHta5AcWz0HebSkhW+p/j8PExIj83Fwo/qp
	vlFX0qz17k9GIvFhkW6TDnqk7kiWtR88nYliaufbhJbYYjbqgRO7NIBuL4LZmHeXeVqGVzQhcwP
	D9GFQxlKXGeEpcPGFWVsF0ZEX6UgXX7gxUl54amQNVjiNHgne8tYYIjFQVemcd8qaLaOTutB1VY
	al7aGlcWI0MXOwnMrvfbLmuqdYaZWWpdoLgGbYbdYvgi6woDjwzOS4VzhFxrX5ZfMPGo2M+e2cB
	VQhdqdqNAoRvsulWj1rlwvG0KaYXtRMb4ywi6sMOqScDCwTz7lvXLIJjHy/JbulrvbmCFEBuVrv
	qtzsDQ+4fLeF7MtEcgLZmrTIsI3DRbYEwLBHhsivFrJunVsGQihnsCcNaUU0hJSjuQNKxP0Qf4P
	iSMawV3xenOLeih09iYk+9TH6k4jypPRU8B+eo=
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-874dddfe1ffmr14902028b3a.25.1789986343595;
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:43 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 5/6] clk: mediatek: Reserve missing MT8196 MDP clock IDs
Date: Mon, 21 Sep 2026 19:25:21 +0900
Message-ID: <20260921102522.1640072-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve the binding-defined CLK_MDP_SMI0_SMI and
CLK_MDP1_SMI0_SMI IDs with dummy clocks in the MT8196 MDP
clock providers.

These clocks are not implemented by the current MDP clock
driver and have no known consumers. Keeping the slots occupied
preserves the binding-defined ID space and prevents out-of-bounds
accesses in the descriptor-based onecell data.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-mdpsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
index 7667d88f0eb0..2d8997d34201 100644
--- a/drivers/clk/mediatek/clk-mt8196-mdpsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
@@ -66,6 +66,7 @@ static const struct mtk_gate mdp1_clks[] = {
 	/* MDP1-0 */
 	GATE_MDP0(CLK_MDP1_MDP_MUTEX0, "mdp1_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP1_SMI0, "mdp1_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP1_SMI0_SMI, "mdp1_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP1_APB_BUS, "mdp1_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA0, "mdp1_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP1_MDP_RDMA1, "mdp1_mdp_rdma1", "mdp", 4),
@@ -118,6 +119,7 @@ static const struct mtk_gate mdp_clks[] = {
 	/* MDP0 */
 	GATE_MDP0(CLK_MDP_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp", 0),
 	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp", 1),
+	GATE_DUMMY(CLK_MDP_SMI0_SMI, "mdp_smi0_smi_dummy"),
 	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp", 2),
 	GATE_MDP0(CLK_MDP_MDP_RDMA0, "mdp_mdp_rdma0", "mdp", 3),
 	GATE_MDP0(CLK_MDP_MDP_RDMA1, "mdp_mdp_rdma1", "mdp", 4),
-- 
2.55.0

