Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAABB48095E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849465; cv=none; b=I/ds3SmLRotDdsh0VKHQgp2PUJ8z4LHAJmK+X73j4vsHNP4xaONIXJFtP3J5XJ8bnyR7ZS9DFE6YC5un5Gcv1OTD4s/ygaO4I4IxqUzHga9WlbZf8CDGTiL4hMKcPDUi8/VVkhAypMbs9dHjgfKI07TY4ulyT9zjhA9zMIL9z3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849465; c=relaxed/simple;
	bh=tFLQ3JuBry+GrFMTvnvNPPyuCdQR6pSnPsQLTnAgbCc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=exrwFLFkCctACYoyegg6Lnbt924iqTvjVn1x9j/GQBA2zihr9veZE7cJKM7xbURlRJAX6MIe/weEFnxz7g7NwVcoi6OaEPJQL86md+2yE0hqJyyYDMkpQFGTjfFG5+2q6eKzao8PvmCnQ2j2zVeFeenkqIAu8xftrXuS9AOet/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb641eaf5eso136844a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849462; x=1788454262;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFqjgAYe8iCKJQKyaWMIcLe0u+fWcArjSHpg11702jA=;
        b=GLjGB6UnAmTTP2/v5r7psW+oq0YXxR1dKuas2g2ThmHxj8hOOg8ObpZAO4Z71Ys9N3
         2+bGp3xnJH4Fhd2emKGGc1+JtEKMxaDZzKyF7ZWdfzgCwfDOuarSkAJOrpDV4IhTCB0G
         vfJghHKAIrkaT5w0v6Xer8sAnBaUCfitTj4FVLixuOVJ2ZBMMgCyyqaGhV3Ee8rUsCQx
         RnGWmf2XNBKq20oSxdaCe+M6ICF5VXHdd0Gwoc9Ztf/ILjMn2wSMIp5l0LF8mTph/yLn
         hbusqUglY0Kv5Dv+Z0T7lyzKBakdkWVKK7P8V4KTPThGSuHiX1D5gEpQGQTpegOD7k0Y
         M75g==
X-Forwarded-Encrypted: i=1; AHgh+RqZA/z7tuUg3F1265BgSvE6Nvqrv7Tyfo0sXgxI526rF7m4usjwWn3U4sDE75vNCc/4na/TYotsCOknb/s=@vger.kernel.org
X-Gm-Message-State: AFuF++kM+M2Cr233vdVZYVsj9cKhcwaL8ShffCT5Gfc/kZ5pg1O9w7gq
	bECKkQvJ9NudkxihX7jLzuNrC19z9Na1Pw1xozy2an/f9PKLYA8uejl1su/0ALSQjQg1dwfshTZ
	Gn3/D3y1GlYx6NsMkMd61zpylezipCK5psoo73noGJJzUVd3Yst7K+PFVsMA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1627:b0:6b1:a22c:1f12 with SMTP id
 006d021491bc7-6b1a22c22f3mr13088461eaf.9.1787849462373; Thu, 27 Aug 2026
 09:51:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:51:02 -0700
In-Reply-To: <20260827092301.19883-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a906af6.4d659fcc.734b4.0011.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_open
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: jeffinphilip14@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 12



Tested on:

commit:         903c1cf6 Add linux-next specific files for 20260821
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=61cbaf6d30cb97db
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1513b415580000

