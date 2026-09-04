Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9C33537D0;
	Fri,  4 Sep 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527297; cv=none; b=g/I5vINAhUqyulmAwGiTn5B+ncvLecRxGdTp7P7lZWIaDVGyNn4LjMreUHceViqVmLGvVHP6W++8uyiscRSSS4yfos5FPBeMl09Vb2cux9XUs4HPzhQI5tdZtLGgyuVLn/S0fcRIac4PhbdKD9dpRlT2pujlmAtZqEUnovdfXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527297; c=relaxed/simple;
	bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvC/VG7rkuyuOXljfu7lIS8RJUtS+vz9Bib9DvWsBlfFdMlmRGeAPzmwvz7ati5Ap6xKXbNxr8D4yLLd3D4uwC2ni0WpRAineUfhPRlEE4sAeGwX5SCRPdJCkr1B74HjkCimpmJXu9g2U09PEzQTiN6kcTdfgohlUmACKp9VZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=npN9VLt2; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=IayqgNLK; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="npN9VLt2";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="IayqgNLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527285; bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=npN9VLt2dzEV6RYQ32n1VH87GUU4kTlUpqlTIhXGGKJFBTvKglkITjikT+/1dIx4n
	 lH75dCmpeZCz4O8IyHsJkRG+mJ3yUOypK54Mhcm0KxshIMYyRX5RbxsXo7+o5T8zzy
	 Qg28appe5JUd/65bmunrBVwRq8lbkS5PiQdNuO4VfmZKWranbkRj0kAss2xs39K3m5
	 AqSkPJBRGnfRXnCHwqomVwDm+ygVebPQmWY+PXz3Dz/Wo7md2eeFuFk6xN+tETZ2/j
	 AVKdByUv9NtbDAJooAonLfNF355fD5NGZffKly7vQcYP/aJCkVHj/WSoXe9bg18brm
	 agj6MjTr0g42g==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 6C2E341472; Fri, 04 Sep 2026 14:08:05 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527282; bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IayqgNLKuaPFsamxkQvYqM3KueeL9459hSAZfaKMVwF0LfqGF+IUZz8Lx0H8TGS7/
	 tGzb0RpITecT43En0cIQhIbfiZSgQnwQYdqirqx4P1e5VCWjYxKyuTb0awhl6ZYXbR
	 dHbG3+ujFQd73pBxZVKTAnjw1F0GfU7v4aWwxt2WgoocGtpm1jM/EF9KHSnrsYtU0N
	 rUwbPVf1/fTzU7LC3bnmx83qYIill4oVfBox7+cntVDvBCKFo75mMOsS/VVtWebH27
	 3FW/dvzmvOiRsTKilih18GnCl7k/gSndzubXa6LYzuvBaW593SzMHkNdpyrxXBcID2
	 qDscPxlv/G6UA==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 9F40941463;
	Fri, 04 Sep 2026 14:08:02 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/17] media: nuvoton-cir: Remove unused struct field
Date: Fri,  4 Sep 2026 14:07:39 +0100
Message-ID: <a3c0622168cafa9d2457f16709fc7e1f7e847c69.1788526920.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788526920.git.sean@mess.org>
References: <cover.1788526920.git.sean@mess.org>
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

