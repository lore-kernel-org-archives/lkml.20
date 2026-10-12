Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005B3EC830
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818867; cv=none; b=hu0SWYxN88lnVgtILE9l6o49Pu4KcDuHsWMWX0xtn0AyA/lSRcz0D22L7HfWLcl68jrw5IkHnSd7tBJ1rnrieVl5QsRHp14Nj5yTKbnkDPvrrGx1GH7LZpcmH3ry5LVsC9SmdlJiLLnzJ0h3UwPOReKZ/nWx0tJJapBBpCwbukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818867; c=relaxed/simple;
	bh=dX4rbpprX90+eWYhsSdxG19QxhQNkA/LRdgVXs+idbs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=OlOx6bLLhtQBi1luZ3fecNwfevZxw4GLEzI5QLPgwUDMRESGKJcQgRL7RtiqAh+7nJoang98aJkJ3k00HMIGTpe8Di9qEWo1nwFAyoBRwRsCMPp0s1Kw/bieA1Ff1FqJt+drurf/dG9Bspl7OxVYc2qv7ik/46/z9K/fGf9fVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8242e72d404so3977640a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818865; x=1792423665;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dX4rbpprX90+eWYhsSdxG19QxhQNkA/LRdgVXs+idbs=;
        b=KdgPxHRauFIic7w4tU3Mj6lbk4vW/bdO84AuR+AI1N7BUXju+TU++JSK/8TDHPE0+a
         QAfwl86OfEPYs94qQUGDGnGET+m0hEGyTj4rLBPoAiAsYpygQozyrUFcA3/qtF66p/wu
         7E98VuKt+kenqXo9/4nmR0+RO1MpomYrP0+In6wfsBh8g1eIT0LlaC3UTSnt4RrFe18n
         IdZm3Xvztc5iHWvkB63r0nvh3CQt2+vrKvLmXWqzqLjekT+uI9MClqbfKKU60RlC0lDq
         6rXIEPmMN4Wqjrl1a+br8NfpvFu5/McckBfyYXs8MODlbXyWIIC4E0fFr9flx0V+RsBr
         lnJA==
X-Forwarded-Encrypted: i=1; AKwUvBwU+WwNnAaQWffs2HKQmXcqnJjiShC6WQu7Gh9j0ury+O01Q9Y2qt27huWNS7eaQSgwspi9bwmP1zv091g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzrKktMF4tYQO/hPLTlbwBtGTdGC81chTQ81BS8/df38cBAw0C
	esACdTv8EUFZjxTsNFg/kt4Nc0c50TYNYRu94xz9ZByzumZZmIWknpR1yPkaj6gUSURLZuqsICs
	WhclcKJ1K7IPpK7ex/etb58ZANYJn0AN3Th4MUDtaIX2zG7c3Kp9Cv7a5mHQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1923:b0:4c3:95d:91f1 with SMTP id
 5614622812f47-50c408514d4mr10426828b6e.1.1791818865653; Mon, 12 Oct 2026
 08:27:45 -0700 (PDT)
Date: Mon, 12 Oct 2026 08:27:45 -0700
In-Reply-To: <CAEfrx+Aqwnw24za-2dro-3nUmbUsnsSkqA614NTPSqHVsm3gZA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accfc71.a150a118.27e199.004c.GAE@google.com>
Subject: Re: #syz test
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: spannme41@gmail.com
Cc: spannme41@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> master

Command #1:
"" does not look like a valid git branch or commit.

