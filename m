Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5A38886A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395978; cv=none; b=VduW+ZLTERbN3wqaZ1rvAGPj0eO6dnT//0o/eMCk27ZtxgZhSnxzg3dO01u463+phxnh7IS44pF+2pFgJHlVLda4yEJjKmnTKe4qZfIZQa6nEGwZ7+hyzQwEnMsnrXLS71y9LaxEpVXELUyRKnC3PrdWKpQ0Ql5CXKEie0xIDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395978; c=relaxed/simple;
	bh=Oh72neTKRlc7TjN/wVUiRaj1jHaMNMJ/bO+DEK3Ybn8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=QAGerGarVWMACEqQo9DFR/xfdDBu5pseeohCazy8N8oFVFRNp7uTONS/hU8oDbp8Gu3ZGnZLgS0TUp/fN+Megid3sx7gotoIgG+OosWf2YYQ8D0AgWzCpS0GRqT8GoaS4Y5EEldfG2z7drRhBlBbPEmhmbgwTd+UHBZ+m5HJDQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea2c058e67so6362429b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395976; x=1792000776;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oh72neTKRlc7TjN/wVUiRaj1jHaMNMJ/bO+DEK3Ybn8=;
        b=OvtAG1juLVU8TjmTxxzCo6rfF5TTiiHLXZHPyNmD3IjSFzOvLYfwzrG0NtTepDuwTx
         +UuvsAJMCs6223D7yTNsjkGJ/Vy7/RGpjwpznfhRDXRLD3EjXOsfvJCV4oSxweWC/8gR
         iOlqa00wXIsivBWyHfza4Gy9taBNNBXvkncefnSSz/rcdZJX2XCyoMxUpXJ/MvOX+kI5
         H/4+omqHIuPtSCCLIRYDsSYmJe6JVqqeOE+MtIHomU/SGO/J6c+SV/NMTm0CLQi5a8Xu
         M2p6lwCsYyhDeEcWrICfrrYkF91NEnrkFJFF7+9/tKA7CUW25avMCbvi37siW3Xa/m+1
         wY6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8JimOHRFZsybCefSKOMBGOkRXGzJ7awxm38YbJLyA0lfxvTaRAHPKWH8bSOqsOOJLFzmeXnhPlIushew=@vger.kernel.org
X-Gm-Message-State: AFuF++leTBV7lPTGxkyzsiQnKqenIIbJo9OQ6kQ1uvuPWDC1sokwWy95
	h48GO59scyxLvY4gsgybhoeC3DksIPe653QBZB8mPHE6dsrHNaMzonpcNUB2JOv8BBRZpULFWSS
	gHJ0Rhh/Q+wjQJJyNTfFg0tRA3zLpQAsCWRAymqkUKqUVMeDlY3AH5wzhAa0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e88:b0:4fb:a7f3:4204 with SMTP id
 5614622812f47-4fc406a93famr3008965b6e.0.1791395976273; Wed, 07 Oct 2026
 10:59:36 -0700 (PDT)
Date: Wed, 07 Oct 2026 10:59:36 -0700
In-Reply-To: <CAOWyW_5SXth2RL8TefJrXnMvThL4cFUR-cQMq2uzL_2-qab98g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac68888.34119e79.8a1d6.0004.GAE@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: j.bhargav.u@gmail.com
Cc: j.bhargav.u@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

> master
