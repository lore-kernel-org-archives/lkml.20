Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956F4F797F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776624; cv=none; b=rPPyhU9A2qkrabdbTkji7wp1EqKj+c+r8CFGtCekOJFv0JrXaRIB+RUsW9XK7QZz9WdDMOIQpdyazj9za9RsYkPOlCRYhjbsgHuH23lcFtf8YWQtRdIQzZYS3sMI2oVPfYLzs4j115qTaJHmsW6V4Xne42+uxoxWJAPzImMl1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776624; c=relaxed/simple;
	bh=dDy3drfTbBFISflv7+3Uvs8hBWMAds2Vi2liSczfUaw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aFpFSDPkhyltGzcxJLl5pqcBRNjpLE2YRUFyTXAF1uC4VC0hdgTR610hXFMfB/H0jOd29jQcbYahFB3SI1RvkCaAqCUz1msms7biDUxNDroM9yE71KwvGxAOZMfBSoZNNE/UPMxI/s8MSDjvQpGVCAdFfraJV3Nj6kKwOq5YfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RRZBpQRz; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RRZBpQRz"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso22838745e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790776608; x=1791381408; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXI7VSjnC5Cp11HTWMe90nikrh6v00LPdawpHD6gNuk=;
        b=RRZBpQRzVuoDxlKmfcqOncSngmIH5CC9yvMnLujDXfFx4i+eDuadQXl+vD20roUgff
         OWFDZsP6ny/T8pf+DBfSvGnHjWEcKfsnAn24Le6PCB0BZ6AAkIYtgOFy6KI38qH8C26C
         /IQnGUN9INDINLBTP8nX2639orQDE90CYVpYiyTL2ODhB/q3RpRTZ7c8MUGFu9gKdfyW
         6RFKY0goS3AytWSPr2m1T5iGDLUxEJBvn8+UU7w17Rjar/VTB+kSJC53SCxLpE9RDS1i
         3HHPm1ZSdJNaaP0ogVfubPN2KCIotZqw02EEJ2Jn8Q3JvgWmnUPkrYPuO6Ky0A1xd0+X
         Yp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776608; x=1791381408;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXI7VSjnC5Cp11HTWMe90nikrh6v00LPdawpHD6gNuk=;
        b=nnNCeKLr01knz4seztem84ekohXm0uwuafUGcIeur9S70kOxjenabQ2yL+JvbafvpX
         9gfjLIgnQpKgXQG6LJ7j1ltJ1dQCY+3vIFScARg3cYw0hh1cUU5QnZHpCSdSy0MTswgS
         Vq/TIO4XdAMPckTobXX4i9QMA/7oDlj3ZJiMz612k7miLQPvGXjSWAF/Ow9UU5bflbCL
         JJgGgkZYrgF4+G8vsFRg4rsC7VXyGV58BPfuiFLKiHWu3FfTg+DKi55qermF/u1OE0JR
         B7hjPLF2XmiPaZM5n8hwABjYOj6fU9cMm2c5C4HjGe0kphmwOap6Nvy6cy6oEgssvWwC
         tacQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuiXExNP6vzlEDwPNozmACCdbQ4qkcXlbBGAR7mhlAl/K4f91YiZnZuMDr6WpLcA6YUfZUfgFt+BK5QA8=@vger.kernel.org
X-Gm-Message-State: AFuF++mL0TzOaHAqwNe9ml1A3EeoaPBsUxmdKnvlwsiIgMs9ucin0CBi
	/n2CsnwN9xQz249u30ag/GpDeg9yO4ZPuBAVp7paqgZdrjEXpDkkFfqfP0+PElKszmZulrrYwnE
	uNzYczsLEDem4uHHmTQ==
X-Received: from wmox21.prod.google.com ([2002:a05:600c:1795:b0:4a0:1203:95d0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82ea:b0:4a0:4cd:7e1d with SMTP id 5b1f17b1804b1-4a01aff2404mr28466865e9.8.1790776607896;
 Wed, 30 Sep 2026 06:56:47 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:56:36 +0000
In-Reply-To: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=dDy3drfTbBFISflv7+3Uvs8hBWMAds2Vi2liSczfUaw=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGq9FRygWhlDO8kZyI+M+PlD19gO5OukMbFUdo6Eolcx5bdW2
 okCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJqvRUcAAoJEARYvu5YxjlGt4cP/1UT
 67VktMs0fF/ZmciHAcS9S8KDqfJETOTE+fQ/WaaO3WFV86XNjmf+JJ1POFIliT0BN55q0jVac3+
 RgvGCfMN5A87setih45tm3KmdF0tz1kXVuvE3aWYoRp3AKsq+oO7rq8cdF4r4OdqFW5gexwU0NM
 V4wWy+IPq5GWlHnS50vOWwFGOE1AbTt1gmDmMe41GImAf+R/8ooRX2+zQm1DMFPbqwVgdw8kXGA
 Eunqx8MZzQJ7pnzyiPJmzRRXAk54MoKXspwDswq+wixBUSQyi7+35fHVxssnYyEagmy18gGiIB5
 kTXEXL5Ar21oscDIqtZLY9tgjHp3nLnja62j6XwyofZMTxAs96W9954YsldgGGrP0cpAHE7DVeb
 dNv/FUKyRwXxmXYhWoqv8mW9S5WCunYxlRMEwmskY+CAaU9mGeuseI2OO3q2QdJVSKE7KCV/KJX
 midpwP4kqVygTXryiOCVKy/j9IwOJAVA0rp9NopuvPs+7Gq19tLpIVhrH8s+G/2b3hUhRu1dONf
 sFxvb/2c7IYm+CIJb+T7I10clvyivvahmu2AAzWzinXb0/dmLLoPdofH5iTl2Ktd3xskstXq0QA
 YuzHF7W3+dFRWbUlx7lx63fin0yLJ/9TsG5pnXDNNkjQh5qnGpOW67z2GprvKcGnJNBnsMa4Rmc K2fuL
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v2-1-8a15e9b8cae3@google.com>
Subject: [PATCH v2 1/3] rust_binder: never return 0 from next_debug_id
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Retry if fetch_add returns 0 in next_debug_id() so that valid debug IDs
start at 1 and 0 is never assigned, even if NEXT_DEBUG_ID wraps around.
This allows 0 to be used as a sentinel for an absent or uninitialized
debug_id (such as in TransactionInfo::to_node_debug_id and in
transaction log entries).

Assisted-by: LLM
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/rust_binder_main.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 955c4c348f73..bd26ef96fefb 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -98,7 +98,12 @@ fn default() -> Self {
 fn next_debug_id() -> usize {
     static NEXT_DEBUG_ID: Atomic<usize> = Atomic::new(0);
 
-    NEXT_DEBUG_ID.fetch_add(1, Relaxed)
+    loop {
+        let id = NEXT_DEBUG_ID.fetch_add(1, Relaxed);
+        if id != 0 {
+            return id;
+        }
+    }
 }
 
 /// Provides a single place to write Binder return values via the

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

