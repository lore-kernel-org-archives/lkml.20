Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572067;
	b=w58aUA0FSirhLMNVWVTc67IH3XoZbCmOwwNf0lEqI1li44W+cZeafO1+xtS3TyaFVxc4
	 Mg097AEC+ItNGf4pa18GfxrI7MM+JbJj4tPDDhI5QGKFoSCgfA2wi+n2vXvCQ2Tkph6sZ
	 lzxEEg/bZlTatmwhm2u50HIT2FmA0ItW/MlBtYAVN4dtyQypDKOFD9CR5PIaQ9/LVJwb7
	 u135K6tAOhf4RaD57LHXLBOYNteHQ5ZEThXGOG/yKN2GqPE6hwVOfJVZnCyfnG6ieDH9n
	 64wK5wco7xW/W9xf0Y0sGOrWSNdL33nBsxzvuV0n7hNCxwvlyTq2Ht1jHqQ55xmsVbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572067;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=W1ga9dSqSCIvVDilXp4fc5dGnbugKM5WamFw/5iafy4=;
	b=ffOzK0rbv04PF+z88DtsT+AlWKZPRx+aX1+tfYobtvNi1P01eXapqOXdiVX4YO3culxE
	 GnX//yhdSgQHSjrKOR05wVkVJ5zqUBQWCkzIaiy7Sy437R6cs8NjCMF08izIXSbfOWKCA
	 XNi9+d4aKewYf5bUdCf3o2CpIe6TnKoJyD0PdMrccCZ7WVMdFkPU29HPkJVj4M9KN7u56
	 A2bK07KLZuxQoauy5Zgd9ccJh/9xxsDqDmfvu9wpSVhJLqr66zXkTG1AA2w786qrC8Az5
	 /MAL9PaZGbAeA3yOXvKg33bDs7pSnm92uSuASU1lU8FVkkHH42BW9Txks1eysJtyCOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so761206b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572066; x=1793176866;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W1ga9dSqSCIvVDilXp4fc5dGnbugKM5WamFw/5iafy4=;
        b=aot19+q+cLTX2eI2bEgbkbaMbADcki2M6R8YS9ejb9zg9JnfJq7IIzBKfG2IAIZGfi
         oTpoEvyTEDgls8jroNLMD7e4c87mhcV9RfzmBAppkBhw9SJSSUHoj6MZIQ9EaXSCijqM
         uW3b5zsa/bBOf5vLnbfr7eiiobxwBBLcKSTNGroYbYJ85cr+d08H9Db5DJ+L+PwrAUXw
         xvJUqwTSfo1kDQU0K5kO+AwNamCDv3m2yK6a7KfZ6y0XTI9mUHkXMbx/zkCMWXttiUYo
         tFumvp6puu/nU+pCDhCzTBt1WLq1KcNCZobfX6fWzwEPYlEDTtlRKPGrhvkaUvhq1SnK
         BpKg==
X-Gm-Message-State: AFq9FYLFE8WJtf2HBg7xCEkO30tRrxw+a6NerLnI89s8kIl9Ifa5wMyk
	wwMAScjxNhkiDvnRxflJdKrz7P0CW6AJQZK2ZzT4qOo3cJyuG1cbKDOLfkJs71N9kdPjeOyCc6L
	1GJkwPbX3QdMz0gEk6DHwKpb/12fO+aU9ByTMGfYDiqpIb9Wse91tcVETEcI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f62:b0:533:72c7:f80c with SMTP id
 5614622812f47-5536226f6d9mr899544b6e.42.1792572066024; Wed, 21 Oct 2026
 01:41:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 01:41:05 -0700
In-Reply-To: <6abfe679.b50370da.302ea9.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad87aa1.bbfe3b82.1ac288.0000.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read
 in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
Author: toke@toke.dk

#syz test

