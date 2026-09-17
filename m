Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520456B87F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662245; cv=none; b=U0MWKP+4EDaF7P2LPCY125aZvClSfDoceH8zh5H4NHDsy1LQAEvWU5O+20N+vs13zfgb5OAKs3p3y5DagtkGhYn77YJFo3o8vpnEASoeOWiW9t1kIbt9bpluoSqm4R7BFIfaG7uB+sMd1II0JHZn/P/RmW7k0So9DZPnhV//aMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662245; c=relaxed/simple;
	bh=TkpLQXGVgIS9NwZ9mpO5V2WJYBiXvDEpxtRK/9bBrg8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=OGxjpZc8CPgQQ/ynvj4DSQ8EuaWgZSsKRPeRiEtOMiquut5H/Q079c8WEc7CZ2wCWsjNCCDCkT88FOBmEqCRzPRSm5qZjjZpaJR8Ci6SL1xovD0DKOwdBUuDwtZBjJ1kPe436PyhRFyTFYZgxrb/8H7idyfhhW/SCFev6H1o1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28dafb8e1so1738803b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662243; x=1790267043;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TkpLQXGVgIS9NwZ9mpO5V2WJYBiXvDEpxtRK/9bBrg8=;
        b=YCe9ZTSHWzaiBwiUESiMfAbZPNEFouzV6ZT0dyjMSTQAeuG2rjRfvn+gHgHZkBAiSJ
         4se/btVY/I7FSKGogPgVLvCsby74iGIyeGnxFi8z19hVTI/J+BQyCyW6ZdbxCTJ/AQAh
         9Z6tu2E+P9W9cEe3p8yEiazZ+s8k+YWByKtmwSvCx8NeMq1DMlVG1LcdHfW3TCq35hbQ
         rtB09o6mpT6uTpB4irrp5zHyQAzYBFirfyrxJQDBtNJeqG/EmZvOLsagN31IHaRiMfFD
         SGUuo/8yVHAercGOrQNhZt1YEyCts/APwLCVKQyquOXlhgTs0YdPiGB1cdSLkLDyFJMQ
         SxJA==
X-Forwarded-Encrypted: i=1; AKwUvBxXXzeIkEriAeOaW2BwL34GZdqt5hTq2NfFr42wWxto41uxy70NzRnKGwJzM6BRaS1+HE3mRYnj9yy57hk=@vger.kernel.org
X-Gm-Message-State: AFuF++m+k2uX0D9+c84ARz+9/o0YL+Oe9vfIgY58YUHTeNMz+ZxF/gHC
	x5LDq/oxfwppRc0A1ZetP0v5ATh5J2vISKpVk7P2yfN7AwRZIwm2BiczQex+Cv8hIHlDErXZ0D6
	8tqu0XNxab8F14LRb1HFYrZhdL9DcfNDvRFfeOy+Og5nT3If2l69E2X7U/PE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3505:b0:4b9:a8ac:47d with SMTP id
 5614622812f47-4ca4c18b192mr7505319b6e.27.1789662243039; Thu, 17 Sep 2026
 09:24:03 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:24:03 -0700
In-Reply-To: <20260917162354.96339-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac1423.71f81b7d.278072.001f.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com
Cc: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
> Please find the fix patch attached.
