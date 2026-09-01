Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4FC442392
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250925; cv=none; b=a+FdMtFw/L1rizNowZWgHqf3zYkmnSBeZI+F9AKD1tWEgNBAP40a7seu8YY+G2CrXqvJJeUCaaglCRXyOg1beANepig+Dq1e2MygYp+BTjvZrh0NGRTES5FwBJSgj3Iiq5zzBnYELtG2Xp8Wb0FSmNo+rGWCMQez2VZRxGR8iDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250925; c=relaxed/simple;
	bh=q2ef4aVgRZ0IRRYARvgwN/BgJu11vID21E9V5Gms9O4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z3n5ZFbx/P9Sfop3cdGYcL8WQXpd0u5qJZeAtW9IsLAJBWcWGOopXOqXV5pH5I5HSyGuJZ309DSNhfs1hp+OIKEzv28qjA/K5Td9i+pm8Sgh1iOHeghP08DC117K4k5Orw4mu/cb4ARioXeXmgO11KPX2eamL9bwLy2tOPPVKAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1478e3546so516860eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250922; x=1788855722;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fxsg3tyZFfDboYC1KLQNAGrb0RmxM442yXMbJyS8HSI=;
        b=ISgQQ0vQy6zLzvK2M3/gxbL68oYYw2DKI7amRZvGNgKJSBxyz8UArPTOg2rvRWq3dk
         rDJMQok9yQcoD6mrIOqTm0OxM8bDfBxm9cHt3a2scCSgAbNZxGnQ8mcZRLBr9FJ/qe5M
         7CXfv+R2dL9YXbIq1V9hCc27YpGo19hAmU/2IGmPmKeb3fZAubIPDHTvOWbKOvOmEU82
         4+0zHw5ARDAUJiMZ1ZF3Zz4E+Ar/EyUns3WzHU/2HKoJp5iYP6YoEW33J3FznGvs/wKs
         eqQCwFAE0LHA2HfwkTgz1BQuXgB++dEv51GKBBp5rxrx649Nuza6G4oF9x8FRQSz47Hc
         UK3g==
X-Forwarded-Encrypted: i=1; AHgh+RqvJi2A5ORzDklvQXwbnwykuHNmEIK133Crri95C/RV+8nF0mnub791+hO9S5T9ttA9F77eF70gqdI7fMs=@vger.kernel.org
X-Gm-Message-State: AFuF++lj/EydEdLuCKMpIYXb+UkvIY3m5PBA263XyfjZS8jkE3fS0MvT
	pTTKecBPoaywDBYJ6K7pX2qiEJ0lNaAptRB99Gs/LJQ0OTmVHmsnCZMTu/laXzhnE+pCANnXrVd
	6a0TTTh+4SPQ7eTv6JW9tNngFwVxaV7pIzxBKQ6VyeD11jiW1zUANsogGxF4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:7049:b0:6b1:a812:9871 with SMTP id
 006d021491bc7-6b1c66855d6mr31267352eaf.18.1788250922028; Tue, 01 Sep 2026
 01:22:02 -0700 (PDT)
Date: Tue, 01 Sep 2026 01:22:02 -0700
In-Reply-To: <20260901014303.417027-1-junjie.cao@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a968b2a.08473e0e.15b4ac.0000.GAE@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in exit_to_user_mode_loop
From: syzbot <syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, cgroups@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, hannes@cmpxchg.org, hdanton@sina.com, horms@kernel.org, 
	jackmanb@google.com, jhs@mojatatu.com, jiri@resnulli.us, junjie.cao@intel.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@kernel.org, mhocko@suse.com, muchun.song@linux.dev, 
	netdev@vger.kernel.org, pabeni@redhat.com, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	vbabka@suse.cz, vinicius.gomes@intel.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com
Tested-by: syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com

Tested on:

commit:         abdf623d Merge tag 'wq-for-7.3-rc1-fixes' of git://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=123d1379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9cc692b98d9b4fdb
dashboard link: https://syzkaller.appspot.com/bug?extid=2642f347f7309b4880dc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16f7eb79580000

Note: testing is done by a robot and is best-effort only.
