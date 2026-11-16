Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826149;
	b=s5trkbMh54ycqLok5hJAqylx5jWrjKdI6bI0LaxdpLLjWfIK7ijI1bJx4ZzIxA6KDXBs
	 bPM55m+p9/pftZ3JY2CHZBL59I9wSmH9cGwTG8dEMxRCdDrCg3U6YTEttRVDoo3cse6Yl
	 gcOBgcAZTU7gUNTS27ck2c0TYDuPz5K+5vIedGLYVzmOjC+qZoK6wRvi1DiHN54uJbYIG
	 zJygRCyd73whOF4bgajgCMqolJp9WhYQLHQioB/hyncFkTONj0BaC3OfKoqVW4s6145Ob
	 RmoVROeRtGwZ3bMYi9nIJJF9re2GO3421sXkLZJNzA7EFmVgl6jW21xTuKjj67l/NoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826149;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=oMCY1+TLumbzJdEwjex87GQa45A7Xv56JdQnlUElpWY=;
	b=e19wVBr0HoD4ANlvPUiFLC1o6C9fQ2DRPqIoDV2g3jviBHhizxAbIE3XfC+VUIBnRpR0
	 nm+Um5PsBpiINhqX0vxoslw3u0QbhpAl1aCxLOGrr7El2LNutDAk3Eqo1arSrXDXBorHZ
	 QLVkPA0uVwCyMJ0OFyKfg/xiQsTA6mA6I5GJVDEFdSYsdGXSazy1O+jmZ1EHN/QRZVUVw
	 T5tCPygaL4aM47x8yuPSHI6Hr9EjCA+6bPIBmUNHRy2MiDtfl6VeABHmVbwxLwz3YAkbM
	 +he2bem1S1Zy1AzgO3TDfjO5AXk+HTVWiD4ynaLVUgYOZMmHd1T+n6EuheZsCpKhJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A220606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A220606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85d630e451aso3906773a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826148; x=1795430948;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oMCY1+TLumbzJdEwjex87GQa45A7Xv56JdQnlUElpWY=;
        b=fg1FoY4FpraGzvdQI3mAB/9oCt6yqe1zZ/oG913pwfoS2UX3pM+Nif6pCXumzjAZM5
         V3fFNLff64hrH80gFETeI8fowDGvksDXcyPUOUgsLmPuJ5fEg4TVcLlfBg5Vo0Wg8NIV
         qpAZK7u+usNwDd+ZraFTesPMxtF2DkFCsg8+EGuk68aNGwEUiErIcSsWf7NXQz8Nhfmh
         2kh9Up+M7nlDPAo2eflO6PBCYeM4LJMZ1AzXqF3uqLVyzkh9hKlA7W+Z8BOPYYzZXyKN
         U5d0XuJpt+Y3sd+/JxaSrwZmlJX5Vc/AG/xnLjdjr+zC8roNZR11T9rRe8zwFVnU6nKB
         VnDQ==
X-Forwarded-Encrypted: i=1; AL+hErHQKRrXJQYYdcksmzz1r2BKZYSMx5tSXGKd7/eAyju6lR+nl925+jgCPYuXmxbvvCYQZp0oNxnKwrJivVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z89OmBJeyvi6MGz7SqRaUZzltKyVovUDMLKnO/lLFE50AAO10A1
	Q7RZxIHFjLFA0VpxQ26PKHHIlb8faeBQwV3jHGWgXqQjehB9smKx15bXvVrgrUAxej6dpqYZ6O1
	3iY+1aBHrIzxq4xLsdvEbjmQmx/WbasMwFIS3EPNLJTufb+hQrm8XUVJJ5WY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3d0d:b0:571:76cb:b4c5 with SMTP id
 5614622812f47-57176cbbc56mr5542769b6e.2.1794826148648; Mon, 16 Nov 2026
 02:49:08 -0800 (PST)
Date: Mon, 16 Nov 2026 02:49:08 -0800
In-Reply-To: <ebe5bfc5-bd5b-46ca-9c00-e6a9b2919507@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afadfa4.78cd6c47.117a81.0028.GAE@google.com>
Subject: Re: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 aebb7274476403040d582c61478df8f4a7bf9cd3
From: syzbot <syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru
Cc: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git aebb7274476403040d582c61478df8f4a7bf9cd3

Command #1:
Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

Command #2:
Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

