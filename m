Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1BD4AD7F6;
	Tue,  8 Sep 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858811; cv=none; b=AGMp9vJ3BI8fiz0PbIJ2aHKhUc39OJ4LayHDSDLyG+6ov/LymPxxZ6a6rs06ubsMZrljb5X2QeOjsUmgNlo9SfErMQQxy0uypq3EPCR/8LQgrZVnAJ+kjYjMWUwajihTtZIZ0KEjO+tiQImmGboXGHqp7xhAq27wGzaO0SOmol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858811; c=relaxed/simple;
	bh=UhfBDGynXrKXltBL74qPQNfqyJkEuyETYwDiEkAViGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyJPkK4ziy7GsKtvw+GlgWLs7HHD955EY42xQQ4zvIng61KzkgSoK6HpBubLQMfQYcYia0wy8vgm4MO2xNGIuVL3V5bfIAc5tIQScZH8NLmkOCR80cyEPQvZCb/nIII5Vxp9VOtj9o6LBn1sIuhSIjHy3xlUOKkgNzxJuirUHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJrfzRRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJrfzRRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DF1F00A3A;
	Tue,  8 Sep 2026 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858809;
	bh=3gBZLGjrspJ1Thek8jLIwXLFqBkp1PnFICpQVjJ0dMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJrfzRRrOMtVug6y1PMUNKS9EYpKvtXlh89q6HnndXw7z3TpsOh4ThIWdsDA7HN4Z
	 2wuYJPd3d1WwWLc3K7VN/8j/5H5RmU/L+DE+/cngINT5WhGFiL5nHJyHEEFO4lwP+y
	 bgQAv7wRQlYqOFGsbqyD1Jm6r0H7nOzxBtlfzqa/8I7SvCrZFASUwm6ZcGgLMNaMN/
	 c+0rMlzRYQyKZ/CJXNWwaibhXV7rvL48rhIRpGF4c965usy2qY8G4FNrm/T9typmC5
	 gq2sxrJ9g6RAeYCIv0g6kaS9BfssDSnCvXXn0mMnkzstRIyn2DbmtQuEiwdsD1JxMq
	 HuO9UkKOuIz4g==
Date: Tue, 8 Sep 2026 10:13:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Weijie Yuan <wy@wyuan.org>
Cc: "zhen.ni" <zhen.ni@easystack.cn>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Message-ID: <ap_P_Pvlpn2rEjBV@gremlin>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
 <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
 <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>
 <ap-qDThi-NQgVXVD@wyuan.org>
 <048d7470-a813-4252-a4f0-0ec29694f639@easystack.cn>
 <ap-zYt-1qCBGKZed@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap-zYt-1qCBGKZed@wyuan.org>

On Tue, Sep 08, 2026 at 03:04:02PM +0800, Weijie Yuan wrote:
> On Tue, Sep 08, 2026 at 02:40:10PM +0800, zhen.ni wrote:
> >
> >
> > 在 2026/9/8 14:24, Weijie Yuan 写道:
> > >  From an outsider..
> > >
> > > On Tue, Sep 08, 2026 at 10:41:23AM +0800, zhen.ni wrote:
> > > > >
> > > > > Sorry but your whole reply reads like a LLM slop. It took a lot of
> > > > > mental effor to actually try and engage with it.
> > > > >
> > > >
> > > > This reply was written by me, and its viewpoints are not simply copied
> > > > directly from an LLM. The LLM only assists with the wording.
> > >
> > > So that's probably the reason. Your previous replies was indeed very
> > > much like the output of an LLM. Even if the idea is your own, after
> > > being "polished" by LLM, it's hard to read. I know English is not our
> > > first language, and it's not that easy to speak like a native speaker.
> > > But may I ask you did you read it before sending them out? I really
> > > found this bunch of overly formal content a little painful to read.
> > >
> > > So I suspect the LLM may have taken too much liberty in polishing your
> > > text, to the point that your replies no longer read like something a
> > > person would naturally write.
> > >
> > > The "Summary and Plan" in your reply in v1, both in its formatting and
> > > wording, looks quite similar to LLM-generated text to me. So I can
> > > understand why Lorenzo asked whether you had used an LLM. Come on, we
> > > all know what LLM writing looks like.
> > >
> > > That said, I do not know exactly how you used the LLM on your original
> > > text, so please forgive me if I have this wrong.
> > >
> > > Thanks.
> > >
> > I really can't distinguish the LLM flavor that clearly in English.
>
> Yes, sometimes I can not as well. But I guess the native ones can.
> So.. ;-)
>
> > I'm sorry for causing some trouble.
>
> That's fine. No need to say sorry.
>
> I know and understand that we non-native speakers would rather not make
> mistakes over these little language detail issues. But over-polishing
> can end up having the opposite effect. Keeping some of your natural
> writing style may actually be what the community prefers, especially
> these AI days.
>
> > My normal reply process is to first describe my ideas, then have the
> > LLM check for logic and grammar issues, and do a round of polishing. I
> > check the final draft once more to see if it has deviated from my
> > ideas, and make corresponding revisions.
>
> Sigh, so it is hard to know where to draw the line. Write more and learn
> more about "human-like" writing, perhaps. :)
>
> Thanks!

Thanks Weijie appreciate your input :) and it's good to get a perspective from a
non-native speaker on this!

Generally I empathise with LLM usage for helping non-native speakers with
English, that's a great use of it, so I don't object to it _in general_ BUT as
Weijie points out there's better ways of using and worse ways of using it.

You have to ensure that your meaning is transmitted properly without it
ultimately becoming essentially a conversation between a reviewer and an LLM.

So the technial discussion you are engaging in MUST be your own.

As for the 'summary' emails - please don't send them at all.

I feel like often they're used to generate a new prompt for the LLM and it
really ends up being 'workslopping', that is, making reviewers do more work
while the LLM takes care of things for you.

And that crosses the line really from 'aid to English' into it being a problem.

Instead, ENGAGE IN CONVERSATION with the reviewer, in line.

So if a review says:

"Please make this function do X, Y, Z".

Don't put something in a summary email or anything like that. REPLY to them,
quoting the request and respond. Like:

	> Please make this function do X, Y, Z.

	OK makes sense about X, Y is a bit tricker because of ... and Z is
	impossible because ....

For instance.

That way it is human-to-human interaction at all times, with maybe the LLM
helping with translation along the way.

As for the review - Vlastimil has raised legitimate technical points so I would
engage with those directly.

It's very reasonable for him to conclude an LLM was used for more than
translation, certainly the rather ludicrious 'document the world in the commit
message' approach looks inhuman.

So engage on the technical points without summary emails, and please put
documentation in a documentation file :)

Also I think it's reasonable now for you to use an:

	Assisted-by: LLM

Tag on this series.

--
Cheers, Lorenzo
