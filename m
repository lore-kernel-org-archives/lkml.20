Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45648124F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280530; cv=none; b=s+Tn6u5/6CVyCsBw2Gt7m3+NDtW49hujv16+a/Ey/mr/3+cEiNZe3i/C4OtuLc+jF1/QC59dmspMkwnh55WDGPxUK0J9Var3q7Gbss87O3gzysOyAjtwNHYp8R22VghDZeM/Dggw1zncZS6qGV2HGwk38CCIKcTRx2pCUhEb/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280530; c=relaxed/simple;
	bh=Q3w+fqnn1Odo3u33vSDwy+efpfwvyQRtuduW7bjVVNs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tIfVE3/YjoWVxJ/ceWGqtot/qkgjMX1SxBtP8fK2PlOYBeoE4+IWX+idSoYG3K1So7jhQqGGdLz3Pw+HVoZDDAcwVAwfqQ4TfY3hnVjJVL/Fh2RqyvpmXUnzhAhVoz9vG2N/LxYlAPryA3aykeRDA5yfC2cevVn0SQuRnjp5NRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HTuJ2vnZ; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HTuJ2vnZ"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so7014a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788280528; x=1788885328; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ro8mTU0e+ibPxFysuMqboUdneRfJQUV4jga1NJ1RSo=;
        b=HTuJ2vnZM2PvqUN+B7/j4+UrD23gZi6rqd3NE7rQfapiv9TUd7LuExYrZcE4CZQLuY
         h1B5v2FIWotb3ZOlqRLooF/vtRVU/k/gSM6Yi+bMMhVrNSVJFllsJ14xBxuTLszMBPol
         s4Z8LtBxwBZcJDTYF1Ekly7lp6iRuLbGrU9s/sIPCxKz4Vn+Z3yQRJZYaKdOZWoW+Bxj
         reFrKGvYiKGT9DuFOoC/Fs5AeHq0naYS7TIv1VfDv+lzymyxjkYcGFa9xiq/igAH+xPm
         /Sokq98YWtziB2rG2KTSey/wwaFJnflhijx0G23Ky3ZY0LLbkz5A2HsNNk9T38GnQEYc
         +0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280528; x=1788885328;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ro8mTU0e+ibPxFysuMqboUdneRfJQUV4jga1NJ1RSo=;
        b=IA2miIr6UU+5clxF+j0ybGgrAMhMSPgkZMdzJDOuFanFOUq77Ly6EmAee9zC4iD0qN
         NDAoDN2gLd6k66LkwrJVKrCn7odbRxuOziXTSPXt5KfjdJDQVYJa1Yi92OKOoVyx/4uh
         Nbt+IyZ/kP5wKv1NoQ5+yd3sxurSoIlpi/0/MX+F4nCbNPR7sH3nJQVjyFatDXQAteGT
         SoqUCXOzmDjg0RS2YgixOh1eusNMq9/JmwcJpGhpamJh7amOoBRR1UPWsDTISAvLNfl1
         txpT2atlsWFOgYocoC/zQzb7hVS/0F3BM3ZtS8/QECToArT6YYt76gAmDNA0ZsziQSIv
         7uvg==
X-Forwarded-Encrypted: i=1; AKwUvByK8tVLvIHuRk2Xsh77i2adLQ8ByJfR5pgaNpsdjCuzUTkpYRX6oiXnRP7VGWbqRoIsBfHPGBNwHksKZY4=@vger.kernel.org
X-Gm-Message-State: AFuF++lzYbs+ToJuDOoA2BvqMW+p21EsXv7KC7OSvq8W588jshkWXgUe
	mLMjtjmgaKqtw40l1fLynnwOjUWZMS2om2iMeXMEjMitf0JrmM2wUicWubkwqVIgyY7/ReByUaI
	Mfa1aJoE0ssp3ZQ==
X-Received: from dlbro7.prod.google.com ([2002:a05:7022:1587:b0:141:4b64:a042])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:528f:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39907e113f5mr15291291a91.16.1788280527477;
 Tue, 01 Sep 2026 09:35:27 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:35:15 +0000
In-Reply-To: <20260901163521.1355535-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901163521.1355535-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901163521.1355535-3-cmllamas@google.com>
Subject: [PATCH v3 2/5] rust_binder: set VM_DONTEXPAND
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Binder does not support expanding VMAs. It uses the original size to
create its RangeAllocator during mmap() and expanding the VMA would only
result in a wasted virtual range. Set the VM_DONTEXPAND flag to prevent
the vma from being expanded via mremap().

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas%40google.com?part=1
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder/process.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd93b3..9038f3d13cfd 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1786,6 +1786,7 @@ pub(crate) fn mmap(
         vma.try_clear_maywrite().map_err(|_| EPERM)?;
         vma.set_dontcopy();
         vma.set_mixedmap();
+        vma.set_dontexpand();
 
         // TODO: Set ops. We need to learn when the user unmaps so that we can stop using it.
         this.create_mapping(vma)
-- 
2.55.0.966.g6673acef38-goog

