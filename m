Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7835D41378D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382224; cv=none; b=mEQ7s6YgxDZankHugzcLwJN8XqBc4rCiNkdDYtDQsEV+eI+mvKLnlpJkFq/lIHCiGLCziRAw93jSobVKQ78GGx9qOGrq8jBIy+jFaWht2qAGYk7oi/VQmsRXPKlnPOsPQ9HK067ULydvsANfY9CdNocAdWA6g0v2bfNyxYZij34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382224; c=relaxed/simple;
	bh=iV8mqxFBJfS8Wzi+/wYU54qcYfb02ligL1kCzPxVb8Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pVbZ9IUMkSKIQysu23FvkYiq6c7byRAqiVDXngk/ojAeemlZN9DyCMcvniHz8TJ9UVz/B04NXfdDGm+2s1fdL33bbi4ga20W+48kbpMUrYEskC8EgJh5HGAfDNdIBGjb+kP14KttGYPgJ+XGXQdEdnCRTG6Lmt2vBUskH8fIv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b1bc2e44e0so4107485b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382222; x=1789987022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xAKD/SAWIL8GQyMQ4NEq3SQpudwrQmYbYrBOBTVC5Dg=;
        b=nNkp+f6lzc8DrqwR+TsOEAfU2lQqWEa/SNs9GfHhLC8txNMehkmPcpODhpkQX72VHH
         plfxsJYgLYmjB5tkUBq3zo14DDJBkxy2Ou4DdR3lTeonB+Vat2j0709kgQYhPbeBjfcP
         fYtFQEVsqOcwkBusrXpeDxAdjPK3UDFSXqWpL8OGgBtX7zoyANfb99bubzo/zwDaZuHr
         Kuo7p9t+4dHrLP3unUMtd0AO76uEba5pJ5KrEinhKvsVL3YL+qxcYzQKwUnQrs8KAWRL
         FXnRlL789u3Mx8sRKkw3rMgW1P9XqEhlWGV4Any4WqM1k8vHtbNSU3As6o9I/BgmwcCU
         MaQw==
X-Forwarded-Encrypted: i=1; AKwUvBydxyRbrFj77bLWj6sVtD9j9vQDtnstgKJ5YquFgAfsRPB3qcsrF6nSiMP0gUcBcNdHq2xM/rTYI3j9beI=@vger.kernel.org
X-Gm-Message-State: AFuF++k8LDvHHFxcDDRA3Flke+m6at4eoFpUclnuVcJrtk/yql6V2ue2
	3ozC5K6UsuQgEjXnE78+VzW2QMXezF3BdHBv963o+ZOtUws8AA6TYDmOLL/vYxOb5QXJKaPYU28
	S5chXJ15WsD82AGplBsZZ7BCV8nUFGvFJ3qXgPI6+uq/YEicwmBWdBtM7d9Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:6ac:b178:97f9 with SMTP id
 006d021491bc7-6c541d501a2mr1451024eaf.31.1789382222381; Mon, 14 Sep 2026
 03:37:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:37:02 -0700
In-Reply-To: <6aa7cb00.425e5eeb.225564.f8b4SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7ce4e.016ef6ab.da411.001d.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: sleeping function called from invalid
 context in null_insert_page
From: syzbot <syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com
Tested-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com

Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146288c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=95fdab36405e5ffdb680
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=140d2df9580000

Note: testing is done by a robot and is best-effort only.
