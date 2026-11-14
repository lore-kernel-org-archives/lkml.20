Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794673381;
	b=CmjhAChNnqU4SLT5zVj9OMe6wTYbCyvUnviqsE1gZb2HUldZyhMmW8MS0/NRbvgjDxvl
	 UdcC8GHTeJE9jZODKcQqb0HLLclof/qTrhFZ5PgX4BFKrppV2yY75/XrnKnzBQG55mf3O
	 kZpyfL7zhQ5bILO1neow5YEgQT+JEPXtw8sAnXd6r6VEaqQHU8uUAZbCVZXQfUbFw2zJm
	 YepuMpRJmHCe5ZbHrH73/QvoeV0cNF5Xt3IrZ02vvOIv8cElMcaSsL0DPLA0+8q6/Cxsm
	 WLwWBjVeWfL7X6U2KsCQxQqSnTaesk7soGI2ZK6rk9mAoqkHwZ5H19fM2xPG0QPND5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
	b=nPK7H5O/lh3J9UgATFk8Mqmc8ubxIdA9ZQMYk1AsDlIAZaMIy6YFvesMZwzKyLqjENWg
	 5T/rfdlMbula/vdrg2tPq2FBvX87pqNJdpRQx75CLuYSETh0BbVhkFkyPngJdj8Akzyom
	 cowl+SUYZC0RKhiyC45MtFKNWctI8B9GwfGWn2Gt2VrFwSBB4Fs+x5c0KrTdu+NZFO7F3
	 c5tRjlnNOmOIuNOZVVnz/Z0mfIchert13zu0cceeQyjo7Jgv5Zr8pESBiLTOae2kLjIY+
	 w/fE5D+z1JECqqe4QAOR5S85lZ0NTpi7ZWcf3SyuMyDlAWHafElSenvUdgCbIXotExg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APdQoQCw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B6606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4B6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APdQoQCw
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b30ff12f84so14197697b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673380; cv=none;
        d=google.com; s=arc-20260327;
        b=a3NXdbeZ6Sd/7XUCgZ9jymUA1T4ph9XX4IEvYtQSuDmMzm/tcjGDxjknV35DD3cmhr
         bTJw0qdQvgeLc2LaTEU0Z50i07NH8gB+DyL5IAsazzVaNtEgdVssH9J8SKK7f1sUQfd2
         Z8hc6TqA+K4gjusoJhFddecEmDatHvYXevmtZ8SNJHNPsLJiNyEYA7aghjSTiyq15yJT
         YHEM4f/+nyTn8p8bVVLDxDHPDdATWcEeRwp8eE4jO5Vfc+20JtvmG5Z4QFkrtMJbdB34
         PeEhZaHO1DNV3lJYggPEF1WiH6fA978ZITbVocL/wL+t0+uxFnZKoUr6xXq9Mpzs6oVD
         te4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        fh=rckWQf9qnTlVHcxH+QgcMr3Ioi7wHgE2qqlpijpN8BA=;
        b=fWsnLUKhr1jd/XzHIQ6xkcRMtjHj4dIxkA5QwI+hdgBtSITaeBa2t/mHuhR72tQ1I6
         c2pctwKdOHjVawzN6mzPytsW3V9DKUGGWiwc2DOrJo3pf4sgr3DK+IyQ5A98qF66qZz4
         2ws8H/qTl21Zu2yJrk0oUgoQfOQkklyFHPnr0ZkJIPQ4fgz6qy32o1pduo09KRsDWU2v
         cucit9DgayDiWY/enGayejMF2JmZxs3mOx/q64UNK+TC4MqRwFnDYdxr+5Q2QjYGQg33
         NB80VJsO8kNUuOeMde1ULpDw9rUElCtt49wHx3sevcC+p2wSk6wekKEfG6GxpIjNYsH/
         GNlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673380; x=1795278180; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        b=APdQoQCw4TyQgXX7302jy7sKpUOemBZ4YzjW5ZzZnDAbAXo2VYfez9gb2Z2Grl83Fz
         W3FFJxdzWvNY/LaiEUZtO1N9KaNikO+ws3FBIDmAJqOc27WoUMdtoOYO7JtMFGM0X+yg
         b76rLyjPDHMRxfSSFHCbo5VnFgW7kLgJRoHcJSi/1e11d1PyNXb1mgeRTZu93dOJQVmJ
         3igUdwJ2oiTJdZ9KOu5ZALJemocETQ/4NTyLnr+yxNd4TeqeWBDWX3dLyRFjnNZC31lO
         simp0koL5wenXBnHoooIMg08JPKufYY/c0sdBByBFAY6GvpF87jSGiiJQN4ynN4xSmXN
         fDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673380; x=1795278180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        b=C6XF4kEyrFDO38SgsVCn/vjFsmipXoeSiZckOhjP/toBIbkd7agrYwJJAgI/H5jggF
         U+b1cKidoPd5dSL2gLfC8Z2jXoiEKBNwvAFj+GXSksp72wF9ts6L3M1em1LAX+qbuHiz
         IlPnCDC06mRfMDGlY7Xtqq2imq1NPUtIbANSJbdd3dSAZAFJ1+nkE0g/uVb1vn4EPEuo
         W1cyj8HNka3Fe1Cqh9wQOY5U/i6QIMcEMMu2lkWXkcybnVkc61/6Y8IZ5Igo0O2CYnJn
         7Na7kpZtzhj+tU7hc6CB61BQApeAnxxnY2JqDVPJCSh1jwBP74jsYzYvXQu8W9xsvKaP
         OlPQ==
X-Forwarded-Encrypted: i=1; AL+hErHC2y0JMrOhbwCh0X9lF/bOt5iUTO+iSsto3fiAyb6fztw+LPQsqJ0l7sBADDF2rYH4tJgdQA0vuwoM6MI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sW11rhyLrK4Y9IZcCQ14YksLM5Bc/EAJ5hYzcVrf5KLFJ6Abr
	RkR0PqlLK+vTpaHRa7P9D/rBqeG2OuZQ9aRAa3vene/QugPdCm7qcblDlaMH8myDqu8kama32xm
	JMqxIYEB4etj58AYsPYcMllW6kPpBiD0=
X-Gm-Gg: AYBFou0YKkQwoHD66JsRvxidXnX4i9ZWP4SH9J+XSA78u5hrOs8C15tlAtoJr75gDWP
	kSjsia4FDVn95QHb4odj2CYwv2njXHcOTC0+srDNnyaMOVCks7gDunLTaBlUnTCG9CRQJT4ejOU
	BKgBAtOfHjOocmAB2t8AKlN6fCBdnKlPzmsgcVQz+HlytwJPV3kgq3wkByHVyEvD0dJ66kSJUh2
	Bsh1+/XFbiPYmUYmqBx/lvS9Ia6zmvIjtG5A051OEPm+5b/0zCA81+Ctg2yb50zXe/U23vvToS/
	f+rNX8geRAhdRZqesAIvgiZC9IKcTdfWQvQoJRnatd/lGuHSuofzDi6A2MrbDmNBHUHmx6LmyHe
	uue2bws5/fhTmvRkULv9W0fLP+24Vhup+SYWrwzAjsbR7/+Pee+KqyoxKSrq69R9HOovfGaZv8A
	UXqUO2gIIpK+k/vAWxj6Fwv+GISzR9fI3TckpfRh1TystZI7mH5EPpNeyfFLHRqs2Gr2BojtcaM
	WgNb8rpVqDIno6UCQdilBYtl2mTeHI=
X-Received: by 2002:a05:690e:1917:b0:675:a278:10a4 with SMTP id
 956f58d0204a3-67d89888ea5mr3886121d50.103.1794673380065; Sat, 14 Nov 2026
 08:23:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
 <20261111225148.88506-3-sidchintamaneni@gmail.com> <avgQgQeWDfQMQgvl@google.com>
In-Reply-To: <avgQgQeWDfQMQgvl@google.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sat, 14 Nov 2026 08:22:49 -0800
X-Gm-Features: AclHuK_8gEV-etDhqKooisr3RfW8V3KHVl580Th2LAmWabQ5EUshcJqxA7SCoT0
Message-ID: <CAE5sdEgGjK0x3QuetQaTycmtxUMwFf1aQChXyrQxZUkbX6uO6A@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 23:53, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> On Wed, 11 Nov 2026 22:51:48 +0000, Siddharth Chintamaneni wrote:
> > Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> > /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> > with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> > observes a dead peer in send().
> >
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > ---
> >  .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
> > index c165f250220a..ced83d3173b7 100644
> > --- a/tools/testing/selftests/net/af_unix/scm_rights.c
> > +++ b/tools/testing/selftests/net/af_unix/scm_rights.c
> > @@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
> >       close_sockets(6);
> >  }
> >
> > +static int count_scm_fds(struct __test_metadata *_metadata, int fd)
> > +{
> > +     char path[64], *line = NULL;
> > +     int scm_fds = -1, ret;
> > +     size_t unused = 0;
> > +     FILE *f;
> > +
> > +     snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
> > +
> > +     f = fopen(path, "r");
> > +     ASSERT_NE(NULL, f);
> > +
> > +     while (getline(&line, &unused, f) != -1) {
> > +             if (strncmp(line, "scm_fds:", 8))
> > +                     continue;
> > +
> > +             ret = sscanf(line + 8, "%d", &scm_fds);
> > +             ASSERT_EQ(1, ret);
> > +
> > +             break;
> > +     }
> > +
> > +     free(line);
> > +
> > +     ret = fclose(f);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     return scm_fds;
> > +}
> > +
> > +TEST(dgram_disconnect_fdinfo)
> > +{
> > +     const FIXTURE_VARIANT(scm_rights) variant = {
> > +             .name = "UNIX ",
> > +             .type = SOCK_DGRAM,
> > +     };
> > +     FIXTURE_DATA(scm_rights) self = {};
> > +     struct sockaddr addr = {
> > +             .sa_family = AF_UNSPEC,
> > +     };
> > +     int ret;
> > +
> > +     ret = unshare(CLONE_NEWNET);
> > +     ASSERT_EQ(0, ret);
> > +     ASSERT_EQ(0, count_sockets(_metadata, &variant));
>
> nit: count_sockets() is not needed.
>
>
> > +
> > +     create_socketpairs(_metadata, &self, &variant, 2);
> > +
> > +     /* 1. Disconnect via connect(AF_UNSPEC) */
> > +     __send_fd(_metadata, &self, &variant, 0, 0);
> > +     ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
> > +
> > +     ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
> > +     ASSERT_EQ(0, ret);
> > +     ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
> > +
> > +     /* 2. Dead-peer disconnect via send() */
> > +     __send_fd(_metadata, &self, &variant, 1, 1);
> > +     ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
> > +
> > +     ret = close(self.fd[3]);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     ret = send(self.fd[2], "x", 1, 0);
> > +     ASSERT_EQ(-1, ret);
> > +     ASSERT_EQ(ECONNREFUSED, errno);
> > +     ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
> > +
> > +     ret = close(self.fd[0]);
> > +     ASSERT_EQ(0, ret);
> > +     ret = close(self.fd[1]);
> > +     ASSERT_EQ(0, ret);
> > +     ret = close(self.fd[2]);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     sleep(1);
> > +     ASSERT_EQ(0, count_sockets(_metadata, &variant));
>
> Same, these two lines are unnecessary.
>
> sleep() and count_sockets() in FIXTURE_TEARDOWN(scm_rights)
> were to wait GC to purge cyclic references, but this test does
> not create that.
>

Thanks for the review! I'll drop both count_sockets() calls and re-spin in it.

>
> > +}
> > +
> >  TEST_HARNESS_MAIN
> > --
> > 2.43.0
> >
