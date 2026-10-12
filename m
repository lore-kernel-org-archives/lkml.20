Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02743031A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830435; cv=none; b=fURi6LcMmUk4dqYq5tIYFgjIhOZ8HKfcfagvAnXtjoEpwkMKD1MhlhOTCpcluyg4hyXEp4mFfdqUon6/c/DgKuDM3uLrWxTFFCKMlTqnHxCJn7YfOpGgv8V2JFMslWK+ixCHT57mvK+1WyfbzUpVOxmeOCq9xXa/p7bkdbg0A1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830435; c=relaxed/simple;
	bh=jt+Eji9rYzHMfK+EI+5uEwnD4ioO+UsqVK2ItGcwumk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l9GDGcC86touZ7RrZczVNHNOBZ6KaijAsDz5f9PdtAOLb6PE3StQIF4tP+xecf3SZGQyl9FBCiPAKOJP41QDkf3s/TwWDVhTZhJ9I48tNhQYxDKV4JI+aKZWjfPnghLo/wb7tv5/W/q5ZbW4oSNhRyJuGJIU0kIwSe/d3Lck0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dtiep1DK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dtiep1DK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1B21F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791830433;
	bh=0CFZbCRHLx6gGcXCH5+UaihTRZ/cdKaSVDmi8apsr+I=;
	h=From:Date:Subject:To:Cc;
	b=Dtiep1DKHxfltcj1VY9Rx9BNUzMdBQ8Huck4k63IsjbwJQ1aa9PrEPjXBISbOegGh
	 sRgJA3ncB/ZmD/g4Ne2wGoc4XBht8YLmSoU8BksLQB4wnEWj6pXzjvTyeTZZjiCWo8
	 kJDH3BVZBF3dcNxo2+oK/AL+xRbriUlyFSA1lbigoGC2VZ6pWMFPCzSkMUUaLNdwAn
	 qk2cwCvSCNDz5uOhI62nA4pCXmbVPLbOC1fgUxfZh4of10hACl1QMLlj18qZaTXemR
	 e1pkUIeOHBTNTLk7CCQJs4SpKhiaxeOcn56iWeXGiEuqikpwtl8+IkvY0ClUuuYM3s
	 MI+qH4zMfqvsw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso3390070a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+4MD6Sk5x/UB/rg12b+TNpGy2HUM/dDRfwgw08sbIUJqL+7FNke4F//SzITJcSGUkVZvxcRt+3ZNjGbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcjob270DLOkKjEFYc2nih+Q44MGeWhZWSDwnI60GOjoVCzyW8
	jxlKc3YIliYAT4o0hDCm0K6SafRt5ICCWhwwxamlNQcrZV0dRPljIcfOwLmCFBbv8tuCw1J64RU
	EIzYFWWm68AxHlXq81aCPgZAIJtEH20M=
X-Received: by 2002:a05:6402:460a:b0:6b1:d961:ec97 with SMTP id
 4fb4d7f45d1cf-6b1d961f8e6mr1347785a12.19.1791830432123; Mon, 12 Oct 2026
 11:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Len Brown <lenb@kernel.org>
Date: Mon, 12 Oct 2026 14:40:19 -0400
X-Gmail-Original-Message-ID: <CAJvTdKmxHEXJppqNcBDNv_5E8FZt-faB1Zh4G=L+j=iABc=tRw@mail.gmail.com>
X-Gm-Features: AclHuK8nApLNnn2k9ipQp-9svmB9ZAuqb65n9aRWAtry7Y4nfqKmwHHf3TdWNzM
Message-ID: <CAJvTdKmxHEXJppqNcBDNv_5E8FZt-faB1Zh4G=L+j=iABc=tRw@mail.gmail.com>
Subject: [GIT PULL] turbostat fixes for Linux-7.3-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM list <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull these turbostat-2026.09.28 patches.

thanks!
Len Brown, Intel Open Source Technology Center

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
tags/turbostat-2026.09.28

for you to fetch changes up to d3eea584b56fecf5c3fba0979f0da28a6600d6a3:

  turbostat 2026.09.28 (2026-10-03 13:02:41 -0400)

----------------------------------------------------------------
turbostat-2026.09.28

Since turbostat-2026.04.21: bug fixes

----------------------------------------------------------------
Ali Ahmet Memis (1):
      tools/power turbostat: Read complete CPU lists

Len Brown (7):
      tools/power turbostat: Warn, but don't Err on out-dated perf systems
      tools/power turbostat: Sanity check GFX%rc6 and SAM%mc6 percentages
      tools/power turbostat: Fix fd_perf leak on reset
      tools/power turbostat: Fix CWF PMT off-by-one
      tools/power turbostat: Fix PMT error path fd handling
      tools/power turbostat: Fix add_counter issue if > 24 counters.
      turbostat 2026.09.28

longlong yan (1):
      tools/power turbostat: add NULL check after calloc()

 tools/power/x86/turbostat/turbostat.c | 86 ++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 32 deletions(-)
