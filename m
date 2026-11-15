Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725296;
	b=W2kCMgsBY30tCB13CaJ2C+m4SuuY7hyVgSQwUpPMHVQRgibX21zblGbAyp2z6V50y9MU
	 TroOlmmaLZPbtYzOeAyLeRusjsnUsWJuodWh/kwvLJL8g7EIo4Ic981z+DKOZMzfDE+4u
	 K4O0sk24TFujSHU9wYpLRnGy34X7G74TCFVXVbfpfU5qLouZuFRu9di2E9svTb1PXXODR
	 k9PQ9B62Y1kNY/TLuB5UI8oJwAbAch6iB3BuIHisuwL/QKpJZuD2r4a51cFfXbhDg1Cxh
	 LtV52JVW4QwT9d/MQ7oI6nbjF6syWZ/OK7MHPFiSBrcQR2MmAeOTgGdSJ1YMRgp9leQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
	b=3x61dRzYm9oSuGny1SKUnuDLWgtjEhR+e8RV3Iea54hv82K1Lq7Xw1IGjvMzDDqnXDoA
	 X25tdL8vG92lI50P/5/NJz5U0BOlSS6k3MZ7wHNnPwDLfB/1rYReg8xo+JYsR1leJA6DH
	 TQXY8g1CMhle5Pr4dquMaWwnpnm/Wtjr4XJO/5EhYMkdV64lkn6rTv1+7Ge2h2atyDC07
	 n4IKxMmAsvmYlpZgOQreFg2k0YWbPHACFxagQB6cyBB9Kb+eE9qCngZHed8XbtcJ9KvN8
	 zHDdLwt1kMKL8P5nhlJ5u13j8HEOgfjUY3ktlCVwZoJT7D6NoHGFH68n4hiDyERNhVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/WRPb0z";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47028606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47028606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/WRPb0z
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b179528d56so1110154a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725294; x=1795330094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=k/WRPb0zHWBZf1QiP72VaQpemhqNKerApg2KK1po+DTMJKAcfP6CVsyjWUXKiWkqWS
         oYl4wtKoQPLWlq+UIhnicENs1ZanTCxO6GcThB7fUwj0sIvEFY7UIzwkM4bxPxqU1tgp
         1ZieLik0fruRBHQiCVEJc3ORgY3XjuqNSobx6OKZdDlWym74jUPegxFqHvkWatwi8xRn
         Q+SJhGnCU05I3iu84fHcEapWJwda9STXKJbe7+szKx6DmW38cvPU7+l0yk3A8LXxP46T
         ARzhyW+IPmYxxCnZ2+PHMVAjWvHuq0jK2HgC5J3xVwg55pxXD9EkL/CeXF9+35leSOZ5
         u6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725294; x=1795330094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=LGK6M6HwGGLvkBCMUqnBk0tqM9UWDWXA37ImBYO+c3X3lHpPl2WjbOlgFXrUP7Qwqy
         edswnJY60Qo5FV7reNRFuJjyfQbGEpzlD7SnrYIquxScm3T8SIKUkHvdP2pfEksw2bz1
         cRz8Z4y+sS+smEQqX4+ovD/6cNuHtc8zwkkJhLUnbxtiJVs6w1Ukb4HzB2BU9dO/5MiF
         2QYIhElui13xe95xnAUBLsuEFK+4x1gVlQIALl4wqx6ea3vud2/Rr8UR3V+/QLjxT7kO
         2TZFcFy2krkSR0lbhHeDmw1yfFVzgZn01DPc3nsQOly5N+1L2Fg0sEeeXEUKn9TgXEfR
         6IbA==
X-Forwarded-Encrypted: i=1; AL+hErGJ/tLfnEc8RQRzaIOjtdCMNrjVfHRR392KjSLYbLVgw2zl2anXtXOfEuCkmGWozTEg0lT5JNam6aTxeMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NcPzsi8cb6ErTX3jCLiwOZwrKoO9YysKgg2hKA4rwxjk9+m7I
	MHj+0tocIHOfknR0TJpnfhmjhvtGnrxWJ5gEzTS/DQM1xcfU06d6sDjf
X-Gm-Gg: AYBFou12SQQPcVzfq04vHpqsWfTPhQYu5BKM5VsVYbGv8G6PhXdxa71rG6aHpQV8S33
	a6q85ydYJPDznpPClyL5sG4FZAhClJSDHK4OUK7eyZVKbqRIBaXNE7n1EgK/gb0Uk2QMWEk5Zxy
	Ssy4X0HSzznhhXxI1d4yA5p1cxZOxhJfezu6oJ1QVU8rpoWKrGYSTLIEKSsoO3qQarP2XussY4W
	uv4WObsducsM1ov8XRTetDbtlTn0F743DoYe2Yb+6u/m27bjccwRBuSeAfjx8mFcGTy6IditjWp
	Qw9sJmwZRT8z3lL3N4CA8aLiyDW7PlTbu861KozK+YAm3BBAv2nhbVdzjs+2dwNP5jJDcKi4KXj
	j2n1ayXqwwRVwe+EcIIW4y4q1jBBkBOJ4xTcg32VqZR3ELr4TjdVidRP5F6sBE+3498n91Lke/q
	OkQ/w5uya1LT77F3NAgPrnsQzxhX2X+kMJrHL9LtIBtD/3jUraW/YDSN7dbvw1yvROjOrl/PyXH
	hapTdhTPxm9FhkkFMbl3tGUX4UTNCra1INmWYWhyE61OdIYY0jHNDg9oHW40WaXCFlJMm+bQ6K9
	wZteZyhtXpo/hc4e0SzyBY9cSQMHIUSJlxmD8fHEBgtvo5sSBKm6BElgtJX9Q2/vouZPA3YaKi2
	9xL5eXdynkr71uEYKiKXESzwyPHgYDc2ADvPaT7P8KQT2Ppn9Ucze8yzn
X-Received: by 2002:a17:90b:3806:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3b1b0b53ad8mr6483603a91.50.1794725294505;
        Sat, 14 Nov 2026 22:48:14 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:48:14 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sun, 15 Nov 2026 15:47:38 +0900
Subject: [PATCH RESEND net-next v2 3/3] rust: net: phy: pass a MaybeLocked
 device to soft_reset
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com>
References: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
In-Reply-To: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

phy_init_hw() calls `soft_reset` both with and without
`phy_device->lock`, but `soft_reset_callback` hands the driver a
`Locked` device and its SAFETY comment says the lock is held.

Pass a `&mut Device<MaybeLocked>` instead and correct the SAFETY
comment. Update ax88796b_rust, the only implementation.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs | 8 ++++----
 rust/kernel/net/phy.rs           | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..88e6e3c88b44 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -30,7 +30,7 @@
 // BMCR_RESET bit and poll for the reset bit to be cleared.
 // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
 // such as used on the Individual Computers' X-Surf 100 Zorro card.
-fn asix_soft_reset(dev: &mut phy::Device) -> Result {
+fn asix_soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
     dev.write(C22::BMCR, 0)?;
     dev.genphy_soft_reset()
 }
@@ -85,7 +85,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 
@@ -115,7 +115,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
@@ -127,7 +127,7 @@ impl Driver for PhyAX88796B {
     const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 105a1b727a08..46602798e8ac 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -358,9 +358,8 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
+            // SAFETY: `phydev` is valid for the callback. `phy_init_hw()` calls `soft_reset` both
+            // with and without `phy_device->lock`, which is the `MaybeLocked` context.
             let dev = unsafe { Device::from_raw(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
@@ -575,7 +574,7 @@ pub trait Driver {
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_custom_mask(0, 0);
 
     /// Issues a PHY software reset.
-    fn soft_reset(_dev: &mut Device) -> Result {
+    fn soft_reset(_dev: &mut Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

