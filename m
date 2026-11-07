Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049601;
	b=fhMXQLGTFgN5qCI7mSP6eUrg1Rn+D13jMiw49QXJ32oJ2em9O38orsiczTW05ZWQeX2I
	 Lh+uTtt1hgp9VhGdLbnGYsPJndH6gv5/dQDJF+5YXQO55kTftyIQXnSKa8u29MRyvirGi
	 tAnqpRT+aZtWee8n2QMNccFlNebW9izTIY8hsYdgHYhKfOkTqy8WmaFBaKzbXTGqqm1F0
	 6kOkZbQxnwt3TuI00flgzb7Rn4o5EMfnQFUvVR+M91OMeWxDZNvect6vxEVP1sd4VCvj/
	 7p6vUNLeQSAZNk4iec4UjrLLNMw+5f2BpwJIunwfDfjcHRmUyRd3UhrY3c/eR2rtr2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049601;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FjuJWkrZH0f/93HtgSWbOiGLuc0TDPxk1c11VoJaz0M=;
	b=TvlRs80HLYdFZjXr9A1xD+HTFVP5wHNXCb1D92F4r3m/AyK6BRZ6cJQPdpJAdhLRTDYa
	 J+bUlQSoyg2m8GKoJTUc1eQWWU0rzcYZVS44HD6XIgb0rz7WygcCYIvbFWzYBoaKeGcgM
	 8e129ZD16WViQDtqMu23dgPARS0uctxFJz+Fq6S9M9xAItqtqaxtsnflrfU+wTzZxflTv
	 F+5PvK4+IwsdHBoyVr9yWNIEAucNxrpZrD2udEyHQ3APxP7NP+kUZkI4JGLTaiaD8AVVf
	 4Sun0SRml0rVsKZXSN21MVVsblkONlaOdDgqOsLNfjipvyOBPDuMAgKyZgQbwASgk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjIAgFWl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222F606A33D;
	Sat,  7 Nov 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjIAgFWl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65B61F008A2;
	Sat,  7 Nov 2026 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049601;
	bh=FjuJWkrZH0f/93HtgSWbOiGLuc0TDPxk1c11VoJaz0M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GjIAgFWlWLnzHy+ut+FAq7JUrjxdUNHEGHcNRb2duzcenpU9WuXz3kxzErhlxR/Xe
	 QXlAREly0RY7ON7zd4X71/FFtwvweecWd9FeYuW2jw1ZEvOw+YtzhP2zdc9NmRFenb
	 zkqXGEEih0ImoWQ86wtD4u4j0dg4wdCqbBroyLu/RWRS8rLWTkj8cf53N/B5FoM0fJ
	 vyJAtjXB1GmAUCidzbsHwYmzmz6foGD5qHNTXESRIGjeYDZe8uAx6wmDT2cW0ugYnn
	 jYArv0p8joPwuvMTinL/q5ZdtM5DCXlBpIVttCZX0M3OiaHPtY4XUWiPSub7A7Pn9r
	 cbLIF5jSMMoug==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 07 Nov 2026 12:06:23 +0100
Subject: [PATCH 1/2] i3c: dw: remove redundant
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
Message-Id: <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049597; l=1119;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=kJPnhzJo19aE0ih6RL6Z8/mQUEqLRIZ6NZeqzs1n7RY=;
 b=fg+YjkKNfzCzJp8Fi5fsdodD2ZNnI9z+W2/hrUGY05dpY1+XPTBCKsFfgoWJxUnnKkwJ5Yr8r
 kz7Q4YQgr3BBT8T+7gjaHMhDnWrVRxFMPeZBBaNTI93zMQ6g17GZo4B
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d1119f203d1b..f8fed797e0e4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1776,7 +1776,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -1792,7 +1791,6 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 
 	pm_runtime_disable(master->dev);
 	pm_runtime_set_suspended(master->dev);
-	pm_runtime_dont_use_autosuspend(master->dev);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
 

-- 
2.56.0

