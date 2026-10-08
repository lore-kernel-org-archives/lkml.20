Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E759371071
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434225; cv=pass; b=cTPNYnKgKSWXRkyh1CHBW+K1YiBUwh13Sl8KHQf61a02h2V6VY6978eQTXXZEp3nreDKJjAXiuWBS4zG8qEdrQ7SYw4JySGWzQGAUbj4UrsXYFa5RIecZ/1WZ4Se+G/4BokXebla3x6B3Jb8pHShIjXKiJVIRnaoze5953ngudQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434225; c=relaxed/simple;
	bh=783mXuBfH4W513hCsDEM5WtuPocb/VIE+cmR8680wxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLD9azSj/Ep1x20TawliTf5V0MDpmhdzqXU1J0rSixJaXfPHY/55l+GsAynhsvqNSKVz+HxPpKIXUMthI879GyiMd/fMGHgiMX1sO4jojuqYTF71yf7M3gMTU5ld8MIxuzriQTuB+YXfbwuBAMFpFN4g4KcXIQpuNHAU7jSM6I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SPNHWIx7; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SPNHWIx7"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35120d43ecaso7276656eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791434223; cv=none;
        d=google.com; s=arc-20260327;
        b=ciQuxZ0GE7Wcwej8Wc1t3uGuFyk3SIcc/wdFAv+ca1hJSASk0XoowJql3DSWterqlu
         Hz6G1pzUg88S4/NJUbG9/IhNgSBykTiKnSEZO3AaH8+zwgKKEXRFgpJF9WRfhBwRfrzx
         FtkQttzYeWqAewvpg3iYkKXDEBH6tc6f/33I9TTerTXV/l12/giVekc2LWzIz1ZW1Wgc
         a/G2AR3986QjN5J04iuucDqhImGGGtuYAx78DxO9crkXyYNAnJBfXOdFOltvB7hziRj0
         avq56E16wOdG8CKYp0cXYS12IbTEnY/H+xSKpP163LcMEPNSTX4EOk1XuDqR3a9Bvqor
         tEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=783mXuBfH4W513hCsDEM5WtuPocb/VIE+cmR8680wxc=;
        fh=BajnwlNLu1TdJoIgxpg/hgVYassIFyQFWK+ODlpEIk0=;
        b=RerawA6igfo+nLNO4B5ci3E37j64x2ezwalDHuRUZh6Ll0zvi++7tqvVPW5wqtXids
         xj75Djb3wwpm2Pyft7Zhea2EbRIuoOSLGRxNo1ZBcod3rfWV+izzm4kk8FiHwlY5AlAm
         /PSG9rPCSTdsVmjY0YUBIxIRo8NjXXBjwnwS6ne7MqVsTTHaxSLcAZ/3KhNGw+hJBvB9
         g7Nz3s47VesrCoyxjPTw180AkSAMQbkaJPY2sZjD+UOrX4pKrCiuuFI3Zve77UE7ZRTz
         HeuFFr4AI1BmylmiNLJ22L4uzpMIkXG1wpyLCisDKj1hHVfgAuvN3I/28cdXge2zoFGp
         C8lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791434223; x=1792039023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=783mXuBfH4W513hCsDEM5WtuPocb/VIE+cmR8680wxc=;
        b=SPNHWIx7FQj19D8wuK40Tq4Q+G9QIh7aWlUTR2g4mDgs1sHpGGTWzs19iAjsoBK2sb
         6O7We4dl1Oe6TlOcn70TCRSmzvqz2n42dAK2KrSaFYJBtjNaU+LSNG0mwGY4o2wgiAeg
         fD5DkjDej06c3CAgq06jaG5jwsiGqsnW2HzZbq8eHcVMwG4q4gaLq75wFXPCCm2GFCHZ
         OfxqVL30VYDIE30vNgYuSwtOCpMZD6gxLIc4DeTdI0C5vA7FkUszACDbD1f2aYe6WGFy
         MIGe90DJwUKQuDzt65pOvBFdbnnVfgKHMxJwhzcMqUVVvXG00O8myvPb20QEJ5x8OvSw
         oaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791434223; x=1792039023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=783mXuBfH4W513hCsDEM5WtuPocb/VIE+cmR8680wxc=;
        b=aITPUvaq9qzPQIyiklS8zucdgqnKB1epdoVsNNz0O8qKNzSFl/NnhVTg9TqgHGg7RE
         05wCzE68bfbRglh9c99dhUcN1lbeH0nsxAPcwpqo8U8FYQ6agBjCxgbSw8567qqfeqYR
         xSHyNO9Bqlw0p+Mzs++HsUg1eEwWYZvIqLd1Mf4Rt2l54Pu6CxtDJ+qmyaj6HzF8xVt8
         k5CslWYx7DIuqenSBW5SHNXIv5mAjQeYUzKYAGXaQaJYLUpPJECfdFiRwSPzuGl+UTvK
         99I/votph06wOxmmjyT74//4uIxms2KwBhhfUrK4gmWV/Oaa9VIvYEvR47diI48H/d/i
         U7Bw==
X-Forwarded-Encrypted: i=1; AKwUvByF5xnj5zkyPG9VpZ4QSQTniyLbIpdHHDtmvyCk/JAGw5Cu8qvyjpDRtrxNXc6kZPfuTtIm3jdZKjLJ3NE=@vger.kernel.org
X-Gm-Message-State: AFuF++nHchbF57tO47ijqiwlcAxvUwa6kWz1VycDLOPLp0NyuSUhtuF9
	NG4LP1OGsmP5OhEAiYvzth+xsHuV6fJXX19ckvRh1ZpuHE89EPdVA051VeqefTsMgPysUpQldkK
	JqiLLr3Lzx6nZIg/8N2zuW9+fyTSusctxznXrrNxc
X-Gm-Gg: AYBFou2S4GNqjVyg5vZmKnvg1D4LErbpwiUqZ2dDanDAwuI4WoI4uuQ5s//7UY1YXW1
	KUE3HbFlAOItzpw4I0BtDFWMhbj8fukCYSbSfWjUTgqPug77FI4B/7CkDEzyqM4N6bkN0R+cOsg
	dQ/MZgbfTXelcS8OdtKKIb2RDvuKf/nKDhzvC/Uy/RZJOJuu7lIXmYuMpIw+JSMXYPFJCZf//63
	p/M/2HGqsUqNNvUoGkSdcB9ZXIwt5UxPGfoAYPgaU32GdMBjFS4SMjgpvougx1FvlqkF6KD1We1
	mqJbC0dO0ZDJxJZqJZ4jw6QGaJt0Td/uiaiAkWgSXCdgVwt+iS72tFffiEq/rKqnnCB0/XheHgK
	R97EzymIaN0c60okeD5zmKFedPvooQCrS/E2MJFOxh6StU/+HOz4Mv4wTXTJf5o/VUrq6PkrkB0
	e9JFWX7OHL9Xnq3mRWVsKduFZhIg==
X-Received: by 2002:a05:7022:f502:b0:143:7001:7645 with SMTP id
 a92af1059eb24-16209760be6mr4222902c88.47.1791434221672; Wed, 07 Oct 2026
 21:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com> <20261005-work-unix-passpidfd-v4-3-350183b6e02a@amutable.com>
In-Reply-To: <20261005-work-unix-passpidfd-v4-3-350183b6e02a@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 7 Oct 2026 21:36:50 -0700
X-Gm-Features: AclHuK87ASE-Zp2KeBO8qmfy6GnvIhawhL-XqcImRlz9HQrRj1dcVhs5k0D0yrU
Message-ID: <CAAVpQUDkBCXRfaFQcjNZg7LgWy_cx0c_eBPZfURdp0zn93dN=Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] net: add SO_PASSPIDFD_THREAD to get a
 thread-specific SCM_PIDFD
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:09=E2=80=AFAM Andrew Halaney <andrew@amutable.com>=
 wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> Currently, SCM_PIDFD carries a pidfd for the thread-group leader. A
> broker or the coredump server cannot learn the identity of the specific
> thread that sent a given message. Now that both struct pids are recorded
> a receiver can ask for the specific identity it needs.
>
> So add SO_PASSPIDFD_THREAD as a sibling of SO_PASSPIDFD.
> SO_PASSPIDFD_THREAD delivers an SCM_PIDFD_THREAD, i.e. scoped
> to the specific thread sending. This is completely independent of
> SO_PASSPIDFD, meaning you can use both options and get both cmsgs.
>
> On SOCK_STREAM sockets recvmsg() only stops merging data at a thread
> boundary when the receiver asked for a thread pidfd. For SO_PASSCRED and
> SO_PASSPIDFD receivers all threads of one process remain a single
> writer.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Co-developed-by: Andrew Halaney <andrew@amutable.com>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
