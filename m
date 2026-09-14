Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92C392822
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365598; cv=none; b=RSrzXFI/x4aKRxlHukWsqs9YnA0tZTXI23MlsKy9YSXFqYaNBnZ8y771Y5ezPpZGKpv0mGCV+6Hw4QPP9F/wkfyLtMoJQO/bf/uxGGWbD8ByeznPJkVeLleBFrwKdE8isRDWOXYtHhozB1oda1wkxedlVAY5h3xDnpFNm8EoqV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365598; c=relaxed/simple;
	bh=OWN+We5NsiyHyp1lHtXNvIAe3s/AGDn9G5qTEMP12WY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Uofypl0bQsEq31rTVwksgOxiDEMyuadbnQF78AAQ5+leNRRGF8nFcVJ1zUifQTPCl2D/PFi/gxjPuZf8ACJL8YgsyIJ7arDuHZF9XkCgihfc0jLGXTg3Y+UubCx+nQ+yuNqcWAp8z+DZBBycx3uFhWF16g/6ZGjPhwO75QOkYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4566537e644so4187695fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365586; x=1789970386;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWN+We5NsiyHyp1lHtXNvIAe3s/AGDn9G5qTEMP12WY=;
        b=RXsoOkHkcThb50vVwPSPfUisza0mgOBfCcwLxapu2XL7761/WvpDkweJJ0cxZPznHq
         MwCTRLQOeMQ3dbpYEx3J94LH5StSU3ZWQEYmua6n28DTVTeobOCII7VDShExv2fa+vRh
         mcDNplFvLqlwsHKOZCCLBDvy7HrK/ep8Hn5ND+64wWqntfr+/1o1GtCqqg9mDqCEQJ8N
         P4b6zs0ZACNdh2Zs6t5gxsHQJ+APdv5I8SFw4zg4NJJRnYjXDTUZlRD31BOmlNCNERA5
         0wx21ym4+qFOLrLi781PNlS/nc9Z0oEwuc7lVDuKRPJrvwmuKf1qa8ayo/KAwR8YVxCW
         g6yg==
X-Forwarded-Encrypted: i=1; AKwUvBzt/+GOIflQhSmD2+D+OhSsl0UsaI5XqtuESzJFqxLspIcqifx1yIBtKkk8o60dHhgCt/LKqQoV8TZDdjE=@vger.kernel.org
X-Gm-Message-State: AFuF++nNDh0to1euydrZNUyCB7wtdOzdlK8scMUWNEZtiOM7n9+rr9cq
	U3ItCtHULXl5Zkt9e/RbYOeWttp2wYDEgL1m0qQw/tUPB5q1mOaA0ci9xN+xs1fi2PguqPAQlBj
	U19safN6JmsN66DAWAcIcj2nZCcNuiGw0E3a13ifuSmPYAqc8aDTeBpE1sE4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b87:b0:6b7:46fc:1c7 with SMTP id
 006d021491bc7-6c54203ea70mr482538eaf.38.1789365586110; Sun, 13 Sep 2026
 22:59:46 -0700 (PDT)
Date: Sun, 13 Sep 2026 22:59:46 -0700
In-Reply-To: <6aa78d51.2853de6d.242262.a365SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa78d52.4c28b7d0.c1bba.0011.GAE@google.com>
Subject: Re: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+b0da83a6c0e2e2bddbd4@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn
Cc: jchuang26@m.fudan.edu.cn, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git a7b8e876e0ef0232b8076972c57ce9a7286b47ca

This bug is already marked as fixed. No point in testing.

>
