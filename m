Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4F47A86F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778317; cv=pass; b=nenfSnhPuRcOcqhtm/7J7tmmPyAoasafDT0N74YA5/Y/M5BvRcsIncmEamqynfQJioadDSuHaV8+HBu5kbR+0q+IlmehRSve57C5BpTiMLWCPAHgfZbUsbzQywM/RBN2uR8nhT/hs5LLboByX+MAeFBdJBLf1Z41TXISnJKeg40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778317; c=relaxed/simple;
	bh=W0+b9KvoApA0Cu4KJvDEn2s8LS//dxJC59n6wwetQT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQs3sNMxwtLXaIgZ09XNoF/p3MirdIVWIb2hktBlrd51LU1BXLFpWe+HOzCkil0ef3d8KlqMfh6tZsbwIYdRzu6lFtObII9QFwtBtDgS3lrpjATogOC5wOhCMRZEkZLFbScqiws2EyOnjPi8wi6pvYAbq+FRuEIaP1aSnklUnKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=c0ltu23P; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="c0ltu23P"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso561598966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788778312; cv=none;
        d=google.com; s=arc-20260327;
        b=Tj34hkrTYawx2NT2jGkYqcuw2K+ZnYng9QWoY8F/2irzi43ojB5ILXuIlzg+O7/WWF
         RZKvgPLi4bEYOwc9WhbQ1BySu8xjT+/ZQtt6G5GP14CFldJf3I1axhmVXhO5mzaPNq/S
         P8QkshIYaBpDBSY27QZdeOSj3Io3d5Yd9IVRNTrS7NB8ahoa28OexDeoeAt+5DL+tm/h
         oxPu1xCDdfznf6ocnDou3vXP8NLjerHb63qJ04FWXbiO0moDl1uQ0rpw5pqJSfFM0Nin
         xPHqN09CnwKwoupntQAbZu8h8xF7zelhwEI/7vGRFdAUnAFPMNOTJONpo5+5TqhqwRQR
         Wl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GKeVIBKeBEiqOVb6fEusAWCMyuo++LHKEtSCxIMKohw=;
        fh=89JTFDj9VIVNaqgkBIrDPqXSXb1sebB3fN0geFwqAO0=;
        b=iCWppU6HSKxvT+BdIfxTbh5zOuQEiwD9uCIBASm31Ht8ZSoZe6C4C86B8ejKaAfHxJ
         ioq+ODpbfIyW/SDknzOsSvdIPrzpI67TBeDL+AZbgMrB5GYNGSpw4TbVlRkszQaLVeR2
         omBw0cK078Pp4uaAMxSGzCXfEmf87YOUrPV1GP9g7kMM7uL+AtE1UqdvqJRED5kHchay
         ne+tiEeQK7hLRpLnCgaw1ceilTgAxvZYO1BlIzjV0TbOXR1GwxXSgUp3bNVkSHFwH6Kd
         E33pUKYqOMbvIjStF/2fgNy82ImJeZsoUIZ3c4KsdrTGy/h5DDknXQA7moMMKU7sbqxg
         oXbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788778312; x=1789383112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKeVIBKeBEiqOVb6fEusAWCMyuo++LHKEtSCxIMKohw=;
        b=c0ltu23PRE6Vkb70dkQgLopWyERqmVyY4VAevKZB3faJDwTC26STv7TqMJZ8hDC+Vo
         dRXOgDmhA2EKBpBCaDKCmZ3iZbyqlzxvReT4FsIuRxZoRmThb6SrYFZxFUMCaBC9UMc4
         g1dDH2OSaVvI2RuV6lrGWrbP2kkej9bBPSZ98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778312; x=1789383112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GKeVIBKeBEiqOVb6fEusAWCMyuo++LHKEtSCxIMKohw=;
        b=fs8OC893xB82IeofYWbOtsVLRGAvP0xXJrAWW4ptodsKbI30AqNOjMaZzEzjU7Yzp+
         rP/mFyEC24l0PD8QSq7SSIXivIOSVi7F/SCpSThA/FUqh0FtA3notq8Wf5EDSy+YD58H
         nEtk8vpbm9p118Gy4ah0Yv6xjyPiyHYMHa6dY6AfBSfy/1xPmxr4gR/W5UwujjVe/6gX
         8TyFbznc2pl2TJS9XYVLoiy72Q8JzKy7x1SC6HETh98Tjxmf4v3eU9UiIc1FtHCm1W/A
         FKidFFjQflubslIHxJbeNgyKy1tp7GAcw3UFM0lVfGwjCXXjuPuHcpy0epkfY0+2wZmQ
         x4Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxxrAfH/67S727P3aJAO26a8K90b0UoDIt0rw/cUN03hdBiAz5b4W/i7EFiEofH4o5Uq1gcLyiU5yYZbw8=@vger.kernel.org
X-Gm-Message-State: AFuF++kIaNttZiaXbg5EbQR/RWvrRnNbhDaaeSNOmVb7quC9GkO0bkjJ
	Ihh/yCp9lPnTHK2trll0Zk1eWeNMhZihDYOrF+PJlTIj3xh0Pg4xy7dmOuC7VtJqeIPUvh91X4X
	7JNJ6EnwVhDfxElBrvE6c6eVyFyi5WuyzP+QfpytGRQ==
X-Gm-Gg: AYBFou3XBo8rt75Gm7QBGilbiQzF/2HScQuv6l+fmGTTMtfliazhijYhHmIHrz/QF7R
	8H+eM1XVUmUYtmDP7KF0pj8Fvq2x3epR0aydivAp6K2ZwOgx8cXdUdw/0H2ELb+ulOrhjc0ppTO
	RfT2EjPUIciYKcDEJu4KlTV1cvBxGnxdKv1UqpVDxGQnXgKFoVKc8cy9KaEX67kOAXFPw0A80J4
	iWr0c8AFIYUsi4hXhms7Ga5zMO72ta2iHpz/RUH/5f4DulVLJcrmBnmtzGDirUwscNiFUPdRpgc
	xN1lWjwlsD1KS3KME9kRgJjAmctjtitA/4bBzyLLK2mfNwlz8YAmmKoNr51EfzNDQFwUiqppKsI
	=
X-Received: by 2002:a17:907:3e1a:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c260c971f12mr1411193766b.2.1788778312538; Mon, 07 Sep 2026
 03:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org> <20260831-work-unix-passpidfd-v1-8-70cbfda0c7ba@kernel.org>
In-Reply-To: <20260831-work-unix-passpidfd-v1-8-70cbfda0c7ba@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 7 Sep 2026 12:51:40 +0200
X-Gm-Features: AcwNN1XE00oDe9AYh-ifVutenx203jQLfwtnAnzkRMIu2D8-Sqlf4xuqnAwBMnI
Message-ID: <CAJqdLroK2W7N59+96feng5_gPCHca81utJw0KsU5d1hpVMKFqQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] selftests/net: SO_PEERPIDFD_THREAD
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 31. Aug. 2026 um 13:21 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> Add tests for SO_PEERPIDFD_THREAD.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
>  tools/testing/selftests/net/af_unix/scm_pidfd.c | 97 +++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c b/tools/testing/selftests/net/af_unix/scm_pidfd.c
> index 019c48e1cdcd..bbbd5e7b4fa7 100644
> --- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
> +++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
> @@ -32,6 +32,10 @@
>  #define SO_PASSPIDFD_THREAD 86
>  #endif
>
> +#ifndef SO_PEERPIDFD_THREAD
> +#define SO_PEERPIDFD_THREAD 87
> +#endif
> +
>  #define CHILD_EXIT_CODE_OK 123
>
>  static void child_die()
> @@ -822,4 +826,97 @@ TEST(scm_pidfd_thread_creds)
>         EXPECT_EQ(ids.pid, info.tgid);
>  }
>
> +static void *peer_connect_thread(void *arg)
> +{
> +       struct sock_addr *sa = arg;
> +       struct thread_ids ids = {
> +               .pid = getpid(),
> +               .tid = gettid(),
> +       };
> +       int fd;
> +       char sync;
> +
> +       fd = socket(AF_UNIX, SOCK_STREAM, 0);
> +       if (fd < 0)
> +               return (void *)1;
> +
> +       if (connect(fd, (struct sockaddr *)&sa->listen_addr, sa->addrlen))
> +               return (void *)1;
> +
> +       if (send(fd, &ids, sizeof(ids), 0) != sizeof(ids))
> +               return (void *)1;
> +
> +       /* stay alive until the server has looked at our pidfd */
> +       if (read(fd, &sync, 1) != 1)
> +               return (void *)1;
> +
> +       close(fd);
> +       return NULL;
> +}
> +
> +static int peer_pidfd_info(int fd, int optname, struct pidfd_info *info)
> +{
> +       int pidfd;
> +       socklen_t len = sizeof(pidfd);
> +
> +       if (getsockopt(fd, SOL_SOCKET, optname, &pidfd, &len)) {
> +               log_err("getsockopt(SO_PEERPIDFD*)");
> +               return -1;
> +       }
> +
> +       info->mask = PIDFD_INFO_PID;
> +       if (ioctl(pidfd, PIDFD_GET_INFO, info)) {
> +               log_err("ioctl(PIDFD_GET_INFO)");
> +               close(pidfd);
> +               return -1;
> +       }
> +
> +       close(pidfd);
> +       return 0;
> +}
> +
> +/* SO_PEERPIDFD_THREAD returns a pidfd for the peer's connecting thread. */
> +TEST(so_peerpidfd_thread)
> +{
> +       struct sock_addr sa;
> +       struct thread_ids ids;
> +       struct pidfd_info info;
> +       pthread_t thread;
> +       void *tret;
> +       int server, cfd;
> +
> +       server = socket(AF_UNIX, SOCK_STREAM, 0);
> +       ASSERT_LE(0, server);
> +
> +       fill_sockaddr(&sa, true);
> +       ASSERT_EQ(0, bind(server, (struct sockaddr *)&sa.listen_addr, sa.addrlen));
> +       ASSERT_EQ(0, listen(server, 1));
> +
> +       ASSERT_EQ(0, pthread_create(&thread, NULL, peer_connect_thread, &sa));
> +
> +       cfd = accept(server, NULL, NULL);
> +       ASSERT_LE(0, cfd);
> +
> +       ASSERT_EQ(sizeof(ids), recv(cfd, &ids, sizeof(ids), MSG_WAITALL));
> +       ASSERT_NE(ids.pid, ids.tid);
> +
> +       /* SO_PEERPIDFD refers to the peer's thread-group. */
> +       ASSERT_EQ(0, peer_pidfd_info(cfd, SO_PEERPIDFD, &info));
> +       EXPECT_EQ(ids.pid, info.pid);
> +       EXPECT_EQ(ids.pid, info.tgid);
> +
> +       /* SO_PEERPIDFD_THREAD refers to the connecting thread. */
> +       ASSERT_EQ(0, peer_pidfd_info(cfd, SO_PEERPIDFD_THREAD, &info));
> +       EXPECT_EQ(ids.tid, info.pid);
> +       EXPECT_EQ(ids.pid, info.tgid);
> +
> +       /* release the connecting thread */
> +       ASSERT_EQ(1, write(cfd, "x", 1));
> +       ASSERT_EQ(0, pthread_join(thread, &tret));
> +       ASSERT_EQ(NULL, tret);
> +
> +       close(cfd);
> +       close(server);
> +}
> +
>  TEST_HARNESS_MAIN
>
> --
> 2.53.0
>
