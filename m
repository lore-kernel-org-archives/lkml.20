Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180819;
	b=bQkOgavZvtVVIXkIvoDQOsKPV6JaEHhaRuCT7HMhmeCa6UeI1NUlHRxvhC2EmMIgV4jg
	 PlZsUsb+c7dzdkDp2vnO8AiIwTh8+GSIprsCovBI6UBkOZ6Yz8QdNn23IqRM1AhQTWnHT
	 vXFjZ5uu2GwZR1OpmfMyCadjvKePvM4eDbP8gGIAQS/k2nmMK+VpEoFtx7JeqYlZ7cm7E
	 JVHQow7g8rxlopj0ZEI3X84MCWleuAy5b4MlLRFGLV8LWVs++Be1wBOd6NODp32VH8OXY
	 aYpHjlutLtcLYtV9grWHa25XWxf+AiKpAv8UWSSdLgEb26OuOrxaVUA9iXf0xG3WCqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qc9QNDM7x+nu+pbyI3Fb4dwfjZ18Z0ovze28f0XG1NE=;
	b=Io6qFf1pk/lTKHP1SLIrZqmuaDGbvgaMc+O7nOjDILrs14ngBYGjfPKWsymv0c6sx96+
	 OYzpuWU2b7A8HXTqT7Ir2qFyqMnd5HHy4fTK8/EyIa1AGhjpne0ux0fkCEpGaKNNhizbe
	 85za0eQr+btgHf/n5qBtah3dX5lBzokOxnXkXMAU85S5BLXxuCbaIKzXvUHqCubR8exBl
	 ze1n4qYqyw3ahg1RXmkTEnS+MyiELJOcc7d1bs58lR8ySSIHzt93VHTtU0LYhybJJaVOG
	 yBV47+fBFMWbdTVH+XAHk1OUyeTlnXOvY/19cMmoVwI1zHvN6+hZxlVW8pyrFd7gGTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hZtv7ih7;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B37A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hZtv7ih7
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e17d30a79so481039f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793180816; x=1793785616; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qc9QNDM7x+nu+pbyI3Fb4dwfjZ18Z0ovze28f0XG1NE=;
        b=hZtv7ih7RNGMRPSgtb8dlLDoJiKVkqYtG45M1ZwpO2tZOMaQZXLTR5aFwgCudP1LRb
         KgxW3CKawRD6tCKkHfTpeGsUBnp6Mgg5LaDO0ZHRV7i8NWIm8ve3Lrwcj2J1FrGQBUo1
         LNh6RweppZEzRTj6LElcOqAEODV3XZJihb2i06yfpRNVjXSRYVRBdOaAI63BGh+dU6wj
         XoNlE2JfrkGJ2V04hTzcntFXJZVA7TfSrPe3v5oFDyS2I7i67F21JiC+eelXSIMiyVAT
         QXoHQXAwOc8lElnA25NttV9FpodJc7FFkal3i7Coq2uafNNNGBsYQbnoysmybZn2Wuho
         GoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180816; x=1793785616;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc9QNDM7x+nu+pbyI3Fb4dwfjZ18Z0ovze28f0XG1NE=;
        b=fgDYOJ4d3BNnpTtkK+vV+FPm1chUWEJNU6Y0KdGujbWHXni/Ua7bO9blqT2kuuYO+N
         uX/KQM/6vZ832MRP/IEgcLg/zGk4fU/V949HuDdkYbwQoBDt55X33CPWNiO44gCEME/v
         9ujtWixVYwJupxGwti8JECUQw/MH8FAxuDsrvbrD1iO98JqvVT9hoBo7IaEL4gV2QLTq
         29Hm8FXEeV/msbP8fyxm2Wsqqvut0e0IK7YZHBP3UVHs6Wvlb0gbA9XnMMvBsU8acgVK
         DIeqzv+3l6I5iTXfD3BmY09Qgv4TibLkYqfBRixlRG5qPcOoDp28iclRjy1MRPzPlhkN
         tPXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfDXI+3WLXhNXV+AjzbSI3BYtqLZJomHRivp8uPG4tCIMMcawuGR6uEQ32aP7+xJw3NlOv5fW7zgEL9U8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp7NgvNGVojtlR3+QfJD7mWmT0xwFgtmUyMAEKtcr8TLqWUQk9
	UKVat+t5sPkQTuzhr5bhAx8zP7lDNH2JMfFQEXI7HM4EcBSWqtUiIecuTw0SzVdOE6zyvruAdtV
	XYfPwvTfZ8oKy9CZ18Q==
X-Received: from wmbjr24.prod.google.com ([2002:a05:600c:5618:b0:4a2:677:24c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr32574775e9.28.1793180815855;
 Wed, 28 Oct 2026 02:46:55 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:46:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAITE4WoC/x3MQQqEMAxG4atI1gZsFo71KuJC7d8xIFVSEAfx7
 pZZfov3bsowRaa+uslwatY9Fbi6omWd0hesoZikkdY10vGsKcDYcGw/jpNu/BHvfAQE3lHpDkP U6/8cxud5AQli0r5jAAAA
X-Change-Id: 20261028-binder-reply-fail-72919fee2e91
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5146; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RUZByvUcjyzeqZHggXsmkTssVcxmp2+6pk7Hv3i2Eyc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq4cSJODrtqV0yAebXWylM6jXo/Q6HF0dovNdpl
 bo0zkGjwhOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCauHEiQAKCRAEWL7uWMY5
 RgZ2EACBV/V1ON06gGEbZ9FGpAYO6YUrXOYrCsaLVvjEvkLzMgG8ZX6bDwjHvDB+HS2SdBvqVKm
 gcJCEPPGoRlOS+kUng4hUWKunyxxvYCL8W8pwPdnItuZaaTY8A3XAddPTwDM5lIn4ArTThx2jmK
 XVwvICSF7HXsOOrZVbUz+KUEU4ge9vIWm7oN9ixRKZOol5bcGS94RTFnP9r7cb2QpMgZBK0o49h
 wIuwk6RFbVY4vs+cAxi5J9GiY1n7lypOU9/cvXB3Nyf3HKzDncBxOs5IVJlZB90NBI+peyjo2pf
 naKlJf+oAtWjyuv5cYLPrZKZ9qEghjkDxW6viwuetHyXLc9KzBTdHNO7IjfbXLLnr/aLE6MSzHJ
 nU7HSoK5qyRXGb8TFVG3ymBJJ1FszdR0C6/LklwPhNl3cFDLDmTXCroMfHglpRevUcZi40hIYMN
 YDhDBtYTmujy/E4v5Z3DLqtsLR5Ik1T6k6IYKUVpn1ZVr+EBES3S13t0u1I3KOhLNd9JhaekOCG
 Gc/KAeKNcLlrnd3w0URy0G7X4JvWnb6o7GEVyG/du5aY8oT7evzm+f1YQUCTPkJuxrfM0roe5Zo
 gZxeiNdsRKKMqapZD8s83Ttwu2BocWcfDvH77OSEwpT2COP3L91uBZIKkfCfGPAC6g9dBmKk7SL E3Ty7XkpBn2vCTg==
X-Mailer: b4 0.14.3
Message-ID: <20261028-binder-reply-fail-v1-1-8b71d4daaf1d@google.com>
Subject: [PATCH] rust_binder: push BR_TRANSACTION_COMPLETE before BR_FAILED_REPLY
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When building a reply fails in Thread::reply_inner(), BR_FAILED_REPLY is
delivered to the caller before BR_TRANSACTION_COMPLETE is pushed to the
replying thread's work list.

In a nested transaction, the caller can wake up upon receiving
BR_FAILED_REPLY and send an outer reply to the replying thread before
BR_TRANSACTION_COMPLETE is queued. This causes the outer BR_REPLY to
arrive ahead of BR_TRANSACTION_COMPLETE, which is not legal. This leads
to userspace tripping on an assertion.

Thus, push BR_TRANSACTION_COMPLETE in Thread::reply_inner() before
delivering BR_FAILED_REPLY to the caller.

As a nice side effect, this lets us remove the now-unused
BR_TRANSACTION_COMPLETE error path in Thread::transaction().

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/error.rs  |  1 -
 drivers/android/binder/thread.rs | 33 +++++++++++++--------------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 89077c5baeaf..acf0aa09c555 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -114,7 +114,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             BR_DEAD_REPLY => f.pad("BR_DEAD_REPLY"),
             BR_FROZEN_REPLY => f.pad("BR_FROZEN_REPLY"),
             BR_TRANSACTION_PENDING_FROZEN => f.pad("BR_TRANSACTION_PENDING_FROZEN"),
-            BR_TRANSACTION_COMPLETE => f.pad("BR_TRANSACTION_COMPLETE"),
             _ => match self.source.as_ref() {
                 Some(source) => source.fmt(f),
                 None => self.reply.fmt(f),
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index f5965e838a96..4ce6fc533203 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1332,20 +1332,16 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.transaction_inner(&mut info)
         };
 
-        // This runs when return work is passed to the caller. This is not
-        // always the same as the transaction failing, as reply errors are
-        // delivered to the remote process.
+        // This runs when a transaction fails with an error returned to the caller.
         if let Err(err) = ret {
             self.push_return_work(err.reply);
-            if err.reply != BR_TRANSACTION_COMPLETE {
-                info.reply = err.reply;
-                info.error_line = Some(err.line);
-                if let Some(source) = err.source {
-                    info.errno = Some(source);
-
-                    self.inner.lock().extended_error =
-                        ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
-                }
+            info.reply = err.reply;
+            info.error_line = Some(err.line);
+            if let Some(source) = err.source {
+                info.errno = Some(source);
+
+                self.inner.lock().extended_error =
+                    ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
             }
         }
 
@@ -1450,7 +1446,7 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
         info.to_pid = orig.from.process.task.pid();
 
         // We need to complete the transaction even if we cannot complete building the reply.
-        let out = (|| -> BinderResult<_> {
+        if let Err(err) = (|| -> BinderResult<_> {
             let completion = DTRWrap::arc_try_new(DeliverCode::new(
                 BR_TRANSACTION_COMPLETE,
                 self.process.task.pid(),
@@ -1471,11 +1467,10 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             }
             orig.from.deliver_reply(Ok(reply), &orig, None);
             Ok(())
-        })()
-        .map_err(|mut err| {
+        })() {
             // At this point we only return `BR_TRANSACTION_COMPLETE` to the caller, and we must let
             // the sender know that the transaction has completed (with an error in this case).
-
+            self.push_return_work(BR_TRANSACTION_COMPLETE);
             let param = err.source.as_ref().map_or(0, |e| e.to_errno());
             let ee = ExtendedError::new(info.debug_id as u32, err.reply, param);
             orig.from
@@ -1483,11 +1478,9 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             info.reply = BR_FAILED_REPLY;
             info.errno = err.source;
             info.error_line = Some(err.line);
-            err.reply = BR_TRANSACTION_COMPLETE;
-            err
-        });
+        }
 
-        out
+        Ok(())
     }
 
     fn oneway_transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261028-binder-reply-fail-72919fee2e91

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

