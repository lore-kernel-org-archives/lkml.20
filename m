Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720390;
	b=cMGzEug32SnHFzME5Gqc2YIfqCzg60U+aaOFY3u7sZl7P2CGJOWO7vs2/IF6UZHtyvuf
	 pw9u0JqMO1+ZJviOkxwecM00QPmunpLa3h6BpLazgc8ZnuD4MnwU/KaO/+dakv+RkPz3v
	 uqPdrrH1kV6Nl4OrUjWcUgB62jiWT7id8NStNtzJ+IuSdSzk+0fvAQacXoYfjJ8qa7zpm
	 BP0MEzm/vK7xmxxD560JgNmJvei2v3j/ifszDaazAR4pNEBEtSIuXZkhIaJX2WoORLPCC
	 hoWzRmHoF6gQnge09aNStvscUXPFZLQwi78Cu8SPVSUaOamz+O3GF8WIrCy0bHZCO3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j3f7/TUv5Xo7Nj2qDzexywJb0Xg99uvLe5xi0xEDiRo=;
	b=B5kG7NlLpD3iuEg/QrSLnz/PXdqJFmpl3H2XR6iuh5aBE3kEdFP7yhgfJwrQWiZ6N0Sg
	 rZtorjjWfKCBnPwdyOLXkIi+EuK/j0g4TdqBHWUJQhv/S56IlNiV4hBVKFH28BHP5t01B
	 11FTVfCh7j3zZING7Cf0bB/cHpJh+XnLnbKUwz9H2eYjBdpPbF/mWEh9ODRc8nOB1aYVw
	 owOO+YEtxYfkQI4TlqsVBdAvqNXdWK2oHFP1BH+FApV7hoeiOz7AikX0Xyl3w/nx6DGsA
	 JogthZ+KrqgwAO88Cpk+XQLYzSlOUneeB6S045I4hmWdqnnY9kEqvmRIdMnqH6V2pTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6bxeBuj;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65929606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65929606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6bxeBuj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so7079460eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793720389; x=1794325189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3f7/TUv5Xo7Nj2qDzexywJb0Xg99uvLe5xi0xEDiRo=;
        b=q6bxeBujD1wo21D45eGUJ3CvlKBqxUu5ZblXDlqy6I8C1Km8J1bkRWz+5bQaLizYwP
         0gPAMg6EEB1vErHRYcefgtoPlus8JsJZly85cfpTJKOGsDIfCQa/4mVpeTcHd9BnY9u2
         rOP2ZUVXr4BkJfnwzaOvpS6mFrITLsvXjqAIM8XhKVI8xtMSlGlbmYt3Jl0rChyZCf/9
         qkmPtmdx3kRaoHjmhqjagE2J1SFsVE9/oQ7p5beguL5i0REIhcc7baNYgaK2raobqp3b
         /gXu8TqncD6LvDCbcwZnfaM6LMPlxHr11s6c4LqOVT5SCjOndgeRQJV6G8bT0QeIGim2
         SNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720389; x=1794325189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3f7/TUv5Xo7Nj2qDzexywJb0Xg99uvLe5xi0xEDiRo=;
        b=scvq8v3A0YloUiwQCGybJom9oDpW50IL7J8vtuZvpXNJqvjar7XxiSGJWA7mHd9ijO
         fTVIEnza93+saWqJLlba333eif7E09cPc/GMME9QMLnuuxfebqNTDX91GQVCbbw5hddQ
         SSXX1XejS8ECXjqUFax/exOO0y2agvHMyqoYMIs5un/qjgd8nSymgExmbg0sBLnTdS7N
         8Vb1aLPASImsowCVByDOYjo/17+YcEoR6gpqELhpwjKUe7SVo0l15mID9A33LzHSGOau
         8cpxyJImOTjn7cXmKxYiHTb7iG1ZTP8+7pD4jbfijSo1TmEhPlK/7gAVS7mSZhzTYgWb
         2FUA==
X-Forwarded-Encrypted: i=1; AKwUvByFsUfdieGLLV2iU+5vtf+KkqUBGk+0XLF/KiEyyt6uutzMNCZSngDuyTg8t2440YVQNB4y/LKHOARNgFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pT5OvU+GO1h8ej6tPdLTRdjgYibU2moHrsgvrsvvfe4lAhP90
	lDoC3eM+nBrpcuF1pzFxisTIYiqANFJz2Lnj+9/677NdmAUVpxmBEkRY
X-Gm-Gg: AYBFou3Bz9EPymPISoLxjSRKWl8Q2IPxpFvx5Y05wljy3SbDaQoz3uT8tvFo7kM0pWq
	+jHFD9+jlowHhfkWZEfPA+j0KploRkq+z9/aTULAFaKic5sew+ayJ9nW7Fj4OQv8510j7IiIG4x
	XmGmKYY1P/COINihoZtrVD2R+JXPVNAZIs8QuIWKbczCPzU1R8BvMTm8qDlNcXC2X3PTUTqVKJ1
	GVbv6G9Kg5kLu/656hsQnelryVIYmnXQg7Ih6rEEAz/mbawOzQXQiZnpobGHQFmi9ExKYM9sJp7
	sGxXeeTOoB9NTEE1kGmAVUk5gDRW0gkdzDIgQcf4pAC/VGeZcj3z59fTIGFWpkyO5eYhq5DT3Ke
	wvyp3rN2viGkXTyqsVwJjuS3qMZ9s8dxFeZQYRb/jaqBhej8mQ8uiBqHG5T06VU/fhBWHdib3PF
	a//H/sDg/T7DLf/SZpfj9BTiiYRAR5gtczw1MlJe55+TXsE0MgeveFLNMCG68Q1CVnisf8aPYzj
	VRf8MRb1BIfnlu5Ac/6DZeqzt09PAdVnBpDKslBUktNhqlogJiQSn8kGDPB1WyXHrzaJS2WI/M1
	cinYtuNDeyDMQ7l9lyfX4be1XGd9oBuUNua3a9foDZC4DB301qwTC04w
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr1854274eec.26.1793720389408;
        Tue, 03 Nov 2026 07:39:49 -0800 (PST)
Received: from bridge.. (deps54-26.deps.ufsc.br. [150.162.54.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm50492703eec.9.2026.11.03.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:39:48 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] liveupdate: check for duplicate session before growing block set
Date: Tue,  3 Nov 2026 12:39:28 -0300
Message-ID: <20261103153928.716753-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

luo_session_insert() grows the outgoing block set before checking for a
duplicate session name. On -EEXIST the new block stays in the set.

If the session count is an exact multiple of the per-block capacity (51
with 4K pages), that block stays empty. It is serialized with count 0,
which kho_block_set_restore() rejects in the next kernel:

  luo: Block contains invalid entry count: 0
  Kernel panic - not syncing: The incoming tree failed to initialize properly [-EINVAL], disabling live update

Check for the duplicate before growing the block set, as
luo_preserve_file() does with the token.

Fixes: 2a441a14c2c0 ("liveupdate: Remove limit on the number of sessions")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Tested in QEMU: create N sessions, retry "sess-0" to get -EEXIST, then
    kexec and retrieve them. Unpatched, the second kernel panics for N=51
    and N=102; patched, N=1, 51, 52, 102 and 153 all come back.

    Based on v7.4-rc1.

 kernel/liveupdate/luo_session.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f9..74bc66929f4b 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -176,16 +176,6 @@ static int luo_session_insert(struct luo_session_header *sh,
 
 	guard(rwsem_write)(&sh->rwsem);
 
-	/*
-	 * For outgoing we should make sure there is room in serialization array
-	 * for new session.
-	 */
-	if (sh == &luo_session_global.outgoing) {
-		err = kho_block_set_grow(&sh->block_set, sh->count + 1);
-		if (err)
-			return err;
-	}
-
 	/*
 	 * For small number of sessions this loop won't hurt performance
 	 * but if we ever start using a lot of sessions, this might
@@ -196,6 +186,17 @@ static int luo_session_insert(struct luo_session_header *sh,
 		if (!strncmp(it->name, session->name, sizeof(it->name)))
 			return -EEXIST;
 	}
+
+	/*
+	 * For outgoing we should make sure there is room in serialization array
+	 * for new session.
+	 */
+	if (sh == &luo_session_global.outgoing) {
+		err = kho_block_set_grow(&sh->block_set, sh->count + 1);
+		if (err)
+			return err;
+	}
+
 	list_add_tail(&session->list, &sh->list);
 	sh->count++;
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

