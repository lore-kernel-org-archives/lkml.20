Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7C37E5D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757204; cv=none; b=Q/n77V0vFXaiXSU/ibji+T1PDDvcbSF0Nn1+Q1fulYCar3jdVUUoNsTD0MEfE3OdNAwqbVwAMwP65dmCUeleBCpweyBedVnGEr80xUpEgBZEGgF+qt+y0vr6VyX1z9j1DRug/yDHuJd51wgNJD//zpNwwMt0NjX6y2o83Nz0M2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757204; c=relaxed/simple;
	bh=nShkzaHZd15SV/o/igtix0Tq+u/6APpJqa7MRxP2+qQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P7p9+s2CLjoG9tt7nIPNdUkChx3oGvM9JzAj+dM5CK3XyXQLw1o/aKkPVv89FUkSFELBh42AktTw7d7b1F9J7qrT8gywYDSuNZkpHRH9A3y+TXeaL0X/IW3yi8uK0YrsyX7cg6jcTi4uSKY8cZh3M7pcgVNVazqwIWp+E3KVeS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b12ae7394cso3980294eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757201; x=1789362001;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F9p5AyLSwqkd+8zN6BQUeqOxcXrms/lnAYL3OysytLc=;
        b=bX89XDyNb9FFfmmmTqCstl1JUOdv5NsoSuba0CCjOK5XhH4yARt3TqNRTQnxyYPAUO
         jq38fexwgXCAIsAcwaJZpglXhCQpd/Z7qdtbMP6MALbKHVifmIR2ceRSjfMzfTfioJGA
         ShKryr+kA6C3qKoQnLMy13ANbStII4tf5Fo//S2uh0RFeHwt/81Zk7Uo5guEaX+ERrTb
         IQJiXW+fTWZdUGb0AshtrGJqXwanj5RqxpSW+JaCYSGiY2GGnaziy1qayId23yYIQgFZ
         IU1R+L0OAbgMNKc/YtIeDmZFsBeHgnvB40aZ3WIpk9Ehtd5QkZzYhudDYp5mNXyQbRAf
         nhyg==
X-Gm-Message-State: AFuF++moAPMf6YRfP79oji1ToYj03B3I91kdiJgwtpFeMP2kHpKNwqvQ
	NBuy7/bt4pcL21X6KGqg9qLSu/LVdim2NljLl858IF85gMVXdWjZHg/qMQeixZDIm8c/fPUNEgG
	h0U0hojXOZuXV7fIZ1/xuURzQfT9rS4YH5IN5HsLX/6UqTXTgaT2wN4PxDas=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2c5:10b0:6b7:bd08:eeba with SMTP id
 006d021491bc7-6b7bd08efb1mr7167414eaf.60.1788757201493; Sun, 06 Sep 2026
 22:00:01 -0700 (PDT)
Date: Sun, 06 Sep 2026 22:00:01 -0700
In-Reply-To: <OSZPR01MB9313097803429A16EFC1BCCCB2B22@OSZPR01MB9313.jpnprd01.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e44d1.4a487d73.3c8564.0028.GAE@google.com>
Subject: Re: [syzbot] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tkdkei@outlook.jp
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com
Tested-by: syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com

Tested on:

commit:         edc15184 usb: typec: hd3ss3220: Add support for supply..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=119c4749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=a83a5a1ba9ff57935171
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14314af9580000

Note: testing is done by a robot and is best-effort only.
