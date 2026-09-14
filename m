Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DE445AC8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386177; cv=none; b=eTgLUfOIElL6dWiFFdPE8QA30J/DTecV1MqN6B1tqA5X1cebQ7kzgEOBaFTpNv7WynejtKe+COuMp27juoeO5eZfDRaUhSx/M3MrAOML7mVIAoX5dDWk+vtVcx0lDQizPIJn2yFdeixiE6f/tcVkpsHVWOd1mwUTP8f1VUNPNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386177; c=relaxed/simple;
	bh=ytgr5qGXcmxK01M0r5Gvov3JBIsNN3OfRcD8se3NAJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oROcO2YW0D/JnXsEjdPZq82LVDSglubCj66QYz9nuhVKAeooOL93T0dn2IGTqyj9fscsdW/Ew8RgysGijy7t9Q3AsEKldnOV0OohwSAubSdn5TQMTeHG5CJswywLjH8pCZj6S7FiMI5ju705SeQdIChqmkVBJDMU3f0bJf1hiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZE9fdXup; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZE9fdXup"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso19902505ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386175; x=1789990975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4McCO5QA5RDLTkl/ISRPyM2FuR98SEf9b6QSmXRjYA=;
        b=ZE9fdXupoQy0hOTvodhBRlbLg/2BlsUCugkwserP71quKzflXEKfNS/2vibw8RVusO
         9VmLu4oAJmK/dl5ToN/ftXXBbl3wazGrIOdlLm5u0IycDuV0rDlQtPhx9TLcoq/nwLbq
         7da1yqteeSyN33mRF67ts2pQn3R53T2CcCEGhrYAhVbqb7MoONJalLkgW+MUB5HiU4X0
         Zc6omaPT1PoQaxo9uAQUxB9Ka6jXQEjrqgQ645N9nrRCmTaCn1tGndy6ihL/P+pHHNEd
         R+2DZRVApcxPpmqjYPFa2PLOtPuhlWiOscdt/g23HUnIdtzIYvL1cuwSjjWrfAl/RDKj
         5Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386175; x=1789990975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4McCO5QA5RDLTkl/ISRPyM2FuR98SEf9b6QSmXRjYA=;
        b=UKWryfK5NW58vihpnO8WsSo2A8yI3UGVXtBK6ZpqFUxfRTaJ2UXo6qSWBd4OPG/Xvv
         34HXSwKFsQBEzjf2z4zAerWZ6CyzfgVSmvAsN6rVC5deFgYgPSfnKqkHmC4ZAUkONplY
         WBvCjhzSYBCs9t+0BTTF7HFwyHnzPhbYfE5FSIRRC/9wcveUtS9uEgFSsV378bQchBpT
         hS98GENUdGKEuZcsKS41IUzbQejbH894y1M3JHJbxKgZ7JNyu3BszZhdE+2HccKpms/h
         RJg2VyStcxh0x6LgNsw5HlaSlCJHdOhDQ4bZ5YZMQ2e5H8C9TIOo131TO2Q+C973GHp9
         fnBw==
X-Forwarded-Encrypted: i=1; AKwUvBzQAZJ8bJaV+fZYOUX1OZtjuj+T4cXOu4FYe2yuoRlh9ftcdmN6+zLb4T3MePHsCn7fk70xvWsaq4O6KIc=@vger.kernel.org
X-Gm-Message-State: AFuF++li71FzIYpqbjCymj3VfuhpjI5KtHEsOCkIfaVPYzwbu8gcGqj4
	WsBFTf49/razBNemM9YWPsIBqTuFD+SkpaxWQlMeJoEyKcnRv1vcosrJ
X-Gm-Gg: AYBFou12KfRPO2PeFDSZ+SG9VE54bRwmCDV4foe2f5JGhn94ovmHxXh3a7vX3FBFGAQ
	4Fj5PN8d0oWAys1roWOKkLyDtLeQTKPNVdpS7k34ohj6dhF7ooFEYEcTQIKexhc18RvdLekSDfh
	JuCL49uKb4USiEE6Ra9Yalu5v+ZM+j/bHpkENDNQF4lgh95BtnHcrYJP/70lqV0ckwAXLiJMGSQ
	xUNUDCmXQW34s3Czlmcnkj9FPz5/MVfGGXCY5bdHyBEQvo/73Ho/awEE6gpwqbz/+Pl96k30grb
	HScrxGXJ8NRb9xqHBE9GT2lRj+tHNEY9zxUy/eVundJBmIL/BJd+0RjrdH0x2raa5aAx+1rQwqG
	pNoLUnbGEyPmx2SygGjF5Zt/lDAp1N0e7kVKivcRAezYQCwRykPKwrEyGk2lDHn4sE56wfAL82I
	u/2f2M17tDmNydi3Txk51XJ3IgrC03Blatff++Tx/6l47M1GWMJBPNRGEV0Tu0I4G0nXR2v6vcv
	/mkCmm54r8nL+vuB3Rk6LjtEDybTuVRCrSyYEXld2aUInayb3SK/Y6C/errt82k54UcJQGL8dAT
	Ceuzv0PIdhKA91OxQz7btDE/Gg==
X-Received: by 2002:a17:903:240d:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2dd6c75858dmr51731475ad.21.1789386175200;
        Mon, 14 Sep 2026 04:42:55 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (114-38-150-193.dynamic-ip.hinet.net. [114.38.150.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd34c7f976sm44032275ad.81.2026.09.14.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:42:54 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Matthew Wilcox <willy@infradead.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Zhang Yi <yi.zhang@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	linux-unionfs@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ovl: implement ->get_unmapped_area()
Date: Mon, 14 Sep 2026 19:42:49 +0800
Message-ID: <20260914114249.663-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJfpeguhxCEs3pZuqAZ-gpG5gm7NV-TuzniSkCCrgAQ-TV6ZpA@mail.gmail.com>
References: <20260827170718.497-1-aa9736195201@gmail.com> <CAOQ4uxjxDV0U9yrDA_StN968P_6cpjRAN2mBCx1c_RYd7BF4Og@mail.gmail.com> <apGCDtf-gE1osJqE@casper.infradead.org> <CAJfpeguhxCEs3pZuqAZ-gpG5gm7NV-TuzniSkCCrgAQ-TV6ZpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 at 16:18, Miklos Szeredi <miklos@szeredi.hu> wrote:
> There seems to be a logical fallacy in saying thp_get_unmapepd_area is
> the most suitable value, yet not making it the default for all
> filesystems.
>
> Saying this without any understanding of the subtle difference between
> setting .get_unmapepd_area to NULL and to thp_get_unmapepd_area.   All
> I can see that the difference is indeed subtle.
>
> Can you please explain?

I had a look at this.  thp_get_unmapped_area() aligns anything with
room for a whole PMD in it; nothing asks whether the file can use it.
NULL means no alignment at all, and 34d7cf637c43 kept files there to
avoid "unnecessary VMA fragmentation and potentially worse performance
on filesystems that do not actually support THPs".  The case where
that matters is a lower without large folios.  32 x 3M files,
mmap(NULL, ...):

                          ovl over ext4           ovl over squashfs
  NULL (today)          16/32 aligned, no gaps  16/32 aligned, no gaps
  delegate (v1)         32/32, 31744K of gaps   16/32, no gaps
  thp_get_unmapped_area 32/32, 31744K of gaps   32/32, 31744K of gaps

squashfs has no large folios, so the alignment buys nothing there
(fault counts were identical) and costs 1M of address space per
mapping.  v1 only avoids that by inheriting the lower's choice.  fuse
passthrough already pays the same, as Jann noted in the 2024 thread.

Hope this helps.

Thanks,
Yuan-Hao Hsu
