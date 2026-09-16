Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C2455185
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544882; cv=none; b=egaCCxVV7j3vRwscLrUemZeh3Y+VLez0YrmvY3U5yD+mxJAvHPj2QJTsWIsEsZsvWHXdbRhCYn2nR1EEhvxjm/QiHtzgQi5zTG03/UulD5oGDeaQS2K7NT4d3SbmlYdwFXhPGW+E0iEPM79Eub3Vh5SKLMvM62B1bVmacNtvyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544882; c=relaxed/simple;
	bh=6NcS2f2Xcf+ygR5FcTdcxtp4IC3vmcLOutpGDI0tgKA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=m9O+py2cCUN+TOg9LBpTFN+Dg8pkQ/wPPnZTwoiGfFxINI2V1rtvRJIir+ByOmRyqhhM4WrujRuUcHZ1z9nlwBeFnb67opGi6bmYleKrnEJ1OJdHdEgIGalIOnvPW6FRBEZ2FVupwBL9/QBdXuJX8fwY71co6JdPzBCSOju4xNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dafb8e1so8215206b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544869; x=1790149669;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6NcS2f2Xcf+ygR5FcTdcxtp4IC3vmcLOutpGDI0tgKA=;
        b=mIQJIukdE0a6HCiLB7xVE1wsYs44oWxpxZVi5bWKJ6b5lsdtACmikjNZuXd/WPCUoa
         IItZjvysbdE6MPh7ZlKSKbExodEjXRQPMrPOQPAHaCN4SdXNRkU8UOpPO9AHA7XMuFxj
         BzFfQ9qpVr+p17OoaRiHO9OEm61To0iG2IHUApREqfKC00q/GDqvsrVFoaF+Qr+u9MCv
         /ZsacGzkVRaCgfXIA6s3fXS0196PW6fSDvUBnxvl2q7H8v8lMDIFBdQdwMx8hxGzsC0l
         jlNh4Fkl1/jyGI3DxXKl67d3MJcUQACU+XxRdzW8PWh2KESZ7pHGL68Y6zZnvgDHmZve
         oJ5Q==
X-Gm-Message-State: AFuF++ltZdW9HHXfjn/5EU9zJXpadE4EdHRaP8RlCs7qyNH3G6rXasAs
	jOfbq/k8nKxeQ8gqfYlTg0T5/GOAjq1uMlwix0U6mIK47PxUbTswFe86ZJ2IvxVAbQ7AnTIi4/l
	Iz/X49g+axXx2SryxRilMHRYCV0pAL/iubSx40ABK7wqfMLbtgFSZMjXpjvA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14d1:b0:4c0:9d00:b46d with SMTP id
 5614622812f47-4ca4a2e32cdmr2207837b6e.13.1789544869488; Wed, 16 Sep 2026
 00:47:49 -0700 (PDT)
Date: Wed, 16 Sep 2026 00:47:49 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaa49a5.a211d2ce.1a5198.02b9.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
