Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794771103;
	b=E1MhLDgYCuLiduvxIe0Ul53WPg1QCSawL8B2e7z7UMraMCOnPozkDZPW+wHoi7fWDKpA
	 rf2+WtqFudmT+tUdytgVUgXhrJuArl2jaN6jwv/sVu1KmgIrpC0uNwav5ngaB+4vYDSWV
	 sMYcj2Z/4DzVKfGH0Q+/0Vv+fBPS8Rv370hG5qVyr0JezXJdeMhzlcwLmArdzhkl6kK+I
	 tXTnAjh7PLoVv4nKsManCdknKXjBliyb0eTQqcRhu+e5v2yWgBwdS2t1sOgVqi/KVrU/r
	 Uajdc+apTBfAOD1ioiDMgUjC5JbRKkgklJMOanNUuratgadlCj5fOd5JRZvvNazD9JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771103;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=BndXpEwc7QvrELPg8DD1L3ep/MehGYaFqtzWLhKMyy8=;
	b=zsce01OT5MgtPA5AZL+r9zHN/Dw0OQemUwyeGMO7DX3KnUMXqzQnMAxwUfp2ABncjj7t
	 JuC+CwE/GE+/OGYvmUu0Cfh0TVFt3xZUQQ0LSN5lTNRCeXkPtpOTAQjmGrM0d+AMUBgh0
	 /FVcXCu/3Zc4suqea/0JSDawr8oExoXcchnIKMGK60ufygkUqNnI+vCLr+xXYIl3zWH3o
	 9I5K5iVw3pHUqHmLiB+JjwOXl567RdeU79dsmdH41/tJenUB/lefp1jlXu00ClP6vZthl
	 LNjewiChoP3xjZBn/DfWdidI6dcGVTwIQBF3b0Fmtl9nr0jPkElOEjCG8rq/QNrMYjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=hanbings.io;
	spf=pass smtp.mailfrom=hanbings.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FF606A8A6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841FF606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hanbings.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hanbings.io
ARC-Seal: i=1; a=rsa-sha256; t=1794771076; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OQHhCsNkIqsNLwT4ZmZ/9Br13DqMn6yvnh1ikJ3hkT2IdZ6GI+wlLb2v3ysSQmzVlCuibwJOJMa2u+KaobZWl1wD+gyBjrERnGj0/VVHftsUN83jGdG97z6g8/rxLpZy4NWL9l3SS+syE5E9dE+ib9HNg2ns4c8qCIi50kuTU2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794771076; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BndXpEwc7QvrELPg8DD1L3ep/MehGYaFqtzWLhKMyy8=; 
	b=j8EmMUQUWf8gCZy5cbiS3CqBhr+u9SEIuylpLvLxjQ7DtK8Jt1pS54LPED7ujGA2OW2Na/kudt/olY6r5VJZTmfOVeWdrFyY6TYDKLl8hMoD2ePdMfLX71zbEcYtXXgvlG5ehyTPKHs5cmSgLIEuc5c8biRKH089jVavZf5MBzU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hanbings.io;
	spf=pass  smtp.mailfrom=hanbings@hanbings.io;
	dmarc=pass header.from=<hanbings@hanbings.io>
DKIM-Signature: a=rsa-sha256; b=EAxOAjLykNHjWU3WTuPRPyWIzz0MXS1zpmOGZ6WsqI19tsRofjOYM7JxoISdq79rOmgoAbib1XsrMuieDO4/WGvB78gkd6fBPRkNuHYR/9cGPCuLSSUZKZqdz9iXg1cmIZsWtKzxIWsSUmTYb7IbRwnlKVehfE6xELfXFjiG2/4=; c=relaxed/relaxed; s=zmail; d=hanbings.io; v=1; bh=BndXpEwc7QvrELPg8DD1L3ep/MehGYaFqtzWLhKMyy8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179477107205888.90735348889439;
	Sun, 15 Nov 2026 11:31:12 -0800 (PST)
From: hanbings <hanbings@hanbings.io>
To: Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Fix off-by-one in bt_address() exception vector check
Date: Mon, 16 Nov 2026 03:31:07 +0800
Message-ID: <20261115193107.571674-1-hanbings@hanbings.io>
X-Mailer: git-send-email 2.54.0
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
X-ZohoMailClient: External

EXCCODE_INT_END names the last valid interrupt exception code, not an
exclusive upper bound.  Since INT_AVEC is 14:

    EXCCODE_INT_NUM = INT_AVEC + 1 = 15
    EXCCODE_INT_END = EXCCODE_INT_START + EXCCODE_INT_NUM - 1 = 78

trap_init() installs handle_vint for vectors 64 through 78 inclusive,
and the switch in bt_address() also maps types up to EXCCODE_INT_END
inclusive.  But the range check uses:

    ra < eentry + EXCCODE_INT_END * VECSIZE

which stops at the start of vector 78, so an address in the last
interrupt vector is never translated.  For example, eentry + 78 *
VECSIZE + 0x154 is rejected instead of being mapped to handle_vint +
0x154.

The off-by-one has existed since the ORC unwinder was added; at that
time EXCCODE_INT_END was 77, so vector 77 was excluded.  After AVEC
support made vector 78 the last interrupt vector, vector 78 is the one
that is excluded.  Before commit 4cd641a79e69 ("LoongArch: Remove
unnecessary checks for ORC unwinder"), this silently ended the unwind.
Since that commit, bt_address() returns 0 and unwind_next_frame()
logs:

    cannot find unwind pc at ...

Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
Cc: stable@vger.kernel.org
Signed-off-by: hanbings <hanbings@hanbings.io>
---
 arch/loongarch/kernel/unwind_orc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 9cfb5bb19..784edf6a7 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -366,7 +366,7 @@ static inline unsigned long bt_address(unsigned long ra)
 	}
 #endif
 
-	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
+	if (ra >= eentry && ra < eentry + (EXCCODE_INT_END + 1) * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
 		unsigned long offset = (ra - eentry) % VECSIZE;

base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
-- 
2.54.0

