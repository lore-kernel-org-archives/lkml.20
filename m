Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09536F915
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362416; cv=none; b=uBPTbhHV3koyh1hts2cBZ+8wvolZ+3PdfZEmONPS5WAhsRK7tM+y6B5EFC2XYrLi3+iNqDPZ9JFZyim+PNYbiKbz3qd5j2UJs7Yc7IkmU9EYjrojzOlkLre7zGHduqoa9b+hYnRCWtXa4ZXaAfxMKlWIChJiLextXUIHqXCI+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362416; c=relaxed/simple;
	bh=YQW1snMUsXn3OKsXa0oe6Xbuy8FLufnL+1YbE6HDqQA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s08R3O5Qqp/ZNh8h2REg42GTt6v3rsrur/i//XIJpF5TcmO+z+DUgt9K9gjkcwnY2QsiY/H25dUzSjzSbMByJBMif93tqn3a/pmw7vbL5HaVVGGbh8JjNAV8l9TDQZ8fnBOaRYGHqNq7Z/a3JBz49SQq2gWOm2Rj2PNHMuY1x2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44899f99756so4441543fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362414; x=1789967214;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YQW1snMUsXn3OKsXa0oe6Xbuy8FLufnL+1YbE6HDqQA=;
        b=jVGdD1EPegIBrmKTUDzGsX90/micAyExg1e449S7vR5zyyTC+CGz9z51Wy/g7TIUnk
         mcSeq89x7A3ShqTeq63oyp/bU7zRMRVenGQ+/Ki8es43svCoRn7LW9PV7EwnwDilnlIk
         Vi3hfihmXslUIWjfXVrJNtTGvC7kHaQAl6Yna/kZK16RHwi3W2P5SNEzw9CJjOD3te4U
         1gy/ylOxS3ZTp74nFgYFjh2SE8aSudmq49XswuZwwRaqroGtMdGyKwcrdTyEYwwq5jwG
         eAVa1arrdKSRZxJmpTjQKqcWm2+dI9JgJFoiEXzPO8TQQmBmXGLwJ2nFS3w4bBTXFE4t
         Wijw==
X-Gm-Message-State: AFuF++lnTlVKr+HLW2nX75EW4egn8kzWUsVWcmGbkgAaaD8CvSTbftki
	zkwSC0Dkr8HKGrQeJ1kK9HtnlAtkV8t8Q1WaFOqQIxAeqQFfxB3QmjAWAwoqZJBdaRWfbK6WAtz
	BZS+ntYJtVRJ98PlMSxOkPTEUEmFRZ59tpKOVJc//Aq6Diao0KMLv4PKTj/U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c90:b0:6be:b2e3:27e with SMTP id
 006d021491bc7-6c53fc7ab29mr413852eaf.16.1789362414027; Sun, 13 Sep 2026
 22:06:54 -0700 (PDT)
Date: Sun, 13 Sep 2026 22:06:54 -0700
In-Reply-To: <6a74aa44.01d0871a.3a0d52.0028.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa780ee.a211d2ce.1a5198.028a.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 069f4aad347e1f3181639d2dfbadfae592df93e7

