Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625221;
	b=T46bmYr6tMP1IsntbooKesMXPNBBNy38S/ANyCv//rb7cYr2tWxpmWR/iLXIFhhLywh+
	 9C0Rn+tCIU99ukT62K7pfU27Bwx7YY2bYtVubS1zLI6HvQjfSIXtA6mjGM9P7NzE5qcvV
	 Ae0SN2Xy8SQb1OOPzKJoKv2H8gfZseJeavKwaXqb1erFvOtK2a5zsNzqFAk1ztgs2PeDP
	 KVZwpZ9LQSy2ZjmpkXL/WqcADqjPJIOEioyjMSwgeQE2QdCXsLYBEXidJUcQk2U1BwMbn
	 IRCSMYjHoSgH77f5+xcpDvvP9/1orvDdhSP2vieT3G8ulyHB1nmqvGJrbtk4+B1L93g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
	b=qWPVT/BLBbVoeMM+9ZfGGr+n1qPW7EugGky8DMKIswErBpwIDQYo22YU7kJxEB8GQga+
	 AtDDHfco0TsE9ly3/q8QVhF7ih1Sd9MaIoWoUQGhIqyU5zZGihiUg1ogDeE0IHlwEeYQI
	 1NYsThR9HglTgm2odrBIxuDJz0eAHaum2T2BvBwsNl6UW35E3h1tpHoLZ0RNPodhPH19q
	 37o/SrTJ4I9+rjvLnNVQTCqdgJZs4e0v/D+szjWTlhhW45skXM8b2x6N9rXC/d9f8q8n8
	 7q1XiE29C0NYlRD8S6HJ5aHEDexSbhHMM/ZZT6NDl8ZhSLnfqK+ukr+ANUAvQyG4e2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Bv0lrt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A097606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A097606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Bv0lrt
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so5071091c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625220; cv=none;
        d=google.com; s=arc-20260327;
        b=Kb6fkJQWkYIpvBKcD3CVdGOyFNkLq4HRdPizBPxWAu4zGZ88rAAVmrlbZOSqJN9vqK
         oKVTBn061fY1lokMWGGaAd/GyK2dDOmiH30U0qRLM9N7VxqidZ9BiJ+gYNm/EMD2QwDY
         T9y/6cLvONXDentq0uuinCikgDPeLzcB8cNg2SSnvWZ0VIsCbodKj/2dQo4Ja8wImUxE
         Gw7XSoiNsaJxFGizrsgiGc34eDiIQOp9SO75uY5Z9xxJR9hbyPQehar2DZigksTD39Cs
         p6u21EwKdFOTuyNu5vT08cf2Kw7kpBO8PWxdSuZuVxuhODoE9/jwgI+DW96j9uggdKBc
         Yb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
        fh=2WqzrQTcs7Vj/cXQuzT/kyps1jjuZRYBm8fbZodZytc=;
        b=LxXjx0pE6Zoc/1rACwc96RntZwQEdo9La+nOsKJPXrc5YUw0en9PBjtbAkPbXm6Xtf
         p1ZZ+mBcehTcicrsH0E/s5b69V+w9i9Nrqt8UAojckQ97+w6PgQ5n+imUCl2nRQoUc+B
         9TTRbGpY3KrNPyfC0JQj8QX//jE73LG87wAZYvrPWwbZVCTXD0x+4I0q00kArE1FxQl2
         R187E2Fhw1i6vnPepIK96/4nroDcRUnd5n8Nli7FBpFzRLeL6YYkRyz5a7RdbWIHPGGT
         Fqz7/md6L7i9YaNARrZ4FhbzQh4AoD14mBL8LNpNu80ooTtQrCbFotBvaf0SeMqXx0xz
         IWkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793625220; x=1794230020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
        b=o9Bv0lrtHh2cwTJJVMUH4k06fPh+ZUF1Xl51YCyt5LSal/HMFyjV6eP5ndcJg+7iVj
         WTAY3phbzSA8x/6rfLnLvb4bDnZ8Y4PG1EA0o2RPOfRyLwq6jcyjm/QiNRIf9j5AQQsJ
         l2LCkDlG//3sWy/odK1wwz5yKvgETNvSW47fduZrW/zlPZQm2Hr6OF9occ90dnwda9pH
         15peHnhylM0gwl1DeCkmpBva8CbqeJR2lmvPc9gUGtCRkIGAVwQC32c4UK+T3jOODMWv
         8UTKrgc631symoPetFblG9qRPrnzh0NbDQA57q01cYj3VhCGGF8OfpP+shjngzwAm22m
         UCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625220; x=1794230020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
        b=yZWiGa3QB9dFjggjaCPvx7to0v/UyCOaAY4GCkVe0R5WY9cwsM+oR2VJRBT9Au96d7
         sMI/MPjVF8/uHy1wqbbDfb8s0epDOnEfxhitb2KmZpCx1Z4aBOVRloFuK9xjY3x0demW
         k+blPZrt0FGTwa2Er6ieHb2WIo/PfIbRU+zanQBiCEzyjLvkEKG6QLFQlR3O1YYr1kjF
         3gVk8s71yCrHOKaar91IRcYGVlZWaC4L9Pj8N5LzAaq6tmKPZEnuPWf4d3T/5l1xC6R2
         46H5g/4IttWCGzkgCK6I2GyTIw11YuIlU3AdCJpjUzHwNp17DDKE9ia/zsEFbSgn7Opy
         7Ehg==
X-Forwarded-Encrypted: i=1; AKwUvBxe6AlF2ZzKdocgmZ3rgQpqAjq7lV2IIR/FNASaq/2wWoTsCvhobbfF0wiowDr8AlBVT0Y1HyIAmHDIlEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBSMaugt9uxQfFr21FbuJdm6ZzrpJPUpG7M/wMiM9eVQc0Xg5p
	A7yNsosVcPwA6JTm4ZVme/NIpF7BP/GB8+kVud4qezhpzo/udsUIUtkq4XRmd922W/C8raqVwx/
	nthEDc72b4MLl7a18IySzUTLjuy9oe8k=
X-Gm-Gg: AYBFou1rhR1gyypKQ08vYBlbkWcXUN0prHoYU5H70lWpa8iL2J7nXMxNVvAAFQtNSwq
	vzOaTAuQrE/zSTVsRTKeG6L/Ft971GUfDABNpwG/b+SZ/6k9+EyWw+epx87wMXy462gnE+TLnq9
	MUJLbQJQWhCOrNtdBxTcvMSPH3z04wQ/A4D6apmFyXj5fUevHMMRLSHZhlA2dziILaFJvoKbcar
	D5lA4L5ErSlr+zs6tHW8SJD5jR8kh9TlPTd3ZhUqHTlWu8c/CEoc+x/x5VfuSykTbalBmBGlmF6
	JeySgVtehHjyTcMfMUv0tktfQwWx7b6F5ZXSVlLw1u84xLBymVIDC/v6Z6aR1oha2QVDGJEoV7P
	r9t/BlcjW/FCqznXt1mTK6eCYBFvUqdDga8NQcE2WnYICsxQn85eDl/MRlX3vJxqS6QYf
X-Received: by 2002:a05:701b:230e:b0:14a:8cff:fbb8 with SMTP id
 a92af1059eb24-1ac5bbb5053mr14722111c88.28.1793625220279; Mon, 02 Nov 2026
 05:13:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130540.252894-1-omosnacek@gmail.com>
In-Reply-To: <20261102130540.252894-1-omosnacek@gmail.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Mon, 2 Nov 2026 14:13:28 +0100
X-Gm-Features: AclHuK9Lk_3jmZnqSr1tjOillycrUr-WcgCLTZN6r2TRwhWtp1BoaHKbHJvYD28
Message-ID: <CAAUqJDvsDi5ceO3ri5cJP4WJbZeUdpJe9F4cv8OU4=wBzVeBAw@mail.gmail.com>
Subject: Re: [RFC PATCH] af_unix: introduce MSG_CMSG_SEALED
To: Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026 at 14:05, Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com=
> wrote:
>
> Currently, when a process receives a file through AF_UNIX's SCM_RIGHTS
> mechanism, the security_file_receive() LSM hook is calledto allow LSMs
> like SELinux to validate the receiver's access to the received file
> (similarly to a process inheriting file descriptors through execve(2)).
>
> However, there are cases (such as dbus daemon/dbus-broker) where the
> receiver doesn't intend to access the received file and merely wants to
> forward it to a third process. In this case the forwarding process would
> need to have the appropriate r/w access to the file in order to receive
> it, even though it will never actually acess it. That leads to the
> security policy having to grant the forwarder access to a potentially
> wide range of files (in case of dbus-broker basically all files), which
> is not ideal.
>
> This patch adds a new CMSG flag MSG_CMSG_SEALED that, when passed to
> recvmsg(2), wraps any received files into an opaque anonymous inode with
> the name "[envelope]", skipping the security_file_receive() LSM check.
> The returned "[envelope]" file descriptor can't be used in any
> meaningful way other than being passed forward via sendmsg(2) with the
> MSG_CMSG_SEALED flag. In that case the original file is unwrapped and
> sent via SCM_RIGHTS to the receiver. The receiver can then either
> receive the file as normal (subject to the LSM check) or again "sealed"
> in the "[envelope]" anon inode for further forwarding.
>
> Note that sending the "[envelope]" file is only allowed with the
> MSG_CMSG_SEALED flag set, to make the unsealing explicit and avoid
> unexpected behavior. Attempting to send it without this flag will fail
> with an error. This also avoids recursive nesting of "[envelope]" files,
> which would only make this feature harder to audit for possible issues.
>
> This patch also adds a simple read-only sockopt for UNIX sockets that
> allows userspace to determine if this feature is present (passing
> unknown CMSG flags unfortunately doesn't lead to an error currently).
> The minimal code to do so can look like this:
>
>     #ifndef SO_RIGHTS_SEALED_SUPPORTED
>     #define SO_RIGHTS_SEALED_SUPPORTED 88
>     #endif
>
>     #include <sys/socket.h>
>     #include <unistd.h>
>     #include <stdbool.h>
>
>     bool MSG_CMSG_SEALED_supported(void)
>     {
>         int sock, ret;
>         socklen_t optlen =3D 0;
>
>         sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
>         if (sock < 0) {
>             /* handle error */
>             /* ... */
>         }
>
>         ret =3D getsockopt(sock, SOL_SOCKET, SO_RIGHTS_SEALED_SUPPORTED,
>                          NULL, &optlen);
>         close(sock);
>
>         return ret =3D=3D 0;
>     }
>
> Related: https://github.com/fedora-selinux/selinux-policy/issues/3286
> Related: https://github.com/fedora-selinux/selinux-policy/issues/3287
> Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> ---
>  arch/alpha/include/uapi/asm/socket.h    |  2 +
>  arch/mips/include/uapi/asm/socket.h     |  2 +
>  arch/parisc/include/uapi/asm/socket.h   |  2 +
>  arch/sparc/include/uapi/asm/socket.h    |  2 +
>  include/linux/socket.h                  |  4 +-
>  include/net/scm.h                       |  2 +-
>  include/uapi/asm-generic/socket.h       |  2 +
>  io_uring/net.c                          |  2 +-
>  net/compat.c                            |  3 +-
>  net/core/scm.c                          | 81 +++++++++++++++++++++----
>  net/core/sock.c                         |  9 +++
>  net/socket.c                            |  2 +-
>  tools/include/uapi/asm-generic/socket.h |  2 +
>  13 files changed, 97 insertions(+), 18 deletions(-)

See also this RFC patch for selinux-testsuite
(https://github.com/SELinuxProject/selinux-testsuite) that I used to
test this patch:
https://lore.kernel.org/selinux/20261102130834.253605-1-omosnacek@gmail.com=
/
