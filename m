Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F3314B72
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569038; cv=none; b=LB7jBR3RbsRL9uVMZlG7XZhX8dl9s3JABdcovqHy+ZO7+RwdLInMrpxqQZhkEQtGYdcNTp0gljubQHEy1Om4YRxiHHra2jJctNgKUlRGatsvw2jKq3XgkYjrr+TDBpqJcGuBK8U9ZPPtqC8TevRDz14B7q+u6W2UyzwIB1Ilsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569038; c=relaxed/simple;
	bh=Lxl31UnJzWQ8rOwz3+HDvKzujOoNI+PujBdcWOTgdCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6R4hJkg1HPmZ/Td+Ey3IWOTa2/Nyj3822fFHkyixiXkCVlJx8MP0mvcDiX+kdU6T81iqitoW1dk7DJHL4BehEwW+MT8SZiY9SCwTHp7+eMk6U3i6DQZ1hT+8OAq5MeA9XywTP0NI+GqPvtV8KL4fwoAl3S3tGXzoLPMLpTtc/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnBjQ16r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnBjQ16r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A818F1F00A3E;
	Sat,  5 Sep 2026 00:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569036;
	bh=i9FIEzPfm/uew4CacS6zP4HA4rLMmusojNCkX4ydPTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SnBjQ16rUQozMKgVtqIPpi0Cmy35PC6l5+zWvtXv1rnl/jkzm3dSxx3grrxUq9jYM
	 6+1qfW2eTlT62NsVamfgi10kQaGCBOExRzhzhq7m1/ejxxNsAN2g4qq8v8dGd5inz7
	 QsZRJ1XJh5TViv7hH/CsV6Zlx1u/hBj+gxx9ltoOmuziJyj3fLuFrC2NvybhDzMwRs
	 KdGCDrldnfGv3J4QHXdWPReBli1G+5h2pXmeVUl4RuGJyaPcyfNbkJvvg3pGQ8llbw
	 c7RNY0X3IRUvtHHp6mZjWXbyMAEt6/6tFWhSMsJ4GMAkg6InrtLODazQ0aY6Qr0wXq
	 /cy1GvpAUXS7w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:30 -0500
Subject: [PATCH v2 11/19] accel: ethosu: Account for feature map element
 size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-11-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
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
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index c54496fa08f4..bca68fab0527 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -415,7 +415,7 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 		return U64_MAX;
 	}
 
-	if (check_add_overflow(addr, 1ULL, &offset))
+	if (check_add_overflow(addr, (u64)element_size, &offset))
 		return U64_MAX;
 
 	info->region_size[fm->region] = max(info->region_size[fm->region], offset);

-- 
2.53.0

