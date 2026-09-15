Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDD4A3D29;
	Tue, 15 Sep 2026 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461197; cv=none; b=VZXBL9XA9EaShCGn5ECh4Dx4AcCo2xB4WpFovenfqxc+rF2Eov1xFKQ8rb/V2Qh1DStO+oly7b73BBg7alOcS7yz2yc6HZ/ofp5hnmV+4s0BcldiNNQGOk0XzNySW2GTEAjP5xUJY0NZ59v/xfn53KLQWrpkzJpeTlBv2sUdM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461197; c=relaxed/simple;
	bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0wpARPHUn2aEKfyj0/Zxt8Jrfov92QYnouH0Zgct22tMpjF/0wVeFzNuUxcDTqZmlVz+iVcRunTSwcjfQtg9rGWnufiJpoe79MQ9LsOI8qRdv5Eiss5sj6PfW7iOxzNw2CSMrWlSO9ERZDVAsj3itgGi8GFbhDwtMjyJHREsqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=s1p9hSc1; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=LkrMu6zS; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="s1p9hSc1";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="LkrMu6zS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461194; bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s1p9hSc1d++ALzXT42RGEBgZWECNmO3UMItza6EoXr1RT8cQ8sZdscNyTrMuir9F4
	 qqR+iqxC/IBnXw3AdjHtxbZRKCyUCAVCIyJumRezCRBu23qaKAPZ0EgpO19XiPWbFD
	 vuWsFMfj2UpJ96+qsRTJ0mZA1ZGwz2bxdUIDqunUDtMzjjBFuBCmJK8dSEg2r75yX+
	 qlzAerWE8T7AXzAgTo9IXbtrUdtwA50RV3Oq5eGmJ15VhOzX3EH5KDqW9oprWLKPUV
	 Os/CPmxHO+5LM+sShFHw6Mc/PlqV8ZbYWs8Q8WLMhk3/bDjlFJbZjdTKuloCcVecY8
	 MtLuyj/8bomzA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 1C78340B72; Tue, 15 Sep 2026 09:33:14 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461193; bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LkrMu6zSxDP+6f/unkmofcrkwTXITenTq9e8UoQe5xxkZcFpkTBF7tIUnM+JXAbFY
	 Fv2oyAMSjGzLv7rUWx03i6F9FYWMUDV4bikqR3BXGgeWQZLGhGiBHKN9SJINa/Qy7G
	 99ZFCY6p6XtgAwzXPj4aiAfrKrr6L7MGa7EZeQeskCuu1QvGCwRgA3YEHjcy72ctfI
	 /62SmRzu78ZsnbU4Lr4fbdyAS5gj7uqcb4xqClFcyXNnpjckgmsW1hdHkVMpGWZO3F
	 ZWRni1awefrkpH+5eCpzYIiQQ34ub+Vp2NBhG/2wJChu3RwA43s2eXPnXsVU8TwoMl
	 QPL0EUiYOFS1w==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 731FD40B71;
	Tue, 15 Sep 2026 09:33:13 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/20] media: nuvoton-cir: Remove unused struct field
Date: Tue, 15 Sep 2026 09:32:22 +0100
Message-ID: <50fa8178b9b941ae82dedaf8c7a63f88b8b6f616.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/nuvoton-cir.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/rc/nuvoton-cir.h b/drivers/media/rc/nuvoton-cir.h
index ed7d93beaa28..e66e3cfedeec 100644
--- a/drivers/media/rc/nuvoton-cir.h
+++ b/drivers/media/rc/nuvoton-cir.h
@@ -77,9 +77,6 @@ struct nvt_dev {
 	/* hardware id */
 	u8 chip_major;
 	u8 chip_minor;
-
-	/* carrier period = 1 / frequency */
-	u32 carrier;
 };
 
 /* buffer packet constants */
-- 
2.55.0

