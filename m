Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B24548F82D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460398; cv=none; b=B4GndbaivjRC4UzmfJnr406Xj7THc8BPrqRxEKjoie2plri6GsumYfR/kbEdXZBQG9TTKxtqh9se3e3Q3u6KLj8GiaMGeXhv7DV5kvCX/UOM15y/RD99ZILk/s2VZF+bsLLCfMJjDFn6JvXJS5Tof1hZ/BVdQqN9w5NrT9KKjbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460398; c=relaxed/simple;
	bh=aplZdT+SUciUNx7wLWHE1WIyitdllN3DIch/NmyPwLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpav49MMrKYZe6poebvFDgbIqEWDHy5YcGfUvCC8r3BQ01wHvFYtWcLDx7a2JapGWTlgTJEQDY/PAaYX0mU9+dsOd5o2LjmqjShIprfzCGp6eax4zxLRRWA1HFyq3GZb4bBZgbcGF2zXKgtIev+jZsso1E4JMFWZqg6dYm4w6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieMdl9JB; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieMdl9JB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1306066a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460397; x=1792065197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pORXAQAlb7DhrMRDqcuEGOhapDhJ6cJiXRLHYOoZZBA=;
        b=ieMdl9JBU7htgRVzQ2f+1OnlQhgQVylAuAOMp7jKw0im05vsv1pUT8CMXfxgmDUOGt
         ow9MYHuMAWVlmPviipeht3xzjMHe7ozCBmJ1n+/vVw05+FRIfKJBqLdBLtr5FXq2bTEH
         6hSMEA1FvF5Hkka10rX53ZLuHWQbfCeo/48cYIaXPyOGwiic6A32XOUHM4h2lqL8CsWi
         qDuRhHh9vlSr43upUCXpuIMl/e9JQ2xqbWrTmwichRVlP0rrqeVjvIlNPMJcS5b04dr8
         j6qjHgpE2VxsUHRTaDFTGNjTHD0yAIGHS6b/W0TwkAhEJZJSlIhojwSWlXPoaJJfvC1N
         Bm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460397; x=1792065197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pORXAQAlb7DhrMRDqcuEGOhapDhJ6cJiXRLHYOoZZBA=;
        b=YhjNDGdltqNtMh5s1Jah8xaXUlt13ZJnsmC+OeI6XmXu/iP4p0yCMMZWlHmXO8COLJ
         YaXnPio2QqJvqtHAusMLtsUeejgTHC1lj47FIMj8TDDT+cpgaGI9ugrYoCDKMgbQa04w
         LZdWfHRQdjG9mg9NNiPemSAf/I/RXLVg2rix8m39nN+KwlcJEI5EnZI9+fsvqlzU9Nqv
         Fn+NAYJmvepF0ynf0xXpa3Bi2pdkefv18YQFvm/cWPKS2VVh+Wbl9PgVWdTrjBF6GLLD
         arn82lUzOuFZbdTixe2e8999m75rs5zW9BCW/nHfXxqFkwcYkIV1VI6B31nasK6kbFaz
         opAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU7aBi4lgFpYqcXVrhQgp8XUTiRUC+uCqoEdDil/2Kc8NXv0i+3kmOx/WQHRV9Tls9dw5WOWN7jK9DHzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn2GnxBmQZCVGO+Cd2TbS+eTBDUr1+vcqE/AWF8y7TvKi10nrC
	LuBxvAQsrudSdadtrWZSe81WjZrWlZDczjPxi1gvM77rTScOblfW0QyNSRNpE3ju
X-Gm-Gg: AYBFou1XFOT5ti0l751O4RamC2l7dy6Ju7454WH4WIPtbubUSVa9BIBu10lJxrtowfC
	gmKfBcfOgifl+hDryU/Mq2DsAruxF8AKOXkJGJEgUzKzURRAnnlE0pCD9DuKRQOdgWgamrOVtMq
	YjsbQxoV0E2MWvPfzMAVlQdosPnUzt7OqFJFLHWHWCM7zWDxq7E6rXps8hUGtT8QtkgH6ZQBb5w
	xb4C+ZYfwv1TI64fe98BszOCC9kqZWQyn6puhV76PttspVhZTP08QBRBnAUYfyFOIci5wqTEabR
	+VpUowRLgCremtUx1dSAzd8o2FAD0YNEsysyK2JiCO+uD8m+yzEKOYSs6uAf9FfCaAPsFYlxaYV
	5JyWn4CWunMwygJxnjvmuVKpUpxgSA1DTYpHBxmuu7mUyLLGLDkUJk1SCRpB2uzbVa32K2og/J3
	ij1EmUzYFlAARZrqUdwloEo6LxEXq0O5Sr5r+q4QJqCFsyXLF9y67Z9UH0h1EEoprTY/KNYT0nF
	gc2RJKwiWdfpPS0VaWTiCIc93XAw7QpguM/yxaCeg==
X-Received: by 2002:a17:90b:560e:b0:3a4:c946:9f4e with SMTP id 98e67ed59e1d1-3a8a151f240mr4255704a91.58.1791460396754;
        Thu, 08 Oct 2026 04:53:16 -0700 (PDT)
Received: from carrot.taila25129.ts.net (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm4760164a91.12.2026.10.08.04.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:53:15 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jake Labelle <southampton.jake.labelle@gmail.com>
Subject: [PATCH 0/2] nilfs2: robustness fixes from Jake Labelle
Date: Thu,  8 Oct 2026 20:52:46 +0900
Message-ID: <20261008115312.18482-1-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Viacheslav,

Please add the following two commits from Jake Labelle to your queue
for the next cycle.

As this cycle is getting closer to its end, I am sending these ahead with
a minor fix applied.  If Jake responds with further comments or revised
proposals later, we can discuss them as needed.

These patches address two robustness issues:

- Patch 1/2 rejects special inodes during dsync recovery to prevent
  dereferencing uninitialized bmap function pointers.
- Patch 2/2 validates and snaps the directory position after llseek in
  nilfs_readdir() to prevent invalid or out-of-bounds page reads.

For full context and background details, please refer to the original
cover letter here:

https://lore.kernel.org/all/20260930000954.371774-1-southampton.jake.labelle@gmail.com

Thanks,
Ryusuke Konishi

Jake Labelle (2):
  nilfs2: reject non-regular inodes in dsync recovery
  nilfs2: validate directory position after llseek in readdir

 fs/nilfs2/dir.c      | 34 ++++++++++++++++++++++++++++++++++
 fs/nilfs2/recovery.c | 17 +++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.53.0

