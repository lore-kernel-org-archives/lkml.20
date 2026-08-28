Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC2318EC9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881963; cv=none; b=oHTjMqkZdquWfxSuyvfse9GWsfwjR5q7ra2CuAHldl0Q7S3HxUSzbwhQ2PS6Yn3Dkx4//9TOiX5iiRr7V65uskZ3F4r2xuhBxooVThjXyKIgqhLwbrSC4Kcdn3TU3wx8GgpGc8C3kbCOTcaPspf/kGbkDjV+9KEUEYG2eu7R9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881963; c=relaxed/simple;
	bh=q30dBEXeI8fNqG2Fhm0SNCEmhwHt3HVvGwgctzlo228=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fv/QSj6A120p1W2IrKmWYsR37qeTD3THY55pThN5osZOYjKO0T7pLydiwMDYRHXQQMQqCS5Vlqr1jXbst318kELi+uPg8TWd5IytSyiWkPcgJOcH2429xHWVMx88uiUkAqYKj3E7X+b3EGU6MF54y1U1o/LVDHhKqqHE7SZPSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtDQKBQw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtDQKBQw"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39266382df6so668611a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881952; x=1788486752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zu+RxARiDBgW38W1dKFU7cEtIABJ2qMEIV7Sy1U5J70=;
        b=CtDQKBQway7O8JDGegWRU+z3RNVcIOCv3ZIqI1tnxPRH5BvzUfVoKE9slMLB5kFhXi
         oBIybkX4/cMH8z1gHQhoqeSwWta5kR+fraPfq1HTaHiEjQsfuJO4Xq71N6MD/LM1LVob
         RFeU3x/DoAv3bsM2qMkEagZmblTn+UokZobmqFtX1OB7HI/LK1zXvEtt834q9NQoVsal
         naPRc/RcBDKNSq8CYyiL6pHNIf15SzFxoRxc8UKz6/w/dLPsrdiP+j4+ckiH3u7P4qYp
         g/KSvQiOBkHFGc7qveGOQ5VTZQZ/XxosakU/I8x6yTAInFKD8D47cg4IMFuqsKFZPrr1
         uRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881952; x=1788486752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zu+RxARiDBgW38W1dKFU7cEtIABJ2qMEIV7Sy1U5J70=;
        b=CLCp/x7zduPqJkWca0WItB1EbWhVYL/gKX2Pz1wo5S18NMQYRvTHr32ZgZO8N9hgCQ
         UarriKbZxhjfvUPmknZ0wz2XsWTjLlaXShnTX5n1UDBEtIZjVMrZn8WBsS7W4jpUIphV
         TiVCggQcyGPwbPomJkQi7A1YRO/tNbiBSsjZpkYj0+YWZHraav+O2MEtHWijJYmWe344
         EsxK+p1TGMcxAsUEJyUL9cTYvthwA5zYER7SwzbRSJLMZazyV723y6zS3HTQ7V0tdf4/
         u8SZeFqtj45RLaBKdD/p2T1giz86gocLdXeTSkw11TsECneAAaePtVlRyoza44s1Z+Oq
         ixeg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2+WE8KnfnZkcFaMruitR2DxYTabMgtRLKC5vunVntmRMMLFigNjluG9W+l+2nm28rKWHgLl5Aop4drss=@vger.kernel.org
X-Gm-Message-State: AFuF++lwQ9ySeGu9DYsAXx95pmchiGVkVYBf8pFIsdK1/oNgk0fvNAIA
	y/d5SrNwRDBmiBkJqV+hJJ2/ui3kiSPSasJKfiJO3thvgUvD2Z4W/weX
X-Gm-Gg: AR+sD11NNpLBTdQP3kYR+vtrezCscA7GWqtSoZdYZDPToQK08g8v4DCEC3q7b0crsYG
	PfWuGGiTPXqWUrEXYrjZDCKDhoYeJDR4dR1Akmj739Yqjee/cdXkwzQNwI44blnQTfDqsuyJMTe
	+Hd8QNaHr8uK6VDuYYvUCTrj6CcQJV8KKjlYbGe20sRq28oA9el7hv1N3jGzbERvMtlU7nnq40E
	ITbUqfUJbSTYFMV6Fwsh7ZA/TXXbF+Pqic9C4VGpMbfTsGpGmli+GbnLeXDqotb/RjPGdgcHdfL
	pho/Twy6wNWLdTWb9gsxfBvJfgmaVPuAsRZeoOwtSGCHqUU0C7KW0QAUiGOA6Frp85KTp9CmB4f
	4DbUsiURzrv3x5hI7sU+WlkYYUfGwTcs0XzkkcE1zxdnZsbw2zjtwbfF0zmJljwo74gxc0l6ndQ
	6stz/iRuJ+cSplwOFp7hB3UejEhvZCQbs9P1hIlCnLixKIpEDO7yNuT5slWwhGDRucJnXFCHGxP
	LquEg==
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr6224769a91.0.1787881952077;
        Thu, 27 Aug 2026 18:52:32 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:31 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 3/3] rust: io: register: add missing newline in doc example
Date: Fri, 28 Aug 2026 04:50:22 +0300
Message-ID: <20260828015148.221737-4-mehmet.mkoseoglu@gmail.com>
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

The `pr_info!` call in the register module documentation code example
is missing a trailing newline.

Add the missing `\n` to the format string.

Fixes: 20ba6a1dbcb9 ("rust: io: add `register!` macro")
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 rust/kernel/io/register.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index 03dfd2ff48c7..31e084a4aa9f 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -71,7 +71,7 @@
 //!
 //! // Read from the register's defined offset (0x100).
 //! let boot0 = io.read(BOOT_0);
-//! pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+//! pr_info!("chip revision: {}.{}\n", boot0.major_revision().get(), boot0.minor_revision().get());
 //!
 //! // Update some fields and write the new value back.
 //! let new_boot0 = boot0
-- 
2.55.0

