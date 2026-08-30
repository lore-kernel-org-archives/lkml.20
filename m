Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EAB28F5
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788065724; cv=none; b=r8sB94/BbDWegG4M1FohmgGYpGrsVfpcTKyvVqAc08aIfeg9v3pviogK3J2ezeQ8FqQaweMAt4FD4R5FolFTUB1MA6jpv0O9hLXrbokie3NeDLA5ylPqh80aWvPCRVjVU/gkfJz8A41FbeGG/SaMoCCBvJoMvMcUZr53d+7Aog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788065724; c=relaxed/simple;
	bh=kW8u6QAGL30Ul+wHORAOeZzkRSJ24MIILtkoaK3HiBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7eJNs0uxkb6PNVDahj83v3wx4JGGsEKeqNhlSKDpmHBfur9Qvi63Yl+uYDUyiKEQ43qDcJrKkKOiyOfz9nRnQXC3ntYxkPd2ikGCS00lE90i7ASSp3wbmTb5eoEze2+9kT3mI8zlPYgSLr9qwKcv4bxeYmg5TO50FZqgGPhwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=FNU6ErIN; arc=none smtp.client-ip=91.218.175.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="FNU6ErIN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kW8u6QAGL30Ul+wHORAOeZzkRSJ24MIILtkoaK3HiBQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788065718; v=1; x=1788670518;
 b=FNU6ErINnd/L8TNrOEbXX3yPu490Bnat7n4GG5ZXq63E+E+h+74HZMhO21CD7e9p63sQRlm9
 APEVtouWFSylzQycPAU9m/KMVbYDOGNrWcl26wmPo39oLTT7bcjFvX+LYiG3z881th81twP6pio
 dStAfIw3iPoG+LBI3K7n98JXpFJesqL/6FnD2LtgUx0c/gOrp6U6UKsMtwXS2vHWg+06PN+AKHw
 w+rzn8QjKFsHqSUzJsQgEgOyGU9qUG2532jzaLXYHhOaK3FjX55DSh1oFqmLPKXgEQ7X+iN9f9e
 quFKRfqod7A1CdEsoC+DIxJ/GF0V14kgQiCKHulCm5S3w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d93383cd71421ba;
	Sun, 30 Aug 2026 04:55:11 +0000
X-Mizu-Trace-ID: 8d93383cd71421ba
X-Migadu-Flow: FLOW_OUT
Date: Sun, 30 Aug 2026 12:55:04 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apO3qAhf95TyJauu@wyuan.org>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apL7ctZhcN5t77Yu@wyuan.org>
 <f-IgWNAyTmaoW34tfNxIvg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f-IgWNAyTmaoW34tfNxIvg@gmail.com>

On Sun, Aug 30, 2026 at 09:33:12AM +0800, Yukai Wu wrote:
> On Saturday, August 29, 2026 11:32:02 PM China Standard Time Weijie Yuan 
> wrote:
> > Hi, it's me again ;-)
> > 
> > On Sat, Aug 29, 2026 at 12:15:10PM +0800, Yukai Wu wrote:
> > > Update Documentation/arch/riscv/vm-layout.rst translation.
> > > 
> > > Update the translation through commit 954260ff5a46
> > > ("Revert "RISC-V: mm: Document mmap changes"")
> > 
> > Somehow I guess you didn't get the actual meaning behind this "Update xxx
> > through commit...".
> > 
> > Correct me if I'm wrong. If you write this line in your commit message.
> > Then it means if we apply this patch of yours. The Chinese documentation
> > of this file should be already _completely_ synchronized.
> > 
> 
> I agree. My fault again.

No worries at all.

> 
> > However, the current translation of this file is missing this part:
> > 
> > RISC-V Linux Kernel SV57
> > ------------------------
> > 
> > ... which is not translated/synchronized in your patch.
> > 
> > 
> 
> Didn't see that because I just used the tools/docs/checktransupdate.py script, 
> which cannot see the commits before ed843ae947f8 ("docs: move riscv under 
> arch"). That commit just moved the Chinese translation but was treated as an 
> update by the script. And I only looked at the commits reported by the script.

OK, I noticed that this file was moved/renamed.

$ tools/docs/checktransupdate.py Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
[1788062042.378100] Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
[1788062042.518400] commit 954260ff5a46 ("Revert "RISC-V: mm: Document mmap changes"")
[1788062042.560926] commit 5c8405d763dc ("riscv: Extend sv39 linear mapping max size to 128G")
[1788062042.601822] commit 371a3c2055db ("docs: riscv: Define behavior of mmap")
[1788062042.601947] 3 commits needs resolving in total

.. So our script missed a few commit before name-changing?

But whatever, this file is not long and complicated. And the script is
just a reference to check the status.

Also, we do not need contributors to update the translation one commit
by one commit.

So, the best solution now is simply manually synchronizing the
translation, I think.

> > Note that I'm not blaming on you for this. But I feel this is a point
> > that a newcomer might find confusing, including me and Chen-Yu a couple
> > of weeks ago, if did not read the script.
> > 
> > Our current how-to.rst only asks to write this line in the commit
> > message but does not explain the results or the actual work behind it.
> > 
> > [...]
> > 	Update the translation through commit b080e52110ea
> > 	("docs: update self-protection __ro_after_init status")
> > 	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容
> > 
> > 	So when a newcomer comes and just does what this asks, without
> > 	considering whether his/her/its translation is completely
> > 	synchronized or not, our script would be kind of inaccurate. ?
> > 
> > Maybe we can add a description or a hint like:
> > 
> > If your current changes make the translation completely in line with the
> > English version, then please add this line after your descriptions and
> > before a blank line and your sign-off:
> > 
> > Update the translation through commit e83c5163316f
> > (Initial revision of "git", the information manager from hell)
> > 
> > ..then follows a template commit message
> 
> Allowing partial updates to the translation?

I think it's fine to do partial updates. If you just do partial updates,
therefore do not add that line "Update the translation through commit abc".
That would make the script think you have done all the missing jobs.

Also, you can absolutely write the _specific_ commit hash if you do so,
(only update partial) , not the lastest commit hash of the English original one.

That said, I did not read the script yet. :(  So I'd better take a close
look then.

> > (Should I cc the original authors of the script?)
> 
> CC the authors of the checktransupdate.py script?

Yes, but since Dongliang is the original author, I guess it's enough.

Thanks.
