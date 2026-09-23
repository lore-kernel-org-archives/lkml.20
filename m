Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9314568533
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191658; cv=none; b=Ke0zcqkcllPZfqtA80KoQKqIonsiqsg4n4jxjYYz7OdsgDM+tJeur0fhfXUTbUKUxLsLwgq/8p5C9/AVfEhpBvWn2D5yq4akNpgfAXX4uu++04OI3DZD4qUOGN37+iujJV1ycn0lKdSDHiax8sVZpUC/8OzSa9ITJaJNgWgiapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191658; c=relaxed/simple;
	bh=Q7asY1vGJM97Y+JuQxO4zlM0jA/hyE4FgV7ZVrsmr3Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XRGsS9rFJmM0mDSwuZQlLaViiAScRkA2U89p5BDLCgkN/k1Yv23FgtUoeHDWN7Gm4sBn3CJCh18akEUQ4HCM5HS9PC4BkUpGGE7vKh0GJoJ6/9vafm1AeyRqEidAOCAQ9TktBTNXXi/I11Wn3sDd12UpBjfngdBjAnj1LCbFS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6d0a129c619so1757887eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191655; x=1790796455;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q7asY1vGJM97Y+JuQxO4zlM0jA/hyE4FgV7ZVrsmr3Q=;
        b=j8//HSmxpjKeF7fqcL9WlSCrhl5TVxq+nBASzUvZIXvMcGP20P/FhOeBZUFu71B1LZ
         p8BfLthvcd78/afFys2CcgRWZlSJyICd4HdsLHazggfHWTwm5pDl7iQzUkT9Gs7v+V20
         MKTzvd6z9KdTY1mbZfhIbjG6orkp/vR1JYia/FL5sb5rvOU80gMIuya1LBza8w7ZQLzS
         kyTrzJNUL2GLrtYPOUzW+XL2Rv0SxZQA0lk3ebV+z69CGtRHKxkATAoBzM3U75Yzr1OH
         4Xlg2WNVSXAPfqCQDsaBsJ81XaPVKIKWbiqWOmZlNwK2o75/KTn2nUK55wTYgYU72soQ
         f9Iw==
X-Gm-Message-State: AFuF++k+HypvgBs6v/Llcx5UQv/H8M1UzNAwnX8RyIfPrDl5TNg4hMdz
	NtVLmrrkl6esWT4WeZLYlUC6vVpHQi0tVvyRY68EA0310lkBSe3K9dQKYlWToM698ovreeHotRk
	HdomYN26ZLcDiiw0oMP12isYym+jUmkeII6HDA6uSnRcn50rAJ6I4HFJ1les=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e90c:0:b0:6c9:d43e:a703 with SMTP id
 006d021491bc7-6d43f4bf666mr262508eaf.33.1790191655657; Wed, 23 Sep 2026
 12:27:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:27:35 -0700
In-Reply-To: <6ab152fc.71f81b7d.15fa6d.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab42827.dc2998a4.2261f5.0026.GAE@google.com>
Subject: Forwarded: #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 master
From: syzbot <syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
Author: valigurasm@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master
