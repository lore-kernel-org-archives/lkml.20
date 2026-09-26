Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88A537F723
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440567; cv=none; b=EYfYaA8fmozN4gbgxyB2sAxqfK+vaNcKfp3TafFWIhhptwm8OcZDxHB/Taq4wnjMfgIpkSiXV3W0g+aSV5HLVxRAgQXYkf99P0NdPEGDUZQTgR3H82ddjOOLCbD9l+PwjMfjpfelBh91enWQsfdEYANltIabX5Z9x1t2LXPC83k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440567; c=relaxed/simple;
	bh=homsJuCQjKnZ0xNxouQDRH+hnm4JjTgYjqEZCArzYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqxvEdBotGn+BAZ1t5gAb9+zstSsNrWcArBp8y1kx+Ti9SHpWhktfypiE1ZrQH1JauXpdrPZ2LWJqT+vs4a8XXIWvlXJ7t/t1BLdob9GGyUJwZpELWTYkgzeb9PP7FtWi/W/qiaTmDoYvXkjgZk0PoL5+HaX051KiINK8X3kiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDk6RWCO; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDk6RWCO"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so747154f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440561; x=1791045361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=iDk6RWCOBJSBW04OJUhZECHaKyxqjcKQSSR4qMu3CLMP2c21hdHwXjduwSW1uvg6GP
         g+45Zch6/ufh7FTJp+rpyWG7PvLnvKXp3aMAH7b+ocseRt9kUA7a/T12PfeMujaG5pDv
         uRJuapewlnnhZ/KyViJ0yg3EXQdlsgVTIX0wTYKqeq1O7vZPUxOMbDiRQguvtn68DJc7
         pHtOSH1qTr1Pbea57l2PCDf+8n9wjoms7z33nBO8Mz+xUT6FrHmHD9xzXonEN0X70830
         8ua9oO0bgTl1oIFKyYU06qEbaPrxqbxxI+7V1HFZwyHWT5hDF0CI4m0WaADgl9uJyQin
         h8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440561; x=1791045361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=zafNtbCP6VyFjKlDf0qMgMz9IauWred+Ke75EmBm8SFNSiAGXAvEP/2m2Utj3UpKDx
         B3CFea4zg8Fm6Cw63U5vaLinmdi5GRfBTAFdMoDCnvNoqvqJ/QJ3DHCVRNOjDqCfrefA
         I7RcNn+qF9EUSubCQDa2VOKiRw4HiM7iDAmiyC80jnyVcP+q+ExuPoFodQfrszd+7LhJ
         ZNbdTXUtM/kg3OKrj3rwrN9HOS9wietTbBpCVOMWAFxnthIxolkfjTfH6PAeLMLTp5p3
         /OhL5Ajh3mWrnzTrTJL5ha4sXJbdoiYbMJqHdEixooNkYhtWS97r50zTne0IvDVHimnr
         trhA==
X-Forwarded-Encrypted: i=1; AKwUvBzgvi1gVYn6tNBV+QFiPtL6Jax9UHox4ONDZoulVyaQ6bfIV34z0sIpVNAV0EjO/c5Xpu8PfVe0h3/yfP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0CwExFcgT9BmS0C6mBSg8PWT0POdR+5QMeiTO0qc1ikFtKGj+
	Zj8qcbM9IJ2OJV8n0p3wCfpETOoWuq5iMctbelToGGGTT7qK2NijrGl8
X-Gm-Gg: AYBFou0PZgteF/8BRqua1ZgaVEoDCHNISqGyzDGrD+AWjhkAcLTER8wN9hNkQVa0Q1s
	Yd5BFuK4oSvKbu0BMGrhmcEV+8dQVTervuOqCdemWpqvtSs3szUULLgARlXBoYXRCx3IH0pGG17
	qDM09iTdTItdcBby3zHhHiDy+/ksE2c02aUvlv2lE/+1LFQcXG1lV+3YWMGVzuKs4BmSvkvKXYA
	X2ZHz8slvaJ2dKqg8PqBIVb6ETZt93XOWnd0gDOF1xXbpHnnEuG0KtGC16Mw3J6r45QFTRJFqbt
	Se9yR4Th7/XU5/5m7iWbSMLPsaJ/8gHzLV5x0KsAJD+qIv2xA2LVL/Ngfs3oMGa4ynepQW8bSb3
	JtmcPJFet3NmtBTDV4VgFv/UP/Ynyx5PZfEq9mNHSP8QJyoj6BMVoFP4F4Ei4CtS7hoKF4SZXLn
	EbiA1rSiwChzqfJPk6r2ZtoNzBN75J1C0Sk/T+kCzC4KBKFxrW7oucOBh288JssQrq4SfYDeecg
	bhtvA+A0SGryq9HtAu4q2dQWkwh7d1D4wyvEFu7dVYP365lHxFKbC897ZvGikaKc1A=
X-Received: by 2002:a05:6000:2383:b0:488:81d4:8bfc with SMTP id ffacd0b85a97d-48881d48c0bmr9652514f8f.11.1790440561402;
        Sat, 26 Sep 2026 09:36:01 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:36:01 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] rust: serdev: use DropGuard
Date: Sat, 26 Sep 2026 19:35:50 +0300
Message-ID: <20260926163551.52371-5-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the serial device bus implementation
with DropGuard.

Use DropGuard::dismiss() when ownership of the private data needs to be
transferred without running the cleanup callback.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/serdev.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7f8d..dd43b159b461 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -13,6 +13,7 @@
         to_result,
         VTABLE_DEFAULT_ERROR, //
     },
+    mem::DropGuard,
     new_mutex,
     of,
     prelude::*,
@@ -21,10 +22,7 @@
         Mutex, //
     },
     time::Jiffies,
-    types::{
-        Opaque,
-        ScopeGuard, //
-    }, //
+    types::Opaque, //
 };
 
 use core::{
@@ -174,7 +172,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             }))?;
             // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
             let private_data = unsafe { sdev.as_ref().drvdata_borrow::<PrivateData<'_, T>>() };
-            let private_data = ScopeGuard::new_with_data(private_data, |_| {
+            let private_data = DropGuard::new(private_data, |_| {
                 // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
                 drop(unsafe { sdev.as_ref().drvdata_obtain::<PrivateData<'_, T>>() });
             });
@@ -204,7 +202,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             drop(active);
 
             result.map(|()| {
-                private_data.dismiss();
+                DropGuard::dismiss(private_data);
                 0
             })
         })
-- 
2.43.0

