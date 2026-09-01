Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5923ADB99
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263589; cv=none; b=BcDdEZ9nVi93ugiX1vjUuFjQHYuqmuEHKg0GxBlDj/mtroXH0dWOmFrCQ0D6+u0WfNP2k3WBoK71rXctXdDSW7+7QiI5TpALOjOyuHYGi7W5FcqFmHfTeMdCNkr6Q3fhCRA1DxLLjQvS0vFLf4bc9aZb72MckroRUm7z9RKJnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263589; c=relaxed/simple;
	bh=yM+wPQgfJaSiOSTnCZhjucHgWP12EmrHMbqRDd/Ppo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FS/tYlIRzp42FQMPBwD7GTXceTZZc9MzFmPoM4QETGCZcEpSeqk9pShuKVqLtzaQXNYR+GQjL47sGqiRCQoErb66eS3FNdCqfCdWkWbF7XtClKr7QXyEFVTuJdTgBbelgFDlTEsoAHj7TZvMmFx1lnvkztQ1iuqnRsVtRsWgYJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VimIU0h2; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VimIU0h2"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-85aeb506b78so62024927b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788263587; x=1788868387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4X1mGuNPSVf6TjCEy4kMmDg1z3j++AZIq9q1EIuqzU=;
        b=VimIU0h2OHSYyULyaJmp78r5/gOOcXz86cTodgu9b+s21umtOPcb6Gwfd9erUON8gh
         qE+v0R++2Ir1v0OtUoafwNtLdOrJrsD9FDJfm7MYVBDyD+9+6Ralhhakb1a1Oy7nbWcg
         6TD1Huhhgifx8wDcxTAaH1JB1fG019u03+SaHWTkRg6bJuK70YopyEAeU29gLgaxXsQd
         OJSUp+AoWPpyrB7p+C4kgH6HS2mCxc6JSYyqx/lJOsui5DeAc9yhF6/Dqg4AoJMYXTyz
         cdJMfGCLABB0S4vhajJt2W2eGh/HXgGfG2Rpd8Y07vsf2GiksWpbB9mAnNkIrMynpLCN
         ey8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263587; x=1788868387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4X1mGuNPSVf6TjCEy4kMmDg1z3j++AZIq9q1EIuqzU=;
        b=tPBKzzcpWi9VtUN4hvl4d7Oeg76O3f9IqZGjd2XwF7Y66iv0dNsRxxleqvnFcHm3yR
         Xd5CBm44EHWLfIUsgXTztAl9aOfirIPiPyuI+D5Z6/eFG9XW12LjsBimAW0leVqu87hU
         lraPtUoN2mRGfic77TI+gtZ1RFZXbEDBBES7pPCrhxZoKw89ai4e9QjRY5+k3l2t2fD+
         f8aULB+vbxmiL7Wed/Fhwt5AnEDk8DW5qMPWcHP8Lqlbm033EEUXTJ/Y+ffxw0LC+Bl8
         MGnfQY0kBbIWpz1An0wzsHSeKTXrAlZ0r2glZfWoVt1Mj2RDed1vhy799tGu1KoSmE6u
         xZGw==
X-Forwarded-Encrypted: i=1; AKwUvBwYRrTeuX66RC0EkK2PuYlnccYZpwK8pNTucnJFG/LA4tl7BTJyjDrNzsTr8na8Jedkd6yFaIQNbDbyrv4=@vger.kernel.org
X-Gm-Message-State: AFuF++nw0CNYt/A4oGv6vSQQgA2GKl46EXB2F6/tPwSFcrwlYPakuk5j
	dipj/2B8nwfdF+An6ElSbjHU1TNOVvIc/WX5h9BzbNBR0FUSkCy610ab
X-Gm-Gg: AYBFou1zX/s5/Nhm6kxc7uXAa68C1o+OSXiAqoY3wuE3vbGaJEjTfTbn+jTWOQbxf3A
	g07eKRK60s2PSB5VyPoQfbOaGiOMxIZLiWzW/UwVMAxHdwwTnQzIcXsfZhW7mZynRuWeRZgolV4
	/mGgezk+xN46rhpBz9jDbbfGDfy2IpAyzCdXkQY2GifjfwpIDUnAkJshfCMdeUXDAWPjqt+caC5
	UUM+5HTiF/J77XJY49vsSQEvz5vq8Jaba5CXxonawtOFeBRBNe9lSWM3bL2Dts8HtraFGtPZ+QQ
	fep2FxN7G7yK2bXCr5k3l4sYFVmxUYq8SYjmaBfLvHlxZ7VG5dotjhp9WOrzP9teiBRC2fte3CN
	S2oy443smqA9ctBlKA8TNJufl6FdZDxY2lAmBGJ5tNF4tTrHMZ1CIr8YJmPTU5HYqVu6GlLZGLK
	GvX/nhyofvTmcOWAhYkgLsivzkAeKimRnph/h67zys33uGK71AjHuTd6xFtpGtj942H/F2bs4o7
	4kDw2C4YVo5rEPbCLRcBAkBvjs/+XDhyhEpNviCLecy
X-Received: by 2002:a05:690c:ec7:b0:820:1281:8deb with SMTP id 00721157ae682-8686f14074amr34301557b3.8.1788263586787;
        Tue, 01 Sep 2026 04:53:06 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8650aacd1c7sm43991587b3.35.2026.09.01.04.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:53:03 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	pfalcato@suse.de,
	riel@surriel.com,
	rppt@kernel.org,
	surenb@google.com,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org,
	willy@infradead.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Date: Tue,  1 Sep 2026 08:52:48 -0300
Message-ID: <20260901115248.26650-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <apVDMw0d0Y8OZYl0@gremlin>
References: <apVDMw0d0Y8OZYl0@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First, thanks Lorenzo to help me with this...

"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > > > I don't think it's enough to just add a data_race() to this one read of
> > > > vma->anon_vma.  I think it's quite prevalent.  There's probably other
> > > > syzbot reports that mention it.
> >
> > It sounds to me like the most cromulent solution is simply adding a
> >
> > /* maybe vma_has_anon? */
> > static inline bool vma_has_anon_vma(const struct vm_area_struct *vma)
> > {
> > 	return data_race(vma->anon_vma);
> > }
> >
> > and churn everything to use it.
> 
> I'd prefer vma_is_faulted(). That'll align better with my scalable CoW work
> also.
> 
> Anyway I agree with Pedro that a data_race() resolution is appropriate here
> rather than an unnecessary READ_ONCE()/WRITE_ONCE() pair.

Okay, if only a data_race(...) is enough to silently KCSAN, I can send a new
PATCH or send a v2 of this PATCH with this new implementation and with a fix of
commit message
