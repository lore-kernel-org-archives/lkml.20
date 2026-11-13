Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562285;
	b=Rv7xxq7Lol5VmsUK9qOSPGUu+y8iBJgXeq+i61aAE3aSq+H11Xc6bB4tXw2JXvyTVDMH
	 dP+WBpRN+AoY8u5wh0lU0x4Av/3cMyFM6n2Qo52wJnmD4g1SjeKALcAVZJbJRF+0xlkwF
	 eNapvonUptmEu6Zt0T8IwjiCluXpzbhC5zv7Y9pbC/S8OIhItHm0DNnT+Ilubhvbu3DE7
	 PbFZeji/hwVrU8U1Ed6CGl7Dk+3pJvQTMIhh7Ipn5RQMlpgd/eO39Nxt6I9zPI89RfTAk
	 Idqp0HksIhwudNePe8xJFa22AAcIMQO5hgBxBNMS93HDK+iZEpaUwOA7lmqOTTWJ+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562285;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=U+T4uJ/e8/uh76kjQ5Uc9g/ybxEFK3XIJAOLTkG2Nds=;
	b=CoxGjISd4Zstpwk7N6vRdD7ie1gXq9d3oEk5DYSTwtcBMjQq5Mg9nx+LdtQAAn4quRdV
	 QhQskHJ8b4tDvck3HPdQhYwwfGI+O6FLoKzrfrI4ONvAl4hEiZVhUw64wl51uOH4GEHDn
	 LpBVQAYT4pcN+NhMPX00ErlJOKeyP3mrrZgDmAGJ5lyAcZ2HgaQunHJzYQ95ml4UIkYzy
	 QGZh8Q4UujoV3GI9BW+mHTuRlfzg7KoS+5JO2JJ7Vk99ISsPXaSPyXIe+I2NrXuWuZdpL
	 it2OSEnJRq2UoWvroqA3iIw5XlPWgucJ77CybsXTR5HOVh2uCwBNqTpZNj5mxIWFZ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkevgVD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61761606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkevgVD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68321F000C4;
	Fri, 13 Nov 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562285;
	bh=U+T4uJ/e8/uh76kjQ5Uc9g/ybxEFK3XIJAOLTkG2Nds=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=SkevgVD3y0KBQDFc35+Xm3Vp1FTWw7yzvBaNGH5AIIsVODesjyHZvCjMr89UoeGXq
	 L4pfTvoZHc4AjXxWo72FhCC5po/1IkVbUj2m5khZom2Ias3DJFs3ldtyP61Lcbiu0C
	 hl0+dJ0kEvToxfNojfUSd5VWkk1D8TnqxG6Ck0KzEv/0bhd9qdgOQJDASygIZZJK5j
	 hkwsvuSjMaeUnAZ2M8Wwte20vqushYu8R6UtrqDpcT/pLbpps3DD26187iwMCYp2xM
	 NqReSRoPng1JY223qLCugqqmdGD3WIlDAY4J0lZtz+o610Z4dg7zfPW4PsFrzUquMf
	 zCD51KcDKuJYw==
Message-ID: <86627f3f-cdda-4165-8ca2-0c8dd4e321a9@kernel.org>
Date: Fri, 13 Nov 2026 17:31:21 +0800
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
Cc: chao@kernel.org, jaegeuk@kernel.org, yi.sun@unisoc.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated
 blocks
To: Seongjae Jeong <jsjlee1020@gmail.com>
References: <20261004061007.7433-1-jsjlee1020@gmail.com>
 <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
 <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
 <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org>
 <CAPHXVry2O-AYxTvGdzu+m6b3Q=ho=xL0kpWWqCn0vjj-gOe0ZQ@mail.gmail.com>
 <0e156b8a-2876-4bbe-b16c-55c70b3201b3@kernel.org>
 <CAPHXVrxHvXChxiBxCcHWLaFwvatnDVhSu7wdvPWiBDYaUSOQJg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAPHXVrxHvXChxiBxCcHWLaFwvatnDVhSu7wdvPWiBDYaUSOQJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Seongjae,

On 11/12/26 18:36, Seongjae Jeong wrote:
>> I don't see how commit a66cdd985532 ("f2fs: introduce discard_map for f2fs_trim_fs")
>> introduce the bug? from the timeline, at that point there is no error handling in
>> update_sit_entries() if sit bitmap is inconsistent, right?
>>
> 
> Hi Chao,
> 
> Commit a66cdd985532 added the following two lines:
> 
>     if (!f2fs_test_and_clear_bit(offset, se->cur_valid_map))
>         f2fs_bug_on(sbi, 1);

Previously, we will trigger f2fs_bug_on() and there is no further error handling
at that point, so that we will update SIT_I(sbi)->written_valid_blocks as well
incorrectly, so I don't think this is a bug of a66cdd985532.

Thanks,

> + if (f2fs_test_and_clear_bit(offset, se->discard_map))
> +     sbi->discard_blks++;
> 
> Even if the cur_valid_map bit was already clear, the added code
> could still clear the discard bit and increment discard_blks if the
> discard bit was set.
> 
> Since my patch skips that update for an already invalidated block,
> I thought a66cdd985532 was an appropriate Fixes tag for the discard
> bitmap part of the change.
> 
> Thanks,
> Seongjae

