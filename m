Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9163CB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608844; cv=none; b=BJQi3iSgGshboECB8jBoFEOgIpHvoCv/MALYUYv20CmxaOlPImhDjO/05qbataGjheRy1GBVbiX04kti3u+iCioVJTMJny1pJ6WqRL+nFR9bIs9L2WvvpNweGashHvWsI7aU79qvLRJw2j0HDR+9/AbVnTjolRw+rqUR28p/C7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608844; c=relaxed/simple;
	bh=I1KJHdyTFsrIlp3bsN3SMjwN7KsBg5SLX4JsdygSAOY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UvcUpckyyECkQPOcfj9ryotomvGCyu6mFFiHGiRoo5Cdm5R6r4wfqiWI9Au4ebND8tELVpSOHrZTzjuy4hC0+4P/g9lV3gL3ey4bqDepWBwD4YM5fg+8o5Q+hCm3gZjfjbuOWOQJ1wJpjAxqiMJQ9wPjvag4DJcI6cbcoS1rH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso636069b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608841; x=1790213641;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fAUQTadVOIMmNKXmF/BYKZPoM0CIK8Xhy1V+dK0wDyM=;
        b=JRfXklxo1IcdZa6UWN4WdHoQdiz2tRA4lFbFXlg/fM7WRkLps5E1OYQH7R6fZeu0kc
         m26BiWF3PAzUPB9RxOV5mZpnLVKIir4kYr/8JDexjj+u3QfpiKaM36lePSBPdf+fDpVt
         /PKW0I7f7jG+vEn+3UrexN6PRPbsp2x8sNRMMaUpNBrY13IFpeMswwi9q6T7IKAOTGVh
         ywRLcL9JVNoq00wmS4Wtg88SJFouC/tBSTP5o6cahbfFYcG9ygzYYcyzoHVCEITDDaIW
         oDMKMC2xJz29HH1R5idESYBFF9pmC8ekjwyYRHTRRkj19Q3Jd3ufCrhX8cutqjWQW2xH
         tKQg==
X-Forwarded-Encrypted: i=1; AKwUvBy3PpNMsPwTHJ60zichPclo8Zd4sZteQTxDunrg5f+C051LSWoIdXggWYNxfhhL+5xawECgD2PQT3q4N4w=@vger.kernel.org
X-Gm-Message-State: AFuF++nHgiUFaS4C9gkqzB/D/aV9LoIlSbgFtUHoVntqGXQ9wFdPviYP
	ITz8pu+U2ONsj+QPThlqnDWDMoQjO1z06mNhhh2v/66xABdbdeiKEQXlfvYgUdbSSypP/6KfA67
	LD6704f4apNwdItob0JsqgSnMP7RnhzzGqgYkrt+EyYoizURsnEDb2msATKY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c136:b0:4bb:ac05:9ebf with SMTP id
 5614622812f47-4ca49ecc9b2mr4576702b6e.14.1789608841652; Wed, 16 Sep 2026
 18:34:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:34:01 -0700
In-Reply-To: <6aab3f19.5af1e7b4.aea08.bb89SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab4389.b398a7c9.1f86be.0006.GAE@google.com>
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

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1066dbf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=95fdab36405e5ffdb680
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1254ebf9580000

Note: testing is done by a robot and is best-effort only.
