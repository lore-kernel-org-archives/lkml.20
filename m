Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF1388862
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407054; cv=none; b=ilRd6y4PYYBawerQyCo1zo9ke/ozuq1/Qi5CyFhnJ/c84qVfpecEgb1TdfT+OD0r5MzTjgpBeK5V7Fy10S125NU7zFkyM5Ik+458zvP1WSUhgu6XS6VhPkIdFpfY6GilPRqP9mw076YR4Sl/gt5/P1189JFYUkvHJW9mhaMsZwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407054; c=relaxed/simple;
	bh=MekaC/bw2J5PJbLFjiERstmDR+FFIcFUa33PSS6gzWI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dhSUfhGEKIwaaKt6Y2f1IRL3D6K89cKWZprgeth6tLlekDBBG6naBw4wLhZ0gDI8PVbYIaANJyWBt5aEIfr6Dudti0RukXSgZV7MHfieTmo1RQJvwc/5KAuWlaswyHl/cLqCYl14kVuJGNTjliJIYOv3ZrMvvbIaanO6iSIXUV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4e8568ccdso2447705a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788407043; x=1789011843;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bLwrttdEjO5xigp5FT8QRJJDoTnvI7kbhsn3pgHXw+4=;
        b=iHIV0TuvmLni2xVeLm91DJ/SxqtfdkwOmihuhERsArhPxZPGVmySuF9hNTEmetfbYk
         a3R0Ievw2E8cN9632mgFIgsHT4IPhRiE74jgjeRwB8Wl6K2tP/yoUfekSB7qhWmP1SA1
         n00zTL3b/ZPWi8QSvVQgBuNDl9YijZH2qdoo+k+5aN72e0XAgrkiWwhIrjwwYFw1M8RF
         zRAMxm1OUOe+Na1fRfCFgofA197nrDeQMTKjkCuwfRuD45U1Pf1VBvCQzvAGoXPxFi1i
         NfICTEa22FOLhmLJl51g4an7pPU+PqL4aPRAQgNE6SuK/8kdJT4j/gKhjMyjGTMxhrAj
         aJzw==
X-Forwarded-Encrypted: i=1; AKwUvBy5KLORrKEhytHccgXjV++n6SxA4v54Qi9klGm6rY2vpwBiAc9U9wUjWkNntyTXCtdom3jiEh768652kro=@vger.kernel.org
X-Gm-Message-State: AFuF++lde9eoIVEYermPujhk2Ltk07cWuc9UvaIA7UGg9GGxh9h09eaP
	pS9th4eO6D0AzrGy4nhsYrpWci7PGL73On661WFgflAT4PqOya805isfYVLJDDN5s308rrtBXL4
	mAGPUh1BtMHJQLzLgwDswmfb6MFeRQjM59FrWv31JQPT9T5oqGpEsy1+GOKI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198c:b0:6aa:de29:651 with SMTP id
 006d021491bc7-6b48102ea96mr8177101eaf.16.1788407043559; Wed, 02 Sep 2026
 20:44:03 -0700 (PDT)
Date: Wed, 02 Sep 2026 20:44:03 -0700
In-Reply-To: <6a778cfb.9c11d2ce.289b96.00b8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98ed03.2e567484.299ffc.0006.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in al_destroy
From: syzbot <syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, eadavis@sina.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit be310476e8868ebe7a2ce8fb0e7b229535723963
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Jul 30 08:47:44 2026 +0000

    fs/ntfs3: Add basic support for alternative data streams

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17621f79580000
start commit:   73e3f0710014 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14e21f79580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10e21f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9efed59cf70d6280
dashboard link: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1391859e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11417415580000

Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
