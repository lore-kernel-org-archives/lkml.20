Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E236493C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851063; cv=none; b=HZ1FLjxU/Dm8O6kjlyi9njnTz9UaWSvc/+p1woX3MJTVAKIXR/0E0KSnedUziwlub4Kfj1KA1mqahRsP1twABR3Peil27xZKdC22uJXo7c6CdgxhLLUdcM1c2HNU+sNPtBoLE6UJesKqWmuhm18bwsL26KTuLbSzbEHUarqAQkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851063; c=relaxed/simple;
	bh=HzjFTUzM1h8cKJKoYfscrnzwWcTkdgUAux0H+g1d+hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bg/DhOn5ga9hwcJhCwJ7E/dSpsHqY1QfYaJIzarK80loeDPZMnecAoizSrmi8juLPiakNdzO44kGZu5b7yvLhVYuLtXTAzvSGeOE4riVRuOMss48hAb3DVktkZo5vYB7tppe+Uo91z7tHFXlMf0H56/o5FRP5LRYTKpecLX4wgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YHq6NA4d; arc=none smtp.client-ip=95.215.58.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YHq6NA4d"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HzjFTUzM1h8cKJKoYfscrnzwWcTkdgUAux0H+g1d+hY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788851058; v=1; x=1789455858;
 b=YHq6NA4dy1BvedmUYoV6pFx7iMGTguTfbNg1KKuWI5CWCwrL/N1G2vynZcVcCtWGiKRjakM0
 bisyRJmjjFKfJ/RiBuURiMMjdkR60ME+O28Kvi+5IsXZN+jUq9lPQiysnf0j60hzm3sYn2mwhP3
 Vyi9Pd3gwq1OHobwJoUPjUH1XGHQpnETOb2lr+KLkhXpU0K1AkXqOTVH1NlhQKolJclCVpQpaAB
 O9Lg8pm3xNSvumCZXJFtApjHVLMserY7FPe6+OA+JBuCH9d7DAoxUUxL8T2+KK8l6ANmaT0Qc/l
 lIt9N0iF3W1yCsaSGZzQzdgk1znu2SqPHfzbeYYRP2j8Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dade2e651a255ea7;
	Tue, 08 Sep 2026 07:04:07 +0000
X-Mizu-Trace-ID: dade2e651a255ea7
X-Migadu-Flow: FLOW_OUT
Date: Tue, 8 Sep 2026 15:04:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: "zhen.ni" <zhen.ni@easystack.cn>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
Message-ID: <ap-zYt-1qCBGKZed@wyuan.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
 <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
 <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>
 <ap-qDThi-NQgVXVD@wyuan.org>
 <048d7470-a813-4252-a4f0-0ec29694f639@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <048d7470-a813-4252-a4f0-0ec29694f639@easystack.cn>

On Tue, Sep 08, 2026 at 02:40:10PM +0800, zhen.ni wrote:
> 
> 
> 在 2026/9/8 14:24, Weijie Yuan 写道:
> >  From an outsider..
> > 
> > On Tue, Sep 08, 2026 at 10:41:23AM +0800, zhen.ni wrote:
> > > > 
> > > > Sorry but your whole reply reads like a LLM slop. It took a lot of
> > > > mental effor to actually try and engage with it.
> > > > 
> > > 
> > > This reply was written by me, and its viewpoints are not simply copied
> > > directly from an LLM. The LLM only assists with the wording.
> > 
> > So that's probably the reason. Your previous replies was indeed very
> > much like the output of an LLM. Even if the idea is your own, after
> > being "polished" by LLM, it's hard to read. I know English is not our
> > first language, and it's not that easy to speak like a native speaker.
> > But may I ask you did you read it before sending them out? I really
> > found this bunch of overly formal content a little painful to read.
> > 
> > So I suspect the LLM may have taken too much liberty in polishing your
> > text, to the point that your replies no longer read like something a
> > person would naturally write.
> > 
> > The "Summary and Plan" in your reply in v1, both in its formatting and
> > wording, looks quite similar to LLM-generated text to me. So I can
> > understand why Lorenzo asked whether you had used an LLM. Come on, we
> > all know what LLM writing looks like.
> > 
> > That said, I do not know exactly how you used the LLM on your original
> > text, so please forgive me if I have this wrong.
> > 
> > Thanks.
> > 
> I really can't distinguish the LLM flavor that clearly in English.

Yes, sometimes I can not as well. But I guess the native ones can.
So.. ;-)

> I'm sorry for causing some trouble.

That's fine. No need to say sorry.

I know and understand that we non-native speakers would rather not make
mistakes over these little language detail issues. But over-polishing
can end up having the opposite effect. Keeping some of your natural
writing style may actually be what the community prefers, especially
these AI days.

> My normal reply process is to first describe my ideas, then have the
> LLM check for logic and grammar issues, and do a round of polishing. I
> check the final draft once more to see if it has deviated from my
> ideas, and make corresponding revisions.

Sigh, so it is hard to know where to draw the line. Write more and learn
more about "human-like" writing, perhaps. :)

Thanks!
