Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774012;
	b=wZKuB3Me3rH4BPLrYR8eE6lrJ/ezg3uWsawQ0+kiSZiPVR5/ESR7kvutP7v1JbPoQZYl
	 r4UzSWXdmEtVJpBXuiX15xGDv9TGn9N9yfBzyHtegBquJjOt1mVRjCutmlyQY6r9GqicC
	 JYsS1gKodIQmCnXulzNZ/Y+EHG4Xz9nV1H+n/A0Z1V82eQuEvjVFiEvje1S5+kNrbNnIb
	 wJTiBrPGUJ0OUr1LxLUY3kLlq9gwD/faQTcd0/vQAVKHZGf8R1llNkWM8hCUgZlU1H+4D
	 zMe/kGY07qQxHnZsbtbyVSFM0Dqz/wd82vrQuNatOOxksI1luEAtuEaav/NFdL4LQoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774012;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q3II3/Tdh8zQmzEdIVIplsMEx+AqgJfOmvxzMZ3hbl4=;
	b=NhYEJJVXfiqIjc9bQ1wMmKf4YaXhTSGdhVLAdSDjgTR/gf7iyd6IVCeZ9yni3GjtduXI
	 gJo4yAROPMS1tNJD13/RzUPPfK1lugxeaZYIkA4+aS0wPyop8ArUmX8Ah7u1ypditwS3b
	 zPcjo6Dp2jqzWCHsSX+cCbSnyuXKtxZrH39wwEdybqe6Phm/KOvMlJmGJO3GEwobMj4I3
	 9yzLXFvRWMUt4M5tDTBtOS3tB1HDkYTuD0hPDGG6/8NI8iTW/OYzDV+/clpJdJnPpsC7Y
	 hlSdSyhnkDdba40Iv5IRdcsk140uCqWRIxeQFrQN29+9My5g0EgpfK0cms2C2NIrBkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0fqenaX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2A606A337;
	Sun, 15 Nov 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0fqenaX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774011;
	b=HyAAPKHp/AWmiHE6GYxYqmbqa1jEa3dZujvstO5pKayeFaxSAR5If+oWmtjy07KYc/om
	 IGYWwLWc58ypP1p8YEVrWK3jAAGnU8fXACGX/EccEUApmQ90n1KuPmQcMpHuouF6Xlb5t
	 3Yc9PjVc916KVgDtv7KuZ6hn4oZXwV7FG6MkBz76DZiEdPbLhdRwLV0mUDqZ15WozlISR
	 jIqUMLknnp7toAnvXDhECVgXShHG/WakoB4opYeZF3kgzVi0Afs2eNGIUhXIr807Uu6N4
	 77QWVaQ936Neg9m/gmqXreePOq2+s8IxcfzNW1kjiVmqYUikXQuXZvJD23CjALEnx2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774011;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q3II3/Tdh8zQmzEdIVIplsMEx+AqgJfOmvxzMZ3hbl4=;
	b=yC8HBkkPL5Qif3ntgTJrxwVPKJw71fYp3zxpj7ARQdigQG3eD3PNHPF3I5VNN+qedU+w
	 4LbNAk0dlCx7byXNXNEMqYZo/TQR/CJvo4K9Q6kkyTv6trZ8CerBa4u9+cz6jA3ewxNHL
	 aowD9F/63qOFMKxGxD7zGeHarlwYQVj0KjQGjDzL+LsMrDFO5URXBgY4IMBwRR35U2iDW
	 d4ZS4rfDxReDJeSBhoLf9kA8nUIZBO8YgVeHgaRKtpXB2iLWNx2YDk/x9CQNZZmcQ35Pm
	 CD26tUXB24KrWCEUjmPMvs7Y9JHzmbpsj3b8KSxgL5W+yaQS7HJ1535Totd62pcx7SQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C39231F000C6;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774011;
	bh=q3II3/Tdh8zQmzEdIVIplsMEx+AqgJfOmvxzMZ3hbl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=e0fqenaXbAQPPZaWQpr+CSmdqHyKTVauq+cggygGYFzBzmK5AB24ps+JqUhPmy8Rv
	 6Zt9yvYMpZS42ziXHsbf2o6Oi6sqpKosmTqFPVlDF0oE1ijvL2ZvXFU1N6hS1Mpb3C
	 /rZkhfgki+ACVixAI+vDtPusAjZ506bjZvHI/5OFLNIWPLyviLnvXqpK91yD+ChrnS
	 kH2xiN+O5QXWqggO+2SKfhNwo56FUVwoFiPqaMMufEjOUTrWlAyIDCaWn69LFFZ+Y/
	 4dqnxT1y7Bi9eBqNnK3tM01/D+GXUX6AiSK2bQrePxUsxATVeIbX78S1M5Knsp/6je
	 nXpV2fxWmDcyw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 550A34A1AB;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:10 +0530
Subject: [PATCH 02/11] soc: qcom: socinfo: Add SM8845 SoC ID
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
Message-Id: <20261116-molokai-soc-v1-2-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=723;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=DgBdet3QcKHQL63BL9Z8vJtIwtwq2bjCyRVpFlDaj6M=;
 b=VbEiZcCcv6P+GCR4vrEXyOwUDhuUSd31Sj24tEABhjF/g/V0kWkOcZaDP7iCpGIu0oZSB8XQI
 7t/ocFYGbYyDKHCEt7HJfqIMuwak8/NAqzx759qeVbBgTLOzChb1ouE
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the SoC ID for SM8845, a variant of SM8850 (Kaanapali).

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18105ddcf04d..718d1fa7e830 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -541,6 +541,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SM8845) },
 	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },

-- 
2.56.0


