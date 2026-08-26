Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7F404882
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762249; cv=none; b=lzjIj4XvqjtjsWLq7kV6iiK4PLWmXP2SL25SDb1N1WZ2pGeJuBmSX5cmaadM1HR0XNm34q0R+fp/joJv4TujjoIeqW6ZbHKiGfU1o/11Yc+B/QYGEEsnmnJocnGR9ftbsZSOohOcnWz2654uBmBaXG9ClfshFi187sU6BXRxt1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762249; c=relaxed/simple;
	bh=IgO/Oy8GX2mLKijlYbJqHBxo01d3pEYgrjjJjDkdEjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3kAjJjzE9NgBjXykBki4dR3QCPgQwdTZ/kzeIwY83k9wjB7lnGz6LVvJSWVKA9zXYkWSinK4mfTjbdvZNZ+1iBvOyPVO6lDa3qZellp8ajgpq8EAxNEbb3hocObHx5DBso0NvjJdhLBapMl/Q/GB641quPa9zZQoLqVSwHYd/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=apFCPZBs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="apFCPZBs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1163515e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762223; x=1788367023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdJB+7gpvS5WCvpUSsJAui6rgsKkc8CSJW/uARo52jk=;
        b=apFCPZBseM2Cf6E4OLtR1kJKheX2+1ZOD0aM+9io/PwChZDujasiFysexWzB6Q6/f1
         gqPlOszMoEZciJ74Q0MJAPutexEgRxy6g32Vf4umeNcBmUx45YklFehjmEiSCJMpyLB4
         a6aWVlYT0z2sgzJFhZv67kGAkyOekggSnU42INK41DsyWLhf6ulDS+slBQMzHpKJIzee
         IO9IlPJ5izw8C7ubu9ESl+tcvIVmRK3/xzlSm6/j7cE2hJNSL5DNcJhQk1GKWh3lTPez
         69n5OqGmYT5UPGG8rF2tAOyrzX3R7KUZx6/bn46xyZUTNVe+fSgZlcyNDqUuMtA6hKxj
         /kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762223; x=1788367023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdJB+7gpvS5WCvpUSsJAui6rgsKkc8CSJW/uARo52jk=;
        b=FuDeQU2CUFx22maF66sNOwt3qpdGhVGotcqu9er+ICubuyPM+mEDgFdzRLSDpae4hy
         GIXoY/Hd4TmRwcybgIgo3tdvQDo816CEWecgF/CE1gmifoSDRpbUsrE9sGZkhEqeK458
         4OR8sV5TjRGJSc6w2nKTQC69uLx+/8Mu5fq+fy7krgnEQOiUcBYl37cV77OEFqcVBvNY
         u2WpeiY7MqYsMu8EmCPcbLu4pzXRSc4tDhvfufd35XCnMhfTED724j4af43nn7WKd7t9
         mT/n4VcGS0DHU5vTaRu9oUR7IGc/txY4oWNJgVkeJi0LV7UWEcTqAe9s0kzYb6jkOOYG
         vAUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrhd6PTEkGuhLrBhOUeW1E1PrfRGDSofQKweE9ZKu5++IBy6fmgeDhD6yBCpouLc1f3BrfdmlJVMc+deyk=@vger.kernel.org
X-Gm-Message-State: AFuF++lpJO4knCi7qwxyrSw+y/JqzAUPr5G0+ZDG6QrFeA+0Cgxjtk49
	Khd/E34iX22G737mmegdyBeZTMwSO1gDVPCrCKk/exDpNSyZ7PCcLpmgA3ri+DpZLQ==
X-Gm-Gg: AR+sD10alOcRdENUVAsfgitgC8CPQSikdOIvLL0WqhKYd2Bws+yffuno4FPk7wDlaYq
	jebEIUfKsqOIREcNqiEYeGXzvWn/6OwfuDQy865FdaI2/P4WJMb9GGDH64lLWh7YbISLqcBth2f
	l3mjPt1ufpWOiGCQ+QF2WKAUe1gDQIhck1yKyRFfuOsYRydshWeuHJl8MY+fWuDGc65bPiB6aiz
	zxalmMEQb/IRUfap2ZPXfw97gOXcIq1J3GrQ/E4kMvnF9scs0+35U8oIHV/gz7/Qev8d2IUNNxw
	FIqS3LiHBneLSNF9f/ekJbY9pmeDF7KHCfDpuvn1OqXiOnqfXLqohubY0fHMs72uC2p506rVHwr
	mEUr8qP8b1IPM9QW4dRC+MJjT0YpdxUzWzGvas8yjOp9NbUISCC2iD8a+6X7Gf0u0KRyvH30Nwe
	p3MsZ1tmJYnWs7oKunu+kt3cJay8bAgffUX6OK5cYRnt46UpOd8WD5TLZlN5W3JNeqjs7eMNmuU
	Pm4WizLVVgEwffcJDpBaoCLLqMbHozT++IuPA==
X-Received: by 2002:a05:600c:8486:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499dc6e1267mr91011085e9.3.1787762223039;
        Wed, 26 Aug 2026 09:37:03 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:37:02 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/23] rust: drm: kms: expose a connector's requested link depth
Date: Wed, 26 Aug 2026 17:31:54 +0100
Message-ID: <20260826163359.4998-24-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`max bpc` is how userspace asks for the number of bits the link
carries, and it is deliberately independent of the framebuffer's
format: scanning out an eight-bit surface over a ten-bit link is the
ordinary case. A driver could attach the property but had no way to
read back what was asked for, so the request could only be ignored.

Add the accessor, and make the linear format modifier nameable outside
the crate so a driver that accepts only linear scanout can say so in
its plane's modifier list rather than leaving userspace to infer it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/fourcc.rs        |  5 ++++-
 rust/kernel/drm/kms/connector.rs | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
index 010823c4c86c..3a68af66f236 100644
--- a/rust/kernel/drm/fourcc.rs
+++ b/rust/kernel/drm/fourcc.rs
@@ -13,7 +13,10 @@ const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
 // function-like macros in bindgen yet.
 pub(crate) const FORMAT_MOD_INVALID: u64 = 0xffffffffffffff;
 /// Linear framebuffer layout (`DRM_FORMAT_MOD_LINEAR`).
-pub(crate) const FORMAT_MOD_LINEAR: u64 = 0;
+///
+/// A driver that accepts only linear scanout has to say so through the plane's format-modifier
+/// list, or userspace sees no `IN_FORMATS` property and has to guess what the plane will take.
+pub const FORMAT_MOD_LINEAR: u64 = 0;
 
 /// 32 bpp RGB with unused alpha.
 pub const XRGB8888: u32 = fourcc_code(b'X', b'R', b'2', b'4');
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 231857cc1f20..633f4f76a610 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -935,6 +935,22 @@ fn colorspace(&self) -> u32 {
         self.as_raw().colorspace
     }
 
+    /// The bits per colour channel userspace has asked the link to carry, through the `max bpc`
+    /// property.
+    ///
+    /// This is a property of the *link*, not of the framebuffer: userspace routinely scans out an
+    /// eight-bit surface over a ten-bit link, and a driver that derives its output depth from the
+    /// framebuffer format alone silently ignores what was asked for.
+    ///
+    /// Meaningful only on a connector that
+    /// [`UnregisteredConnector::attach_max_bpc_property`] was called for; everything else leaves
+    /// it at zero.
+    fn max_requested_bpc(&self) -> u32 {
+        // `max_requested_bpc` is an `unsigned int` clamped by DRM to the range the driver gave
+        // `drm_connector_attach_max_bpc_property()`, so it needs no validation here.
+        self.as_raw().max_requested_bpc as u32
+    }
+
     /// The electro-optical transfer function from the `HDR_OUTPUT_METADATA` blob, or [`None`] if
     /// userspace has not set one.
     ///
