Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B810F3191D3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881951; cv=none; b=RKUYyPHnZhA5F9vRbeBFKfeoOKAstaWZmMNjyKL9Pi5ATkAmhffgS0eTfmxNv680a564wpkwrXe0pmVQyTDfB4d9MjK+TyOxve1RKLnCVsxoINUYk8P4bqhdthShbVvB5GV8bhVlUG8JM4weMLzsiARgQpAklmRFmamts6NaZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881951; c=relaxed/simple;
	bh=cDXl9u4CuY/1+XKa+zRWdOwNjQ9DIY+bFbQam7r/xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdMTABZrV4YkzwIgv8Ou3wnT5DlxFmxnx+pg+EoCU3TI/5n5WKL0RGss5GPaI35J7txJwELPKiJOPfDoGDMHaDjB3bbAhwBn6WJgbQ2NzvCgxCZk5UdFq9BdXbHtt6DPQ4bJURzvRyYHyOq2D/PkxKd/H+/OH+plzXT7h6XVtSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGpLbv78; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGpLbv78"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964e480f76so757200a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881946; x=1788486746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgRyTdTbwko1JdLbXQIFBmeYI8ONlsJWkwJx4wtdOdg=;
        b=bGpLbv78doRDyjJIM7bY21UT4VBRNxeAF2pq9+MJr1sOi8+kFamdLYtNtCFdb/YdFY
         j9NfvrHQg5b1y4opibxY5ONve+w5qtuBXwQXzqFfxZ5h8rjcg8MkQucdj3WXhd9YmBLM
         LATA0XT/DBCccxpNEdurFaFPRWbqoawI0J7T1eYtmkM5No2WWQhH1tk1hc5DMQrZXroH
         IMhQOyEUITYD1AKQjxd+OELVAl+D9d+k1Git3x67SCg7k7e9SeTJtqCAnzrzqYdpLBCh
         YUPiDxESjbrUq6YFvtfe7RiUpP5r6ilLpVxfy24Un9jkYG1otQ1D7JIPr/dm+ayzbY1Q
         TQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881946; x=1788486746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgRyTdTbwko1JdLbXQIFBmeYI8ONlsJWkwJx4wtdOdg=;
        b=dHjGi54wVf5c/P6fmzWL235A2AzsUHw3OUd6h42pLbMigSDr/KEs72rT2ZuEpI2UTq
         1fYEfGxWybufFuW0DbPP96Eizwkg4+eoa+dlhYGMHa1W8uGZi04suJhGd6MJNbe9UQN/
         a1v6mX24GPMAzTCTLE+D0UdJEevZ4iyYAwnySjgG+85kDKt3ITpYjUSGH+0rkxE7tE+b
         jsBKSD7V/QagbcC/In+R084F2LPFWk92ChjJ1BAvxw42JtXudVNFXOsf8gIYsonHx3gN
         CWHe1y9XF4xHcTZSFbwOrX35RELO1HKRJRzadd0US7X7a4OozwSK7nXTHUaBkNZqLShF
         7dYA==
X-Forwarded-Encrypted: i=1; AHgh+RrNlKqZNXSjRNjIRwdlBPwwCbLdYx7Lfa8oW7LEz2LdYy9Z0UdOoR9g84fI7TV3OOQkw6n+aXSWQXTa8V8=@vger.kernel.org
X-Gm-Message-State: AFuF++kBOJ6P2JMJMENwArKXNQ7/gx3RDTfT07ClbXY9HdHpHhVm8Vt6
	EhCufZCDahH2AYA61BNjTx5oTX2iID1xy9SxkvzFhuGAfpLeVaC+B9XigyfEsJTJRdQ=
X-Gm-Gg: AR+sD10RXPALI3jMEOMwWVNeCMCqlNdGiOuSTfR8EJ4QYVRKXBWK7mAFq6u8MlGAj7R
	20CFgpcp5pr6/XgvLnEYq8zqwUM54mlyLgmSpf4zLfnfFL6woUrDNxUahlnAUJZRDdxai4l/pLU
	la3dKM7WFifaf3QcUEtcgrMPwKcoWbbRTF54mMS4JkFaoDwCYLtQ84srTw3ndW4ajBbxx1xTdbt
	nd+NYa/sGDDKtRAQQ3RsjAjM1c1/6e4II+SHkgqL8WLu75jx33cCkriw6lgLF+T6WxVW2xJDUat
	U8iIOVoxsEEPlqVniJvEG61GPYzIWzWq+Mc9AeSorXl/1n7u4iJGRgGX5iWlRF4Ya2pwo0lcPP8
	f4Z0L1fNJF76AecwDYR3R53JEDzEKRKHQwr4gzr7exEXfH+cB4oDmzz3ScuM814HXfkxtSYiwUw
	oT5BAJW/NiI7x6SVVAkX6FeOpPFz/qLHaBKAcEt7kdMc8cfoLg6/eD6f+L4+94DojHWYg=
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr7100016a91.1.1787881945898;
        Thu, 27 Aug 2026 18:52:25 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:25 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 2/3] dma-mapping: rust: samples: add missing newline in rust_dma
Date: Fri, 28 Aug 2026 04:50:21 +0300
Message-ID: <20260828015148.221737-3-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `dev_info!` call iterating over scatter-gather table entries in
`DmaSampleDriver::drop` is missing a trailing newline, causing the
printed message to not be properly line-terminated.

Add the missing `\n` to the format string.

Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index bd60034ded23..aa454e4841a7 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -125,7 +125,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.55.0

