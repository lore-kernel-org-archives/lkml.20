Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319440;
	b=kuPuPmc2p4gK0cXmELbib10YRG3d/Cu5jT5ttHZQB3D5JqrhFnDRnGZyfq5uazZvZAgd
	 RgKxcYPH0YZ3muhXddjiS+vYUM2iNLQ9WY4zMqRQR1TheCx0e9oPdFeluVL4PSd6ioi/J
	 06LSpSX/SRTmEoz0CLAoWcBIbgzXr1bj01ki64srf/9cn59mk/A3f2nXW+uBYnTrznupa
	 BQ+neHN1dnagmrkIxrT86SZ7gBGzqmWupnvVE/JXLSI1bq1MPoA2Mqp61D/BqbWph6X/n
	 PQKrNLAIIZ4uk5xdBE3ovdpPjlC9Am5LRXrFA/ZELlojJ3dWSiRWHbWD5ESBwVTNsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319440;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tUbt2oKwHuUhiavo123mCwWhLARFHr+XDlWR6pZ0yB8=;
	b=QA39qBzcL0X3hVBGpSwAQPZQ3jsubz028BhiniFQCRlLi1hn2mSc1f+d1AhcmoJ++5ys
	 ZT7KVZuuS7/WJ4N4X+F3B6h4Bfi/OfWkGxJhiYT1DH3hFUewtlQZjJA1ykPhA4vJA2Pmj
	 3cfCaCCphQk46o6TV3zyfUWdaRXihVNpk1ldt/rcXfVNo3B99SNv5pa1SL+bv2q8Za88e
	 EYY4yHcQFO9X2BepzIPN2wruqWAsyj5nHz8gZfR4JKpCzGPtu2vPba0lSGKnFkY8CgnJT
	 zFs17ElUd+MXVDQO3fB5Ke4jFd5RV4mj0FtLPRLUWUuiGvoNgRUCxql7f1LoGcHN0kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNNdUIYt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D260A263D;
	Tue, 10 Nov 2026 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNNdUIYt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9DC1F008A5;
	Tue, 10 Nov 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794319439;
	bh=tUbt2oKwHuUhiavo123mCwWhLARFHr+XDlWR6pZ0yB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KNNdUIYtU+9rUIqFDWQ7xx8lLaNzt01wCOs/mDKhXkaTks/SOqjOJ28Hly0i+4aB/
	 fSkn2jEwKVjWL7tDLL5ZpWd3FQEHrzm3OK8jO5/96S6YnTXLyTLkKECwuEHivFA9KB
	 pFJZuVHVPJ6Q0cYlY3u6ONmFr+7xhcktTBRuN34azMXaOCfKia1rjjeRNBch3tEZTf
	 CeRQXkPlEDPnqXR/S4DSfvchIfy9eiypsw/NdJ1YBL8le297Vq3U0LfA8iQBELoJXZ
	 cUWSo/RMtRn0ydqWMgp36wfOY1qCggH04UCxFeJ2Z+6PWhUB0wh7DXj/RYXD3+fw9K
	 NdFhgr/Pd2/og==
From: Joshua Crofts <crofts@kernel.org>
Date: Tue, 10 Nov 2026 15:03:48 +0100
Subject: [PATCH 2/4] media: i2c: tc358746: remove redundant
 pm_runtime_dont_use_autosuspend() calls
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
Message-Id: <20261110-media-remove-dont-use-autosuspend-v1-2-cc07e71b30f9@kernel.org>
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Heidelberg <david@ixit.cz>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319431; l=1133;
 i=crofts@kernel.org; s=20260422; h=from:subject:message-id;
 bh=ba/J6qb/bhUHaS/o2NWicS9Z5dHclYOMh5j4Ggu8F6w=;
 b=HI3j/jMcnI7IW0q9kjSsIPqMIAGgQ2T+thbTlUPM1y8RDHYHZH7zWAGoZy2/Kk5JCMdRwvfG7
 tnD8UVDOk1lDjZIF/jbO1TbsvXlA1yITrliSkQ7C8dr2xZJvYXoohor
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=Xd+UVoRPiiI0K3LHQ2XIcXmO0jvVuFTv9eTx3lgBphI=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/media/i2c/tc358746.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 91d26a6340230186239b7586e73345fb755c5164..d123a530bb879d31111e971c702bb6f96794a8e2 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1596,7 +1596,6 @@ static int tc358746_probe(struct i2c_client *client)
 err_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	v4l2_ctrl_handler_free(&tc358746->ctrl_hdl);
 err_fwnode:
 	v4l2_fwnode_endpoint_free(&tc358746->csi_vep);
@@ -1622,7 +1621,6 @@ static void tc358746_remove(struct i2c_client *client)
 
 	pm_runtime_disable(sd->dev);
 	pm_runtime_set_suspended(sd->dev);
-	pm_runtime_dont_use_autosuspend(sd->dev);
 }
 
 /*

-- 
2.47.3

