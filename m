Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015343DEA4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588099; cv=pass; b=rIHwvByx4TkwJ+/+uoiD+CynB0dm0I9bnhngpGjM3G8eEr97iUf2eAozrc6UB721nawdv0AkGbeEdWaDEisRZ7X15VeJTtpNJoV4kqsLBNL8N67nSJMkNe3jDvX451Xn/FQf6GQjhKrNzz+WgM5VZI67HxVxdDrqIk8bQwILYdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588099; c=relaxed/simple;
	bh=E4adBSqv7HljmC3Q1/9aM/vf3Vd3WWU+Kc0SjB4vLi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZfp/jlEzNIOpMF+fcsCe0ZJ7JptU4P1yWbJoyROfWcZdYi3B3BSxOFo836kACwTUHyEzUMGo4xXUMwDya5aaVfwJs6DjXfrqsrtlDv00tPt+DsViCApCe2js7w8WvLIyGNY62W3HVwccEhGRu35lPZ/3UM3Y82wrEXl6J+ygU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=vSsYgtji; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="vSsYgtji"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-86382f10801so5342057b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588093; cv=none;
        d=google.com; s=arc-20260327;
        b=QCyLwNUrggyFOE1qBnI+3fPsPUyK2elKKhTfCGPSZhcYb2JLlEB9RZW+sJmk495k2U
         Db7huTwx5m4KTxD9Wji0QnI8twXjUBkMuBjJzYVRLX31Ke1/n78CzvL4zgedihzC05x7
         tFmUdmpI/209K/7SsNut6tMxXO0eTMOc06tMAyDpIcJg33I6V5Z/V6yPvaJsJF1VvMcM
         +pVIlGLlF6jPKVxYfkw3gnS5GSi9FX9mkl8TO+L6CNd1LXfvSIbDtT7BZsTuQAjNvtv8
         9vccnK98IwIYKeniqLtLip1wrSFYUx4J6iZnOjoIDC1bzWndMhlQDPSoU+hHq24N2Peg
         IP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tXRkNKeKLTM+T8LJe8DD381nxHo0BtKuwD8BY0W8RKc=;
        fh=SXWdUclTQrz+CDa6y7Dx9MmP3NOUPyE/8GWNyD2Ggcw=;
        b=ildA3aNmsh0Q/nQP/H8yZBC+KAwUxg9B8V4/ytIO5WMp7VanHxNAO34jT17dySwOeb
         8+rfo/XrIdPRC6U53bBe+wBKmBbtEvDpfNMB3vh2IX+OCE3banWXL4FFxfmpOGlEcdJh
         BBGTdU60ebhiFxugxyBWuqQPlUEdTSozCC/y/wCgbDuwe5CNKPM1uWuZJa0E/99ZIr7Y
         QBNn6j25mZBCpQIkZ/RyruKuE/E7/xVLYmdQBooXDceT8CyBy9KrZHPlDV+iEaAsJopA
         383QwyC2rtXzbItWuqfiB1vkRyrv0NDtVXNc8XuThGH9T93vK/N2HtEXNoJix6agSIUA
         6CRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789588093; x=1790192893; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXRkNKeKLTM+T8LJe8DD381nxHo0BtKuwD8BY0W8RKc=;
        b=vSsYgtjiUxJS3IqfZrBZ431EgAWxLzltLD9+XqXPb7aGr9F7Sk/hCqKpMnPbUfped8
         Vbh7CjzXhYV5E8jIDiDzvgKAbmszka8c4bEFnyA3nBSxkph4p7RWoFVtnz+9pGAP+sup
         MSl/t1sEDED1HIR5B6AuvsjoYzCprJxTpUVH0qqQgcDGvciU7fh67iBv8Scd+ENCat9J
         0gbjzVdLgZzF3XP2CtQaqWYNBJnTEYXOUZZyODqbcgn00TdSX7lL0zqVRZbQ7JlhrzY7
         25FE4Y8nrkIlKJUpiHNZ6Nl1Mz7FtseFq18SKFBsnOMsky+e6Lk3ulibuR+o9bf6ORi9
         zERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588093; x=1790192893;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tXRkNKeKLTM+T8LJe8DD381nxHo0BtKuwD8BY0W8RKc=;
        b=DF1BqjsiZl9NlOeQtdh+KY3Lk+I3rOxofb0hzz+/zMrby74ul+x6dYQzuivp76ICVA
         5Rw9o/r9XsO7jwZ6c8p6itTxSwdP91OnJjQ9qh05wQfy98HXpcMhoa4tiI5tzsFn64tQ
         Ua2HvwAQJPm5ZhmPCMV3qFhT+24Q2Yy5Y6QlVKhvEcxxphZIvmB1NBj8QFCISOxZifO8
         mJMS8GKxy3hUiGnzzoa0suhS5Il58ZnVBIpjkupSRuOTbQbxyimPgTHnFPmRdToEeONO
         sC7m9QRBjd/HyFTPvf1MWSNFuK/jIGTgZFU/ea3xdGfu1dnD2y/AIXbzQooikJs6M5Fm
         //+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZcHFqVSKuMGHwUR7RWdFG2/zGpNr1jm9Hj0+K+hslQ76xnntcO7vGsXnWKVVqLPjABDhos63wJgYb3ZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lAH3a+9rPBtqUtzZFaOBOiftOt2binCZo4K0VuYivF0C2FNXxx
	23MtW8MCUyKHk2HL4UoJtQxgF6nh+b6JaY9QcusXKzCEMPXVwDEqk0GbmBC4V8mDYHrKmXGLCHp
	Ra3rE0pNfFcPr/EHKOf3M4VjLGGv91p4fzvxDHtl3FwE=
X-Gm-Gg: AYBFou0+z72Cfkre43PsiTRcIOzcRfd121NhsKr7MunUreFAd4QE6aQ0PgICT1gnedv
	gh3o/fooo+0DR5J8mH++DUxADWsBCL9AN6V1varoMDG0CbbHhYaWzhZKUbOnrFBcrZ5XwQ2qCOr
	SikFzfjRQdcV9W2d09/+LGWaHgsLKncZ62bx+qX+Q4R8MqkqWu9osMByaHDiXR2pY4oqr5/1jH+
	cqEnryzXN25FJlJJ2l5y4C5zMHU4eLaGo/vCrKRuFoBm7LbWdBw7DNTVfmjh3M+zmdehIHNwtI5
	IO73u58FFjTkx7nWPvJoNiRwQt/r5oayz6weafeT+CQoAj/4kh+mJsHlyVusFZ9msC/yiEDymXm
	Ozmq3WtfdtbBMTyJ3LaIA/DyUYIW/vX4xeF6EHH84hL+4
X-Received: by 2002:a05:690c:60c1:b0:892:63a4:15d0 with SMTP id
 00721157ae682-89445e46c1dmr2084807b3.18.1789588092839; Wed, 16 Sep 2026
 12:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
In-Reply-To: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
From: Chris Roy <iam@thechris.in>
Date: Thu, 17 Sep 2026 01:18:00 +0530
X-Gm-Features: AcwNN1VYczLI3qfzeZAdglwAACuJwuh2m1nqLPTRyKkEDS7QJFj91KjCu4jH1Mo
Message-ID: <CAE2Bdm1nss=2F4rAFo8_AjZJ6XwBiVnCmfvaZmjBd7=ZYvouKQ@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 01:10, syzbot
<syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    654ae5d73c05 Merge tag 'drm-fixes-2026-09-05' of https://g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11860cf9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
> dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>
> Unfortunately, I don't have any reproducer for this issue yet.

I am investigating this report and working on reproducing the lockdep
cycle and identifying the root cause. I will follow up with findings
and a proposed fix shortly.

Regards,
- Chris

"But how could you live and have no story to tell?"
