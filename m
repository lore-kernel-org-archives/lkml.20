Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004CD45D92E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129088; cv=none; b=Du4HtIUteo7K5VHsjIiN74mVgBc/U1NkLuqmUMjgCQXgzcN8i09AstUhptJN/aApV8VqKhsjgKej876h69/+iYhu+WucH35OeMTUK/XiU3FjApMhQp1ozWxlMiQsxReu4uWUjCqkCFMqX7/FseA7yMLbwT0Cdfahax/4CSqI0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129088; c=relaxed/simple;
	bh=AhrVkAtD4xDLoxEwCm1NnTa8eEhq1WhmXGRnKyqP0Wg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YGaZALKQNqxBTevpE+uB69t/i2G7xqdWG6EC8P1H2pD14Y/dYHPcSNxSbnWp9JFEgxyX1+gWx9OAuemNI87zU5FBMUM/TZ6EMJkHgV0gNQjfS9BO7BKmDM07GaWL38la4i7wkVBpUwuAweNiTSUlOO+uMa4NI/IcLzM0erpVCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4fa572ba2so517239a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129083; x=1789733883;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sNwKRxstYK9ohce7fyEishGWwXgmSe6DS5doV0Qi2qg=;
        b=Hl+iWg1esqfq148DRFyAWlgq5SZ0AAgpcpfOf+No2FVMFRsrpJ61gVCs6ur9PgWSWC
         dWLQCQdXCusIDaVh0JlAGl8P44/H/d9+gOPPsg8g8WhMpeIyJWwNCWXL2BXa/MGdFjj6
         cPwMRv6dtM4WwUgDCW+aIRZznXuMXyhiKpuqWtfsbE4wpD5dWq2J8Ilma2arq6IDPX5N
         oPH8fgGZh0brIWO11USpLkbe3OdgTIkiK6VPYhsCihjvtmgUuNX1y3Ib/mySMFbh5AOG
         s4ruZUEuXbFrGtBD/KmAkwxOOJXTSgH8FbHdZp98o3C8RP/1dwOhGGcUdN7LZ8i/j4iN
         Dr8A==
X-Forwarded-Encrypted: i=1; AKwUvBxmX+i+UdK0dt1KZe/sz/4/jmBN4qrqSnB78RG79T6o80wbIltQpG+5TveIc2b98eAPz4R8wQw443kmTQE=@vger.kernel.org
X-Gm-Message-State: AFuF++nBYoNOOGlmw5P4LcSmTpxhxtVBNxPwsxeps0LajvuRDil9r5z0
	gvtUyx+51q5JEwQ62IValt1bN2EQQVShm1krO2wA14SJndGmqbusyNCoQAStJjHiHsUtg3e+HN/
	VxZJuHKf0akQ5dGkeuJQCooMBf2jKy9MZF/hETxDKDWPFiuihBNW7JNLubTA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:858c:10b0:6b9:1d72:e28b with SMTP id
 006d021491bc7-6c0bb1f7239mr1813894eaf.27.1789129082968; Fri, 11 Sep 2026
 05:18:02 -0700 (PDT)
Date: Fri, 11 Sep 2026 05:18:02 -0700
In-Reply-To: <20260911114108.855991-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3f17a.6e6c5f9e.28f11f.0044.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
From: syzbot <syzbot+743079a09058321247d8@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+743079a09058321247d8@syzkaller.appspotmail.com
Tested-by: syzbot+743079a09058321247d8@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=114f16f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=743079a09058321247d8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1336ac8e580000

Note: testing is done by a robot and is best-effort only.
