Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D94756D7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253595; cv=none; b=IqcfDKa+6fvEKfSzm8vSrK+vgZR47qPYQvhD71fsflUvXvaX60nZtd2RsNYdvQZuw+bFwaK2p5h+UaO0PWx8QFNqPh36kICEk685ldaPmwtB/sW/GMpOsaWzuCag1LlYMfKjN/3zDJVnduhB2ZKwbCooRwiA6hY2HHuN68tp2Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253595; c=relaxed/simple;
	bh=ejGrntjtGvfPfkyT6W0q5VpJtyXA1/IlHLn9s8K3B00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/8/+xtjlKxUvhBUK4yB6cWxwxzahY8fEKl/Bb5NtNKfGUvoerw5l3yt3vZdzFAgS7tRvP699GcE2+LmsERWY4S6nEFTgl6fzQGAORIzN1wNAid+Mxz7+e59srtjblRY9xAoXg915Atcj1leUBpS6nz6/RQv7LCp4XQSnUWHfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RvcTM5fE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=og318Sfw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RvcTM5fE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="og318Sfw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788253582; bh=L0Ljl9cP23EG5pxUfXYPjDe
	OjwgQ7CzTtFWKPjvH1ig=; b=RvcTM5fE9hTj5eqTI87/g5mNt2XL9u0rqiA9dbBzk3aWW9JPDC
	iUDiCPAJy17X0CgkkQEt66uk6HU7pgMYGs7ckr5SBkbNKbDgZsfoETuf7Y0LmSRX3jpqpqdrOaT
	478kp4WAWsl9if7VHzlMl592o/42829M95pbrGQ4l9PgLoYlt/wb0g5Y8NESYBYnklYteA8NZ+y
	vXTYEpm42DBn09t4I5MD4RUhUiP0BXpmMBdZ8HkUfUS9latH2nsO/5KyPa5lRg4I+WnCkFDAN0u
	XtYLPmfNmgYrDRN9+Fc6fTufyo3NQljA1N29KDeiH6Kf2zjTPGv2yHj8c9LZ71ZqDaA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788253582; bh=L0Ljl9cP23EG5pxUfXYPjDe
	OjwgQ7CzTtFWKPjvH1ig=; b=og318SfwfaQLjUgerUSGHL1PFFjEkbpzkLLG8cbD6oq/bD39oj
	0hw4kGQFjCrIeqUwXQRVMYpPLi9ZRdrkV1DQ==;
From: Bradley Morgan <include@grrlz.net>
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gcov: use memcpy for counter value dump in convert_to_gcda
Date: Tue,  1 Sep 2026 09:06:22 +0000
Message-ID: <20260901090622.18431-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

The loop writing gcov_type values one by one is slow and ugly. The
values are already in memory, just copy them.

store_gcov_u64 splits each value into two words with the low part
first, which matches the gcov format on little endian. On big endian
the split is still needed, so keep the loop for BE and use memcpy for
LE.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/gcov/gcc_4_7.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/gcov/gcc_4_7.c b/kernel/gcov/gcc_4_7.c
index 8fa22ababd94..94c240180906 100644
--- a/kernel/gcov/gcc_4_7.c
+++ b/kernel/gcov/gcc_4_7.c
@@ -422,11 +422,23 @@ size_t convert_to_gcda(char *buffer, struct gcov_info *info)
 			pos += store_gcov_u32(buffer, pos,
 				ci_ptr->num * 2 * GCOV_UNIT_SIZE);
 
+#ifdef __LITTLE_ENDIAN
+			/*
+			 * The values are already in memory, just copy them.
+			 * store_gcov_u64 splits each value into two words
+			 * which matches the gcov format on LE. On BE the
+			 * split is still needed so keep the loop there.
+			 */
+			if (buffer)
+				memcpy(buffer + pos, ci_ptr->values,
+				       ci_ptr->num * sizeof(gcov_type));
+			pos += ci_ptr->num * sizeof(gcov_type);
+#else
 			for (cv_idx = 0; cv_idx < ci_ptr->num; cv_idx++) {
 				pos += store_gcov_u64(buffer, pos,
 						      ci_ptr->values[cv_idx]);
 			}
-
+#endif
 			ci_ptr++;
 		}
 	}
-- 
2.47.3

