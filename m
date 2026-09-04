Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681DD46E01F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518318; cv=none; b=D5qwcEP77MlEi/ZCG3Sd+N+/0ZgR3pWbmnToqH65LEKhCFBXTpWsKB8dCBSTFCXxhEj1s2VVSgAVXDgORKvTMBDQuQmyUeGPsXua34nNTZNG0zv0AWYA78FNIf7bSnNKLs8oc4tfcht9AY+0zMl+2sJgSLUXjWORuedGAbnUy5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518318; c=relaxed/simple;
	bh=hrqf0jyjkU0OW+EN/dkVrlGnsBCJhMrfjslOXtc4uDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5qSNKrhT7rD36WPbs4eoVXBN6JMOcD+AvH8o4fcv/6SXWTA5lIeQXj/Ld6WL6GvKW2eb7T+50wr7MXvXe7diXcjNyVdf/NfldZ1PRwOzl3G4IsFU4keKmSVCfq7+ni4FOAiZGLuFKpj4QTm6QarqfwTVKlkVS3xvgClBVu0uLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY4vUvG8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY4vUvG8"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso964788a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518316; x=1789123116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=054o4Lr7yqy/ksle6dmyEe/GjMAK9Y9LzcGMY3tBvRY=;
        b=sY4vUvG8LF8aXkEcg6GyLaV1A4tGzIGw+e61ZafNKhX8HLPhCTPbuTkDI9dlUq3K5V
         01HPWF9cjvoF6+GXjcFdR6ILMuuw2ZT6gkfBRGKTWjrpYHwahOjhtl7zhP41oe8c/5gm
         k6F/FxaQbt1ECqGkOJ0wIn4YJnKxzRFiQ+sxUxRNOebaQgGeWuS2aPYp8KeFUQddh5V4
         TCALh2xF3RI+BCGeFyRRjArtoTvnRWmuZ+6ghTR5+DEKL6FXftqXs9czeOV/5jIbi5IA
         ayvPbg3Q/CMGT6Mn1uLjrs7mYpxEwqe4E/ySuxSyiO9AptOWBoSWtUY88rpcXv79mlnz
         KNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518316; x=1789123116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=054o4Lr7yqy/ksle6dmyEe/GjMAK9Y9LzcGMY3tBvRY=;
        b=XptCRB1W73cXFq9z9FkBuK15L65ckr1BEUm6x/OdvAiXIthNXwkQ0KPqdDXFxWEr9C
         urplPr+I6SvnZjzD47KoFJQVenxW4xpuKjZMSfhBcABPUZHuALuw/IWp4QNW/yi7NNof
         LyVC+f4ECXQ/IDwS8JSXLbx5GBir9NWq6+QgzxIn8Fcev81fPXgq/88azTLFRwdhrHgc
         GDcQEcxsoaYr5pci6cTCl+47alQiotBtuZCfC1pMD96YalRKOE82NJEUcU3UTitP89j6
         g/PTyHjUGDYLK/vAjKD4d/Q3QXcU31S08JIcdhko5lYJljCGIj/eIBOwxPcU0Lj4pBNy
         yZWw==
X-Gm-Message-State: AFuF++k8byENAjtCxs6fv+tdGelnSxAcfjCKe/eFN4E7NeCjpct0prV8
	dSjQSZampiqLgYO2a+u3Vo/GiYPSTAvWSOWK1n29zdcQUzlAiqWXH6BM
X-Gm-Gg: AYBFou2SUhSSMqcY30s6h999VMZQD3OVaJ9VotDNrxyYD/Zu9xx4OP6QUGgIgPnBjas
	NrrJ4nM0wEcfuahN7Dyw5x2DaHngOcapyODlzylu5aT+NByHl5I3CQx11UGh9vOOF+XaV3BQW99
	09tfNBrcctphaoHcCrPKSa5v9VuWo+Oti2WbZav4Tm6Qrn1oFqyts6pzUkL3OzLAbZlzRWfOoDa
	r4n226iqaNDx20dtDC14yoSL96Iv8AfppVRvHe9QxgLqqKvglioPi1BiMdo0gIkTBF3R5UyKG/e
	pA7AenOeddc29+5UfG1vswiP2c3P9hLNqoq02AY0nq/bnNVIpA7cpkpJfLN3DZu6InuiKM/1kJw
	qYa0flmG7IGWfDOH7xhN8ihpZl36xKJst912vt7dFxt9F+PjqRD81eciMCSVQegDSEXIx6bOCIR
	KXUI4nMjSui6Ox+aG6sEVjnU6Z30A3F+A6lrTv7WymY5Wf8lIiWs4Szkx9G20mFZxaSZreP7YM7
	Ph1Vdxhf6fMNgk=
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr7458449a91.1.1788518315763;
        Fri, 04 Sep 2026 03:38:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm6021835eec.12.2026.09.04.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:38:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 2/2] iomap: fix repeated word 'the' in comment
Date: Fri,  4 Sep 2026 16:08:23 +0530
Message-ID: <20260904103825.8752-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904103825.8752-1-hemanth.selam@gmail.com>
References: <20260904103825.8752-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'the', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/iomap/buffered-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 0a5ebfda90f1..d42751d6f5ff 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1708,7 +1708,7 @@ static int iomap_zero_iter(struct iomap_iter *iter, bool *did_zero,
  * @iomap_flags: Flags to set on the associated iomap to track the batch.
  *
  * Returns the folio count directly. Also returns the associated control flag if
- * the the batch lookup is performed and the expected offset of a subsequent
+ * the batch lookup is performed and the expected offset of a subsequent
  * lookup via out params. The caller is responsible to set the flag on the
  * associated iomap.
  */
-- 
2.48.1

