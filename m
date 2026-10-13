Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0846516153
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904685; cv=none; b=m1ZOPdbCI17YEPCv76xLiqtAIb11f3w+u+nFyoxXcSxS4eY5pqKEfwkEHijsS3Xus/7X+nlVSAdiirbLcd6Kd9RNt2X/Vq5QYSXVf6PUSKgzT3QOlywqpBcdBDm5viGxbOfOQLNHBXCkfUgaSZ+TENQFczn6mufMWaaAWb3GHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904685; c=relaxed/simple;
	bh=V2x4QlkzEgL1B7d3iaAXmv0avLo5T+VP+epopgBRIvY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fQDxUtkIwqdYfxeZxqPwolbYS3Zim+uD73lHDaoT1FKxh9y2NupOnJ9rgN3hznJCI+CSfCvq/PBVG6PLmYpHnPLR3XH/JHos28dWZmFrYi7OtmqLGjJiAqUJiM/VSuPNXnrgpgXccihGr/8gtpSOmpPDDLdtE88t5fPoJvvWwPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so5376309b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904682; x=1792509482;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sC5Ds2ZsXZsOr9zEuLur1kGw7str1/QGe6fqVJXBsRQ=;
        b=n4hNsj8pbbOElyaibyAk6UNXz1Cs8KU+YQRMAdR9yK/JaPevO8MDHW6ejAIYWUi9Oe
         PreCZjmFHlGE5pTMDapvixPxma7ZtYKRucfGyt62CZvoXPHOM6vroXFd/HLb1wt0YlkH
         5h8k4PRQt4BQLdO+m/V4cOUk7zgTUW0C1Gge9kKK8atFaXpMMxhW68xUidpjE7Au6VZk
         51ehM6FzCy47GeTj8yrt96qpgyRURRuybdAxkvZucuoZk1TZDJAc4FpS4hkS3auVtnN2
         0cr46r/JUOhSYok49xej+ZFsVNbZlNpaWSF/bWw3qMUNkfFa9fjopeGiYrHvmIW78gsB
         DMmQ==
X-Gm-Message-State: AFq9FYJ4vCdiVZwLxYcQihHj5u5nmMGvortYtfXkMIQDmUuu3CyplJIQ
	50x7+FptMGw78tzYgrXBXzJS4H/z2guBNro7/X2wwDyOHFxdARosPWqNqfOkQvzhvgmYfCy4dJj
	N3jwVPfS9ZF1UpsA3Dcp5qoWeCkNTN0sWsoCx2VpgEp/S9AihHkVEz+6HuQ8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1911:b0:4f9:bc36:fc5d with SMTP id
 5614622812f47-50c54842315mr13691071b6e.35.1791904682553; Tue, 13 Oct 2026
 08:18:02 -0700 (PDT)
Date: Tue, 13 Oct 2026 08:18:02 -0700
In-Reply-To: <CAEfrx+A4RDzBG4dO4hTKwxWTKnsyCFHY3TCH93tx0zjdwLU72g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace4baa.0e5b5d80.2c029c.06dd.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: rcu detected stall in rfkill_fop_release
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=859f36d9ccbeaa3e
dashboard link: https://syzkaller.appspot.com/bug?extid=baad8fdbfa4129f93db6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10caa999580000

