Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E323392D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348362; cv=none; b=LiThXf1KHjtWLMbTqv3ds8WH5/FsR7EGaVEpnqxWoNlc5VU8vejVGtQmT/BCdsupmHQlftMcHtFCBhmJfSXpOVTHMdioDL85+2o9aSAJzubhkMgdvrlyQQUvy6bwWo+ammzzEGBC/UAdxzBTbAvDUTp9m/NrzO4WyvxJVDLK+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348362; c=relaxed/simple;
	bh=fYbzWs1oA6/kOawQbzpkzMcqGHZ76XJX/WB7oqlRNIg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rsEo+3FSCnREizrOr4MWUyiEBxW5+Eds8eAjaUkOtKWRjZ+e0AZXVabhdLMYtgBzFeBooEKoZn/OPpIwEo8E0SyUAd3ipCmKMtrZ2adZff6A3vc4oyU9slkC3SlJlNwNp8oV7Od9SwZSUnBz9AXD1UWQtm39OMIwrYuL9FUDcgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c27804563dso2167075eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348360; x=1789953160;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fYbzWs1oA6/kOawQbzpkzMcqGHZ76XJX/WB7oqlRNIg=;
        b=bAXu/ZxNOUmiXZYpa8Ev6Rvh8/EYshKBh4GOIinVrvVJBG9222Oa4PcDAl/TtfXkRr
         PQc2tvsGjbNgwOB41WgxNvkkqBvjtm/tCsJg+tf6U57rqXB+BJwKrUmxmqb3ZpB5eWX8
         Kusr5G2/GDKiyg2fCBruPqfl45nZzD2IF2wcsW3h/8FxGgoK+7YVJAThyt7e4XaKO+lq
         kqHiHZ0PFXusksz5JJYwe/li+snbGacI1K26egWF8/5AL+XrqcK/pUqoh4LTjEZ86C7h
         Pb19/Jv9E5u1assOrUhlv8PSomkE4jskRgsbw+A/rnx3vKXCihqOyqh+hZpOQBTT/7TP
         ZTQA==
X-Gm-Message-State: AFuF++k8tk3718xFrN7zcZdF1qJT6e2QH0M8EcrDAwPhnrSALCvcwp5d
	ckEddsj+TGxT95d9ZXlLovLS4vhHlVRBKV50qyIBdKEa/KGEBy1A5i9QTfxWoEiohPjRHfx0pDa
	z/W6QcrCQHgwqMVI67/5zw9A/GIj8LLfFdLyvktE3aUFD7JdNGnPVaSfbV2M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:161e:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6c541b4559emr153052eaf.31.1789348360313; Sun, 13 Sep 2026
 18:12:40 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:12:40 -0700
In-Reply-To: <6a81d2e6.9ebadd4d.20b15e.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa74a08.f670cee1.72fc4.0016.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+2442951a6abb004df963@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 958f35cbb8955ca3fa439cd9f2092cb42414aa8c

