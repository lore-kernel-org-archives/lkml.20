Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C67E3783BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835306; cv=none; b=LiuEjHY8UxrdDyxodqRUqLKP9Lyza3YBpS3ofBz+L7VmLRqpB1XBptkJWHUZzR86D7zrdM099Nyu1+A6WJrKTnnmrOCsCdhfuWf+MPCXDnl9xXA+s3ieBPBkncIMP2RaZwciD77iBMvkzSSDZdfv9tmV/FMtqWHk6HcxJX+nWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835306; c=relaxed/simple;
	bh=lPkNSaL6vHbAaLOKMcW2T95QO4h+7ccotF/bxOu2Uhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lv6he9Xc1Txm7w4162LFZk+4JlS7PJMlx2kPUJaplKNa8Ix8tfoDal4DNpV9McyXM08SYfnWwYgPV9e9wLDAuke9Kmb6Ro23K+TSxVrE78+e5MUtqhhndVPBQA21sZ64uT1BYAnJbJMgfaTkaxoyey2Rm58OQf+Uwtv5ZPf4vwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzolZ6j0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzolZ6j0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750311F00ACA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835282;
	bh=lPkNSaL6vHbAaLOKMcW2T95QO4h+7ccotF/bxOu2Uhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JzolZ6j0ysfQxIyINoKPbWXiNW5RZVk4DP6bV47IDIe4zZ+WxtYxOB+HtDsFhzZ0L
	 Rc8aGORwsh9dJ7anGj8meWjZWgS2reHaxH6nuHlyFtJbvAZKEXryY528EfXJXwdlPb
	 3Ys4tHiHRqaB/GeXXkyGKIQf9L/peErPkq5SKXbJnnbWWAeLnKlLRsR+5xsHwIXiAv
	 eUwuHAldI4iR9fw0NSDQ4DLQbSGk6FAWfd01b1bqYvaWX/rzJxuIPXK2j9QPHZM0OJ
	 IhN6SCOKj25S0+ZmUBWbzH3MjLdPJThaRS5SMpgyECq99wmAB+ktSom4wDmYQ1H4kh
	 Q7upI4Zt+zwVg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso203298466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:54:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZU38WG/mv/xI3JuZxWCQ5w5sfJhPH1STYK8/jRrsBxrQ3/sZHkxJTvlDxsWXTrzb6StTWnNZvF8SFKbA=@vger.kernel.org
X-Gm-Message-State: AFuF++kYCF75W0oWVf5tUkpAhi5hq9sUCnf/gFK3SpZlgkeoVgclSGAA
	e4ulNlVzqXpBCqdE56rrYXTrSuwjfdOLb5myXYDRVA2CEz3f5wsSW32S7jcqQsEMFNrPx4Kx6JU
	rgTd//zrRkcoAjrdaoL1Sw/yRw06s01I=
X-Received: by 2002:a17:907:3e9b:b0:c16:8799:fcb4 with SMTP id
 a640c23a62f3a-c250bc0fe60mr1642226366b.19.1787835280939; Thu, 27 Aug 2026
 05:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827055844.1673890-1-zenghongling@kylinos.cn>
In-Reply-To: <20260827055844.1673890-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 21:54:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-UyKniai+7N5g2sWaTF24Vg-NwKzvFkS5KjtZm_XAzHw@mail.gmail.com>
X-Gm-Features: AcwNN1WPrdbI2t8xL8xGPXpoNor0PorgEOvdw00dGp_Dzxf8mvEwI34q7JKtPAw
Message-ID: <CAKYAXd-UyKniai+7N5g2sWaTF24Vg-NwKzvFkS5KjtZm_XAzHw@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix race between fallocate and mmap reads
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 2:59=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> The fallocate implementation only takes invalidate_lock for punch hole,
> collapse range, and insert range operations. For standard allocation mode=
s
> (mode =3D=3D 0, FALLOC_FL_KEEP_SIZE), the lock is not held.
>
> During ntfs_attr_fallocate(), new clusters are mapped to the runlist via
> ntfs_attr_map_cluster() before being zeroed by ntfs_dio_zero_range(). Thi=
s
> creates a window where concurrent mmap page faults can read uninitialized
> disk data.
>
> Since mmap uses filemap_fault() which takes invalidate_lock in shared mod=
e,
> it can fault in pages during this window and expose old disk contents to
> userspace. This is an information leak and data integrity issue.
>
> Fix by taking invalidate_lock for all fallocate operations, not just for
> punch/collapse/insert modes. This prevents concurrent page faults from
> accessing unzeroed clusters during the allocation window.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
