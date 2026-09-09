Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718C29D27D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941541; cv=none; b=PxuiP7EO175e5M8/MRxZqr2O8cpklvEoWCh4nH4l2LGMxNP1Il8z3DYlZVsyPwLUnINdPp+g9YRck93Ux9VYBZaCtmoSz8d8E5Cn7TDhz+g2RlUzlyadHlakq2ipW3mY/+yR3qDbrO8XkPfB9Gk0fWzLcgKxSBtwoMLWnDrmbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941541; c=relaxed/simple;
	bh=Z5uXelIo1PzJZislgd3pI1nhstFnYMsUMC9QUb5B5aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peJtjOFXyrkqLjejBkwAmicw40oaZ7/fjRwHfBYnhkiheefftCEbyOPsawXTQqcVI+3XtD0Fv13//vfoYTEZRIZu3BS/oW/XhjWLbVxM+qVVIn9oFqQIa8nRLlnNmKXzXODhjDHt14qZKWwt+gPz/Y3rUzsj5wgvjP4Eio9I4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9qQw1Wo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9qQw1Wo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6efd73032so53343485ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941540; x=1789546340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEWkKsVzREGRmxQQmEc+XrfzsTnwrOneefxUy3I9B4c=;
        b=W9qQw1WoWVnQc8oxocK2mo02eeYuK2k1ZwJpEODcEdHdVrP+wxKm7a6OFU5o/uyxft
         3qPGakVySZLmgdB7siYe61r4Qw+PgsAxXpB46TVVRm3a16LYt5rIlBmBB446ABNjEzBs
         OHYgxamLsR2IYHAbLJqTxfv9u67vZy0/clhd42KVq886PaOGpxjJjyp1kPn0bMWF0o6A
         dg2sDXUgAAWDwL0m+M6cmkGi0txiTZrANi2BEuTmuxYcMnnsbbxQsxVOdDJJG8rpdN2c
         nkoRgDBzPxySzkpllZxtbsq6zzxH3UtBNq2uUIUJJFix6ooyFgB06dvAUriSOSLCn9zd
         c4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941540; x=1789546340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEWkKsVzREGRmxQQmEc+XrfzsTnwrOneefxUy3I9B4c=;
        b=UvOw1Ezoi1BHvjN3a3jIa59NUpsGuN9++mO6DrIWLNe6lkscwuriqeDTy+DxdS93WA
         TIYTngAa7LtbWWGAaL6HUYx70fuPmZr/BxcmEjFQ32QWjYVVWUS3rHE6k8M1U4S5FaEE
         gpcw/TLF2WoBKhzust6gP/ie8q4zqTfILwLnBH+ZJxGw2nSmhARkIhiXBcmTYycxI4p7
         X7Q9ZjVFStU787/kEd4QJlIdwjy1PdWiaiPydgy9tS51O/E7AxYjsgFJqzoOuLi4ZhZa
         AGblB+lLin9n2X/nDJmr1Hz+/LPucRPx5FY7o1D20UiZ+OSnOJDNfqX5CElOyHqP/Rfu
         4FLg==
X-Forwarded-Encrypted: i=1; AKwUvBxljV7Uz2OgNuzKtnzMwHd6OtqNTZSmP3NsIxB9AHSe/Gkv4gsYvhSyo6SZ7gEFMbDPF361g55tizyf4v8=@vger.kernel.org
X-Gm-Message-State: AFuF++ltoFU+19Jw9cdTexkmI3VlKzcPL6XAwHYZULwq4mPVpDsMRfEu
	LD8kXkXd8ACuFp3Rd8ycINEenSeWpZIl2vMDb7R4sG+HcByKs9tXtZx6
X-Gm-Gg: AYBFou3YV9KgGXe8q7n+mWGvPqow4GYXjAlnnfOw/ku32wEYbz8Cuq68H7eq/YlrbIF
	riftjE9CN9igUS77t+xuULH+j6nywVa1anHUC4W304+0MhdY/H0vSkS6PlldR5+4yevd/w4evfn
	nOxuHba0Ur/rleIeD7UYPvuTA2FvpOJHAuSjwBWsJfnZNXgo8CH7OuT5GjG7ztzAGxa5OgIvBlb
	QgJ0yB9WmyrPqliQPIcCJ91EA2ElnUBSU2rH2AhMzZmfY7OF1fJMYuHtHaFrHJA1pC/Nv/t8cfK
	nqkgRZO+ESwvvTW81/ZpmO5EKh7GGON0GW5LuBIf4MMChmqOKA9HQDx1fRxfvJe74LNUm6Z63+v
	7f41pUp55QLXZ4EFxsTEzkzXJmR9y0o+38wMDzFFgj7RlSQ9eg5vYdaUyiznPzDwzamEFf/5uXQ
	YxRH8couy7AuaM4wYgcMkE6WEqtBQib0+fJKbSZQ6sk2f+fzIJI/FK7pNV+Wtrh/PTzqFGOGBXF
	9kn
X-Received: by 2002:a17:90b:5745:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39b0803accdmr42757422a91.12.1788941539547;
        Wed, 09 Sep 2026 01:12:19 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:d05c:1c4d:3d4f:dff2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm10336241c88.7.2026.09.09.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:12:19 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:41:57 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet: validate device_path before enabling namespace
Message-ID: <aqEUzUyPPkwFcT73@user>
References: <20260908193452.53347-1-pavankumaryalagada@gmail.com>
 <aqBonYN7WeEn26JZ@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqBonYN7WeEn26JZ@kbusch-mbp>

On Tue, Sep 08, 2026 at 01:57:17PM -0600, Keith Busch wrote:
> On Wed, Sep 09, 2026 at 01:04:52AM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > When buffered_io is enabled, nvmet_bdev_ns_enable() returns -ENOTBLK
> > without checking whether device_path is configured. nvmet_ns_enable()
> > then falls back to nvmet_file_ns_enable(), which passes the NULL
> > device_path to filp_open() and causes a NULL pointer dereference.
> > 
> > Validate device_path before attempting to enable to namespace and
> > return -EINVAL when it has not been configured.
> 
> This was alraedy closed:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=09d0c07bd9ce3b2f2d993f672698d32a17543c32

Good to hear this has already been fixed. I'll drop the patch.

Thanks
Pavan

