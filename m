Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F99535FD3;
	Tue, 22 Sep 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073403; cv=none; b=VbajYtAezCaROtyAcKq3dPaE3kEpEyd3zOeG7wKZLvn00DaKPU3Chsb5P02b8kmN06cXJvn4dnbRZtsqTVtSsXGBjqSHwk3+vlBNYWql+xrR9X/84VA0CgdBvfD/hQBbCxgc1/8ZVXo2R+FPGKmudaUtYa/yh+ox4jANbSuQ5iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073403; c=relaxed/simple;
	bh=CAcQ7Xu/9h2GhGu0CNLrvi0qn4QCtyqsChF0NqMeacA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kw2iiwnvcr5FPAlgt5OtYDsvKNJmvrEYWZLX/0QA1Ge1rUkSyESjtFR9sITiphbjH7WbBhRgzn52no4e5GcxCYRtWwf1SR0SjbwXiPY0lVM0aIR/0NSkAF4dp8KYU8u7UdyscHKjgxRo9PlkJ3cZMqZWEdFdQN8r+2Ii5twyn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPodaoxz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPodaoxz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5A3EC2BCFD;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790073402;
	bh=CAcQ7Xu/9h2GhGu0CNLrvi0qn4QCtyqsChF0NqMeacA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NPodaoxzxRXR6b2AcmJyZgKYIexfnraLBtwb5gjBjdNRQWB2OSrBRG2TVcmtkr1lL
	 +guNf2M/1iLm7UJ+h4ku7A/Z/IxyQixTP1t16xKjASsMg4uIuYtSVBf5jO+PRStT2l
	 TuhDxS52xZkC5IaGoo1DtvXIhSGI0RHpdDEWm2iwZJ1BLo4xGDdJYISt7x+mDsaBCG
	 GUYT/S8stqrspXiTeY05C0Okq8jT2bMex4nJy8Mr5waoeszHU9zDVlHYzEiiKudGhM
	 Imt4Jn3j9gkLnwqD33dYxAb3fkDuLbKQgMMb9SC9tu4y9ZMuc5mx+LiyVLs2X7GvAm
	 YmbjHxV3QBbZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCBCC98306;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 22 Sep 2026 13:36:42 +0300
Subject: [PATCH v2 3/3] usb: mtu3: add mt6595 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-6595-mtu3-v2-3-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
In-Reply-To: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073400; l=1072;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=4eJyqPWqICB49dnoynS9NuK90SAls5nCrv8lul+jrkc=;
 b=Helez+SfQi3Bl9XUgDSgIs6bK/Q8s1SERu7FfzNpipN1fTm5JbN+e/p2DW1N4YCQxBU6QAvLF
 bUsvlsZF7C1AOI7Pt16x3Jnu6rV9DVeqZu7UaFCjIsZEtes+b9bv0yi
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
quirk for single FIFO slot.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index bb67da4704b2..9d633695a9be 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,11 +611,16 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt6595_platform_data = {
+	.fifo_single_slot = true,
+};
+
 static const struct mtu3_platform_data mt8173_platform_data = {
 	.fifo_single_slot = false,
 };
 
 static const struct of_device_id mtu3_of_match[] = {
+	{ .compatible = "mediatek,mt6595-mtu3", .data = &mt6595_platform_data },
 	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
 	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},

-- 
2.55.0


