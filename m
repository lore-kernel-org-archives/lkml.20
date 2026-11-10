Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319437;
	b=rZnanaiUZD4AdtX3Xwl/vuYyTboDWSWA3PbL1YxcvJ8TPkpTyRiVK6QDcJHnlwkkh1Ht
	 UgkYxrQJ9yR/IL6R4hohDG2i39XzLN7qGc7zn60t5FVYVHn3N4vOM0HhzfbpjPxSwBR7K
	 +HuAxiV8dlKnJl7Xdl30vStbmRPK4BPPsoJSLodUPDpM0y527uqYeeEmMwM9t7qTl51UT
	 n96Gq3/Tpiryxrb/+DoOjFwpl2YEKWQbOdsiojimfg5etHWFxJWiIoCf4vbAcbuHAfq6E
	 m9ZyJdIRYn0SC0pOtT9Ur3QUy+IpqRw5wQMo1ZX0cEe0w08QrcuUgmLpsI6SVjORUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319437;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lUUY6SG4mSmfFm2bbpqT0Yc1wqBj4qXywugKTS2CAHs=;
	b=xlgw1lUxV8voFmjb3oaCPaEYtfWKtfmjpV/L9DaTO2pVbKOztJED+r2k/ZdF+lsWPZsw
	 GD1bJZhtX91A17MxwbI6K1nGXcXIQVgpT+4a7sotWs5/yEIFALnO8PIEh7Jc/IZvlq1r7
	 uCVf0am7oz2SzgiCh+34fYCJ6iLs2fC1zuOJDPAU3PXOsU/K3gYygD1uAQzcN31QEDlTP
	 BWUk8Qk4G0XDnBfS46n6ommhAB2o8g2/7dcJvLVMrxB6qfhKCe6N1VOPGhoa0N/GH2bkI
	 BHKVqfNXV5HAHW9gzQTyNBPqUXMxuBZmFQWcqyBkkIeLQUgxl8XYYcBOwRAYDKZlz9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDLyYSmW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F2760A2616;
	Tue, 10 Nov 2026 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDLyYSmW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14281F008A2;
	Tue, 10 Nov 2026 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794319437;
	bh=lUUY6SG4mSmfFm2bbpqT0Yc1wqBj4qXywugKTS2CAHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fDLyYSmW7T9MgptwVDfMFXbcr+nvMZZmEDXUDgXC68WUbXRnFgIY94h+odPOW0slE
	 yDKg2/+jI0j7jDQ6TY+9mvyjzs0WS0sxXRnk/AbvBklYq1FlEOX7f6qyD8QfJt+7T6
	 6KngVa3Xx953OAo00kwoY8Uf8C6B0Qws37jeoTudEIgkRFhcVsa1djefznrxva26Az
	 8yTXpfkiaQK8vOUlsZcWfH+G4vh6XxsqvvHuuar/XvgV9Z4fjtwqBWmf7tT3M4IpWj
	 FRw3F+tM+Imhe2APLZuCLvH5KMoPj+bVcUXlJu8hxfrm5MPGI4Cd6dmrWKJIYvO8oB
	 SZ1pFLm3dpkKA==
From: Joshua Crofts <crofts@kernel.org>
Date: Tue, 10 Nov 2026 15:03:47 +0100
Subject: [PATCH 1/4] media: i2c: imx355: remove redundant
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
Message-Id: <20261110-media-remove-dont-use-autosuspend-v1-1-cc07e71b30f9@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319431; l=1216;
 i=crofts@kernel.org; s=20260422; h=from:subject:message-id;
 bh=7pq2vQuuw5dAabFgpcuCosBYNK9UdD7ygDzJlEbAheg=;
 b=bGrDcFTSzD8C8M885X0FD6tPKjGX4pOEXwgvZA/CG5dTGUIyYL+3MM8oiYo/LpRmprkG392/G
 rSdWLw9vCx3B1iK7mIAM50QdiJwPsmcgfSKgHxwuWR6f2Urj4Eq10Gy
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=Xd+UVoRPiiI0K3LHQ2XIcXmO0jvVuFTv9eTx3lgBphI=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/media/i2c/imx355.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index c0dafabf5dc9ad6237c9c9380d6122edfedc96f3..89e42312265822428cbf0b909627c66415b3282f 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1298,7 +1298,6 @@ static int imx355_probe(struct i2c_client *client)
 error_subdev_cleanup_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
-	pm_runtime_dont_use_autosuspend(imx355->dev);
 	v4l2_subdev_cleanup(&imx355->sd);
 error_media_entity_free:
 	media_entity_cleanup(&imx355->sd.entity);
@@ -1329,7 +1328,6 @@ static void imx355_remove(struct i2c_client *client)
 		pm_runtime_set_suspended(imx355->dev);
 	}
 
-	pm_runtime_dont_use_autosuspend(imx355->dev);
 }
 
 static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {

-- 
2.47.3

