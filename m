Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E0448393
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772379; cv=none; b=gLxajs83YBjWDzErC9kUXRZoOTN0u+pWmlm8wumR9HlP81C8nGACI1CT2Q7hcLanbE2R+gc0Ty4F2sc/I/zXURioSasYuxPIHoE+PPgTxWLxHe4oCgRNhXJL6VcbsOaJPYsrv9/4Fq6KeUGVMOfrtJ4hHZMk/RTW5lMfRpa6RXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772379; c=relaxed/simple;
	bh=XvQtuQBIqVT6YauqvGvh+z0ZvixSJt29gwUp76mkmj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCF6x6vNCNUHd/Q9gUSF4tON99cxKIWIChjT+GAFdgWhOWuan7r+5HN1iaWDqNRdJoScJQdORD/Rk3O8iDkzdxI5xzMQH/f9Fa11ZJKxLspTyy/hX+K8HCQWZJGlL97ztsfR9BL+ISEky06SFap2s2hCnkmzK/7pY2YATe+17fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmF6k/vw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmF6k/vw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d7200b2e15so34380355ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772374; x=1789377174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=;
        b=kmF6k/vwoDR7LBBiWcv+japgU49apLNUr89hHvy/5Zg0uytvAN3nZBQOYIE5lSVgmA
         3YzZJprzyM/+TWJJ6iFGMPcm9QpckatxT2Tu10JyRPtETmLsel/+P074icuTSOcV1n2N
         rjz8+oAWUdAHQ4ZuK7M9WhQDuUvhldiOX1MAQZxMgrz0grhH/L0Zk1ds1GqmWWjkXBvg
         RQvJZUCelLrvKKYKtTCjTKQ/acOtV+GafIbmQnJv1+T0cHDzW66g0V7LlcZqfRJXYMi6
         EaxQmnaABoo4JouIfwqch3XmJToa2mPTJeV+PuB5zHJNTe8LedQq09OozUZTlw0vgD3A
         L8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772374; x=1789377174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=;
        b=Vdm6PxrsxvTe1RQqAszL/sR2v8kg2SYeLmmRWmuLv88HhY7Pp+v+aBinCh7EwhjZSb
         JFKLlaHgqME+2oKtC7fwUsU6Fg/jrz9JdraKsoPa8WBMZYYM9BCGbDzagjHD2/4zGYu2
         GTLlGqPqbkdP6l0vLGvQFLPc5DK6D2qzabJbcqCd/3JqxXIRfnBn7msCLdE8X3oHCvNE
         yChddaueNpswy1Lmsmd1ezIFZ1BNwJotvPtRY3x5LrGyWiJUGumpb2lB8onH37ZhpAcb
         Htp9GJ6xkVPlg8OrNGOeXzakE6Vl+5mtWtx+eUIF/Dam4V886M2/dfYFZ/xgt9W16SKz
         baow==
X-Forwarded-Encrypted: i=1; AKwUvByVykL/SXt8zSgyA5yuyTrX7aIw8b4/L6KBdBgxVAng+u3CGZl68yYuWD0ywsp2N8doCFbwI1rs6WvkRYU=@vger.kernel.org
X-Gm-Message-State: AFuF++mp9m1HK96/kvDd88gjpzDVNcL5OxTzfIxtb7bZqWpoxIeUCGr+
	J6oFQh1jriS3geJYIww1HR9q78BBatt33VtmdfZfy6PRBzeIsQsKNmLD
X-Gm-Gg: AYBFou1lXQ/SPxnc7mnJZ7KFq5+Zwk++lrmdOdIZ4HyuFfCGPmhEoncWJLbb6bhD/kN
	gYrCcyw2dNgxOZe4nT7r36VWL1GUU2ylusRNRO4iBAVWuX7i/x8ftOp03UfbWNkYC/c9fecl+iu
	7TIK49/TwK1JwNQAglck8Xza0eIaLZozrf6GannHT4AINbYXbUXMRH9uuP2ySW0UEe/9l6V8xK4
	ghdl6Io3TULx/G3UnQXpwmkCcOdDmcAFd8XaUdrMM3Q9bWunNwYgTfUq5TUvPtYtGnVDbjuDtvn
	3ShKCInLglE+2Vh2LxHxirqDo5BLY3TixOzITGeeyc1Jk1+7JbpGkbVtLB9o4nTHfD3CuopvTJb
	Y7F64QgkV8+YkjRJCq/NE9FS3XvrO7s8Y3R8ZTBi1IiymbtwYpcZfa4KkZRPWB35s9v08j0tUKr
	5LIcDy6WukzCOweB9/neBUHthQUU0Zk38Juk+I69Jszl1aYDZa4T/xi+jGimIVQdSCzddDMrL2U
	7zW/pl4gPHjSA==
X-Received: by 2002:a17:90a:d00e:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39b262409e5mr34469498a91.25.1788772374311;
        Mon, 07 Sep 2026 02:12:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm25086123eec.0.2026.09.07.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:12:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: arm64: Fix typo "initalised" in booting.rst
Date: Mon,  7 Sep 2026 14:42:48 +0530
Message-ID: <20260907091248.31415-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling "initalised" in the arm64 booting document.

v1 changed it to "initialized", which quietly moved the file from
British to American spelling.  Randy Dunlap pointed out that
doc-guide/checkpatch.rst asks that both spellings be left alone, so
this uses "initialised" and only fixes the missing "i".

checkpatch.pl suggested "initialized" because scripts/spelling.txt maps
these two entries to the American form; that is addressed separately.

Only the documentation text changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..891fd22f7229 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -588,7 +588,7 @@ following manner:
 
 - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
   property in their cpu node.  This property identifies a
-  naturally-aligned 64-bit zero-initalised memory location.
+  naturally-aligned 64-bit zero-initialised memory location.
 
   These CPUs should spin outside of the kernel in a reserved area of
   memory (communicated to the kernel by a /memreserve/ region in the
