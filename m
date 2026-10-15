Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9A73CE4BE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055996; cv=none; b=BYjLUK1sQtz6CxH5V7D354u1CVSZk0/9N7k9aHW+RVmiroxIaUDPSmPKFnks9/EFI4gi2+ZlBg01k9XbziRBhU17DKBagYBPXWBU6uguVn6fAOQClSfYF6tPoyQK4QRCyRxTLblDIQRiTbFKwH7YH2Ei6CTSSf+zvFaETJIUbl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055996; c=relaxed/simple;
	bh=g93epIcW60azoLDx3yp4OIFZSLVEl2jasHWiFTB7pJM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UP0cbwk3Y7dGV4SlYrf/kmT7y6lfEFLjN9Y2m5KFuJ7HPRDP52bu53b86Rz7QRjHr3twZVQKg2e9sV7xomTkaUsVe116a205vR2quCa8RbrIvbB6lNiBPUH5P+PVfCmpiDqxkpq4VvTDv0GM9Y+BxVQAtpjjw62A4uodoYxOJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jvQ2aZ40; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jvQ2aZ40"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so43835755e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792055992; x=1792660792; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9496zxWZi8AybW6ybbmgSCnzw0yLTx4Cx4ZgtgWlH0=;
        b=jvQ2aZ40kJBxMpz/TLbq/m7BcH8i/zVHWwbYPajvZGdK9dRJaCWcHEMs0h9ooI5xTC
         SHG/0KQqmm1tgDPyCw5WzCHRpA4fCshvCFkRtFHlCvdZjUTfpk1deePbyYDdA0KqhCGo
         KVO0bEHCZtWCJeWTu2/XzfDJ3HwQGfFU5+EjG3yGiVCxHz9Lj5rx6bUmoglHmrTmBHql
         eJU5z8gnWfiAyDXHloRviaCOOw+4kE1woWCXLZOZb3PEa2L3VZ0HAfsAGhU+/BntOu6h
         kOI2C6wSmNDA0JBGMQCHWNQRScUN79kPP4q9lRsezgLMRu3uP7mpXk/coJaZCTWS5+2M
         Q5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055992; x=1792660792;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9496zxWZi8AybW6ybbmgSCnzw0yLTx4Cx4ZgtgWlH0=;
        b=VPfqmWzTHmvMbl34o5CuFo1Mbp9qHFc4gUmCgXBWq8Frow+3mnAGCRKXV1RT1HMLsL
         tyWFcW8pLhprToDp9IwjmF3b9HXMc1866FnWwfufxz2NMBNFkog+4Flxx0ZqNxoWCkFz
         H7YiOTG+/0dpykl1ESLkjT43j47JdL/j4SLpGPPHKbKWFMjgRoejo4waSCto3hxX5dgI
         GAHH0YfUf/EybYi1hplKT25ptw6qjT2YscB+igfJ+q7PTnEfnhRToUZGIRpJDNnY7gMX
         18E6WSxg8bj0UsrBtebFYyvRE8jN90C6uVuSzDS9t4WDFac4WVhde5jBUhwJfKvDB8dw
         IRsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEycae3Ph1jGHS1ASjnKYnEEWeAhBrcs69RcekkiNW9OEuqbGVMuNNtvr5qOAwVugaryFTEHXZR4Btuvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNQ5+Qo7X09QTjCURSIcXW5RfGUM0x6BLZ6s3wQhC/vQYUZ0Ye
	0YZcHtQvVH6KdENNwd8fUzvhC9+7DNkMXmZ2oHD741o71Wn+jeTGsq3wOlCGmHRxbxQzpTrJZOk
	Hrt+Ghz/r+s3luz1nKw==
X-Received: from wmik5.prod.google.com ([2002:a7b:c405:0:b0:4a1:96ee:9879])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:849a:10b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1bd695448mr36444035e9.4.1792055991818;
 Thu, 15 Oct 2026 02:19:51 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:19:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKya0GoC/x3MSQqAMAwAwK9IzgZs3dCviAdrUw1IKykuIP7d4
 nEu80AkYYrQZw8InRw5+ASVZzCvk18I2SaDLnSjClWjYW9J0JI5FmTvAoaTxG3hwrJrjbaNmuq ughTsQo7vPx/G9/0AZrVeXGwAAAA=
X-Change-Id: 20261015-binder-debug-info-overflow-397b2d61a594
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=g93epIcW60azoLDx3yp4OIFZSLVEl2jasHWiFTB7pJM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0Jqxtq6wI+7UOyDbevffhsg1lE1T/nUBhnZ3C
 av2B+5vmDWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatCasQAKCRAEWL7uWMY5
 RnhZEAC6byVOvpchPmSPOeCXSPI2bI4mUSio58DU6DFA7cCIBOHcLUgtKWSV0S4D3Q1etQNrYww
 eC+r5rARxhSqM5i/nzhVE8fP1WEfiarsGYrXX4gYNPe785Tg2wen+hxDv7xLdQFTG6x88fgrFeA
 luQcyEdreGXqJARHRpXcfNqZv08QyjB/hbdNUJTxG8UIsgGbyyzXLhWMDjpLHYhIHbM5498L/ok
 UG6qcbrDkXcBwXg33rpXUTkaWL9aeD6qQxAa1Hn4f/GGfTmZiNs4OXDVkL6cdez8ugYnUq17LKH
 qOtHH0GHUDC7kAOUewPP3Dfshrti4Ch2o6WBeuHSuElTyX2faRS/ubWlQLXjDfak3BI19wrbRAN
 1ZtkqvAirNYoMhrNCLwNAEgvqTE8yH8fGVB41FB2H/DdVnyaiaO9jTzsMQsjtr9bKLkT3wyAIQU
 x03lI2k/z3jdQeKwRKzvsaonYcU+ERsejZxuDDCBaN6P08zw8nLEjCo/CX4Ti2VKq6aD8NNmyfV
 y/Y8zrZYBd+AeLlJM4eRCu9zfLa8/Fij9rpHI474jmxSNR9ZpLTkoEGcfAoYrgVc6EddU0tLx/i
 CNcceq85rN9X/oJNGrzvSW0qSHc0RZwLMuktL+MfTCmvhV9AYUqCYaRFBjDeVyxyPAji0SgDvqW 9d8bFa7OZHOrkIg==
X-Mailer: b4 0.14.3
Message-ID: <20261015-binder-debug-info-overflow-v1-1-81fffb74d288@google.com>
Subject: [PATCH] rust_binder: avoid overflow in get_node_debug_info()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Rafael Passos <rafael@rcpassos.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+d39ca51f29c6b944a4f0@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"

To find the first node whose address is strictly greater than the
userspace-supplied pointer, get_node_debug_info() currently searches for
a lower bound of `ptr + 1`. When userspace passes `u64::MAX`, this
addition overflows and triggers a kernel panic when overflow checks are
enabled, or wraps around to zero otherwise. Thus, use checked_add() and
skip the lookup if `ptr + 1` overflows.

Fixes: f344930a163d ("rust_binder: speed up get_node_debug_info using lower_bound iter")
Reported-by: syzbot+d39ca51f29c6b944a4f0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d39ca51f29c6b944a4f0
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 64960857bcdc..75e1c1b3e454 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1214,10 +1214,10 @@ fn get_node_debug_info(&self, data: UserSlice) -> Result {
         let ptr = reader.read::<BinderNodeDebugInfo>()?.ptr;
         let mut out = BinderNodeDebugInfo::default();
 
-        {
+        if let Some(start_ptr) = ptr.checked_add(1) {
             let inner = self.inner.lock();
             // cursor_lower_bound retrieves the "key" passed or the next existing larger key
-            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr + 1)) {
+            if let Some(cursor) = inner.nodes.cursor_lower_bound(&start_ptr) {
                 let (_, node) = cursor.current();
                 node.populate_debug_info(&mut out, &inner);
             }

---
base-commit: 7e170600b36298cba2ba7a0c63d1cebea7970708
change-id: 20261015-binder-debug-info-overflow-397b2d61a594

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

