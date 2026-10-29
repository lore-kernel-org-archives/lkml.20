Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281007;
	b=uw2jAO6SfXaKBBKHYouiERZGVq2NJHBc5wFdj774uFWekIRr7aHLPWxY7gWeDqK9QTqt
	 gnXCx2fD7U11P06eIDTWx9LhNnbiFp8jiotoq5eRUUGitj5xDO0sNU/cDgozWeVKl4ouc
	 m/hGsjTZoWfTXWurkNX02P71n07OJ2u1dUA9lLYik3a1ZUsuXsH6Uywm0NX0Bm4AHeqAv
	 CKfAmuxLuNeBpFRbgaAnOjPsfsqS+n00J0ZLVnrPITk7f4CePTrhlWMsIhkUYF4DDK7ox
	 LpT3iYZ96H8PAnYzO6o1T0//nsGK0B3wdk0mxj7i7w8oYVxYGfL4ljf6YV749gnpBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281007;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=lc32ZohfVRN3L899S2+O3jB+tVtxzljEyJUStyURypw=;
	b=1qXBFS7MMK2vaOMFScEdEU/T0qtBmLtle1yAi0g2TGmGVNifyqTRlL/n2GOAEeBnihuL
	 +c7NxdZ9n2q6XZR26dbN4ZR6rsUa4mdFM3ERIUoeRLrfKok8UVbtu+4KYZDJUk80+T6cz
	 P7HUknQ0EWY2z8a1djt8Xa75NnzvHRG25lIYKuhOxUsmrRq60r9OB/RHjKRKZNI+54957
	 2D4FIv+j3S+rOGT5KUo4KaVlSgFZ3hwQkc0x9GfslGulDKAJBhxjrh1Ckf2yYUtvmLp9P
	 JqpmTdS+fYIa1Jo/UC9lHba9Nt8Yrt5YaOnu/jgi8GQjnlKik/d64nRDSqQXCWU3aBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKBWwVly;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D756260A2612
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKBWwVly
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442291F01828;
	Thu, 29 Oct 2026 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281006;
	bh=lc32ZohfVRN3L899S2+O3jB+tVtxzljEyJUStyURypw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jKBWwVlymx0eGrv7pwm2jYL/gxnBLSI6SSG0pEnr0JJCYEEoBOrOozVuUpPhaLOxb
	 iQz6lHUQEmZ3eu2lIbE1KVL+VYeyMKXtHenEorBkCqV55tJS4It8NuVJvhrQTpZxqN
	 VSNb7tkt4VUM7xFBfmh+BDTFFYr0xTI4F/VFVn6N+lbVpLLCGKCUC7+Wj7CBVasRVK
	 nCjlwAvM9gZ328Hh8dBaBGP0p8rp3hjD4WsGM/T6KI34+ONYqa6dCLRx+l/hi6ZJD5
	 wnkNrtRIRrue7+PnAs8acGkUGrLHI5P64VIVkQYBpCFmsFeJA/HrQEP7xxhD5jKX5u
	 6RVZcJzj/kyFA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:08 -0500
Subject: [PATCH v4 21/31] accel: ethosu: Account for feature map element
 size
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
Message-Id: <20261029-ethosu-fixes-v4-21-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The feature map bounds calculation currently accounts for only one byte
of the final element. This can leave the tail of B16, B32, and B64
elements outside the validated buffer.

Use the feature map element size when calculating the final byte.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 3333477bf2e5..bf1489734769 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -436,7 +436,7 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 		return U64_MAX;
 	}
 
-	if (check_add_overflow(addr, 1ULL, &offset))
+	if (check_add_overflow(addr, (u64)element_size, &offset))
 		return U64_MAX;
 
 	info->region_size[fm->region] = max(info->region_size[fm->region], offset);

-- 
2.53.0

