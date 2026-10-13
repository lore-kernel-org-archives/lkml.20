Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB93F8243
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901984; cv=none; b=gH/4YyI5ZrVsXWxmIb2ZzytB8VS3J3dr/I4IIZGeIc+VI5bbxQQsyozeAh0X1j61NOw1mQzPHhbjw8GRObP4DyQm+xAmiQ4rq8QFbSY39wWhUb3Ol9K+HJ2gzNiYau3RcPh6WTCV4SOf/B8tcQVGUqyS2CQbTEmcGHa93q4hABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901984; c=relaxed/simple;
	bh=ZUV/a2dfTN7BghdCW4LvuffGF0AM2klyxM/EZ/7qTIg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ju122NEOlkFIdMxheluQKNN0QZpll4TkgmZx46P5gpTIT3Q9M9/tNZEvPwwpBgxqgqfg450kebcusDMV0W5XXpLycbnP2RWO+qnJdREFjOLwc9Q/C89bawAYAk7rp0oqcsVd5gkX0hxK5p2c3P3uUwVetJbUMUT3PptfLUrRW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-81b20bea169so2437909a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901982; x=1792506782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jZDtOHlP3FesZlv77k6StKAUYgWtgqt/VdXq7ZPJI0g=;
        b=DHY7Q6OmlHxUIeLByMQNJpujEhnlLOyx1UfENxIdSbAHT/Bg+Kg4SkoKSmNaNBYiOf
         gjzo8DUjnVRIoY3sP1szrcWQQRwJ//3lAt70ar26eKwgJHBzCGg1SktT1HlwiW2wWkfD
         R9m/S/mDjXJ70FIMA8VuoI4ivkkDjdwqGAyw4begSqoQDtpX+xAgjGebboDaEIVxeqd+
         dysgsGRtaD1ZYHwcd08onFxtqB1BJfrcZgic5Ho+H6s9TpqPNNczuhzy6gO4jut35RHu
         6TX7nMfKTucHItHLPVqb7n9U2vMwnDIrcYiZxmrTBswW66GGeCWs/1Y0QuOo6B55KxnB
         ehYg==
X-Gm-Message-State: AFq9FYJMxjb892tTpsXJ/m7UEV9F93I84JHd2DsezlgBIB6ZpCbxSJIB
	SP9dCs2gGN6S7b4m5Eu5gqhBl4wN9GuCTzv4ZUfGKs/GM/A2DPDWKwjDt0vZJMWuJsbCEjZ/KSz
	TgWoRAB2+UzqAh5YCAVi7Jy3WXYXjLRjcx6iNu0t7P/n/DDOTVklBYMcHgcM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f21:b0:4e7:a6e3:7338 with SMTP id
 5614622812f47-50c4e68531cmr11532501b6e.17.1791901982618; Tue, 13 Oct 2026
 07:33:02 -0700 (PDT)
Date: Tue, 13 Oct 2026 07:33:02 -0700
In-Reply-To: <CAEfrx+BBQSE7F0fMUXNACh87Or3KkCpE5-Z5qbNqW7bo0q3HXQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace411e.a150a118.27e199.005a.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: rcu detected stall in rfkill_fop_release
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=859f36d9ccbeaa3e
dashboard link: https://syzkaller.appspot.com/bug?extid=baad8fdbfa4129f93db6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13d255c9580000

