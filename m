Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031B33A71A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367624; cv=none; b=M7F0B347Lw2i0hhfoGSqzbox5cJyZCgiD0DqDqMG5n6Y55iFa3so0DdykSHwdQSrQmLD7jf3JA5zeoq6bq+WYlx3/7szDR8rIsNmx5KdZAJ8MDo2XY9O12OBMb6LsfrOdWieHCb6H9BLC2XpH/foZ3GYjq2Hh4SbiJNvnAEnbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367624; c=relaxed/simple;
	bh=OWN+We5NsiyHyp1lHtXNvIAe3s/AGDn9G5qTEMP12WY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=gFuyo+u9O8yf/IMBexEKCcFPwUiKyoNCqRYDnjbcve/d+SzxQiPfFZ+/30g2ivWaeJAxdYcvSen2lGvugSKDNBLcXoWXoZM0Qo0Q3P5zrGiBSexhq5rIOjrau2Mk6+0oCvdAjbynLFBq4zn9RvXmOJo3pM1zD94CMNZgN8XpZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c1a8f2c565so2962987eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367622; x=1789972422;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWN+We5NsiyHyp1lHtXNvIAe3s/AGDn9G5qTEMP12WY=;
        b=nvScl9GnEZpRtrfARmXCj6xRnbDzD8dvLFR4CI8fX0Z3yd2vZ2WkI3DkNWY6BX+7hC
         q8CsoWbVODIxcbXvxII3MiidbQria2QKzoEhSHddYahOakkt3qWk48B7/0TXR+jVr3O6
         8JEmsaKrycvSce6CYxZTz0UqNTrtAHhxHPvl077cq106mRL25d0+Rpo17i8yAFUtP2QP
         3LvhPNOwu9NkjO/d8X1Igi8h1OLcGXFdFU6Ar7iZroTZ2Te1Y8YjfyO7WSw9CyCtlP2Y
         s8pNub9ChGcNn4+Aosd5ZCmNLB+P+j5i0c47rDxy34xKOBDQUNrdBWDD2pzyDvHA1rxk
         D3Cg==
X-Forwarded-Encrypted: i=1; AKwUvByoTcAJWfS65l80uKgwxNl+WrQ6AIVqRearrfqp4JQeKuHEWSp3wNGwFtJchEJYflFUXxuE/rxot8CMRes=@vger.kernel.org
X-Gm-Message-State: AFuF++k5dPRmKdPu8D0PXxHrmdE+puXrHNouy2H68nQ8FeMdVHHwryAF
	B2hfwWYwS+AEw2kw5EBHYJGYfq2elyAKZ2To/SUS4QNceM/IJyL7/0tNrMCygAAXpLOPPtDnuhC
	vV3+XudLn1gZg/ev5ch/lBJkDmUWPzfOh4SgVfeaAhniD/q6Kib/e8gVaeWs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f013:b0:6c2:e131:6760 with SMTP id
 006d021491bc7-6c54214b322mr509404eaf.3.1789367622336; Sun, 13 Sep 2026
 23:33:42 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:33:42 -0700
In-Reply-To: <6aa79546.6ade2a62.1c1e11.9d24SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa79546.f81106d8.2ab401.0044.GAE@google.com>
Subject: Re: [PATCH] WARNING in gid_table_release_one (3)
From: syzbot <syzbot+b0da83a6c0e2e2bddbd4@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn
Cc: jchuang26@m.fudan.edu.cn, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git a7b8e876e0ef0232b8076972c57ce9a7286b47ca

This bug is already marked as fixed. No point in testing.

>
