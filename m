Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF626313272
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146224; cv=none; b=PruNgsIDBtGgJcx4jXJ/30HX7J9unxxgDiMu3pj77hcn37t+X8w5g2EV9RE0P5M3kokrqcqwfe48+YxbWESooc9BZ6mxEgwd/LESB68p4HZQOp9wMWRkRsigu2TjmycyEWeMOGN7T/3Y1AUN76jKZCPB9tMkYYRNqshzMiSzitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146224; c=relaxed/simple;
	bh=j4LRfgPRyD1F8E7iUb8p4dmDq+P57W4p0Yg7jWDWQAQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LnAOY7o/V37ebOJh90T15vVdqMJwArqnYJS3XZ1vnHQKUT04gziII5oMubfaD+BhyNl2nFd6VgkSv06JHLzQODXZtGgpB+FGlzr2gXSglUVanIu1T6uVqJgsEV8+QgpSgHfFAaaMDoqJincqpRAzNuTSGfI09XPWV2HzS7T/2WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2f2b8d88fso5747313b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146222; x=1788751022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mIk7f+7gjABwzHZEU7i3aKqztsT65Mk0YnCftgM7UeI=;
        b=J+GJItj9iP8MtNYH5bW7rxcrWvZMSkR+fI9nyXbZVG6QA6FN/8wr87SPBDykjP3Dxj
         0rgdpPeGkI60LWK6gy7YII1INjmaq/x4HSmR36Qt8bX2bI0XWsS3+OKZmUb9RSXaYcrn
         byTzUMYf0IK/pLJj4QDq0KWF+MZ9LukSl0iN7bwsW/VIHdXVcvNQAB4d8CVJB49cXeJq
         4lKm9RnU2YAyHzVVcL3qD2xLT/5vfXYHNhAGVBSXEc2q4SX37fG9r1X3kLfp3uRVvgZ8
         6IMukUJXJADyC4BZLSVdsFwESi+wL8ONmnffooHKjEzOYVZ8Nxr+GkYQZMCkChQkgXN8
         eEpg==
X-Gm-Message-State: AFuF++n0KhbQipGx2mApO6ktRNXzdNUEUtwMfQCsAbYlpuoeBsJ+4A8t
	fWxY7PaDT6WTd60isU5pBTW+mMm6xtEM23tPWGV90JGBboK37q6AfjGFRyEDBtHhFDiUBjzAzrf
	F9UFMHxf2pB5lKANYxto1FLXw6rrJ3hligr90V+cVBiLGkJjy+V4WB/Ymh98=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1523:b0:497:e7e2:756e with SMTP id
 5614622812f47-4b5b14d8e92mr281026b6e.13.1788146221899; Sun, 30 Aug 2026
 20:17:01 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:17:01 -0700
In-Reply-To: <db1a2ef9-0e68-4461-8fbf-b4e37093f24an@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94f22d.4d659fcc.734b4.0041.GAE@google.com>
Subject: Re: [syzbot] [block?] [cgroups?] possible deadlock in blkg_conf_prep
From: syzbot <syzbot+144a1c0e22e53a08ef5a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         cee9395a Linux 7.3-rc1
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=144a1c0e22e53a08ef5a
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13558349580000

