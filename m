Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821334;
	b=jmuapWVaIDQCLsFhp23QlEjHlUdMriDvkwmF2VEz1ll+bd/E+hWkio+Z3ejDeI39kCsb
	 HHp799v5oZeIGaUkTWbrYl1nwapS1dTGWCrb3ip7l5Sm57xW/ZK94wh7r7nQiFQPgIIrV
	 P3gApX7/ehKX0194IU9SlRntPGWYqRcsqEmoZjzxiZxApjJF0xROo1jd+fmUybaZLxpf+
	 aj7EKo/v3m0gWOEsilh4tBVmi/vMNEtxUOz7tFsY/i4Kn+loyBJ1q7i0BfRPqeYYvOozk
	 0IpgUA73jCQLHzoMwvDGi/EQycQ8GRS/nrXkele5yOlgypVkZg3WvAa7Dm/nHpgiEqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821334;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=p2ZeKioSe/Adrk9i3EN7KoM827dhiokUFkL472Mn7nM=;
	b=j+RM+8iiW12cNJVYCb5zU79uRKkQc8zfxLH/P3mS0vDdMapQbUiUaKIti/O6ZkjqrPAJ
	 vdtMjf3cPVLOI749oYHYNGeNA5h4OBuZDP8HNH3AoTIguivOQUH6soxytvdSkr284jZF4
	 VSO5E7zvcj6Ijqjz1aKxbWtOQ7q5CbRMxyfqKl79WE/7awWcwS4aqdW/muAxneI1mHKr+
	 zNzpyamukRfNZcIJigw7RudeBjpEaYkSixIIiM9n5dLRBZAW+wBBVKCqDiUcUUZ/rvecO
	 JIaGuUOT4LmGzdPyjFLPjml6U+XHFGrQDUMBFejSC/JK7vW1CEzx8IT9H7upWWj+9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fL8NClJO;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0801606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0801606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fL8NClJO
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794821325; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=p2ZeKioSe/Adrk9i3EN7KoM827dhiokUFkL472Mn7nM=;
	b=fL8NClJOChHxZERI48JpZaNBgoFla2UsBH2m5z79gq7L8wdI7cVuYYcWHMN5W6f3vIHc8BD7Ay/iaytQeHZ2ffnFbsllVR4T667/Kd+swjFOcdNEgj1IQ1qE/15Q5rW7mFn33DS9YMkwnsu3KdsJMxatCyildHv6eEdKvRzmsFQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XEqDSLX_1794821324;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XEqDSLX_1794821324 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Nov 2026 17:28:44 +0800
Date: Mon, 16 Nov 2026 17:28:43 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/sys_info: avoid showing locks info twice in
 __sys_info
Message-ID: <avrMyzFXGtyU96TN@U-2FWC9VHC-2323.local>
References: <20261113151451.72419-1-leon.hwang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113151451.72419-1-leon.hwang@linux.dev>

On Fri, Nov 13, 2026 at 11:14:51PM +0800, Leon Hwang wrote:
> In __sys_info(), if the si_mask has both SYS_INFO_TASKS and SYS_INFO_LOCKS,
> the locks info will be printed twice: debug_show_all_locks() is also
> called inner show_state().
> 
> Since commit
> 8b2b9b4f6f4f ("hung_task: add hung_task_sys_info sysctl to dump sys info on task-hung"),
> hung_task will print locks info twice when
> sysctl -w kernel.hung_task_sys_info="tasks,locks".
> 
> [ 4658.894440]
>                Showing all locks held in the system:
> [ 4658.894445] locks held by khungtaskd/119: 1, last CPU#7:
> [ 4658.894449]  #0: ffffffff9159cd00 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3b/0x1f0
> [ 4658.894468] locks held by cat/674: 1, on CPU#8:
> [ 4658.894472]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
> [ 4658.894487] locks held by cat/676: 1, on CPU#8:
> [ 4658.894490]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
> [ 4658.894504] locks held by dmesg/677: 5, last CPU#8:
> [ 4658.894507]  #0: ff426e3f828ee0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x34/0x40
> [ 4658.894521]  #1: ff426e3f828ee128 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write.isra.0+0xaa/0x360
> [ 4658.894535]  #2: ff426e3f828ee2c8 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9d/0x4c0
> [ 4658.894549]  #3: ff4fe07e82c57370 (&ldata->output_lock){+.+.}-{4:4}, at: remove_wait_queue+0x1b/0x60
> [ 4658.894563]  #4: ffffffff927b1278 (&port_lock_key){-.-.}-{3:3}, at: uart_write_room+0x4e/0x230
> 
> [ 4658.894581] =============================================
> 
> [ 4658.894583]
>                Showing all locks held in the system:
> [ 4658.894586] locks held by khungtaskd/119: 1, last CPU#7:
> [ 4658.894589]  #0: ffffffff9159cd00 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3b/0x1f0
> [ 4658.894604] locks held by cat/674: 1, on CPU#8:
> [ 4658.894607]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
> [ 4658.894622] locks held by cat/676: 1, on CPU#8:
> [ 4658.894625]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
> [ 4658.894639] locks held by dmesg/677: 5, last CPU#8:
> [ 4658.894642]  #0: ff426e3f828ee0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x34/0x40
> [ 4658.894655]  #1: ff426e3f828ee128 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write.isra.0+0xaa/0x360
> [ 4658.894669]  #2: ff426e3f828ee2c8 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9d/0x4c0
> [ 4658.894683]  #3: ff4fe07e82c57370 (&ldata->output_lock){+.+.}-{4:4}, at: n_tty_write+0x190/0x4c0
> [ 4658.894697]  #4: ffffffff927b1278 (&port_lock_key){-.-.}-{3:3}, at: uart_write_room+0x4e/0x230
> 
> [ 4658.894713] =============================================
> 
> To avoid showing locks info again, check '!(si_mask & SYS_INFO_TASKS)'
> when checking 'si_mask & SYS_INFO_LOCKS' in __sys_info().
 
Thanks for the fix!

Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
