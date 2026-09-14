Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EFA3F6610
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374545; cv=none; b=DxsPxML3CTAZCSeO0HdU/6chRj3kyHVyAl02ARzSbPefFDuecIDGeVKoWVQTIMrTyvI4umX0mcGa3aZD3tBUILAkBtJmWSyR+FwxwMA1wqaKNqUndGgJV33V5wpLgQ9p/nBJOfyB28JPly2mHE2/e/VME1sPo8WlPIqoeQPqHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374545; c=relaxed/simple;
	bh=CjuNn1/No3FEU8yWgNe8ewOXQ1wYxLNz09ITcP7PWGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSTUHLi9ib6+sjVIUZkvlLWuw0iWK+xXJq6vE8Z23ournN9El25XQrhs0qervnS+EzQW7QtcNlyYrFEpoSIG85pGwcNtOP2SZSidwd/9FosRMe+lIk9mu3V6503A1urhl/2UmR/wsFJOXuP46CcQOWVqnGKvCQ+SxpMD8h+lZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLBabV0h; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLBabV0h"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso485017a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789374543; x=1789979343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjuNn1/No3FEU8yWgNe8ewOXQ1wYxLNz09ITcP7PWGw=;
        b=GLBabV0h5vdyQXBA9p41HtZK7GfpqVz32p/SRlLRwO4pb6faBzqNKGAu5kQqu3sH3s
         gOGTGQIvsDxvwnr7CQHmWQzpB//rQuHrbhRo2q61F5CG1zY2UcbEd5i87wGxC/rd1RMC
         xnU26cDPXtQz/SNuwkpsi3h/pbCfxd2MVFLjZ1mjb8dUx08l2GiHPSvWyhuaRZTWSdt9
         EhMZRpDhSDSHoaUwobsDkAz/vKiDJY1AB/CVm726qcn8bDMnIvjyLjoBq4Tk44NGxQJ9
         QT1vfKw1g8/ocq/kE2r0a1/s8pUX9m9C0ey5JDIvaVNsP65gFAO2ybD51gdOeHFv7U3G
         OUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374543; x=1789979343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjuNn1/No3FEU8yWgNe8ewOXQ1wYxLNz09ITcP7PWGw=;
        b=kY/968KX22tQAwU3001+SnfIOEzxA8v2H0C/++iaup1APOv1Nbpaw6mC918JCgh+rK
         VumE2gbiRvwtz2tNHonvq9KSs11fxNkY6BMdOdApjbTbD7NLCgQAKhYMbs0rKKe1XfoR
         SdqhAr5F5W7P0/3FNkSsQzwbPQ8RELw36HoasVmX0E9UNenyYyILvg37BL0O09Inl3YE
         hcAt9TuO7Jpc1S2ZALDVwMBJENHbb9Z0WrNsz6N+CZ11Q2MiOHJ5iS9WjyQRBBjcbpjx
         cUkvvEYookNpkkTHEqPT+sq0G6ubCIbzteqMleJTxqwpxNJ2h/B2EoPjRsrrAZl8awdS
         pnUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMrILBeXCh43NgSh9uW3XE70JYvTEetj2ANzyBeER35cXbBNY8YZecDon+u3jIERhR5Q3g4IXY9Kexw6c=@vger.kernel.org
X-Gm-Message-State: AFuF++k9e8L03wLvt7UB1W8wevcBpW4dFSXx76k3l0PdgZRCgINcE6k6
	7P9t0A8yrxoNZGrO14oCnwMR8pVzTsyr9W6XwCmU1vfqzlPiLZ9fHdn0
X-Gm-Gg: AYBFou1Qy5lO5Lnvzt1zuqBmjtwIuWzklNkKSEMACsbRNV/762/i4ZLXHeyUkkICwZo
	ocsnvlbWM6xyQzQFVs1JBIVO68Pxvb2QGoqXXC51kyCJYQ7LiO9NvndRZ1t7p2yVhs0EvJ3D+fw
	lhvhJiKGVBjRZgTohCygXyTVcZHVtR7aFGmmCtpqaRFk86oNzx5MxTwbe/j0mAW9CFic8k82x0K
	Pn/YkYwQHn/3SY/S0E/SHXeSPU56WIIMXoSvFodUMswg9CVavRCxrlNhe47lLHO0fVlNwFJDkKf
	W8Oe9de1x3WWm7OXVF3RYu+o+GGrWxk5CGq2BXO7HkHLle3jy6+4OBALDC/2WJBosvxdE0U8Fdw
	bnh1dBbCjfnfHCZLRkPzqpaOioEZaGlroH/7IjqjQZ/ULDvNI4utAdPhK2zbo+zQwpJ7tpW+pDH
	xJabpbxFCLLiwLCnr9jA94j9no/FNw7/kssdrleLTPkqXRU+xnDww9uozPr6YP2D9nAjOTfCoaM
	k1+H3li01ou1ua1BSNEDqP3rsmGTTynifi1UPekg2f42fZvuDbNfM6ZOV/onaGN/IPBrAajIZ3/
	6HCIOTLPXQFsaEH/PpPiNt65E3VYevy5Y2bC4jRTvNkX7n75COEYhgzL1JDikvcZyZxOtmLHYOJ
	HgADN5OPz
X-Received: by 2002:a17:90b:2250:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39dec3a472fmr1681646a91.4.1789374543294;
        Mon, 14 Sep 2026 01:29:03 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.t54fbfa9bf0658dcb-tp.internal (189.207.21.34.bc.googleusercontent.com. [34.21.207.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm19843658a91.8.2026.09.14.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:29:02 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/1] xfs: prevent close() hangs on frozen filesystems
Date: Mon, 14 Sep 2026 08:28:35 +0000
Message-ID: <20260914082836.1658-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christoph, Darrick, and Carlos,

This is version 6 of the patch series addressing the close() system
call hanging indefinitely on frozen XFS filesystems (Bugzilla #205833).

In v5, I introduced a transaction allocation flag
(XFS_TRANS_WRITECOUNT_TRYLOCK) to handle the trylock inside
__xfs_trans_alloc() and propagated it down to xfs_free_eofblocks().
Christoph suggested this design and reviewed the implementation.

However, Darrick suggested that the deadlock can be resolved much
more simply at the VFS-layer within xfs_file_release() by surrounding
the existing check with sb_start_write_trylock() instead of passing
transaction allocation flags all the way down.

This v6 implements that VFS-layer trylock approach. It modifies only a
single file (fs/xfs/xfs_file.c). If sb_start_write_trylock() fails (meaning
the filesystem is frozen or freezing), we simply skip the speculative
preallocation trim.

I would appreciate your guidance on which of the two architectural
paths is preferred for XFS:
1. The v5 transaction-flag approach (centralized within xfs_trans_alloc).
2. The v6 VFS-level trylock approach (localized within xfs_file_release).

If the v5 approach is preferred, I will rebase the transaction-flag
patches onto the current master and submit them as a new version.

Thanks,
Aditya
