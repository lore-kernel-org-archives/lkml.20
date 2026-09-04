Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64548382E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524463; cv=none; b=rkJklRk9zonLL/ToWONSb5K5iHJ07hpWwNP0xPUqnzGABsheLvn8vNxWBZAszw95NipeYfqIlCNvkGuJ2Lavy32HU16RtIUKiKaCVkCo6o5/7MWNEPqQPcruxr2pmSZ7qnUuZvNgj/Bto3DlmsjqyBO9HY3wahXKFskL0P85paQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524463; c=relaxed/simple;
	bh=b+gpWssu12F4i0OEGC8C/+EhUAK88NZVa4aV8HY1fV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROQEFs/yE//TZB+TV7bb2JeD8nS7s2D0/0R7zIcdQNADRG705ugeflHGdc+LaPw6XrMM/KPzhbeTEnyjXtWj7YGhm13PevPu02RgY5G+erdZgVOPxI5w+dw/idPdK/xB1RC3DEDTL/ngdrFuklGylCnjqIiKGJWgr8Wwp5ehldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jr4xfELo; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jr4xfELo"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso796215a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524461; x=1789129261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hd4PSrEusbAFa4INILvOws+6RzUQJp6h+WgDUNey2JU=;
        b=jr4xfELoSdeQtfBHZ/ORpzx/+zdBqpkhjDmuyUDtHxhdnoGhr3RyShKhCbmoZKpyi9
         JQu0GOpQ76eNxj2MBoYzeCYJ+L0+SkUc5hQj7n7PVlGNBVXX05jxrnkxZvxg8WJ4FHRG
         ckMb9JtEDys7jBeVevP6G//yIDs2IeEZA7AoCrYxN4Tc0JdjNdWY1kBej5CDLIJjF/xg
         b8dWFFKBCOv/vt767zFL4jVKoB/puubXWWnNIz+GKrNOQvXLPgt/oeJAhQxoHOBrAwl7
         4YPjL61X2gK8RkID6S4JQdF/lmxe8b11HpBmoirqLNl/xhmS97g8m/O87t9FVWDIwC+Q
         mbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524461; x=1789129261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hd4PSrEusbAFa4INILvOws+6RzUQJp6h+WgDUNey2JU=;
        b=N7FYCLYCLcFyC/nTpRHQiZfs+a+fh9QXbk+KX/e464MSTxdOaDt/Kfu4Cg3YxwWR16
         ii/EkmLmJxwdcNkCNz00x/zZLVZzYAsspX+iFefG3P6HBj7Z49d7+J5YAHcLfvj2KgcE
         V4jrbIA4tVLsW+1v8MAX1FnhqHzLa0F3pf/Dgsm0DN2pYLiIexcK9cCjLbx5Q7jhpcxm
         tDL9AodYuESehYWOwYon4L8dtc0r1aXsDZCWW7ZhvKQH0S9wl1UXKVabKU4KfvZSXeMB
         rmdV4qf+fQBlUeGzYOXWy/nRwtkuUTAZoLPC6UCjRAVZ/8ntpP2B00xBbuMinl5aWUUI
         wyyQ==
X-Gm-Message-State: AFuF++mqk+iW/tGS0thr6O94fIXPaPFqlyjsIwDi47fyMLpmLIOypg/r
	/UxAXtEdPt4gEaLCNzi0Z5ckbJUNN6H1JbozCGruWtetshQorGaEI4jIleRgmF/c2eU=
X-Gm-Gg: AYBFou3Q2Q9t+H4KWTGQImxiIqn72VPWXfJyAx6jW/EA3R/K9kieUoEMcSbqLp5WPdw
	5ywAZ8aDytEjO2f4gk3bth0Kvw9OYossO/mX7qnsEvu1QTxBtvTEgwIwfpQc3c1nZ0OPvv+oB17
	218n8QwSI89G8QN6UJdKOU2nGT1hMlW8Zc3xLg5q8N0o7NBCXLZQZEx6rUkL63MhinW/ST/k5C7
	DaNl9LKCGdODzhrrMk5ZZM9+YrBcjXqg0nONooHVwMzQSQOAPrJHYEmuj8/ojNcCYn9Ir0uxUOD
	FXUCJqlWwXcRm1ChWl5N1du2ANcTAH0G8BOhdKtY7QBbBNunFahQEJoaLCulJyTN2l3z6Nn0Xsa
	hghzYCqmS6FU/be0dSgb4vhQHMz1ZTcE5ZIfmsbUmlEJmamUaqzQttx+2Bt/ZsYMDB5Om0l9Bl1
	/ZX/gXIOFfgEYvzzV+M110UXjiOQheMwQiUZ2p0ZuQM4vMYVLG5ysvniEwfOSBGY4sfUgYFjbpo
	BGs5SJOIE5AC7MzK1ayqngVHbGo026juU+nQA==
X-Received: by 2002:a05:6820:1694:b0:6b7:83d6:2932 with SMTP id 006d021491bc7-6b783d62f07mr1483331eaf.53.1788524460754;
        Fri, 04 Sep 2026 05:21:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm7116019eec.21.2026.09.04.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/3] elf: fix typo "accomodate" in comment
Date: Fri,  4 Sep 2026 17:50:50 +0530
Message-ID: <20260904122054.28531-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122054.28531-1-hemanth.selam@gmail.com>
References: <20260904122054.28531-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "accomodate" to "accommodate", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/elf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index ee30dcd80901..91995dbd3ad3 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -408,7 +408,7 @@ typedef struct elf64_shdr {
 #define NT_AUXV		6
 /*
  * Note to userspace developers: size of NT_SIGINFO note may increase
- * in the future to accomodate more fields, don't assume it is fixed!
+ * in the future to accommodate more fields, don't assume it is fixed!
  */
 #define NN_SIGINFO      "CORE"
 #define NT_SIGINFO      0x53494749
-- 
2.48.1

