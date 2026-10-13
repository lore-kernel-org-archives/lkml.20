Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3593B6356;
	Tue, 13 Oct 2026 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896662; cv=none; b=Ee6R44mrn5Wpu61z/ecyUtmIDcb0J/UnZ3sfjirb1GDi6dhJcnJMWat5AiIZXpEjsh8smFC/Zya+2/PtnxFlo6wMG9WbIFVYTeGU8r4ehah+/pO4MkSNiFDzV/2uYM9QDlveVGsI7QzPO4uY0LU7JNqk17vsKL8mBg0WzcF1vWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896662; c=relaxed/simple;
	bh=fU8Xgkt+xknRAt5sx+YPZ6/50M9Sa3+w1rqnOE3WSSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qpahm8gg9+Iw1by84KHjNOuRBC80VD3S8CYJ5MBN1jUO10s5jgaL+xmRFxsct7BmL6kZUHeB9kt9PoO0fA1gTMAf8ZjW0xXyD+GaQrIo1GvLJwoPJgVlaRYRTGQYYPNu6mG7+wK+JnuxD+QwHMtikFUrTLnYfyx+BXedPvYVUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMPqePlk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMPqePlk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DF31F000FF;
	Tue, 13 Oct 2026 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896660;
	bh=Qf8dcrHSuGMW9yCgxoe30ejRpD8iojCWyvGd88bRkHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NMPqePlkARBFb+SBYZd9LYZhg79+JC7o8COBDPytkVwmUXvYFP4N/cQDINsE3cyJk
	 1OddtiKNIn6ft6Thyoako1w6VKcfYbxiipWBUeGb+wZHGzdGdGjn3yg+mxaw92w2gY
	 uQb1oVvk+bK7xW5mFfvHcGPoFUHa3VWSbYlfl7xwVi3/+c3aHXYUOMGotFoYd7uX0+
	 x56zqgttXv9u78I3iUy8OVsSAc/URlbhx7Ov/XmQaLBslYR/Vx1kk1P0jkllbEDoUL
	 3YrjJtEKWQb3Ft/Rx/vDvFX2Kb+olIKP/B7GSQoi0ewm01acRwFpIX/jyWn7nUhogt
	 +P28fbG95GQtQ==
Message-ID: <a296bc68-f36b-4db6-abbf-cf565c7cd3c0@kernel.org>
Date: Tue, 13 Oct 2026 15:04:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: remove Assisted-by references
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it,
 apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
 Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org> <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com> <as4pAEnLd4H68W4W@gremlin>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <as4pAEnLd4H68W4W@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2026 14:59, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 02:31:32PM +0200, Laurent Pinchart wrote:
>> On Mon, Oct 12, 2026 at 04:42:46PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
>>> The tag's useful for push back on review,
>>
>> That's the point I raised during the maintainer summit. It's actually
>> the *absence* of a tag that helps me push back on review. It allows me
>> to ask submitters if they forgot to add the tag, and in many cases (so
>> far) they simply don't reply.
> 
> While the tag's useful for pushback, pushing back is the issue.
> 
> The asymmetry between submitter volume/reviewer bandwidth is the MOST
> CRITICAL issue we face.
> 
> If reviewers are required to reply to all of these people, the project's
> dead, AFAIC.
> 
> Ignoring is the only workable long-term solution.

That was also mentioned by a few people according to Jon's report on LWN:
https://lwn.net/Articles/1099594/

and I think I could agree with that "ignore". IOW, we should change the
contract offer we give to people (see Greg's commitment in "I don't want
your code": "Review your patch within 1-2 weeks") to "if I suspect LLM
waste of my time, I might never respond".

Best regards,
Krzysztof
