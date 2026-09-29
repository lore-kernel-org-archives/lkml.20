Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321683ACEFF;
	Tue, 29 Sep 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670280; cv=none; b=o2bYicSWOTdlFl5L73hQIWVQYwLVaxZT4h3nAcF6gF8pVpKnZKyKNbU4JPa2RX55o/FoE76/02gSiq1n7icC1d1bAdqBiZVvgT4sBCAeAdhgxk47ZfGNCIjRHN5+bdrFV9cS1+2UpypaVvyb5s1ttTO6tK7CkKQl488qWwRR4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670280; c=relaxed/simple;
	bh=DSjqS1GfPRbk667G7+Zbmx6tEavD40Uv6BKwPB8amig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AzDHuPFB53RxpbYH2r6xvnw4IZiWR/sGGjBCU3ga2h6jWsdEfCD+4iV5PEwvZAy1zCV9NfBLSfVoMEefVeh9ZM88CpD7yu0z6/HM/hZ0cZ1NoVxFW80Xj+ME57ayfNHaHJNW5+JmZjpTIHmv0b0ztMoUngz046GXz6uG6vIO4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7WHQKZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7WHQKZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B207BC2BCF6;
	Tue, 29 Sep 2026 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790670279;
	bh=DSjqS1GfPRbk667G7+Zbmx6tEavD40Uv6BKwPB8amig=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G7WHQKZQmu3wVw3SS2S4XlczqSrYRfl4fm+bRHZ6uSMR/5vQfD5t/e5ZmEkj8GYp+
	 rfjBzrHLzHEPz+G/QIfO9zK0Dk/p24ousQcWOes8lh8UP5wh3wl/QpE+JYHt/A3ewH
	 XtUgXqFbS7eHJS8uD5x6TlxvY+CE8zWUxAhNdKksD4tplEHZT7Pcu6afy6tNtF0UHQ
	 25MdeTwqE5+MmYyx9JTOGS/xY4+HGpJKcsMsNFySmzFJ1uZznNzNO/JfO+c+quERQ8
	 Kg3j33+17hcsSJRDMmM31hoYCHMkCOD9oCkVh/8nLvKDZe1c+wiCbePCAOwvOyf4+W
	 fs+u/atg5V7qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E29CA5FA5;
	Tue, 29 Sep 2026 08:24:39 +0000 (UTC)
From: Shuming Fan via B4 Relay <devnull+shumingf.realtek.com@kernel.org>
Date: Tue, 29 Sep 2026 16:24:06 +0800
Subject: [PATCH v3] soundwire: intel_auxdevice: add rt766/rt767 codec to
 wake_capable_list
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rt766-wake-v3-1-09c0b82c72a6@realtek.com>
X-B4-Tracking: v=1; b=H4sIAKV1u2oC/22Nyw6CMBBFf4XM2hpok6F15X8YFn2MUlFq2lo1h
 H8XcOvyJOeeO0Gi6CnBoZogUvHJh3EBsavA9nq8EPNuYeA1x1pxxWJuEdlLD8QcSmecwlYoAcv
 gEens31vs1P04Pc2VbF4Lq9H7lEP8bG9FrN7fcBGsYRJb1zhpZKP5MZK+ZRr2Ntyhm+f5C7YBJ
 HK4AAAA
X-Change-ID: 20260929-rt766-wake-d68dbd967393
To: vkoul@kernel.org
Cc: flove@realtek.com, oder_chiou@realtek.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, jack.yu@realtek.com, derek.fang@realtek.com, 
 Shuming Fan <shumingf@realtek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790670278; l=1046;
 i=shumingf@realtek.com; s=20260924; h=from:subject:message-id;
 bh=CuWXA0osMnyNhJR4bA+pYYv+p0CVTA4+P+MOPg7CqKE=;
 b=jACE0ZSkVju5HVgsQDQUKvR/DEXCCQziF3kLiEEmLhLqp2yUduvmFVauLnRsZDFigP15+U5jF
 TFulc/IHDM+Cn8E6M+q5F/eV5Fg7zVVVhNCM7OSZbzHCCQHDeqnvib2
X-Developer-Key: i=shumingf@realtek.com; a=ed25519;
 pk=ZM8Pg7tEJ0SDXQeBw6SfvcYyqXU9nF88DuTyxzf9utE=
X-Endpoint-Received: by B4 Relay for shumingf@realtek.com/20260924 with
 auth_id=1053
X-Original-From: Shuming Fan <shumingf@realtek.com>
Reply-To: shumingf@realtek.com

From: Shuming Fan <shumingf@realtek.com>

rt766/rt767 have wake capability. Add it to the wake_capable_list.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://patch.msgid.link/20260929-rt766-wake-v3-1-867d1d8b81a2@realtek.com
---
 drivers/soundwire/intel_auxdevice.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 901a71262094..24fff33a9093 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -73,6 +73,8 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x717},
 	{0x025d, 0x721},
 	{0x025d, 0x722},
+	{0x025d, 0x766},
+	{0x025d, 0x767},
 	{0x04b3, 0x9356},
 	{0x0102, 0x5572},
 	{0x0102, 0x5682},

---
base-commit: 90b63b309fd6c0f192337659e73e3047a67df99f
change-id: 20260929-rt766-wake-d68dbd967393

Best regards,
--  
Shuming Fan <shumingf@realtek.com>


