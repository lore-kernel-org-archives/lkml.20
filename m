Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911810;
	b=qUNBJNayNTLf5dGVFWOBFQNfnPjUeHUrjR2pN/YRVmXaYmRcj4uH7qmNAAH1d3Ncy0Xv
	 tZgJeGXH3WBG31nHP6IdyOmMGjPXcLmLIPP6EPC7dIfgG7btq2MHMUi8zTUEvQN6/YLiv
	 PcO4tAZjmVRP9E0Na2uC96nN8kZpc5T/h/wHqxrNTy1MkHNJbppFPMxlK0yyhuVWasmVt
	 veoqiZ7/PQphSuiMG03LxCS3z5aO+zREexy8/3bX0G86eFd83OEOekQjVXGHXO9hFUol9
	 Pke7v6eBkUHBGYJP84VodWbyvGzsDcqID5doAvuTdUUJoP+LQ7cRmWMnGGP2Ucr5m/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
	b=4nKhkl957ycgyvaoji1PeMDFRljN0MeBakoiRkjsguIVQEAHawwhmIrt6RUIWrB+TwYF
	 lxjKRC50UTCgL954EUtdvDOsQrrHXmRtX1joEyaUxGnoFIk5aM7nZBsTj2Ig2+ksTBhyM
	 mcHbHg14VHVP8ddEDUdjuUpE7p33D0P7SFLkXVQFoMHuROiVEcubt/ZRxDg5sMLHAdIC/
	 GU1fOeggTpp3dz/tKDdPyGV/JkdyHgnt+L5t1uVOdIQU/VwxvM8njIhWd7XREr1L/h8At
	 2eMZmbt4BcQuy+d7RDFcYeGu+db2n/9fHKt9JNf2YGNrVlPZeprNcphpCpDaQViHLDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZAEowsV;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87E606A896
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F87E606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZAEowsV
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cddc250d815so1691336a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911807; x=1795516607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
        b=MZAEowsV2cBeyc8Basz0ndJNuq+fSouAbd4BWxc1P2a6tBAdKC+/WD398AcSntUbCN
         oYah99mX5iPPo2+ewqIVO14ewutqJNlxJAbYoPqfa/SbQguZ0oE1W056QRiz/3nzNT0N
         8ttxUNldHTsX7Gdpsk8StnGAY1bHACwxQmfcRQhQTU8UVizyYWC6Hl+J9RUgO49E5Oqw
         XhVW1q6Xh7qj1/SVGANUWY24hiJfdDymL1hmCjK1tL34QW06J6pqIqNntCYyPYQQet59
         Z0xh8eE4DniVFereFmFly6t+PYWS6Mlo6YGrrWE5dDdwH9bdb2qi63dA7ockSpUwtjgg
         Lu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911807; x=1795516607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
        b=kqiu9HoAIdJSJu3X/ne98X+eMrgUTigF5XXGXiaslxf0vjhiGVcWZGOZCkPkg9ya09
         TsxoXmlsHcBzSofqXiBqNbnDLvFaVJlzMrbbxgyvvgR+aPJw27UzxAvTYU2ATAxQZT7s
         0C/sF9Rldy5qQG4+z9JOkJ/rJMYbkIVApErxrAQ+ANa7pjCfThbHoIBW1kJW2Lu1EMZX
         Xo5Nd3bb+irDSoGQtVFL7qmihPx2//UCbOqJTGT7qECj0estr9fdU+He3itdTpJsjQoY
         3HGWVTA0qm1L4k7ZhrerjHQx1WnPEIFBgjl2RmSA6haNFKkaVzuMGPLEbOvG7oRXm30V
         OjVQ==
X-Forwarded-Encrypted: i=1; AL+hErGctcG3Racm4xrwZOAwrP+n2S3DW9eBqdopW2a2qu/tR2LPE03vzkFI431FeXaMuRrUvwisGTsvEyGuOws=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+VaGQ+wFbsFBRBHsyklM3zfQSYbgHHrizZ9g1nPxvxkg2ePKF
	nCKjlozGxrZxuVJ8cA1KkNklXgxu8r3mg80L8jGMyLfGmhkMH3jIOrHa
X-Gm-Gg: AZFdTZeQeKxVrFXBYFyivVQZDONZQ67V2oCDGyuZi/VeRTRfSlyR0iFm+AXqIv38+n5
	YeoIgqKaHjhL0+WnP6IzGOECZ6PZ0llWe7elYDRsHUjNj1iYdgKkijcZLQ/ISwwHsfD8S34JPjp
	mxKB4gdQkeliKn2Dh2EN8USWYuBvaCanjF5liYK5QePxqO+009qtx+syoc1/y6lt8Zl7EInDnth
	AfpkYoh3nByAQQ45I03I2xqq5Kjhyg63cm4zsFyDs/73klIgAXAW2BBlBLxanP7umE1s1yXo1o9
	L03T00W8ZyBNl0wzV37Yrj8ATgsunHXIQxZbzF9Cz2LTnTebadMnpX+/wnSn6Bbekfenlkei9VH
	eSoxS332T5rPyoaPOifkuPIoEHWQmSJ3VEaMLmx7o6Fe5kXOahFc/EqCViR1Rz3KE23BdJaRULr
	XghpAD9yFGFjRDWUIWtqpAnA0/de6D5GCutiYxifN+fg4JHyeyZTDONvubypXxC9D2cqYFNqtXw
	XbuucAvoOrfBAjys/pVsybW+8C+KRwcDj5kU+ULzIKkf56Cs9F7CyvqlrPIToWxG/0pyMyFronE
	xStd0zaPKAsGvBd3NSL78PGDIRgxHvR8gaPQWQC58oen/XloIyeu6H8rO/CdCqCbmqnbd/2CPKv
	4+9e3FrCYFfBN/xGX029D/cZUEtfAMdvGdkxqu643zdfKD/IVJ23yCxTy
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12706368a91.18.1794911806841;
        Tue, 17 Nov 2026 02:36:46 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:46 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:21 +0900
Subject: [PATCH net-next v3 3/3] rust: net: phy: pass a MaybeLocked device
 to suspend
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-3-4e183a7366a7@gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
In-Reply-To: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
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

phy_suspend() calls `suspend` without `phy_device->lock`, also right
after the state machine drops it, so another path may hold the lock
meanwhile. Yet the callback gets a `Locked` device, and can call methods
such as set_speed() that rely on the lock.

Pass a `&mut Device<MaybeLocked>` and correct the SAFETY comment. Update
ax88796b_rust, the only user; it only calls genphy_suspend().

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs | 4 ++--
 rust/kernel/net/phy.rs           | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..498704f1ef9d 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -77,7 +77,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         Ok(0)
     }
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         dev.genphy_suspend()
     }
 
@@ -107,7 +107,7 @@ impl Driver for PhyAX88772C {
     const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         dev.genphy_suspend()
     }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8cbb4c19dac1..4b7b3ad09059 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -395,10 +395,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_suspend()` does not take `phy_device->lock`, and `phy_state_machine()`
+            // calls it right after dropping the lock. This is the `MaybeLocked` context.
+            let dev = unsafe { Device::<MaybeLocked>::from_raw(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -572,7 +571,7 @@ fn read_status(_dev: &mut Device) -> Result<u16> {
     }
 
     /// Suspends the hardware, saving state if needed.
-    fn suspend(_dev: &mut Device) -> Result {
+    fn suspend(_dev: &mut Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

