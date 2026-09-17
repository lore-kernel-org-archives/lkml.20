Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD23334A791
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613672; cv=none; b=JSbHvQHkLlcqLjAtFwrizxthvxeeLNwkPK2ik2XqMFPOuyp53PNKNUCJQeCu3D/IaYwFWQdbg1HLkGoCWuUCERDW9rjw1m/w4sRTZ3Cixe0yzYdFmFBLkjKOfJc81WNOgcXPBz8uqAoStAXphPAQ1HidV1EwagZutogKOQAzNiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613672; c=relaxed/simple;
	bh=9vMCR56ARYZ2B332PEB13Aimy0Zh1bvUNn4SyoD1c9A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KqI51cm3DBIVvNqv7Tmw3qWAwufWbzmmoUX39oBOgvN3m4rFSTutG3dZ6PGBee/TcFFHiTylsihlipNRS+RCJryOGLmuOiqeVD980pTJRuCYMXh/mRUon8x4E3CchfHpjmkjlCFwAwGh5qDBsj806ntdVd5wOPeAE9aN1UeFGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bdc0e8af81so426590eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613661; x=1790218461;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RRScqn2of0yoWLmH30hp11yDVAViQnVBcWO4VXKwdIw=;
        b=wG7FnQ5LBh7xASAWiesm+KGp5eaD/wLbEJbvsUS6pyfomoIJfk9W4CPapCdwqBwtmV
         IFK+XvkeTl5hCAPIHWMFPRBrRJG1+neyyNdUtdnjgpLSlDtAlDw9lWS+6jINVcccjv1m
         v9eUP4TmnGrfM8Ou03b8ncMUWjgR01wGO3rQ+dTT6Wv/j05Csq8XOLTyUdT4BmHO9iSy
         IIvE5IHeI9ctXuLJK1UjZICzmcX7dML4i9csY8xRDAHnk+MW6bTBtD7XKS7LbOHtD6hy
         Fmt0YrIsayj3r10LGFGUM9k5UsnBRBCe2lMtRk5Ub0nzbwOHaHuCrtrN5b7lTWM9mkOi
         hFtg==
X-Gm-Message-State: AFuF++lbff0Qgc5tWinJYi2aKpPD4bJlwlfTdZ7zIhZKKkA3aiUvo7Rf
	nwaYQv92g9d0/rv9NefDy32JHJ++Kw87xfn/y9XKfwUftBDuhd6WzFCgb+Vz3wbAHn0ZO9EUONt
	NYjxf2nefX3SQgIdpyH5UFD4lE0lkzgpBS1DifYQWYIRPUa5uFz9dEQLt8j8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a3:b0:6aa:cce3:ab61 with SMTP id
 006d021491bc7-6c7d1bca6bemr7262691eaf.9.1789613661412; Wed, 16 Sep 2026
 19:54:21 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:54:21 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab565d.71f81b7d.278072.000a.GAE@google.com>
Subject: Forwarded: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Author: neganhat@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..3baccd4143e8 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -124,6 +124,9 @@ ecryptfs_get_key_payload_data(struct key *key)
        if (!ukp)
                return ERR_PTR(-EKEYREVOKED);

+       if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+               return ERR_PTR(-EINVAL);
+
        return (struct ecryptfs_auth_tok *)ukp->data;
 }
