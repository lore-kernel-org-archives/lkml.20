Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668775;
	b=OLBgrs/edKngc2kfuuf/3D/eFi/QPzKNZSpX/9GV3Lt/gxsnbT9yILfwXX5ZHbERrLcA
	 F13fMBJeJLfR0qKz1BiGscA9rVYUlocHJt+HAhvcYCozUVE8OzfDyy0z4Uo6UHRYFkLRZ
	 9cbOrAyMYIcpqBXzsbXoDt7UkpqLaZa0VVcXfuexeTqOzXwpIjjDY9Ge799Cjk71a3DbF
	 ZjZt8WKFMFx4BcS464CPIXxyiP4hSKeoeDzJj6sjKrvF8vUjImWUYkSFRpzflCqkfHXWl
	 E5rA+QzlfgDXuJhQIcK4OvfiQYh6Pz20SfznqiKK9DsUENhR8+dox5ii4UjBL5DFvjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=OzeCAPmNW+SHsrPHyP2lgHfACb376kvzXRAy4aBxIGI=;
	b=aknGEPnEEOKTS+nQ1llw8bprsHtJR340KO2IBVkuI6tgTgxtMo7+ZQ1NtWa6butV/rn8
	 NOb2uAZtiLue6RlXd01X8rGAbGfkXU4V27y+ys86Hgz3KfN+LLE1mysJII+cOSuTONhnI
	 NnzXT3+EsDrtrIuSAVia/cHRUJqn6GJYMrBRf+RFcavQ0uzybE2BhlbYQSuTbOAUzGiW7
	 TRu3OY0Ib+U1tvMMUFNrN0GCUkq/EmHITkQseJElYFm2oWHunjC/FVhSn6grQR8B6bpkr
	 Am9vW/vm9+aQ4VRlPibuJUSDk8OUdonKC0gtEjGv3mbcXypASplZcfuMUKPb3Dn1XMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dilger.ca;
	spf=pass smtp.mailfrom=dilger.ca;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69D606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE69D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dilger.ca
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2893531bso951037a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20260707.gappssmtp.com; s=20260707; t=1793668764; x=1794273564; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OzeCAPmNW+SHsrPHyP2lgHfACb376kvzXRAy4aBxIGI=;
        b=WLyuuwnEhkbAyv28mwDIKyWMkPW+CaP9ZTshNGZcTqE1nhqBVxUmsjtyy4mQbGWbt4
         rlNZCrwEFtGxid83cj4tDMvLM05p2Z02rPI6Us/tthLuA9ws6uylnx+0Ls8EVjIDXfzd
         ePpjDOYPpKHWSBgnzeIo2DZuZxCNnRfcp5iDjXAijLYj3gQvO8Lwnq0kBbQZJv4+lbrf
         HzfDUzQO+pBVTgxZp0qUPUIr/ceYzNPPL5Ug5vEKueEig1bCyp0zqaq1j+GSD0oTwg+9
         /FFnjHTlruZ36DI3TIdFUyyWrXxPvb20pWegZcfg6zqdNBBPdZ+cMs2vAbkUyVFlhsvu
         QTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668764; x=1794273564;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzeCAPmNW+SHsrPHyP2lgHfACb376kvzXRAy4aBxIGI=;
        b=XolxIWyiDyKFQ8Qe0G58ErrfENhpodHNPTvaTyCjGBeV6YVFAmn+NnYishkVsYRZNn
         CFL9uoVqm+WAdNBT6hQZBrVcu9q4oUd5obVMBeE6jbHmSAWEmjXOd6PcZ/R7khI+pexR
         RvrnoH7MC77lbxOb0bewLSlZNo3gxzU0T90Ixk3dlVCarWFkTPvaMvG4TX3lSuaDnykk
         I2C0H666dXaIF42Uw9KBiEgfRQEa17D0/brsUSrok6tfBL28mRYsAu400alkobWjqIC1
         X4LgRN81CY0xlBz4MlXNjHGtGO1bsmb5Mh9XHlxPRnf2hSylWopm7pNSgKlLn+blLNP5
         YSHw==
X-Forwarded-Encrypted: i=1; AKwUvBwGTXKnRwzPYfrFmN9S0z4dv+rVQWrcRxKubkBhxLHXoCqjmNAmZ1zSuTbPKcZd1+3LHirCsghKkjFKezw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vRpW/snqOS54WZmBaFtJETJ7dPlkL1gNsul5RtpvgbsjDsVhl
	jW0oFr5xFHyKKWWKT6MLwbPVoEc3tQByFJmnlGwi1sAVrijuM8v9BkuHxIM0OtJ1U3k=
X-Gm-Gg: AYBFou0wdxDCIf7DpP1ItEFAUauxHyEqV5I3oW/QayaSjWehmyi6gG1laJirkB4Upyf
	iSbGvuD1meyzkGfqwyAbma9ebXMxvQHzKalrqo1iiSwSlE5wrCmvQkAiNcl03Rc5Oel3krCaPPZ
	xshP4uFlIZiOU2O45pAa5b5YBxWzBxRXdf6FFmLTwfZUS9B8Tosq9UnT+8Q20gJmKKDGMvvBwa+
	PyCMuVLx9sfZmW/y6jhtAquh073ADTgizqKRPJ9g2CMet5BlCrzZVd0WlhvHUg8nkyfcnD5BUEj
	B07Sp4kZ3++6Jkh1QMs3rKOfoOwuobRlm3qzYr2WynCIav36pM9cQn4l+/jhE1iYtuf82UvgiGD
	bteQBdm5Hbd48sTyvK6F8e9gN0z+fnKexh+dIlPowBTsd8QgG7znsa+VBNQzcNHXEOc9aGQRRPR
	l8rBYPYLkvVVOHH5z4qFU/EBHuvUbZYdR0T3qFJkSWcEopaXIIpDddPF55rVwyjbeAH6G+0pIdE
	v5L4jVXo4RUw+bpu51L6pQUmY3Q/ee6K7v7yNGFdxSEdg7knTpLh6vze5sY3orQyMeaTbKCHc97
	A8/rZOZ/fiYkej8Geoey3CNJigz1wUpAf27E9VSsZZBujE4Wb0L6DQWZJWm0Csymu5tUCj5Jc1u
	56rbxw4+mYEB9mSrNWbbdIZ+lTtINpw==
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7031480a91.17.1793668764007;
        Mon, 02 Nov 2026 17:19:24 -0800 (PST)
Received: from smtpclient.apple (S01068c763f81ca4b.cg.shawcable.net. [24.64.171.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm1446998a91.16.2026.11.02.17.19.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:19:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
From: Andreas Dilger <adilger@dilger.ca>
In-Reply-To: <20261102153845.d67wlorqcbe3c2w7@pali>
Date: Mon, 2 Nov 2026 19:19:11 -0600
Cc: Amir Goldstein <amir73il@gmail.com>,
 koraynilay <koray.fra@gmail.com>,
 David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <mason@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Yuezhang Mo <yuezhang.mo@sony.com>,
 Chuck Lever <cel@kernel.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Sean Smith <defendthedisabled@gmail.com>,
 Andrey Albershteyn <aalbersh@kernel.org>,
 Pedro Falcato <pfalcato@suse.de>,
 linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 exfat@lists.linux.dev,
 ntfs3@lists.linux.dev,
 linux-api@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD1A08F1-8F47-4612-A807-AEA39461AF9B@dilger.ca>
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <20261101015551.786044-4-koray.fra@gmail.com>
 <20261102142452.d6jkitgdeuquy23i@pali>
 <CAOQ4uxhQ3uhq6s+4deEJAQV5iy8QZoucojR58_dUNYrnjt_yvA@mail.gmail.com>
 <20261102153845.d67wlorqcbe3c2w7@pali>
To: =?utf-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

On Nov 2, 2026, at 09:38, Pali Roh=C3=A1r <pali@kernel.org> wrote:
>=20
> On Monday 02 November 2026 16:09:41 Amir Goldstein wrote:
>> On Mon, Nov 2, 2026 at 3:24=E2=80=AFPM Pali Roh=C3=A1r =
<pali@kernel.org> wrote:
>>>=20
>>> On Sunday 01 November 2026 02:55:49 koraynilay wrote:
>>>> @@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idmap =
*idmap, struct dentry *dentry,
>>>>      if (flags & FS_APPEND_FL)
>>>>              new_fl |=3D S_APPEND;
>>>>=20
>>>> +     if (fa->fsx_xflags & FS_XFLAG_PTIME) {
>>>> +             ni->i_crtime.tv_sec =3D fa->fsx_ptime.tv_sec;
>>>> +             ni->i_crtime.tv_nsec =3D fa->fsx_ptime.tv_nsec;
>>>> +     }
>>>> +
>>>>      inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
>>>>=20
>>>>      /* Save nodump flag to return in ntfs_getattr. */
>>>> @@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, =
const struct path *path,
>>>>      if (unlikely(is_bad_ni(ni)))
>>>>              return -EINVAL;
>>>>=20
>>>> -     stat->result_mask |=3D STATX_BTIME;
>>>> +     stat->result_mask |=3D (STATX_BTIME | STATX_PTIME);
>>>>      stat->btime =3D ni->i_crtime;
>>>> +     stat->ptime =3D ni->i_crtime;
>>>=20
>>> For me this patch looks dangerous. Somehow I would expect that the
>>> "btime" will never change for existing inode.
>>>=20
>>> But because the ptime is mapped to i_crtime and ptime is settable =
from
>>> userspace, with this patch it is directly possible to change btime.
>>>=20
>>>=20
>>>=20
>>> I was thinking more about it... Is not this just misunderstanding of =
how
>>> the security model around the times is working on different systems?
>>> Because on NTFS there is stored just one field which says when the =
file
>>> was created. There are not two fields like "time set by user and =
time
>>> set by system".
>>>=20
>>> Windows security model allows anybody with WRITE_ATTRIBUTES access =
to
>>> change that create time. Linux security model does not allow to =
change it.
>>>=20
>>> NTFS in this view is just a filesystem like any other (ext4, btrfs, =
...).
>>> In my opinion if the ext4 or btrfs filesystem is correctly =
implemented
>>> on Windows systems, then Windows security model should handle it in =
the
>>> same way like for NTFS or exFAT. So if something grants =
WRITE_ATTRIBUTES
>>> access, then Windows should allow to change also btime on ext4 or =
btrfs.
>>>=20
>>>=20
>>>=20
>>> On the other hand, I understand the use case to have two creation =
times.
>>> One time which would never be changed and could be used for any kind =
of
>>> atomic / synchronization by userspace application logic (this =
btime).
>>> And another time for human which can be changed at any time to any =
value
>>> which user wants (this ptime).
>>>=20
>>> In any case, I would suggest that filesystem driver would not report =
to
>>> userspace unsupported values and would not try to invent other =
values
>>> and lying about them.
>>=20
>> But all those fs with mutable creation time already report it with =
STATX_BTIME
>> so what can we do about this?
>=20
> Well, what I wanted above to point out is that the "mutability" of
> creation time is not feature of filesystem, but in my opinion rather
> property of the security model on the running operating system.
>=20
> Maybe better question is: how ext4 btimes differs from the ntfs btime?
> In my opinion there is no much difference, both of them has meaning
> "time when was the file created".
>=20
>> If userspace requests both STATX_BTIME|STATX_PTIME in mask arg,
>> those fs could technically return only STATX_PTIME and it should not =
regress
>> existing programs.
>>=20
>> But this is still a bit surprising behavior is it not?
>>=20
>> Thanks,
>> Amir.
>=20
> I'm not sure what to do with it.
>=20
> If we allow to change btime of ntfs then for consistency we should =
also
> allow to change btime of ext4.
>=20
> Maybe another idea... define new capability which would allow to =
change
> btime (on any filesystem)? This would at least make the consistency.

I think the ext4 and xfs maintainers have repeatedly said that =
btime/crtime
attribute should not be modified by users.  There was a long discussion =
on
this from Ted as well, and the reality is that "creation" time is not =
worth
the bits that it is written on, since it is not preserved by any tools, =
has
a "vague" meaning (is it when the *file* was created, when the *content* =
was
created, do edits update it, is it preserved across filesystems, =
archives,
etc.) and adding it into the filesystem is misplaced effort.

Storing it as an xattr has some reasonable chance of being preserved =
across
tar/cp/filesystems, and doesn't introduce a herculean effort of changing
all of the system calls and on-disk formats for every filesystem.

Cheers, Andreas





