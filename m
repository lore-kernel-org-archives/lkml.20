Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319446;
	b=N7naAwud888Ca5Oz0MlStEBVOS/UqIZNkK1mPX2T8x5zF375dH3mKmgpX8vv5bM0J6Se
	 v0O2lGP1a4pE1Pgys+1TbAyl5xNB0rPMs0Wgh2COyM8leaVbcZ7L4J23NxHWqmbYgAl3r
	 qFhXY8MigEOAeSvU7URChrNsd/rjcrzJ+ZlF+QFxzkM9vY+XpXYh6SbQf913oSEGGU9hy
	 v2aro8rozmNFT/NKLesTW14aXhXvfz+LIWM8QBNEmQtooABO0Xiv2Sq4gRF7QYEVyZmKU
	 9HNj42cJ6a3k8Urpbd5ap11gEFwAF0MRo2hP+G41YlSMuMoARPhBiOhzmiCcp4j6vDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319446;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jBJ0xr9s4TDhGS4dXYDJWJFbpc87NgnKnIA5mNyiSzY=;
	b=x18cLGUYgoKlazbBywkw/Q3YemmcH3C+CjjJnl3SPlQeuutOh4qFrGiyY0Qagr7NbXUN
	 5H+IHZ5Bm0YkatS9PkwDUW6xiBJHz07ovcUbuO9/L1kYLMadeuUxF98xk1sPB1qBFS5ZF
	 O+gTJgZAwtmwfJfy5Icqw/AaJiTDhH68G2yQhEsKJtO2NvjEIOGyFMoaHkxN6IXlYt70O
	 tATfom5yjVYNiu66amBruGFVwCgw+NRjS2XUVTPfKMI+62j7jzoAjqhLdTqjg0WeLOYrL
	 Nhe/EeFY3llulxDepu/OZ2aa8RdZiku4h/J6PfH0dY6RpIrKcQ9JZlerVYtI+xlqWdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LWX006/k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DF60A2603;
	Tue, 10 Nov 2026 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWX006/k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316141F0089F;
	Tue, 10 Nov 2026 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794319445;
	bh=jBJ0xr9s4TDhGS4dXYDJWJFbpc87NgnKnIA5mNyiSzY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LWX006/k50e/zo/KIHRIDuJV+keMqzJwIjmlbo/f3X5Up9tZ5PsyfL7nD1kEjorrJ
	 tZOVSzsC9FkPlZfUq23UtI8ad1QTniAFoJ40mUAADDL14GisFH2aVRhwfjSAaJXwbu
	 XWWUj9U39zhb5w5vJiWoleJjvzdhzbgTQmjyGRSzRWOF23Trby6kDx6kLojUNJbVQL
	 Vil/q4nWwCze8LSQl16IymqBD6sUuVdATG13GLXrWnvCVD0f3KlQ0sJqQq9EmSdMCt
	 eNaEBrBoabfCrj+ud6cLnuI6IWoEYuVHlxuSZeUadfy7SE9Jdldj3hIho9lwiiZjld
	 VQAqvQivewuQg==
From: Joshua Crofts <crofts@kernel.org>
Date: Tue, 10 Nov 2026 15:03:50 +0100
Subject: [PATCH 4/4] media: i2c: vd56g3: remove redundant
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
Message-Id: <20261110-media-remove-dont-use-autosuspend-v1-4-cc07e71b30f9@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319431; l=1163;
 i=crofts@kernel.org; s=20260422; h=from:subject:message-id;
 bh=rNohVn5PccJKHfqSx+Gswt1OdxA+A4uAaVBJFien/yQ=;
 b=zEWAvwqHvWbN8bXGudlf4KULxgTX8p/b32D8/V5sCP2VqZwTuWtcwL7L/dMTwik1ZjfyEjjFB
 QbwjHmOPw0SAtorqgtLxFTCMZ5XYOwvvqQv7mb/m30cvo26llchQ4aM
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=Xd+UVoRPiiI0K3LHQ2XIcXmO0jvVuFTv9eTx3lgBphI=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/media/i2c/vd56g3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
index a42210d0ab8d54a9132a5077875138c2440152bb..e4ad01973a24201a20dd43c86ac6de9817889049 100644
--- a/drivers/media/i2c/vd56g3.c
+++ b/drivers/media/i2c/vd56g3.c
@@ -1538,7 +1538,6 @@ static int vd56g3_probe(struct i2c_client *client)
 err_power_off:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	vd56g3_power_off(dev);
 
 	return ret;
@@ -1555,7 +1554,6 @@ static void vd56g3_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(sensor->dev))
 		vd56g3_power_off(sensor->dev);
 	pm_runtime_set_suspended(sensor->dev);
-	pm_runtime_dont_use_autosuspend(sensor->dev);
 }
 
 static const struct of_device_id vd56g3_dt_ids[] = {

-- 
2.47.3

