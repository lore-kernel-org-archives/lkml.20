Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E40312815
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163944; cv=none; b=ei93sCclxBA0hEdQRE/6oKL1s/4AI8KehjpNVNJ+4IQVDwffajuS2O/PZSnDIzYH7m7QiL5rnfnvD5sJ+u0WFz0TpWzwgzOTxOLCvQsONyTQQN19+Der6xpGT+Px95Dyqr38494fFson8QUDrwmNt30WgLSo3L0CwfnvvhCv2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163944; c=relaxed/simple;
	bh=qxS5M2k++06YeBVAzqRMK3ua13m8+IZtU16V1iyrUhc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Q2W+ZFrqgH/L5kZpWxXz/2fX9qz8DY/emwQIUta8LW12pjUyePcM6Um6GLO4Q3DlwmaBg9LJEDxc4k+6afhU5spXPiuechqoi5FJw3OPQIr1P/QqzVcWCqQ44/Ti5IC5xe/cJgAxDT85cRNXs0nO0S1aIKsUrwyTD0/tMTt1B+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4d2f0f77124so105199b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163942; x=1792768742;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YpKLujLoR/OQ9GnkebgU1r1DOmdOjHovwFu0VT7DXjk=;
        b=Eg6LTYJ8iyPLfot971LYEStYk21z5VDZhFmNsAjq6LK2yoszTvy1oH1h98TdWPSwbI
         FbuYJLJrXL6GzTRRZYkUvIPykKVs0QCeiZXl0VG8zA0tMAFRKT+mKXbffg5g4evb/Qtf
         yy1ArO1dpQ5WoNm367iV/ooaKE5O06aGaegAyiczTaoluie7ARtiKSwyqzRCDdipiy9r
         kRNadKCwfesZU+EmsF2kKT2TCck4oCYatcsT906bJ0fDbZY5yuWZ3DqJV95r8Ly4R1dc
         TKfVKtrqt9nFeyX0KGUF7VhJJqnOyTu5wXvWLb7tNTexQVk9MF3TDrqBpCsOhLtcJCcV
         7Kag==
X-Forwarded-Encrypted: i=1; AKwUvBysp5ncX/3ykiWnV+mH/8A+NuR4pspjGh8lem59X/wc236tfs9og/Tr+sc8PIcMKV/IFISZ+v+6vIwpRNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbvHyJ0Cmrz8+wEbecQkqsCb6v9dV9s+KNKR7kJaS8pK/gjZsD
	BxEI3Tts3+rSyH0eYMGHTO7BmZzdQj0K9Wn3AXLzUAU2AJbQadiao3xNxSJHZ+esNrDMgz9v8wz
	p8RcmwG7QP8De8APXwEFWqI5PTWL6eRHOU6s/xg1b6m1ctDJAaFo4kvAVkQY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:3d9:20b0:532:4867:8916 with SMTP id
 5614622812f47-53248678a1amr3661651b6e.4.1792163942047; Fri, 16 Oct 2026
 08:19:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:19:02 -0700
In-Reply-To: <20261016144050.105317-1-deaner92@yahoo.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad24066.7952420f.283480.0349.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
From: syzbot <syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com>
To: deaner92@yahoo.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com
Tested-by: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com

Tested on:

commit:         90201351 wifi: atk9k: Revert "wifi: ath9k: reject shor..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1094618e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1422747690f83bc1
dashboard link: https://syzkaller.appspot.com/bug?extid=5897b3c764f5989ea942
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1277518e580000

Note: testing is done by a robot and is best-effort only.
