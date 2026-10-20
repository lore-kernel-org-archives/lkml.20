Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482960;
	b=1gVQjqXtLyfLswtFQY6ijb6sKDCSSqGO0HUcoEYYnDy1ArXVtWID+7QykauZ5uSGE79g
	 nsepA1a/W/2nu7ZlqKElWfcQFev4WJJ7PtZc85sluwl2zaJZjtCKgzoRM0O+M3HOsrFtv
	 n9L0POI+BFpwCYJVhezsxvRlKwVoGXBC63RtPCS7zABFxaf1KJMM3PBzX11fBDEgn9kF7
	 xPpPlYTG1N66uucT68r1BuDe0mN6uUqXI2rFBL4Hxp4on07WN/omJ4dVO8EbelzWyNo1D
	 cKCIgKnO+SnFlbcxDO/U/csiXVsUsKP+DwWrC+r7KAYOndDgYNlToCOQw/tfSUUM3ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482960;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mG3kNywBpCjlsN90sZBCwLqBblspQOk2h7zQBNKp7wI=;
	b=i0ZcdmPy/PDvWfW4f/CcJUxPoZx3OspeknZw5cU+Amj7uwBPCoSAd7kS2SaJ1EQY5rTC
	 G9wbsL8ov21OITwg8+mKsx4RCGl9hgxw6Op91Q15aOfrxPCfmSOY6CnEqn+N9Me7cowSJ
	 tp2e7xNuiNkT0dO/GjnuFRoamT79351zG/uBDjD/SE+l99Ge/fNsSqszezSkKLxSCKC8f
	 9USa2W/75hLNZlQAAsVS2z0f2S3Yxzs6uSPBR367ojEGEkwT1V2pHg+BX36Mfjj7PbC2S
	 TNIAGA/mmnr+wDMuIS4sOGA7uoOC7ajeUof4PwwaaY+m8tKoGQp4+6tZCE7ZC8+B38g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvxGAV+O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B22606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvxGAV+O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5174B1F000C4;
	Tue, 20 Oct 2026 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482959;
	bh=mG3kNywBpCjlsN90sZBCwLqBblspQOk2h7zQBNKp7wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DvxGAV+OaraT9ljQafttLtkjrCxCFCziGjRjdD6HwDSpmr4+0+MkXiqlz3dN3LkvR
	 MfM/McOKEjS6LdRZ6VGYT8CWPrJhfnxWW1JkPviBcxyJrcCOm6OYTyoDRKnLxDzXlJ
	 gygE0Udc9/JKsQXMuoyTGMOiyu0lM2/HJ4EK04aOfsQ60EhPsIji7jnMWfon937KHA
	 Ry9q64jMwMhte7oWL6nK2TbfURYsSEwUAOTeWoV8lik4nsuFWIv4b7hJNTI2x4/F8O
	 7YwJlW32gApnjMaxcZR64YRoxdu+mtO7KqcMSGUdLoFSnKOIkdJY0ZbdF6xyEHG1gX
	 XXeczGddFlPoQ==
Message-ID: <70771a19-9392-4fbb-8aaf-dcd40f60e977@kernel.org>
Date: Tue, 20 Oct 2026 09:55:54 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory-tiers: reset demotion targets of nodes without
 memory
To: Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 ying.huang@linux.alibaba.com, weixugc@google.com, aneesh.kumar@linux.ibm.com
References: <20261019184712.3422641-1-gourry@gourry.net>
 <DM91RXTJ5EFF.2YQARRB6TXQIK@nvidia.com>
 <atZ67m_JYJADzY-C@gourry-fedora-PF4VCD3F>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <atZ67m_JYJADzY-C@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 22:22, Gregory Price wrote:
> On Mon, Oct 19, 2026 at 03:04:45PM -0400, Zi Yan wrote:
>> On Mon Oct 19, 2026 at 2:47 PM EDT, Gregory Price (Meta) wrote:
>>> When a node loses its last memory, offline_pages() clears N_MEMORY
>>> before the memory-tier callback rebuilds the demotion targets.
>>> disable_all_demotion_targets() resets only N_MEMORY nodes, so the node
>>> keeps its old node_demotion[] entry while it has no memory. Before
>>> 6c542ab75714, the reset covered every online node.
>>
>> establish_demotion_targets() uses for_each_node_state(node, N_MEMORY),
>> because the to-be-online node is already added into N_MEMORY?
>>
> 
> NODE_ADDED_FIRST_MEMORY happens after the memory is already added
> (though not necessarily online). 
> 
> NODE_REMOVED_LAST_MEMORY happens after the last memory block is removed
> (and therefore N_MEMORY is gone).
> 
> slightly different timing for each event.  There isn't a reasonable
> change we can make otherwise.
> 
>>>
>>> A reclaimer reads the stale entry only between the node regaining memory
>>> and its targets being rebuilt, and it filters the entry against the
>>> current allowed targets, so there is no user-visible effect. To see it,
>>> online and then offline a node's only DIMM: a debugger still finds the
>>> lower-tier node in node_demotion[nid].preferred.
>>>
>>> Reset the targets of every node.
>>>
>>> Fixes: 6c542ab75714 ("mm/demotion: build demotion targets based on explicit memory tiers")
>>> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
>>> ---
>>>  mm/memory-tiers.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
>>> index 25e121851b586..7197f1a67a340 100644
>>> --- a/mm/memory-tiers.c
>>> +++ b/mm/memory-tiers.c
>>> @@ -378,7 +378,7 @@ static void disable_all_demotion_targets(void)
>>>  	struct memory_tier *memtier;
>>>  	int node;
>>>  
>>> -	for_each_node_state(node, N_MEMORY) {
>>> +	for_each_node(node) {
>>
>> I think the above code deserves a comment explaining why for_each_node()
>> is needed instead of for_each_node_state(N_MEMORY), because when a node
>> is added or removed during memory hotadd or hotremove matters here.
>>
> 
> Sure.  Will respin tomorrow and give others a chance to look at it.

A comment makes sense to me as well, it's not completely obvious.

Apart from that LGTM.

-- 
Cheers,

David
