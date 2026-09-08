Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD925964F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889080; cv=none; b=DEFSuyukkdSFHfIO9uasGb8q9f4mUjgYGsJP9y/hRszJAhCUfGskbkZSn+rnWa+HvnbCDobOTmmN75GxDeLmPNVLxy2nxW0zipmirkqJ21fImSV85zNzNkCJjvkm9Ld8pkNlhNR9M9IJsW6MzTKn/u6S37zEjjSS7ptQV0xoVp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889080; c=relaxed/simple;
	bh=3tCFyabxRU4YH+8PFdRE7DXdGGD2gR80e6LzYCAqTks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VONvSu6MdMTcET5D0zhL7XWNSlStEQZokWA/hDRyEjKXbxq1s/tvvtbfIzfgCbj1u7/JQwtyjjGPvQIgl7I0jHcV+R5v8ELNoYb2rKPv/Y/wRcIDA2c8uU1YBF9Fs6WWl9TotbaFfjXxHBDUxTZrbxRiBobMvZ1Iyh53oVrTmC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=DxBpDn5y; arc=none smtp.client-ip=91.218.175.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="DxBpDn5y"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3tCFyabxRU4YH+8PFdRE7DXdGGD2gR80e6LzYCAqTks=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788889072; v=1; x=1789493872;
 b=DxBpDn5y6Z0WK57TXCw87c98mocGfmozF6AuizLWy7idmwNTBXMiId8Zzq51xyzMZBpSpRPp
 e7GZ6h9ASaUh403ZWhq2VnpPI5OqHldPHa9f+W9Nm4FjlNHhRBvVHh0pjRTpIaO+fWMm48pK/pU
 c6HAoCGaT5WwO2hfJZ3tbzr6aDe8HUG5xPbVnLpwin4yXP2IbdnQarSavTmXrM6GDTDeRWLFZX5
 AphK5hjBdGkjLwZUDXTDF4Gv4tsEm1rd1q/bBtOc2g7vf/ODgPcl3zM93dII7bO4t3texL3ZlpD
 Gxgvuf1p+IuLuaAhwAwtAXRbXdtbvFB1vpi79M/MFJwJg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bbc1b69037c6cb07;
	Tue, 08 Sep 2026 17:37:52 +0000
X-Mizu-Trace-ID: bbc1b69037c6cb07
X-Migadu-Flow: FLOW_OUT
Date: Wed, 9 Sep 2026 01:37:42 +0800
From: Weijie Yuan <wy@wyuan.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "zhen.ni" <zhen.ni@easystack.cn>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Message-ID: <aqBH5j-d4wbTrAVM@wyuan.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
 <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
 <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>
 <ap-qDThi-NQgVXVD@wyuan.org>
 <048d7470-a813-4252-a4f0-0ec29694f639@easystack.cn>
 <ap-zYt-1qCBGKZed@wyuan.org>
 <ap_P_Pvlpn2rEjBV@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap_P_Pvlpn2rEjBV@gremlin>

On Tue, Sep 08, 2026 at 10:13:22AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 08, 2026 at 03:04:02PM +0800, Weijie Yuan wrote:
> > On Tue, Sep 08, 2026 at 02:40:10PM +0800, zhen.ni wrote:
> > >
> > >
> > > 在 2026/9/8 14:24, Weijie Yuan 写道:
> > > >  From an outsider..
> > > >
> > > > On Tue, Sep 08, 2026 at 10:41:23AM +0800, zhen.ni wrote:
> > > > > >
> > > > > > Sorry but your whole reply reads like a LLM slop. It took a lot of
> > > > > > mental effor to actually try and engage with it.
> > > > > >
> > > > >
> > > > > This reply was written by me, and its viewpoints are not simply copied
> > > > > directly from an LLM. The LLM only assists with the wording.
> > > >
> > > > So that's probably the reason. Your previous replies was indeed very
> > > > much like the output of an LLM. Even if the idea is your own, after
> > > > being "polished" by LLM, it's hard to read. I know English is not our
> > > > first language, and it's not that easy to speak like a native speaker.
> > > > But may I ask you did you read it before sending them out? I really
> > > > found this bunch of overly formal content a little painful to read.
> > > >
> > > > So I suspect the LLM may have taken too much liberty in polishing your
> > > > text, to the point that your replies no longer read like something a
> > > > person would naturally write.
> > > >
> > > > The "Summary and Plan" in your reply in v1, both in its formatting and
> > > > wording, looks quite similar to LLM-generated text to me. So I can
> > > > understand why Lorenzo asked whether you had used an LLM. Come on, we
> > > > all know what LLM writing looks like.
> > > >
> > > > That said, I do not know exactly how you used the LLM on your original
> > > > text, so please forgive me if I have this wrong.
> > > >
> > > > Thanks.
> > > >
> > > I really can't distinguish the LLM flavor that clearly in English.
> >
> > Yes, sometimes I can not as well. But I guess the native ones can.
> > So.. ;-)
> >
> > > I'm sorry for causing some trouble.
> >
> > That's fine. No need to say sorry.
> >
> > I know and understand that we non-native speakers would rather not make
> > mistakes over these little language detail issues. But over-polishing
> > can end up having the opposite effect. Keeping some of your natural
> > writing style may actually be what the community prefers, especially
> > these AI days.
> >
> > > My normal reply process is to first describe my ideas, then have the
> > > LLM check for logic and grammar issues, and do a round of polishing. I
> > > check the final draft once more to see if it has deviated from my
> > > ideas, and make corresponding revisions.
> >
> > Sigh, so it is hard to know where to draw the line. Write more and learn
> > more about "human-like" writing, perhaps. :)
> >
> > Thanks!
> 
> Thanks Weijie appreciate your input :) and it's good to get a perspective from a
> non-native speaker on this!

Thanks for your kind words!

> Generally I empathise with LLM usage for helping non-native speakers with
> English, that's a great use of it, so I don't object to it _in general_ BUT as
> Weijie points out there's better ways of using and worse ways of using it.

Honestly, my English isn't that great either. Sometimes, I find I cannot
express myself very well in English. Then, to avoid unnecessary
misunderstandings caused by my clumsy wording, I may ask an LLM how to
phrase something more naturally in English. That way, we don't end up
wasting everyone's time over wording issues.

So my suggestion would be to use an LLM only to polish small bits of
text, say a few words or a sentence, rather than feeding it a large
chunk at once. I've found that when I give agents too much text, it
tends to polish too aggressively and start expanding things.

(Only for expression issues)

It may be a bit like sending a patch series: if the series is small and
the changes are limited, it is usually fairly easy for reviewers to
follow. But once a series grows to a dozen or twenty patches, there is
much more information to process, and reviewers are more likely to miss
something. I actually made that mistake myself recently.

So once it gives you an expanded version, and especially if you're not a
native speaker and aren't very sensitive to the nuances of English, it's
easy to think, "Well, it says a bit more, but it also sounds more
complete and precise."

But I suspect that native speakers may naturally pick up on something
different: the expanded text can start to feel less like something a
real person would write. It can also become verbose enough that the
actual point gets buried, which becomes hard to catch for reviewers.

> You have to ensure that your meaning is transmitted properly without it
> ultimately becoming essentially a conversation between a reviewer and an LLM.
> 
> So the technial discussion you are engaging in MUST be your own.

Pessimistically speaking, perhaps this is just becoming a new normal,
and a new problem, for open source projects: reviewers spend a lot of
time carefully writing out their feedback, only for all of it to end up
as prompts for the contributor's agent.

That perhaps makes Linus's point about trust even more relevant.


And..

> As for the 'summary' emails - please don't send them at all.
> 
> I feel like often they're used to generate a new prompt for the LLM and it
> really ends up being 'workslopping', that is, making reviewers do more work
> while the LLM takes care of things for you.
> 
> And that crosses the line really from 'aid to English' into it being a problem.
> 
> Instead, ENGAGE IN CONVERSATION with the reviewer, in line.
> 
> So if a review says:
> 
> "Please make this function do X, Y, Z".
> 
> Don't put something in a summary email or anything like that. REPLY to them,
> quoting the request and respond. Like:
> 
> 	> Please make this function do X, Y, Z.
> 
> 	OK makes sense about X, Y is a bit tricker because of ... and Z is
> 	impossible because ....
> 
> For instance.
> 
> That way it is human-to-human interaction at all times, with maybe the LLM
> helping with translation along the way.

I totally agree with the above. Moreover, I've noticed that some authors
of patches carrying an Assisted-by tag seem to do this quite often
lately: After reviewers reply to them, the next version will often
contain rather stiff, overly "summarized" descriptions of the
discussion.

Another example is when a patch changes just one line of documentation,
yet the commit message still goes out of its way to say something like,
"This is a documentation-only change and does not affect code
functionality." It is hard not to associate that with a typical LLM
habit: always trying to give some explicit reassurance or confirmation
that nothing else was affected. (I don't know if this is a requirement
for some subsystem, or if these LLM users are also non-English speakers)

I may be broadening the discussion a bit here (sorry for taking it
somewhat off topic), but I really like this passage from the Git
project's documentation:

| It's good manners to reply to each comment in the mailing list
| discussion instead of letting the next version of your patch be your
| only response. Tell the reviewer whether you plan to make the
| suggested change, keep the original, or pursue a different approach.
| This way reviewers can respond to your reasoning before you spend time
| preparing a version they may not agree with, and later do not need to
| inspect your v2 to figure out whether you implemented their comment or
| not.

(Okay, I admit I wrote part of that. ;-))

Of course, that is Git's culture, and it may not necessarily apply to
the kernel. Still, I think Patrick made a good point that this: "... it
encourages more social interactions between contributors."

I haven't been in this community for very long, but I've run into this a
few times recently as well: contributors will often just send a new
version without replying to comments on the previous one. Sometimes they
do put a response to you below the three-dash line in the new version,
though. (And sometimes I suspect that even the commentary part is also
LLM-generated.)

Submitting-patches already says something related to this, and I
happened to be wondering recently whether that part could be improved
and made a little more explicit. But that would also benefit from input
from people here with much more experience than I have.

Perhaps I could send an RFC and see what the experienced ones think.

Thanks.

