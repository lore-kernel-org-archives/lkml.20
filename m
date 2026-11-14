Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660388;
	b=RnJeurzECRnKtLba4S9v5egF2H46nV5EzzFVgA7yI+ctW/0hYAdYuwk9t6I9WoymY6H+
	 8q2Y5o+NR0PrDO7kI2wIxP8RoGDWL4+Xjpv+j+DDenyCOQ1lDkcK4XjOjVW6ZS65WIABv
	 1hIMJsEbonqJ012W2XyhUgAeJ2qIWC3XUVtUXUl76zefXYOFa+adk7E9o0EcOebYOUp/m
	 8lDvmdb8NaCQVWNxpTJ4iRpdhiFCs7rZfgZcC43Yb+6oBMOZ3K/9bIZ7ZSN/hbBp5V5x/
	 WJcbxfjpndMt5hczAt+bXQ4J254qxsIBe6U9L3hEf48vToySMYgtAlEeTBkhjpHQe+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660388;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oOKtCC0W0gO7IMrYBFrSiD12fao9iZIz/DwTRgit5lU=;
	b=xv9c2DICljCKNUdI+JMxG2ZzHzXs8LWG6XbP43YxMgQHJJXbh4Xjh9gyzkmos7YQzxOD
	 hTPe8DKl/VD5/9u7Jjz4o+eIkVvUL3ahEQ4Z918vA6eC1Q5xTnqeHWDlRNnSe4t58SCSd
	 ErtVfuuDje9O3AadUAvKp7a5Sw14UB4ZawvhP+dD3mcns6dS5A5QkRdWeJiyDK5WEdTvb
	 OV8ukYoIIT02kb8aJhSeXWu4EqKpWrNQy7H3l1XMLFKGhtcl7J3dhd1p5O1CxsVitozBs
	 ORz0wz65UPCHnC61EzsnXzR5Q7/rihhYkbNkFe2V35nMw96NtwkLkbb9RRkpFQpUuPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d3a31SVq;
	arc=none smtp.remote-ip=91.218.175.205
Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32DC606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d3a31SVq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DdskCH6eDaklswLI55DtvocSJyiL0/8viQKGZS0qKKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794660386; v=1; x=1795265186;
 b=d3a31SVqOhhphrXAxoxoNw7QraNOu+sgTd+KaJIqH0rJdr3beIYxUD/7gcMGuFjq26SHv90H
 /VT5NsjiEGcd03/QvG4IsevEJvi17wSy7bWncRmukrMBiIVDNHI4T8d0At42Y2C3uJVVbhAU1fO
 X7FSrBOLA/DxXBJ2R8zg1nB0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 535fc215b9da697f;
	Sat, 14 Nov 2026 12:46:26 +0000
X-Mizu-Trace-ID: 535fc215b9da697f
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 12:46:21 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>, Paul Moore <paul@paul-moore.com>
CC: Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com,
 syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_cred=3A_annotate_data_?=
 =?US-ASCII?Q?race_on_non=5Frcu_when_copying_a_cred?=
In-Reply-To: <20261114052900.7-1-bbnpreetsingh@gmail.com>
References: <20261114052900.7-1-bbnpreetsingh@gmail.com>
Message-ID: <C6B4E129-0F5D-454C-91EA-7CE97070ABD8@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 14 November 2026 05:29:00 GMT, Babanpreet Singh
<bbnpreetsingh@gmail.com> wrote:
>prepare_creds() copies the current cred while another task can be in
>get_cred() on it, clearing non_rcu. KCSAN reports:
>
>  BUG: KCSAN: data-race in io_prep_async_work / prepare_creds
>
>  write to 0xffff8881046cea68 of 4 bytes by task 3646 on cpu 1:
>   get_cred_many include/linux/cred.h:222 [inline]
>   get_cred include/linux/cred.h:238 [inline]
>   io_prep_async_work+0x9b/0x3c0 io_uring/io_uring.c:367
>
>  read to 0xffff8881046ce9c0 of 184 bytes by task 3645 on cpu 0:
>   prepare_creds+0x71/0x550 kernel/cred.c:192
>
>The race is harmless. non_rcu and usage are the only fields that change
>on a published cred, and both are reset on the new cred right after the
>copy.
>
>Annotate the copy with data_race(). prepare_kernel_cred() makes the
>same copy, so annotate it too and switch it to memcpy() to match.

Yes yes, good now.

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>
>Reported-by: syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=ee58b040032d8bed63d9
>Reported-by: syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=557fdc985d6ac3831e14
>Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
>---
>Drafted with Claude, an LLM coding assistant, from the syzbot reports.
>
> kernel/cred.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/cred.c b/kernel/cred.c
>index d01df40a9a386..d9ab1cb4230a8 100644
>--- a/kernel/cred.c
>+++ b/kernel/cred.c
>@@ -189,7 +189,12 @@ struct cred *prepare_creds(void)
> 	kdebug("prepare_creds() alloc %p", new);
> 
> 	old = task->cred;
>-	memcpy(new, old, sizeof(struct cred));
>+	/*
>+	 * Another task can be in get_cred() on the old cred, clearing
>+	 * non_rcu. That and usage are the only fields that change on a
>+	 * published cred, and both are set fresh below.
>+	 */
>+	data_race(memcpy(new, old, sizeof(struct cred)));
> 
> 	new->non_rcu = 0;
> 	atomic_long_set(&new->usage, 1);
>@@ -573,7 +578,8 @@ struct cred *prepare_kernel_cred(struct task_struct *daemon)
> 
> 	old = get_task_cred(daemon);
> 
>-	*new = *old;
>+	/* Same race as in prepare_creds(). */
>+	data_race(memcpy(new, old, sizeof(struct cred)));
> 	new->non_rcu = 0;
> 	atomic_long_set(&new->usage, 1);
> 	get_uid(new->user);
>
>base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>

--- Thanks!
