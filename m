Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93833F12EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768553; cv=none; b=SIK3U1jMJwwNOt3O7rH6oOJZBZmbbeZ9sBocQy7iGPbm46anfbd9JtxNQBmAgB9Tsy82wzafzAkHg0xC3fqz4L2gQHTKCNTxchlrUQaKtLLWoQX6qTpWUBPlpuhO+w8Um3qRNeCHXlnrMHVNqCK4XpAbU2XUhULogt0njg7mezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768553; c=relaxed/simple;
	bh=8tQZIIqvG/6r+thQ5+8ZiHJ5p6+8/rFiEvfA+pAlwU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObKXFsvw2ABTLvDB+ItMgjtw8GsfbT+GGqV/bWNZFM2ebgJs7xlOd62hSlcICTXSNOPklyUpt6lxDtiq5h2xNx5LfBRcDqP2pRJReQKeDq62WV93qSZVEZ71TqbDaYGAl3cY5CWEJdr2SUT4lPnVVbk9hSqQENEK4lsoehyko8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=W3bBa6sY; arc=none smtp.client-ip=95.215.58.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="W3bBa6sY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8tQZIIqvG/6r+thQ5+8ZiHJ5p6+8/rFiEvfA+pAlwU0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788768546; v=1; x=1789373346;
 b=W3bBa6sYQ7EnQnNZjISCV7oV2kCjgejNHYMCBmPWPoZAlzMPsHYiK4RO1Hw/DGmxRaoMiqi7
 8ll2k48YlxE5gFpEBfqOKp6/UeyjGAz1wmKuyMAYHERvpZYE80vqtSByFuJUrHb7A3Mv1IcjQqF
 Axh4cfEuvO/C2xkGHZr/Z7YFTYGd8g7ToZ9xV66eOe9CFxWj1Cfy7DRGlBFEUfJPIRjYs1htpDC
 YlcPuhPmIhR13L6UZiQF0LNQWdKwkXXrqioQ00yniU5QX3RDAavDyNMez8twqF2Qo/t83Y1TiZ/
 GvNB4ePaIQqBUxzbBNWOuATqPb9WjcCRUf8Dke1ey6snA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ca03628c687e3be;
	Mon, 07 Sep 2026 08:08:56 +0000
X-Mizu-Trace-ID: 3ca03628c687e3be
X-Migadu-Flow: FLOW_OUT
Date: Mon, 7 Sep 2026 16:08:50 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Subject: [RFC] docs/zh_TW: defining a maintainable scope for the
 Traditional Chinese translation
Message-ID: <ap5xEtMdwXS8Pvcf@wyuan.org>
References: <CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com>

On Sun, Sep 06, 2026 at 04:21:24AM +0800, 葉宸佑 wrote:
> Hi all,
> 
> Now that zh_TW has maintainers again, the next question is what we can
> credibly promise to keep current.  The tree holds 97 files, and a survey
> of them says: not all of them.  I would rather narrow the scope openly
> than leave readers to find out which pages lie to them.

Yes.

> This follows on from Jon's question in the contact-block cleanup thread
> [1], where I said the wider question of what to do with the stale
> translations deserved its own discussion.

In general, my personal preference is to completely eliminate this mess,
then reorganize the structure and align the English one.

> 2. Translations whose original moved out from under them
> ========================================================
> 
> This is the part that worries me most, because it is invisible to a
> reader and to most tooling: the translation looks fine, but the English
> document it mirrors has been relocated, so nobody working on the English
> side has any reason to look at us.
> 
>   ==================================  =========================================
>   zh_TW file                          English original now lives at
>   ==================================  =========================================
>   admin-guide/security-bugs.rst       process/security-bugs.rst
>   process/magic-number.rst            staging/magic-number.rst
>   dev-tools/gdb-kernel-debugging.rst  process/debugging/gdb-kernel-debugging.rst
>   arch/arm/Booting                    arch/arm/booting.rst
>   ==================================  =========================================
> 
> The moves upstream were:
> 
>   2023-03-05  Documentation/security-bugs: move from admin-guide/ to process/
>   2024-06-24  Docs: Move magic-number from process to staging
>   2024-12-09  Documentation: move dev-tools debugging files to
> process/debugging/
> 
> All three translations still sit in the old location, and all three are
> still linked from a zh_TW index, so a reader is pointed at a file that
> mirrors a document which has since been filed somewhere else.
> 
> Two more translate content that was restructured rather than moved:
> 
>   - IRQ.txt renders an old version of core-api/irq/index.rst.  That file
>     is now a twelve-line toctree; the prose it translates lives in
>     core-api/irq/concepts.rst.
>   - io_ordering.txt is in the same position relative to
>     driver-api/io_ordering.rst.
> 
> Six files carry no :Original: field at all, so
> tools/docs/checktransupdate.py cannot tell what they mirror and skips
> them silently:
> 
>   index.rst, arch/index.rst, disclaimer-zh_TW.rst,
>   dev-tools/sparse.rst, admin-guide/clearing-warn-once.rst,
>   admin-guide/cpu-load.rst
> 
> There is a second reason this matters.  Where the :Original: marker is
> missing, checktransupdate.py falls back to comparing author dates, which
> means any mechanical tree-wide pass over the translations resets the
> apparent baseline: after such a pass the tool reports those files as up
> to date, because the translation is newer than every English change.  I
> ran into this while preparing this survey -- measured on top of my own
> pending contact-block cleanup, which touches most of the tree, the
> number of stale files drops from 51 to 2.  None of that staleness went
> away; it just stopped being visible.  A tree without :Original: fields
> cannot be measured reliably at all.
> 
> Whatever else we decide, I would like to fix these two classes first:
> move the misplaced files so they mirror the current English layout, and
> give every translation an :Original: field.  That is what makes the rest
> of the tree checkable at all.


My idea is: If the current translation quality is acceptable and it's
not troublesome to move it, I think we can just move it. On the
contrary, if the translation is significantly behind, there is no need
to go through all the trouble, just delete them.

Quoting Dongliang:

| But for the current situation of zh_TW, re-translation may be more
| efficient. -- Dongliang <45167b0a-4c60-43a4-9c3d-b8ddcbb8679c@hust.edu.cn>



> 3. How far behind the rest is
> =============================
> 
> Using tools/docs/checktransupdate.py over all 87 .rst files:
> 
>   ============================  =====
>   Upstream commits not applied  Files
>   ============================  =====
>   1-3                              30
>   4-9                              13
>   10-19                             7
>   20 or more                        1
>   ============================  =====
> 
> 51 files are behind, by 245 commits in total.  The other 36 are level
> with their originals only because those originals have not changed
> either; nobody is actively keeping any of them current.
> 
> The process/ series currently on the list accounts for 66 of those 245
> commits and brings all of process/ to zero.

Yup, let's do this part later.

And after process/, I'd like to do that part "Working with the
development community".

> Excluding it, the worst remaining cases are:
> 
>   ===================================  ==============
>   File                                 Commits behind
>   ===================================  ==============
>   admin-guide/mm/damon/usage.rst                   33
>   filesystems/index.rst                            17
>   arch/arm64/elf_hwcaps.rst                        13
>   admin-guide/index.rst                            12
>   dev-tools/index.rst                              11
>   admin-guide/mm/damon/lru_sort.rst                10
>   ===================================  ==============

Tricky?

> 4. Documents no reader can reach
> ================================
> 
> 18 files are not referenced from any toctree.  Sphinx still renders them,
> but nothing links to them, so they are unreachable unless you already
> know the URL:
> 
>   - nine pre-RST files kept in the old plain-text format: IRQ.txt,
>     io_ordering.txt, arch/arm/Booting, arch/arm/kernel_user_helpers.txt,
>     arch/arm64/{booting,legacy_instructions,memory,silicon-errata,
>     tagged-pointers}.txt
>   - filesystems/ (5 files, one of which is a tenth plain-text file,
>     sysfs.txt) and cpu-freq/ (4 files), which have index.rst files of
>     their own that the top-level zh_TW index never links to
> 
> disclaimer-zh_TW.rst is also outside the toctree, but deliberately so:
> it is marked :orphan: because it is included rather than linked.  It is
> not counted above.

So I would like to restate my point again: Completely reorganizing these
structures is obviously much more convenient than handling them one by
one.

> 5. Per-area summary
> ===================
> 
>   ==============  =====  ===========  ======  ==============
>   Area            Files  Unreachable  Behind  Commits behind
>   ==============  =====  ===========  ======  ==============
>   process            27            0      14              66
>   arch               28            7      12              35
>   admin-guide        23            0      15              99
>   dev-tools           6            0       5              16
>   filesystems         5            5       3              21
>   cpu-freq            4            4       1               1
>   top level           4            2       1               7
>   ==============  =====  ===========  ======  ==============
> 
> Within those, admin-guide/mm/damon (5 files) accounts for 55 of
> admin-guide's 99, and arch/arm64 (10 files) for 23 of arch's 35.
> 
> 6. Proposal
> ===========
> 
> I would rather do one area properly than all of them badly, so I propose
> we start narrow and grow the supported set as people show up.

True. True.

> 
> Step 1, now: process/ becomes the supported set.
> 
>   27 files, no unreachable documents, and the pending series already
>   brings it to zero commits behind.  It is also what a Taiwanese reader
>   starting kernel work reads first.  Committing to keep this current is a
>   promise we can keep today.
> 
>   As part of this, fix the structural problems in section 2: relocate the
>   misplaced translations and add the missing :Original: fields, so
>   checktransupdate covers the whole tree.

Yes.

> 
> Step 2, next: the 70 files outside process/ are marked as not currently
> maintained.
> 
>   That is most of the tree, so to be explicit about what it means: the
>   files stay where they are and readers can still find them, but each one
>   says plainly that it is not kept in sync and points at the English
>   original.
> 
>   Rather than inventing a mechanism, reuse the one the tree has: a short
>   notice included at the top of the file, the way disclaimer-zh_TW.rst is
>   included today.  If people would rather leave the files untouched, the
>   same information could live in the index instead.

I'm fine with both. However, the former might be clearer and more
understandable for the readers. If it is only included in the index,
some readers might not bother to look at it.

> 
>   Areas would move out of this set as they find someone to look after
>   them, rather than being promised anything up front.
> 
> Step 3, to decide here: the nine unreachable plain-text files.
> 
>   They are unreachable, they use a format the rest of the tree left
>   behind years ago, and two of them describe content that no longer
>   exists upstream in that shape.  I lean towards removing them: nothing
>   links to them, so no reader loses anything.

Agreed, let's remove them.

> 
>   filesystems/sysfs.txt is in the same old format but is reachable from
>   filesystems/index.rst, so I have left it out of this step.
> 
> Open question: filesystems/ and cpu-freq/ (9 files) are unreachable only
> because the top-level index never links them.  We can link them and mark
> them unmaintained, or drop them.  I lean towards linking, since the
> translations themselves are not in bad shape.

Fine. That's OK.

> 
> 7. What I am not proposing
> ==========================
> 
> I am not proposing to touch zh_CN, and I am not proposing to remove
> anything a reader can currently reach, apart from the nine plain-text
> files in step 3.  I am also not asking anyone to review Chinese text; the
> decisions here are about scope, not translation quality.

;-o  ;-)

> Sequencing: the two pending zh_TW series should land first, so this
> discussion is not competing with them.  What I would like out of this
> thread is

> agreement on the shape 

So ditto:

If the current translation quality is acceptable and it's not
troublesome to move it, I think we can just move it. On the contrary, if
the translation is significantly behind, there is no need to go through
all the trouble, just delete them.

But hey, this is just my personal opinion.

> after which I will send the relocations, the :Original: fixes, and the notices as separate series.

Sure.

Thanks.
