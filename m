Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B54424D48
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778844; cv=pass; b=MVZlj5lz1BXlWe2GgIfaz9NJwfcpOh4yh0YYFctKPm5IcN329rlyJhbsEwPNW6/mFMaO4F3QvwEA2fd4Ox/PHE8d9EFM4hpLdNb2H56+xq5GnD/a8gaQ3HQ/6+1qE+BUe4H4tg377lwhZmQ/Rcw3ensv3vqC+oq9L6qeqaNty1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778844; c=relaxed/simple;
	bh=1W8uvQaYp8lzNksLgoSJuXrmpDkGKXa2H0+Uugp+NpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebuhW3a+v5+/MSklwKpTES95wOQTRxp4W7dAN7QtLIglXLplXpgBx386WUjwMTbUga5/9HEiloLNCvjd+XvIrD295V7QjOjRE2x+3i/4Z1Ch0ed4nGbddvnnuQtIEljI9vbGmAoFrF4XRrImQ1vYkOsqVCV3COIyOyy7Fa5/jls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=fes6b/oi; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="fes6b/oi"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25420fe973so561399966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788778840; cv=none;
        d=google.com; s=arc-20260327;
        b=NUxzKipvXc8yko22+iDX2jB/toUduxfR5bQ93pGHuHhf6W9W7d+YOJDRayzcLowl9j
         dgHK0gx4AaQ5F/g4rAGbej75xsJpxsd2bxefHFSidZs6BJA1q08CYfM07WgOYjJTCPXM
         rfV1wtEg3oqxN2hIkJvv/ULmU7kAWe/4J1bSrjJg514seH+a5hpH6b42LPpao97LSe2f
         zeNgzh9a47pIe6zT3soRxG6/o9sD6/Yp6lO90Rr/Xb3yxUPFVYL7AvQ/Dy1uz3UgMxce
         1r7oIWNmqHJWE7p/o/SKItjDV5FitSezusIK0FdVcMuaVX4B3ex2K33+JxW+GNYinlVM
         AxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zny1KKC/uPX8QbOxaFwPCGHoxMxtpzdiurM7Tl80u1k=;
        fh=1dcINYFcQ0A4xf2D6ma1LyNv+9fzCxKFfkmARkROYBA=;
        b=Fdj5TSOSSdKfVn+X3aCjpNrAtunqCNr1vU910qjx2o7PVnWHyDQhH6hzl3Q8fnjfY3
         nEso7q5+GriRTFuFlhSzZ0LfatY6KPjCkYMS9EF0eP3SLPZGfg4UeNTx0YN3lvt7COTP
         OFyWSIRz4Cw0H6nIZB7ieCFQdJvQttN1hzLDCJ6o81sy+610t48AwFUZM3tlgquVXSd+
         ulhS50/kjHeLAsv93MWvpM1vZ+5OaV0LDKX3ME0slFSM1bCHrTBlBgMhvEt4e+uBM0Fb
         6bquN+vF4Sk6JaKzA7CnoamuI9CVwMsiHOsMTpBSL5kM38wYSLyCVR+LDtcR9z5oOP8P
         N2Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788778840; x=1789383640; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zny1KKC/uPX8QbOxaFwPCGHoxMxtpzdiurM7Tl80u1k=;
        b=fes6b/oi9GNDqVkNavvFasu3Ix6qQF3e72pzkNmozFR13Q4JgFNWmijgUukPPBkTRz
         mQrEGCxy9QYh7qe6aHOtf/mUPiy5NppxysGh2K8i+hcWhce/GGL+YPL6SRJThSmwFrZO
         78adGg/qgqERyN5scyWvT8eWFwajNMyDJe+t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778840; x=1789383640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zny1KKC/uPX8QbOxaFwPCGHoxMxtpzdiurM7Tl80u1k=;
        b=g+31ASqlAsEqGCq19lTb+KFwn0oxufoL1+F/RbA/s/ETlLQBoERQOlh5RBTwvKZ/Tl
         /LEQa/FKV9RkOmkoa/CTFYMAiP+XwqS+w5WDhLORyW51QM3bF7VxUrFaj4Dqz+7f9p/4
         Rg5V3PUuv5pms7faWHtFKiKMQgN9vPMEcWmmtjtHnzuJ/8gbk82PMztbwpc1JlVm9pC7
         5rXFWoOjiYkBfQTJFEs1FtVmooW07h9Hc7pNGpBfcd2/wdstl2Tk/YuC3vXvKZXi7Ddb
         yLoKbCLesxs8sXY7MqrkBN0Tdtnq3jGXZz00hT+5RE2LCK+ajWwxKqnZDJoWIuTBnif4
         KCOw==
X-Forwarded-Encrypted: i=1; AKwUvBz0uU/VYyTeWXjgrpRlT9Tbx36TxBCxyFkUDzK8zV6KeWN+Opmf8rTvkpohY6b7yrw/pq+aAzgbebtt7uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lHOLrBoVF//VQmShG3LNNdlTgTGSjI8fomWLp5z0TlAkQWbW6o
	ybpChrDBl31D0oDDZ7n1WRFVSbyTaDe+XPVDxvqKlDuhZnR7btSeh8QdJ9y82lIVBkOWyE1Z0PL
	wErTInnINE3JI2GCuRS+Ro0pKUE8YA/JAdXmp7EC2GQ==
X-Gm-Gg: AYBFou1g/2PrR7aUN2bQug4Ximcq5vKK2Oum4h0A7I5QG120nFjinfAaq0zX/d+7yPe
	gcmsjW6L7EsWG6V5OBxoTJswu3Lr1AeuielzQf5wuoPCCf63uUyQbE8QGIw/Efe0QbmLhOOolcD
	DybTNgzcmNHGjV/C96gPfkB3wlJuwwi0ecNhOLHDli6jAmcPGt5ClBuLJXKMEakZFOAL+iR19Qc
	xuR56DwWrBghvzMkqX47sLZyCQPjuYDQgiVdcMxG1izZcc4eBo4+b5XPRk8iPdeG15B3EwzddDw
	+KCgs1fhwDw1OQFhRtIcjPHcZJE+Ol4pdHGWXaJNMJp7l0CQdH0SdbYLwMhPWFb8erUPtNC4UAU
	=
X-Received: by 2002:a17:907:7294:b0:c26:19de:9139 with SMTP id
 a640c23a62f3a-c2619dea0f1mr752175766b.44.1788778839290; Mon, 07 Sep 2026
 04:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org> <20260831-work-unix-passpidfd-v1-10-70cbfda0c7ba@kernel.org>
In-Reply-To: <20260831-work-unix-passpidfd-v1-10-70cbfda0c7ba@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 7 Sep 2026 13:00:27 +0200
X-Gm-Features: AcwNN1U23yfZ1nAFBhZtDhOey9YcEzK38gF_zORjIDm7e-DTOat32VqriNkwZBM
Message-ID: <CAJqdLrpDz4DAkoK-5+s-KmafRsudctd3OouhXmgV=nNM-Up72w@mail.gmail.com>
Subject: Re: [PATCH 10/10] selftests/coredump: check the dumping thread's pidfd
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 31. Aug. 2026 um 13:22 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> Crash from a non-leader thread and verify that the pidfd from
> SO_PEERPIDFD_THREAD on the coredump socket refers to that thread and
> reports the coredump like the thread-group leader's pidfd does.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
>  .../selftests/coredump/coredump_socket_test.c      | 175 +++++++++++++++++++++
>  tools/testing/selftests/coredump/coredump_test.h   |   2 +
>  .../selftests/coredump/coredump_test_helpers.c     |  49 ++++++
>  3 files changed, 226 insertions(+)
>
> diff --git a/tools/testing/selftests/coredump/coredump_socket_test.c b/tools/testing/selftests/coredump/coredump_socket_test.c
> index 422728f632ca..ec73bb690bbc 100644
> --- a/tools/testing/selftests/coredump/coredump_socket_test.c
> +++ b/tools/testing/selftests/coredump/coredump_socket_test.c
> @@ -592,6 +592,181 @@ TEST_F(coredump, socket_coredump_signal_sigsegv)
>         wait_and_check_coredump_server(pid_coredump_server, _metadata, self);
>  }
>
> +static bool check_coredump_info(const struct pidfd_info *info, const char *what)
> +{
> +       if (!(info->mask & PIDFD_INFO_COREDUMP)) {
> +               fprintf(stderr, "%s: PIDFD_INFO_COREDUMP not set in mask\n", what);
> +               return false;
> +       }
> +
> +       if (!(info->coredump_mask & PIDFD_COREDUMPED)) {
> +               fprintf(stderr, "%s: PIDFD_COREDUMPED not set in coredump_mask\n", what);
> +               return false;
> +       }
> +
> +       if (!(info->mask & PIDFD_INFO_COREDUMP_SIGNAL) || info->coredump_signal != SIGSEGV) {
> +               fprintf(stderr, "%s: coredump_signal=%d, expected SIGSEGV=%d\n",
> +                       what, info->coredump_signal, SIGSEGV);
> +               return false;
> +       }
> +
> +       if (!(info->mask & PIDFD_INFO_COREDUMP_CODE) || info->coredump_code != SEGV_MAPERR) {
> +               fprintf(stderr, "%s: coredump_code=%d, expected SEGV_MAPERR=%d\n",
> +                       what, info->coredump_code, SEGV_MAPERR);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
> +/*
> + * Test: PIDFD_INFO_COREDUMP on the dumping thread's pidfd
> + *
> + * Crash from a non-leader thread and verify that the pidfd from
> + * SO_PEERPIDFD_THREAD refers to that thread and reports the coredump
> + * like the thread-group leader's pidfd from SO_PEERPIDFD does.
> + */
> +TEST_F(coredump, socket_coredump_thread)
> +{
> +       int pidfd, ret, status;
> +       pid_t pid, pid_coredump_server;
> +       struct pidfd_info info = {};
> +       int ipc_sockets[2];
> +       char c;
> +
> +       ASSERT_TRUE(set_core_pattern("@/tmp/coredump.socket"));
> +
> +       ret = socketpair(AF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0, ipc_sockets);
> +       ASSERT_EQ(ret, 0);
> +
> +       pid_coredump_server = fork();
> +       ASSERT_GE(pid_coredump_server, 0);
> +       if (pid_coredump_server == 0) {
> +               int fd_server = -1, fd_coredump = -1, fd_peer_pidfd = -1;
> +               int fd_thread_pidfd = -1, fd_core_file = -1;
> +               struct pidfd_info thread_info = {};
> +               int exit_code = EXIT_FAILURE;
> +
> +               close(ipc_sockets[0]);
> +
> +               fd_server = create_and_listen_unix_socket("/tmp/coredump.socket");
> +               if (fd_server < 0) {
> +                       fprintf(stderr, "socket_coredump_thread: listen socket failed: %m\n");
> +                       goto out;
> +               }
> +
> +               if (write_nointr(ipc_sockets[1], "1", 1) < 0) {
> +                       fprintf(stderr, "socket_coredump_thread: ipc write failed: %m\n");
> +                       goto out;
> +               }
> +
> +               close(ipc_sockets[1]);
> +
> +               fd_coredump = accept4(fd_server, NULL, NULL, SOCK_CLOEXEC);
> +               if (fd_coredump < 0) {
> +                       fprintf(stderr, "socket_coredump_thread: accept4 failed: %m\n");
> +                       goto out;
> +               }
> +
> +               fd_peer_pidfd = get_peer_pidfd(fd_coredump);
> +               if (fd_peer_pidfd < 0) {
> +                       fprintf(stderr, "socket_coredump_thread: get_peer_pidfd failed\n");
> +                       goto out;
> +               }
> +
> +               fd_thread_pidfd = get_peer_pidfd_thread(fd_coredump);
> +               if (fd_thread_pidfd < 0) {
> +                       fprintf(stderr, "socket_coredump_thread: get_peer_pidfd_thread failed\n");
> +                       goto out;
> +               }
> +
> +               if (!get_pidfd_info(fd_peer_pidfd, &info) ||
> +                   !get_pidfd_info(fd_thread_pidfd, &thread_info)) {
> +                       fprintf(stderr, "socket_coredump_thread: get_pidfd_info failed\n");
> +                       goto out;
> +               }
> +
> +               /* The peer is the thread-group leader, the dumping thread is not. */
> +               if (info.pid != info.tgid || thread_info.tgid != info.tgid ||
> +                   thread_info.pid == thread_info.tgid) {
> +                       fprintf(stderr, "socket_coredump_thread: unexpected ids %d/%d and %d/%d\n",
> +                               info.pid, info.tgid, thread_info.pid, thread_info.tgid);
> +                       goto out;
> +               }
> +
> +               if (!check_coredump_info(&info, "SO_PEERPIDFD") ||
> +                   !check_coredump_info(&thread_info, "SO_PEERPIDFD_THREAD"))
> +                       goto out;
> +
> +               fd_core_file = open_coredump_tmpfile(self->fd_tmpfs_detached);
> +               if (fd_core_file < 0) {
> +                       fprintf(stderr, "socket_coredump_thread: core tmpfile failed: %m\n");
> +                       goto out;
> +               }
> +
> +               for (;;) {
> +                       char buffer[4096];
> +                       ssize_t bytes_read, bytes_write;
> +
> +                       bytes_read = read(fd_coredump, buffer, sizeof(buffer));
> +                       if (bytes_read < 0) {
> +                               fprintf(stderr, "socket_coredump_thread: core read failed: %m\n");
> +                               goto out;
> +                       }
> +
> +                       if (bytes_read == 0)
> +                               break;
> +
> +                       bytes_write = write(fd_core_file, buffer, bytes_read);
> +                       if (bytes_read != bytes_write) {
> +                               fprintf(stderr, "socket_coredump_thread: core write %zd/%zd: %m\n",
> +                                       bytes_read, bytes_write);
> +                               goto out;
> +                       }
> +               }
> +
> +               exit_code = EXIT_SUCCESS;
> +               fprintf(stderr, "socket_coredump_thread: completed successfully\n");
> +out:
> +               if (fd_core_file >= 0)
> +                       close(fd_core_file);
> +               if (fd_thread_pidfd >= 0)
> +                       close(fd_thread_pidfd);
> +               if (fd_peer_pidfd >= 0)
> +                       close(fd_peer_pidfd);
> +               if (fd_coredump >= 0)
> +                       close(fd_coredump);
> +               if (fd_server >= 0)
> +                       close(fd_server);
> +               _exit(exit_code);
> +       }
> +       self->pid_coredump_server = pid_coredump_server;
> +
> +       EXPECT_EQ(close(ipc_sockets[1]), 0);
> +       ASSERT_EQ(read_nointr(ipc_sockets[0], &c, 1), 1);
> +       EXPECT_EQ(close(ipc_sockets[0]), 0);
> +
> +       pid = fork();
> +       ASSERT_GE(pid, 0);
> +       if (pid == 0)
> +               crashing_child_thread();
> +
> +       pidfd = sys_pidfd_open(pid, 0);
> +       ASSERT_GE(pidfd, 0);
> +
> +       waitpid(pid, &status, 0);
> +       ASSERT_TRUE(WIFSIGNALED(status));
> +       ASSERT_EQ(WTERMSIG(status), SIGSEGV);
> +       ASSERT_TRUE(WCOREDUMP(status));
> +
> +       ASSERT_TRUE(get_pidfd_info(pidfd, &info));
> +       ASSERT_TRUE(!!(info.mask & PIDFD_INFO_COREDUMP));
> +       ASSERT_TRUE(!!(info.coredump_mask & PIDFD_COREDUMPED));
> +       ASSERT_EQ(info.coredump_signal, SIGSEGV);
> +
> +       wait_and_check_coredump_server(pid_coredump_server, _metadata, self);
> +}
> +
>  /*
>   * Test: PIDFD_INFO_COREDUMP_SIGNAL via simple socket coredump with SIGABRT
>   *
> diff --git a/tools/testing/selftests/coredump/coredump_test.h b/tools/testing/selftests/coredump/coredump_test.h
> index ed47f01fa53c..4212656e31f0 100644
> --- a/tools/testing/selftests/coredump/coredump_test.h
> +++ b/tools/testing/selftests/coredump/coredump_test.h
> @@ -27,10 +27,12 @@ FIXTURE(coredump)
>  /* Shared helper function declarations */
>  void *do_nothing(void *arg);
>  void crashing_child(void);
> +void crashing_child_thread(void);
>  int create_detached_tmpfs(void);
>  int create_and_listen_unix_socket(const char *path);
>  bool set_core_pattern(const char *pattern);
>  int get_peer_pidfd(int fd);
> +int get_peer_pidfd_thread(int fd);
>  bool get_pidfd_info(int fd_peer_pidfd, struct pidfd_info *info);
>
>  /* Inline helper that uses harness types */
> diff --git a/tools/testing/selftests/coredump/coredump_test_helpers.c b/tools/testing/selftests/coredump/coredump_test_helpers.c
> index 2a20faf9cb0a..36306069f62e 100644
> --- a/tools/testing/selftests/coredump/coredump_test_helpers.c
> +++ b/tools/testing/selftests/coredump/coredump_test_helpers.c
> @@ -13,6 +13,7 @@
>  #include <string.h>
>  #include <sys/epoll.h>
>  #include <sys/ioctl.h>
> +#include <sys/mman.h>
>  #include <sys/socket.h>
>  #include <sys/types.h>
>  #include <sys/un.h>
> @@ -38,6 +39,10 @@ struct _fixture_coredump_data {
>
>  #define NUM_THREAD_SPAWN 128
>
> +#ifndef SO_PEERPIDFD_THREAD
> +#define SO_PEERPIDFD_THREAD 87
> +#endif
> +
>  void *do_nothing(void *arg)
>  {
>         (void)arg;
> @@ -59,6 +64,36 @@ void crashing_child(void)
>         i = *(volatile int *)NULL;
>  }
>
> +static void *crashing_thread(void *arg)
> +{
> +       int *p;
> +
> +       (void)arg;
> +
> +       /* crash on purpose with SEGV_MAPERR */
> +       p = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE,
> +                MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +       if (p == MAP_FAILED)
> +               return NULL;
> +       munmap(p, PAGE_SIZE);
> +       *p = 0;
> +
> +       return NULL;
> +}
> +
> +void crashing_child_thread(void)
> +{
> +       pthread_t thread;
> +       int i;
> +
> +       for (i = 0; i < NUM_THREAD_SPAWN; ++i)
> +               pthread_create(&thread, NULL, do_nothing, NULL);
> +
> +       /* crash from a non-leader thread */
> +       pthread_create(&thread, NULL, crashing_thread, NULL);
> +       pause();
> +}
> +
>  int create_detached_tmpfs(void)
>  {
>         int fd_context, fd_tmpfs;
> @@ -138,6 +173,20 @@ int get_peer_pidfd(int fd)
>         return fd_peer_pidfd;
>  }
>
> +int get_peer_pidfd_thread(int fd)
> +{
> +       int fd_peer_pidfd;
> +       socklen_t fd_peer_pidfd_len = sizeof(fd_peer_pidfd);
> +       int ret = getsockopt(fd, SOL_SOCKET, SO_PEERPIDFD_THREAD, &fd_peer_pidfd,
> +                            &fd_peer_pidfd_len);
> +       if (ret < 0) {
> +               fprintf(stderr, "%s: getsockopt(SO_PEERPIDFD_THREAD) failed: %m\n", __func__);
> +               return -1;
> +       }
> +       fprintf(stderr, "%s: successfully retrieved pidfd %d\n", __func__, fd_peer_pidfd);
> +       return fd_peer_pidfd;
> +}
> +
>  bool get_pidfd_info(int fd_peer_pidfd, struct pidfd_info *info)
>  {
>         int ret;
>
> --
> 2.53.0
>
