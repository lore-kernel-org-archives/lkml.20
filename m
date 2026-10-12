Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414249E5CB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823170; cv=none; b=ndd7XOMPEnjeWOaZUu65oxxTApXFAXIEt0TxU2aHPhFWX5KaLat+iSKw1w5yRx5cX4rKTfRyHKJGYaBwCwMG3JbhSGJcy5174Vw8wpunJ9eSwU7O5jEQS/BAGk6Mm+Uz28bXNjMNXeHLFZf1FNrMWhzNNcqP0Eqj+PJvSg7tumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823170; c=relaxed/simple;
	bh=eXnZM5kgyPST6VT7XZ4FKHLpZa5g5KnlmQF1fa3deDk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=eUnRiR0BDCuupLmHKiP/wfquJNPzDXydJBboLrZ/FH0Rw+GLnKuacwmnthjCrO9oNz4pQvDsrjLqrviEqH2UNjedWyaquJSDZu7tJcMT0Z/8gLIaItd03lgeDkCgdd+fURWumQrCAPo5Kl/y3H1RKsZ/Vu896Oc+MbUXqiX0GAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4eb0b989f0eso3655144b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823168; x=1792427968;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eXnZM5kgyPST6VT7XZ4FKHLpZa5g5KnlmQF1fa3deDk=;
        b=h6T7nv8tAUGD4BiVhE5S87KtG+jEU8vp/vdkPbdbY4M+F5aW8w0cz1NhPh2uoUNcyD
         n8YBYw1J3OKh1QF134ING+aTCGAb3/x8LI7dbyuqXkZ4rYtQT/ebkjIrbzLP45Sy/Kz+
         KwUQG79tyrEl92LIUf7Xh+Lgucj4AVETPPf3yo4sUoRtWtcvdCZdkBw2GFT8giM0Zpsg
         W7/Ez35MUHtCfnwDJEa+Dl84pR/B8NaAS6oD3huTg75sBK62ibckxiRhYBfNXEPgPxOs
         szC0BbhfzQp9+ZVUxF/OlqCZ5Oaejqez+N7pBD8gq8In1ZZZRpvdYDEDJ2qAK7Aw+V3U
         Yy5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrxXiK4ZtVaE2Vt5RbKgReAlB7lcP6JzKbgdk+C95Qh2/zGeDTRK7KtToHs2bigcIT2n5l8/7ztcNbkTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnrH8S2u8GXi5mSvcD21wG72RMIRnmIPyFh8joQeDBp2CMKpbI
	Kqf9luy6PR7oGZiWCLb9Rc3mwyA6i3wH+ZVRU3C7uPG2yq60Ph/Bh2fiOzeLL1s1To5uVgPUo74
	CHqGFi4b3CmmZ/leb0s9js/YEn++aujv2+atH4suUJM0e9OAPHVhlpE4Ae0Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6614:b0:4b8:4703:db8b with SMTP id
 5614622812f47-50b5f447760mr7562877b6e.20.1791823168099; Mon, 12 Oct 2026
 09:39:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:39:28 -0700
In-Reply-To: <CAEfrx+BVayni5vLt7vDR7bLM83OKYB-GqhSfJxNXUH=ekqniCw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd0d40.a150a118.27e199.004f.GAE@google.com>
Subject: Re: #syz test
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: spannme41@gmail.com
Cc: spannme41@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> master

Command #1:
"" does not look like a valid git branch or commit.

