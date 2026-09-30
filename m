Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112C4D4899
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772548; cv=none; b=NTCFnCfd7fKzTbtIAMNkMsG7mxXVNdcugIIqqQKaiEFvAaxsPm1s2958FBW/+4rVSi7uryzI2zRZrwj6y2snhk/w0egNWKyiB4dABJdzRyY4QOiYd5OliiUrWkpecboYOTK3PqiyAdRj4a4RYfr3pd+MxoUmFRMXEga/9SY2cDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772548; c=relaxed/simple;
	bh=wDqQEHeexHbDetU+PIWj4LWacJQ70vCFskpK210m9Uc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O9A/ekouKDxawxUOzw7jPzUZfJuE8dmpnpcP7sF+65iwl6HwvzxcqASjvPiQtIc0O12VUYRbHjiFdVv4opcblk4ZRWDAn1uOcezsuVSgTR51WsnShme1hhcwPJ/9YOxzP9NnK8Vm3AGJVgR1u4IHfaw0MKXwJ1EmoSVu/RC64Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sDC5mqB0; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sDC5mqB0"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c210c66672eso713073466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790772538; x=1791377338; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVNexAVC0V5li+k/F16CN+7KdwSpTXSAvB2yMa317GU=;
        b=sDC5mqB0dbJdeufHtpGZMcCXupPxUd9Isuo/BiH/Gjen74BsGx9v8kvpc3GuWCyUAC
         xXZ/1GKY5ezuTW+TLl7w+jnbd3SITuYQXpnYeAMDWJ7A6GnfIAhXz/3ZNIc92leMxllD
         2MphEcjo8hDYr27jp03LkSQzrbq+38DMKnuQwEwclIAgFEVwTXhEo1issydO3oynfimZ
         mUdQVRWgwTxq7N1ijtHnw1u3yoqkpsZPAaUn+0IIbd9rg/W5CF2j7g+SYlN8/hPbktNx
         6L8KUD5i/EqBUl/iHrKhRLEmGJHKUlhLyZ9RcGK43XW84ov4LH/ByXc1d4QHd9Nv6Vyh
         rXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772538; x=1791377338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVNexAVC0V5li+k/F16CN+7KdwSpTXSAvB2yMa317GU=;
        b=IyeqjbCW1EsmqdekalX6BqXmd0eC9IDOTH2jjKjzyFH5ecTTI68EX67vsgtfTGkBZc
         9mGi+Pb9rYbiQyNgZk8eLyMCQtARp+CfqOBf8QA8dYY1qPIda5MnWZTBV71/U3aPymCQ
         sbEfWVX7Rw+FYrYJSWojiXYc12ltQBPO93VgubCPw0GQcP0CdMqtqM+sYtWrFXP4nPJI
         d+22jDrH7oKsfafku/4/tBKvZbXyJ9cnByquOZPxn+pjgiAmZ6irybmis4n9NzG6dCTa
         re6bhUioB9Z/HWjGbkqJsJC54xz71DuniOrCKCpf5jTWBkFT02EP2GAslrxwgPRskXyE
         Is8g==
X-Forwarded-Encrypted: i=1; AKwUvBzgD54vH7ZTW8hRTDPxuVWx5HvBXmNMHzWkrs5YGXaneHs5Mj+94LJLtRUSre8AUdmc57c+qFoToHW8LvI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncNZBuZLqB4zoAMZHZvJPnKJuC5WHr2LkAdePYKFK7rGB2JeDV
	E8x+/mN3FD1SGehy1XxcvSIapOK17u1SCFbTF4ppLE8FBiIzzZ3UwJquOjQA9A01ZLMH9KfdnfZ
	8EwcyumWZfadJIle1Xg==
X-Received: from ejri23.prod.google.com ([2002:a17:906:6997:b0:c2d:23a4:edf3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7208:b0:c2e:969:a4b0 with SMTP id a640c23a62f3a-c2e23cf74d8mr117438966b.38.1790772537773;
 Wed, 30 Sep 2026 05:48:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:48:42 +0000
In-Reply-To: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wDqQEHeexHbDetU+PIWj4LWacJQ70vCFskpK210m9Uc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvQU2BFFh0KH0ZXKTw+QSI/Cr7JUn+q8DrwVkR
 hgri6PRhn6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0FNgAKCRAEWL7uWMY5
 RjJED/93ufabr1xR5jeYtifrnwaBiMPJTpvMKlznunkVDGSVCedE+pbZI5qAODNlXOEBgLw5JUN
 BcyQVHehdoe9AVG+hpLl4cr4jqAKoRle7SW9ul8vVldbKj1bQykmDWXyXvg3ltCr9GxbQff/6lQ
 6V1t0qkZsKq1NinQ1EeAkUKAahD1WzNMjkJSE3die8Qvxh/4V1i5J/zJ2Hev++zuEDs8GhPSzRW
 plD16KFFlLNr+N2CBGxsWIyMjdYEVWaFUaepkED4ibD2aeCF+YvaTV4CDqKHnMDAsrcSzvAKqCg
 a9OrACtcQtSj2c+pMCNTtrsvnnouqcbFv5+qeTec5o0VBcYvx1SwJXIPEYf85sGgA8cIJV9kA6q
 XK0fcHh0lVUVUjeAuwdxkqrY3t7GwtyJLtA+z04VZI99GsAKkGz14bCvstvVuAeEWgcNn1bAbwa
 x7cBhM3hckG7poUlmaOvmVZt2MRUn65QndOSvw//j2KRWD9h1U2YGYvl8flvv6PEjcG0XyuwfGA
 KagFZj9uf8djslrqBmhlBiGyuixFQZ3jLoLVgnkqM6FTXdUx34ctwkoC2zCT3U4cbTc9TCy7G35
 tPrWh1HkqmLSZwDm+ZqtAxTHXZNMXQWx061N4m0OyPjuK6fLJgHMVKEyEzL60QxBa745RYSv2nf IZOpYo4T+9gRj0A==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v1-1-3d832fb30388@google.com>
Subject: [PATCH 1/3] rust_binder: start debug_id at 1
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

In the C Binder driver, debug IDs are allocated with
atomic_inc_return(&binder_last_id), so valid debug IDs start at 1 and 0
is never assigned.

Start NEXT_DEBUG_ID at 1 in Rust Binder as well so that 0 can be used as
a sentinel for an absent or uninitialized debug_id (such as in
TransactionInfo::to_node_debug_id and in transaction log entries).

Assisted-by: LLM
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/rust_binder_main.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 955c4c348f73..e360df991d51 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -96,7 +96,7 @@ fn default() -> Self {
 };
 
 fn next_debug_id() -> usize {
-    static NEXT_DEBUG_ID: Atomic<usize> = Atomic::new(0);
+    static NEXT_DEBUG_ID: Atomic<usize> = Atomic::new(1);
 
     NEXT_DEBUG_ID.fetch_add(1, Relaxed)
 }

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

