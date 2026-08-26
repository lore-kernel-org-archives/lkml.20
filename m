Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8266463B7A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761906; cv=none; b=cpRfxKyzsHeTObZvfMioazrhMrpFPs8dlY5q8yn0zK6DcB9jOTFsdYGBpuKGPX4RPmynHjLD9wL2WC5mJMH61GHddmlx0j0U+7JFoNWJIBHV+dcuTRD6NClAxoOh6E4Ibo+0KJXbYPmemLE5l1wwLfhUUjP76MdkdqaspEo8wGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761906; c=relaxed/simple;
	bh=5JUivoyhL/eFA3z1wzR8eXGOYWpIX0QOjpm+5X1M89U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB+Q2y76dCRu//UJi43HmsDz8YlutT2SHAHLSf3Uefed1XHyIjiRno8pNRug5CfQ/JRsz/ziaJj0TYubnZ5/XrMJDrDCw3rWpZGLl15/lNaD1M0jtJfpTVPzBIcMvXwRgRUc7VMGKtqB9c2sCe6oPLC761zdCzeWm1hdMCP7U4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Ik+m5hoy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Ik+m5hoy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1118785e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761903; x=1788366703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNZLQEVLi7AF6T2ecrRF6uxN2Gce7/nJnEoP7xr5640=;
        b=Ik+m5hoyKNP9jH5UXNyP6CMLE8Y2NjBZOJ83j7q2PKJxmbN4zUuRjJNR0GDDnsLPPU
         fYxSwnO/WmzVsGlDfvDfu5CH28q0rEjEJOEFsfVvEn3ROO6w7qenkuTPNdZW46aiehBc
         o6BAoE8hAEEva1KFCyFmLHoJtLjiK8oO0LAvUF6PkMensV5D0llhHVbR9zcAvknTgxOR
         buKZBYn6CWRoDdDhNv58QrwugTSFhjhUy6axZ5Yh0t9iz++rdL/hCGjxOw6E64d0m7Pu
         vIFKdDHpKpVKpS1U74J0rt3UxK6ajzTy6t24qkNqseB+sp0y9SPhXHc2852ov24juBVR
         sqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761903; x=1788366703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNZLQEVLi7AF6T2ecrRF6uxN2Gce7/nJnEoP7xr5640=;
        b=qBLc1gc7p5s9+NPyIV5Xqb37GCJNOprUG1zJA4KynV57I8cMFV0gkgZyXaFAsGK0/P
         Z969cf2qLVI2MNb6lWXxosipKHeHbSNWsY6YarUhDjaxuTniPAJP2KI2ZSRdSK46MuJG
         LmR/EqR23H5R+q+aOWNt8jN/eKEO1DDCworh3bG1byHzR/emoY45loGmOxzIlvjNmVBb
         tgNfQqj5kvcy3c+2miw/wlFzZBOriPFYwdKGO0V8oiQrcaRgGaINQPRGz1TeECsde0K1
         LjSHRbSpfQ2fvj1NMihDBWseHy6Jr9JQ3aXrAw9dYeRKcofHRcsFKWF8yEZPysCWcGBH
         Q/GA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb7A27hTFgWYNK0SdW4J+EjbcI2Ybfv8fepZM3D/pZ8u7hQWlGI1hMjolVJFWcqqd9rgQQmb1/0VW7kJs=@vger.kernel.org
X-Gm-Message-State: AFuF++lI2qrSJ+nOaKQkmexHZdDFz/faB7Ju5I+Ha5WaY+8aw7MpmT64
	SKeSrhR7jyxpE2KPHw3UmZq0Pzb+5lH+gmPV3xxchmNkFjZuNZl6IY/DXPANiGC6tA==
X-Gm-Gg: AR+sD10WwUB1OzHVfjR73C6doPLclWF8m++nmFXNtCEZyGnHW8ZOjmxki7Moca2fO2C
	ByI+y5wEPdZBu+y866o2lBa6YTEYfTvEJn7XQJ43RPy3KVbi+IMyMFqnyG8wRJrKPQnqJf4A/+o
	nR2IpxUm9/ahv3wPa8Z7ipi/VL8ZhuAatULIP9fYI+u6ysuhm4TINgxESflgffFcCMGHrwybOHW
	f6Lz2Xc/MT/HUz3umSgGLLh+eyMWVKLee3MdBmhuVI6Mrb9ziXqWBEOYmlqv+5hl9Xd8zA69YnS
	M424OUOGKdOIXTu3qLBDSAOcyaESK9C2oYBFaeAgugr1JDqiJfCoFW2ZuiIjNP7EWf3ES/GbmP/
	eQxoIyMurrKGMKXQtpPfJErADj5cRKG2NN1h/cpPGNlQlTmIYF4yEAVaTCZfiUzUh2TuMk7mcLY
	/HxGxHDVRbGibVMCJBXqfbhwZtqMrvVdU3E6mZC+kiGEXonHyXTtWoRWmS3B/EjFKMv3W4FiMzz
	WbkZcsCF4sD1sGDZS8o825lRpv2SCI/vUZA
X-Received: by 2002:a05:600c:860b:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-499dc6e0040mr88950875e9.1.1787761902407;
        Wed, 26 Aug 2026 09:31:42 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:41 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] rust: usb: let a driver keep its interface usable while unbinding
Date: Wed, 26 Aug 2026 17:30:41 +0100
Message-ID: <20260826163101.4168-6-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB core kills every outstanding URB and disables an interface's
endpoints before it calls any driver callback. A driver with something
left to say to the device on the way out therefore cannot say it: the
transfer names an endpoint that no longer exists and is refused.

Expose the core's soft-unbind flag as a driver constant. Setting it
defers that teardown until the callbacks return, which makes cancelling
outstanding transfers the driver's own responsibility.

This matters to a driver that leaves the device in a state a user can
see. A display bridge that simply stops sending pixels leaves the
monitor lit on whatever it decoded last.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/usb.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index b2a0fb104ddf..1d8f5bc8a545 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -107,6 +107,7 @@ unsafe fn register(
             (*udrv.get()).pre_reset = Some(Self::pre_reset_callback);
             (*udrv.get()).post_reset = Some(Self::post_reset_callback);
             (*udrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*udrv.get()).set_soft_unbind(T::SOFT_UNBIND as core::ffi::c_uint);
         }
 
         // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
@@ -474,6 +475,19 @@ pub trait Driver {
     /// The table of device ids supported by the driver.
     const ID_TABLE: IdTable<Self::IdInfo>;
 
+    /// Whether the USB core must leave this interface usable until the driver has let go of it.
+    ///
+    /// By default the core kills every outstanding URB and disables the interface's endpoints
+    /// *before* it calls any driver callback, so a driver that has something to say to the device
+    /// on the way out cannot say it: the transfer is refused with [`ENOENT`] because the endpoint
+    /// it names no longer exists. Setting this defers that teardown until after the callbacks
+    /// return, which makes cancelling outstanding transfers the driver's own responsibility.
+    ///
+    /// Only useful to a driver that leaves the device in a state a user can see -- a display that
+    /// otherwise goes on scanning out its last frame, an interface that must be told to power
+    /// down.
+    const SOFT_UNBIND: bool = false;
+
     /// USB driver probe.
     ///
     /// Called when a new USB interface is bound to this driver.
