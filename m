Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED312D77F7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349888; cv=none; b=nNZe8rguEMVTfmC5PUizimNycN/IvUeW36G3oQP72sczhVTIFhIU6iN6dPffLhZTbtLUqk1LwAMGvAxTbveAHKBzhUwJTkHXGRA/u7PRPmkrpzI7bq9A2flxMYwLtPKqprElglWYGo6ZXuVty91Mt6JOy9QMq/1vdbNUeXgt79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349888; c=relaxed/simple;
	bh=pI6a4tIZb7jkcqs3TAmF7oxgIvVcGiNuwDy1rclUeaY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J0QvV8D1ZtoqS+ODH41C/1QFhY/g3M4CHvudJ0/Y75ZYhenNISltSL+lXivuaiOD87JAWSKGkY7c/zgnhUTKOE1O0WDIyoIBU5GBy1fVYOrZpwM3XP5G4Rvaq8UlBeS8HO0AN5P2e8J4fkkNPLaVmocova8X2O5DyzI7SAMeA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4519ef1babeso2269573fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349886; x=1789954686;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pI6a4tIZb7jkcqs3TAmF7oxgIvVcGiNuwDy1rclUeaY=;
        b=Btf6JVzCphEd1Rtlu6qVQ+wac1RtHkdMwjx/JLPQYVg7qUfq8BViKrF49Cs1vMdiyY
         W/vSFZikDFfstCGWu0bu2j6rRinuAf/udxLSlPixAcbNHW9/PjZWb651cbb24zQUJo60
         NF+TbxWSK+yMXJXF+FFdNbqIlyKUfXZYZrV3TAHccO8fNniIBp0DaZg35QdCBKcgZppF
         /8zVqEulVnQNPyNw3FuJ70dp1xHzguPt2JqfKllQ2BOy/SFkXSk4LyqDFq1LNkJja8RK
         82Wqrteyw3PdLh9aTjQUTPNFAIBhv35UNIFz4BHMdA5H5LcJ9JOjsjjBIpYARfSv6kea
         mtqg==
X-Gm-Message-State: AFuF++mm3qA/q/SZDgfBU9oJdQFjN0dGY3uQYsRmsjb42d0PwNU6QYyP
	Os0R307VZb7ia3hROnk+UH5VwTvB0Rvk5Cd062I6zQcmpYhc9881vF4jiYkQ1aYZKxbLpSJm9a1
	i1hjJFvkDrx+x1XT1lecKzUQN2c4tdwHiNRObmpPdBmdwxL9tZjU4X7l4smI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc1:b0:6bd:df1c:23b1 with SMTP id
 006d021491bc7-6c53f74b918mr199269eaf.15.1789349886410; Sun, 13 Sep 2026
 18:38:06 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:38:06 -0700
In-Reply-To: <6a6a9894.7eebbf3c.214d51.000c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa74ffe.4c28b7d0.c1bba.000f.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a7c1290eef60711c10289c056ad32ed1f2b47b12

