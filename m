Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228555;
	b=YLVsW5UFpOLXAoz3IPjkG0Bb9d2sVdQwO/HkixSsliUk/ESAQDITIs/H/EXaobGCigRK
	 ++HMe9/6Qfus6mO9pImiuhgRC8Y7ZfyVLb4ajWt+YFs4uYLjVULuDsSI1aVyovWZdy2yQ
	 Yk2gi4y8CNHg2kTqtL90KE1lvNFiiFErjTgZIBt/VWlRYEUvN0q9UTW6sek9ETkw05pbk
	 WXJ09osG29ruC7FukMGBiAd7p72BoSSQNkflS5tcSGM6QrSSZQmZNxZgGfOIa7iQNQIjk
	 cNE7lL/irdUa1DXal+zUrDPkDpo48QXMUpEe51wGW19ijJ7/AR6PnyV05EhBeaUtS6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228555;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=nydAJnDSrzQkgGQEp1c7vPOlzVQVWZ8lTHDIck8Byk4=;
	b=mCBUU1wtfOhh1S79pPA2Wq3N91zqYPtuwiV2axwV0fQQqCjpGkeE0/cDHG1rqkwReHIc
	 UwhVpRpgUP6xN+p9iNKhiENKEx4kWTcXVbIH60rNGf54madhLPczXEr36aViTx6k9ph/6
	 p6Ap48TmQ8AIl2K5/IHoWRUWaA1ML87UAVLkXLiQSQd1+/pmiyMujatl1lpY89+mA/MZz
	 LIZo1m3gxdLy6r1fjd6iZsW4VhqFJ/URud6HTncTyV4yKB+6paQ+9JwDeRYeCXzOP2nsz
	 n+hs8J7bsgLxwnLVv7vxeiD36bOmlhS88jROeaS83tnK5kzRJl0WGnTmJWNz7MYUTpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROA1LBG1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB4606D83D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROA1LBG1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6302A1F0089F;
	Mon,  9 Nov 2026 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228554;
	bh=nydAJnDSrzQkgGQEp1c7vPOlzVQVWZ8lTHDIck8Byk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ROA1LBG1ksnPG1YTlRobUIHob1IfCk2gvHaKtxCDiuPYoMbSA/SxrtYE4B0MIX8jV
	 /2uMJ5vsangZECAZdvNybPv0jPqdOssgVAk73i4Crc1ppe7QJKBH9XJC+il3F4koLR
	 n6GYPCNXO9abZoXkPlvFrrIu4fUHozUHypjTY2ys4ZW3m/iJBGo46elWFs0HWJRKY6
	 FEoD/3OeNzYlaocZIWs7+LCDBaW8vIFMi28I7kRdPxwHpUTAPJof0TGSPhmd1NVGaq
	 54qiMunVbfu5OqGSrEFBDthxkflAPnMKqWCaesPNr8IxEvkXxnXlboVCJK4HTFzjA7
	 AtXPcLnDrQvxQ==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] x86/boot/compressed: Mark process_mem_region() index __maybe_unused
Date: Mon,  9 Nov 2026 13:48:20 +0100
Message-ID: <20261109124816.61438-9-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109124816.61438-6-blum@kernel.org>
References: <20261109124816.61438-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=blum@kernel.org; h=from:subject; bh=lF+vUWjtOPSxElNRk+M6lmdx/K+mhNu4MyPFTkO2EpY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfD0oE3O+z2tGyaA93/tGc9Nmse248yzC69Gn3tBVOu fOvNt/921HKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATWS/FyLDcsvXMnpqzvKws 2t3zbyq/KxH8VMc7O2XJfiW9p4eP7uli+Kd3yEfp7Lu9540DLI94lCzZyjHvlOi690F3lN5f0uO zlOACAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The local index variable i in process_mem_region() is unused when either
CONFIG_MEMORY_HOTREMOVE or CONFIG_ACPI is disabled.

Mark it __maybe_unused accordingly.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/kaslr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 290153818d0f..6f95092fa97e 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -599,7 +599,8 @@ static bool process_mem_region(struct mem_vector *region,
 			       unsigned long minimum,
 			       unsigned long image_size)
 {
-	int i;
+	int i __maybe_unused;
+
 	/*
 	 * If no immovable memory found, or MEMORY_HOTREMOVE disabled,
 	 * use @region directly.
