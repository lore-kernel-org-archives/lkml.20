Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7463AAF57
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789918709; cv=none; b=usFwSieNXKyefjYS3CKa7pcOl/u3cR6tNxZDY6JuzmVUvA4B+d5f53fKKQ2XgVDCswmWIkHiF2XWtanrXr5Tujy+Cl09o+X42QPo7ARpkM4Ax+s5SGVSvI8ohm0TonbcfI2koAK+7jFhizvSajW+qSnksmJyH1KgExeoJYQCxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789918709; c=relaxed/simple;
	bh=iiDSA5fUxcl5o1k4Z5xqaKAi99hTZBDU2TY9VUOA8uI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tzaMkEuzB6IXv968r490w/9H3rG76iA77Jfpf750NihtsR22gvbhE/UrTP8t4AFEeFmABHlN0YvowajNLIkxhzzrI+UxTkTd6NEl9wfo7XtGXa/3XOkzkCYRRM38oMtrp5CGsAr5EoVSDsB4p7rebRVondierstOxfRBp1AluZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45a07949855so4002700fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789918707; x=1790523507;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iiDSA5fUxcl5o1k4Z5xqaKAi99hTZBDU2TY9VUOA8uI=;
        b=A4cQc7XEb4eRadP7BJFe/N1pJVYv1uxe4Mz8kpEziNFwtmIPKcJGe5ReLTtAdSYtFG
         n1mFzpTZbFwMDdto4DbCKWu788W1zqSJVnf4EjtVNFg68uRS8iY9hx0j8oFoLLekfhFF
         UXPwK1oolwsxKthOUsgFYOmE+I00NZbQxEWC1EVRxM8yYluQvSwz/l2KLzXq44dHvYLL
         KMmVlRcZmWbU1rc3c7fa9zfG9DGrSDu5AYkUnQCxlGYhoMI3ZtzgrllVx3h+NYTPzg0X
         R2jlVUQTlXeD4nIXTMLAydYNXshxjyZ0aAfQd0dXchvZCnwXR1+Ti5vvUyKob4QOOvKd
         MwXg==
X-Gm-Message-State: AFuF++l6XklY+tByKmhiu4+YiLeyzXpkPv5tmj9U061yZQCRQU5PkXca
	3apQwa4SxVDuERURyQ5vJt5N/gND53lonANBSWABiWwTA8LfLP6JC32lCjPXAnrdnKatqdO4B6z
	4oADH78wplYhVO6MxyAFZAc30I3ifs71alFFcPLYg+lrmrA68oXzLpUg/VH4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b91:b0:6b7:46fc:1d6 with SMTP id
 006d021491bc7-6ca9cb61574mr7797697eaf.53.1789918707437; Sun, 20 Sep 2026
 08:38:27 -0700 (PDT)
Date: Sun, 20 Sep 2026 08:38:27 -0700
In-Reply-To: <6a964b83.99c12218.408a8.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaffdf3.e548f532.1ca396.000c.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ext4?] general protection fault in __bh_submit
From: syzbot <syzbot+41453ea05ab61c075f1f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [ext4?] general protection fault in __bh_submit
Author: penguin-kernel@i-love.sakura.ne.jp

#syz fix: buffer: allow a buffer_head to point at memory outside the page cache

