Received: from mta0.migadu.com (out-234.mta0.migadu.com [91.218.175.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73736484254
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042748; cv=none; b=pt/ScL6oJsPxjI/qhw8fIWUR/H/Ep8hT26lev9p3PmQRm9aOlpnsw1I9FZK+lLvYjSMImB6pyL0+oXN8YzRfuQr7gmmT+5Fs5dhZDyI3avxaoMnjqYTQ+Mj8Fe8a1bFX1/q4DlnnL8xPvZR6RQBrMkiFpr5PYNYLA2FcpRNEo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042748; c=relaxed/simple;
	bh=B1Nyug3DTFA+APNcDBwCAydWW6t05O9PohPxOGHg7sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbMMiFh+opvFe1/CO0Inpam6DedqXFyoZf8P1CeKegpY+LX6o8ZZYsnUm5GnY3KwGse2QJCgiBQDYfXlzZ0BnZB9uwak0yb5WZUXhPfR5Af5rNMyXFc3gD91wEXSfOVkCz02EO3sqjk0YM4OKyWBJ2YczY3BgMJtwbbrLR7JyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=oxVnaetq; arc=none smtp.client-ip=91.218.175.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="oxVnaetq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B1Nyug3DTFA+APNcDBwCAydWW6t05O9PohPxOGHg7sk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789042741; v=1; x=1789647541;
 b=oxVnaetqr0pA6KM3VMS2EzT8ViBZUaM0ltVf7VFqSQi1wF6UD8jPhNJKAB0FWLHl643LCgf6
 OjR0gL+rE2o9uglYoyUb809yGeSz9bkpJURDXfuZ8hilPJ+xNznoPL7vIg77ePkQ16DBYrNguwV
 HgHHByYZH51LWkAbcq9/P9BQJD7ZwDXH1dmP+K0dljBaqyAbury+Z6cYMixcZ2X8GvS5CWXm+VG
 oS8+ad1kEMvR0cbMtqL58Omf/os4btB+HjoAQC/CugIcKycKWxaz1EmetPQTLTb9xv44H+UleIQ
 Dr1E21T4OjY+n69QjbO4JpfYdreDJ2RerWUMkpPGBe9Ag==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f10a42f29b9d7ab7;
	Thu, 10 Sep 2026 12:18:51 +0000
X-Mizu-Trace-ID: f10a42f29b9d7ab7
X-Migadu-Flow: FLOW_OUT
Date: Thu, 10 Sep 2026 20:18:46 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_TW: add process/applying-patches Traditional
 Chinese translation
Message-ID: <aqKgJh6MfOTS0KtQ@wyuan.org>
References: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
 <20260817-apply-patches-tw-v1-1-c182c1c425ba@wyuan.org>
 <CAKspUh+bMqOYuV=uTRr35wt-xWd97YR=dfDQGoAvF5MjujOZEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+bMqOYuV=uTRr35wt-xWd97YR=dfDQGoAvF5MjujOZEg@mail.gmail.com>

On Fri, Aug 21, 2026 at 11:54:02PM +0800, 葉宸佑 wrote:
> Thanks for taking this on -- and for picking a document that actually
> matters rather than an easy one. A few things below; the first three
> produce real breakage, the rest are suggestions.
> 
> ## Must fix
> 
> 1. Section levels are flattened (applying-patches.rst:12)
> 
> The English original uses ++++ for the document title (level 1) and
> ==== for each section (level 2). The translation uses ==== for both, so
> the file ends up with eleven parallel h1 headings and no document title.
> zh_TW/process/code-of-conduct.rst:12 keeps the ++++ form; the same here
> would fix it.
> 
> 2. The bold marker at :233 will not render
> 
>     **不能**套用
> 
> docutils requires the closing strong marker to be followed by
> whitespace or punctuation; a CJK character does not count. As written
> this emits "Inline strong start-string without end-string" and prints
> the asterisks literally. The existing practice in the tree is to escape
> with a backslash -- see zh_CN/doc-guide/parse-headers.rst.
> 
> I checked the other **...**, ``...`` and *...* in the file; this is the
> only instance that trips the rule (（**fuzz**） and [**y**]es are both
> fine).
> 
> 3. index.rst: wrong section, and the TODO entry is still there
> 
> The entry was added to 「其他材料」 at :123, but the English original
> lists applying-patches under tools and technical guides
> (Documentation/process/index.rst:46, after email-clients). More
> importantly, the 「* applying-patches」 TODOList item at :55 is still
> present, so the document is listed as both translated and not
> translated.
> 
> Moving it into the toctree at :46-49 after email-clients and dropping
> :55 fixes both.
> 
> 4. Please drop the :譯者: block
> 
>     +:譯者:
>     +
>     + Weijie Yuan <wy@wyuan.org>
> 
> We are in the middle of removing exactly these blocks from the zh_TW
> tree [1] -- adding a new one now would just mean removing it again.
> 
> [1] https://lore.kernel.org/linux-doc/20260819145808.291567-1-chenyou910331@gmail.com/

Sure!

Points above copied. My negligence. Will check again.

> ## Suggestions
> 
> 5. Missing .. _tw_applying_patches: label
> 
> Every other .rst under zh_TW/process/ carries a .. _tw_*: label, and
> the English original has .. _applying_patches:. Adding it would let
> 2/2 use :ref: in howto.rst, matching the eight neighbouring entries in
> that list instead of standing out as a :doc:.

This kind of top-level label is not recommended/allowed right now ;-)

> 
> 6. Comment alignment at :340
> 
> One tab puts the comment at column 40; the surrounding lines are at 48,
> and the English original uses two tabs.

Got it.

> ## Terminology
> 
> The significant decision here is patch -> 修補程式, used 98 times. I
> think the direction is right -- 修補程式 is the standard Taiwanese
> rendering -- but it needs to be handled explicitly, because the
> existing zh_TW tree has 630 instances of 補丁, including in the two
> files 2/2 touches. Right now the two terms would sit on either side of
> the same cross-reference.
> 
> Could you:
> 
>   - add patch -> 修補程式 / 补丁 to glossary.rst, and
>   - say in the commit message that this is a deliberate localisation

Yes, makes sense. I'll do both.

> Migrating the existing 630 instances is a separate question and I do
> not think it should ride along with this series; I would rather discuss
> it on its own once this lands.
> 
> A few smaller ones, measured against what the tree already uses:
> 
>   :192  指令稿      -> 腳本      (17 files use 腳本; 指令稿 is not
>                                   used in Taiwan)

Hem, I don't know and use 指令稿 either. So will check later.

>   :165  郵件用戶端  -> 郵件客戶端 (8 files, including email-clients.rst)
>   :228  回歸        -> 迴歸      (regression; 10 files use 迴歸, 4 use
>   :259                            回歸 -- 迴歸測試 is the usual form)

Copied.

>   :365
> 
> On the other side: 中繼資料, 旗標, 模糊比對, 發行候選版, 當機,
> 正規表示式 are all good Taiwanese renderings. Would you mind adding
> those to the glossary too while you are there? It would save the next
> translation from having to guess.

Yes!

> ## On the CJK/ASCII spacing
> 
> This file puts a space between CJK and Latin throughout, which is the
> opposite of what the v3 glossary currently says. That is on me: I wrote
> that entry before you raised the question, and we never actually
> settled it.
> 
> Since we both prefer spaces, changing the glossary is the right fix
> rather than asking you to strip 218 of them. Please leave this file as
> it is.
> 
> Would you send that glossary change yourself once v3 lands? You are the


> one who spotted the problem, and you are a maintainer here, so it seems
> more natural coming from you than from me correcting my own entry. What
> I had in mind:
> 
>   - new translations: a space between CJK and Latin/digits
>   - existing files: left alone, no tree-wide normalisation

I'd like to do that. If you have time, you can do it in person as well.
;-)

> The second half matters -- normalising the 2581 existing instances
> would be exactly the kind of churn Jon objected to in the MAINTAINERS
> thread.

Yes.


It's kind of weird that this series cannot be applied cleanly with
Linus' current master tip commit 50d05c7c76c9 (Merge tag
'landlock-7.3-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux)

Did I did something stupid? Confused.. But I'll figure it out.

However, since adding new translations is not our current main goal, I
will put this series on the to-do list for now.

Thanks for your careful review!
