Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206146;
	b=SasyXT6AzyqpnaZf/ZVN4BMQdzZeJAXO2G8bI0DLBWYZkp44wOOgOj1pUGLtk7QAO1AA
	 4VpYYZ53uZ3j5TqFUi95krF4mxIP+Tt1/GalFVm81SUo9zwzuwuHpih8mpY7RLUMPsNDX
	 RUAxwlTR1Ki20gg2P2rigpUvQEaHQep2EyHpyVl2zg9LOtM/agyJLD863O/1cWHKSfKD0
	 GG9B6clIOqRwUkv91W3YXWc+qEabhYEb7Q/CEIochcZ05cyzcuHaJqkfOPye66/xrUPWa
	 BQEZH+JsmZcF/4B9ardA+mTtmszDkU3fMphZ/XPpy60Lt5cXH4+T2HQjWzpokrVkyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bPGnqj476W51o96a41GpUOz+m064X7NdtLBauz/YZI8=;
	b=OXrBHbgazfx5jUdLgpjuxo014hWl2+Rtre3tFTSccRnG8sVddNHgguijcgT+PiSrxZqr
	 zENdNEPnITl/LFv4h+cwb3ysJOV5OBLAgh2tQ6MBxWFdD0pTAI2JVLec0QeMEQuO+MRwG
	 ft3B87dKGc6MAwvvqEJGhAoD+DlmYUZdszQJnziz0vDUpoAlXDacol9gVhquSwBviTu+I
	 InoBAweM15C0w4IwDYbDU0WUJ24h1ZRuW25BrQBvh6fjvPUDVCpHqkkCr6zpC8ics+0SQ
	 9tutgMUD6V+v+ah5BTKxlNQQAxmf5I4fwcQM70cTcYmY/DHcxx+muHa9dmhyzHBspJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPL0syhD;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPL0syhD
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89f639ba307so516942b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206146; x=1793810946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bPGnqj476W51o96a41GpUOz+m064X7NdtLBauz/YZI8=;
        b=pPL0syhDCCSdazXfGgSI2dyJxkO5p9di+w0MefHsimK1asQnLWHbnYAxC5112ldbke
         dCX9NnT3kiwrDcq2lJnOC+kZ/TjKN30wfMhRim9j4yYWDj61i0BCth4vuLLo0FcSxe+f
         SsspOYRVLKPubjNVmnSND8NaDL2o7N7WsO8+lgZCrws8nlTUW/wW70KRFu0sncNEJdmj
         8BbUFt4cMzYlnCAjH6iI1JhwZHbYUyl74/xf0CPNb1XcIfKDDPOvX3lmtrcpArGOiX33
         Fa894hJjgcBLcJKgMOLLYuiUQtAm7W+iiiyP+ZKQ7KRWURSFk6ytX0dAa87qSOj3CjFG
         KrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206146; x=1793810946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPGnqj476W51o96a41GpUOz+m064X7NdtLBauz/YZI8=;
        b=aBTt7lQduJdayb59Vy2E9tnjFD0YavuMWzCyWHMrkKpO04C9q07if0g9N4/ImBb0dW
         L0jrsPchmcKZj9/X5Q/NhCe8+nJCszqPwb1IgQY5oN63Ik2H/rYbVKUGb67I59gHgZn3
         BzI12fFqBWC7QXZbLM2md2MFSPqClGLXpMQ23lZZLUH3adv1KaDNAkG1Nyx8NQU9IRUv
         IDMsr+6zJp6/xegjzREXG46CQERWurr/6pXAQt259iUsYObMM8a02ZWUTYrDNHoON+BG
         abFZVVj/brMge/phbFOZo6Qmm9mIHSeyH1NDJgGyjIBnn0NXlkqyw1Xgdzd5b1amjX6D
         VC7g==
X-Forwarded-Encrypted: i=1; AKwUvBzN/ArtxCIyka/N2DVspDS0TVFbXzz+3q9iLueWqq/3TsyEeP0bO+xpYBlq1DzWweYqLecZqhhrs1FQnJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5Cl8qAmbtl+224b9VXwKoqZZ5ZSEZnw6JXGkE5fJI++F+P3hy
	ePHVJdVilxP1QNPuEvtsKD9YCqDV18/uJmPvfTvkkJM7Zx2rLTEWKzE=
X-Gm-Gg: AYBFou2/7vyyHhc6dIXO+h10D4VSp5XImwloXO0UdkewqjVKZqq3PhCM7Fyhy05HkLt
	VfLMfKwWoAlC8e7gJ+wVbsEV/FJtAgLg6TiycGe4/YPjbw5pKQdYprd6vdXA5nGa1DSikBZs27C
	CbNRzLVQZlFkc1gSsqo8/waadmH4Iu43ycqVZjIVGxeoH5FjuX2MORZTUlc1c17HzLoZmEzlhYA
	iFUB9drqiq6OB/5qdoD/oapkj3q+a/3vmA8x2Ke2+3pzTniyhre0CcrvGTcHjqFbN5ImMvYP6C0
	Y5fARYvaXjSf3SgARVhjMmO2gx0pJ7EwCGwGHxXCIgzp07YItKpLTINDNTAwMEovZsCW2Yxx8k6
	q+r15aiNs19AzcQR7R5kkWMSO0P5rLaNviekpSVXc1pz0Uelc6mao24i/xbHWoL8Ri481cTLcJp
	geavAo6xqrZlzaOQTpFyFL1qD3YkXpX09s4iWhm2i8U/AAyIvUN1kQTyA1ZvEY0zPEYFdRfvOA0
	DIJI0lqmFPQ1DCYEKQfdh4btpUg7jQMFxYEI5CRbmG+9S1E/okPvGKeLtmPzYRubUCPYcMoKCg=
X-Received: by 2002:a05:6a00:8d0:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8a6e83ab378mr2214831b3a.29.1793206145602;
        Wed, 28 Oct 2026 09:49:05 -0700 (PDT)
Received: from [127.0.1.1] ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f64edbsm1453505b3a.12.2026.10.28.09.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:49:05 -0700 (PDT)
Message-ID: <6ae22781.b5b34ff4.243b64.342c@mx.google.com>
Date: Wed, 28 Oct 2026 09:49:05 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+b547ffac63b636628299@syzkaller.appspotmail.com
Subject: Re: [PATCH] jfs: fix out-of-bounds write in add_missing_indices()
In-Reply-To: <20261028163000.30-1-szwyb123@gmail.com>
References: <20261028163000.30-1-szwyb123@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While looking at the syzbot report this patch was written for, I found
two more open reports that look like the same bug:

  general protection fault in smack_inode_getattr
    https://syzkaller.appspot.com/bug?extid=ce678add490179a73d5a

  general protection fault in smack_inode_permission
    https://syzkaller.appspot.com/bug?extid=fc1d5d9a7ebabbc27458

The second one is still being hit in the current tree, and its console
output has the jfs_readdir() "Dtree error" lines for ino 2 right before
the fault.  Both reports die in smk_of_inode() on a crafted
inode->i_security, and both show the same damage: only the upper 32 bits
of the pointer were replaced, by 0x0000000c, so the low half of the
original pointer is still there.

That is one 4-byte store at i_security + 4.  For the inline dtree root
the slot entries are 32 bytes with the index field at offset 28, so with
_dtroot at 728 and the embedded inode at 1048 in struct jfs_inode_info, a
write to slot[11].index lands on i_security + 4, and the value stored
there is the directory's next_index, 12 in both reports.  The only code
that stores next_index through an unchecked slot index is
add_missing_indices(), when a corrupted stbl[] entry points past the nine
slots the root page has.

I checked this on a SMACK enabled build with the reproducer from the
first report: without the fix it dies in smack_inode_permission from
ksys_umount() with i_security = 0x0000000c27a22900, the same damage as
the two reports above; with the patch the entry is rejected with -EIO and
the directory scan finishes.

So one fix should cover all three reports.  I will add the Closes: tags
for them, and Cc the matching syzbot addresses, in v2 once this version
has been reviewed.

Thanks,
Wang Yibo

