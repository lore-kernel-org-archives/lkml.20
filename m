Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536451;
	b=AHJI7RztTLKN7osQ7P77Go7s4RPcauOZManzA58jRVfgcgtlfzX63B8TaKiocjCumd01
	 W4HAGREftt8tf4iasbNCTarcYGkTKLzIVnuq7/lM/wFe6r64LXLN7HWio3T0D64IV+g0H
	 agZlN/PYWYKgfD4vNJ807L6cn1519WCWSNvxzlZJvLC2Iati56SMcGZD0sgAp8aLUNR8k
	 vED5ScvWdC6+9RdP+fG900vaQKOteIC5cP9BZv2qsStTmobhJgmTMgy11oI7sSxJ5MR+Q
	 jQC8oYKiAXtTGihFKwpJEy5OGXy6UWt8y7wSV1DjgvTZVypuFuO2A6xD3ZQ74AxQR8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536451;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=fl1ojHUVhKRdRlP5kOmsIh8NvLRrp6z5vcbdxXBbvG8=;
	b=gZcqvpOsmnA61tfesDYGkTaVug3dxJpRdDet33FgVFCqfNzqcDLNInVDEoI5tIx8FGZw
	 9w8//aOCsWc8w8keI353Q6K62o6M9lrpbY1L7dB4Gdwkdv5SvSRMj7t+xsqySbWY/sY9g
	 QuRHUaLg8wzn4OjuqzNL2LEzUbDtgAt/UrgTn/zZ2OayYWm+zRRgT6z11zA6VN8QxS29T
	 HYnxVGk43qUxCTluRU7yX/Ept3h7xFP4ZPU/K6JYsrZDtwm9zMZjPsXwMvFBZz9tTZeJM
	 z9XyJDEPDSFDQZOZlMFZdBpRYSRavTl1CAKkr2APHK99cz8iKhXwR4frGlxJJxSA92g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFA2606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBFA2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbf700ddccso1969894b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793536450; x=1794141250;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fl1ojHUVhKRdRlP5kOmsIh8NvLRrp6z5vcbdxXBbvG8=;
        b=qMCyUXxCkhOXhJnT2uGZGIh4IA0y6A6kelDTCRiQIrmc2bAv1lbQ3HkjUjqet3ml0a
         IfbHU0sblOTaw72wAU0fKgFtupgdFl8loZwI6HyTJ8azgKKP+PDtBlxb7vlBNK5klbCC
         plRfmUqctm32sdl11vGZIOv0CQRMEatDWJO8jOTlrW63dA7qQjjXpc9RdI9urUixnInA
         ZPiPQEcjAbzMuWzT/rE0/gaRCN0g+TNIbKl0nIut/jBOPXi2J5qBt0fZlTFWWIaorDKH
         kYl9QTCI+Zol7mbFqeWcecGz+xcZ/DpUZEuVjely4PsIAkTNPvgCuAnKUlCA131rKW2G
         DfvQ==
X-Gm-Message-State: AFq9FYJ4ErNsN4Y2s2mlRwk1l6ngL83rWp74T9rXBYV/U4S+2rC8obga
	BVT+qNdLtLQp3VbS5skzIr6pGpPXiJX9Z5y/kPpFFaor2voTHWfdt06mgffZAs+WawCih8f6hEI
	nc4j17cY+4MpRNRfN9BjFNhxLgHyQ8ny/XPP8TaiEYFQkuIk17Q/gtgdX2nE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:148c:b0:4f3:e98f:fa19 with SMTP id
 5614622812f47-5640de79cb8mr4709382b6e.61.1793536449960; Sun, 01 Nov 2026
 04:34:09 -0800 (PST)
Date: Sun, 01 Nov 2026 04:34:09 -0800
In-Reply-To: <6ae686bf.64e51036.15cf6a.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae731c1.64e51036.15cf6a.000a.GAE@google.com>
Subject: Forwarded: kernel BUG in sysfs_break_active_protection
From: syzbot <syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: kernel BUG in sysfs_break_active_protection
Author: sajal2005gupta@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
