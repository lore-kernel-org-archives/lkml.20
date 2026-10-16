Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A146C844
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154525; cv=none; b=WVTSe5ijgejdpL6B2Q5bEkqMcR1b07aTQkKcvoGzeOOK0H1V2HhMGBbx53SZIVwSTs5OLNkM2pk6cui7IMDduPylYH7Vq8gVcjm4kiNAtrxSw4YNRfMR7Mn9l7YjZuLOk7t9xOeRENksquJ7NLgp3+zuTD8bE9RINaeUzXHlOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154525; c=relaxed/simple;
	bh=tFX+X7rnQsKcQti5jA1MmYeLge/3VRhvlrXzIDZt2tA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uSq+Er/WyiCsc/zH+CfxRNpffNljwmBBnGsx3/jFRflDTPFRo+0his0tAOzSSiJrGjMVVI+XSzPG+JkyC9qLZvxp21+XFfAWGCdBRm+LoMcvvdndIWKELFpwfziMzQOBeX5VbxC5scmBJOh43O6DHoC88QDgqTDL/MSs8d6+D6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so6494938b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154522; x=1792759322;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0SKCjnYtFPoOW9tLPYuVC0i4kPZQ9z/T6yqLF71lfIc=;
        b=vTTiKrCiq2jurJBCaETZ6ld8qgvWBL/6Yrrk9C0SyNmsAQjEq7Rnpcya5KQiO8aMdg
         rUD++JJ5uafem8NarFxve9CoXlbszwB2w4rDcqd8mtAqfwxHO2WkzS7YeTEQs6TFhGns
         6uW23vwlECLtCFS4MmtQQrF2dcWvXy6kH0ThGfUu2M644Nnta6R3H6QCm+d+dSpii3mz
         Hdqm3gs0H7Gg5Gjgki9gy6UxCuCPJYABGJsb4ymNpgJS4vOoyDRHV3Om7AQVubwwOLOg
         At4+dcaohVbjmtxI5O3R47ohKeChZFoteHIzqCf4GR3urzJqmFGvivwAUNrcVWZQ78Iq
         QZ3Q==
X-Gm-Message-State: AFq9FYK4i+NreQaU3zWj7xBLJXfCrM5W6HFnSUcVsSY0JzU9X4rd4+vN
	nlfEg47SGZS89tKLkOzfCO5k4gYw+eRwWqLcEx0161zmTpUaXNRcINBoll0aCzxXRAxoflOuPrk
	lqkYuYJWPD0qhjkUnMy9YBLK05xl743+Q6sJG5C1MAzJ7gxH8kfGUD+MShMs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a2:b0:53a:6769:c35f with SMTP id
 5614622812f47-53a6769ca15mr902896b6e.33.1792154522610; Fri, 16 Oct 2026
 05:42:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:42:02 -0700
In-Reply-To: <CABKbRoJA4ZgGeROsriDsKSxnb6A3pXfKCKFpuUnvNoUDqQpwoA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad21b9a.6814cce4.34c49f.0005.GAE@google.com>
Subject: Re: [syzbot] [net?] KASAN: slab-use-after-free Read in llc_conn_ac_send_sabme_cmd_p_set_x
From: syzbot <syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, miguelgarciaroman8@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Tested-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com

Tested on:

commit:         2f2f7eee Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16bdd20d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=44efda9647c52be29d9c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11856fd1580000

Note: testing is done by a robot and is best-effort only.
