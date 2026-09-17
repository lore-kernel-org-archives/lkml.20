Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B78296BCF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613773; cv=none; b=WBVHNEwVpMd+DXmyUU88Wb/JKZDd254a5Bm6Q6puax4ZRsA0zOlGD8Z3iFTyQ7fw+ABkcGvYgPGdVyOCn38x/OOKNAGcpuWHak22YzvZURy0LK+evQ8vngAPqRqGEzDsnm3AIDLvYKe3ctXPhSgqxV5+D41r3sYre8YX8vhyPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613773; c=relaxed/simple;
	bh=IkN/B4fykzUI1N7eRRWGdLAZEUTAR96FVOSyarHfWcM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tubSxU4HIWDiqSGou78Of6F6EHJeZX5oIl6SDzrBihM7c/N8iykinODjfP/P2pjlPufGg8Z/9r7PUY2W3MpeZET6qHtbztJtnxYWHJk5Nt327lpcl3GNpBwWxyX6uMlQZGk3DExbSFeTAyNLu8jzgHvdGSTS0DEniJyn2V8vKXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48e5de5a23cso680953b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613763; x=1790218563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=91AAdYCdPv8sBQtynSHvr+/Tp5CnNCm1LrT+DMDEktk=;
        b=Sr4qTkU32tlQjD9RayU8u70V/d8RrurvGOvqZyWUWJnkxth1muxj/LkDVK4Nogs7GI
         IIriL+ipKv3YpewkQKn72wsxpFZ7ktTbZqFtmWowO49XsFRfgN9/uqw4R1LzUxHDTKAJ
         kp8vcxHJJES6cI8imUkykj1pUSZu6XKlBrpiLpxA00AjY2ocbc/tdIa4PNFJkD+udmTU
         zzbHAOz3M+86NMdLQZ+SRXxbiyCwlGFYUHZGvzWU0Jjga9vUiT/70jl0UzhrbO/LAcFm
         /RsOKNtFdvNBlgHBp56esmG/ofuZCsybrb5dTbSH8WS7Gx2FvyexpnhizRRuCSsn6wOx
         3Gsg==
X-Gm-Message-State: AFuF++mRXoPdmli1n16vwcGNFWcb3Fv31nDCAhMBAZ2uLkJTX/F6hE4A
	Tv3wLoWmV5XURAt4MbQq7EScprL4KwxWa1u89K791XG7CAMFWWKOTSULHX6wq+Fnhh8FbQz0VWi
	bpKcBth10JQkIExOy5wgDwndwpXihflvc/JUwpNfk/DBfcNXF4cdpub+f3x4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1f4:b0:4cb:818f:d572 with SMTP id
 5614622812f47-4cb818fe229mr2040677b6e.26.1789613763278; Wed, 16 Sep 2026
 19:56:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:56:03 -0700
In-Reply-To: <CAFJkwZw6b0pX7rft72ke0A3d1UauhQR5kh+tWXg9xKT4CDikEg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab56c3.87c06881.1db2b3.0009.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 14



Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17d6b925580000

