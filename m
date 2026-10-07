Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB241A794
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407931; cv=none; b=CTu7XLGdq+a2yAhfxNwGh+H12etqFL+91FWjUlQlrbvsJlBksP5WweaBXrVj2TMRwQlAjZcNk92PahmGlu+5p61ixdyedVZBwg9iXSku6ZOtHp3cKrE4QV9ElxhGfhoPPuI95nUXt0KM0KjyUuwWIuo270rnyh2YljOAgL6X8ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407931; c=relaxed/simple;
	bh=7XxVSODNvDqXDnLLzIpuDg4yDwUoGtWWkcGY+d7OGCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcvXdAdEpwbbKsRx0UWuCKm3yVLQi7AvYiIcdsQtYQEr3i1tlFdasPpY6l5Y5RJAjQK4offt8XBiiW+dZzVCrSuuO3TnOZT3YB3ngJHpE8Uf0rdamcCy2XEGk+JjEs3gIMSTJ0T9neLx/AKhaE61nz87qPmx9V7WaFQVKf7ihms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr8tuVmZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr8tuVmZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so23428065e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791407928; x=1792012728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCOgnzxgPsldEawW4qaR+rRqfBySYiXshFn8/j+fwrI=;
        b=Pr8tuVmZmyORH/lewgAjY+YVoK20fNehrHxHDBUpYjBz24eMvJ+KpFJaOnocCGP2K4
         4ekqBfE5qVsXlddUZYvg+7tyGdHKOivhFDF/y3JQP4QpMjcZzuwiizFIlTtgpIaj2gu2
         frjw2byVfH24Trvrnx5JD8SRyT+rVk+H3slrn+pLe+XbiUC3dk1eW1cwQwaYoAw3k7vN
         xQ5ERz1JRzgTCytmcr5zsKecqre5G6RgHrrni+pffFdpepwpPe3FbtDCwFJwRIFQn8bf
         ufeb2+le0mRtQsT8cvavnQHfk+tAR18BnuytwQk+Ymf1Ao27ie822AzXCm2wSYLJ13hX
         Ap+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791407928; x=1792012728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCOgnzxgPsldEawW4qaR+rRqfBySYiXshFn8/j+fwrI=;
        b=FTONTvFKKkothV27zKxPfiXWwplN+9eiZKnE0uopi2Yx2ydjaUoVRAFPb1p4h0CuAs
         TlxnufB6b5jjptyrsTNRVAL+JXPuutWiN/64SuH/zwU+gWR12Yi4fYgi7ZcyjZ5RKI03
         bLZzIOy3+ALr+9YBLcrrL53JL1eK9b/YRJG7vSjw/7f+Aoo6iOYsC2NhHVkZmUK9pzoa
         FMkhdkCqvTMyO3sUx8Z6rmAkXuA+eqRz0Z7CEA03yh0yw3Vp4D4IkqFxAVEo6dZ/L5p9
         ex+4DzHgdeASBsVAItXPmC3vWgHjIcwjKNjl5JofwmqqgFJq5u5fhsOSFnLTM5tb491C
         sc7w==
X-Forwarded-Encrypted: i=1; AKwUvBzFFOpWlzc8Y0zV2b5MvhPMWMpcHDjpt8V6coo/VpsoYR3xOtKsn1Srxt7jMxdoaQYjZOvj2IFzfaLCSB4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSvOWFNYXFkUnAIVFummt39JpOcnMXYrZdjelKmLfFEgt3VmvL
	fQqr5u3X0pakO/Vati7QaFgdm8XSI0AhADYSbyTjB6VoGLway9M7b1a9
X-Gm-Gg: AYBFou3zH74Cegsv/wQrumU7ejTCtT6euKJExSnnCoovU/t2M8y3aJ/muPrgJLxkpRt
	HdWufFS2MCarJD4wPeu22ugQwPRx4ZjPFg6RqUGwnMST2C69PSae5b6CCsAIT0sAIHequGtRa1l
	4Cnyi1yH2kt8UyB9F9udhL+q99y0Mp8cRDxaJAwMqNhLfQYTA7vEUFVnK4u6Eowic16nspz0FbG
	WigA4iLpnyMX1l5NkkVJlx6fkOYay8cSMn6vD7BybaWiUY9NV/UKbjFiG4/fv/UQgKE0T1//BJx
	t6H/c3jVIp64t5V6hUwGF7f8J4B799ltRLtUwwimRH7dJInvr4FcIQfN+wddwzVhr5AW5QogZwd
	MpismPmmPAAhA6SvepiE+XKooKfQCtflzcJCoGYnNsJqmf4yWbZ4dQXp8385yECzwUUqO9JC1Zo
	UI0LoQhUadD8O1Fvc7Id6lkTYdOxecBDDLo7sc7WR6QaJipDwnl2j5CywOE9PB8Nr2yxNq45Aq0
	EcYiHI85eJTeISvrxt1ZhS2RdOGuUfJwjntB4dHzi1xvvANyow=
X-Received: by 2002:a05:600c:4e45:b0:4a1:6c3d:cdcc with SMTP id 5b1f17b1804b1-4a18043b382mr55914275e9.15.1791407927690;
        Wed, 07 Oct 2026 14:18:47 -0700 (PDT)
Received: from sp1der-OptiPlex-7080.epfl.ch (dhcp-122-dist-b-107.epfl.ch. [128.178.122.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f446d51sm57964705e9.0.2026.10.07.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:18:47 -0700 (PDT)
From: spidermana <xuyiwen14@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: spidermana <xuyiwen14@gmail.com>,
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
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: drm: ioctl: wrap `Device::from_raw` in an `unsafe` block
Date: Wed,  7 Oct 2026 23:17:40 +0200
Message-ID: <20261007211751.2428111-1-xuyiwen14@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`declare_drm_ioctls!` generates an `unsafe extern "C" fn` per ioctl. Inside
it, four unsafe operations are performed, while the call to `Device::from_raw()` relies on the enclosing
`unsafe fn` body instead.

Both forms are legal, but the kernel builds all Rust code with `-Dunsafe_op_in_unsafe_fn`, which asks for the explicit block.
The lint does not fire here because the macro is defined in the `kernel` crate and expanded in the
driver crates, and rustc suppresses lints for code coming from another crate's macro.

The patch is to wrap the call in an unsafe block, keeping the existing SAFETY comment. No functional change.

Signed-off-by: spidermana <xuyiwen14@gmail.com>
---
 rust/kernel/drm/ioctl.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 64af9eacc306..5a2e2f4f0e91 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -152,7 +152,7 @@ macro_rules! declare_drm_ioctls {
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
                             let dev: &$crate::drm::device::Device<_, $crate::drm::Ioctl> =
-                                $crate::drm::device::Device::from_raw(raw_dev);
+                                unsafe { $crate::drm::device::Device::from_raw(raw_dev) };

                             // Type-inference anchor: the closure is never called but ties `dev`'s
                             // type to `$func`'s first parameter, which the compiler cannot infer
--
2.43.0
