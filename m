Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F43DAADC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140733; cv=pass; b=MHoHKuXv32k6b8AqpHT5GP/QCmBdJ6O5yhcuPGfqRCNiIpf6FzMLEDC5Kyyk6jjRPeZgaBU3rgrMgHvW69aB+vOpNaSFd8Bjw+Ix3VjsYB91GYlMkg/fE2sjVyuK95C5KeUGafD6k/fd1jo5wc1P6MBsqOuF73nj2NORcPBGQ8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140733; c=relaxed/simple;
	bh=Jo+bhSqK6mGk85cB2O91OylXX1j2JSTJECEb6foh0hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBXjNBWVajEA9cqed5wTZ5z4clcmV/O3oA3E8I9bcYuNgRzIgmuxPSbbdA6qf6/+z122hunuqjKugZJfXuLRdT5b8vxCKdPCwqPZ6h0UeDkNnGAUfJVYtrmfM1VL+DJO89H0SgxEEgakfeLaNW1KRJAk9gkY/KUcelmQ4vm1v1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IVOTdwA6; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IVOTdwA6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff3aca06so6775ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140727; cv=none;
        d=google.com; s=arc-20260327;
        b=stxZE2GBd6lq+3dFb5eKk0u5KePsiS97h7CQbQNNpcH3Tt39N9lyxuKxZm5U9MejH/
         f6z33fyw58VGGmGqOtIWgX7xeXE8JO3+pxa/S1SDYK2HRViFLFByZZhL+doNYgyDRvBJ
         qVziEyskjyQMpxeW+1dzRDZHry2Mxx88LgnQWwwcyf6Mhy6T0D2sV2TwwMI3FmkRsfsF
         NbeOffPQE3QnpwqaRX0BDbNQhx3ujENGH06dn9KYEdemxyhl8DbimLsls1c8FumyBpzu
         IFiCzRPoJBxx8xOUxmgqE2nbflrO5LGdLrvRfSU0fnU9r01+1aDmHS4bii+Hv4VxpCRn
         m7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jo+bhSqK6mGk85cB2O91OylXX1j2JSTJECEb6foh0hI=;
        fh=Qf566JYhAACfPL1y5FbwZQ9Le4k6w5a6JVTSF5ojTDg=;
        b=m87VRmwpZguKOTYr02gGliBNICS1PSc4Iotrcd4o+OV5qEVsYwPoWgVndjmXx6UxCb
         7QaMT4gqT0TEJwtW2os3Bl78uaQbfPM5dgXNSh2y0CDMY8hySOoPR2PcM4WPoSQ1nvMp
         sl42aNk0nm80tDoE1AbYkHKFa7ItHLqQj1Sz1MThhWI1bjKnisbtOuB2L17GYK2+5nJP
         Kt7qpp4nP0drQvtmdhg1EJAlYZnYS+scg4cypdtOeTh2B0goV8E0Ow5R3QJrTm96FxJE
         /gS5O+NgUR76HVtYDJ/ZK3dIwTuIbga12AH8mNAPhrjr2lvV0Q+rCk37bFea1HMAuR3F
         CYFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789140727; x=1789745527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jo+bhSqK6mGk85cB2O91OylXX1j2JSTJECEb6foh0hI=;
        b=IVOTdwA6M3ct1WeaUi5Fiz16rQ0O88d4S3VhsMV4n5xW0JsIOlo2q78Wf9J0wZ11bn
         1Ofp2lrrH3VBcYzYCPuBZbb59Yn7iTpFIapwFJIA58/mQpLbnkB49kAl1vYKQL1oYw3h
         rg2cSGSMycdmlMmwl2gXljIjhfwgVWu+om+1YEc/LbBXNGv1oNFNznMfqgaOKaTRbGra
         1MKcZpCLAlGo+l0VlWUF/IBpSVdxmXRVxuRb9YWgwS06uuF/5epDZ/5m1270aCmYQjkc
         tSH3t9OJzcAb18PpQSV3z9Kzwjl2MfIZe/JO0YzEl9TNpupUuhqjedW+UNfN5CfWQ8Aq
         Y/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140727; x=1789745527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jo+bhSqK6mGk85cB2O91OylXX1j2JSTJECEb6foh0hI=;
        b=COYOuuu+L/xcLSfzWbWxzdyuqAfMkzl4C8ZdgvGimHjb1Bu8U3JrxuB7Jnmj/SLz1d
         rlnJu1Sh4CwOc4nOagitpRcRGWZAx78fGVZ8zWr9InoII5H+wzouWcDk0E9X7gU/pPs3
         zChVGRcz+VZ4PtsOnJrN5321DeDFHwW4QLE0fCZObzErX7tttrLhHx/DUffdZiC77FmV
         rWrFsiQf1scFiMhXElhB95LbRTPyRHzWWSkjhCgl84xPuL49CkdsMFDY3Cxh8s0cZzoG
         6vD7rHjpbYFUOU3zv3BsIRiO2+9m9cKwgo2cNbeCJ+VZ7irjIK2u2417UdMkLcIQqBzs
         3o9A==
X-Forwarded-Encrypted: i=1; AKwUvBz8YQx7VKVRlGqeLwMXdiljobpR/EZznSdnf/9TqL/W70x7AQ74Vi8sDpK6EUHFhk8kZEli0ZREYLYZE/w=@vger.kernel.org
X-Gm-Message-State: AFuF++maJ6rQspTmQmmeEQjV5jrg9kHJZ+zyTGtNrM8mvZL/Qa6YSWFN
	UcJ5EbOxFIP3eAtClqUWFnZtTGLrIraDZPO5NG323LrfjDPNsLUn8j1MgqxRc6Q9n5jUFOPaW8N
	vXXpjeCr80Uixl9LRlyZdHGHkw7ixJSlxMX0gVgE4
X-Gm-Gg: AYBFou37FSenwK9/KY4hku3GZoXPVsIMN6npGAE/9ciw63x9l/q5JuPlqFU4CBM+flm
	Hz3ZtlovKPZlXXaZk84iNBR23ebji9DimaApmeXu9XWOk10BtHk/8oS0+YlwGcTlkV10wO2Noio
	uwsfGgluyPjUPYyCJcOeMBmLUsjG5jOgenQyYooDTgz1mktSK8NQCG1gAUjkisuPCdWD/pwdrit
	jKp2m8O2g0WsIrQL9/NgEGvt4HoylaOE2ahJS9bwD3BzoJRNoc8swisUd+eef50rr9cK66b6QjH
	+OSk3cj/QK72SD4StBO6y8xXSxY0ep2h5aoM6RhpjGJ9oS7IUYPeTmHkUV4xWSJFJytKwEntu7c
	9p0Ox8aTaMWqGEuZ23E6enOt21dnCLZK3u9xjk5LwKzg=
X-Received: by 2002:a17:902:d2c8:b0:2d5:db38:800f with SMTP id
 d9443c01a7336-2dd2ce1d5f3mr6245075ad.14.1789140726833; Fri, 11 Sep 2026
 08:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260911083639.GX776954@noisy.programming.kicks-ass.net>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:31:29 +0200
X-Gm-Features: AcwNN1X5QJK5xCJ9ymuHdJf_f1sobutrJF0doN5uEEjSSosujEZhtUeTzrePbbw
Message-ID: <CAG48ez3BCZi-wEi3HAtPhTmiRxfUuk4y97NquPjz0FBrnyfD_g@mail.gmail.com>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:36=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> On Thu, Sep 10, 2026 at 05:27:54PM +0200, Jann Horn wrote:
> What's with the markdown tags? The email is text/plain, so plain it
> should be.

I like having clear delimiters around code blocks in the middle of
text, I feel it can otherwise be annoying to scan for where cited code
ends. I used to put <<< and >>> around them in the past, but that was
kinda weird and ~nobody else uses that syntax...

> > Then race like this (view this in monospace):
>
> What a crazy ass world we live in that this has to be stated :-( Of
> course you should view text/plain in monospace, anything else would be
> absolutely insane. (And yes, I know outlook exists, but people using
> that deserve all the pain that piece of shit gets them.)

(As another example, my employer's webmailer is also not particularly
polished when it comes to text/plain mails.)
