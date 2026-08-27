Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A9D35C6B8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814906; cv=none; b=qnsXtDFPIrv/lFobRwdbB9+/ZMLA2wpxxMNcAP/4hh9EdQ3YiwZWeC3WFOtD9RLMtlWZbWhJ3A3O7FeAfoyQ/1yfGHgEiW/sg583hQcPbxInpKEzJkTk9PJWRMzgS9alfT8NsV46k3nCxCOqRCyKOYvQIs40CTpDM9jZYByg38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814906; c=relaxed/simple;
	bh=a7abdXmyXVjcgXxgHDvF6+A1YVRMGGisqdZBQlHZDw8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FrFNY82VZv5n6KBi7wsnIefPrOCj6HymUMiO3wlstLkVWBUtwzbPTwsVyUFY6CqUFcr04SeTTBpHWVlmY+iC1XiNPR27QhaSq1oDCjPNv8qHaOuAyv3enbm66qJ9d4xgH9R4rBO1agcQXUsiVbmqR+kliTcgbBnYwi63FQRmVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45ecef50eeeso2015414fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814904; x=1788419704;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZWvdTS7720Z1YSYDHZ7ty73vLzkYDj/u2fgb825Q1Hk=;
        b=d5gpxKgjWjHblIYhCLuamctfY+mbhyP10x8R8A+FDgR+82+GsBkLLyg6Lm2XXmKzbD
         nU1tjuO4dJ7MRb6DpcrgRRq08vuP9/wROKC9SE/h/0fKpprukwx7JOJl/4/d6nu29MFV
         XY43/kGC3aINct7laIMUyxwQsgb1Q8ij5kVa2yPqtNQPvWBo/UFMxMXmBC1PIZKiasp7
         8S318LQff8gb2RbSoK+FilHCspduutiS/MjiXwmYPfyv7hq82CdTnKPLTq5Uqw3Vv6lS
         LXNjVJE4FmXQGQsF/JnBzQC1H4+qCVR8RhQgw1MERtY17ken1fuDs9Lg4WINybwhd/wh
         XXcQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi+XeDSeVDR+a0Slsv85veCEkaQOH9KaVpN/Jribj9MT90oaIp2kPkcDcnm5RClPAe9ldmGGiUGwBX7sg=@vger.kernel.org
X-Gm-Message-State: AFuF++kmyctGsddbq8cPaGl5q9som0xPEkIFbqjMy0V63kboECsdHk57
	lI3p9JD1GsRbEAl5RG68fz4e0+cSbTjtVavDpenUYKnUaeMpiUVivHIXcA5YPj+O/S0BKvEDt8A
	CxDMZr3ZQcxrszdxgfotFJPY7dfHmx2vsdi4v3UlNkBhw2s9fKlxPcqNWthc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:edc3:0:b0:6b1:b375:481 with SMTP id
 006d021491bc7-6b1b3750548mr3292507eaf.0.1787814903847; Thu, 27 Aug 2026
 00:15:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 00:15:03 -0700
In-Reply-To: <ea1f4017-46e6-48d2-8481-238355cdadd5@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fe3f7.1d9ded08.62e62.00c6.GAE@google.com>
Subject: Re: [syzbot] [can?] memory leak in j1939_netdev_start (2)
From: syzbot <syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com
Tested-by: syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com

Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=176b6579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f403bd8c639b6040
dashboard link: https://syzkaller.appspot.com/bug?extid=489e907b2a026a6f5fa0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fe5625580000

Note: testing is done by a robot and is best-effort only.
