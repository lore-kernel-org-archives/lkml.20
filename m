Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EC49363B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390005; cv=none; b=HIJXoTsxISZBg+rIDoYQumjYtFnQMx+j2LmIxdZ2YUh8Pf6XiTSyG225kOCHnn1lgMAGDzGjVS19XQs3WhlBPVkHnH4yyZgb5ittyymBMIdvEtgk1ah+jD1esA9BTf09eKvp3ZSDR1XhAjZ7aqlJTIeYT5wR85sQs7NhU1Guv5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390005; c=relaxed/simple;
	bh=alnYeKs7l7zjIABF2oxQ4+n7a17MQhbAiq6gNwqYJz4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TXYhRZRWs2FJU1azLa5hga1yDMVdwWiE330Y8whq64M6etYNQJ5SyyW5i08F4TpRp6febU1z6NyPpP6S+0kAAOzguNBiu6A5ISZfDoN2vZXnmHzR8oAG8dgiBsh8b0wqGT29sIBTux/U/wgdq6mCuZexs58SUcKT7bQIx6j+/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82274137201so3215671a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791390002; x=1791994802;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0lUkLCT/1DuytWVENcbEg+WuPZmiwqt/Z58uyHzlU4I=;
        b=XEG9SRI0TrsfAvP1alZ7nsFtEiFMg9o7V/BlxYF03Dqqpk8vAT70XO6nk58aX1DVSu
         9+zRWhpeDHtfrH7p002lnZ6igTwaVY70wGJ3TIbzsm7ujx8pDnOaFTCI+b98d8jE13tv
         jiziNHbZ2ZCCoR2xoD4qHLhXFx2/jmX7z517TllskD2XBvXMsp2FumjYUw6WRsKHAORT
         GrBtwQEY53Z3N2DYOv1kO2YdBfxWfmFWYTMM3hnBYe089LNGWo67j4PoM36uufZw+NwK
         isJyDjW0BqGIaCNo+uH6+gM0TRKlJBkLmqIjJU6OpsaxkOZTVcl7USsSXoIpjYq0yPIf
         FpaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGh9AWAEZoYW+GJiLDHKnrtODDN+mBxYxWX4hW+VSziFu04mUbrreIpeYZ5Tn28/HZ9cPxD8NtirKNN1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lUuzzT49uuVR4g62saB4CMv8ISYQn3tjnxAWQlgU0Z4uqQKayV
	COpbo/G88UuHSOLm8m/fqw7kCWASnJhjxXslH9cZxPAnSlnlLwolmWKFqYwios8M7VPSju42B/J
	A19LNtDxY5ma1CoDp4yMgTLmr8uspcrvM08KoUzLkMazVr37NHROl3uFu8MM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1828:b0:4f4:c815:bda0 with SMTP id
 5614622812f47-4fc45d5e556mr3057797b6e.21.1791390002192; Wed, 07 Oct 2026
 09:20:02 -0700 (PDT)
Date: Wed, 07 Oct 2026 09:20:02 -0700
In-Reply-To: <CAOWyW_4nZ214O+8jOkoO9eHq1uV8oOAcR_S4bk031pkTvq+9qA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac67132.a36481ec.1ba24c.0002.GAE@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: j.bhargav.u@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         7b63ef2d Merge tag 'for-7.3-rc6-tag' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126b7835580000

