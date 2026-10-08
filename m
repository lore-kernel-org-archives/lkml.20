Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715441BA69
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451800; cv=none; b=AN0/zns51HKzOanLlftw/rpgUcOc4oxClNMDisthPDAbyz8srueGngdYwuIP0iQOMH4hPTRLiCeSw948jN+sCAFrbYr0LqS7QhgNl/rsTjtvlfRc4OWQKqzz9H06Mu2BsIoyovSUU9m9e1p2UK4Vi8zWD2hH0skkuniOU2xso1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451800; c=relaxed/simple;
	bh=rg55FcqSkVqJCbehsI5QWQNYt+w/K81JpGADQ4STCa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Os0fiZd/zOCFndF7K4p7Yi4rA1L37bicVL4if1KyHI8X0pY0F1TxDe73F7pZPM37xli5z7sw8TT3iIa3aCMcb1llRv30QwcYjzCSUKdqBf2ePQP9QBMOMC3gFqGUqZC9BVpVC6GBSZHrlPHN1jHt46U50o5gUgo8o2M3bxEZnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4hDIk9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4hDIk9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23791F000FF;
	Thu,  8 Oct 2026 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451797;
	bh=Q3+G/D+A0k1PGX54//zyGFHu51Ao6hmp4yE1N1j7npI=;
	h=From:To:Cc:Subject:Date;
	b=m4hDIk9g6tuj5mgjCJmt5uS3FlsLSnyUYcfNnHv7Oa2VZ3qn9H3+5PXO8q+R9fljj
	 P0N2LEn7qb2EOsHox9Wwnmd8UeCejECCkCwqIreQLLreevnfm12k8vfTIrkvaYysp1
	 Xj81vfNCv7v4W7Zyk5UpIJfEfH1wZohV/e5oK5aHNF+PRNgspjm5a/awWGRlbTmo+0
	 uzj+Igx+qrj4m0pHQXVlHbTF4izH19ndy7EbRGUIimyW6m8fWJKQnKSqDXDUDzj76I
	 dCY/CPS7bStrAMRkd1exWWeY+gUIiH/gWIjHLMeE65Zh79M2yM6mHjzcBKfQ2lndXU
	 QUHAmDMNev9KQ==
From: Thorsten Blum <blum@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	=?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Sagar Taunk <sagartaunk@proton.me>,
	Mohamad Alsadhan <mo@sdhn.cc>,
	Sergey Gordeychik <scadastrangelove@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] binder: replace unsafe NewAllocation transmute with field move
Date: Thu,  8 Oct 2026 11:29:05 +0200
Message-ID: <20261008092906.179725-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=blum@kernel.org; h=from:subject; bh=rg55FcqSkVqJCbehsI5QWQNYt+w/K81JpGADQ4STCa8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnHk5LaU/8Xfn/ipG6i9SxeOdc8bWHgv0/7Yo9JuRg7u Sjc3pjZUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPRWMLI8Cel6y7bhX27H72P P2jna/Fmvmy1ZWdCwwKfWy7nGmU/2TH8z+vy7THYeVqIU9ODL26XKYedXH/Q5VMb7PPPLXUuftX MDwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

NewAllocation does not implement Drop and success() can return its
Allocation field directly. Also remove the now-unused transparent
representation.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/android/binder/allocation.rs | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 165cb797eb1e..be405f2596ae 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -298,17 +298,13 @@ fn drop(&mut self) {
 /// A wrapper around `Allocation` that is being created.
 ///
 /// If the allocation is destroyed while wrapped in this wrapper, then the allocation will be
-/// considered to be part of a failed transaction. Successful transactions avoid that by calling
-/// `success`, which skips the destructor.
-#[repr(transparent)]
+/// considered to be part of a failed transaction. Successful transactions call `success` and
+/// store the returned `Allocation` in the new transaction.
 pub(crate) struct NewAllocation(pub(crate) Allocation);
 
 impl NewAllocation {
     pub(crate) fn success(self) -> Allocation {
-        // This skips the destructor.
-        //
-        // SAFETY: This type is `#[repr(transparent)]`, so the layout matches.
-        unsafe { core::mem::transmute(self) }
+        self.0
     }
 }
 
