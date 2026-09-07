Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D074071E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764766; cv=pass; b=SMmiGCIoJotttCZ5ZR5Q1GOT8UCYTVvggqWN8CyEkWHPKTWIiT+DI1nGV4VZ+zRpoDEWSSKY0+4/2BHokeRZnMMio5zbrLFJGBtbcUGElrZ259dlF1tRCf8pYPkK13eemD3GTeEq+Wz7Ch54nk7G8tYa5o5teoTcmPhNwsO1Hr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764766; c=relaxed/simple;
	bh=J/iKiNhcMgi580dPsKQsRdnOhMrWs8rCz30Zn7cW2ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdFmQELa46ObKddIZBj9FRqg9iddVXRl4gU9/aJALx+ZlRZsqLiFDlPzwDDVtXO9KiVE0xMg7cBKOdCdd3m3r7rl6p7nMc4aEfss5H/v5YrzQkM7iCcE74KeRJgYGSf8tZcj6d9GRzNtYEXSmOjpWLN5kew0Hubzcj9rWXEAtR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbKLwyC/; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbKLwyC/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90cc107c451so19965596d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788764763; cv=none;
        d=google.com; s=arc-20260327;
        b=OCgK9mH/eKaDv9e9OA3ncdI7Hvo6aoZvvSoFRfeFdrs8ss32/ENtW5HyJ1NwtJTAPi
         PJDUYFv2bKJLzf1DBBWXHKScfwtftiBwOV9UZB0UK+IU4ezwBf1a5uxZSRgN2liubd1Z
         HDGxKV0LTk+8lGUYoMQThBWfcRMfvdpjDf7dZtvl4IhOMBGACeThCgtx3sWis5mD4wNA
         7jP39Cev9BcwqzLbAJoPHEKr/6SajizifZAgwpZJ6RRz3drAlKBvjfjDFLykP7PRshyJ
         sJGgQutqh5AyaQ9gNWyR9vQRAgWb/LbYP+nc0mWhIt0oY5M5secKcG9K9qOXpFIyobG1
         8aJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IzBhMBKiowEdTe+IMHog+Eg52EGA4098JFXUESCuu4Q=;
        fh=E8LtWGNxIOTx1RqQnb1tQvSOVBrGpJPwyHAuBPcMAzE=;
        b=eRwgDouKxIMo5JDkYSDKNUriHR4Eg0LceHHC320it5TMp8qPazghWup9a2ovXCGgLY
         Iodcswpti+vznY6vLxVQ3DXcWEItI+c1CWRFQ/VZ3/o5aYUohOMxuTzc3jKBFvJDEP7s
         oVW3uFKopKoUiM5dmt8VlAdd64r5ZWT/hgCvo9J+l8aqln+YLdBzHjGozGtMjXsFLnG/
         g59KD87frJIslj2ubv9FDtso/4ak62mvVt1p9qL3UAj34qTxiv+4F73LEeD9eqclAQXH
         RrOb3Of8WrZeGr1qGU+fx9yXzRFGhOM9oU8UR+rz6ZonzDuNEmvfC+f+r+uNNCFYOj6H
         rB1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788764763; x=1789369563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzBhMBKiowEdTe+IMHog+Eg52EGA4098JFXUESCuu4Q=;
        b=JbKLwyC/SxY/a6j5XV0CQxBYNRA5SaIrYzjN4sqmd9EUo0dSSVSnviGZf8SO8nuc3n
         QXO+/i+pEGzCxbnWtWgTxPaOBuHUOiY7dejIqMMfgIkzBG8ulW2nOXgdPw0cl0hKpdiv
         8XkiGKmuRnQvQ1ZWHYZ45Z79swxEaDQAn29Q+LTQv4byVvnKYO+Lyp803klt8lWWlFxy
         C4u2THJGYUPtSXbkrTAhpguTd8JQMpjUBKkiWZpdVi/h6Vuqy7KdEWMeQ5vAjTDT47IV
         tAAcC/vsyPe8V2+fr84WHEB5FoAs9/ZRIeGwtsRb78CYOlAt4I5o2iXyCXTl7RL0C9Gh
         tM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764763; x=1789369563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IzBhMBKiowEdTe+IMHog+Eg52EGA4098JFXUESCuu4Q=;
        b=k9PDLvArEsXRSofUF/AVUi66+E6avJRSPZ72N45Fd0KI+ksMQO4X9EbAHbunllWLF+
         oSwdpxwvQynpJO/Qnt33VmxBc7NsY4rhHPlypdGH62ElB6OK/5cu6LqoEmjxoa5NNJfA
         z3MGDxiSSbFeSXKpfwYoUTvzXTurzaAe77V6aAG4SZe55SG6nPRxLOkv9Mg6fDVGhK/t
         nAq2HxZ6opxGybs1zNrMkDIwDLzrM0x9kb4lxMCOJYIGxQJg8vfFr5NYUP0SRk3gpMHp
         yNIr/mZVI8e3/V0PVFROlCyNNO8vhQcS7t3LrwFfte9EygtjKyPv+9YSd9hooV37Ikvd
         MUDw==
X-Forwarded-Encrypted: i=1; AKwUvBxxfoZX+Bth8bNpBBlTuW010ZBHFp4kgy/LGHV6dR7bVSYw8m8u3d7EW8AbyGZq7GsX2115mBfYRtTDG14=@vger.kernel.org
X-Gm-Message-State: AFuF++kTdM/JY33eRxzb3IKNmO9t+7D1wtF5zNQbCALsBDMVAf4TukW6
	yNaWrgtxNGxIqsMSS/FueZS5HTnl7qNKrxNUM+dV3W8o7Mjg+IArVDVz0z03bq701re+idRrT86
	mPgXpuOl7q1hxYRbpfyx/YJ3xyvH7tCl5dWxpaL0F
X-Gm-Gg: AYBFou0SHLkgWTh+645fkSjQpdBnVpzYVhbDd2PtT+e9TxH3RGomYHKXww11oqIDr8f
	7sTYnj1hj9Jw3kiKfMsZMJzEUeFPBy9xcfasszGozIA9eWYf9zqMTUUcTZDYEQzZkB//towGV18
	V13N3/nAvRRNnQt9D5EDnft5I/WOGCAlxeiMjlulH0rDF24ZY1YsQ+jiBjDtGm1gv/y3/KBrJ+5
	AbGk4/mRceCY8hhANlVDilmmf9QxNqAaa5/5PorbsqeITawV4UAVzQ34pjBpxbn4l6mrV4lxrW4
	eFeeLPGLSDHigerRiQu5zYqkupihZPbjaTypLuJ/OHma0Sp+W0oQZE/PzLPTWrpkRBCkMRTBK9a
	XNvrTgz8X6ju+1G/XbzjQatSO2C7K+phehkGj4acyAF8jp9S7QRnYxml0ew==
X-Received: by 2002:a05:620a:649c:b0:937:1b8d:e3da with SMTP id
 af79cd13be357-9398053955bmr2321525285a.42.1788764762921; Mon, 07 Sep 2026
 00:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cdc628415cf10721480a51ce14837f846ec778c2.1788248601.git.zihanx@nebusec.ai>
 <178875495405.219967.5594821749566554418@kernel.org> <CAANe3eRBOQud=bMgLnPbD_yUYUkJtT=GBqtY+GR0ZtU0_kbzhg@mail.gmail.com>
In-Reply-To: <CAANe3eRBOQud=bMgLnPbD_yUYUkJtT=GBqtY+GR0ZtU0_kbzhg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Sep 2026 09:05:51 +0200
X-Gm-Features: AcwNN1WeOqUEs6cInW9RchAY2pakJxhz5cPcUgFjFoO3v5x7dYx5vG4SQCc85dA
Message-ID: <CANn89iLn+Xi9cEphy3nR4bGnFCownrWa9rTZ=AnijArDFo2O7Q@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: diag: bound bucket lock hold in tcp_diag_dump()
To: zihan xi <zihanx@nebusec.ai>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mptcp@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	kuniyu@google.com, matttbe@kernel.org, martineau@kernel.org, 
	geliang@kernel.org, gnault@redhat.com, fw@strlen.de, stable@vger.kernel.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"

> - bind cursor UAF / dangling tb2: valid
> - unconditional sock_hold() on unpublished TIME_WAIT: valid
> - clearing s_num on cursor mismatch: valid
> - lockless cursor-membership checks: valid as a concern
> - commit message overstating bind/ehash fill-under-lock: valid
> - missing note that MPTCP needs the follow-up patch: valid as a
>   backport note
> - endless re-scan of the same bucket head: not valid as a
>   guaranteed livelock; duplicate output after a rejected cursor
>   is valid

I just saw your patch today. This is absolutely insane.

Please limit the complexity of a filter to something reasonable.
Absolutely no sane user is using a very complex filter.

Same for UDP.
