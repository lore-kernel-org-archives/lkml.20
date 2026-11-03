Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701935;
	b=5Tg7locwAzqo9IvdglHmLNg25o/otHvDtoshevOqNAkbYCwrWZVlWCF5byXqE1msxni8
	 w/zoMwmsvA+pMNaZs1f0ZvGFK4Z/u9EW4/BroFfYGgGbnBPDvxGiF9NRcUvE/VCcaSPtm
	 F+cV5Er3AJn8zpP/CwZVcSgXYQptBcFC1RTl945feTci105IDAYxOmaDWtQsSWmYbS/+W
	 vVgbk5Nw9bS+3p/+fDwWOSo3jE/Q6oyV6G4eJoCpvpHTt/ia9QcOuco/pg9Jz3eUwXKD4
	 dj7cIN8phe/LF7OI5754HF+nq24yWItOGDxxNj28u1kRxehm3iElSODoE72JhWh7xBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
	b=payWaUwOpEN9JkSnmlvPi77Omem2n8t/phDSNKxCKZFJzDGd3rix+Cccn6ZZrVz3r3qk
	 w8ohtjwY+6CxdAo46sz90eWWIPj8IA0rFYNcweabW6Wd/mlW2PebSC8iOo7RbljFWZ5CG
	 swqEeVcRRCNw4a+thbKFaArYtEOgEV/PBZaxQrPgsrszrEs1+qe47qGlLkP4Ux+qf74zR
	 twuDcxMLD/qA58T3eonBqOtx7ru1zgPjXEnWKlCckVdQWKAanRPDdZvyCrAPkv0vKNfcP
	 ykP2Rog6aopAJ8UTZhY5lnaffkaofS18szJ2VMTPtiF3QT5TuCIY+K3Z28LZw/m5n8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgCUCSBG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE01606B13A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE01606B13A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgCUCSBG
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67992884b02so2383512d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793701934; cv=none;
        d=google.com; s=arc-20260327;
        b=k2+WnbFOq289HDfMg/M/pdEPHzr3ak8XWwfQXD+1bqUpezBlZ4S/97kPNGZ3rsZzN/
         6/KK1P/0BqwbXmJXsgQOOnjZ8PxhKC+KZ5REUJ6d71u96h2vfPafRhhEy+T9+fS/jbxI
         /7j9fEqvmzg0krWbo/HaKE7puM7DmQZ8fK8mCVuJbVXQJLMuxF1Ufbo05oZR8lNgjHCW
         fQugXeBNIdylFWeeAZeEqlKIPAPsyYyHojBn9OZSVJMGC8WVGQG95i2GuM0LiaGs5Xji
         1oCL6Zh5Lq36jX0JPEf42KutzGF7Cy7K3UnhyRLjrkr/6u+68w0lljGVZo1Q+J9poBUx
         DQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
        fh=QyWI+SCPApIJdPK5tqKjzff725jYn831k6Ofv1y1iWA=;
        b=CJdJx9pGuPFDUMATJPP0ne2Gu+YahSlz+iclHBCvUACjcUU5M0q+6Gqmdx4cLdDd5g
         2uqovRhhvpWYfiYBILew7IdHM4WLMkvnoL2SoqRcJzxR1Vju79wCnvMge1ADVUGCMerp
         FiyHTATCqSjmEytr3aEHDkjAfaK1r36Gy7/XRM1a8UM9nYo0WGYoLPTD/M1VD59DIha+
         IFINiBOa3KlfA5Ww9ifb7DzzbvVI/EOhEy4Yy0NMpNkKrSAs5C8v3OeJ/3ohi7AYldJO
         qalk6V+yLfWlZsalJrXjICknx4Z4/5eOd3tk9POhf3xxrfQdVd1J7BOMaqeDEfn2AgL1
         K63A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701934; x=1794306734; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
        b=zgCUCSBGSQZBUYWaWNgYpejQ2dJxrcAj6UKNDz5HgBWz3DoCtsm0Q4a3vcVS1i2bKX
         1KOuCZTR2KJAmN5ijRVRAcqbvGDKZ4XF8c2aYDEU0GNCg8q2huF/8rXyVkWSBQ0dq2Rw
         +yJrsSI1sk+5d/IV5fnNOfe3f+MOmcr6XLbOm3qn/zHmD0yIOtagNYo6zKVh6ZpSFaRG
         bCXMHbjpKXoyWn0leS8hK9y9cIQBC3xMB2N6Cg53PjVYqXmkeoRm3VPIN1u5BHYCXbfw
         n7QXKrE4BZMU0RnAAbEHOxXR43ah7rX3CHbsVdngHzinsTcuGP2m5V/hAtWoIV5pxMfJ
         anEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701934; x=1794306734;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
        b=BJ+BBMnt9igzUtCazvAI7LaDTTCkWlV61shulWjOL5l5krHfEp+HO+vPSmOKzzjRG4
         q0iLsURGNBsvghJZLuFVLg9S6I/QCFmPfsuzyYzEYD3jO6OB+6IXCoMcE5Xjky2X95O8
         192fKOwecYdIZ5HEIkxlvw2e4VFCc2TPcsUfYer+sA6nJaUTTLMeTSOLbk9kdN9kK33m
         EsDYKPoYoJhBuLNY69qagooPVDmR3EPk3tt3iu5GB2+/jeglOVvmCJZ/GiwMOWJWSpaR
         Uo4f1aoZBImR9uJ1FFb4k+LTx5TqP6cDEnd5DYIQ1YwdN233G9V3rIKMcrbzw+A3mOAr
         fOhg==
X-Forwarded-Encrypted: i=1; AKwUvBwuFJ2J6318JKiIORui2Ddz1BBiiypXUrl4aojHXH78WoIX0Iv2L2OHGRym9QOvPZMmPwU667Gam9tNVkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/nXg4HmDraVkB96gIAo1PyvmT/5jtH2z/QpjzSVt38tAWKzVh
	VeDPP8T+Tro/z0cE1zULbP7wGQBve3Vj5aK2mGHMRdJvFqiKiWuPpVO/yPTJiiNEcRFIJChyy+j
	apXDQ/ZfkgYQCaBcUC2C5VoBjMLsK7jM=
X-Gm-Gg: AYBFou0EOcOBAGM4hSPvwe+7ScCQZaagGezKnoUPSwHOaeI6UNrZp/OYNa7oo3eSxXp
	DsoLMxSUmcBke+jep7ZjNePmQ4Yh0jvvAx0z3dbmzs2WorfvTS6uCS5fU569IUxdeIoEMyM3b4e
	Ckscwf4CHR6WZP2BLCLKvczOXeFpfftdaX0HcIM8I9jYhaDBW6z+TPlo9nKP0E5fnqLjTqQ/aY+
	lQNH3HUsD+1F+LFjBZOj3epADMy1b1Dp3duLKhZfY2GfopF6jTMjfUaQxRNTRTmYBzJ6cgag+G4
	QM2RMLKc1blvb2PsonmSRyoeXT+823sJGF6p8O0WJkYA8CWJgUPaVLKhulaPj6F11bcSz7BQNQR
	3JkUKa2nwW6qHk5ZBRhMRHPYt0+rWSmZSbpA87LjDdemGuZRFGJW2jsye4yJM5c7oC59CEQZMk5
	/WRRoi6/UZqWvECFcKf0D3SvP06C8NNfOybCw9OyFAD42Pv8EotA5ht3rkvJZHLbHi0pJDmWXEo
	g8VsA==
X-Received: by 2002:a05:690e:439a:b0:676:bf92:2520 with SMTP id
 956f58d0204a3-67ba50c7b2emr4676467d50.89.1793701933775; Tue, 03 Nov 2026
 02:32:13 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 04:32:13 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 04:32:13 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Peder Bergan <peder.bergan@gmail.com>
Date: Tue, 3 Nov 2026 04:32:13 -0600
X-Gm-Features: AclHuK96gvYRqRgBDT03v_6oIAmN1e7Nl712wgD5TpWQ9zekVuOi8l-OEed9qRo
Message-ID: <CAKHwh-E-7CRRG-DH6-rDfGUCFAxG6JNgswk-suTaGKqMbig5Jg@mail.gmail.com>
Subject: [PATCH] rust: alloc: test drop behavior of Vec::drain_all
To: dakr@kernel.org, aliceryhl@google.com
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The drain_all example consumes the entire iterator and uses integers, so
it cannot detect missing drops of unconsumed values or premature drops
of values yielded to the caller.

Add KUnit tests with per-element drop counters for partially consumed,
unconsumed and exhausted drains, plus an empty-vector case. Keep a
yielded value alive after both the drain and vector are dropped to check
that its ownership stays with the caller. Also check that draining
empties the vector without changing its capacity.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
This adds KUnit coverage for the ownership and destruction behavior of
Vec::drain_all. The existing example consumes integers to exhaustion,
which cannot exercise destruction of unconsumed resource-owning values.

The new tests cover partial, absent and complete consumption, plus an
empty vector. In the partial case, the first yielded value stays alive
after both the drain and the vector are dropped. Per-element counters
check that each value is destroyed exactly once by its current owner.

Validation on x86_64 under QEMU:

- The original rust_kvec suite passed before the change.
- All nine tests passed with the change, including a CLIPPY=1 build.
- Making DrainAll::drop temporarily empty caused exactly the partial and
  unconsumed tests to fail. Restoring it returned the suite to passing.
- rustfmtcheck and checkpatch --strict --no-signoff passed on the draft.

I used Rust 1.99.1, LLVM 23.1.4, bindgen 0.73.2 and QEMU 11.1.3.
The minimal configuration has an existing unused-function warning in
io/resource.rs, also seen before this change.

OpenAI Codex assisted with coding and testing this issue.
The requested work was to test Vec::drain_all ownership and destruction,
validate the tests under QEMU, and prove that they detect skipped
destruction.

Base: alloc-next at 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4.
The patch changes only the existing KUnit module in kvec.rs.

 rust/kernel/alloc/kvec.rs | 88 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da..fe113c7ff 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1540,6 +1540,94 @@ fn drop(&mut self) {
 mod tests {
     use super::*;
     use crate::prelude::*;
+    use core::cell::Cell;
+
+    struct DropSpy<'a>(&'a Cell<usize>);
+
+    impl Drop for DropSpy<'_> {
+        fn drop(&mut self) {
+            self.0.set(self.0.get() + 1);
+        }
+    }
+
+    #[test]
+    fn test_kvec_drain_all_partial() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = KVec::new();
+        for counter in &drops {
+            v.push(DropSpy(counter), GFP_KERNEL)?;
+        }
+        let capacity = v.capacity();
+
+        let mut drain = v.drain_all();
+        let first = drain.next().ok_or(EINVAL)?;
+        drop(drain);
+
+        // The caller owns the yielded value, while the drain drops
the remaining values.
+        assert_eq!(drops.each_ref().map(Cell::get), [0, 1, 1]);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [0, 1, 1]);
+
+        drop(first);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_drain_all_unconsumed() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = KVec::new();
+        for counter in &drops {
+            v.push(DropSpy(counter), GFP_KERNEL)?;
+        }
+        let capacity = v.capacity();
+
+        drop(v.drain_all());
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_drain_all_consumed() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = KVec::new();
+        for counter in &drops {
+            v.push(DropSpy(counter), GFP_KERNEL)?;
+        }
+        let capacity = v.capacity();
+
+        let mut drain = v.drain_all();
+        for value in drain.by_ref() {
+            drop(value);
+        }
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        drop(drain);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_drain_all_empty() {
+        let mut v = KVec::<DropSpy<'_>>::new();
+        let capacity = v.capacity();
+        let mut drain = v.drain_all();
+        assert!(drain.next().is_none());
+        drop(drain);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+    }

     #[test]
     fn test_kvec_retain() {
-- 
2.56.0
