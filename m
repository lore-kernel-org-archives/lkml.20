Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB03A9636
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802074; cv=none; b=JnRkHzquC65NAwivcQMD9cqLQnDdmc46sxkTcU/XEasRYJ5HdqmA016iXrj1wyHD2XQy+BFtozAPHU97zKUWGJAOc1QaTutGwzg8uc+q8JQ0AJUDjDro9XTZIm+7k+HF3ClUldGWwcboPfkmfTjrBMWSSSmbzWpCcCiXJ88iakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802074; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZymWwdcxEJFzm92g3hE7BlwKmqv/575+M8I3GcC+0x8MvXzlPxr4ApKj3oG8OHRwLiiO/iybBQDCOw2+nSSSUEZrgI+SwVDDazhk0KnY+WYVZnmgupPWPtHuZ9Oovnak/0u2ngXvZq4wLcDDyNVI/XycbX30E4ALcuMDfx1ROEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4519ef1babeso2298629fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802072; x=1792406872;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=VQhv90ctPCJ/GwSEGOdCxaNruZ6hsf1cbRjJUZQnQss4p9TBxcyro3PPgXGdXO20VP
         Bwk68Birh4aeALW7UXHTf8NY6JV4I3fpnM0GuKmgeqW4m+rEb2LSKrQFB7PLJuwi8fnX
         TKqkxGQcaHWdIWrPXk0RpyS8sB6yvbfslzU9fRyDDz0CGDH+vU3hh4oYVVvfYPvHczfW
         uO/rBsyLWgToy+jV0s8Hvil0QflCdGm0MduiU90CwGuJ6HaDCJhXwwmYnVRTqM4WKBPw
         uNoywdP1z/i3N9wFV+INxHvw6lSyxQvS+7o6Sa700sZnbnGbq5b4BGx1Z3LmRxGiwHOy
         AYiA==
X-Gm-Message-State: AFq9FYK7KlYjsLCyEjO9teM7hvNRh45dYUvf/rwhhMbqppPT+iHl8oiP
	C0O7vu9gExZi55Wykz0MyFya056TVbbPw4wl+z+0Jv0GqWHgzCXa4iHSQzXXT9bJhDAI/gNV4aW
	q8l3Wxcw5vPGz1WE4uMh2N+DWB6Uum0IY7WjlcWQlQThdjfPbkjyZbH0eJJM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6716:b0:4b3:7b31:8df0 with SMTP id
 5614622812f47-50c4ed3d12amr7614778b6e.10.1791802071841; Mon, 12 Oct 2026
 03:47:51 -0700 (PDT)
Date: Mon, 12 Oct 2026 03:47:51 -0700
In-Reply-To: <6a9919ac.94649fcc.25487e.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accbad7.a150a118.27e199.0047.GAE@google.com>
Subject: Forwarded: #syz test
From: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: spannme41@gmail.com

#syz test
