Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1454A3F2A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295979; cv=none; b=KIpYtsHdvOSHHae/kgBwlOt1Wfkm/RhakuVgVRZfRUeGPLN3KF9tZVPXo0SrsB0VNh8XL6pewxFOcmy147BNVD/4pO+/JjlTPNwcch4WI2RnwQTZj6k18WwedqepGdWTs/U2SZp4N9Pe307Uc6WbcWM1oBTruGrJ/qoazob4BVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295979; c=relaxed/simple;
	bh=qDxPPBiVzVIZg0bueYBv9GJ3dcl74Eqh6LmL3sW7by4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NbV65+LDwPK2922Q/2utGAXL9DmRr0icY11etdLVfCxY6GMRXMrZhRFV+euSaNwXZajLM4i8EN457/3wQKMaxxu/X2P0WQDyUuid8ohUaxkkocM2OFODFOLezPD2HXgqOZTMse6RItAaMvm5pQWDrwrIrT4LSGfrHMJzFbptktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uZzhFoVv; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uZzhFoVv"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so448761a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295977; x=1788900777; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4b9RJf/EoA9UAqTMJZs0pdFOLSykyAl2dSQSlyCXCk=;
        b=uZzhFoVvpFCQobtS2UZP/oJw6haDPgYW9kzWBA+S3a95dxlXmftJOubUvKjx/NmYDc
         CBvtwOQ7j9FJENsql8oqdMmdugkkY89Axo/B+CFYOx8kTF2YvQo7XhyRUIt8LPiu0nO/
         e0kz+cAZpYcnS7+lbeVoqxf6qgjgxdb3ltVY4vDXr4f40Tqf5vrnUAi7SK3dA5G3DAdd
         Wx0ShhkxXDyte5R9NInT8KIGesb5ihZcWgZ7dBTGvUVVg3mWc8SAUT1TRLESp4tbsuZh
         HAXvSgdqE8ug4v5O2cS5hS4jJWAEcNZY/tBv6K3yhMyNYS6IWFjiDJEbsQ0R1tgxM5a0
         SJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295977; x=1788900777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4b9RJf/EoA9UAqTMJZs0pdFOLSykyAl2dSQSlyCXCk=;
        b=OMyWj1tRiELadBVkIQ7liyG41XZrTf5tvUdtGx4/i27Bz7cWJSnmBZsvfLBW8uHq0D
         9Nm25acAZ9CTav9wQC5l5h5f8N2krKhHyF+7hN3ekHFIDzIokY1k84fuV4VZhG5sFnOQ
         n1zOQNT+5xnv+t4WyuOQ/hRKXcWdU6PI0Nr4kkpdtqJN4h2BA8khL9zSk5uNQxvHdYem
         a1615RGJMrnm0Mucstjy33KBzYhoL1U0H2SJe/cNYtCLU1XlZ/8zncSdyWDk60h0ztKB
         pJM7o5UYVPBoErOkTG1Fr5O0dRsd9Bj7UK1W8DzX2JKIic0zRIeyNm3RCkxpV87ZylGG
         T3ig==
X-Forwarded-Encrypted: i=1; AKwUvBwA5dzVnQefTPwsfV/IYBiiIix0wpzF7VtbWTvfZV+BaERIu9127RDzv6gfZ31MhC5cmiLl46tf8gxcMks=@vger.kernel.org
X-Gm-Message-State: AFuF++l9p+GNmJ0yzJeVpPFlBkKjgHRwMP7iz19kvS4KXr69UQOas0Cp
	/1mdylI4USDx6tJ0wa45HPxFHaKN6WhkjxUiEStAEqIokeiNFGJO+jt2IU/db6zTywZYYlatZEk
	dSYcpkJTOO4Xt2A==
X-Received: from dltt5.prod.google.com ([2002:a05:701a:c965:b0:141:a317:d828])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3903:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39907bbe018mr15277088a91.8.1788295977354;
 Tue, 01 Sep 2026 13:52:57 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:42 +0000
In-Reply-To: <20260901205250.1638304-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-3-cmllamas@google.com>
Subject: [PATCH v4 2/7] rust_binder: set VM_DONTEXPAND
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
Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas@google.com?part=1
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

