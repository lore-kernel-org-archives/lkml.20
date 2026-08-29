Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8C3C3F48
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788026574; cv=none; b=IaNSsiuoY6rjRlLAee0k8syNl4/kyRgQlS2JwZZARpiOTUTgDszXg4GillVnTF91EQyRylvERa0YeF6SPFEgzm6EmtC3qWsgVcUzxQe7BRzj+44h/GX0OL19JR9FsrtjQmYb4l4cDPIYO5/Xv5at0PrunOU15sSiO453Znm+T/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788026574; c=relaxed/simple;
	bh=sxGOxRKeR262vPpBu6NWXPBSCwbxk0DNDKoeV4cvhOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1owTUNg9cN6EubmOC7WDYXtQ1++YlutszWC8kS7nHdxNq0RNhrmP95QB0lBvoY83D2gG/znzH/HAbEAAoe+1ccFyhloLFd4Vx7MVJ52x636XyBC2G2Yo1PRosmQFd7UdkA9Y/hmJZvxylcbCOQXvbdqGjUMw3MrpMDjcwOq3bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CI+rrjxA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CI+rrjxA"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so1697765a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788026572; x=1788631372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i87P69rcYkzXTWHP14+OyA7oFnzKvLPVHE4Ngy0a/UI=;
        b=CI+rrjxAMx1bHMH9LzPha8ZYHhS4j2cd5hW36D5IR/b+uOkqAHtgKY5/iDEj/jeqTf
         KBGGPAb1RbytCPU1tsZyC/sie4mffZs1mLJKPu2CVS5B1cVFtT1iHRITQsbNQc3bwZ7m
         +SnKE1Zv5yxtc3rwzGFBF/Zni8pE4kRcpyZ3+YFKPkKtYfLRe88/gDhQoBKFm106vcEv
         dIWO7x1bLdltWcucjTXlHfR88SIetm0kz/rOv8oClxtD2AZKaM+xj+Z70sO4uO82w6+V
         mizOzkUfwGoM2J3pz5MUiCZKbTBk0nEXzGjnnxuQ+uIYnTW0phM3xAjNOYFU7OTeCI5i
         0Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788026572; x=1788631372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i87P69rcYkzXTWHP14+OyA7oFnzKvLPVHE4Ngy0a/UI=;
        b=Lu0oc1MYGlPupK+qpx5fJhZdtzkd/N5lHXXY5fMIN7w/Tyio8RhGEIl6nGlEy7Akrz
         C9gkJQpYYOWYCQB6Xa1eQqJKTb4Y+dqJpzzM4nvnkN1sZjZpxTUwyISYdjtIfq4jdVrt
         stihKoCikqwlM+NI4v09ebMMIDi6+4b4B5fET7oP4qyIYjhYjBSUCRysGT2eQ2V+vrEQ
         jux8VSGKU380CkzohqU3YwDKvqlpN9EaifiD5OdX3Dlk8u/NQCQ7aqNxYfxpeUXxsNKK
         zOAL8epI9yqeTq0pH0/xYbLJ0kpVCh5Ry76z6+vRzXGHO/Mroynq5TbCB9wJzPUBX2Tk
         0yVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn+lt2R0AYTBvyV7nsQKhyxKfSLqhVpV3ZrajXdZ8MjhnFJdog/Vmx4sAPLrwvZwkOQ4X2kPnSoiqTI74=@vger.kernel.org
X-Gm-Message-State: AFuF++kjPgogp7KSwd6KUH5FqOC92H0tCRLduYPvClCtQhY650LB1Gbf
	eQlaF/9BuQdJrZA6bZ+bnGugaRD4Fb+a5yloR/SzL6NxYmHWwVy48osV
X-Gm-Gg: AYBFou0q5Sab6KL+NH77NCgbwtvw35fqzm8Pbj9gNR9hUIFazdBDmgtIgdIqAiPNxn1
	eEsfjz5PhOVuXBR+gZHFd5o4E/wTljjehAt1lezqFDdNtdHEsVty1nb/IrZkh6CxLY1UCtKjfrb
	5+V5fS88opeEk2BWpO4evSwcImEUrIGwW7tI5CR+FomeZVbNaReKLEplKNxkzvRLrhlgibye2Xo
	gyagAvtEIrcpqZClOr1KZIurVXVElKgRBJLw15K9k4tFNU9+tD/IM+IpB5UyWsMXw3cmHfvOUA1
	zwsiYpP3KZCW/9OH4G1JTHd794MR8Jv9pwGYam30YfMU4l/PvCRcTLeP8k6kw2VCuUO7oF2B0X7
	cbu/TFlrdQP7qgbAwt/2DvIHy6g/iWgA8YpepUzeGt4E5FTh+D9aQdWyU/iSS672u1+ZxvgMQnJ
	loOHwzHqpYsHdw2ek0oPg9jlqPkJ7hGzX04Vp0B9ltr1aT3m8aIDQLRx1E/b+unbM6lBzsmw/zG
	2TEF4uTgWco9Z6dNmPlVEh0xNXxQNha2CKKoGCl3vo=
X-Received: by 2002:a17:90b:3d91:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-396d0f016bcmr27981938a91.8.1788026571891;
        Sat, 29 Aug 2026 11:02:51 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm23619917c88.12.2026.08.29.11.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:02:51 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: willy@infradead.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	surenb@google.com,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Date: Sat, 29 Aug 2026 15:02:34 -0300
Message-ID: <20260829180234.435064-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <apL8kdB0j561wl5G@casper.infradead.org>
References: <apL8kdB0j561wl5G@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Matthew Wilcox <willy@infradead.org> wrotes:
>> Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")
>
> what makes you think this is the right commit for fixes?
Maybe I would should analyzed this better. I only seed the commit that introduce
this function (and consequently this reader)

>> The race occurs because the reader (__vmf_anon_prepare()) checks
>> `vma->anon->vma` without holding the mmap_lock and withou the
>> READ_ONCE() macro. Since the writer (__anon_vma_prepare()) is holding the
>> mmap_lock and updating the pointer, it creates a data race as the two
>> access are not properly synchronized.
>
> also this explanation is bogus.  i don't have time to fix it right now.
Hmm... I would like to say that the reader (__vmf_anon_prepare) access the same
data that the writer (__anon_vma_prepare()), lead to a race condition problem.

When the huge page alloc failed, the asm_exc_page_fault interrupt is fired but
on the same time the procces that was trying to alloc the huge page, try handle
to this failed too..

How READ_ONCE() and WRITE_ONCE() is atomic, the race problem can be resolved.

Thanks,
Guilherme
