Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202867;
	b=WnwlnpMYGA2GYVlJo2zwH3SpuHB/t6cHnuz8gIOiHYB9crM12ygrRUqpy9AQC3euG2wf
	 Hh6zSPjSMiqY33a638LlQ3QdFksmobXM0rougnZl9bUU5RIenHkBrwM47j1znTWvon5cb
	 kDS0UL3Ve6dK9j15Q0/OIqlVw6Grxj7dES+T2/LObBxvDzSUoM149BZxtRPABNGKrUO3c
	 jFGnQVv48tmrPBzq4jU0sPa1AAZH55KjdjCNMACdfze4fttKnOxxFcPXx1gG2i/9sCRJz
	 mubNH6fKVJ8qaMn3UhCvoZ24sPTfu2Fm4HFmbe6vzUbVeS0hd/YkASOlwsKJzm05+Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ccajBfB1DRQJx0jrMEZz3XqV1UkUklVx5XXr8c2Z960=;
	b=RVEQNAVfdeyWHMx2K4e38pPI4hyu0fEESWM8rGO5/4kRVreqPHGhirzq2NegQG1ey9uv
	 G8iEWQ9pBn67f3mtsvIJN5BVBH8ecwi/nYHhl6LDFZfSHMGd8xHoeKF4rhlq+K1pJ66LX
	 nTRQr7Ieo4kjmWNJbubJZXriEFcbocZqixo2fCxFNBWlWMAv9e8VevZM5iC0uJN1gCYbS
	 2ngoSH7aSy69t9YaYhyGgkrNsFRpgNrMWB5rx9tq9mzl1hh+6V5mJ6mMZXt0v3AeM5rSC
	 heTUiWvx9v65nfDY8SFa2LatlhMI6tPb+/o7l6c+TrM7OyDW5L+rRbNF/9SO96metzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GkTDrLIs;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B7606A335
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2B7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GkTDrLIs
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10336035e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202853; x=1793807653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccajBfB1DRQJx0jrMEZz3XqV1UkUklVx5XXr8c2Z960=;
        b=GkTDrLIsrm1vtvQLBsXeNrwfCa3oJVly33MOEkh+K9cKm/r1BqduL9IJs5nJCOwLBS
         7WcwizkEQ3VynNSnJnAEP8q4O7SWxFpkBVzMW7Akb5C6oM3Sm3tnH1/zwTmmQ/uaolR3
         1Ydtbvxoyig0vZiwZwfNuy4UZ8mY0+urDngIaLsVGXxWs2br7VubefsYe2sJmzjPBzR/
         m5tEaMRyCegh54VaMe4X8UeMlBNWOPvIzwuzlvhsgIUirqcD6Tl0EMBpnrjWHoU8tFyh
         OsRBpO5I8XmuVcea6sQKYtZR5M6RznNM9dXylb8ER4djsM6F1THF/ODKZEF53U1/wIYa
         3SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202853; x=1793807653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccajBfB1DRQJx0jrMEZz3XqV1UkUklVx5XXr8c2Z960=;
        b=xjW2kjGTgkE3Ed9zt51Fvk+ozBQcORB6GD4Jlzt8xVw9Sm4USrBKBTzKqvdRQH75hg
         kNP+GDzNDLGJwczt2x7U/k9XiV4vqi5DxZsOef/SXLKH702rWFPW73nEjoK9ZHRigjUj
         0rBt9Id1UtEcIRicl3SKk1puBdvRTPK0vCbwcGjrzBB6wzFykqkfdyweXBwfbdEWA/0q
         97W4IkSxHqSYZlBFMY+2fuEtTQIPgTJLpWngpTXWV1blbY7EPyGCFwLUm5+EX0657vh6
         r1Cz/D4hfpqGXj73rgLnun62/F8ZyzYtJ+CdX6NL9kMElhbcllR1JoqKxD4jIA7Bw94f
         TF9A==
X-Forwarded-Encrypted: i=1; AKwUvByOwujnQChPFG7H7HTuSquucY2KMxILfUGGqvdcI5k/ST2K0sM8XH20kkjGTxybhBt0uxqfOo4YWObVpjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRpDnhDQEL4wu+JCuSy6aGDOGxeNjNWU0Yvp2ohk3DvvPNpxVU
	wBVDhqejAvMcbGA248lKHxHKzhnH07+i0tjw94pc0vj0NaeM/V5TJmbT2mP7d3mp14A=
X-Gm-Gg: AYBFou0S5ZMpMyHIpCwTwzVzE/VJMYaU7Hm6a8fti6ZEkjVMTEhWQqzc+qdi/0KRALz
	2PSyMUfCwUsscGa7fOygCB87RNBzRLXW2tWO6RdwOr+RcKNT2LO/jBYn/sDRsq0g7lZOdPxNKM/
	LnVVSLnN5OGWn+UoGjWwxIt0c4Tq8NU1VLYBXqRJPAxiX45KeLz0RGg4JQY68F97lZbq/khLMXR
	B+9TCncq0E7hlUqQd3GkhhZqnTaqwgG4/Usa7zFwRquvwvH28EC6qjbFRu6cthOW6xg2fJToNXA
	NzBPrcMAavtAydCFRhm0pjLMEqUNM9o/5i3fqiCKcTmLDrCzly8klfjoraWaIZ0uHoBZ9dCh2dC
	xmyHJUzbOCfFPFw6crAQF9dwD7eHXHkF+7J/S4gP/KD8U2rT8uVd74meFT5maQXNgJuSo7TVBOM
	9u32wPwgJMY+kdKK+XD83ikBoEZfbWvNqJAJgFoQU4rIAJaO6BD9yLGh/+ndE/5GguOKCqDuif5
	Gv1WIT09XPDzoTLT1b2dWuBKpVG8L5ypWhq3pegkEUK+QeT3vNVlSnf4NMa3h27noYdoiqYepqc
	tfcX0tU+43AYHHc6mG5qF3ZqcQsFL95oswBoaM+D8u0Y1+KNfrtRbwwW3y9WrCaYpCNBVdr764v
	L1QY/Rw054cE7Wpq6oldv9zd9Kg==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4a9678c28ffmr61407455e9.22.1793202852789;
        Wed, 28 Oct 2026 08:54:12 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:12 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 16:53:51 +0100
Subject: [PATCH v2 3/4] clk: ti: fapll: print clock name that fails to
 register
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-3-dc6bf0fabae4@linaro.org>
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=826;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Slbv+1YP2F1a+aBq2BJ9DLP7Wji77v+hSEpGjiXeytg=;
 b=O5OWEnIaLu4SaaALVpToqLuve4ADF6Pi4kM+qtBiKp67uCZLvnY7K6PnWC1gqUsH3oIg/uxU3
 Ariczt9c58VAr4RVCBk7U4KvTD2dOQs6lR0U7IniniqERExBUAerwfS
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Improve the error message when a clock fails to register by including
the clock's name and its parent's name for better debugging.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index 8ab9acd57b60..d360e9d986c3 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -520,7 +520,7 @@ static struct clk * __init ti_fapll_synth_setup(struct fapll_data *fd,
 
 	clk = clk_register(NULL, &synth->hw);
 	if (IS_ERR(clk)) {
-		pr_err("failed to register clock\n");
+		pr_err("failed to register clock '%s' for parent '%s'\n", name, parent);
 		goto free;
 	}
 

-- 
2.56.0

