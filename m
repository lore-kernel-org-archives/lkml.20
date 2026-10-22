Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681454;
	b=EYiSpdUEZXeTHl2IwQuH6xFYjzUbD89lk+HEk49wlrk2M32WtWQ6P2FTWnft5UEsDjvM
	 s5MQHii5n/EtXZn8TMmZhNhktCNhMsuBvWkNmBcssuot8pf/oexDv2j/g3mDLDKrQ9TWj
	 UnMx5vo6d88O/L9k37eKz7YX59jh4QkTjDL/2EG7K057gbc5jnfbJ4ONwcG16tzEJPWVI
	 V6vPKFYcA2spLZ+15c8AE6mI4S5Y1Tbk/WP8LgulqL3hSec3hu9875m6KCCDPVaJYNZ1/
	 Ve6VywUICcK6ffT6G/S6YaHKYncPt2D3OCpt5n+0xXSVFVDK4w/q+jffSmfQVBNPyPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	b=XCDpkLcyNJx/jQIc3gpEKsHucNq7yhavhUvymD+NmjgHi32FC54fnqb52WfxEHaD1FC4
	 3fdYphp7b/vXL5dr4AI3w079RiRdwySt6Uibpx84sDzeJSo4QseL1jgX7onmKEJItRHha
	 BQ08dYyEZS2OVbJs9jbEAYBWchK9phHyMLsPqH+AQEom33vNm9kdln+R0SCEY2WG+OM1s
	 1O4v1OMsg/Qhpvie89X5zmhW63HyoMfLXrKcMxX/HV1dj90StT0ZMIfTbkGzRv1fvZFvn
	 K27srpskerDfky6RM+ac6IZpYKVbdzEBk8pfHgi4SWPHNHCgu+SD+kd4t5lfc3eRhlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A611606A334
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A611606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso2532828b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681453; x=1793286253;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=b5DiO4r6prTMn4XS0DW72F7wg+qD60tYnyxviKr7zSQSdB+sHt1k/UspK8A5zOUBUk
         T32Pu2vC0mpIaIirek/Ohwdlmx0HIAYQA85GFrgBAVlMjrlobckifb3n7/VUqzUTsK42
         7cy1VnQx+nM9rehMgrMz3/yS9ST/hdrTYytG1Uzy5mGvWtpBqRk61z0AW0LYy7ixGaJ4
         7t6mks7lDHnxMThvX8zAFsxAB7o0P+rkMJtVGyeOjKjg8a9beK1ydDcl3/ktXxHFewP0
         yoOYRISq0Zif3ji0MdSJdhwRGYybE2Jwt4rL1ijy3dP4JTBlhBp94KfPOBs2pQHQ499z
         tMWg==
X-Forwarded-Encrypted: i=1; AKwUvBxg1PhQEJCg8tGL1sc1xrcx866o0eZxwkgA7w9H/SvKjO00R+gdowDTRl1JVTOjXNtP6ZeHdkWMvLZc+Wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh76L0PAWftW6t46Zw3jRz7vb/SEfZR9XjvbDMoacneiMsbjK3
	hSnpf7C+zB4uPYMB2guEd8a6hoAQNLb0wdN6t8+pusA+Vc0ThhWPEhyd/+Mqt3Rv+rkz9wqtefj
	ru+amlOkDsXqU1CYPp3FtSntzS0PASlMd734RcnaLIQwvT6b6iBgJKJwPM+4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3023:b0:4d6:9153:2968 with SMTP id
 5614622812f47-5535b9c129fmr3664151b6e.57.1792681453267; Thu, 22 Oct 2026
 08:04:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:04:13 -0700
In-Reply-To: <6a7aa1a7.b50370da.49fe0.0061.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada25ed.3ebfcf67.79b0c.0096.GAE@google.com>
Subject: Re: [moderation] KCSAN: data-race in audit_log_start / audit_receive (4)
From: syzbot <syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com>
To: audit@vger.kernel.org, bbnpreetsingh@gmail.com, brads@mainlining.org, 
	eparis@redhat.com, linux-kernel@vger.kernel.org, paul@paul-moore.com, 
	syzkaller-upstream-moderation@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
