Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164DC4A5C4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529594; cv=none; b=hU0nR2GNTXi1fu/aGxdOgItZ7Zzl4A0BymkhymXWUU3GOpYwJRAkbA7CJKu9TH12/YnW8ggNYZOLXI5CcNmiWdn4UmWh5NpX5AxgaFxondaebqG3FZqlH2CvOd4Mz/1Kj2NdgJmY2e3cSZh79hZSjkCrr+gFEBntxCaKC4GFmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529594; c=relaxed/simple;
	bh=m6CAE/76TRzV3kyyElyOiCVIZXdgvxUs4/XakeqgH64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YJLSa+QAYRCEz2GpSRJcmvYEEX9PcEjWxTYYbDFINhybmIDoN4ME0/nGSYyrThz/zCvZjPS0uIO/92n4O3amDRyBzyyHuqnT2OWJdIdx81oa3V3Epj5GVshRCaOFheh95rluW9taBtf5YDe732FV9X5Rz0sucVw2ufrsXZo6dck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldS1tPDa; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldS1tPDa"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86d43cdee51so12627877b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529592; x=1789134392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5E1eI2EQTTOSHZEjahKUxEQTbKv1V9kJEXVEsMI2UI=;
        b=ldS1tPDaSUR3H0wZCPYZeYk8PrRNxy8JRpGeFx9UtEk8fF63F3jUiY0KcmfpiDtoHP
         dgvH1VA094ABO95ZFXcl5fnyH393lY8/73SUwVbjjRHzHBK6x1r1sk5uiI5PBzwXE96u
         R3vDbIR8Ap1hIirp61wJJ5heP72zX+T/CT/MThMDV+GDXi0w+Z8t1wpJ7iWHx0aqdMzx
         9kFTFdJBXLTQY2Hs7S1/AXmJh5Ax+mZGufy9ywQByD5neD1ZooK+a7bqlIWBucreSAxw
         riQDh+sOnRcRmRqpU4SzrdIBmrpk2sai9ZwxRCxpTZnNpHju+ciovQUqLlxqzLQKNT5i
         VHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529592; x=1789134392;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5E1eI2EQTTOSHZEjahKUxEQTbKv1V9kJEXVEsMI2UI=;
        b=mdMfpr6oWe1JTaj8XY9dSCxJnFxptnzLlOkhYdqPuAnEoJgzE/RL2Hpet/Hzxh8f1W
         8tLfHu2wVo41LbmjtA8l/aNtmjI8sexAV76ZHetz2p85hbBEifmQqkZ8GfH8mLZ3mhXR
         6q9virk91Lz81YjrM0X45A79rwxQXe6ooXgoEiFSKdnJuZgOQ/nH/YGCuruCs+2ZR/vg
         TNRzogrUgZvvkiHto/waGNw4w8hBESetsK3gUBJiEL85PnE18YUbBmfRhqojVuJlLFnf
         oqA7CKsDO8jd366BADasprRge6Kr3bfA7d5+g6Zx+m1anyYHLdPNei6/aX8pDUbKLXmY
         139A==
X-Forwarded-Encrypted: i=1; AKwUvBzHtoJJN+DyT3kG6mtUeVxMwz/qr07YLPU17VhKrzyUBlo1CPHzBAXDRVcCTCtOCdDK01POSKJ8h70Dl30=@vger.kernel.org
X-Gm-Message-State: AFuF++mHiyCfqozIb6rdGMogkOOjaOPQPEO7JaFv++VfFFFdYSaTY3bt
	YVIl0hWmTqAja/b+kL1Vo3TLYQS0tYAYpZ/vEI7gpxWGyppnVrkfT6Y=
X-Gm-Gg: AYBFou2J+KjAAT9p5jzYuvj/wZVmakHEnnPAADXbRubyBVvDCO3N6oE0//dvv8YNB61
	bdOACIwmsBqe30d3Mn1eJU/X8g79+m6RnrH2vHp3Os2k+yh3/zcIJI6aEAeQN5QeRONHxPSc7wn
	JpL9Z3iWMLWpsnt1rMaImhnIlyDLgYhs4mPq7hIYvMVh28TSCUlDs5t7sUfP3x4Bd1kGex9yT7u
	1JlhrPhKcgDR63yLHiulks+ZVyAcCGQ+FdVvuT+1LtNww7yV3YsjSUc5ToxToj62rcgxhnAVQhL
	k5eapCdU5tBV4h5NvCe5tDBXNzU2R+mmTkApQ7lFTX8KhyYck63XZDqrXqFq8HjFueLWdPoaZbg
	2xV1EP4cSP7gQPzX6sH/FELE+gnYKYMv2pciBCmOCiy9lbeB921YUPVqMD6fUo1kkEH1BRgT/jN
	YETQKPzTq6BKPKzx15vAsk7zEbwh84nVqHpMC59AUrDRR3Z73YAko/JFYeofd4mzy0q/iPN1tLX
	Oqdyiq7U7+a8qxy6rFvuyCzHs9K9B0JuMdV1eg=
X-Received: by 2002:a05:690c:e646:b0:873:5bb2:6c29 with SMTP id 00721157ae682-8735bb26efdmr2810627b3.48.1788529591777;
        Fri, 04 Sep 2026 06:46:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a49a660sm18067947b3.27.2026.09.04.06.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:30 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] i2c: rust: avoid locking when performing I2cAdapter::inc_ref
Date: Fri,  4 Sep 2026 10:44:43 -0300
Message-ID: <20260904134600.340991-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation of `<I2cAdapter as
AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
to increment module and device counters. This function acquires a lock,
looks for the adapter in the IDR table, and, if found, increments the
named counters before returning the adapter.

In the Rust API, the `I2cAdapter::get` method returns an
`ARef<I2cAdapter>` upon success. Incrementing this reference count in an
atomic context (for example, via `ARef::clone`, which relies on
`AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to
the mutex locking inside `i2c_get_adapter`.

Since cloning an `ARef` implies we already hold a valid reference to the
adapter, the IDR table lookup and its associated lock are unnecessary.

The fix consists of bypassing `i2c_get_adapter` and instead calling
`__i2c_adapter_get` directly to increment the counters.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antinori.7@gmail.com
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Note: There's Trevor Chan's patch [2] (make `AlwaysRefCounted::inc_ref`
associated function) in review. If this patch lands first it may cause
conflicts with that one. Please let me know if it is better to make this
patch dependant on Trevor's one or wait until it merges.

Changelog:
- v2:
  - Implemented suggestion by Gary and Igor to add a C API and call it
    directly from Rust.
- v1: [1]

v1 Note:

Citing the second part of Sashiko's report:

> Furthermore, if the adapter is unregistered and removed from the IDR,
> bindings::i2c_get_adapter() will return NULL and fail to increment the
> reference count. Since inc_ref() ignores the return value, wouldn't
> dropping that cloned ARef unconditionally call dec_ref()
> (i2c_put_adapter)?
>
> Could this lead to an underflow, double-put, and a use-after-free of
> the adapter and its module? Or if the IDR index was reused, might it
> increment the new adapter's refcount while decrementing the old one
> twice?

I don't believe this situation is possible. When `i2c_del_adapter` is
executed in `i2c-core-base.c`, the kernel waits for all references to be
dropped prior to removing the device from the IDR. This guarantees that
no `ARef` is still alive when the IDR removal happens, effectively
eliminating the risk of an underflow, double-put, or calling `dec_ref`
on an invalid reference.

[1] https://lore.kernel.org/all/20260615201141.8920-1-nico.antinori.7@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trevrosa.dev/T/#u

 drivers/i2c/i2c-core-base.c | 17 +++++++++++------
 include/linux/i2c.h         |  1 +
 rust/kernel/i2c.rs          |  4 +++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ddaacf876dad..03ad1bb539e9 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2632,21 +2632,26 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 }
 EXPORT_SYMBOL_GPL(i2c_new_scanned_device);

+bool __i2c_adapter_get(struct i2c_adapter *adapter)
+{
+	if (try_module_get(adapter->owner)) {
+		get_device(&adapter->dev);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL(__i2c_adapter_get);
+
 struct i2c_adapter *i2c_get_adapter(int nr)
 {
 	struct i2c_adapter *adapter;

 	mutex_lock(&core_lock);
 	adapter = idr_find(&i2c_adapter_idr, nr);
-	if (!adapter)
-		goto exit;

-	if (try_module_get(adapter->owner))
-		get_device(&adapter->dev);
-	else
+	if (adapter && !__i2c_adapter_get(adapter))
 		adapter = NULL;

- exit:
 	mutex_unlock(&core_lock);
 	return adapter;
 }
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 14ab4d3055af..56832c8e58f5 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -907,6 +907,7 @@ static inline bool i2c_client_has_driver(struct i2c_client *client)
 void i2c_clients_command(struct i2c_adapter *adap,
 			 unsigned int cmd, void *arg);

+bool __i2c_adapter_get(struct i2c_adapter *adapter);
 struct i2c_adapter *i2c_get_adapter(int nr);
 void i2c_put_adapter(struct i2c_adapter *adap);
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..2fc818da80cf 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -419,7 +419,9 @@ unsafe impl AlwaysRefCounted for I2cAdapter {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::i2c_get_adapter(self.index()) };
+        unsafe {
+            bindings::__i2c_adapter_get(&raw mut (*self.as_raw()));
+        }
     }

     #[inline]
--
2.47.3

