Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB3296BD2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472928; cv=none; b=VrXJ9dRRXr+oxoV8n/TDtiyqDA0BU1+cDYN++d0QWL2w8jVCrvntNz91lVjCFBpADdmKh9DapdOz0KjGbwRYmL/Us7ejVmkmABIQXM4Tv5po5PVmMxSUrCSkrrer/ZyT3YXyxMDIdvBskAiiGQYPsFr3ctDBek2Bol1PAOWY69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472928; c=relaxed/simple;
	bh=fIuA9whCacKV925pvaUjv991NN/zR/DeIy12hhZj+e4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N4YasjLFJbUXuqJhXebyqWppyyudBKoP6S7Bemi75Kzadg0IYOwFQkMJNNAWgCszMAvyDfP4LeGB5frKmdnsr0tlhndvnnYCvwsVHVO22vwe9VHLPqyh7PhSLlpRwbswu3UQVcLIQXK7DFnoO9Gm/TIJddmefTmrk/HeeQ+8DiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46a5954cdfcso5704104fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472922; x=1792077722;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kKU/hlDwcyb6DqIvdpCvOhi9jIEa0I9l49IKIqJc1+k=;
        b=w+w/XU/L0WxziF2y9/ToNs5W29+TQ7qyZG0jveKSCjR3fUNUeG2XzM8Ug3g3uvqTk2
         mfcRdjlBDN0CZGNP4Lx+mJTDPKYzpvKhKWfB5zXOj+LNezG7VhzhIKhLT2W52KgmGK79
         0Qs6D2EiCbFZsGlm92asmiz9xfEiFk5dQx13v9glJ/Asv9Sp3g1KCljVv0njnv37KCMn
         iD08yHQbjg4EGhhPyF9H4VpYIVspTs3ryKUuHd8PF/39zcMsVrnS5NLhbP5NgT+f1fRB
         dQdfL6sITidWOr9qSfE+LpZpnHzRMi+aWAgW6S/Y90YKc0dzmZksgUN6jOz8L1SmQPrm
         ijKg==
X-Forwarded-Encrypted: i=1; AKwUvBy0OK21LxZsf8ihjT0C9c3/V++Bn/T9zK6pxdAevA4ICroq1SFveQmzNi1nUlwfPIsGI/G6MDYliPU2IeA=@vger.kernel.org
X-Gm-Message-State: AFuF++mhDg3WtG3n8Dju1Q8F5osZpeMF7oUmI7bAhKsDIvZQQ+jl/yQo
	gGKOXQ+anvm6Rulx0xLh4KXS0mcxL2ZqNRr2bwSND2AZSWH758uai2fVrP05XsSTLZgmXWrsoSn
	eIW4r+f+Pv9PHqQ4cO0Dt4/JhuPounYn/LO6xTEd+0mwM4y88aEEgW5MHjZk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3e9:b0:4f5:4f8:889 with SMTP id
 5614622812f47-4fc46f9343amr5239271b6e.62.1791472922602; Thu, 08 Oct 2026
 08:22:02 -0700 (PDT)
Date: Thu, 08 Oct 2026 08:22:02 -0700
In-Reply-To: <asddK6J6bt2YFJPb@nr200>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac7b51a.bbc4c7f9.15faa7.0004.GAE@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in device_move
From: syzbot <syzbot+1f4e278e8e1a9b01f95f@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, kriish.sharma2006@gmail.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, rafael@kernel.org, 
	sst@poczta.fm, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1f4e278e8e1a9b01f95f@syzkaller.appspotmail.com
Tested-by: syzbot+1f4e278e8e1a9b01f95f@syzkaller.appspotmail.com

Tested on:

commit:         5fce1616 Linux 7.2.9
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-7.2.y
console output: https://syzkaller.appspot.com/x/log.txt?x=166c7c3e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fe117ee605b5143
dashboard link: https://syzkaller.appspot.com/bug?extid=1f4e278e8e1a9b01f95f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
