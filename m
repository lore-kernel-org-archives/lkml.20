Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCE25293FD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175206; cv=none; b=Eh3Pn1u/DKe6bl7EBUgkCCiXaI2ylpVpOcQBmWFtEPvZ3cTI1Vw1VW+f9v2/YOKRGHgTQ+NcL4c1LhuMQD+jFdHEJSrjQQFLfuElKVixEkOlncgr65WDJEtsE/4JcEVEpF/6vhMsh8fqhByYVTWUGxKkCR8uxEVcBzQYIZ2Bnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175206; c=relaxed/simple;
	bh=jtuOJCCzzL0aM1Ldk4uNEeEW1TSYEpqIrSgTbwGTG6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oErhe6j+9M2349Q7uKlPu+ydb+Nal4+yLQqKidqnClCefTjNWHWq/PYx7FLPkpMU6AYu2MUU5R7rvV8rlbB1hhMFF0I67H9a+cIws4719k+Eyoe8Sx6zDOR/OyVuTTyGkTLrqnk2tXcA5+ecio8gV+V2bMNUHAHE+Ba7VHkSKD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iLzXVdOE; arc=none smtp.client-ip=91.218.175.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iLzXVdOE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jtuOJCCzzL0aM1Ldk4uNEeEW1TSYEpqIrSgTbwGTG6g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792175202; v=1; x=1792780002;
 b=iLzXVdOEqHdLkfhHn/eAZLyavV5Zu/u2b3OVs36nfMEiQ2d7U/tjJ5mWRnLirKgM7AK1KAEA
 dHSJ1ppYvK7Zdq9tfiDs4b/xIkmwxZrmO0c1o5Q19cKbO1BygrOht4gi84rCr76WD4ughKwCUgA
 odSzE/BfotAFZGYo25bq4FCk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e74b6b979483c25e;
	Fri, 16 Oct 2026 18:26:42 +0000
X-Mizu-Trace-ID: e74b6b979483c25e
X-Migadu-Flow: FLOW_OUT
Message-ID: <b23eb084-cf56-4eea-a934-6e8497594383@linux.dev>
Date: Fri, 16 Oct 2026 11:26:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: remove Assisted-by references
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>,
 Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jens Axboe <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org> <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com> <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20261013131243.GM56180@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-13 6:12 a.m., Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:
>> On Tue, Oct 13, 2026 at 02:31:32PM +0200, Laurent Pinchart wrote:
>>> On Mon, Oct 12, 2026 at 04:42:46PM +0100, Lorenzo Stoakes (ARM) wrote:
>>>> The tag's useful for push back on review,
>>>
>>> That's the point I raised during the maintainer summit. It's actually
>>> the *absence* of a tag that helps me push back on review. It allows me
>>> to ask submitters if they forgot to add the tag, and in many cases (so
>>> far) they simply don't reply.

A practical rule of thumb in the year 2026 is to assume LLM has been
used unless there is very compelling evidence to believe otherwise.

A voluntary tag only tells you that the submitter may have been aware of
the policy. It doesn't even prove that, because the tag could have been
added by the "agent" reading the documentation.

The decision to deprecate Assisted-by is right.

>>
>> While the tag's useful for pushback, pushing back is the issue.
>>
>> The asymmetry between submitter volume/reviewer bandwidth is the MOST
>> CRITICAL issue we face.
>>
>> If reviewers are required to reply to all of these people, the project's
>> dead, AFAIC.
>>
>> Ignoring is the only workable long-term solution.
> 
> How do you decide which patches to ignore ?

It is indeed the main issue.

netdev, for example, has an automated scoring system, partly based on
review to submission ratio - e.g. contributors who review other people's
patches are prioritized:

https://netdev-ctrl.bots.linux.dev/suie.html
https://lore.kernel.org/netdev/20260303180122.0929a864@kernel.org/

A complementary thing is deploying automated patch review systems that
use LLMs, like sashiko. netdev and bpf have customized solutions and
they are quite helpful in terms of scaling the patch queue processing.

> 
>> The issue we had before was a lack of a CLEAR and LOUD 'yes ignore these
>> people' from Linus.
>>
>> We now have that :)
> 

