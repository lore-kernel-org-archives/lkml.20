Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33513BBFAE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146881; cv=none; b=rIJQBnuMbxtWC3z9bsqLJ/SDtge9HOdWafJjlJ0ctMzQRqmAsQWHqrwgfLSfpEXj7dU15EMLR1NJE6tkAp76dmOBGmbbA+Rqx2gS12tmL0mYGtl35Frm7N9j9kb1pUm8nUV5KxgDF5c1yMd2ZktGSzH/6w6PWO03k7ng5rgkQnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146881; c=relaxed/simple;
	bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=l5kxqriY9oKJSqSRpUgnkZDS99ubXQLEPJQ+FPEYZCRiHEucddrAfVT6xD9QI5wIWCQxjujp8jJcCyyfmL4p3WVdieYFztjMDetU+Wcashf7VssBKELIOJnfB+GE6nHwiznBLBhWc0lNQgy8NRVY8lzMcz3Qeaw4gemPl2K+Odk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-843cf077bf7so278108a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146876; x=1792751676;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
        b=pmccjsl+ceC2k3vgvzKhJDHHDobOzp4uDoZjmNS2r5wCT1weVJGfJDewr7tm+Aja3e
         ydiFP9HKo+/y7n5dxIurRV8pX6vnfyeHymnOSyh5z60vmukIZD3dJrrP07AIYuWwaY0Y
         GCSZoH1d5deDdJ/zac7tiEGL5QTHxFGhFAi/GdFpijD/TUFGwAH1NZ4HxOsc06ptkM1K
         wMX3oX3LzQrR8NFYxlXvFsZmfCtU8+kxsKVk5Ip7+xuxiteidc8WOy/abOZmtDbLr0QI
         BnfxHN+/JloORRUNOY/WoplqDM3StkWx3B0Qne2H/+wrsgYbZQfcAEk6j7u+6dDjtpz2
         DhJA==
X-Gm-Message-State: AFq9FYLvhlMdQwUFu0stjdgDYq5sSuZZM6fZqtXwxSdVH2eo3H7oG4Bo
	xrxLDJpjxr3yg5mzSPenhBfW4EpfbniK2HONExhlEMDepB32oUMcPpqXSof1mb6ZJ263prBNRvr
	ahf8Gn5HlRLGPpJpt9HpxkUiaadPn/bptRWLdAsgJKSwaKYETd7PqK0L8v/s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10c6:b0:4f4:7dda:99bb with SMTP id
 5614622812f47-50c4f6ec97emr17733433b6e.33.1792146876624; Fri, 16 Oct 2026
 03:34:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 03:34:36 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad1fdbc.7952420f.283480.0235.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 for-7.4/roccat
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
