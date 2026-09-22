Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936A523BCED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038967; cv=none; b=Ju4aajz/Yjajdk2lf++N2TngiSCAkiPmQvSBXgUqUJ9kWtEAbtZfSuh7Jc/YHvnqTl3akWY9cxQDYGteKEGmiEEHzi2hd3W0jyp8kDw4hJLu1OxGlz5emFUHtkeQQOKndtZafzee/1rOQKCIk0YLolgK5TJdbDxQ7HDcfpH3OpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038967; c=relaxed/simple;
	bh=eLnNgO/rDS2qwwxL5yTUq+zocopo2r2OBj3hkKd83qc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GScrKElTTAdn6Np2He1SOMuiG7yHshbpm9GOJy4l4dlIZn4X8F2nyoBKy2y8W6ugLTfH8SBfh8HbAgSnA3PGJVMe3dbFk8KPoZWZy3iHOghAom2Sz51GhY6RMQ5x6IhDV1PVdC3eO2n1voMhN/uaniSEzvp0pQ6ZAtvLLLJqq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXRsCZwX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXRsCZwX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E99EC2BCB3;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038967;
	bh=eLnNgO/rDS2qwwxL5yTUq+zocopo2r2OBj3hkKd83qc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bXRsCZwXAI6qxmP+fWjsQcQnf343piN64Y2a6SLHz/60arpazhSZoENh713FHhKQ8
	 NOcb+RUXb9BoienHuUG1UtCms22rA/coJPNq4F4cXCdG6UuiXDKGdJmoUoSX8SDSyk
	 dWp426duJC9kLOiAacTmGIIxVzvy1xcDzQXP4G/X4No6EBIDmsuux7gf3D2BvvZoR9
	 FybunFPgtyjTMnGRHTV7CQMb4rwMqCQEzcS4vQZJMgXVhEQtvid0wGRVqB4eh8oe5X
	 MlIbRjDmu11QJeREXCmmODD0OPw64XqZU/FixL2O7Fc9jLX1QlVFV8HZTtFNP5ihG5
	 WDPZMRgBG8s3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD2DC982E6;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Subject: [PATCH 0/2] soc: xilinx: zynqmp_power: order callback state
 against probe
Date: Mon, 21 Sep 2026 21:02:32 -0400
Message-Id: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjTsWoC/yXMzQ6CMBAE4Fche3YN/YlEX8VwaMsqNaHUraJAe
 HdbPH6TmVkhEXtKcKlWYJp88mPIEIcKXG/CndB32SBrearPUuBgcZnDc4gYxw8xKt0ZoRqplRa
 QV5Hp5r/747X9O73tg9yr3JSGNYnQsgmuL9HOqTkqZKdh236nOJXRkwAAAA==
X-Change-ID: 20260921-mb-zynqmp-power-34da13724341
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038966; l=1347;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=eLnNgO/rDS2qwwxL5yTUq+zocopo2r2OBj3hkKd83qc=;
 b=q8wOvkA78pAcCFPujvVLwMILLMubgB/JO4Yfq1mjtANaMC4ZsHUSNsbkRpbm0mTwRLTxEnb4D
 j+OoJd891a/BIFw199Mgl2/xgfz3jWLpGFGZ0Cx7iLoMLtZon4Ws5jB
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

zynqmp_pm_probe() registers the event manager callbacks and the mailbox rx
callback before it has finished storing the state those callbacks read.

The first patch closes a real window. mbox_request_channel_byname() starts
the channel before it returns, so a message the firmware already has pending
is delivered while rx_chan is still NULL and the IPI is never acknowledged.
The mailbox API gives the callback no way to reach the channel from its
struct mbox_client, so the channel is stored under a spinlock shared with the
callback and the acknowledgement is deferred until probe has published it.

The second orders the two work-struct pointers that the event manager and
mailbox callbacks dereference as soon as they run.

Found with MBCheck, a static herd7-based memory consistency checker.
Compile-tested on arm64 with W=1, no new warnings.

---
Jaidev Shastri (2):
      soc: xilinx: zynqmp_power: do not use rx_chan before probe has stored it
      soc: xilinx: zynqmp_power: publish the callback work pointers

 drivers/soc/xilinx/zynqmp_power.c | 113 +++++++++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 32 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-zynqmp-power-34da13724341

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


