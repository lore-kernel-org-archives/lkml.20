Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B1420E7C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811070; cv=none; b=Ao5LpCtGZQG6KAy7BYmhqse3fgqSzQp0yQeHeGUtJqS/eQsoLjubB4N/RQkfkkP4muHBc/OK5dNRYf8pn273UWX0hQY9GCpFPGpeUBsVV8AeMWMW6j/Xc2iK9mj6DCyjvVGd3EG044awJYBGpCqwLIMwPckQMEOvRyTLHDZUB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811070; c=relaxed/simple;
	bh=jdUYVS+YdOcdEcqavzPPKCzHJFCDt3rrQaoJDSq3eVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Exy+fezZbFJoZ6pIUrFwfc+6Vv/p+SCGmfm4iQggxPO0MaYMcRzLEfEOVB1+GnKuLk9t1wV0DQ1IGz2rRVnqxzx2TXF4hw44AGFYLC4uVBivhUg+TfpwiUMfxlbzdDMvKqers7XM2/ONFd/aA2LAagFyMl7Pt24wKSlVyKX4UU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xfZ5+xr7; arc=none smtp.client-ip=95.215.58.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xfZ5+xr7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jdUYVS+YdOcdEcqavzPPKCzHJFCDt3rrQaoJDSq3eVo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788811066; v=1; x=1789415866;
 b=xfZ5+xr74p52XwQTXNOSLFPzaqbigBCSOg8pNAvgFSH/wuTSCyzUfVdqlgMrZ3++ATPvoMZe
 6xM5RDakw2X6sVvW7tQb6wW7rYPbz+wh2H1lRMNeZdA3MNPLPrUinCUrhVNBdv+C9zTxwchS/Oi
 PJNcfRP0FuuOy2daYHZopmfE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8fc32778f025bbd4;
	Mon, 07 Sep 2026 19:57:44 +0000
X-Mizu-Trace-ID: 8fc32778f025bbd4
X-Migadu-Flow: FLOW_OUT
Message-ID: <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
Date: Mon, 7 Sep 2026 21:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> wow, I realize now I completely misunderstood what this whole endeavor
>> was about. I *thought* the point was to read the information about all
>> the functions from Device Tree tables. I now understand there are no
>> such tables, all the information is encoded in C as part of the
>> higher-level codec driver.
>>
>> Is this really intended?
> Unfortunately Yes.
> 
>> I mean, the whole ACPI set of definitions relied on the _DSD mechanism
>> that mimics what DT provides. Do we really want all this information in
>> C? Why not have a set of DT properties for each function?
>>
> 
> We discussed this topic at LPC 2025, Devicetree MC:
>     "DeviceTrees - MIPI SoundWire Device Class for Audio (SDCA) and
>      classic ACPI-DT problem"
>     https://lpc.events/event/19/contributions/2024/
> 
> Among other options presented, representing them in a intermediate
> format was something which was doable.
> 
> I have also proposed another follow up of this topic in this years LPC
> Devicetree MC too
> 
> RFC of this patchset got some comments from DT maitainers.
> 
> DT maintainers are not happy with the idea of keeping this info in DT
> while it can be derived from compatible string.
> 
> https://lkml.org/lkml/2026/7/29/1166
> 
>> I guess my main objection is for opaque initialization data aka blind
>> writes or SWF table, this should really come from platform firmware, no?
> This table is directly generated from ACPI tables both from Lenovo T14
> and Reference platform.
> 
> on ARM platforms DT is is the only firmware entry for such things and
> its not 1:1 with ACPI example, Somethings that can be derived can not be
> in Device tree description so its bit of mix.
> 
>> With this approach you'd have an endless set of kernel quirks for each
>> board variant using the same codec.
> 
> @Krzysztof Kozlowski <krzk+dt@kernel.org> that is a valid point.
> 
> Idea is to gate them using platform specific compatibles, so far we have
> few laptops that are pretty much identical w.r.t the description, may be
> we got lucky in this early stages.
> 
> In future if it turns out to need a quirks per platform or changes
> needed in this table then we should be able to handle it with platform
> specific device compatibles.
Thanks for the pointers. Unfortunately I missed all these threads but I
don't have the background to understand the difference between software
nodes, secondary fwnodes, etc.

What I can tell you is that the SDCA definitions were NOT designed for
ACPI. We used the concepts we wanted to expose to drivers and the Intel
ACPI folks told us how to represent them in ACPI. At the time, we didn't
have *anyone* in the WG who could speak for DT platforms, and the main
push was Windows platforms so ACPI became the path of least resistance
to get things done.

The entire SDCA document is a design-by-committee exercise where we
tried to make progress, you need to look at the SDCA document and not
think "how do I translate the properties to DT syntax' but 'how do I
extract useful concepts and represent them well in DT'...

I could go on forever on what happened since 2017 but here goes:

1) One of the most frustrating things with ACPI was the lack of
'subblocks', we had to define indirections using "_DSD Hierarchical Data
Extension Properties", which wasn't a walk in the park. That makes the
SDCA text file completely unreadable for humans, and to the best of my
knowledge no one ever released tools. This was the case when the
properties were integer values, but now that the properties include
binary arrays it's even worse. You could do much better with DT...

2) The other problem is that some of the DisCo and SDCA properties are
not generic, they only make sense in the context of a specific board.
For example even if a codec is capable of detecting jacks, platform
firmware could be modified to remove this capability. The delays or
power states supported could be different between multiple boards. IOW,
the DisCo information does make provide information on codec v. board
context, it's all board. It's a bit silly but at the time we didn't have
an ACPI way of representing a board - it's available now with the
ACPI0018 'audio composition' device but too late...

3) the initial plan was to represent everything in DisCo, but that went
sideways when it became allowed to use firmware download for tables, and
when a separate SWFT format was invented. That provides 3 ways of
storing opaque/binary data...

4) and perhaps the most confusing for me, the codec hardware is allowed
to request specific binary data for specific uses, which breaks further
the difference between codec and board...

My take is that rather than encode all properties in C, it's probably
worth exploring a DT representation of the concepts that *can* be used
fairly easily and make the life of codec vendors easier - not as a
literal translation of ACPI.

Putting everything in C seems like a code management nightmare to me.

