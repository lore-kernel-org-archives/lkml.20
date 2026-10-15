Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D249F129
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090357; cv=pass; b=PVMHUFWJlffd6ODPpQyh71Bu4JVUVtNoUlMRwfSriXq8gjDXkvPayNqvifIz8OfM+TBVRugTqL+ac9eOO/IbO7NAsqPdHQcFEszxwkMNUh88pHYeQFDLe9jLRekvFBvvhcUWQPSbBJfFcQZ2i7sf30xLYZWYIQE6rwViGlVmyNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090357; c=relaxed/simple;
	bh=GIdhD9TeSPWmNsy0fX+a8u6D/y/bXyVjLxaptbqD0Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJrFAjjwoHPB8UAYTs1bNbh4NoRTiOMuXLcPEHcv1jLQ7sStJlRShXNQiM/zrPhfQ+n4yzH3NhXvhVCW0mQvVeNqnDg+aHqmRNWTHMEZaYuqVd60L2X/Jdfv1MqQ4+/KI+qBUa7IseoID/xGWEJsDdQ1QOquDJrZwxA9nCwtTdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGgGYtAM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7DXTUhI; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGgGYtAM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7DXTUhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792090352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sUmonbqyk5xIs2kC+9hn0/UcfQCr5PxfxA1r/ri1EQ=;
	b=MGgGYtAMd3WABz/Fj61R5q9Unq2HyTtDP5jmLWyPTwCYLHHtb1UZAZ+vH/0Ylbd3UfQ6Dh
	+wD37RgiGUxYmkCdxXM1IgaOg6fh5bpHD3yG4gUDS+z/IbdA79j/5kj/vfZVL4UZwnn9F5
	PpF0jRzmPly4Sjv6Wj0kJR9nYHjRJuM=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-S9VnXDzHNTmsgLlNqjOFGQ-1; Thu, 15 Oct 2026 18:52:25 +0000
X-MC-Unique: S9VnXDzHNTmsgLlNqjOFGQ-1
X-Mimecast-MFC-AGG-ID: S9VnXDzHNTmsgLlNqjOFGQ_1792090345
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c10b8abe29so4392008137.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792090345; cv=none;
        d=google.com; s=arc-20260327;
        b=naUdjf0tw6gbeq+FdwT/haJx5PjvNu0TQhsKRGJD/761URrC1K63/R9pv7LJBpRBnx
         xHC6sEPUG/hOpv/hVOCoDKDfeg6Fz+Rxo8aOXFf5y+juYUihFG2zgaO8xCFiNhi8W3Bq
         qLWSocMtNfxvB5EwUTUgT3rzJmXK7DXmvBXSG9g8D5ZHyuGSS7G97l90J/UrY5/3qT5V
         /MiyAcJI8IhS8VGMI7/FXzfF3fcB0ciOlmdC0iiscGHcboow+ydWHv6M09v8E7vRoHeE
         nieWR2ObdoOFaGG3SRQ/fpqgRu+csgXY0iN9W6VkHdQzhVJVvkuZiwLSvxWXRYffvggZ
         ryUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sUmonbqyk5xIs2kC+9hn0/UcfQCr5PxfxA1r/ri1EQ=;
        fh=OzG8XQeRHYkJ6xGZnaL8HH2q8NEK2OZC2KBprHz3rRs=;
        b=fb9UnEtO7iTDtYHHDN6y4CP7Rdfp+kONNUlycs55qKNxKFJNS9+xFgZ9xjsnZKzGUO
         YZ1SeZ/9XynUIF+X3z0/iLapK0uAAKKRJHg2wJcoK5LMbW4IKtInTIVjWaHL0dQB1Cxd
         HcX6XgX6pqpKpgKEkBBGSdf3FDjOAr2Ku2f+N/PLWWQn+Qh/XTFzzi+mbKnHVFi5YlJX
         DMEqvr6r9upJnsgrYPqCNyVKqTEE9wZlTmtz/pHx1VBCQ+ZJ+8DY5MshcQeaBeQgfsXf
         kwnIyjEn6mA44/qBbiSrtfwgBXgipFUCYv5nvhqOI2yaT/Gt0flMyskkmFd5kfgSrvTm
         xzMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792090345; x=1792695145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sUmonbqyk5xIs2kC+9hn0/UcfQCr5PxfxA1r/ri1EQ=;
        b=S7DXTUhIDeHVUxu1Kr2e5fJr+HhYZfjy443/e+IoVrkaJIW7uoG08nkkMqyQLyvdQy
         q65Wd1LEo7MWI4T14hYpe+xZWvH7NF7ttX+6SvWULQPbpHHKD75w6uLsO+jw3eSBoazs
         enZZRTbw+vnumLRg67Mv1iehY9yfZkY2KDbg39SZGgLRizKv8HX4ZCxiTAq5ZHqsrcGv
         LDOtwQq5LTa9o78cb9PsgWYvVAMM6L0TJdYFi2ltstDiAk8pSBAoRxSc4t147xWZHRoW
         PFpQR3Qg50+xeUu7UEL7t1bzwwT7RU/BMLmJ3r2Fe/7f7eP9LpoDjqGVstL80V7vzcSM
         E8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090345; x=1792695145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sUmonbqyk5xIs2kC+9hn0/UcfQCr5PxfxA1r/ri1EQ=;
        b=wo8NwEOl8xolIMgn2aDFEOWYrudHQGhSJ0RL3Gg9+IrG7kgJmm9f9KIEiZDoRRidG+
         j/55OydF6x1WK973WA0AsAjONVKGbLLE/beY5e4XekOVvtqNd3eJzUxUWKigsIdDcvJn
         Bc4AhWITx377XZ5TcZvpASLgn1PDrL06pPxVS9/o+yx8em9CDhpx/XYiXC7iLnBiIsSp
         oJ1FVVmMvUIMQ9N9v5ihzelSy3fqAeIn7Jyr1mk+wtA+HNpUFSSKAJwTINEwz4J6X+ds
         DJA8llfmzT2vOxMBKDCxoSEDBMwk83aBg2Y8/8VcNQM/CIsmla2QS549xVB84Fjnw1V4
         huzg==
X-Forwarded-Encrypted: i=1; AKwUvBxBSrgrkaE3V0MRwP8JcPtvGIUyIzMrmLED0peZPxDMgUYFB3Zq1ceQgFib96KpuZV67YgkA7YhM0KiHwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5rvsAR7SB6pntNMOtZN+1epM7eUtr/1MHpUt8Q5o7+6TPKx8/
	vWpQzQsAhNUDN+jw21kXF3quPkEPoqkh+0Bqf7Dix7RCIs0it3+z5oiHL8251O9UlY0MU8vnQYW
	nVWRSLg0lzrteN+6EmxLzIrkPKxMXMapTUtVUFY5/yX5SMO+rYVG4vz/k4kRNeUWAET6JrW7RVX
	3PvACTjJND6f3pRh2ayaPzc5yn8zJrl9zEqEYk1OmJ
X-Gm-Gg: AYBFou0tzopYoNVQf0DvtAItDr9Yyj5Idpj/Gk0ZQZewY/gYIT0dgPS5WeuleBj5C38
	/hMh9zKKorVSL0bWaSw03xp7AIId9HlNDwVMlevFYvXCydA0r1iJhpWnhLRKmEvH2cT4sj61lu0
	DnCGxrezH3wWVbbeT98YI4nl3fgW/cBXzHrukYmczBTGY8cqppMfXzB7op8BXHoKbB3xF7lq97D
	cjSrjd42RPSjwKAzvcCrRUfcCVyNmwvgZ95OjFzRyZnyW04yVZhHTrfZSElcsq504aJuQSgNtqP
	VieAt3fr63fnrFmFBwbbKOvBJA==
X-Received: by 2002:a05:6102:2909:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7cb3a15e9a1mr7057355137.32.1792090344947;
        Thu, 15 Oct 2026 11:52:24 -0700 (PDT)
X-Received: by 2002:a05:6102:2909:b0:7bc:1de3:39b0 with SMTP id
 ada2fe7eead31-7cb3a15e9a1mr7057329137.32.1792090343324; Thu, 15 Oct 2026
 11:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a01d0a297a3e174d21741a3ad586ce546327603e.1792081664.git.amarkuze@redhat.com>
 <20261015183548.GE2170687@google.com>
In-Reply-To: <20261015183548.GE2170687@google.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 15 Oct 2026 21:52:11 +0300
X-Gm-Features: AclHuK8AcY6paQ-tWkxVfhofIbCNjjczg8Wu8LAM9XVRyc2K231BtACLuWOj-8w
Message-ID: <CAO8a2Sjr6XSizdgobZK1ZAO8PUd5tCDFKjdD-=3TXHwqOU6qfg@mail.gmail.com>
Subject: Re: [PATCH] fscrypt: allow filesystems to disable symlink target caching
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubo.li@clyso.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

This supports the concurrent CephFS subvolume quarantine series.
There=E2=80=99s no Fixes: tag since this isn't addressing an existing upstr=
eam
regression.

The quarantine series adds checks to Ceph's ->get_link(). However, if
an encrypted symlink target was cached prior to quarantine, the VFS
bypasses that callback entirely when following or reading it. While
the target data is still valid, access now needs to be denied.

This patch adds an opt-out for symlink caching and enables it for
Ceph, handling the encrypted-symlink case for the concurrent series
without affecting other filesystems.

On Thu, Oct 15, 2026 at 9:35=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Thu, Oct 15, 2026 at 05:46:24PM +0000, Alex Markuze wrote:
> > fscrypt stores decrypted symlink targets in inode->i_link. The VFS can
> > use this field without calling the filesystem's ->get_link() callback.
> > The target can remain valid after the access policy changes.
> >
> > The CephFS subvolume quarantine series adds access checks to
> > ->get_link(). Quarantine can revoke access after a target is cached. Th=
e
> > VFS cache can bypass these checks.
> >
> > The no_symlink_cache option in fscrypt_operations gives filesystems
> > control of this cache. It applies during target creation, lookup and
> > getattr. With this option set, the helpers do not read or update
> > ->i_link. The filesystem callback can then revalidate access.
> >
> > Uncached targets use the existing delayed-free callback. Each uncached
> > lookup allocates a temporary buffer and decrypts or encodes the target.
> > This lets Ceph reuse fscrypt's target validation and buffer ownership.
> >
> > The default setting keeps the current cache behavior for other
> > filesystems. Ceph selects the option so cached targets cannot bypass it=
s
> > ->get_link() checks.
> >
> > Signed-off-by: Alex Markuze <amarkuze@redhat.com>
>
> This sounds like a bug fix?  If so, which commit is it fixing?
>
> - Eric
>

