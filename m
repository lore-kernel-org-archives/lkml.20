Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548084657C2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777742; cv=pass; b=jCZGsLltQ2leW8lLkx9qqI3sJSVvGbHt/MAA55PueoX3yHSMZKQCw9UPCHjgPuclMH7zydBzQDT3UXgiYjXQE4oFKhf+3ih96waPGKgRfTjz44qHmf9X9f9TTq7/xNuhrnG5dDM77SMfiEBUHISpcNjJUInCjrtMNb46r7vo1ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777742; c=relaxed/simple;
	bh=f6uuageFtgTVauYRTMUedjvidsXKNurZTEgeUWtBngA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbHjJPZ7fDi2jZ7dHLo2p6eGseXoBAYzWi5+eJaMHLIgNWjres/Jtwm2kQrSNf5pYE2hxYopfNtOg1q3vHuIIFW7nXzlGuMbdlSXn0qvI8n4YIw1FC5DXc9stNf0o2b/Cn0vtj8xo1zbzLOJ0F4W6AGcd7w/LhQ5t90EOwjo0oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzALZN88; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzALZN88"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3871174f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777736; cv=none;
        d=google.com; s=arc-20260327;
        b=L+qrHtN35M42Bt6rQCPFY2UaUvCSrLg+Ofz9UKNQ2E4GCKVZJlLDPrmBp7fwGbUE8g
         P+CTDiqtb7+1yJaBDVs1N9K43U1tFVcIrd5HGwD4dEUjv1/EO5UVx9bJ9Mg+S7Euxf0V
         2HH0/KwlX32epg7wOgNq/zbYHTMA6gE9OsScyC/VIo5qZJuMYs3u69EWVC/VBvstsQJR
         38yjyKcpMEPVuAxvHgiw0jKeuCwoBIz3DXeIx4fSurs43ZzlCqPOuyX0kvsTyHUs9hro
         N7cZVvz4atLba4GmDtzBJ2gx96sd2DrkiiMzhcvtlO34W4/J9im1N4916Cg8yc2ND7Av
         KRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CjvpUATnLwHb1hgeEYMoJ5n01Iwjh3JPhU2Cj9ZMiJk=;
        fh=GPF+7peRFU7pDJhOx1Om4iv5gCv4iqoY38gx0X6RWgE=;
        b=mrNe4vn8faQvaVKAA/IIYOb8VV9V8NBNAJqOZumsZvQ2r/j89trJ6UJEBSquxE8qKG
         d7kcI72AxmiXxWyMDihtzaRNeSNSyOMVEb6nkul4zWHg8GI6SOxxwjRC+2rrA9jHrGtX
         gtKhqYIiqEOHlUC0uFfaS+ZJkjcqQG6GiuByBg++GHnzP2wX/QVdqx1ccY/RUIuFext1
         IftqrSZn0ZEum7t+B4awR2PC312Uefw5b7o1/AWTg40QtNpLEjk9055b4S7eJ5bLwLGZ
         Ofgv2uYHvAymcr0vvNoxE4eQoizHGSqAZQ//Mr9CWSxoBum7BD4BwG4O1BuCsZBknu3B
         8q7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777736; x=1789382536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjvpUATnLwHb1hgeEYMoJ5n01Iwjh3JPhU2Cj9ZMiJk=;
        b=DzALZN88W886KAwT6LkUFVu8hivWMRTu4jAsOe726g36QieKm6LDFJJZV3Qm4dbTiS
         jZuLJbq406EPGJHgtz9F8DRtbtdr4lmd6PJr6x0/BeN0ImUIzA9iifCuN0Pw23c44vQ/
         i/zmgBah5ioDdX1M4j8gOLgstM5paF3FeQmARLHto/TbRX7p6OnUiQVdKBN6Vxo0ELHS
         ep6otuvDOSjZnRlDQbQ51YAQlOryUViXwgawmnydApSvDfdQQlk/so7wnjEtMmWerP93
         3IwBWWFNAvnzOkErl0WsoeNST0ScrtZr+iycz2ILRgdmUKDZtRm14VgD0EOtOHq4ABjG
         Djvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777736; x=1789382536;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CjvpUATnLwHb1hgeEYMoJ5n01Iwjh3JPhU2Cj9ZMiJk=;
        b=MEsUg0/a2e2DXwCZL/g1QhxNq4GYVEVXn55vJWhGZWME0zk0VLAd1Iou665K9HfiUe
         vieSWY7t1e8Vbe/MtP50IgVwVN0JQ7uoo2JGalSQDqenBZO+rPcHorMLzcr+LNofTStI
         AbmN+tKDVRC7zgzyQzjiggDiaLIqKgzaeZcPzZVwTIj+fYoc508ZsK/gQWEbZFRERHzt
         ZKKJK9giITTSt1FFzEI56KB9Epex4vAv4n8snaEhXRVCm0epyR/1eFF2JJr77gQp6Gje
         9t+nimvAvGrRpreebQNaYvXTZuYRGwC2aEFO6K56+JrQeijMYkpNI1pEqkjLTe6PuL/x
         ZDcg==
X-Forwarded-Encrypted: i=1; AKwUvBx94P3yjBSwM44d5VwbVkbomPl/F/n/TiSvfZdmW95ylBe6WdFLRnLcfF+IK6+Tp2FiKAtsijs3FVogHB8=@vger.kernel.org
X-Gm-Message-State: AFuF++nZNGto6hPIjBl1GBtd1pLsW8Djjt63KQPETaJDWYUN4Re5IeSG
	b3j9Tg2X7PSUYkWwh+0t0YdrBuEmo7FP1g8LuzYPzqrNtjVx3Rm/vhCIgxpX0buCXUqEwSTKMNM
	rdPk56GBraXg7FQ5lYqLPbvcYYBvhYdo=
X-Gm-Gg: AYBFou0ouZYpV0ygz+HZMY/1P1qPZxFETAAQU2YZsN1hHUVABfgHq7nzZZXTedTsvhs
	rOGZ516w8Zz2lbm3EIuttWX3nSDI0mcp84ZvjSKiyOLbLN1auJi1OIRUfvKGiYoxSjLCDphB/iB
	f51Q/8CcPm0BsW76MTWrEZXpq2uLsIYk8qJqyCOdeYxtXu9Osyd9sUfiDqfeoN7kI997lkzEn/l
	Q0Ufkos5got9TwUuRCQZIKYnfBmGomZq6pZq2oPfE5FGUpj8OEhHiFupzshWwce0Uix05HYvEhE
	yluWION4cBdTTtlGPPBpsw9WNZyUkJ2HcblVZLi7FBG7EA==
X-Received: by 2002:a05:6000:18a7:b0:485:a22b:afd8 with SMTP id
 ffacd0b85a97d-485a22bc562mr435104f8f.0.1788777735592; Mon, 07 Sep 2026
 03:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904144636.3443342-1-maoyixie.tju@gmail.com>
 <CANn89iJRG6UbnYX2xo1ZJR4k=Jr+PQEb48qELK9gpKp2QATKyg@mail.gmail.com> <CAJqdLrqGUQ2YFMAg197OrZaHrYg+-ZDkcA3c+wmZs39uxRz78A@mail.gmail.com>
In-Reply-To: <CAJqdLrqGUQ2YFMAg197OrZaHrYg+-ZDkcA3c+wmZs39uxRz78A@mail.gmail.com>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Mon, 7 Sep 2026 18:42:04 +0800
X-Gm-Features: AcwNN1Uh57V9ic9bDIkDeYFTiRJPzqADxE4QnNPIwzCzfdi_JQ-66Xoe1j-WyrE
Message-ID: <CAHPEe=F+3sA+o5+vtHHwnFsTqrQsqtsDWQd+H2RHnqd3DQ3amg@mail.gmail.com>
Subject: Re: [PATCH net] netlink: render SCM_CREDENTIALS pid in the receiver's
 pid namespace
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Eric Dumazet <edumazet@google.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, kuniyu@google.com, horms@kernel.org, brauner@kernel.org, 
	adobriyan@openvz.org, akpm@linux-foundation.org, leitao@debian.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Please drop this patch.

Sorry for the time this cost you both. I sent it without a selftest and
without a use case, and that was the wrong order.

Eric Dumazet wrote:
> Please include a dedicated selftest in tools/testing/selftests/net/
> exercising SO_PASSCRED / SCM_CREDENTIALS
> over netlink across PID namespaces to demonstrate the issue and
> validate the proposed changes.

I wrote it as tools/testing/selftests/net/netlink_scm_pidns.c and have
not posted it, since I am asking you to drop the patch. cross_pidns
fails on 66817a979426 and passes with the patch. reader_in_child_ns goes
the other way. It passes on 66817a979426 and fails with the patch
applied. With the patch, an unprivileged sender in the parent pid
namespace makes a NETLINK_USERSOCK reader in a child namespace see pid
0. No userspace sender can produce 0 today, since find_get_pid(0) is
NULL. That is why I am asking you to drop the patch.

Alexander Mikhalitsyn wrote:
> 1. We need to start from use-case here, because netlink sockets are
> quite special in many ways.

What I measured on an unpatched kernel is that a task with no
capabilities, after unshare(CLONE_NEWUSER) and unshare(CLONE_NEWPID),
chooses the number a NETLINK_USERSOCK reader in a sibling pid namespace
is told, by picking its own position in the namespace it created. I have
not found a program that reads that number on NETLINK_USERSOCK and acts
on it. avahi does on NETLINK_ROUTE, where it accepts a message only when
the pid is 0, and an unprivileged sender that shares its netns gets
-EPERM there.

Is the sender-chosen number worth changing at all?

Alexander Mikhalitsyn wrote:
> 2. If you start tracking struct pid (which is a good idea
> theoretically, if we ignore 1.), then we should do it a bit smarter
> and
>     make use pidfs API [pidfs_register_pid() function] like we do it
> in unix_maybe_add_creds() to make sure that we properly support
>     dead pidfds too.

With the patch dropped nothing in netlink stores a struct pid, so I have
not added pidfs_register_pid(). If the answer is yes, I will start from
your point 2.

I will not post again unless one of you says it is worth changing.

Thanks.
