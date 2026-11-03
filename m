Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704901;
	b=IwC6r97I3K5dS9LTRAtCI7nf3HPKXLJ8PxjfAZbk9+eexKRcUzxmY/gRLni3xMXKd0pj
	 OLkYECGUBgdMJvlf2LdGGvek361ejz4TaI3zxsDL2cpanApq5S74U4cd0dbF1AsOGeLNs
	 G7XDCO/eqUugR3Lce7EyGWdBzZZUAg+3cJBva5joss5VePjDXcqLDNrU9Pu7q2k/Jl8Fh
	 jJhEAEM4eKZ00BMfwbScCj2mheWlxMremRYJUXSJb4SW7hiPsT8VkBw3r2GklIEUVOud3
	 vZs4JSYU2c3W213V3qZcRrCloRi3B2/ujcH2eoWyIrxS6k9QEFZl+IPCwq8Keevbr6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
	b=uZw5tyZgreDHdEl30OB701fhfZq5v+iqRHDsAXqPwU9ZcKpLWnnhgE+Y9OnH7bvIdwd9
	 llvlsz4ZpQpuKPpy07EJFkAEHJwvnfV33kyDhgpFHClYh03dbPCOjlV5P5mOVvJIsvYcD
	 J9JvcDaNb2wmN1jtFw9P2TMJ/C8M77iLGS0OkmIazbkOB70qei89hnW/Jqm+BBjz1cBB8
	 NXxpqTkqZJiFvTjbB0ql3M7+dx99hbrzzWF+0jJJAdBMJEudWwZauVSqu5hGCRM/NJTxW
	 tXsARp1ZhO8kVkH3rXOb0wqM/WJhZq15Cx4VJUnnQ7x6j/BjqFncC4BM3Ytbd9fi5HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaXv6KYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2A606A824
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF2A606A824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaXv6KYJ
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67990a45e02so3588914d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704899; cv=none;
        d=google.com; s=arc-20260327;
        b=chdFokaODX+hyK26hcyLM5lcmRpOvwUnuM0/FUfLUOuVWym4VedG9xHGVHdDyUjuRu
         U5/SevCFNQjYyMLnT4e85wvGa8O6kaUCJYxlpIPxWUc4pe06IJ9KHaphxziD4uFTrSp+
         ChG+rDlEaXOzZit87jAdPH6k6qb3cxO0CxkaHM4bvQdsQEXbcEsCFSiM/Dj+bUErfVaL
         yysIL7GRQq7ZBstA8jp4ktjinnSmYcnsxT8jInLkqhdSM+GOAUe5ZI1IwuZWjN8L/0r5
         qABRbezY2//NtqCfVosPYWj9n+p5ptVTRw0g1SevytCYEvtVGv630gj2HQm+d8XaxWLa
         Oz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
        fh=XwcrX4FdTGVLA1igDGodKClc/RRwPoIItOSlqm3U1vc=;
        b=AMDXY66aY51savT6SLmFZdbfHW6HRLujKiSZ3R1YA8vfDHAWs5NQYqNvJm2bb5Eia5
         66VPxlMf+6gQiunFEe2ONqOWxp6OpP3LnmdOp+rcOFqi/pIyLtBmWia2l/FnjvLOlq1f
         DHFmOohkVHBCczhEiKYfOEiPfltqHgErIt1SoZBxArcdJ/LrsOPCGWrX0liVrXnHqUPi
         yS2cGU91iMUGMvC0Q+GUR9YaENdM74yqxtfujLaBvgt3WxxCM8m+2PR4eTP1vDIRP7Up
         dZ+RAzO2xFIK3zlaDbrY/F3iBDQsaqIcwnNNfEnULSo9f6yoQ6Aasrw/H+YxGk1bx8Eo
         PFbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704899; x=1794309699; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
        b=UaXv6KYJCp+0/TFPY7tt6WAYPKrOU0FxBLAOnS7/M7xTF7xOyG8HXXo/0v4LzG2Hkc
         4Uhz+9Hzayq22rOqVMZtNbfEogmPWYzcWKVxDemBAXPWGht9FoH13JS6yaKElKZfG/tG
         u+kIk/+l5UdjlwqK/lCE50x+KFRStiHexeSoN/Kr6ob3uf0Ev7u406swuVpAKEegGWR1
         dI3yFrfySn1nnh2fLs4ritgLvYo/x1tDP3FhtBoyc//TAruK4Hv8/p2F1c9sWluFpwIQ
         qSEQkkFIU5PShlkGM8hWx81kDxD3De2NCWQ8T/TiDthf2pfFCTg65EWHMB064HjWvF32
         DgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704899; x=1794309699;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
        b=PmuqWbmLBth/zzqYOycbMRv7b1bk3ErJbDLIIbMr6bTtItdO3wTMVwKAuKacEJDOaS
         KeE6TjBD5QoLCetfORIlBLeKMFyQpnDAaJ9kEcvwCWH4U/5bNP5TzPxzluDQqnJSKSO6
         s8+pEqmFP1A5n7ZE4nt4FYN1YJ7lcUnkmffsa6rjgOaq1I7hvYWm3SY//AS5GX7pfkJ9
         OM1ldIo2gdJh0Gpcghek4Lp8RF4s3hb/CyYMucYROOtsBhzuxscjyK3Q5m/DQrXK5lJG
         GtEUNKDa209bTtcs7qFOPAHK8d/fTfsoBkZ2X5Be2VAQaHknk5tnKPs/q4cBeQ8DpKba
         E4tw==
X-Forwarded-Encrypted: i=1; AKwUvBwuJcCWMa11Ef5ofmySJezDH5jI4Q7II3wrVK55TulEEFjZNwL0gL2f0DTLTH/F2Cp3ZIjcCeN4iTBPZnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KtPJfFYV+cnjFdb/6z2cp5bORb1pTR7yLBlowxjXe5LNQbRmT
	b+4gwygJ8pyfxKwf33od8K1PFe+JnSY2i2cV3QGfaj3uJdcBq8nsNaLN6aSCyI941WKsal9cS4O
	uHtSXroPYt8dGlqnQni8RMuKnsOI+nC4=
X-Gm-Gg: AYBFou2XgkeBzOmrBcEDPa7xsHAH9nuCsCRIpYRnubhdIFq6J8YDi0Hl1fWEWcMvRVz
	nP83EGAUQ8n1pH6s377d0tUXgvOMgnWxpVb+h2rK/d0GZr6AOoF1QHWZ0JLhGNn7qrnttOW9aap
	AI/nshWZrNZ8n8Eq8HkwDmynFa+XmV/9cYXeZmtEp+n6LVaAJfJARQNn1qPjk1kqHtkwQB7wCTb
	2brQll9g9i5z70R4hkMR4ILp1vtQGAdKnvUqLS8X6v6UdXMB5EUnweWfoSuJHQ9DSwgkq7t/j7v
	dd2pZ2uJZ+fDM7E0O1GF0Kr95EP4OtYWKXzzrUeal2dV6g2s1qOdH+msqhNxiFwM4MP+8NtKDig
	6FiOWSVLqdes0ZPUcez5NhVURWcVktgi3UmdAmelzglMt7Byw9BBrof3TA1bl/+vXdP9InUeDEh
	2/8uwiib0xoMI4IBsOOGjrlY+Cpd0+lGk/aifpReeHxu4SfwTu1jNWkbDKFT+EQLC3DfV21RJjE
	rvux3MxHkUMgqIkex45B62NRT8=
X-Received: by 2002:a05:690e:80f:20b0:679:b98d:9b87 with SMTP id
 956f58d0204a3-67ba4fef31bmr6609467d50.69.1793704898918; Tue, 03 Nov 2026
 03:21:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 05:21:37 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 05:21:37 -0600
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
Date: Tue, 3 Nov 2026 05:21:37 -0600
X-Gm-Features: AclHuK8SGRMs5YXjfWPiNRL1xtH2xly27akho2t0jAlydepcH9ZLLOhHM9IDYgw
Message-ID: <CAKHwh-GzSuLn9dvjnWph_tr6MDa4nZnjc-JaMy4PeqnNXDnaMw@mail.gmail.com>
Subject: [PATCH] rust: alloc: test retain ownership and mutable predicates
To: dakr@kernel.org, aliceryhl@google.com
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The existing retain test exhaustively checks filtering with integers, but
cannot observe when resource-owning elements are destroyed. It also does
not exercise mutation through the predicate.

Add KUnit tests with per-element drop counters for mixed, all-kept and
all-rejected selections, plus an empty-vector case. Check that the
predicate visits each element once in input order and that mutations
remain in the retained values. Verify that rejected values are destroyed
before retain returns and that retained values are destroyed when the
vector is dropped, with every value destroyed exactly once.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
This adds KUnit coverage for Vec::retain with resource-owning elements and
mutable predicates. The existing exhaustive test checks integer filtering
but cannot observe destruction or changes made through the predicate.

The new cases cover mixed, all-kept and all-rejected selections, plus an
empty vector. They check callback order and count, retained mutations,
and exactly-once destruction by retain and the vector's destructor.
Production code is unchanged.

On x86_64 under QEMU, the five original tests passed before the change and
all nine passed with it, including a CLIPPY=1 build. Temporarily skipping
destruction in truncate caused exactly the mixed and all-rejected tests
to fail while the original integer test still passed. After restoring
the source, all nine tests passed again. A separate predicate-bypass
experiment also caused the expected callback-count failures.

rustfmtcheck and strict checkpatch with --no-signoff passed on this draft.
The draft applies to alloc-next at
6628e7d4c6b25c8d18f1345e3a20d21829aae7e4. My validation used Rust 1.99.1,
LLVM 23.1.4, bindgen 0.73.2 and QEMU 11.1.3. The baseline has an existing
unused-function warning in io/resource.rs, also present after the change.

OpenAI Codex assisted with coding and testing. The requested work was to
implement and prove that the tests detect skipped destruction.

 rust/kernel/alloc/kvec.rs | 109 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da..3a1e09057 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1540,6 +1540,115 @@ fn drop(&mut self) {
 mod tests {
     use super::*;
     use crate::prelude::*;
+    use core::cell::Cell;
+
+    struct RetainItem<'a> {
+        id: usize,
+        value: usize,
+        drops: &'a Cell<usize>,
+    }
+
+    impl Drop for RetainItem<'_> {
+        fn drop(&mut self) {
+            self.drops.set(self.drops.get() + 1);
+        }
+    }
+
+    fn retain_items(drops: &[Cell<usize>]) -> Result<KVec<RetainItem<'_>>> {
+        let mut v = KVec::new();
+        for (id, counter) in drops.iter().enumerate() {
+            v.push(
+                RetainItem {
+                    id,
+                    value: id,
+                    drops: counter,
+                },
+                GFP_KERNEL,
+            )?;
+        }
+        Ok(v)
+    }
+
+    #[test]
+    fn test_kvec_retain_mixed_drop() -> Result {
+        let drops = [const { Cell::new(0) }; 5];
+        let mut v = retain_items(&drops)?;
+        let mut visited = 0;
+
+        v.retain(|item| {
+            assert_eq!(item.id, visited);
+            visited += 1;
+            item.value += 10;
+            item.id % 2 == 1
+        });
+
+        assert_eq!(visited, 5);
+        assert!(v.iter().map(|item| item.id).eq([1, 3]));
+        assert!(v.iter().map(|item| item.value).eq([11, 13]));
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 0, 1, 0, 1]);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_retain_all_kept_drop() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = retain_items(&drops)?;
+        let mut visited = 0;
+
+        v.retain(|item| {
+            assert_eq!(item.id, visited);
+            visited += 1;
+            item.value += 10;
+            true
+        });
+
+        assert_eq!(visited, 3);
+        assert!(v.iter().map(|item| item.id).eq([0, 1, 2]));
+        assert!(v.iter().map(|item| item.value).eq([10, 11, 12]));
+        assert_eq!(drops.each_ref().map(Cell::get), [0, 0, 0]);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_retain_all_rejected_drop() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = retain_items(&drops)?;
+        let mut visited = 0;
+
+        v.retain(|item| {
+            assert_eq!(item.id, visited);
+            visited += 1;
+            false
+        });
+
+        assert_eq!(visited, 3);
+        assert!(v.is_empty());
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_retain_empty() {
+        let mut v = KVec::<RetainItem<'_>>::new();
+        let mut visited = 0;
+
+        v.retain(|_| {
+            visited += 1;
+            false
+        });
+
+        assert_eq!(visited, 0);
+        assert!(v.is_empty());
+    }

     #[test]
     fn test_kvec_retain() {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0
