Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B8463B7A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761760; cv=none; b=FDkiT5JMc6td9zsa3q8Ie0TW8l27Y4PBej3Jw2+dPGNi23yUFNqnZapuR3xuB6c1uRHFOVjdBpAxYvLxtAcoZlJBfKQmCXFSJJWFvY7Heaj0IHdoWy7HCcznUbe9Yo8CQLC2q4nhnufU5jzQqlYLGJrJysCFD12GfwxQAfPZeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761760; c=relaxed/simple;
	bh=Xh594ZS85gUXvggyHKfotI2henUq6YClR0aeXlFsEDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfC0H4U0Bi+aWjGlKPex1al0UVsfBBd6GQQUrnaivCOcV7ejM9o/wjFWVpeyRVD/aDNnzjp3pLPE83WJMZBNKh886fHfbYkCYsD2n+Qqp2VEQejh/U36FAiE3iD0wiE4aA4K3+yvIinBsQZFtHLMVvxCdS1egSZNQcrZy+7OZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Nmm7pGFb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Nmm7pGFb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so919302f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761756; x=1788366556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIlnj5dzuge9Y09JvuO0oI2LC/wGGksogWut7g+rsrQ=;
        b=Nmm7pGFbxqHx4HuzQsJOW2LBwuvkWAZEPvzIbjE0JeqgoIBy2R/BDHZL+AUVRXqxUX
         eAu7VRC78ebU7tLamNUsPyJxaIkrkuZat4eO02y5qpRNU+FimYNgz1FU+DUge/Twa2YB
         c9tCniD2oaa7wmRCQ/RIiHMrMJaWXfPpNFMW4sTpc9/t3cp/nDxnfBntjJy+vmdKvS6k
         d2WP76Uu1RS/c0qpfg4QrRlXxRz8fLyjeS/Uv5d9o1mmDC/zyqmcTb8TUUhGFzS2HMMX
         hjLIpQltmv486jXgT947Pg8Oa2nbsIIAQBnFAQ8gTu4jrYl7dC9gwD8nHZRsbLfrVmkM
         mubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761756; x=1788366556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIlnj5dzuge9Y09JvuO0oI2LC/wGGksogWut7g+rsrQ=;
        b=Pl/qajjlB/7vjBcy00U7pSvDWCGdnoPq8cQmcihCP0npSdueVMFRBuV7vpeijSHgXY
         8JkiWAMNmd1b1vbUkeD/daMYw8ACgoZpjOk1TrCR6dvbuM57BG0SGPjngOFfoZ1TDpcK
         enE8EfsA6434Ek/54QxEgBOhrPMY8dEl1LFAMnunx0l/8uOExiDINMANv8ZHEJbu7Hgq
         p46hus+fMuMoLD+vvAYznQmshQEVE0RUwvEXkcgst/CJN7c5L2Bdw+bo1vJYDjn+3hWq
         +KG04p92a8EE74OH+a1ClCpgaUocX3K8KeWHzWD6/f57rdAyPY5EEGJUVEXI1I83fThg
         G0pg==
X-Forwarded-Encrypted: i=1; AHgh+RrcRUIgbLlg44+RopWkEW5+WKgd2+Hl1BSKDLvX7rYmOcvwaCwk7VxhwbVb8gBHrGETHGGv5c5qAweKdvw=@vger.kernel.org
X-Gm-Message-State: AFuF++lR9xrelHfq1+nHHediZjrF0ZQUK8+0poZlarmwoaw0sbvzTRck
	IhW0RA5OG1jSC2DsU+6nkW3Cb+WLXHp/QS5FfVQeBNLNbvi7g+X6nJHiXHEW0Lh3QA==
X-Gm-Gg: AR+sD12gpzALIt2Nzqm3dNldhfKdeDxVo14YgUXnnzEiL5iSXPfqRP2ekSmxNEiK+MI
	Zw9KkTAIsUhT6Vloj3bMyajT4e8Q7+USqxjBMnThtUvzPe2gDmWtM9uAnITw5aFQ/XwfkY1seJ8
	x80ntpLmdRMoWnIQgmfVkHh6MeyJQ76sg+JRRoze9OYXndo/tW4e1a7KVpRsTaYTS9HSJOS36TK
	CXAMn2Uuq0ZSEH62UJh5FqnhKgxzX69wJKbJMBp5sQ1Mw39Sc2YM+/tUogluWt2oEQGeDr02NMU
	6F5z/svm1CUEcE9l87eW/jph7HoR07ZBHqPqAgb+RIeVlII0E4whWdZvRADtqNxGpqWEHjWtjZl
	/ljeh+qeXD2+x/kUfAIP0bloIZ5e2QYDs3YboWd3Y0P7qF6h20Jbcmn0i1wS/QXNxnm5jnEu6dW
	6rUkFyyzsYtyNi+eLdq9ICMfbT8Qej3CtbcqFScXAy5RgSt6hOlO0oH8ymXHgqQECYbrRyfj9Du
	QEZZ0fzg2OTG0ZgRWCtPM5Kp+6HeqlgZJ0xrfKhnAojTA0=
X-Received: by 2002:a05:6000:29ce:b0:482:de48:c445 with SMTP id ffacd0b85a97d-482e26d9aaemr7644532f8f.11.1787761756534;
        Wed, 26 Aug 2026 09:29:16 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:15 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] rust: io: add checked offset copy helpers
Date: Wed, 26 Aug 2026 17:28:40 +0100
Message-ID: <20260826162851.2497-7-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I/O mappings often need to copy a bounded byte range rather than
the complete mapping. Add checked helpers that project the requested
range before using the backend copy operation. This keeps raw backend
pointers out of consumers and reports invalid ranges instead.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/io.rs | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 95f46bb75f9e..aea346b8b79e 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -225,6 +225,30 @@ fn io_view<'a, IO: Io<'a>, U>(
     Ok(unsafe { IO::Backend::project_view(view, projected_ptr) })
 }
 
+/// Returns a byte-slice view for a given range, performing runtime bounds checks.
+#[inline]
+fn io_byte_slice<'a, IO>(
+    this: IO,
+    offset: usize,
+    len: usize,
+) -> Result<<IO::Backend as IoBackend>::View<'a, [u8]>>
+where
+    IO: Io<'a, Target = [u8]>,
+{
+    let view = this.as_view();
+    let ptr = IO::Backend::as_ptr(view);
+    let end = offset.checked_add(len).ok_or(EINVAL)?;
+
+    if end > ptr.len() {
+        return Err(EINVAL);
+    }
+
+    let projected_ptr =
+        core::ptr::slice_from_raw_parts_mut(ptr.cast::<u8>().wrapping_add(offset), len);
+    // SAFETY: The bounds check above proves that `projected_ptr` is a sub-slice of `ptr`.
+    Ok(unsafe { IO::Backend::project_view(view, projected_ptr) })
+}
+
 /// I/O backends.
 ///
 /// This is an abstract representation to be implemented by arbitrary I/O
@@ -640,6 +664,32 @@ fn copy_to_slice(self, data: &mut [u8])
         }
     }
 
+    /// Copy bytes from `data` to a range of I/O memory.
+    ///
+    /// Returns [`EINVAL`] if `offset..offset + data.len()` is outside the I/O region.
+    #[inline]
+    fn try_copy_from_slice(self, offset: usize, data: &[u8]) -> Result
+    where
+        Self::Backend: IoCopyable,
+        Self: Io<'a, Target = [u8]>,
+    {
+        io_byte_slice(self, offset, data.len())?.copy_from_slice(data);
+        Ok(())
+    }
+
+    /// Copy a range of I/O memory to `data`.
+    ///
+    /// Returns [`EINVAL`] if `offset..offset + data.len()` is outside the I/O region.
+    #[inline]
+    fn try_copy_to_slice(self, offset: usize, data: &mut [u8]) -> Result
+    where
+        Self::Backend: IoCopyable,
+        Self: Io<'a, Target = [u8]>,
+    {
+        io_byte_slice(self, offset, data.len())?.copy_to_slice(data);
+        Ok(())
+    }
+
     /// Fallible 8-bit read with runtime bounds check.
     #[inline(always)]
     fn try_read8(self, offset: usize) -> Result<u8>
