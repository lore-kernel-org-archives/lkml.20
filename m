Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0B3EFFA8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377668; cv=none; b=bsZGzCrCF7MA6jbsSFaI0QYGr9bdvlF/iLkOmGgQanF7p9YZRobffkU2dmSTzBbrpRO3k73DXB+FQOjpMx3d8KKMEPWoeFJttSXN7LUIzP3HkCV6XNo4Up6wWowKSfZlEWRRzeD/Za3QCDk439D3IQCiDG4CU0qXnIb00UXJBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377668; c=relaxed/simple;
	bh=r1CAfmiU8q5/a19Jw++myWXMIwnZ/J4pXbC2ndm0wT4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UgWjjxaJgLhZD7F+hVit4FIW0NyStMfAxmHh48LO+X8K3qvKvdT8KdAHy+i0vNVYQS+VaFk5YmcapH+6OogOO4U6XsFk9YbjSfPxzzfO/+RQW9RkONFFJYgeCLqPMldkI3nuQP/GD5FVfZz6GXGX9f0LIqSh97y92CENrDdgpgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4dd46ddeso1900091b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377666; x=1789982466;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9lU1rc0z5bYZQILrctaf7TJuUIeJVSXSTV5cagZ8GKo=;
        b=W1j2P+cNUyZiRfTkDAGWagqGKc9SgxgEIbZqtawT4VV6xE3gFHDrs1bJxdqPjlfhFC
         2zyqzh8zIPnho550sF1Ysi4mczTWRQgyjLZvfojoKkpl1dlYLzInqZ9ewItUj2kNIP5a
         aH/dIMlq0xHoostLvPh5D/zdRqWivVuMsG8HYO5CpXtU1eP11H9WPsfLRiFkQJL5YBsY
         hLIdu5UzgtczfSThJG9u1cwe8Vbrwz9fboKmPvWatUTbe7XqB6T+KyRONzk58cdW/an/
         yB12UACPJw8flKJfzDEzgivLSO4nv4B3fZYh0TP4sCGPzU4Fd5L+haAgdbvHy3bD/ZJT
         40Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxVudPsZwguNi451aPmSQgkfFazThbP3cte5nLuS9fmoeld/huCWcUiQ71uCLm7e+D/8JJIgLB7Igzjyns=@vger.kernel.org
X-Gm-Message-State: AFuF++lpNB6CfdSe3gh6tfYsdyFuh6CS5xn9jo69uJyDgUXVnNEUbvkB
	y1fvF6kZIW2XrmWR37NKvmEJuo+66S9rXX8m1G808UaPnaWzfymSd0Mm2kpEae57JnZomh5kOaz
	MwoGnU9UQQO2UevaTIKqXB5UBTv8MEmRVqERzBx8j9W0F/jCS/czaY2/Pli8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178c:b0:4b9:e5fa:8a12 with SMTP id
 5614622812f47-4c7b539de2amr1053141b6e.23.1789377666302; Mon, 14 Sep 2026
 02:21:06 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:21:06 -0700
In-Reply-To: <aqe8ccFpy2d06cdT@user>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7bc82.f81106d8.2ab401.0049.GAE@google.com>
Subject: Re: [syzbot] [fs?] general protection fault in configfs_depend_item_unlocked
From: syzbot <syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com>
To: pavankumaryalagada@gmail.com
Cc: pavankumaryalagada@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cba2348ab114

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
> index eda80c2a2d38..301a64f41887 100644
> --- a/fs/configfs/dir.c
> +++ b/fs/configfs/dir.c
> @@ -1244,6 +1244,9 @@ int configfs_depend_item_unlocked(struct configfs_subsystem *caller_subsys,
>                 return -EINVAL;
>  
>         parent = target->ci_group;
> +       if (!parent)
> +               return -ENOENT;
> +
>         /*
>          * This may happen when someone is trying to depend root
>          * directory of some subsystem
>
>
