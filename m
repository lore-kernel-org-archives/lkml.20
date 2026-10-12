Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0B74AF9DE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823283; cv=none; b=Gv0Waptg3XECmmE1XXmCki7Apq1BjeULfyfQHIwWQOphIWWD7KXXq2IZpZmc0ZMW9/vmxCfgTUVEo4bmmBFgTFgLsyApJELw5TEXQxH4GUMLuow//CQjPBvIZj2hYqI8GMY/EG6p8Gb2bw7W7w24qOOa8hrLlgbbWHY8DnuN5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823283; c=relaxed/simple;
	bh=FF6ZhpSbpqYYcWrrOSIl5oUUCQbPoAZyp8Zl1DPN+jg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=oV1xEge488K+4AL9ioPz8IHMGwAbMvh9M6b49nWkDiboj2ZHuifl/LlPXmpgh4lZwv9NfxkxmLHy0DRItqrBnynt9RAVLDuHTN4erQZpyL4kLH6GsQuUIVRlk68uQ/9ldy1fO2mrLCU6CLW1Tsgay+jVK4DzELOUkBdJkfT7OsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab1so3506050b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823281; x=1792428081;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FF6ZhpSbpqYYcWrrOSIl5oUUCQbPoAZyp8Zl1DPN+jg=;
        b=LM2Lg/TtKIeed25ZV6T4lYf0sHBAibyY2k5iN/odr4T1gR7gtn/LmwUlbTXbehVjI+
         cNLfp1DImeZj41uqfRC9uQrnVWVXVUOL8Gbsm5zPz3Er4YCXePYeHsBpAvoRW4OZaxy1
         k5B90wr7GP363/byMuZLaVx18Fc1aEaavCUYn47Vxl340nt1graDxEyuMELUJw8MA9d4
         qxsm3s1r9JQqnwVbT39dIUdYkmQBtkNHr//iJ0P+IL8uTubi+N1FBkz/gFyF93SD4+rW
         GjASxom1u+rqyiZF4qEbdN4pULKe6wKCm0SRo+KHFtBQAfnaAEgXpJPO3I6cYqj2lge4
         6whQ==
X-Forwarded-Encrypted: i=1; AKwUvBzECmReG8DqRZJ8+fXR0BoAZ0xjEV4srdaBThk+Xe0g9dOqthuBoHNlI5pw8kMJ1+MfFPBTneyMd1rszIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4PZpeMiqPcNQm0VcYobhjWFJNGdtWSsit8OMxwFhVjK5tPZYJ
	ndYONjThJn4kl3PxNuD71AUl+BU3vWct5VxAxaT/jEdYm7tyZkxU6sMGoDGn4MdMGt3DhQRT1Ck
	7a4ru4c0HsWgNf2jHnl9Rxbee4FSqOvf0Jr8rXaVQ2N6kDC3UMn2EdW1pnSk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e4d:b0:4d6:9133:cfed with SMTP id
 5614622812f47-50b6a2638d2mr8062758b6e.50.1791823281232; Mon, 12 Oct 2026
 09:41:21 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:41:21 -0700
In-Reply-To: <CAEfrx+AZJwj-=yiMc+EjXdNKcTbMn9cFRyUdArmWX47kiTYV-g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd0db1.a150a118.27e199.0050.GAE@google.com>
Subject: Re: #syz test
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: spannme41@gmail.com
Cc: spannme41@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://github.com/torvalds/linux.git master

Command #1:
"" does not look like a valid git branch or commit.

