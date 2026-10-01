Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DAC37C916
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862609; cv=none; b=TjX3kTyYNtJPg6l2JvT2rknttKrMGHqP8GVetoIg5BBIhWc51ydQT8+ZpTCc3kzV2f+jjwxr8XOAruVCYR/XYoX7EDLJzqwm+y4qjzTeJFbpb9ESTa1IDB7SjD7IwiD60h25LrJ5J6e3XBKiRhKjCfIKY+S97NSrb2wVf4ccsgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862609; c=relaxed/simple;
	bh=+WcWye/k67pxeRaYkziHGLb7zUPuLvcwqZnMB9bPEG4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Sn75CkaeJMlg4i8ve+eA8bAD61+0/gq9+IVnzt/PgprulvSFVRds3ocYn6tT5acgl3NKe9DavFrTFP6gnCxKiTJePXm1ahoIQ9JoEH3w6T8VWh0bX2I48YE6wXR2cZm5MKEQo1pssDMLwmXWFhCdO3rQ56tchNqvl2MHygJX5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso4325602b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862605; x=1791467405;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XmlYYCHZPqB+axJXXIS0wnEDQ/N1IVWUVhRzCFxAAcQ=;
        b=wgBkWkavIz39WPCD0286r/9AKwhm+QF+DV1oDisEcVCmVfCcuZKDKu6CPoIBM5QzB7
         vzar+qgwZ/XKQbnrGzxev+hdFKGlEZWHWMTUcgyn2PqGg2PQVOfXGx8HLtwVWnpUQL92
         K2StzPc2ZjbxnRt2xTgh0DdPVyh6jPXRLmHo6JzxLy1CzLSG4QRFdTiqaWLo4CQWbAWB
         +AaNNcmlQO/3PbopwHXlorKhdnt9VoplL1uVXCPCM6wVIWPJCmT4DbgMvfl8BJjvfs7N
         StH0Naur66USAZLZE7N/qkbtgl9hNy/QPUCtKuDdLf+e8Yl08vEmKuyFDIhJvet474HI
         J3Sw==
X-Forwarded-Encrypted: i=1; AKwUvBz0oSdVVaoelE/Zy51eZQRjSfWA+gvLROfTLMFbA+lH02Q3R9JH+WgIg0wOq0HNYE7KI22pyNgGhsmJ97E=@vger.kernel.org
X-Gm-Message-State: AFuF++nTM7b3s1pSaIbjeEE14T+j9QQSDchmAwwHUrJ2Z47Mve0a2kOV
	7NRio1YBMyenw4HTVlqdDjFDtciykSTn9MP5vNaJNQVGmp20c/L8M3uN2HlX5CdaSTMNHFEIuvE
	d3CDAyyos5kIxnzpJxoUWIDUVr+hsR11gpgvRqHt+K39ZVbPH8xWEsyUxUsc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:67c2:b0:4b2:b653:87ff with SMTP id
 5614622812f47-4f1b0043425mr4981304b6e.7.1790862604775; Thu, 01 Oct 2026
 06:50:04 -0700 (PDT)
Date: Thu, 01 Oct 2026 06:50:04 -0700
In-Reply-To: <75a2adf2-8d78-4719-96dd-f86880c8c36d@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abe650c.9b478af7.e8d7a.0003.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in mxl111sf_ep4_streaming_ctrl
From: syzbot <syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com
Tested-by: syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com

Tested on:

commit:         551c722f Merge tag 'rtc-7.3-fixes' of git://git.kernel..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=160c66c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=3df044e20e6ff1fb3cf5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b693f5580000

Note: testing is done by a robot and is best-effort only.
