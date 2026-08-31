Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F439D6F6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154984; cv=none; b=bqHfMp+BQ32Vg7IaGnGvqTjqHIXrE+h/cYyjPkl58gldy/CuH2KrBRFKLzEwiqApm3y1x5MRetw8zkD8rqciT7sgeE0seHt+IB6IJRZC2LggEfxCVFpCy87ep4OuqX3kBRgTM4em6a7+ruID/u2IK4KJ5/huFuG4SlQyJaz/Zco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154984; c=relaxed/simple;
	bh=Gr3ZIvarzBZ06aA/hIhHDah45dYTNvxfP9FoIU3XW2Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sbRTVsJLHWQRzDk0oZ9wfsBoAwlK/mwBc6nAiX6pHGlG1zb8QnDXn1WaBS/Hf9C1eG9eDuCuOgrKnuLtm4XVjCEWkYEX/XwfGuMGgEyEwpQqKtn3xLY7ynB6hhmqewGeObEMIbUhHeKBV2d6H1DXdc/ij+/DqrSWgH1F+HHWGcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1a62cae05so1583659eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154982; x=1788759782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QHHnjw2r/LtbIszwyBCbLEH/fDnSkP23Sw2deIEo5fg=;
        b=ZPvQU3ZeEdXl0726xnu7jVNHExY6jmICp/8d1ye5nmpdiFLX8zYq+Y+Bqpypzqw9Og
         r2D0VLrt84yyfnkQoxpF8zehGG77ADN1y1nKwCeXw2IoW32+yQJPsm50HaUVrxXT2U/w
         CGrUjXDoMo7os5vZ5ExJRzspwugF3JIi8yFvviO9DwnWtUgWXzxq0Qx2rHtdFccqcIqx
         lkAUPDxlms1OaYH9adK71xJgE4snq3s3COgrPAC/+vAYgYGiR++xy80LmfYFyPmeMnQi
         nJIlZCZA7ftHJImPwtFselGwbx5iy5VIYM5ZKyOo7DYZSAGmzq9Y4A3mk3eYhNAtgh4k
         1pDQ==
X-Gm-Message-State: AFuF++n4cNHWhIgjhEvzDXzvdaVQZ6m02eaVJxPEW+fSCKaydpv3eEHT
	EeB4ESHGKsxRmxPNz3n3yTC9keZvE3EEAQ06WUywNacQOjX8j/9wCrCuLhpZC/3vGeL3Fu+S7Ke
	vpBvgFxaFjWpV+7hAMUrs98+92cnH3pTN8ORHjHguPyiU68UEstj/0l85U4U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60b:b0:6b3:5ecb:9d03 with SMTP id
 006d021491bc7-6b36d009aedmr560764eaf.23.1788154981920; Sun, 30 Aug 2026
 22:43:01 -0700 (PDT)
Date: Sun, 30 Aug 2026 22:43:01 -0700
In-Reply-To: <f1e20018-8314-4400-9c73-d0a3b972eb0fn@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a951465.a8e469d2.cbf3.5613.GAE@google.com>
Subject: Re: [syzbot] [block?] [cgroups?] possible deadlock in blkg_conf_prep
From: syzbot <syzbot+144a1c0e22e53a08ef5a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+144a1c0e22e53a08ef5a@syzkaller.appspotmail.com
Tested-by: syzbot+144a1c0e22e53a08ef5a@syzkaller.appspotmail.com

Tested on:

commit:         3cf7d328 blk-cgroup: use GFP_NOIO for radix tree prelo..
git tree:       https://github.com/yutao-intel/linux.git fix-linux-next-block-blk-cgroups
console output: https://syzkaller.appspot.com/x/log.txt?x=134e6379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=144a1c0e22e53a08ef5a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
