Received: from mail-m32101.qiye.163.com (mail-m32101.qiye.163.com [220.197.32.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302E52ED33;
	Tue,  8 Sep 2026 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866666; cv=none; b=nfiLrx0GRPNDfwDBYEjm9qufRMFIN9IS/LN2exqIBtnD9MlkiRU8DOE76ttuCgVMdSmR8/WuvdQbbAbnsmYH+WT5nVSkxHOG7xVdcfIAczWUh8tzb01ptHGI23GEtK3itPhvz27xhh+fnWve0+tpxfEoNOzd6TpVcRZ4dSCsQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866666; c=relaxed/simple;
	bh=geMoxwMST3HCJv8S+uchkbckJfNkY31dxvhO/SMdfhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II6L5rY6ryuMJ9zRjWGjB6G+ieadmVVqfRsXvrZH/gSidMCJPse+voiRn8/b6lkLomfojHJjX332x+0oOKTd+0AniTojktWfldHdQtJR8jRhRRllYmr46g/llK/Ou5foHwolvT/5o6BbuurtB9jkf8EWcL6dpZWo5FJUc8/+tyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.32.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ed4ad140;
	Tue, 8 Sep 2026 19:18:59 +0800 (GMT+08:00)
Message-ID: <be27d762-af18-4efb-8f24-3e39373f53ff@easystack.cn>
Date: Tue, 8 Sep 2026 19:18:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Weijie Yuan <wy@wyuan.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
 <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
 <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>
 <ap-qDThi-NQgVXVD@wyuan.org>
 <048d7470-a813-4252-a4f0-0ec29694f639@easystack.cn>
 <ap-zYt-1qCBGKZed@wyuan.org> <ap_P_Pvlpn2rEjBV@gremlin>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <ap_P_Pvlpn2rEjBV@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa080be24450229kunm2817d6f71c285e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkofVh9KSRhDSh8YHRkfH1YVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+



在 2026/9/8 17:13, Lorenzo Stoakes (ARM) 写道:
> On Tue, Sep 08, 2026 at 03:04:02PM +0800, Weijie Yuan wrote:
>> On Tue, Sep 08, 2026 at 02:40:10PM +0800, zhen.ni wrote:
>>>
>>>
>>> 在 2026/9/8 14:24, Weijie Yuan 写道:
>>>>   From an outsider..
>>>>
>>>> On Tue, Sep 08, 2026 at 10:41:23AM +0800, zhen.ni wrote:
>>>>>>
>>>>>> Sorry but your whole reply reads like a LLM slop. It took a lot of
>>>>>> mental effor to actually try and engage with it.
>>>>>>
>>>>>
>>>>> This reply was written by me, and its viewpoints are not simply copied
>>>>> directly from an LLM. The LLM only assists with the wording.
>>>>
>>>> So that's probably the reason. Your previous replies was indeed very
>>>> much like the output of an LLM. Even if the idea is your own, after
>>>> being "polished" by LLM, it's hard to read. I know English is not our
>>>> first language, and it's not that easy to speak like a native speaker.
>>>> But may I ask you did you read it before sending them out? I really
>>>> found this bunch of overly formal content a little painful to read.
>>>>
>>>> So I suspect the LLM may have taken too much liberty in polishing your
>>>> text, to the point that your replies no longer read like something a
>>>> person would naturally write.
>>>>
>>>> The "Summary and Plan" in your reply in v1, both in its formatting and
>>>> wording, looks quite similar to LLM-generated text to me. So I can
>>>> understand why Lorenzo asked whether you had used an LLM. Come on, we
>>>> all know what LLM writing looks like.
>>>>
>>>> That said, I do not know exactly how you used the LLM on your original
>>>> text, so please forgive me if I have this wrong.
>>>>
>>>> Thanks.
>>>>
>>> I really can't distinguish the LLM flavor that clearly in English.
>>
>> Yes, sometimes I can not as well. But I guess the native ones can.
>> So.. ;-)
>>
>>> I'm sorry for causing some trouble.
>>
>> That's fine. No need to say sorry.
>>
>> I know and understand that we non-native speakers would rather not make
>> mistakes over these little language detail issues. But over-polishing
>> can end up having the opposite effect. Keeping some of your natural
>> writing style may actually be what the community prefers, especially
>> these AI days.
>>
>>> My normal reply process is to first describe my ideas, then have the
>>> LLM check for logic and grammar issues, and do a round of polishing. I
>>> check the final draft once more to see if it has deviated from my
>>> ideas, and make corresponding revisions.
>>
>> Sigh, so it is hard to know where to draw the line. Write more and learn
>> more about "human-like" writing, perhaps. :)
>>
>> Thanks!
> 
> Thanks Weijie appreciate your input :) and it's good to get a perspective from a
> non-native speaker on this!
> 
> Generally I empathise with LLM usage for helping non-native speakers with
> English, that's a great use of it, so I don't object to it _in general_ BUT as
> Weijie points out there's better ways of using and worse ways of using it.
> 
> You have to ensure that your meaning is transmitted properly without it
> ultimately becoming essentially a conversation between a reviewer and an LLM.
> 
> So the technial discussion you are engaging in MUST be your own.
> 
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
> 

Noted with thanks.

> As for the review - Vlastimil has raised legitimate technical points so I would
> engage with those directly.
> 
> It's very reasonable for him to conclude an LLM was used for more than
> translation, certainly the rather ludicrious 'document the world in the commit
> message' approach looks inhuman.

I'm not sure which patch you are referring to, as its commit message
appears to be unusually long (seemingly stuffed with massive LLM-
generated information).

For my 8 patches, the commit messages are not generated by an LLM, and
they are written very concisely.

If you are referring to the cover letter being long, I would like to
briefly explain. The cover letter itself isn't that long; the extra
length comes from the test programs and test results I attached. I felt
it was necessary to let the reviewers know exactly what tests I
performed and how effective they were, so as to ease the review burden.

However, since this information cannot be placed within the individual
patches, I had to put it in the cover letter for now. Please note that
this content will not be included in the final commit messages later on.

> 
> So engage on the technical points without summary emails, and please put
> documentation in a documentation file :)
> 
> Also I think it's reasonable now for you to use an:
> 
> 	Assisted-by: LLM
> 
> Tag on this series.
> 

I resorted to an LLM only to structure the language in my reply email —
purely for efficiency, to help expedite the review process. For the
patch series itself, however, I had ample time to prepare, and both the
code and the documentation were written without any LLM involvement.

Therefore, I believe the Tag in question is not really suitable here.

Thanks,
Zhen
