Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7437B3F9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609685; cv=none; b=qUMcLvwnxcf6ucd+tns8jfRs/GaCzxv3md0VGsJhImMZ2Z/ktRi+g8VkGcJP5oVe7N2VScLO3cZ3BdfXgGHUeQUikR8sKQzLm/xhgzkA/J7oCIbV8KFqWhOdA9f6kXEyFi+KLEOP54ue1tsDjhw7+UD6rIR4AvKvzVqzQOghlrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609685; c=relaxed/simple;
	bh=PB18oUY/cs1y+fTeX/nwQi028ULDzi1UIpsTpxEbLBI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t4w8LSSLHHneiy78pu2PUV9GbvXH+MMh8F6Thf1+u/EFLmzrEWUq9FZ+LFVDGbDbGYfyRZhA1RehKuzDoMQqQH9xOQg1lt2bL5NYY2cbVT6WwPj1q0kHqjjPpn44qKHaY/aw+bZoO1BdX+ZZRRvhpwaFc/hIAXCNSPeoB4jmHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b7932ec2so317211eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609682; x=1790214482;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=34DYJRLLuMKafpW7vJaY9rd7gzdbVN5mhrtPQNLDQ9Y=;
        b=HYghkSvY+1n9vYr2ylaWAn42oqap19thF2cjW1qQ/+zBy//pUCU6LIV0a1YHr0y1QM
         bY32dxloVvWkc08WR21qU2z3Im6Wh4ub2k6Ey0OmigaI+4HH+SnDAHYSvXHDpaQSrJHg
         6pOh4m8RlTGVJJaXCPZpqiwzDx55z5dqn57DzESxP3KoGCLsrfesb9G5uCI/R6pW0mLk
         6GKVEz38yqGQbhMS+elYrNur45k0Dwg4kxh8fq1ip4xAjpX5TDoR6SVFY2llYHDR7/E1
         WYvVpRj6qnfvN5FaAaHkhiLk7EcjJUd5IMkF8pUXYRiDTA90Dt4/GNEy3hkOzRImxDQJ
         RL3w==
X-Forwarded-Encrypted: i=1; AKwUvByRCafaX1AcWxu29lVo9FCMzhvSb9k8qk+F5Tcr5WNTsj1DdEf4mPVUVy6/pcIzADh5Zk2sisz2L8IyKrs=@vger.kernel.org
X-Gm-Message-State: AFuF++lbAEOpra+2hjOwLzM29NoY7+EGjYsEXRqrTvbTDAdVwwHLVy04
	tv3BVtOIw8KJds2iSkuFzGXrJnGzMTUPjcW59nVfkZ4xqYfGDtMEZsIzjZLvkE9c989xIF7cqqU
	K4/lA5rhmexafhBegPveN+Dv16gD05NDtoz3EJuq+/W2h87afRRzlUkutLUU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:625:b0:6b1:afc8:3162 with SMTP id
 006d021491bc7-6c7d04eebe3mr4957298eaf.7.1789609682729; Wed, 16 Sep 2026
 18:48:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:48:02 -0700
In-Reply-To: <6aab41aa.0d1f51e9.29e58a.f892SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab46d2.71f81b7d.278072.0009.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11f6dbf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1706dbf9580000

Note: testing is done by a robot and is best-effort only.
