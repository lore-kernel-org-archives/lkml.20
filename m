Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12F47426F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523751; cv=none; b=Mw8VmGVG5+MKRcVbT64c7l6zBzjn+h9yqMW2lxtAXULQGjI4ojqbjBE/IJAZDJJbzlRYdIR2vlVRrzsMkxJW4uI1nB+jpfZgmF/0izl2FSq22exiNx6kiMlyAQWfu+pewROix6Gs6gFv17tSdIsYiANfNux92iVS19MFtwyh75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523751; c=relaxed/simple;
	bh=QDbW+PP7RmEGFUx5i7K/d9Z75hrQRBhakSjU3DZDJmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYDydx6Pc6uNznHY+LmMZIaEnKnwYGjmYq4niLtQmPc/X23V0tK5BliFQ7oGfFJT4l4yiCWeAOrPpPS4mx3iG3cZ4qDbA/Mn7k9tjsKFQlIiUepYAUEOwi483tlSdeDZ+gsDKARPDVJtRBL4tHYum3WRrAhFASTiAUIbixRuemQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=folFgJRo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="folFgJRo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6efd73032so17610985ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523748; x=1789128548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bi/TyPhd7e1pxmGeouC4FIAlsi+yXBXw89IpRah4BD0=;
        b=folFgJRoHzimU0LTR5b9uuQJQXfJy589U133D8FwiFPM33vd6/7crtLxErJPIrJTIy
         3gUXanVT5rqMu+zHHNL2NleQUu4qwKmBRSr89n7kSwZvrTEarE6GiwoBj51Eq53ieH0N
         aGDU18naaLZsUiekxXjA4IoNF1rQH6dQrbC6HzT67ddYdAq4ktlRJ8aMR+IDJBTa0Wk/
         9Vbwe1lg4rrR/thWjJBTR2+dgc/qRggWq0Fr7LyUQWxrwN5BOBS3zhlvpOPzfeTBqK/P
         vQYu5yFBw0o1sTJnhFg6PYdGw3uB/pJkFxMJiTaXEFeYYFn3PpSz2zj/uwBBAkhA4jGf
         Xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523748; x=1789128548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bi/TyPhd7e1pxmGeouC4FIAlsi+yXBXw89IpRah4BD0=;
        b=E5r8dRgnrJvd8qTOGRwTx+zMtoC4w8xtB/HLLuyylVooEebA93BwxXtstpgrCDcrkC
         Zxlx86lbxbr8T7fm+krqnlUzp2CpTl65nS3cjz5QNZIokssSae9xnwEYYJogMbhCELb/
         FXcy0a1/yNxDcHPUk0Qjv9+3Fa06J+M0R9xmDNEftwlxMiPaHqgKrhW2F/aImqI5C27U
         ennc7A4uQYynaEMmWbpC5Vcx299NhnwVwvGekunMlgI1CkHTKGDI+tag0JL4gSiEob8F
         eQBjct8/mrp+Kck3yHvXWR6bcvgoN3ulA+5h33yyP9PHIriWen4fmexnWK/0PEkBH4j/
         2OQA==
X-Gm-Message-State: AFuF++my/L1acpwRtlQWtmX7cLYcfOK+udv8/HnVJRAzUc/HdmdNDI4L
	bRpP9tc7zknKK8SKQq8L8N64QzDh1DQc5ifOGEP5dARqH6q0rZfAuzGW
X-Gm-Gg: AYBFou1a6KrPwO4F5e0pzhtTShYhOdOB62ZIlLsHO3fwiV9LvntU9X4RzbiBWaZ7pUz
	7qq9ZJTpQw/toHw24YwRk5+e1OuT2Bvc3wLH9muikZ6PBlgRgGta/NI5ThkLq1j2eycYd9ATu1T
	587HJuwbK8JlTpjkepq3k1IbJpUYYb6/9BXsih2XzsrD9BBcTbQ1whisHwyHlS0qQhrt8jfxMze
	z+vrDNOiWSUwCpUkeYkBrXVc0juwvzrmOP7LatnW7MqJGcx0GwIyxCi1grwskIHqZHxlqaebneW
	fAk1WziCQlKATvkvpxq6PDBZw5LIL43ZIqOPpI0B/mGX36WrO/jj0myDkOeK0n7ESARFhsOgKIs
	0prBMC9d1c23DCzQ1svZwWOAgsgdG+AJJAZz2CqvUBDqfQ61q+OpY1L2yKDghIH1h6YUxbiu/5y
	VyKpkljPxRdO6E/oROgI9KeA/XgIzn/48aLUFFC/upJWFk7Iy7Zhz+FngAUtFub9Ab8cGLMtAEP
	lRBxpmxtnXyiKA=
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr16439244a91.19.1788523748053;
        Fri, 04 Sep 2026 05:09:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5730826eec.6.2026.09.04.05.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:09:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH 2/2] tools/hv: fix typo "retrive" in comment
Date: Fri,  4 Sep 2026 17:38:55 +0530
Message-ID: <20260904120857.20431-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120857.20431-1-hemanth.selam@gmail.com>
References: <20260904120857.20431-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/hv/hv_get_dns_info.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hv/hv_get_dns_info.sh b/tools/hv/hv_get_dns_info.sh
index 268521234d4b..288821565eee 100755
--- a/tools/hv/hv_get_dns_info.sh
+++ b/tools/hv/hv_get_dns_info.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# This example script parses /etc/resolv.conf to retrive DNS information.
+# This example script parses /etc/resolv.conf to retrieve DNS information.
 # In the interest of keeping the KVP daemon code free of distro specific
 # information; the kvp daemon code invokes this external script to gather
 # DNS information.
-- 
2.48.1

