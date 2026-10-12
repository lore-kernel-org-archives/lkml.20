Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26543078B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804221; cv=none; b=CK3uL6V9uIhd9EY+STUXhXnAGxr6UHUuLwhRPqLfmxOBtUAj0JqHhhv3ZoIdI5hBf5/W/y8I2WTzjkW84wQ9FwYFF/XyXuHspqUvSN+ppDjerMzWuJ8oWliPWVycOYzfcHV5HXpR3noOXZCUcP2zSM9GCzGxNmmUfecESiCGjQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804221; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HyRY+z1XNoCsSh4T/aElliKGHcOTBfOLhoY1E5/5g/dVD3mhEKBZdlibHS9K+ktZSjKcoRQMpoGquzLUXHRD+dqVRi1LSV0B9zgG6f1G5ZOI6jmG29aGyHIuuMTRYCv28y8cmCe4mjnVQSKFVoIkA+W/pK5hbmc9ojkWOp66+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so3981912b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804216; x=1792409016;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=0W3faoaquwWrG1rpMrZuTMZoMEH5iN1qnftnAvm9U081jayPa1hRjEO4M0W/2FLf7o
         rN1e6pJvUjYIkENCVyOFrEYIgKoMr09I3kM/FBf4kIyy5hyg3BNGEZkxMh+DczfWHE05
         WX5PYKL4eHeXk4mu1wkZbjW4dNj/qyc74tJxATv57ptX4hCwYBP7Rm/FPP0ySKE0Xydx
         QebecPhKDl6XC9HP8w7UUHAHAQBwkPzOVYJrNR/M5EJRlppwQslz+MBdj2hrVZB4B2Su
         bFyXG10+zjo2vkY8woNSKeElyQ2Uf73AjMOt7ve+5bK8tRFx8eyTEtFh0sOKJrN6KLqW
         sdHw==
X-Gm-Message-State: AFq9FYKoJyr0qac0pZKuB5Ejjm5VUfaQROdQ4VnJFChfr7dYzhvmH8Cn
	qC1uuTmGgfkpDeM3oL+OUvZbV/3gqy5xUqquvEmTi+gtLlL8BmPM44gMtrVUEgiXCVULaODF/NI
	RHRADrC2so5rzvnAzhS1MEAwUHPvX4cMfhE4TdFuwXxXUgOQU/F6wJ8LAivc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a3:b0:4d6:9355:7547 with SMTP id
 5614622812f47-50c5defa16bmr7883580b6e.66.1791804216492; Mon, 12 Oct 2026
 04:23:36 -0700 (PDT)
Date: Mon, 12 Oct 2026 04:23:36 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accc338.0e5b5d80.2c029c.0571.GAE@google.com>
Subject: Forwarded: #syz test
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: spannme41@gmail.com

#syz test
