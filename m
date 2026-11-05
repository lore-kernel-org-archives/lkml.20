Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908124;
	b=itfVxLFZ3XsiKOAumyfPZfqFBBOc15buv725IZmUuB8lCe1eH//o/yE9wjC8pKCzFjg9
	 qbFsjZe2wUeeGLMp5ijb/Y4oFskzBzk0AWBbsFkTqMgYce0DrBDg6c+LXH9Xr42QCloDA
	 vWr+8jyZpmBuuMU5uZGUpzLodzCkOtt1B/GavvUUaQeAkNfYntVwimnujHi+rMKIkpJgH
	 /NBThYH+eGYT7ZIdPFhQg2HuWr063YNMxNI2JqeSqFPoJHN/Cz2Y2Ujr1VN/lXhhGBqWw
	 LzjfFPG5FOX9Cpg1fK/XMe6mcHqxoixtuLTDIwofX2EXiBwVdRfZBFbdr5Lbm66vcRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
	b=DsS2i0XQBhtG+0+eOH8hz0FBY09T+6nlRegUdYU+h7os8PlGWvtgULJ+HutPmJ9GDiDs
	 GBvgC4xEIY989YBjy/KXpyioOt3VvSXPu5HmkNKTwas6O4rxAPmxMWNa6RWxwS0KUzFXd
	 eqEQoBwnaKDSTIm0VXyvqVCUhrcwnyhAeLrZ1cuC+3rDnsXcyenNetZcqTIo3T/uGxAVF
	 Mxbw8gEr7YJ/5jko5bwINU3rT6Vd8g/qLD/0aPzJW2+dMkQ9/9BvtM1oQ+wfkIvY8OAJz
	 9D3UcymkL+gK5b3hzKb7mWPvm4bkEOX56Xi6j8TjBRatNzrOEiHIUGlJ9YXVDQRLBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0969606C8B8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0969606C8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-846863cd436so2332129a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908122; x=1794512922;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
        b=lrtvRjY+413VW09cWCvEKAn/Yyhf9y0ZshWsV5zki7awxYSDd5eHA+ByOXeMhnMK6s
         6yfKZ4Qgyv+7BtmaiB0/ohcXr4ruXCTDohY884etuLT80mPFc61Wyv/44ymGii8DGM3o
         h2VBKsmtDP7HoMvtKzpjVW32Qb6b9P+5l2Fh2vK588+X4iOuVAJhPrZm9FA3tB+0JLur
         yNjisEond/5RC6t7A3gsewTm5vK1hJIwoor92DJRKKPeBppWwVB6qSesYSxOa6EiKepm
         TymUmbqqbXvLgCXSyEM3rnn0Df5+txBkzjExZiTYar98R78xVtafQEZmwpEqlDxyGhRr
         Ld4g==
X-Forwarded-Encrypted: i=1; AKwUvBzYKHvVmb5CD5zW9+1OiGV8CvX1PpP/916oyKWTkdODCWdk6S+oCyHLOgTU4tATOD3y/t2kSsBTJ0mOTwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JLjy3HCWR/ieJUWyxUD5/dy2JG7+bzGoE4/WT7k4OwE4rxyZy
	5wVfyUJzIPXvAARQ0qH6YJUrQINgd4JNY0x/Gf9MbF/EjZAtZyQeEz7x3X/+7sHxtMaCT9k90gK
	CN2jVe7bLR1SGXhMmNuXpfUrSRczzgfXxJJ6OQBcLnNB0aab85brjfYchBN4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f48:b0:55c:836:5950 with SMTP id
 5614622812f47-567e104ccaamr185923b6e.27.1793908122737; Thu, 05 Nov 2026
 11:48:42 -0800 (PST)
Date: Thu, 05 Nov 2026 11:48:42 -0800
In-Reply-To: <6a2c4b8f.be3f099c.2836ae.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aecdd9a.61adde43.246c95.0003.GAE@google.com>
Subject: Re: [syzbot] WARNING in update_curr_idle
From: syzbot <syzbot+e671c2192fed8645642e@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
c095741713d1 sched/fair: Fix newidle vs core-sched

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=e671c2192fed8645642e

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
