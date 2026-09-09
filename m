Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090A531AFC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952227; cv=pass; b=lzG91nkbbjYeWugUeZ+4UubpOj0dIAmrpxdV4Qh2b2h84y5Y7kw1/hWUsXKXBLnVB20YlEOfjsNdAAT1HeXzoPj0u52WtsDv4oby17LVoX9GGW10XWioaxBls+2YaHGLolEnjK9cnq0Xvx5oSzzf/7j1WVy420o2P5jO8XDAXKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952227; c=relaxed/simple;
	bh=YkZ9FXYxom6GTJ696R1xgKPjABJ5NoWT2CU+7PuBHFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVoH++Vbj3Gmb9z01c9IZ2SD6bT119kfj7rtx1kCZW09O/wnfoJR2rNlh6TeHAzrKDbFgDtli9I+arChrpc6OLQ/E6kKGG3EqnFR7OEhv35Kl5DJWjXuGKNFTnD9GMi3ZERy/4XlxZAuBnvaeW/Lp8krrUh8ZFKDhhd/EF9Dl5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=dX0q+oK6; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="dX0q+oK6"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so4597366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952222; cv=none;
        d=google.com; s=arc-20260327;
        b=VYXUTehBiFbpCznA+07Kuiym/W1mqvZnskDLWxyj2ASOim0enJlxSzf6BCCVU/obex
         YMYAs+pkLBYA6it/baEOPBdnwmhQAy/9MKigGy0CQ1GxS9FxDikmW2W6U4Ik4BYQ1ANH
         83Vg5+TFzxjA8TODcpqGAoX6DfLKA77Mlsof/J+pvtBH+3lI4j7MEAyw7EDb4uv4zFL/
         UcYHCraN34erXcfx8EIxNeMwyTM+tb6AW9tbYtSr6J0XgVAQ+1niPC3XJrg68PrdP0Ev
         vvRmMW6u9DKC8xOoZjVv544AYzEAYw6++0DDaRyarU7dOglIfgwxyHiZBbcamxXSgUw+
         7YTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mgt8XRgHU0466zZJnQp3K3kwl0ZmrdZ791mHZpm+8k4=;
        fh=/CxyFNzhLPyI9nwxXpSe88H78ynTNSfZ9FQ5oo7OyE0=;
        b=nI9JZKE/UQKS/6XyRnsj9Jd9KFBvdeurH81iVUYPECCtVb71XsHUGv+djp/DQefh20
         3ut+aVsi49BbRG/PlcjKk8HDmAkucePSVbjxH/eGYAX1QmNNg2lSastx3uIEgm07FWFa
         xxPQzKDa62sBi632D7mDKjEDO+tnmmQU5Gc92IJZpGaqit9gD0NCf9t6A/juf/kBRgyE
         XAA1n/nIs1jzoMuzF5Z/vgX4xPeQ06LK3hXttRjSSu3AGW5cyghDKDmPrY7C8lQN/GLf
         nywFYlBXFa45TFBTj+X2gfodYMt4tWQ4ut6iQkxlx1pY4z4cILP2XyberO5SLNu9/C42
         IDYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788952222; x=1789557022; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mgt8XRgHU0466zZJnQp3K3kwl0ZmrdZ791mHZpm+8k4=;
        b=dX0q+oK6psQKBVWpzPmJNAB/SUPsmrJYjWjuLSDb+yl4yOhVR75twv//YochFw3j4G
         f1fgEdTt7HbsfDGgHZJWplKWqJcs8PvMGOKdA9sM0+Sksnc9ZjRmbk1FTI7+WN+FJyer
         kZJ0GKY23pR7SOJ5QB3rJDr/KexOrL5QPQJp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952222; x=1789557022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mgt8XRgHU0466zZJnQp3K3kwl0ZmrdZ791mHZpm+8k4=;
        b=FTFyFnL2BXfHsVlc9nB1Z9yssg7xftFohlXDWSoYtBls7sW2MFGgU9l2H6TFkEMpRc
         dNomMNlWKD1hyz0gxF59fPiTR8eT0sRyop7LHBFMgyq20J4tTWZcWqy8OKCkirsorYtQ
         QzvPedf2/2FcDnb8Ylz9qNtaQ9ONfB7vBSb+Pilhx3brRcv/uYbWV4vWkwXbXHc847hN
         YoNlhBn3jFJZCHz1khDux41rn88Mcr6smLDEchiivnACtMJbP2AkY1ScUKzMvSZ5VZIE
         OazizgjbYSJHJbReC7V9FN4BKtSbX/CJ1y+YWy3n+wXBhqfKdjcJ3iaN+uzOc84WElPl
         Hkqw==
X-Forwarded-Encrypted: i=1; AKwUvByz/esuSWbdm0JenviwNQQhE+SptAgOiEIa24i1Y0EsfBexQ24Z/jvOjTyCGdJPhGewvSfuDt6Be76udTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mris/b8n0ZIFzAQoUvTWiQMg/UjPDVXFwR4oUD8HzcEVkrM6SY
	RUWDf3/SLG5ubQmZWj7i6j57TqQB5BLfBGfz8c1J+utH3GfsNjiEHFV205NmvNkXc0IT6jeT5tA
	s/pqqDHS+U5R+wUKz1lla4uuKV1SWc9yt76sMrm9tJg==
X-Gm-Gg: AYBFou2ksnZ3o+ruC/HYP+whSRzkeA2jzy0DBVyPnNtph9LqSWCqguvDM1BfWfhUim2
	5XrGPt3hAj+Ww0/4yWscT7SaJsw8zJNJWawhRzY1jXv44tRVWkXydi9lLAjW9ArW7gclyxiev7I
	gm3fNmlc9ALE7Xz3mmbCvninERTdQB1X8qiheAASIidz/lvQ9z1vwyqLGOG0sUGDGkfVwStY5Uq
	X8rmogyJreeB0LBHphY6owAv5BoIdEOS1CY+Q3KeNa6FQ+cTtcBC2Kpf1dgbdqcnrD2SkEQZD3G
	VIq6cly1GbEZibVH3AgsxNaN4YCwvSK78XGLDRHD17BBr8nm6lDYJso9D6qTnIKOJ+7hpEdRv0I
	fAcvIvPCTMN1DwignfSOJrw==
X-Received: by 2002:a17:907:c09:b0:c25:c7a9:7b8a with SMTP id
 a640c23a62f3a-c2941ae9193mr12751566b.12.1788952221639; Wed, 09 Sep 2026
 04:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-work-unix-passpidfd-v2-0-7bd342abb2d1@kernel.org>
In-Reply-To: <20260909-work-unix-passpidfd-v2-0-7bd342abb2d1@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Wed, 9 Sep 2026 13:10:10 +0200
X-Gm-Features: AcwNN1XTgvzqLxcVf_sNNwgtEWfE868-Kflp519NXR5vjxPBUXSPcRZwXEOLDjc
Message-ID: <CAJqdLroLH7x1Zrgaa2U=H5v9pFfdzJS4CCcAmSvqShS8Wh+0rw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] net: support thread-specific pidfds for send and connect
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mi., 9. Sept. 2026 um 12:43 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> SO_PASSPIDFD/SCM_PIDFD and SO_PEERPIDFD allow to retrieve a pidfd for
> the thread-group leader. The coredump server using the coredump socket
> cannot get a handle on the task that took the signal and is writing the
> coredump easily. Workloads interested in per-thread authentification
> have similar problems.
>
> Add SO_PASSPIDFD_THREAD and SO_PEERPIDFD_THREAD. We record the sending
> and the connecting thread in addition to the thread-group leader.
>
> SO_PASSPIDFD_THREAD functions like SO_PASSPIDFD but instead of an
> SCM_PIDFD message for the thread-group leader, SCM_PIDFD sends a pidfd
> for the specific thread. SO_PASSPIDFD_THREAD is mutually exclusive with
> SO_PASSPIDFD. The last one set takes precedence and disables the other
> one. Both SO_PASSCRED and SO_PASSPIDFD receivers see one writer per
> process as before.
>
> SO_PEERPIDFD_THREAD allows to retrieve a pidfd for the specific thread
> that called connect(), listen(), or socketpair().
>
> pidfs_coredump() now also stamps the dumping thread's struct pid so a
> pidfd for that thread reports the coredump like the pidfd of the
> thread-group leader does.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
> Changes in v2:
> - Fix a few documentation issues.
> - Link to v1: https://patch.msgid.link/20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org
>
> ---
> Christian Brauner (10):
>       pid: add helpers to operate on a struct pid array
>       af_unix: record the pid of the sending thread
>       net: add SO_PASSPIDFD_THREAD to get a thread-specific SCM_PIDFD
>       selftests/net: SO_PASSPIDFD_THREAD
>       net: turn sk_peer_pid into an array indexed by pid type
>       af_unix: record the pid of the connecting thread
>       net: add SO_PEERPIDFD_THREAD to get a thread-specific pidfd
>       selftests/net: SO_PEERPIDFD_THREAD
>       pidfs: record the coredump on the dumping thread's pid too
>       selftests/coredump: check the dumping thread's pidfd
>
>  arch/alpha/include/uapi/asm/socket.h               |   4 +
>  arch/mips/include/uapi/asm/socket.h                |   4 +
>  arch/parisc/include/uapi/asm/socket.h              |   4 +
>  arch/sparc/include/uapi/asm/socket.h               |   4 +
>  fs/coredump.c                                      |  22 +-
>  fs/pidfs.c                                         |  27 +-
>  include/linux/coredump.h                           |   4 +-
>  include/linux/pid.h                                |  53 +++
>  include/linux/pid_types.h                          |   8 +
>  include/linux/pidfs.h                              |   5 +
>  include/linux/sched/signal.h                       |  18 +
>  include/net/scm.h                                  |   7 +-
>  include/net/sock.h                                 |  14 +-
>  include/trace/events/landlock.h                    |   2 +-
>  include/uapi/asm-generic/socket.h                  |   4 +
>  net/bluetooth/af_bluetooth.c                       |   6 +-
>  net/bluetooth/hci_sock.c                           |   8 +-
>  net/bluetooth/l2cap_sock.c                         |   2 +-
>  net/core/scm.c                                     |  36 +-
>  net/core/sock.c                                    | 120 ++++---
>  net/unix/af_unix.c                                 |  67 ++--
>  net/unix/af_unix.h                                 |   3 +-
>  tools/lib/python/kdoc/xforms_lists.py              |   1 +
>  .../selftests/coredump/coredump_socket_test.c      | 175 ++++++++++
>  tools/testing/selftests/coredump/coredump_test.h   |   2 +
>  .../selftests/coredump/coredump_test_helpers.c     |  49 +++
>  tools/testing/selftests/net/af_unix/Makefile       |   2 +
>  tools/testing/selftests/net/af_unix/scm_pidfd.c    | 366 +++++++++++++++++++++
>  28 files changed, 907 insertions(+), 110 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260825-work-unix-passpidfd-086a1ec09e8a
>
