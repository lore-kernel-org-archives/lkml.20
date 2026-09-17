Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B9F331237
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624384; cv=none; b=fViauAePa0GOmvl6puBOXrHCfU+87VXunLoFV02kIUTJk7Qh2Ilm82AyLvvd7dWtr8iNz7+qKvcDszRSLOx5OFOxuss5fgzVE5C6GGgdL+7X7iqTkwl2nFUcLYCDoms/SymjW1vRL9ksFrlwCDlBf/XIQYRPT4IiqBaB34HIHzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624384; c=relaxed/simple;
	bh=50Wr14ns1HRBAcm/e6CTUuUbCKcKE2kc6z5bgqa8EGc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oPxg4zodRmOMc6HylgNSkoJXXaS9P48Xxi2OCyYLrsHYKUtXlUH6FVCaE1fYrOO9cyUvkKkt4J/vsw19IeLsSRpS6OiowY0qqIwAgp/qS8SPC/mOpsCcfKj1j/A7WbrziD8DMQNYuKh+ZSVNLkeEj/SogdVchBPXhmOx7sEnPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c2bb8200b0so780908eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624381; x=1790229181;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z1Vgm1pTiLCaf4GIZgI9+8+t5NMqM0aZeh7AqUaz8fk=;
        b=y9PQeGN9859RCzTHPAk2aE8Qi5/ENqTjh855Zt6/+vNYKtaKfz2w0nI/5wEFwabvCd
         t6HU/UehQ72BX77PvysJmw2wzpqFz8UQ5T/FqPGvLnkcR9+2kjPwvQwOEtEK9Y9URsUN
         CfCD5TCRGUOq+qK4OliXo9cRoc6q++S/ktV5AHDEZwp1JJxX3wp8/OH0sHo7GzToD5cA
         KYzANF5seqZYYeUX9yWLRETHEOuh/pjQU8eVNZPJi3Jo+cmsz3L0TcfsFfNolx5jJ271
         laryxIhYk8VfuBa7kTTZrKgixC5x4WTfRg2iBonemIOZYZ1T29hzOMC8qe2tRKSw4l4O
         mj+w==
X-Forwarded-Encrypted: i=1; AKwUvBzmSa6mDAs8AKh7PaS3b6rB2uBmrnZr0+pBEyY974QHvpVq8pnCrtY4K1vC6Mr31mCM30QihOISjBfhTLU=@vger.kernel.org
X-Gm-Message-State: AFuF++kfDefa3wQZKm/cPN1NZIXLF0c7Og8vhb/iMqwjFj5FaqWije1N
	ChBHXBVikO8PdkiTlCEHnuNIByFc/BEgq7NKeMwNt0v++uNUfikIRickm9zwYm5bgPV0hYncpHO
	CEedpe4KmeyYBiGrb7hxEQ6Huws7X6ib9Yb6Rqmhu4Wuy1gny08MShc33pYQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1520:b0:6c7:bc0c:4bd3 with SMTP id
 006d021491bc7-6c7d3df0742mr5133633eaf.44.1789624381613; Wed, 16 Sep 2026
 22:53:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:53:01 -0700
In-Reply-To: <6aab418f.e2326a07.6d12b.e9b0SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab803d.71f81b7d.278072.0014.GAE@google.com>
Subject: Re: [syzbot] [batman?] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
Tested-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14344915580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=a079f084653164a652d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12e393f9580000

Note: testing is done by a robot and is best-effort only.
