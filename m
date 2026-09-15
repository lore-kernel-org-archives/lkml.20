Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62C392C2C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438145; cv=none; b=bcnpB0wk/ARUdYkokn9BrJaEy62VNeDkQx9NcvmUJJGZ/BVHokdNMCOjnMQy/pc/6ZFCBCWNY0hrZPiP0vqa0HLEg8uhv0aXK9+u398rqEeQSpX3cQMQESQdudml63FJkpwoHK/2kQbPUvhjyIby/zyXxWnl9+6H9XmGOZmm6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438145; c=relaxed/simple;
	bh=/8XY+eWMpVngK9lQEDKNze+V0vJdy19afk92dN7Fm8Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O9MB5doxFY2GjobqDr1hMnAJHqdHnL0RP6cbnJtxr6iZlf3YYUVIZpEYd7c80iYqkm4neJN/O5uR/6jVd08lG1y8+mQGEod2pLmsh4atGiKwsQFe4AdyOg5BvbbSaQE47+6Mio1isDiwOhiubzhfFeo2XEAj0AqdqmMZgOCOOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e99ff505c2so5791915a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438143; x=1790042943;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vt7JG9ku105zLSmJ+2/xkwrMx9KPxQwknGzaCqAocKA=;
        b=Vggsh8YtepaDdZyGtwKqMAUcnzzYC8wq/wZ6kiU1eENbR+KN4AAAb+XhGRQJ7RgQvL
         mJPSFS8aBjG/ZwTKla3dZ37EvxNFZpdBtOtbfFX4ub3K7KoOIpzxS8AxlXLRFPgVQJ6j
         9GP5mvzNuiJNJOBcIEdX7yUGOp517Ml5vwtrA4ikfUg+GqDWWGWwNuHroWLdzajkDUQj
         RFs+ysHXp9lqrJRDM53ne9ypSwNTJvhKgwmbx/7aClL97hObnUDT4Lc0vMoVmgos4BE4
         EAZfYvUnrKXRISUA/uXgKi8Lb7RMka3+0R/7laacvxsYISttnd43IOKOTSSrt+S9uXzX
         ijKg==
X-Forwarded-Encrypted: i=1; AKwUvBxPTYMdZWL/n9i4OUDq93sdV/HWPlHwbZ+sn9EPVRdbb6zq/PbkGXrcdH1nIBXi0d0k1HHCpm97RhKsTXU=@vger.kernel.org
X-Gm-Message-State: AFuF++lbzS73IWGBugPNHTAwlRihM0hX97j2w1+FucNeBZqXqU98WkAd
	as1ivpAv0Lpm1/dk9vQ1z0qB4GVAb+O9J/PPMSt233VO/0heMRz1MOhTqqfATX1U7z+egWIPBpw
	ve32CWJbBMPdO9DtO2S0ZJ6kGAV/hzp8qWbO0BpEdFxiPUFZClGBEtT4UfLs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f028:b0:6ba:5d2e:cdbc with SMTP id
 006d021491bc7-6c53fa6ede1mr4995663eaf.7.1789438142990; Mon, 14 Sep 2026
 19:09:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:09:02 -0700
In-Reply-To: <6aa8a198.be31eec5.8c4ad.050eSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a8be.f81106d8.2ab401.005c.GAE@google.com>
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

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12387df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=95fdab36405e5ffdb680
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=125f2115580000

Note: testing is done by a robot and is best-effort only.
