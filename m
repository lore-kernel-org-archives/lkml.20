Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D63CF021
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691285; cv=none; b=rpnfxjuhoQOl+T/LFO4o/gfeAFNGANrDKHr8QRlUXrRU4AF4ujRbFGkIExuOSB9NLEj33plnJgeSZW48rMZniaabCWeUuchysqMSt/NlKnD4SLP2ZS31N1FNiW6BHMmqTuZDjDFOQjSufFai/zVf2xO3VDBNL7obyB0Bble9VWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691285; c=relaxed/simple;
	bh=iQpFxkadxuZthWNzpNDmq94Hthwi+6Tsc7gHXxzEn3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMXxozARIE1nH7sqYqwb7UM8PZFhFBAFSslCLf31GdhTBLH80HGZ2/JtEKSwywjjbC1cw3O6y/Ds5oQCWr8jFt8/g0xRUhwA8iNFxaLT3Oio6NxiifKfSjxE05//edxejqhnoU4YNa3uRWrZ/U4PC1cGXS0hsd2051KxN6EO6l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aexIREdf; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aexIREdf"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347866278b6so1086948eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691283; x=1791296083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=aexIREdfFdpMU4S/MP1/ojM9Hmaoxnnh1mnqYu6J7K7CrWpdXo78zi/JzcV2LB1bYm
         7fKussB9dcfHIKar/jN7CI0rs58VUAHTXvqbGHmAufJwXRQWVrgl5lD+Ii13fZVHlv6p
         f9PbYN0soS8BhY/XQR4azlnWgiKuasxMCVU8+Y+FjrFbZbhx2oArZI+ue7Q7JiQFZ/Yx
         JlZO7krkmZ5MwcUDATpr0Q8/Zq5dKBnTuKhaea2rcWSqDicXwguO6SeLuMxZbb7o3qgi
         GnHfdtfmVAH/iTeRtT2QZwXjIUZ1dG6RIqoa7bOHB6iMtdu+LH18NYk77ZnW8OVvxlF5
         cgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691283; x=1791296083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=iIHNXjobzIWy0LJI7lwurUUEDKsMEHHQnxyROLwBA1nihAhdaSHssZin7y0+xR71xv
         Zc+aNnOD+tI29S9MInLXCIZRdnwOhWX7DybWOz3i3glvk4GXQBDvpJfAu1QWalFESi6I
         DDR+CUSA78mlspLF1P+zWBmkZuSGsfjTJBBQKXhpB1XAZwGjR76lxdydEoSo3hK5Spa5
         Rba+p8UQNCDI8vCqewGyC/G79zaWa5vJnn/+rxt5D+UzZnYQltheqxQd2C23Agd+RbBR
         6cwXc43wEfH7+41DkK5kl9f0qwXY22DVvbmt1RsTb+6sprMmB3ZHZD0KPhBBm9DDKgPf
         jyPw==
X-Forwarded-Encrypted: i=1; AKwUvBwTtRa6GBTAcU+2H4126jyHJRGz5z2tWePEnfcm3zFrYisY1tcMbIvusgOqb9lseLtuVqflRjsk4psXwuo=@vger.kernel.org
X-Gm-Message-State: AFuF++lO9i89F4TjPx15i74Tiszu7Xu4hdIQBt0PH4nbh7Z8cgKoYALd
	Uqyw83/yPJa3K0GEOuirIuS8UOH3hrEuC7WGfXDZTg4Ol/g6ToI1rL8=
X-Gm-Gg: AYBFou0R32hf9SC4Iya8+jpCiLOnxUOIitIwkPZhEIZZ0JaAauHNBlv2VtnmqNxlDHc
	hZPkt2melDS0/8QDqSOeWbm8/K4QUSnpy1wKWvdzIUab460XZ8XT/cqvN18falRvOfBja4nVQ/T
	mZB8AXkrim+3WCNBKpNuDLhP72yn90Tbh2xAIahEhe69j1okloNNUIsNuxf06wZgTkRPDBwGd6m
	8PdGa5+PkBJ/1jCPGILz6kbgvmKuZ1IFx+khX0fxS8hJMHtGQFedls/xWD+xxEQ6ftPl1EssOi6
	6W/6fEq5WWm6flCjMEtz3uapAEbh2aDGFyHNi7tpYJjR3R40IdPMHw0tRT1VfHsECsytDaFcv5S
	k+UHCJfVZ5UYuFYJGX5ct54d8BXDvJ5LfMOOZ8T5DVUJt17+DATh9u0teJv5MIN5rmFBpM4cJkJ
	14wrtb19U6x8gb1e64Kj/M/pTIyv3RsItggHZLjYLqMfBeG9DWPkMxbgykZa5n9DoULC6UV8E8H
	zknnxNN31pfLYSsh+yB7ZBw+EQWaHy09qHJvJf/NwqPg7BXcYs+sBWnEwoi
X-Received: by 2002:a05:7300:d0a7:b0:33e:4475:5e02 with SMTP id 5a478bee46e88-342700be32fmr12739592eec.5.1790691267018;
        Tue, 29 Sep 2026 07:14:27 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:14:25 -0700 (PDT)
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
Subject: [PATCH 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
Date: Tue, 29 Sep 2026 11:07:43 -0300
Message-ID: <19080a499f705990382dfcb850a17d71689f62ca.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
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

