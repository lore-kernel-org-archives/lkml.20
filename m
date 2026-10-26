Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008555;
	b=JL+a3NKU/LTPCBjrBrimz+QeeZq37EX0qUPt9QYEFPYzZhkgXfedDW927NE2Nqhuq9aw
	 nDHRYqG9jghAgKJ8/RCQGGRVK6GnQPhDvO4+8AvbIvj0Q3v3rEhLenPv8uB0YvdLiRPf/
	 rUSuFROBuTrweJvizd5ti+nut+jzBB4TgaavPc1mYSLDs2Y3Smk8AiTvpeTBUgLZfHB2w
	 FmeKZiLH/rExdPiZAELPHyPLJcLb3pXXfEkZzx5OLS4i6DLel+a4n9PosgW/o6aLG+LCr
	 T0VbqpWad/K6JZzguC2fWy03daXznl/tptdIWnelzWeFc+b1AXf4AH3A1DXU5miTBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JWuIyGvj7TDVl2tZ8CiehJr07EFLO+I5wb0zx/hsUqc=;
	b=htB1XLH53hron47b7P53pnsmfNcm8EFb8CIwMo5Y/gKizNUz7FJvoS+jgBN9sjQrB1zh
	 p0XdNRbrE+UEK+h6jJ+9eIW6Ca6cviOjZ1zv8G5k3HGqU5Qw+bLF2pvBc3m9QF3+vZBdR
	 EFUnSN0yBR4MDcol7puk5SsmWmKRAFatuQ9ajb5qFrLw9DJ469ay1ycm6i9U51fm6XBZB
	 0SMMqxeOauI1GJN8txc8mS+66lm2/qZ0MU/lZd5kLjp4wsan3TY84wgkPg02JqAYth1mH
	 yl/QGJGf7uZ/6Bprw4eLM1b2WA6Bvz/u3IGxnCy6+hky/KkvKhPOoOJYBjRtoij5WPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfYekKcy;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFE606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfYekKcy
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so4789139c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008549; x=1793613349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWuIyGvj7TDVl2tZ8CiehJr07EFLO+I5wb0zx/hsUqc=;
        b=JfYekKcyEXEhRe3UbjCP2v+C7MNjmDKf1Hd8xIZUCFapCV5iyNp0E5TPgM+8QNXqU5
         44LkajcDhwmnD6g1/JI6GRPZ4WaNxL9qsUpopxcKZscmnIvi9aOJg+RVUKzEiIYMgr5M
         bU6Y6VAwbpVOUIalzzrkhiZ3GlNju0apElrJDJdDJlnyCGFUhHvJOSJQWQVRJRzuHI2y
         FPcne9W7yxcNQPvjwyHNF9dzQqCMYPJ1vZNhSfO7AYv8BEwKEInEll1ZeUNIaZ65Gxa5
         Rq8PG3ynOgqyNAEG/2VAaGOI6/yEFMeRK6xRN4yz3UpzMIJ64YvvwhEEZ83BBtHwXt2N
         BZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008549; x=1793613349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWuIyGvj7TDVl2tZ8CiehJr07EFLO+I5wb0zx/hsUqc=;
        b=029bqTdImxkZsQ/YR4HVH+U+GX1yOfo3PJKfwMw/z62ZJfrEp2U1sxX0OgbcRdM4Jq
         MRAal5ETiD9gPB4rz5VipAAUeNMR69Gecxnth1LjujtjxMM3LTeal3DZUJC447dqnQyc
         IqXy3neMJe4t7U+4dfahtRSczVS4fyU3WJiBiaH0SfVi6PF3PGMIuUuY/Rrk5zKZapRF
         MtWiOU6BrLpzMuQOJ3by4HNTElM2ObBukOU9iSCXvcRI77joFmBuhfMAAGCB1ZU0nr54
         xAk1M8iEFAfBbrETsdLDeh3b30YudRGwBq8yxRjdr1LFP2VGEQuWEX4F2lblCGFdcrpa
         HCPw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4p986uqXtxoQagMfc9rEwjjpeENMOPXcgyGlo8kNlgh3C5HGgMg7EsbUMdpLlZxCiZGuMp6x5aufjSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2SOPIfUjTMbME+fQ29PAl5bj3RNlHUT2G+FZQazSQY5nTo+OE
	tY2yeOaQJ20t5Zupkpme8VuV4/AP2mWnDlB3Ra/Jmy7U0FwExh0NBJ+s
X-Gm-Gg: AYBFou1OA8eNqGzNfc8zAiTVEsowmTt6esyiJKgageEBzklFR7j+nZ5ot70jvNQManY
	y6wGaHx2dsnLb7k2Fn9z1WU+2HOn/HTl83fmwtirBV8mcE0G5+C8ur4oyLX3woeGnCW5wdThssG
	Au3JejF+GXvEbljSaPH+hAyMXvGKlsRNQrzmC493WPzxArRo0Dx2Iy+1GoFy77TzOu7Eg2yMdsy
	njJMIvEYkL1p1IUQUdm/gVpNTn/7QmgToGrz/AppSbk/N3XIlpgBQBq/0SF6QgyWgBxD24iFIid
	g6NuFw2guv+kVb4PVGRqKzgmWFKrRm5P0d6XY5t3zJEOMH8efzPcT60gkv5yJ/pES4pesYWl2cZ
	F8EBspnfb98ULJKuxrum+KzsiE44GAKIn7mh6A27JUWgd3gp8v4YS2dfodR0LnNZO0W7y/D07vU
	E8r+SwWyrx4qEOdW03s+5EZkBaUzbbYrEMqX7YIFX0v/nHPIzzwuQxWzvvsNN5LubKUjOhYM/ZO
	b6DbKYHosY/VD+oZIOAjOS3onamQfUiuo1wf8VQrbqYG8u8MnKK8P3THN5Q3DyIOKvJNOHjctIE
	amOQ
X-Received: by 2002:a05:7023:88d:b0:192:fd91:c569 with SMTP id a92af1059eb24-19933e10ad1mr11647724c88.11.1793008548510;
        Mon, 26 Oct 2026 02:55:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm23720535c88.14.2026.10.26.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:55:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fix typos in comments
Date: Mon, 26 Oct 2026 15:25:43 +0530
Message-ID: <20261026095543.2729446-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <ar9qxmyIZEP2IlMp@orome>
References: <20260907062107.6859-1-hemanth.selam@gmail.com> <ar9qxmyIZEP2IlMp@orome>
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

On Fri, Oct 02, 2026 at 10:40:50AM +0200, Thierry Reding wrote:
> For some reason I can't seem to get checkpatch.pl report these spelling
> mistakes, so maybe that's part of the reason why these are not flagged
> before they get merged?

That is exactly it, and there are three separate reasons it stays quiet.

The spelling check only looks at the commit log and at lines beginning
with '+':

	if (defined($misspellings) &&
	    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {

so on a normal patch it reads what you are adding and nothing else.  A
typo already in the file is never examined, even when it is sitting in
the context lines of the very same hunk.  Nothing that is already in the
tree can be found this way, which is why none of these were caught when
the code went in.

Scanning a whole file needs -f, but in file mode the finding is demoted
from WARN to CHK, and CHK only prints under --strict.  So:

	$ scripts/checkpatch.pl -f drivers/mtd/ubi/wl.c
	(says nothing about it)

	$ scripts/checkpatch.pl -f --strict drivers/mtd/ubi/wl.c
	CHECK: 'occured' may be misspelled - perhaps 'occurred'?

That is probably the run you were missing.

The third reason is the word list.  scripts/spelling.txt has to contain
the misspelling or it does not exist as far as checkpatch is concerned,
and it is much smaller than people expect.  "inclue" in
drivers/nfc/fdp/i2c.c:270 is a plain typo that no invocation of
checkpatch will report, because the word is not in the file.
--codespell swaps in codespell's dictionary, which is where most of
these actually come from.

> Maybe a better use of LLM tokens would be to have it write a script
> that can be merged and that will automatically run a spellcheck on the
> tree.

Agreed, and codespell is the right engine for it rather than
spelling.txt.  The awkward part is the false positives: codespell on the
kernel produces a lot of them, mostly identifiers, hex, and abbreviations
in comments, so something mergeable needs a tuned ignore list more than
it needs a wrapper.  I will see how far I get and send it separately
rather than hold up anything here.

Thanks for picking the patch up.

Hemanth
