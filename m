Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702294;
	b=AdSVUnJW0XporJKe84Tlzm8arsuFzytGSYBIIPEy/X9Hg1G3N7j/UtzIG/hDEU5x2jJC
	 ak7MJx2wq+GVNgdTiSJMAmArY+DPhnDnoQxp4Yp7ujabIkqW7EaaVJZNoKJLkf0ovIiCy
	 LfYLyhg0qsWE9WoRJf/ddrnBQ9h/j2G/A0JkdmBHxkxXmgU8xOKjV1oCiaJtZQTjNGUmy
	 XpA8xFw6M9zdht6KhMPRBV40MEQb5IYQuFX6CR+ebcGl+7XS6wBpO5OgIhmCiFCIXdCrQ
	 /f+ayLuTS31IDvJawO3K5IZqtr8oJpah3RER0qFNzBtLQbGJ/WErZkRWsWRT1JUAFeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
	b=vNxsjje4NKtfVT10Y09nT3LCCdx0XqbANFDB9RXDR7pZjNVIrdcuqypziwn4B9ueKU34
	 47qFIkUzFynSamWWPfC9OPVsvdincKWMM1barU0SLERudcTR//YmPxBnontRso7vzphmU
	 XmqDpzx4i8D5BvUEKmywKXHbTEpOj+5H3rPrGduCF7JkT2JUToB3TPAtmQ3QoDD9laGoY
	 0PxS+iH5ME/w1CTppjvuXq3r2MH7Zmdh3VcPNES/aPLVjiebwPcXBkfMQAuFJhT9KFq1S
	 pIJPxcUt+eGL+/EnhklrcsToG5yEUULuognng+s4gT7XxnQYwABXJ6D0ci0meH4Om6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76UtIeB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CEF6074A00
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CEF6074A00
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76UtIeB
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67583c777abso599872d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793702293; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrhsbOfTBZGvH7JLpPFTpD37Cc+EBnZY/BigzQT7xiaQ78q/pusWoVeJGAnfN8P1hY
         dw1gGgr4rSETKQj5dWgIsV6tsi+S4SfYt9w9IFyQFBgJcfi41L2djamG3Qd8VNGiey/W
         CxpGhASYm5Wc/1bZ8j7cgOROhoNiuGRIw6BO+RpgEU1h32B4hGfVxQJQ9oXEzNIrRLLo
         y/Cko8UgKcFi+1el4SQNWhRvpRr8t5Snxt9qJrajVakykacr3mR+uGToQgS6Oi+cDj3l
         dToG+6t6chQFq/yqMnIXWWj1XlmUEooykwSs0SFfbqKL/wMnJoPNuVdugtvX2tbsNRzL
         h8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
        fh=oQ8OIfT3iFu9NIi/YdhNMuYuwB+H2kRfVDzoLSBaHmc=;
        b=pmVuhI5i0LxH/ypBDTCxRGJbH8B40/8q3oLa67hSKMo6rW6rh3eal2fHaWiDbXNGrP
         KSaDnC4mdjJeE1IJs9eKNh2Uw/oYVtL7TVkPX4XcC+/CX0a7f5cbF/ZnS3aDt3dlXLON
         hCYTvnjhK4C7VaBp03Rov/a4wBWycFJ9RaJDv0BaWSL05avebQmVRaJvXRCzC+NmEEjf
         3/qrSMfBAgEJNtYTBX7mYy7RnzlTztAZvLX4ky9QGPFnc8WZcoeuwfTtDikXs3wVH72t
         95L3KDHQDIPkqss2sDTAJoFB5pQj3jh4xirr5MGG/RkYhQ9IHGdSDukjv1+T+wpcy+5P
         YXHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702293; x=1794307093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
        b=w76UtIeBbvbl48JVj1miebuP7+QqmS8voOeBlJC7dJ/FMq2JDvBsF8/P6Ks6pgb6Im
         xeS1wgEq3ityfS6e432FdqLsf2Xhh5Hu5P1ulRst+CbsUvtEI7b1iQpHLiRVg/TQHncj
         sP+JqoldE4VPrwZQg8VkfDx7nXVC2Mm/OWGsjlQMMZOnuVEYg9wNvLRmD4U07IVz05Dc
         04e1voBf+M35rwdkZOr4M1etuFYq1w9gvlw2mzFOeJHUIJG2q57U/85YwkIJl5o2f6qd
         ZChk83j5vYeA+Vi/V5ssr8jO0YXJ397Il8sr//ISrDwG//UBUM+RDM8tPllS2ENy6nAw
         4IAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702293; x=1794307093;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
        b=OKr4CyaAF11vOmqdCtu3pGqsd1h6e6PMcIKw33MOH9YrfNx/ptZgtF8XVq/xhxAQnk
         bWdWVwh0vxO/79G23y2BRJUZI8AJ9iG1VNBMqHk50sC+YGyss9F6WGLyjzm1/U9EZHVN
         gF3CulVlF9ygE9MbdJ92511XfbKMI+P9pN4Gp9X5wRGIqQXAmVYOIH1zMOmKSs48U9q0
         bciPthwrvsq0llv0E5TU4cN/eS8yjPulICXsi+zTWFnqky+B4dyuxyEv1mFWH8yLkIf4
         zQrBWCchEgaEpuYxGtMzkd1iYnFSGmDe22jfAmt5iieHRt1jyR8/Q8xl0uofghnLf9E7
         Ka+w==
X-Forwarded-Encrypted: i=1; AKwUvByfhJyo6cZ2PTeyZIep8ircieK42z0O7azPtj86m4aFxIr12uc65MwRKbTkonferdMDMHiUIRUtQ8nxteE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yiQxNj/Vsytmt5NaMveo/JtGa28GF+tnKOqaT/DVdYVA2RS4F
	SbC282tHF42zF9/W86kw7p9EsWgC/a7aQxU0tyH7Hbc8ApscvrQhiBI95s07qGyg66Tl8hqfmYZ
	EApQovR0O/OAvpiA0Od+vsUF9bin4GQs=
X-Gm-Gg: AYBFou0pQSCePi8zD3ugs7szuVjxbiWmqk0Ep60wrJsXypTEsqCvCCq6BAwTMYdYDRZ
	dVqNW+mMtTkZbG31q2sxA8w4tK4to+Z+fWWcRQ5hN808el1CfzNtEHfQ6SGE0qHqqllTzUwTCpr
	UqA3U1uh6HI5tK3zaPApKissZXn8KOtI86NLGSOme3L8Jb2eCUKTZoUcptD4WKxuccH5CIIG+bp
	GNoJAU9v6LGzGL43A2C+F+ErfPp7dQjHp2mU4JNhBKsJlMU+1NiTXJsWqzs+jTmmdvfR8dccWnV
	8/PFMX5lgqw8pGvdv8ubjb/bTNtKvQQhTgh0kQUZsitcNx7ZDuTA8YbOa+q/7K3yohU814AWkrk
	tddaljrZHFej2l+1wTZtsGpUKDMLSJ2Yr7zUKlZtfnUT8IRvtHHTj23J0Vd3DVLo2sLuVP+UM9Q
	VWb/fkViR05WvbmvHIFb5jMssZCOUbG1DT4lBD6UYqdOoFCqwAn5LreJ3kPs94OzjS3TirPM0Bi
	/jOmg==
X-Received: by 2002:a05:690e:148b:b0:679:a89d:d23d with SMTP id
 956f58d0204a3-67a8d39881cmr11442946d50.11.1793702293253; Tue, 03 Nov 2026
 02:38:13 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 02:38:12 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 02:38:12 -0800
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
Date: Tue, 3 Nov 2026 02:38:12 -0800
X-Gm-Features: AclHuK97Lxt4O2xlEcDKgfS5TIHK1JX32ZvuOwLNv4iZ8tf8lb7mEWhkgmNWMM0
Message-ID: <CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com>
Subject: [PATCH v2] rust: alloc: test drop behavior of Vec::drain_all
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
v2: Split a long test comment to avoid mail transport line wrapping.

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

 rust/kernel/alloc/kvec.rs | 89 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da..01d468239 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1540,6 +1540,95 @@ fn drop(&mut self) {
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
+        // The caller owns the yielded value.
+        // The drain drops the remaining values.
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

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0
