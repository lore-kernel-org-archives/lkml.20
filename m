Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888397;
	b=lQo5ll5081c1CzCNhpfDkYr1DEIp+aheonIRW0/rcmxVwWeySB0HBcv5Y/9QvNTN86Db
	 dUzKlUTeV7E7QkMAZksOYYI2Y6OBYxIwWxkP970E24iCTHgr0KktcVl4jNW8OhZKeqA4H
	 J639D9SwvvpWmLTXA3VjtgVpcfz8NKc0mUjQ2zzsKfv7B0DyQIhvRVErm01KBb96GuCNa
	 65I82ATpoCDlmAYBU5H7RTOWTF66cj6p+XWHuAbEEFP/8kN+MGpXpN+PqhvT8/VcsNAIs
	 Q3HK3A4jViiJvykpYTTZaiFVTDXFYnQrXd9utR0lZnB8OUQUTHasFOF7rBBF8nYnISg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fVkiMhZqi2ixyREqRhA5BibXFDzbOUI516cKpXA0jJ8=;
	b=nfKkbfHXP6Q1fs5s2T2YTf3N1C8iJBW+rsu7Zj9Sci73fvpdy6UGq8OvKfqO8HbNOStY
	 OAQD7xpH3IO2FhCVegMr4rOSlJ/Ou87h17pqa4IvYAZkPsSwd6EauqBmyZKcuLmwYQr2T
	 tEPV/TN7To8sDkeVRR4dJanmQHqlsQy7J47UWyUZWzTYZYM9zrhXK7iFdtFrqX9kvKt8k
	 iovMuwbA4PIuz5e/RuSIJvwkDn4WXkuly1sFpBL2TBZuJDlvutilxvrhuXeAhWGJZ5RiM
	 QwbFRA9QPBLKnyUA+8flEkbsT/3lqPi00z4urNGX6AkZzlB4cW0SC/tdIR9Hc1UyOVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="blxoTW8/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5F8606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5F8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blxoTW8/
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-563a0462094so1007402b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888396; cv=none;
        d=google.com; s=arc-20260327;
        b=E7Z4NmA8vHtxOkEP15WW8tmkBD1+DM0C9tffgZLP/GnuGR+OaV3vKQtSC2SRP8XRBA
         Qj2VX1GS1eDq65Gxs1ZgyV/q6/R/Y1Te41Z73VadF+sEdcWI2pBmzuNbxqtvSISekzpd
         2ZoGnC5gxyMjWmZRquque8I8Zom15dNeSE6j8mmNyC2VrogaNszLcjvHpPfSu1X8igSA
         VhZb2moWlJ7cz0mXHXUeWDAD9fzK69sCMap/4TggnJSkGlIVKvrNfOpr1tDhy4HO8e3R
         PDjz5VqfnLhFeSJN833xd680d8B76Ba++o5vAjSdZFU9srCG5mNSLmXpBWCzP2Wt5DKL
         rPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fVkiMhZqi2ixyREqRhA5BibXFDzbOUI516cKpXA0jJ8=;
        fh=oWCgEgx79dkB8abVXAXrAPwd3atmEJUPvJpuf4n//yw=;
        b=QT4853izTOHQgHQ9y40qNmSgG2F4nJ+gR5xQg8J/ydxF+dkvS7v8cfZ1M624cIlUiI
         R1a7ZO/iYyp7EbhU2WDq+z83pLgXz4OoZf/qNql72DBktcNOufNLo0sOuHTI46mrcJQX
         O9uu2kRFbwJyEtJNYrcq77yQgb5GT/+DgBmsGEVChgY/jG0LM3wDap46WliKZ3IAiYeq
         ZplUti+HWX/CJzPTsUAlaGHDGjZKNVDeQzK0pMps9DZhxp8o2uf1XJEeK0WaxtXQDrfC
         Rjb74i+0komb7bsP3slpv7I0IIy7iRxZUKhP88fgab+3wZZBh6vg84hcoND6g5YhJQ3a
         laeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888396; x=1794493196; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVkiMhZqi2ixyREqRhA5BibXFDzbOUI516cKpXA0jJ8=;
        b=blxoTW8/aNM/CWg4jHCUAhzGaosYGE2A2gzS8dwn4fw5gebO7g7UUURqaC8tK2F1XX
         ThI2g+MmlI7owPyZ/mBvX1jfaqJbecTO4KX84Jtr1jIdulsLy3kIw8/+bVhZIE/YeOov
         56jUiX26Xlcm1dFvcbeu41ltmDgvjntYvFnzKeJscT78KghaiN1xRinaeYj063m/fhV1
         kdmlM52Qz1Fga7LkCeltUP0ZrUzKP4ZVgypq2rc0Uvr0ji1joGaChCzwuL49pGeYP0kG
         GFpthhELINSBOt5Q5RTAcZVr3QOy9Z+MLYdJm93lp0trm8o5ZvGuAqF59OSAQXucZasG
         somQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888396; x=1794493196;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVkiMhZqi2ixyREqRhA5BibXFDzbOUI516cKpXA0jJ8=;
        b=CM5vBo9f5vzu+F8tG7ZGHmTJv6DaIJ7ymFiOxlZRRpNKa6DNmLjiTLVtw3jv0q67o9
         Yz09ZIAYzRWU+cFhPLKpJy3lpyVqafaHCZ93HnyWtnmCf8vFV6mS9O1fQxgjz8KeT2wv
         geUljJm5r7zNMyniFowrE9SdBhovHhakiSdz+5URiVMsZurgGDQQMe0lzhXGbtIdZiLX
         hYGH+hoxAfiJzicU8HK2qR+zK8FhCOFcsSyxOUn9Q0tb3G/5jNH1SoVcA0FyzQe02E46
         IFyb3VVzRiAF3npdFBZMsSDnCcYbjuXBH4ySlE2basXjK7CkekN12chxIa68cOzTXm30
         0I2g==
X-Forwarded-Encrypted: i=1; AKwUvBz8XhtGv1JZbz1QwnomWbGAjHt4xOtV4CZf7N1mLu+8Hwg59x86yMofnSVaQliF5zV+UmF9GxcHYcot+Ws=@vger.kernel.org
X-Gm-Message-State: APuU4Z9efg3eJEukXiBSjHUguojpIT4GnBgEA57DAdkdXHCYzSDZRm7+
	DHFfrwPLvPHMyXv42ZGS7cno+kaTjYeD4H13UXdMKiA8GkrTjxPshvwymVs5L1SDHyf/PEVRRMa
	MdU6g/htiHsG2bwfT6tMzFlAzrhh6qfw=
X-Gm-Gg: AYBFou0nJ8Tq3VcSjdRwoLP8vlr/Hb9YWmtoe6HoFBRAo6/l5rGeaaPOXx6vg/dQNRT
	fJTJNR1PZZ0RrXAlGN0EBdtXKoo6LDwVZdd7D8qIWLULGvpPTB8gaLkqV6PwzvcTX0CGYEkplBJ
	5DMvxZrnZQLPndFGMM5+FwiByRUd5k8i9/P+vIDBA1QH/snA8mBxCEgokBCPf2IHeRYoyIvEWvf
	WkrLjFo3k8BxCECxkcKqb/osHs1UMX2m97B3wKRdD6mJOCXNMhmg+Z2pRPPRfN2cygNA4bxFBYn
	JBPMelsNiu+hRO1PcfK9LDCp0BntUY99GwRdDErnYnZN9OAOEhBGZS8sS0a2kEl8M7z8nTJRL9x
	WYMoBsSL/UIMOnsEXVVQeDWD8b2gPcbGvBiW5E85NLdbCt/Pfj9kaqGFqw5vSnrL1lrUt1+E=
X-Received: by 2002:a05:6808:11cb:b0:53e:42e4:47c with SMTP id
 5614622812f47-5640ddafe6fmr14880307b6e.34.1793888395737; Thu, 05 Nov 2026
 06:19:55 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:19:54 -0800
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:19:54 -0800
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
In-Reply-To: <CADZg-m0FeLntAS6XxE-kc74vwH-jAh+jXT68qnVwXuHZNUHzfA@mail.gmail.com>
References: <CADZg-m04iG5kCZ5-yh=Vz_ysYjVDGSYn3je4_-8AzWWfiC-bXQ@mail.gmail.com>
 <CADZg-m0FeLntAS6XxE-kc74vwH-jAh+jXT68qnVwXuHZNUHzfA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 06:19:54 -0800
X-Gm-Features: AclHuK82Jb2KHgfgK5OPYnhW4ayXf8IsS89Dhx7joTBVnTmxHxJXKHLc-7hkZ_k
Message-ID: <CADZg-m3Wxkze0t9u1+dvn3Rrart54_eyi5XDcOSE+9W94s983Q@mail.gmail.com>
Subject: [PATCH v3] ring-buffer: Skip time delta validation for the counter clock
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	syzbot+eb74dca0d1eb3ec227a7@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The counter trace clock increments on every read. Time delta validation
assumes that the clock values read while reserving and checking an event
can be reconciled with the deltas stored in the page. With the counter
clock, this assumption can fail for an intact ring buffer and report a
spurious TIME DOES NOT MATCH warning.

Skip time delta validation while the buffer uses trace_clock_counter().
Clock selection already resets the buffer, so events recorded under a
previous clock are not retained for this check. Recording and reading
counter-clock events are unchanged.

Link: https://lore.kernel.org/all/20260920161648.7d9fda60@fedora/
Reported-by: syzbot+eb74dca0d1eb3ec227a7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eb74dca0d1eb3ec227a7
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v3:
- Replace the Openwall archive URL with the corresponding lore link.

Changes in v2:
- Resend as plain text after the previous mail client reformatted the diff.

 kernel/trace/ring_buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a7..c860d5b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4747,6 +4747,10 @@ static void check_buffer(struct
ring_buffer_per_cpu *cpu_buffer,
 	bool full = false;
 	int ret;

+	/* The counter clock advances on every read, invalidating this check. */
+	if (cpu_buffer->buffer->clock == trace_clock_counter)
+		return;
+
 	dpage = info->tail_page->page;

 	if (tail == CHECK_FULL_PAGE) {

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
