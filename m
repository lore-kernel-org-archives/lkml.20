Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662523;
	b=DDp1rE7U5M/JByBfu8gLAv6qA1SIpurjdgqJ0MoaHe2b8Kq55ozOwLWU9Qx/+pTK7Lpj
	 +SEFDVeJDAtFOYC0bk766L39wlxoyMbZkNK++6p8+RJf+4oD5z/kNffDz8DisxEd38uQq
	 uHCpbT9MrBH3m6kzOHt936rREQ42rXN6ZSLDLc3kBP6EACti91AUBgKZyMCSNAx13g6+y
	 Z/5dA3/DiYnTFdo6x/pPLXvHbSSSL/iLhLQIFE2iElYtww96LOXPia7brsrLnKT40hiQ3
	 nqb0sioQkd5wFL8t57BfbfD5i8tKRd9vWXv/xusWf6esj3ZI35teDqHJ+62lVXndGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9h8JQm53JFkss3jpRTcSkvq9+LBsANnwMRLoN5htXjc=;
	b=mKvTDlWJ0LQ5w8QxgE+tv1B1gNavDeUg9z8jkX06AZBoqx2C6WyVylnZ4h360W63s8I8
	 18PxAj2GyUlk6E7Qxe9Ic+vnbScasgKbhoj99aeCmBtZyCR8JxxocbbzrxoTzV7jijlvh
	 j3B4LoNNrDOmTVHcHeg13et24i/x9mfIMMvfxeNQ0iow+KRnYqQ4AH0yJXJCFsZpgt1Nz
	 TKAyZ3XAQcT+GUmyS06hw4nlhJY1Bkrku8OrSdEZQF+nbleeNhlSgRIVbP/50kGoj7Nal
	 unRQ1eBqKjQWYpTxOMqIlpVqKMQnaNGryTi8iqBRE0pfMvSoe7wah25PdpfBjNie+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpSG+rPv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95A606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE95A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpSG+rPv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10283525e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662521; x=1795267321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h8JQm53JFkss3jpRTcSkvq9+LBsANnwMRLoN5htXjc=;
        b=MpSG+rPvvT7+YpUToJscWnj9fgICL5h92bHI5OxRpjsFXH37Y3Q+Bq2Xat3cM3rZG6
         vfiP/luagPV/9giV2yZgF/Tc+j+zpfs5cABUrcWoLDpGFCImrlKGepVskqOe0Qb1i92Q
         G8jD9/nADscOHLE6LbZ8tEB5ZG9r1k9NOSKNQ077829TXNAc+OgHVAac4a9FzerRJZXE
         3HnUDquaX6xjsmEQZLmpnyh6C0lB2bcYPafRVEHfJYpspbIubx697mSJmSIDbV0n19Z8
         0KvkS7f/fOszh3uqsy+lfxxeQA/y3sNXqZBDQvF6P9VzEr5fjO75m8pLq3gwDfsYvVeJ
         oAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662521; x=1795267321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h8JQm53JFkss3jpRTcSkvq9+LBsANnwMRLoN5htXjc=;
        b=hy6JiIgTGltGbI9lmBqlA4io4kMzBVF2OePYIkwvTgVwB6wKSaIWcZRpaslORlaahS
         DY0Z3RPPREdfYwAM0bdP2GEJ12mp7PUxMUDjAauBWQlEUjzBdQtkGK3qy8eBweqogvBs
         tnWbzWTWLjRpoUf9wk2QKcHdTtSfDjMLZVFvkKPeqmBr6a1Y3RmNu6+7jSlbuSZXzj+0
         +DlxVhuSwXV4J6KLT8rMCjcjxyOHiKLyhDwR76Ex+H1X9PZi4F0jekvmiZCVvbxc4uKj
         aAcgOPXP43kK36le/UwwGMsZpSEzX2nGDawDYv0k+Cs2RhSWzEWoROyQKLM/+LCoMZy3
         +SiQ==
X-Forwarded-Encrypted: i=1; AL+hErGv+YeXxoWEDrhQ+QMN1N0tnVfm9kSYfJQzDZghj5c9wdii3mtg5DC0IiDHoivyMiptUGqecCk167v7Jcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NNp+f6Cl4E3WARsEuURLGJBvkEdYxOp8M+LUexV63VvTaWf/0
	Mdf65oY7o6GWX0zN8JQ6MYBg+raG3RDFXR05S/4XpWa7bXtPtC4lJXyP
X-Gm-Gg: AYBFou2QKyJcEj7zjYI/G+0jmRUr0XsfHX7GtLu3m7nOAs3qxMolQOn//Ur/cTZNprd
	eY9a6nLhMHqxJf+BDrTzEDJJ+c426T9GfM7TVAoPLPm2GpCk6LZrMkWBbxwImFOMlIPYeO+LVmw
	AFsKEgjL9F/KGrBiA1Dvh+9qr+Xr+b90DKkecFGkizRtm+GkYNMc0S6mBxQFuKqcfHV3er5HZST
	cl1d1ZOF9U0aqAI7fQfdXRcK9Dr4OwHHG9CQZo4FZ+bCiyg6+YJoHxNDPdd9+Jd//XpomWopicn
	3PA/udBEBZFWjzO3UvxY73LULUzLszp5WwdJBoj2yBj7Fpmpk1vz1sFy/11Ij/ig/RYOUOAvqVW
	Sy+22wN0Zbbm4Q7AtXePXa82TFG+VnMfyj/Mr/1TB7JNxqDLNClN3k0wWiAtNMP0CoWGeTE9+4Y
	gcznHKcW15sALGx+60tfXapFEk0VRHf+YqT6h54QxbdXpu7MWADZQfrHz5nEs8JQa8vvfv63E7V
	bR11ZrpzYV4nuGIYu8oCthMeWa+O9EB8bdUGYmusZFIiBPBjcUYxLdne1SyAtITVf89x99M8GL0
	hg1+mSLtpsNX7PFP6EX2EYhsnKhl4koV7uy3NL7PSje49vQZw2rvUAnh9NERRjwk7J2/hyulzXT
	qYedCshOmk7OVnoGoFCPl5w+LbhhormUGc71TU500ggyTFUOjqVOvkSaqtj//gykTvV+Au2MNID
	VDgKTvqE3opfpDvi+tAXPSKUUV530i6xnqOY8aUp35C3U+0eHzYRnvFC3r6kJOPvkYY2QiLh3Vo
	15/8JY=
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr107658985e9.8.1794662520855;
        Sat, 14 Nov 2026 05:22:00 -0800 (PST)
Received: from martell.martell0x1 ([156.211.252.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm379872675e9.1.2026.11.14.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:22:00 -0800 (PST)
From: Marwan Mohamed Zein <marawanzein222@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamir@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	Marwan Mohamed Zein <marawanzein222@gmail.com>,
	spidermana <xuyiwen14@gmail.com>
Subject: [PATCH v2] rust: kernel: fix lifetime of copy_from_iter_raw
Date: Sat, 14 Nov 2026 15:21:55 +0200
Message-ID: <20261114132156.49243-1-marawanzein222@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
References: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The returned slice is derived from `out`, but lifetime elision
ties it to `self` because this is a method. Explicitly bind the
return lifetime to `out` so the returned slice cannot outlive
its backing buffer.

Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURCE")
Cc: stable@vger.kernel.org
Reported-by: spidermana <xuyiwen14@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1265
Signed-off-by: Marwan Mohamed Zein <marawanzein222@gmail.com>
---
 v2:
- Use full name in author and sign-off.
- Add Fixes and Cc: stable tags as suggested by Miguel Ojeda.

 rust/kernel/iov.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index 43bae8923..8caf04518 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -161,7 +161,7 @@ pub fn copy_from_iter_vec<A: Allocator>(
     ///
     /// This will never write uninitialized bytes to the provided buffer.
     #[inline]
-    pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
+    pub fn copy_from_iter_raw<'a>(&mut self, out: &'a mut [MaybeUninit<u8>]) -> &'a mut [u8] {
         let capacity = out.len();
         let out = out.as_mut_ptr().cast::<u8>();
 

base-commit: ee83899302a0457a3ba47464a13e8682bd7ba27d
-- 
2.47.3

