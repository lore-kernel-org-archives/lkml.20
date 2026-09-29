Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3E2C08BB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643650; cv=none; b=Ef5/Lw7bvMWnwThCqatqprHQaYVKuRZfFROZPTvnqO+/UC2t9yfuYYHsvx6iJkW0Z9wEb3mzeM7MMNemA33nGKi93BPM/UyN59uLh2ck4zKps1Ee6h/LDR3RuDPS00Xj7LXcQhf86dgiMAQKIj2Vwj4lwYObtGA5xFrpcM7GypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643650; c=relaxed/simple;
	bh=tTvzke3DfKKWtYV8+SwzyB0UUAV5X0AJTYUDzhIU7pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jM5Yl3w5u4okJi8lcymdDDrFDS6nHTBR9WTE2N+txQZEew4wzBiu3oiCpSFbqUSZkXvELpqMiyOHMisz0xLuR/RjUL9EALDFFu+a0edOpmjWqOz7VA5/XRs5Q2/ieoMWGM/ObvljyLPUDXMSHZIbppsvVaA8i4dBjlmC18ltbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoDDDKpK; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoDDDKpK"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6d8d3336db0so506030eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643648; x=1791248448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6it+SmeVeHMYo8qun+39zeU0I/4M6Z51mplDGX3Lxkg=;
        b=AoDDDKpKwmXEmG4TjHmmL/aw293eFXnAK2hSnhnZPH72muSYcqOQQTj37QaccBGs93
         uw19NqPGroF8JVWNDhdHfldDqDgshPT19+OX/bzHXKBYGdiTTDTplPetWaNrd0BnJWks
         bSJd8Ts2U2ln5CJ9KYM/UJl7RFN8/gq+LDeJCN+9xXswFhq3fBSerWdEnHrT11vTwUjy
         QnHfiCocnAV67fFyl4lliq970mT9C80BO8FiWajGhj8kTvj1smNoDhnNmmF7LhtGWbAA
         cP4mwqzAMUq0WTobVnVczCpvJ+zkkf/XGwHXESg5EYBSZyUYwWcvf9tpPjt8ewLwub5C
         qwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643648; x=1791248448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6it+SmeVeHMYo8qun+39zeU0I/4M6Z51mplDGX3Lxkg=;
        b=rY5oaABnsxC6LIEp5ldBVJgqO1mrxRU7wYRopWE+vyHdQuMa3XT/xSjTdeuZ4JvLpL
         hy06guhG3W2NpZ5KSkGDbzRtcZwf48n5ENprMgDmrQwesu8cXS6FIcI2ROHNihhRw8jq
         RwA3xzIgZ48qpD1MwBfBkuvwW1CGJBPkzrxoYGfUFwcKdrudrWpMjeSr2FTb/9gF8dZd
         ovEm7TXRPcr/1z7WVU1AToaWGhpMTYKQrUX1+Vp2iM3uALBej9r7wXE/F9a6vVyQqSoa
         8EIOeaPYjkZI23IPsPrcH8zCmhqxJ0mAj4kaKL+M1H7zdctWqrNKZ6XNEktoSkJE8wlb
         P3UQ==
X-Forwarded-Encrypted: i=1; AKwUvBygsMh+7aAbK/W3QcjtYu4BfBgHgjRS/Njg7imFU3IlMa9fS6z1j+Q+1CKZAkCmGSwcw5A+firFgxH1DuU=@vger.kernel.org
X-Gm-Message-State: AFuF++mG2JyiRPcNqG/hJWcEpvJDfJsNjuAchISvWhEJFx+RltCRyUh3
	Sfc+w+A55rcMrLOfLbqhXLAu+9TJHx3hn2ArFElz+pNDWgu1vIHttQUx
X-Gm-Gg: AYBFou3b+sfQwfsv2rZPH1UXVkxAyg0+2RTg8nxZ/zoq/GwXWX0h/6sHzqYpo/6xZKE
	CaMVtA228MzLpXwOiftlwR3a57jsSj2HQPHU1MNacl+1umwcuKaQDV67ctoiRkzVSH7Wv/lPgfi
	iU9R3gVHe+K8Ueg+Aw4iNNw3B+Yz1uRv6dJadG6wL6T3ONifnHyQUP4OT7dKR9jev0EStdF6rX7
	Ofx1z/B/KfhWR8CfkVIgEFVQWyMT1+7H5zirJhfvaNGSQtHF/vbQrFlM9cwdBSTwVrckyUS+fjr
	UrQg8efPae7icnYAKbg95u69gFyFl7Bq48ZKTVJ7NE0fc5VfdIlpYfhpFv+tnG000hRaull1Bij
	xIbv7AOq5GyQgZWqDUc5iiEDLfqH22rcihYXFeQceIpTiuzl5Wg8n6NtuR2uTYSW3Z+b7gPrn1g
	uuacWqDMskZd5y9srkgzrWyNk9ZMJbpYk2BmVrlbt1ASg9QH3cmQTPN2PwBvbJqTWQOBvpjUcv6
	ItwjR8NBqWgMTwyj87y2tY1+pvjnYNUHiR4VdyVCUKA/61L/ig=
X-Received: by 2002:a05:6820:827:b0:6da:9dae:a22 with SMTP id 006d021491bc7-6da9dae1613mr1713830eaf.62.1790643647899;
        Mon, 28 Sep 2026 18:00:47 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d88358bb8dsm6410092eaf.14.2026.09.28.18.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:00:46 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests/filesystems: expect EINVAL from overlayfs in fscontext_ns_test
Date: Mon, 28 Sep 2026 20:00:44 -0500
Message-ID: <20260929010044.5297-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a518e63c3775 ("ovl: return EINVAL instead of EIO in case of
mismatched user_ns"), overlayfs refuses a context created in another
user namespace with EINVAL, like binfmt_misc does. The test still
expects EIO, so it fails:

  # fscontext_ns_test.c:208:create_from_descendant_userns:Expected variant->expected_errno (5) == errno (22)
  #          FAIL  fscontext_ns.overlay.create_from_descendant_userns

Expect EINVAL.

Fixes: a518e63c3775 ("ovl: return EINVAL instead of EIO in case of mismatched user_ns")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on next-20260925 in QEMU: fails as above without this patch, and
    all 3 tests pass with it.

 .../selftests/filesystems/fscontext_ns/fscontext_ns_test.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c b/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c
index 0f30a3e6e197..535bf1f4e1a3 100644
--- a/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c
+++ b/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test.c
@@ -193,7 +193,7 @@ FIXTURE_VARIANT_ADD(fscontext_ns, binfmt_misc) {
 
 FIXTURE_VARIANT_ADD(fscontext_ns, overlay) {
 	.fsname = "overlay",
-	.expected_errno = EIO,
+	.expected_errno = EINVAL,
 };
 
 TEST_F(fscontext_ns, create_from_descendant_userns)

base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
-- 
2.55.0

