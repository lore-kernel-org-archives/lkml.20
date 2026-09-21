Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701CD3B38BE;
	Mon, 21 Sep 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974944; cv=none; b=fCo7MxUU+9ijJkY3U60TGH/HIdvUp93lW4uqnKMfrOhnL6mWMtxyJ9VVG954avZ54I2SPX5tLTrsvAbYHQ+ul/gcyn0cV95IaUGf9LXzVlhofiA/d0NT5OKw1clzlv7tN5SfHyzWLA/him+z00aViLvCxE1EWH6O15rYmg35RmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974944; c=relaxed/simple;
	bh=n42GS2qz2TG4P+2jLT1tckNyXixO4jDqv1JvJnxOrBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vp6n/oyz3X6lPyJ0838r4ic6OStPi1EgqvqbH7xOpWvKhmgLmM1qYQf1p1eapIHsBnxyjUWNNDigw2o/D/AEl8o9R8skfgwr6qyDnrqx/UhtohbW4W7cEOQlzk2sWGETnop1K3YxbagLQWewTq2+JlzU0G/0dvTVsDOuKjoph+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 907B6200800;
	Mon, 21 Sep 2026 09:15:39 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 21 Sep 2026 09:15:35 +0200
Subject: [PATCH 3/3] media: synopsys: hdmirx: stop logging a missing signal
 at error level
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-hdmirx-fixes-v1-3-495be0beaf93@pengutronix.de>
References: <20260921-hdmirx-fixes-v1-0-495be0beaf93@pengutronix.de>
In-Reply-To: <20260921-hdmirx-fixes-v1-0-495be0beaf93@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789974939; l=1768;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=n42GS2qz2TG4P+2jLT1tckNyXixO4jDqv1JvJnxOrBU=;
 b=rauu3Rp3IPv9xWK0Cm5kEADs9yxRz2LSum4R1pNNTYl8HeLAaQLXi1F+FIX5abU7WXShDxJ5A
 ColLsj5kRttDlAgHEcwNeXKVFqYEU9ZWKBJ25cRgIjZUkvaht3bMwHs
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

hdmirx_query_dv_timings() refuses with -ENOLINK while the source is not
driving the connector's +5V line and with -ENOLCK while the receiver has
not locked, and prints both at v4l2_err level. Neither is a driver error.
They are the two states a receiver sits in whenever nothing is plugged
in, and the way userspace waits for a source is to poll until they clear,
so an application doing the expected thing fills the kernel log.

Both states are now reported through VIDIOC_ENUMINPUT as
V4L2_IN_ST_NO_POWER and V4L2_IN_ST_NO_SIGNAL, from the same two helpers,
so the prints no longer carry anything userspace cannot ask for. Drop
them to v4l2_dbg level 1, where the other non-error outcome of this
function, timings out of range, already is.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 75576a9366fd0..41f6112ec8123 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -502,12 +502,12 @@ static int hdmirx_query_dv_timings(struct file *file, void *priv,
 	int ret;
 
 	if (port_no_link(hdmirx_dev)) {
-		v4l2_err(v4l2_dev, "%s: port has no link\n", __func__);
+		v4l2_dbg(1, debug, v4l2_dev, "%s: port has no link\n", __func__);
 		return -ENOLINK;
 	}
 
 	if (signal_not_lock(hdmirx_dev)) {
-		v4l2_err(v4l2_dev, "%s: signal is not locked\n", __func__);
+		v4l2_dbg(1, debug, v4l2_dev, "%s: signal is not locked\n", __func__);
 		return -ENOLCK;
 	}
 

-- 
2.47.3

