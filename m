Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DB139D6EF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616221; cv=none; b=gROLhp/q8Wf7QNThiZrkkuDlg9gOsImjUmzfxUineC/jyc4RIWeGvRgaz+0TmPVpyxP6ToKsiqxmX+W6iPhavT0gwFS9fx1LqzOnRf3tIfTzyI4+Ro+9vFWcYmTJ7MPallzT53u/3bnOHyrU8jH/z5n03BWz2WVFGGK30UgngbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616221; c=relaxed/simple;
	bh=zLxMPIWAXV8h7y4tJ94zoEuUJJB9f+sNCEKwyM2yibE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bRJSqBnT3WBkpePp5OPY9aE9WWmGb9ZnrYHzMkkIDtrjFIfHX/Pu6v1BpbEpMIgz1FkMHGrFkpQcd0O++YvAqX+SHYgK3FEhtGjtxlXuX8QlLW9UeZ3APGr5XZ25hPvPrUzQqidw2NqqmeOgamp0sCkA802IqXydeiPogyzh7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6be260da3fdso508121eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616215; x=1790221015;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zLxMPIWAXV8h7y4tJ94zoEuUJJB9f+sNCEKwyM2yibE=;
        b=V9CUqVzz1P7ZJ0JghHppKhZ8E+j6KJsIxidazpZTNHFd7oGQp+41LGmXw0P58rtz0f
         OQoSv6tQslxmEM/P3n+J4digiOQi4147f+PfbDxigXaxiJsSkwEFiyCYdWiLCvaT5abv
         3OtInhZjC20Iz6swBzI1DyLv6ipNzP00uUEv1CY47+JlLxoULcoSayqYNuehu27Hg+sy
         agYaqP/5x/CCJfz7OcE3VHDKrpXBMAtYdsBj9eb8WP3qPewquVRFCDoXJK1odsoIKjza
         mJIkISh2bOu/fQDZq/hrUeZHiKLcSc+c6iKxFtmDH7SS70ojjOpJX0ABoyxVHJ9JP0dM
         aThw==
X-Gm-Message-State: AFuF++mOlLQP8Uw3QaftDcIWuLBaehK3cOL6lEaX9nOOUlCCJQw1Jfku
	vjA6+NtIuVoIDpKMWkMFbUGIsBnzvg+/B3a1rrwR5nRvogYb2pLRE4MfqiXV0PR0lYQcegA+Jds
	Li7204HCXeqBoNq8NKltnqhcnCG63WTPWBA+scJXgy51Os73mewcD+BNEhcs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca1:b0:6c9:80d9:5e8 with SMTP id
 006d021491bc7-6c980d90979mr374283eaf.41.1789616215092; Wed, 16 Sep 2026
 20:36:55 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:36:55 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab6057.87c06881.1db2b3.000b.GAE@google.com>
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
