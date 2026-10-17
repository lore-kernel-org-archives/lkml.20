Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8353D75C2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228440; cv=none; b=fk8FZEC/VLvz/X17O2QQ9gQvkW4JhTeZApghhJjZaLPdJSTinjISiziz5u74Uflm0g3+CFb3sKe5f8E+QRT8dPYkHJc+3Lyg3Iu3xjiW+TR3VctdfmW5nFcGBxHxlDh+uJFmBie4tShc+RqbLxtHEHxuw25pMSdG/LsjSvDZcjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228440; c=relaxed/simple;
	bh=EvUH/ifmbrml9nHlgOiU5kMRxvjJDNadN4/C6gpKGWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHewfHFjaU/OXLBtV+B4HmL9ZKo68k9UOkPIM/vP2rPoV0lq0qmtYg3wZEhQ7DW/UskHeJ52O0oEsPFA7M7uP+94Yl7eE8nploldJY4oaeL0hP6c6KDHsxFg9XHN/QPB8iQ2JmcEqjT1Kyrg1X/mSZn+Q7VUJRFSdui7n+5IyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dbQI+jta; arc=none smtp.client-ip=91.218.175.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dbQI+jta"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EvUH/ifmbrml9nHlgOiU5kMRxvjJDNadN4/C6gpKGWs=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792228432; v=1; x=1792833232;
 b=dbQI+jtabdL/ZnvkJIR+AHy5bPcG4s6MmE/ydDqppWgO3yOspW4WcpgzGn4rV+Tmn7ny7FN/
 l1p0PxXTdWhoK4Il5i1HgXWfDbd6d0NFsgqybDgSdyCpBXu2UBZEkDy91+cYIMaY/QUT7veUU6Y
 SU2JMMh20HRKKfB70lcDfOquVy2R3X8tGQNL4n+v0/uq2RzL4zaj1ifQkYynUUSBZAAQUoKmcHz
 CVTC5VfVN0PgUX+GQvey+NG3BKcAIlwNz4fmhoBvrID1WyXQSIJCTLdvyNsm+0RzM5XjvPTIoAn
 zVPHqXZG6LuaFEg9O7gBs1c677q9H/SpQuZJAEKdJjijg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cc049a13f0df8977;
	Sat, 17 Oct 2026 09:13:52 +0000
X-Mizu-Trace-ID: cc049a13f0df8977
X-Migadu-Flow: FLOW_OUT
Date: Sat, 17 Oct 2026 17:13:45 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_CN: remove translator-related headers
Message-ID: <atM8STwzREGJ_-Vd@wyuan.org>
References: <cover.1792167855.git.wy@wyuan.org>
 <a7c3af29fd1783bbca36cdacd3f17bf52cd5ef3f.1792167856.git.wy@wyuan.org>
 <3ee47cf1-a7a2-481a-bf46-46e74bdaa1e5@hust.edu.cn>
 <atMxWvnyYmD5r6O3@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atMxWvnyYmD5r6O3@wyuan.org>

On 2026-10-17 16:27:12 +0800, Weijie Yuan <wy@wyuan.org> wrote:

> On 2026-10-17 10:06:39 +0800, Dongliang Mu <dzm91@hust.edu.cn> wrote:
> 
> > On 10/17/26 12:52 AM, Weijie Yuan wrote:
> > > The headers related to translators and proofreaders appear multiple
> > > times in our directory. Their information is duplicated with that in the
> > > commit logs, making it difficult to maintain over an extended period
> > > of time, as there have been multiple instances of requests to update the
> > > email address.
> > > 
> > > Remove all the related fields to make our source clean.
> > > 
> > > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > > ---
> > > The diffs are inconvenient to review, sorry. Because I cannot find a
> > > better way to split them up besides by directories.
> > 
> > 1. I recommend to preserve the RST anchors because other files would use
> > this.
> 
> Yes, I also removed some top-level labels while I was at it, though I
> would better have done that in a separate patch. (My Git index was messy
> with these large diff. So later, the topic was expanded to a cleanup.
> But yes, I should split it)
> 
> But I checked that none of these removed labels are referenced
> elsewhere, if I was doing it correctly. (No invalid citations were
> reported by 'make htmldocs'.)

Oops, I mean the removed labels are not used by other places according
to 'make htmldocs'.

Thanks.

> 
> Anyway, I'll not touch these labels in next re-roll.
> 
> > 2. There are three checkpatch SPDX warnings during the review:
> > 
> > dev-tools/sparse.rst | Missing or malformed SPDX-License-Identifier tag in
> > line 1
> > process/howto.rst | Missing or malformed SPDX-License-Identifier tag in line
> > 1
> > process/kernel-enforcement-statement.rst | Missing or malformed
> > SPDX-License-Identifier tag in line 1
> > 
> > Each warning is triggered because the patch changes that file´s first line.
> > All three files already lacked an SPDX tag before the patch.
> 
> Oh, I forgot to mention this when writing cover lettter, sorry I did
> send these emails a bit too hastily.
> 
> I did run checkpatch and got these reminders.
> 
> The original Engish versions of these three are missing
> SPDX-License-Identifier(s), so as far as I know, our translation is
> better not to add this first.?
> 
> Please see: https://lore.kernel.org/linux-doc/87y0dv1wp3.fsf@trenco.lwn.net/
> 
> But I guess we could add the identifier with Alex's and Yanteng's ack,
> as they are the original translator if we want to.
> 
> Thanks!
> 
> 
> p.s. Many of the recipients' addresses are no longer in use. To avoid
> unnecessary clutter, I will simplify the list of recipients in the next
> version.


