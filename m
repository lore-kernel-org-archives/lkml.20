Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28954C900E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610812; cv=none; b=AEd5Ma9xYHP23vR9cPuYUoo6Ah5dAHr3o5EUmahHwTiJDAkO/wHRlDhF85NXY9EMGQv7S40w3B6Eu6S8j/xEOFtorpn3Cy193ffUZQ2xjI+nQKfWxCM3/LAJcCh3Vvbzm16gPkKLu+OBGEUHcC24WkFWJXMwttcuzS01oG12CgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610812; c=relaxed/simple;
	bh=vJ67DMqOmXhqMJAHDviXz4d/7dJOLeUs/18q1tC9usk=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=LHY1R93rxbPnQXhglsu0/JXI3boORHj4h9XDBxVwyXGzDXYkZiNr2Iod/q85l8OsRugBwyd3prkR4LRrDV+mAd8Bpoy1ca0LkVT1hReT/7le39fgvThDF2EqCSx17l6PSDknUMvmdx1Es8E9v4lA+2fSNBvyzaQFPtzCtctz/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=j8HYwSP5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+M4VEV7F; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="j8HYwSP5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="+M4VEV7F"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790610806; bh=daI9wVWUiikrQ9gaiuaEhLL
	V7kfnYb+JsnMZuTgrq0Y=; b=j8HYwSP5Ap9Asct16LQMkro5VeH6h2HGO5/iXNXfagcNngFGlv
	ru8y9YUADHR7iypy8pchFhHa/tzo0VXNjsQobEQV9D4GWkRO58GMHFzZJy244P2hxZTnWzF1g3u
	jBo+Ij9OGLCKCwKW9d4wsHkVatot5Yag7r9yP5DT2Wn7w7RIaXBRfq2Ky4ibFJk84i7dL0U/ey7
	Zx0MLIr0qXc1O492uk8IvLEWEkSXgn5J9HVwNe5hglic0fkjkknrqe8C5sKHbT8oNYFML6s0c8M
	snMQ0zmdXtse59ip/HT4G2ubHCEE69OddgSPjq2xNhasQqSl5pCHJtuhQpYo/3x0clQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790610806; bh=daI9wVWUiikrQ9gaiuaEhLL
	V7kfnYb+JsnMZuTgrq0Y=; b=+M4VEV7FOT3Qe/kwVK/wNFpH6Y6d+jM8zDPfIWL/tBFscWwdCe
	FSQBy73YKxT4TOpagjQzloYAnFg/rqnWTtAQ==;
Date: Mon, 28 Sep 2026 16:53:27 +0100
From: Bradley Morgan <brads@mainlining.org>
To: david@kernel.org
CC: akpm@linux-foundation.org, baoquan.he@linux.dev, devnexen@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ruirui.yang@linux.dev
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
In-Reply-To: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
Message-ID: <E7FBE134-976C-4FAE-A25F-52225118557F@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 28 September 2026 09:48:21 BST, "David Hildenbrand (Arm)"
<david@kernel.org> wrote:
>The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
>needs similar information (although still relying on
>SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
>
>Let's just export the value instead, so tools that work on vmcoreinfo
>will not have to guess.

I guess that works

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---
>Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
>SECTION_MARKED_PRESENT and further cleanups" [1]
>
>This patch can go in independently. It would be preferable if both
>go into the same kernel release ;)
>
>[1]
>https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org
>---
> kernel/vmcore_info.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
>index 5a417f8a922a..7833a36064a8 100644
>--- a/kernel/vmcore_info.c
>+++ b/kernel/vmcore_info.c
>@@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
> 	VMCOREINFO_STRUCT_SIZE(mem_section);
> 	VMCOREINFO_OFFSET(mem_section, section_mem_map);
> 	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
>+	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
> 	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
> #endif
> 	VMCOREINFO_STRUCT_SIZE(page);
>
>---
>
>base-commit: 57e4ac91fc62d75d84b5a03827a19ceb4094ecd9
>
>change-id: 20260928-section_has_mem_map-6205dc90a09f
>
>--
>
>Cheers,
>
>David
>
>
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
