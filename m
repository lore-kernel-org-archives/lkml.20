Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC542A80
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788087449; cv=none; b=dcwD02iLZ4/QaMH6axG2q7j+ri0a5OCvopigSOgPRd3NoRbm/CQdj9CSDV3Rg2DSvJLT+oD7V+V2cU++So9yrh627FsAjaDZ5pDS+G90IPMeHWBV4CSHKxhPhPRUIuay+r4ci31mzc8U+xG7nCaAqyOA31ttNKuCIIT23gseuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788087449; c=relaxed/simple;
	bh=bkAeoIUxDD23xuJAKW18VYgG5rJWRe6/UbJe1ZkA6Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EC86Pz3DeZAbRJPUoqqNCvAJq/0IXJfVhwIGk7WGg5LtP5hqwuhXB6ApI8B9bZH4FVmn9l1lCJ2ua/0dMRXb5WTeZIi9iojTuPIvB+atD9MWjdROgooJ082A9IFNt2fq/sMFx7rSOCT4A462iuRLPA4SbeKNLQbDzWuKalKdb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 67UAvOUU050876;
	Sun, 30 Aug 2026 19:57:24 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 67UAvOGs050865
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 30 Aug 2026 19:57:24 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <dc562ce9-8b69-42f4-9ede-57553832dba0@I-love.SAKURA.ne.jp>
Date: Sun, 30 Aug 2026 19:57:24 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: fix refcnt_tracker use-after-free on netns
 creation failure
To: Eric Dumazet <edumazet@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org,
        syzbot+d3f912a2e30e2079a512@syzkaller.appspotmail.com,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Kuniyuki Iwashima
 <kuniyu@google.com>, Jan Kara <jack@suse.cz>,
        Qiliang Yuan <realwujing@gmail.com>, Jeff Layton <jlayton@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20260827052219.290380-1-jiayuan.chen@linux.dev>
 <CANn89iKK5jxVa34F7QMPjp5wormMQrZgoK4THJCqVp76Tw1NNA@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CANn89iKK5jxVa34F7QMPjp5wormMQrZgoK4THJCqVp76Tw1NNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav112.rs.sakura.ne.jp

On 2026/08/27 15:56, Eric Dumazet wrote:
>> Fixes: 65b584f53611 ("ref_tracker: automatically register a file in debugfs for a ref_tracker_dir")
>> Reported-by: syzbot+d3f912a2e30e2079a512@syzkaller.appspotmail.com
> 
> Missing `Closes:` tag makes analysis cumbersome.

You can derive Closes: tag from the Reported-by: tag.

https://syzkaller.appspot.com/bug?extid=d3f912a2e30e2079a512

> I am a bit confused. I thought this was already discussed and fixed by
> Tetsuo Handa?
> 
> f85dc137aabf ("net: add missing ref_tracker_dir_exit() to net_passive_dec()")
> should be fixing this?

I made this patch based on sashiko's review.
But it turned out that syzbot was already reporting the same problem. ;-)

#syz fix: net: add missing ref_tracker_dir_exit() to net_passive_dec()
