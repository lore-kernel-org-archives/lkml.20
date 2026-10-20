Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482533;
	b=5jxdy5bRD1NeIFqfr/bzFBg4DNXlklKejf50b+FT7ftp89jiq6imTANBS8kXyN14usMu
	 zyAphoqH5YEaLGtMZ40aAZ3PC2gUtSNoyVAsefU/jnCTDAYg20U9pFcwlFm+96M6Runsx
	 l8vXw+UT+YJ5ItGr4BFpkkLCQxtl7wKf7XJ5qG9alQ7aB+TJ+b3elZYqS0dYYb0W9evjn
	 FUgi2vzzZbq8OEclWB85A6WBRKfGfNLWwbLrDpDan/nX0UW5EuXrCeev/vnRdtuTWPzpC
	 siPUf6TV8Dgr8W8mnHdTTwBaHW6AlrsXi+gL1t6hY51sVFkXfJFe+ld82i5A50x1+5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482533;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hPT5u/5ZlsAh94nJsrTNidWPIdZtDCXn6l2bj7QEZ40=;
	b=NXNpGdBQyOTiobqQfNjgfCYct+FOKNqTVd3SOFBSNsOej9pl1Zfzf0w46Obr7NX31C3N
	 IF/NqZx99Bxjf1HDQp7KHeWooBPuB1dmzYjR1otIeMSLuFpdcF+rWkI7K8SgLG/oRI2li
	 Ph5kyxxDrCSufSrxzq0SPEfy2lYsv3LRMdBkM5UwWkBCgJ1Fw7A4VhopANpzzXNRgRmBK
	 RKNH44I79gQ36wyF8YEP3VoPBcJQpvoJDqXC8zQkTuCu/Pwj/lnXy/iG6mXvDta6034Nd
	 c4UIm/XZxTbNxPjFAksn1FdmAxKZoZUWy2mwjk1KfgDf2TsS6A/oRols2VOUHkUwsLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l81UP1KJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 27C3D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l81UP1KJ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ABC151F000C5;
	Tue, 20 Oct 2026 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482532;
	bh=hPT5u/5ZlsAh94nJsrTNidWPIdZtDCXn6l2bj7QEZ40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l81UP1KJK1vXSAkaVTa8DK937hqjTi3naVB4+Es7OXCWX+C+PovmtOAjyRm142Cq5
	 aT/7T5r2gku7dh3K0zWwEaQSZQk1fyhkD4jk9eJ4gEpkC3lExPIbEQlt63bh18uGW/
	 iHjS990YtqXkJ2qWnXLkQ8igw0u5NPtirDCmDwWbEOvblU/onURg2+TNZFdd9KYr+n
	 yc0fl7ApFY/wLl9Np95oBzAfkeocLqpKH0LhZbID81zKGDZTMDisWwA9R2lP5Z81uV
	 sxbBE+b/c0uznWIEXrSJG2uswBle1FVoeByp5fq2ak9sg4nVZxmroeJ4vWxk97+Dpc
	 OFv80tKdkP+Pw==
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: shaos <shawnq1@163.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, "Jiri Olsa" <jolsa@kernel.org>
Subject: Re: [BUG] uprobes/x86: uprobe syscall accepts forged trampoline frames
Date: Tue, 20 Oct 2026 07:48:50 +0000
Message-ID: <undine-1792482530427353776-36d0076189b11675@undined.local>
X-Mailer: UndineD 0.1
In-Reply-To: <20261020003704.1012276-1-shawnq1@163.com>
References: <20261020003704.1012276-1-shawnq1@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Cc: Jiri,

On Tue, 20 Oct 2026 00:37:04 +0000, shaos <shawnq1@163.com> wrote:
> Hello,
> 
> The x86 uprobe syscall checks only that regs->ip lies somewhere in the
> caller's executable [uprobes-trampoline] VMA, then trusts ax, r11, cx
> and retaddr copied from the user stack.  A process can jump into that
> VMA with a fabricated frame and make an enabled uprobe report a hit at
> a site it never executed, with caller-chosen register values.

Thanks for reporting!
So, in short, would you mean user program can mimic to call uprobe syscall
if it can detect whether it is probed ? (Like shooting their foot by itself)

If this is a problem, I think we need to introduce a "reliable-binaries" list
and instruments uprobe syscall only for the reliable binaries.
(It may also need to check the integrity, but it depends user's operation.)

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
