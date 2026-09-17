Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D5D371D10
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614248; cv=none; b=N0r2rLQcbZ/GSboYtOkVHQ6eItEtWTD1XJYYI7bbTMr2Rhh3Fz+N2RasEckU4yeb1NYl3+7oyR3YEXwQJXUr6EXCj6vkUUmpinWWRSO1z9NlP+L/DZn5wbM/o8S99zyhu96J4lzZgo0KxnUfZabaxGwlxKvCLCVAGaiu6tbCWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614248; c=relaxed/simple;
	bh=P76xO90eZRwEStPD3xSfw7NbQ9aZhoCabvd0KiIIDVc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QescxQFXvWWUum7fxY0TH+IRuOxR7m6cgd2tiAR07//UDbJwIC/fKB3grMzmiriOraafH4hOfshXPS1AmCEN7KfvDN2tszfrEE+uvbRdfAEdDXEnWpiTvhjAijvW96EWseRLHrjqyLJtiSK+c0pNabK/LlZk/rtqXH9CdlKxVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab260600easo417786b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614240; x=1790219040;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rz7QuDGKl35y+BiiVFclwvQuIE6OvDIPA+dETMbWo+I=;
        b=nXL8YBncfgOH3/S8qvPYTwyCJvekvIpy0+0qKTgEkv/aSSMt7FgO6q944KNIC6Lso5
         xW8RRflUvCj6bWDlDYk0FYXYh4fDMse38niNoXBjIYkqT459+7UODcacp0MhZHys4G19
         NT07XOxxTpiKla03Jgr9yPyfmB1Fmah5G6yOUbOtATCxWTdV1Smr6Bazc0vdGqtoIPlK
         /zE9nBXkKWUYyE2nJuIGsBuoyPgxu2jjO95K28oRGy6QY0ZjI7IFmLEA98PxXSF7GacL
         ZrXDpNgV2hEENiTSN5t6B1E1K/CzF8Tm/4z4TrSdILQZ2PgX9UxBup2L1K3TgK6w3Hak
         jwog==
X-Gm-Message-State: AFuF++nWnEM4bnRYXHEWtbzrG1aBf8dpAmrVg/coai57/85XrQAur49a
	7dnaS0QpYPPs5+VbTvIGGoc7rcUYen84531/mjFMks/J05O4ntwD/cMeWuU0aUbr2biGtonai/o
	l40oCjm+00ZMzamJkdBUpbr3V0zat1SQIn08dFIsM5wI0poGXEK8SKC39KVo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2219:b0:6b0:ab1f:ebf8 with SMTP id
 006d021491bc7-6c8f8a2febbmr1443274eaf.0.1789614240392; Wed, 16 Sep 2026
 20:04:00 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:04:00 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab58a0.71f81b7d.278072.000b.GAE@google.com>
Subject: Forwarded: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Author: neganhat@gmail.com

#syz test: upstream master

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
