Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5B533F5BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814429; cv=none; b=ddFQL5IeyfLxUiuN1WQoNj5HFq9gYmktLWqwHcsOlXkHyMYdP1Jy2wa+CUmOMLxv6V90M/0CGqD3UKUua08UzpT3JoAx4f2yAjt7F39VQSKpdnfSI8qOlRjF+bcxtR50Ot9JslhBMR0im/tCifldlyNnFK/JecX+OC94cifIwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814429; c=relaxed/simple;
	bh=J/q53GV7BVk1Lr8b5iatkIuwYAEhyAk7tPRMPNXwllA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHJ8hnaqjJ2A77XDidRF3thUXeX2bKWf0ZqV9D/DNHZE8YJPJ1wD8/8TU/mtwl4SRGZQ6KSdQYiPzj6TuBvfcM0eq399cfawmLi5cGFvExk1mvA7Tz0M4I1NmGGzCUPMi+XaRuJqRGDVXT6GN/UWZY08HMQncrFrJkRE34FSeiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L4S69/wD; arc=none smtp.client-ip=95.215.58.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L4S69/wD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J/q53GV7BVk1Lr8b5iatkIuwYAEhyAk7tPRMPNXwllA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787814425; v=1; x=1788419225;
 b=L4S69/wD4IkQsidrJ/tiAikm26LO0oiRSFb4clmp6g4zVuK/B3Dla/FRzmqb6skVHrCvzpDd
 S+BiZAVbFyQtZtY6yhwZ6BtRRZ4pk7kaYz0yA0sm1zQjoVV3UP6GiWUm3CR/qwBWPqDLN9HEKBt
 FBCdermIeqQnurznznQoo/o4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from [IPV6:2408:820c:b608:6660:20e9:11e4:d882:2911] (2408:820c:b608:6660:20e9:11e4:d882:2911)
	by smtp.migadu.com with ESMTPS id 8e5ec811f77e8d7d;
	Thu, 27 Aug 2026 07:07:04 +0000
X-Mizu-Trace-ID: 8e5ec811f77e8d7d
X-Migadu-Flow: FLOW_OUT
Message-ID: <01794194-4a01-4725-ab41-282b8ac93d1f@linux.dev>
Date: Thu, 27 Aug 2026 15:06:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: fix refcnt_tracker use-after-free on netns
 creation failure
To: Eric Dumazet <edumazet@google.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: netdev@vger.kernel.org,
 syzbot+d3f912a2e30e2079a512@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Kuniyuki Iwashima
 <kuniyu@google.com>, Jan Kara <jack@suse.cz>,
 Qiliang Yuan <realwujing@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260827052219.290380-1-jiayuan.chen@linux.dev>
 <CANn89iKK5jxVa34F7QMPjp5wormMQrZgoK4THJCqVp76Tw1NNA@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CANn89iKK5jxVa34F7QMPjp5wormMQrZgoK4THJCqVp76Tw1NNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 8/27/26 2:56 PM, Eric Dumazet 写道:
> On Thu, Aug 27, 2026 at 7:22 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>> The copy_net_ns() error path tears the net down via net_passive_dec(),
>> which only exits notrefcnt_tracker. refcnt_tracker is exited in
>> __put_net(), which this path never reaches, so it is left alive.
>>
>> Since ref_tracker_dir_init() started registering a debugfs file per
>> dir, that file must be dropped by ref_tracker_dir_exit(). The missing
>> exit leaves the file pointing at the freed net, so reading it walks
>> net->refcnt_tracker.lock and hits a use-after-free.
>>
>> The missing exit has been there all along, but before the debugfs file
>> refcnt_tracker was just an in-memory ledger and empty on this path, so
>> skipping it leaked nothing and did no harm. Only the commit below, which
>> gives every dir a debugfs file, turned it into a use-after-free, so
>> Fixes points there.
>>
>> Exit refcnt_tracker on the failure path.
>>
>> Fixes: 65b584f53611 ("ref_tracker: automatically register a file in debugfs for a ref_tracker_dir")
>> Reported-by: syzbot+d3f912a2e30e2079a512@syzkaller.appspotmail.com
> Missing `Closes:` tag makes analysis cumbersome.
>
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> ---
>>   net/core/net_namespace.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
>> index a91d2b58aadd..0c3f169d9afb 100644
>> --- a/net/core/net_namespace.c
>> +++ b/net/core/net_namespace.c
>> @@ -591,6 +591,10 @@ struct net *copy_net_ns(u64 flags,
>>                  key_remove_domain(net->key_domain);
>>   #endif
>>                  put_user_ns(user_ns);
>> +               /* setup_net() failure is not routed through __put_net(), so the
>> +                * refcnt_tracker (and its debugfs file) has to be released here.
>> +                */
>> +               ref_tracker_dir_exit(&net->refcnt_tracker);
>>                  net_passive_dec(net);
>>   dec_ucounts:
>>                  dec_net_namespaces(ucounts);
> I am a bit confused. I thought this was already discussed and fixed by
> Tetsuo Handa?
>
> f85dc137aabf ("net: add missing ref_tracker_dir_exit() to net_passive_dec()")
> should be fixing this?


Thanks Eric, now I find it it in net tree. I should anylyze it base net 
tree not net-next.

Please ignore my patch.


pw-bot:cr


>
> Tetsuo also followed up with 3220b62fbb8a  ("net: fix a resource leak
> in copy_net_ns() error handling path").
