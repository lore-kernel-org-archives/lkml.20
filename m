Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E083812FB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501029; cv=none; b=RLJh+DN/eWhFfxSVzQH0oLH8xnk6wOZgIcXK8ff4b9S5xR4INqKz1GOCveNaU8wvEvgx4YrfmIQWmBqWdOQ/Cs5K6kXducyS4nU/6K8837sI6ifTmVLGWeHSLXLKzNYvQAWblK8yB01YmcR9uXQ4L81tG00YNMKTJzQOCMUSKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501029; c=relaxed/simple;
	bh=iQpFxkadxuZthWNzpNDmq94Hthwi+6Tsc7gHXxzEn3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx9O8QbaALagfdfFmeNwfbr4SF6t1qHN37Y5IWVexZBYmIK2Jb9liC8/Djy7EdeIR1G1ra+qNC0iwTsLOoWa5ABla8CkaSLUMIAOo9B4o4EQYazBxkaGSAV2u7NMLGsf798t3Qil2s+IsvNKUdnt9odsJrbndIhhBgqjxDVom20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEnjNWOj; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEnjNWOj"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78a7003f94fso33921137.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501026; x=1790105826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=QEnjNWOj6178noHTDnNBoB2Ol/RwIhbNowHaIau87hbSioWk0PULq+aicSI1czJmjI
         n6B8DdUd6UXI4tnHq1+9rBjpGiGlILED009hK36JEfJj1xDd/gLOXCX5cW/ze1nFEqPZ
         O5XlyxRh/s0JuJL/iIz0Zup7S5yabHeEIf7a//bnfTd2XdriH0zxFrpc7NVf1ekK7qxR
         EFJNO6psC2eZxBVReJ1me4WW+d9BiqAgxhoyOOQcVgYHzZv8aiCokAq1dtaqeXeNIr+x
         Hh0IMmvGye0864punvMZa8VaeebU+s5ccgn78opWl1lR9Z6dhiKDtCxMOhRlJDbYk9zP
         OA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501026; x=1790105826;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=xP7WSl+2G4RkUU6tu9JA+1oxMtLjxbRD3kKmRlr3Sf0KIuOINgtc1Hi7R3ANNlEOVz
         +zxd/adCYfFs62px1bPoq9d5j7FwqBCxZcfXlmZzlcmkZy3N7MvThxqnnPuoMKxk6sje
         0B0hibO5NJe04cX7MBMaVpOkVSiIxvQw40cBcZ248bSBI/2KQ0z78FdqXDi5cfTs7IS3
         KiLjb5r9W9l3uClCXHix7EbS36UQGhQkYrWof5HWTstm6kGWwSeVMFmeKdPZreiUcsxv
         +VVSb9Co/nGv2MD2FWLlpIaVxbyO3f10Oa4d9tEE5fwOM+HWdIuljzaGHKznIj9CR0vs
         ERVg==
X-Forwarded-Encrypted: i=1; AKwUvBw4IBxxwAPM8wEKFJYaUMDGa3LVVGDGqkXbeh4/kpYILJrrakdYC8/bpcTk2sNUf1V2wZ12HCkmESfroNI=@vger.kernel.org
X-Gm-Message-State: AFuF++kr+DV/8sLhqCfYGuAbRRqHil5VBj6N1vvtv5U7z3VpMNYh6ilh
	RY3iQjMfNWyWjQVOlL3S8nV2W6ZAXKYQfmuSg8rLF+wLAzeqvRn9/8w=
X-Gm-Gg: AYBFou18xLxTarC6YozJDN6TQM0rbZTsmiXN+e2P9WQWsZuSF3mch8wmv/GJZXPTea0
	jWzxx83rGf2rqYhB0InK5e5TdhuaFmLpHI9/LADD5DEMASHkBKZrBkWd6plBFOyQEMd8viNVVB6
	vn37PIRTE05s5ZXSdtsqtZxxJ+cBJiUsc+ZuHOXKhkb8Qh4AeVCslxJjISnWLV1ZijBkLtJhfS5
	dGNLrRIlEz2Jq8WpwgR0fFmKNxpfz2KofM2hhlEiqHzzp5isyyFzJhInEDAnPqydTh/6rluZYSS
	uaFg3DXI4JCnCeuPZtx5tRVhPieBtATJrxjHoLFOuS/1hV+4LN7EEzaKYJUXFfBk+W/FykQhPR2
	vwQGkNs3rtQsElMb3GHsCq2sHtmb3W+90ialE0rBD2slPgk6R3lr0v1Sk4ciACb2eCs2vTapAc+
	OhT8d7GAdiykbESE+4flCrTrE7IQyRgkvxcTnx9i/ZqEbOvVwPG5xzACuX1cIdv8zMQp8MopwVA
	Jp+1kfG+yZx+BI57u0FsqjMrctPSLgnX/Ne5svfkCe2+Gy4Rw==
X-Received: by 2002:a05:6102:5607:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-79b5bf316f7mr12420909137.8.1789501025587;
        Tue, 15 Sep 2026 12:37:05 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm691450137.4.2026.09.15.12.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:37:05 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RFC 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
Date: Tue, 15 Sep 2026 16:33:54 -0300
Message-ID: <1a319df6587bfdcfa497fc964a9a6d21a8988e54.1789500084.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789500084.git.nico.antinori.7@gmail.com>
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..a9935b2be8c5 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -571,33 +571,29 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }

+    #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
     #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-        // TODO: Kunit #[test]s do not support `cfg` yet,
-        // so we add it here in the body.
-        #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
-        {
-            let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-            b.set_bit(2048);
-            b.set_bit_atomic(2048);
-            b.clear_bit(2048);
-            b.clear_bit_atomic(2048);
-            assert_eq!(None, b.next_bit(2048));
-            assert_eq!(None, b.next_zero_bit(2048));
-            assert_eq!(None, b.last_bit());
-        }
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+        b.set_bit(2048);
+        b.set_bit_atomic(2048);
+        b.clear_bit(2048);
+        b.clear_bit_atomic(2048);
+        assert_eq!(None, b.next_bit(2048));
+        assert_eq!(None, b.next_zero_bit(2048));
+        assert_eq!(None, b.last_bit());
         Ok(())
     }

-    // TODO: uncomment once kunit supports [should_panic] and `cfg`.
-    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
-    // #[test]
-    // #[should_panic]
-    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-    //
-    //     b.set_bit(2048);
-    // }
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
+    #[test]
+    #[should_panic]
+    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+        b.set_bit(2048);
+        Ok(())
+    }

     #[test]
     fn bitmap_copy_and_extend() -> Result<(), AllocError> {
--
2.47.3

