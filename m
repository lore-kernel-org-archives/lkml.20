Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9213D47B2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691768; cv=none; b=rFj+mt0tZCE1sQBCVg4Q9KgoUa30JYsbBCR4CwsD5XoxqJ4CXg7LEVGUZOglRZP8jYYKG82CXMx86uBG7og5JATNHylxz6iagD35HS5Eh+GagUxY2/8b1UvP2ddYA7hIdGi4BkUBEpSfs5RPU1IinAZ/w4jGmCV3MHTmKmcGUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691768; c=relaxed/simple;
	bh=DcbTLHD/tVnZXO6Wcep2ztjwIHfAxEpXw9x6ciDS0H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e6iNONicnkoNRmj2R5j8oW4DPumOVxwVo3TmhID/Yizbo649YX0jyFxW15XxBRrb+493eTKuWG+iflVb+x6nu9mUQKhtWJCsC+avvOi4vgAO+vWuBiwI/ySSej5QOv1J9NpypkB3D1LHTZFyreXZM7JroQAyrAdE6oFFqZS4Q2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzhKOUOd; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzhKOUOd"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-145ab8fd39cso3841195c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691766; x=1791296566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0iuzWgmMrAdCcDL0sS3FSyhRSjl5Wen75MYK1Cmll8=;
        b=TzhKOUOdUk+cUebaWxh34KeTsXi0wNW/sqDbbMN8wF8mUtuYRkfh/snmNTAlW+FGR+
         SBVGXzp3PnxIRmMhsh7vJi0uVzdCm21wLOSaB357GAcSiv5jmGoHik9HgpFXCjoDP/HP
         N1QkTmc6BXG8+XuvCA6lYEvkUWI+6rdSS5crZ/aRR2p0OFcanq4tfW4UKu7kUOOFnJCW
         QWVrKXWZB467nQlj/ZPKVslp5/qr/Tka9fr862xgpX/IijoBrGaGigR3W50sN4mT8yBP
         E8zZ6waOJToW0lqkkdugpA1Bem5B5uRX+LqqJao3MyX/yvLQ9Z5jqwlogPMF+d7lzCSx
         EVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691766; x=1791296566;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0iuzWgmMrAdCcDL0sS3FSyhRSjl5Wen75MYK1Cmll8=;
        b=vP8X7W9kSkE8vhp2NN21sgXMltpoM2zK1HSZ7riB8XWgRNODIjTPiNqNMlFnrkuQt6
         xxmdiVI6J04jxh1uE/jiJZzCtTfZeSpOGoz0KnrC0f/2EfgPffaBpbsSw2dfs9D6xXbi
         AoM9pnzXjX5t6VYHkM/9aljgUm/tB9ziosLbc0rksLIOHNThOH7gjfsOFsHm0REHVvni
         ajv7h20mcIvxBMBsM89vhieBRy/AK/8PzrJwns/M6v/ThLOF4uuhEtEgdZ84fQ1GNKSu
         Boh715b7Ort/MVKJ0GBMV/vLN9p+Sl2elAYGfTfYpxgRKR5A4WyeLzUD/Mb+WEsLISeZ
         w3ow==
X-Forwarded-Encrypted: i=1; AKwUvBwRmqfJAG+2CPdR5mcmlwofKzD3Yg1MscMTXpBU/iM3Ux0YhWMnnwHdhcBT/w+yDPsFp9UWzG9TuHLl97w=@vger.kernel.org
X-Gm-Message-State: AFuF++mIVBnXIIOIyo+dE7KQi4cUKoVk4gzWn+C5Z1pFJBzpdf72D583
	8EWTbNSKRbKXV/Nz11AXkJZcm5OEBluPUQZyRkAjVGYaUEbFcU4tD+LbcE57
X-Gm-Gg: AYBFou2rqC9KeWZs2NvxW0B5xgH6SeLqyANHplP0Yk7y789m2a4FgGjavpgOQfIw7r2
	Gm3MOv/hTYovRhEuR88i9x5+G/M/EJvhTC9lySlVkFV8MdPEZ1YOQ8QzFILUrdOIz5OHH7y59jJ
	RTVu2h6FHJymCdESGJ4HcBiiRvNJyTN1lFzoWxOqZaZuZFKHi8AKLc36I3mFPKKIctKCKo3Jv0n
	9xr/tPRJ2GA3F2zJ+4qErcmFa9eF1Q1hYramCij5aza7dbGSCwD6HXHDsUfQo/AWHya3bO9w8Yv
	+LHsrTE30LrMU+NOGHCYpJGoRwFFWobuNeQuI4RARquQtmAyOcIt3jfLwcR3X9PKzGG8iWAF0un
	Gr8JmT8ztIp8S5tKKDDtbq86Rk561jSr8KMZZxOlrn0QKEcs125FIGPLyg1V1eNzI2oCR2Z2Mko
	4PGJY2rkzBnbLb72dEe+PpKX0jjO9WqX/DNX6APYhta1x7MbbnEYjObVOyBX9N3kkAVBH1Y0CSZ
	3JH/8uOSJT3ZtEzDsqQlbhJlm6x1met9ifoR4MNGfMM/P+FdQ==
X-Received: by 2002:a05:693c:65d6:b0:340:c464:1a2f with SMTP id 5a478bee46e88-34270ab09f7mr15069104eec.16.1790691213669;
        Tue, 29 Sep 2026 07:13:33 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:13:29 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/3] rust: kunit: support #[should_panic] and same test name with different #[cfg(...)]
Date: Tue, 29 Sep 2026 11:07:40 -0300
Message-ID: <cover.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series intends to implement two features for KUnit tests
written in Rust. The work is based on a TODO comment made in the
`bitmap.rs` module [1].

Changelog:
- RFC patch: [3]

1. Supporting `#[should_panic]` [2]:

KUnit tests in Rust follow the user-space syntax, but at the moment
`#[should_panic]` is not supported. The first patch of this series adds
support for the attribute (only in its basic form, `#[should_panic =
"message"]` is not supported yet).

The way it is supported is by adding a new boolean property called
`rust_should_panic` to `kunit_attributes` struct in kunit/test.h and
check for the `try_catch->try_result` code and the named flag to detect
if there was a panic in `lib/kunit/test.c::kunit_run_case_catch_errors`
function.

The difference with the previous version [3] is that now, almost
everything is handled in the C side, meaning that we don't have a
separate `#[panic_handler]` when KUnit tests are active. In other words
there's no need of a Rust side panic handler because the C side catches
Rust's panics too, since the `#[panic_hanlder]` executes a
bindings::BUG().

2. Allow same test name with different #[cfg(...)]:

When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
the series) I found that the test that was supposed to panic had the
same name as another one, but they were run on different configurations.
This caused the following compilation error:

ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of_bounds` is defined multiple times
   --> ../rust/kernel/bitmap.rs:503:1
    |
503 | #[macros::kunit_tests(rust_kernel_bitmap)]
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owned_bitmap_out_of_bounds` redefined here
    |
    = note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be defined only once in the value namespace of this module
    = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)

Now, only the tests with an active `#[cfg(...)]` will be executed by the
runner. Tests with an inactive `#[cfg(...)]` will not appear in the
report since they are not added to the TEST_CASES array.

[1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
[2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
[3] https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  rust: kunit: add #[should_panic] support
  rust: kunit: allow same test name with different #[cfg(...)]
  rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case

 include/kunit/test.h   |  1 +
 lib/kunit/attributes.c | 18 ++++++++++++++++
 lib/kunit/test.c       |  5 +++++
 rust/kernel/bitmap.rs  | 40 ++++++++++++++++-------------------
 rust/kernel/kunit.rs   | 37 ++++++++++++++++++++++++++++++++
 rust/macros/kunit.rs   | 48 +++++++++++++++++++++++++++++++++---------
 6 files changed, 117 insertions(+), 32 deletions(-)

--
2.47.3

