Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867803;
	b=THcxlyW+MExazFujh1/0GshtXHNIrQlt4xcMI/1V0Ro2FkGNWlGkdbZUzlM5k8UWYO2e
	 qy8EJhW6RRSIx5wqirjoXW9o5UlDTgH72TU8Zu9UwzC3adWauNLZ0AxEtYshLPyhzGsD2
	 +cpE+kr+EI98n8nrWzF/Gjk16rmff19nZVclCcUV855BzRECIb7iFO2Ral17HdmB3Qz/W
	 JuGQNOR9Jvpvsxb/8UCz4ZAtRPMmBV6YOu9jU/cvfhzmdzwKRA5J93InEtpLvE2Mvjqq0
	 GTUQfLMHAEYF9BQLuWBYTRtfk1RVt5mZW7Hjpi+If8kpnkx8+fgfnwL4mdHyvUKsJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867803;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kxge2GEFo4yXYtoapckZ3J7prv6F237AsUeFH4+GTVY=;
	b=j1k0nRe/yZN6OAfv9Cf9lHWgTySzDmZIBF+I/4z/6MLbXUyKXIg6HfE6OYx+6hYRcTmM
	 nXPDsZ+kZzuByFxaYwI6SuAqKTeAjIYYilaz/iTVWVJuPv0iBUVq9xs4JmyCV2u4M8ahi
	 07UiC8KaE2JEsGB0vuBazxLw2XStAfRlC6i5dyA6ZL3vUHbP5k9+0OYlgmu3mjLXkCrGZ
	 C/ieO1pm1wXrS+4DzI4RYgXxnBLsgYgughPuyvp8HUzhiJ+EV/Z8iL9L0mKMjV8OTinSN
	 3uNAe00MzD+VvKUTv5YlNXsCVg+vIxL9zwRbIs1NsSEwz1iH+qpRRwNxJU3IZX15uZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FuZlV8ZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B701606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FuZlV8ZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108291F000C9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794867803;
	bh=kxge2GEFo4yXYtoapckZ3J7prv6F237AsUeFH4+GTVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FuZlV8ZPYtRdQDGK7LTdXtY/J7a66h2ALaaQHbIT9iJE5rYUzVPaHjN9fe2ztuyOf
	 Yxz/rfiOreUzDRSgI8p8C56SeG5pk/vt+wUtPRPoCL27h2O4Sai3VO5IcXUDyAjG2J
	 2YX0ko8Z/jqmg25DQExODEam8pNUoSx+GSR0h0RQwieDfFhisZd7w2sk0/KCLOQNSM
	 DqT2dLuT9aMnIdTXVWqtX4TevQlM6Dzphh72DTCtg9JEIPJgtn7VbWiml2g0VPahRJ
	 4G2ncqC/jPl7URZdKVWBwzTpPv3it/MfuvN1dR90j4+diXThicYjDWG8doW68lZ8sp
	 vTU/f/8+NF6HQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so646937066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:23:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESLhSFpj8wFJMKKh2n0k2M00wZTCTJ0NqKQGEElQOaHZwan3xYjL6oLChzAALDuI969gKtOzz4awS4+so=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VTRXpiHFl4TOSYzWXus3cJjR+UQ6EtG2SukUcjUjyB3YjE4sL
	9r3o1YItb+i9tgRJtkiw+up41kuQc1AurDrGEuE2cBynEhISWyHaAIbimCFVIx86spXJCVgPItD
	c5lCMbjdzOq5y8n36en2U9y0uwSWdJHI=
X-Received: by 2002:a17:907:3e0f:b0:c50:4a71:cb3 with SMTP id
 a640c23a62f3a-c50964360ebmr984193566b.48.1794867801718; Mon, 16 Nov 2026
 14:23:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116154526.429315-1-koray.fra@gmail.com>
In-Reply-To: <20261116154526.429315-1-koray.fra@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 07:23:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9pfXONEwiVW0H9+FyA=tfHpDrJHfrrsike8oj_67f8bw@mail.gmail.com>
X-Gm-Features: AclHuK-PzHoRy31HPzGRk-YarstUA5LnLLKyVqt2F2DAGLwsWOUKlEA67cp7JYE
Message-ID: <CAKYAXd9pfXONEwiVW0H9+FyA=tfHpDrJHfrrsike8oj_67f8bw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix times assignments in cifs_posix_to_fattr()
To: koraynilay <koray.fra@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Aurelien Aptel <aaptel@suse.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:45=E2=80=AFAM koraynilay <koray.fra@gmail.com> w=
rote:
>
> Currently cifs_posix_to_fattr() wrongly sets SMB's CreationTime to
> fattr->cf_ctime.
>
> Fix this by setting fattr->cf_createtime to SMB's CreationTime and
> fattr->cf_ctime to SMB's ChangeTime, matching the behaviour of
> __dir_info_to_fattr().
>
> This patch also fixes a few related issues reported by sashiko on
> another patch (see Sashiko Link tag).
>
> Reproducers for these bugs, with /tmp as the local filesystem folder
> exported as [test] in ksmbd.conf and /mnt as the smb folder mounted with
> mount -t cifs:
>
>   mount -t cifs //127.0.0.1/test /mnt -o username=3Dciao,password=3Dc,pos=
ix
>
> Issue 1: ctime clobbered by CreationTime during readdir
>
>   mkdir -p /mnt/dir
>   touch /mnt/dir/file
>   sleep 4
>   chmod 644 /mnt/dir/file
>   stat -c "ctime and btime before readdir: %Z %W" /mnt/dir/file
>   ls -lc /mnt/dir > /dev/null
>   stat -c "ctime and btime after readdir:  %Z %W" /mnt/dir/file
>   stat -c "ctime and btime on disk:        %Z %W" /tmp/dir/file
>
> output before the fix, notice how ctime is the same as btime after the
> readdir, while it's 4 seconds ahead (because of the sleep 4) before the
> readdir (on disk timestamps are not touched):
>
>   ctime and btime before readdir: 1794842068 1794842064
>   ctime and btime after readdir:  1794842064 1794842064
>
>   ctime and btime on disk:        1794842068 1794842064
>
> output after the fix:
>
>   ctime and btime before readdir: 1794842908 1794842904
>   ctime and btime after readdir:  1794842908 1794842904
>
>   ctime and btime on disk:        1794842908 1794842904
>
> Issue 2: btime and ptime wiped out by readdir
>
> [ no reproducer as it only happens after the linked patch series is
>   applied, since it needs cifs_i->createtime =3D fattr->cf_createtime in
>   cifs_fattr_to_inode() ]
>
> Issue 3: in-memory inode aliasing (flock bypass on hardlink via readdir)
>
>   mkdir -p /mnt/dir1 /mnt/dir2
>   echo "test" > /mnt/dir1/h1
>   ln /mnt/dir1/h1 /mnt/dir2/h2
>   exec 3< /mnt/dir1/h1
>   flock -x -n 3 # get exclusive lock
>   ls /mnt/dir2 > /dev/null
>   exec 4< /mnt/dir2/h2
>   flock -x -n 4
>   if [ $? -eq 0 ];then
>         echo "acquired: duplicate in-memory inode"
>   else
>         echo "blocked: same inode"
>   fi
>
> output before the fix:
>
>   acquired: duplicate in-memory inode
>
> output after the fix:
>
>   blocked: same inode
>
> Fixes: 3d519bd1269f ("cifs: plumb smb2 POSIX dir enumeration")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261115180343.576773-1-koray.fra%40=
gmail.com?part=3D10
> Link: https://lore.kernel.org/all/20261115180343.576773-11-koray.fra@gmai=
l.com/
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks.
