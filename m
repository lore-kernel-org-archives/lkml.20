Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883500;
	b=PyhP8++VZjnyLsj7dUQeVUO9VAh8mRMZ5Xg7n2qCLRzaNbEHgBed5MYcnMDPrrh18rll
	 iZaPQnfzR53cbeGeolTKRajncdjLr9WL1iAf7eYH903ROF5i11HmtbepVTJErwh8kBhbt
	 ZcFX7ll/NcGdbZVeZzSrCn1CSfiLbJMZttm1Dbssbl79yD2EUfA0z3bA4cEiwXsLn8K9q
	 NTpijPNoV4JCr/aWEcZOlfhflB/xGx5jbhZ50Z4dH9gbqRLra37ywTGijHPGCmoR2tQtU
	 LIMRd4KNS+6El+BOnjYGF5ZD88Kw/GmI6dMenggotnSXWkCveRv6cWZcekSJEo2bhyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yJ0z/cTDVgrB07z6XnWmnCa5Nm3W6f3XldUZrdDkL14=;
	b=5F9lhbxdTMrO1HC6CD91U2xIWV4CfzN8wLWV7EYyLxig3gJkYlrm0P1QbwjYhcGxSTF2
	 nEeGsfLQ+2ch7Kj/C/J/oHLMyENr+8zzXg4wUDZRhEzCy27bNvXaCCYQ7VoCALZ2g4E0t
	 TeQycgLaYrxLARI4dovd7IgGLKJJuPw792ImY5d34gURyXJCBiszqETyK1KyH0OMq28n8
	 qEf7o8Oe7jx7oWVpnS1jx6rlg5UCQsumGdhTiFzUJvO7HqywkeMA+yyXK6LPm+lJu/ciT
	 VyioC8O3KRkBP/oNJNHwMU+gbCJP9aOtCgkoZJxm+9HgOVtsZzjWZqp3Ikey37Kce0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kxl5d7/C";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F04F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kxl5d7/C
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so618304c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794883499; x=1795488299; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ0z/cTDVgrB07z6XnWmnCa5Nm3W6f3XldUZrdDkL14=;
        b=kxl5d7/C/t+g3pOSPDJC2Ldh7jajtnNKESNMgwNtdbWgSneqge+98L8TnRdRaqFofr
         cDgtlOG8hyb7TWxS1+Bmk2VvXnPhX15/5XVuyCFN6h5Agt8DNOUjWkinKxJr41UQJ4sn
         f36eZdsv+5BVnwA/Bc0X9AnTI+O9yfKFqk45hr2tMM9bH6Ao+yhB3XUoc2XmkK/SsWQ0
         f+bEbsfajqp4ogCCoZv/KS6JwmGpSsWI7BqnEZRpW5594DBrtSQXyEirJzLeySb+/zLA
         gtJZi3PtyivfLk3JnIYcLaurFsoZr8TubtSA1tHNA0VxBHcCXNN8yAnUO+anzhBvHART
         9IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883499; x=1795488299;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJ0z/cTDVgrB07z6XnWmnCa5Nm3W6f3XldUZrdDkL14=;
        b=U7fgrLfX9vny1gA8w7/yLSCM8D9vcb3cJ2yxy5DHg537h8GEkrVAZgf/wcexCxe8Xf
         91LJjTZXN7l6H7mfoutNoPvkqN0GpypCzL5MQ3M+3CQOAbb+HRhmsScO/J64QsDupUG0
         zWjOx/FHkcC197e8V80WUT62pJBz2vkPfNIG2T/9U+UKlZFrMTZET0YjcGOFGsffjNwj
         xM1lzoP+v0CZcU31BNu+WqY2kf2ebbyvLEFqQF6KRmvNjrGfxmS/hezpg0y4w+gqYDyp
         oZFuwJRmcW/vKcXG4PdrUjJLRT1YCwE+M7bJBR0csIS+7L1O0FMBsoXmNg8BSzFCH6vO
         i3YQ==
X-Forwarded-Encrypted: i=1; AL+hErGiJzmlekR/d1LDjh04o64gnFA3Iwr8PxDvSZt/5608uINEVl6RLwaXKNU9AyOzP7nwcjT4eOsMbQwAHdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kf8t8qJNnK7vmk7x3yNPcqbWe+wamCf4PtmaA437WfN9VcUTm
	tZhIV3qhs0F58fISfXloVaMsOMZrwhkUQXYdR/tm+W58LoqosboOP2fh114Kl5j5HOgGt4afKMR
	jmiyu+mau9BO9vu4Dnx/uL0pIz92ppwzC2PuCWQ==
X-Received: from dlbqq13.prod.google.com ([2002:a05:7022:ed0d:b0:1a7:44f:3bc7])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4594:20b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b50313a743mr10766037c88.39.1794883498730;
 Mon, 16 Nov 2026 18:44:58 -0800 (PST)
Date: Mon, 16 Nov 2026 18:44:44 -0800
In-Reply-To: <878q2swoxp.fsf@cartola>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113065332.929085-1-sarthakkukreti@google.com>
 <20261113065332.929085-2-sarthakkukreti@google.com> <878q2swoxp.fsf@cartola>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117024444.2653745-1-sarthakkukreti@google.com>
Subject: Re: [PATCH 1/3] libfs: reject casefolded names that fold to ".",
 "..", or empty
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>, "Theodore Ts'o" <tytso@mit.edu>, Eric Biggers <ebiggers@kernel.org>
Cc: Sarthak Kukreti <sarthakkukreti@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dmitry Torokhov <dtor@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 02:34:26PM -0500, Gabriel Krisman Bertazi wrote:
> Ugh. I agree this is a problem, but I'm also trying to understand first
> the real impact beyond filesystem complaints during lookup, if any:
>
>   1. Looking up ".\u202e" folds to "." and matches the on-disk "." entry
>      (de->inode == dir->i_ino) in generic_ci_match(), triggering
>      EXT4_ERROR_INODE ("linked to parent dir") in ext4_lookup().
>   2. Looking up "..\u202e" folds to ".." and matches the on-disk ".."
>      entry, returning -ELOOP via d_splice_alias() (or triggering
>      EXT4_ERROR_INODE on the root directory).
>
> These two look like a "do stupid things, get stupid prizes" with no
> further repercussions beyond the error message.  Sure, we can fix them
> to throw EINVAL, but are there bigger repercussions I'm missing?

In addition to what Eric mentioned re: side-effects due to
errors=remount-ro and errors=panic, encountering EXT4_ERROR_INODE marks
the superblock with an error flag which can trigger a full fsck pass on
the next boot.

>   3. Filenames consisting solely of ignorable characters fold to "" (0
>      bytes), causing distinct ignorable-only filenames to hash and compare
>      equal and creating entries that e2fsck flags as corruption.
>
> This seems concerning. Do we actually writes multiple files to the disk?
> shouldn't they all be folded into the same empty string and rejected or
> at least written as a single file?  I'm not sure how it'd be writing
> multiple files to the disk, that seems like a bigger problem.

Sorry, that should have been specifically for f2fs: ext4 will only write
the first ignorable-only file to disk and subsequent files fail with
-EEXIST. On f2fs, f2fs_init_casefolded_name() treats `len <= 0` as a
fallback to raw bytewise hashing/matching, which allows multiple
ignorable-only files to be written to disk (which fsck.f2fs then flags
with hash mismatches).

> > Fixes: c843843e714c ("fs: Add standard casefolding support")
>
> This bug was just made generic by c843843e714c, but the issue was
> introduced by b886ee3e778e in ext4 and the equivalent f2fs support.

Ack, I will update the Fixes tags in v2.

> > +	if (name_is_dot_dotdot(str, len) ||
> > +	    name_is_dot_dotdot(name->name, name->len))
> > +		return 1;
>
> This is checking for strictly encoded '.' and '..'.  But I'm not sure
> that happens? Do we really reach the dcache for '.' and '..' instead of
> the name of the parent or cwd?
>
> > +	um = dentry->d_sb->s_encoding;
> > +	cf_len = utf8_casefold(um, name, buf, sizeof(buf));
> > +	if (cf_len == 0 || (cf_len > 0 && name_is_dot_dotdot(buf, cf_len)))
> > +		return 1;
>
> I think this is a bit too late in the lookup to detect these
> code-points.  I'd much rather we fail the lookup outright instead of
> attempting to treat them as different spellings of . and .. . But isn't
> this dead code because we are rejecting those strings in d_hash through
> your hunk below?  Is there a way we get here without the -EINVAL in
> d_hash first?

Ah right - let me get rid of this for v2.

> But the way I'd suggest be handled is by rejecting the ignorable code
> points lookup (all, but variant selectors for the reasons above), early
> in the lookup path for case-insensitive directories so they never even
> get to the filesystem.  Wdyt?

As Eric pointed out, since variation selectors are also
Default_Ignorable_Code_Point and stripped to 0 bytes by utf8_casefold(),
allowing variation selectors means names like ".\ufe00", "..\ufe00", and
"\ufe00" still fold to ".", "..", and "" and hit the exact same bug.

Thanks,
Sarthak
