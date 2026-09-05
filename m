Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E435F172
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570047; cv=pass; b=NtLxSkB2180iZAnImWH9nC6MMn/hmqmNoAYjPiMCKVF4PuS/uKEkhC0VCOvTbmCd3IQZRvpX/SZ8aO8STWv77xYzakPz9ZcohMcMayrDGDn3Bbwnt5jhP7IlOp6eh6somg3j7QhRh6HKJaQDK8bTt6JSxyQ6872tPUGz5WyGa+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570047; c=relaxed/simple;
	bh=Elwk7VmEoGhL32FW/Nx3bR/piitjtLgz4SNrUhNzp54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKlyJEumIUXmHMKefuGgS8y9tQiSS0qQSq8PNbVCYLNlFjQMXi/IyOQGyjby4pcw4ZeafX4U/2iby5WAaVt0oqvFA323OFQicEiPcekoaw1sicRQTT1ezfzo1vF6JBv89mHU9SkqFIkrmmOMCNNOrES/fdiOt0rK4ZmpV7y7L+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=qKmebhjq; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="qKmebhjq"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66825847b2cso2419350d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788570043; cv=none;
        d=google.com; s=arc-20260327;
        b=D6dna+ALpQ/KhlvwCkm25tN9ifuOYGkNXHVuQZW7Lamfz2j/WbvNmjrlZ8FbHwETuU
         WwtqGeXRq20ak523y5nB2QafuoS2Q/nULCdAtGlFmjcLLNKGwM20J+72t2sj+4AZDcJA
         hvfFIB+Z1iz3wKyBxp3f2taV9XZcgq8RfFKmDz5eSuzoediRtrQHVliCI/4cyI0U6RN0
         RLNo9043ESDqHPuLB+Pi0ZdunW5DhuiYf2yAlbxIBGZFvZAlrbtFFI9eQk57wog8UV3q
         zotC0CKLauASYF/QOBQTC1la8yzg4gK/WjKEZEtpkafce9/sN+PyyYFLt2SsyL8IM1gc
         V4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLsjxOOD/PGvIN0UFoQWSpaF44F5YOlXXFag5HE958I=;
        fh=qRfkSyl3yI5sGraFcOi7y5+xKx/6SXKmkIx6S0y4hLM=;
        b=k/eK78gIZQ7g3m8U1W0WN0RbLN4FyznGhdLiqCQe+/KSmojDBaPpQUsRx4tISDSMiz
         k+8pmiGE+gxjkP89t8dEnHigR+LUsAO8GN9uju9dPhHEQkqexAjFV/i03xSp9Zy97wVU
         AkU172so8yIzE4QpGr0AXNwmRZSQ15GovxSVaHD5h0Jk/qa8iD7PDAZzZch3pW9qpTFl
         tzedOStof3gRFxolCWUnuSOP6A9v1iOdJKWbVpmLcg8oD/WMGBrHIjXj4ZFEc8RfN6JA
         RAygsDuLlE5woGg7Z53lC+56+llyJphIt/MmLK8JGqsrHHMGbGyObjc/3AwvVAFIfgkI
         uYzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788570043; x=1789174843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLsjxOOD/PGvIN0UFoQWSpaF44F5YOlXXFag5HE958I=;
        b=qKmebhjq+i9IEf1eNgGn7GWiFl1BqDHqIEb98Nlqph9NzsLEmPq8+ya05/k1696lS4
         XosvTejjTJ9eBnwb1AAzLEGKaFQP3j6NipjTiT4F/S7BZVbX+kMWscI7zWM1vlbz2dcJ
         xXTvEraTgqUmoc5Y6S5Y5/gXiGzvGW1eU+k40tjPEuwh4Jl5aScL8kk5+HIUe9RWBE0m
         Y9uyg/nIQPduNZQ4J220GPbI/JaUYpGnd9VO5oTbd+4JSLPTit1gYwjUqtORGh/F9HW4
         BV2VsbpuiQfaEYklQBfxTRl9CT4CSlD9LnLGMX2C9CGXHb8WHhc2ag09wDSqGbs57593
         Udpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570043; x=1789174843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLsjxOOD/PGvIN0UFoQWSpaF44F5YOlXXFag5HE958I=;
        b=ix+MZ13qj4OHY6WUOZAUk1zbJH5xX92CstXBXrD4nT4E3NeHOmZHYfLBoeVMHkzbIO
         /qRoFi/7Ez3Ek3v3RU7wMNEyCzZ5W/Q1rSITBViuKxErClzhropoub5S2YW/G2hoN6tg
         bUpeD9r5BUQm0C+HBqNIOJ8whXFwO2eFeqSenb/6oF/bcWW0ARriilOIBvYwCnl8jb9l
         FMcymc0UU4oBq2ItedE9VbjgQBTQXRFrsYmCabJP9xi/sEk0QiN2CY435CVKtmshaSc/
         o9CgFGYh2Ys7WK/gBkQ4+EC9NY4bL3iqc7FhZpgOoMvT23dqC/kYQKewvbqhY1IdL+sh
         5m4Q==
X-Forwarded-Encrypted: i=1; AKwUvBygAF6Iz2ZmT8muvxFQaVDUg/2YyqD0UfG/fz8r14LGmHC41qpAqY0nqwX7qNsY8lQi3ZCIghEg9aHSSm8=@vger.kernel.org
X-Gm-Message-State: AFuF++lp+1m6pZUCEiDlnaIlSeFAw5wiFBs8ISFg4f4pZqFA+OSPbctb
	eFdbac48L1KkL94hREkKxrTTQuZ5tUXgdCix4pgkITn7zx9JFnts7KXrpz4vdnfM4j/GHyjeOPG
	1hcm9kHv3pQJiSe4ruOO49uIsTnMQCX+5vW61tQIaJA==
X-Gm-Gg: AYBFou2g4sWm6GzgL1sufSQ9Az1HZ5FgVD0N//rJDDtTGjVGof6uuMoVprWhumv2PuV
	AD1X93BABoHWfTipHN9LIZXPyp9ySBv4B5oG4vtwuhMn/Lx2UpM2Ac5lPRPvxYMx75Devasw7bN
	Lgu2x1UyeEo9PQoT2EH/cXBaqy7SZFmflH7jveByP9wVdH9469U8RhvNQusDQV9DK9l4jSFrnm9
	xcMk8E1F9QySPbAusn5yw+kACsdU4MbbR+cAp5gMh/M3a9BTon9YDxM5LkPTMQjo7h/VSd6iLHt
	hrI3qWH8d7gvtkrw3g8UX1fV2JfYcWputA9edmQDsc+Pf5y2jOH1tKoGp17VAQ==
X-Received: by 2002:a05:690e:408:b0:66f:c1be:84e3 with SMTP id
 956f58d0204a3-66fc1be8719mr1324482d50.81.1788570043203; Fri, 04 Sep 2026
 18:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com> <20260901014713.3502900-4-sanghyun.park.cnu@gmail.com>
In-Reply-To: <20260901014713.3502900-4-sanghyun.park.cnu@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Fri, 4 Sep 2026 21:00:31 -0400
X-Gm-Features: AcwNN1X6a5AXkI5YfosGFySD8AZcWFDNtmSjCkKbO7VUp53de4hbB8cR5UIq2PE
Message-ID: <CABFh=a6YEtiZdcC51LXbZKTKWoXxCk9PSe5jtn1R-w_EWT4aUQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 2/2] selftests/bpf: Cover attach type checks
 in link update
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, Leon Hwang <leon.hwang@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pu Lehui <pulehui@huawei.com>, 
	Suchit Karunakaran <suchitkarunakaran@gmail.com>, Xu Kuohai <xukuohai@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:48=E2=80=AFPM Sanghyun Park
<sanghyun.park.cnu@gmail.com> wrote:
>
> Pin down the two contracts changed by the companion patch. LINK_UPDATE
> validates a replacement program against the link's attach type, while
> CGROUP_SKB capability checks apply at LINK_CREATE and not LINK_UPDATE.
>
> Cover incompatible UDP4/UDP6 and LSM attach flavors, plus a CGROUP_SKB
> link update after dropping CAP_NET_ADMIN and CAP_SYS_ADMIN.
>
> Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
> ---
> v5:
>   - Isolate attach and update coverage in separate subtests with their ow=
n setup.
>   - Inline the one-use LSM program FD and use a descriptive link FD.
>   - Explain the create-versus-update contracts covered by the tests.
> v4: https://lore.kernel.org/r/20260831023918.1857658-2-sanghyun.park.cnu@=
gmail.com
> ---
>  .../selftests/bpf/prog_tests/cgroup_link.c    | 81 ++++++++++++++++++-
>  .../selftests/bpf/prog_tests/lsm_cgroup.c     | 12 +++
>  .../testing/selftests/bpf/progs/lsm_cgroup.c  |  6 ++
>  .../selftests/bpf/progs/test_cgroup_link.c    | 14 +++-
>  4 files changed, 111 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_link.c b/tools=
/testing/selftests/bpf/prog_tests/cgroup_link.c
> index 15093a69510e..3b43c34917cc 100644
> --- a/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
> +++ b/tools/testing/selftests/bpf/prog_tests/cgroup_link.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <test_progs.h>
> +#include "cap_helpers.h"
>  #include "cgroup_helpers.h"
>  #include "testing_helpers.h"
>  #include "test_cgroup_link.skel.h"
> @@ -24,7 +25,77 @@ int ping_and_check(int exp_calls, int exp_alt_calls)
>         return 0;
>  }
>
> -void serial_test_cgroup_link(void)
> +static void test_cgroup_link_update(void)
> +{
> +       const __u64 caps =3D (1ULL << CAP_NET_ADMIN) | (1ULL << CAP_SYS_A=
DMIN);
> +       struct bpf_link *link =3D NULL;
> +       __u64 saved_caps =3D 0;
> +       int cg_fd =3D -1, err;
> +
> +       skel =3D test_cgroup_link__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "skel_open_load"))
> +               return;
> +
> +       err =3D setup_cgroup_environment();
> +       if (!ASSERT_OK(err, "cg_init"))
> +               goto cleanup;
> +
> +       cg_fd =3D create_and_get_cgroup("/cgroup_link_update");
> +       if (!ASSERT_GE(cg_fd, 0, "cg_create"))
> +               goto cleanup;
> +
> +       err =3D join_cgroup("/cgroup_link_update");
> +       if (!ASSERT_OK(err, "cg_join"))
> +               goto cleanup;
> +

Wrt bot feedback: This is fine, the bot itself says it's more
consistent within the file to
use the same setup/teardown.

> +       link =3D bpf_program__attach_cgroup(skel->progs.sendmsg4, cg_fd);
> +       if (!ASSERT_OK_PTR(link, "attach_sendmsg4"))
> +               goto cleanup;
> +
> +       err =3D bpf_link__update_program(link, skel->progs.sendmsg6);
> +       ASSERT_EQ(err, -EINVAL, "reject_sendmsg6_update");
> +       bpf_link__destroy(link);
> +       link =3D NULL;
> +
> +       err =3D cap_disable_effective(caps, &saved_caps);
> +       if (!ASSERT_OK(err, "drop_caps_for_attach"))
> +               goto cleanup;
> +
> +       link =3D bpf_program__attach_cgroup(skel->progs.egress, cg_fd);
> +       if (!ASSERT_ERR_PTR(link, "attach_without_net_admin"))
> +               goto cleanup;
> +       err =3D libbpf_get_error(link);
> +       link =3D NULL;
> +       if (!ASSERT_EQ(err, -EPERM, "attach_err"))
> +               goto cleanup;
> +
> +       err =3D cap_enable_effective(saved_caps & caps, NULL);
> +       if (!ASSERT_OK(err, "restore_caps_for_attach"))
> +               goto cleanup;
> +
> +       link =3D bpf_program__attach_cgroup(skel->progs.egress, cg_fd);
> +       if (!ASSERT_OK_PTR(link, "attach_egress"))
> +               goto cleanup;
> +
> +       err =3D cap_disable_effective(caps, &saved_caps);
> +       if (!ASSERT_OK(err, "drop_caps"))
> +               goto cleanup;
> +
> +       err =3D bpf_link__update_program(link, skel->progs.egress_alt);
> +       ASSERT_OK(err, "update_without_net_admin");
> +
> +cleanup:
> +       err =3D cap_enable_effective(saved_caps & caps, NULL);
> +       ASSERT_OK(err, "restore_caps");
> +       bpf_link__destroy(link);
> +       if (cg_fd >=3D 0)
> +               close(cg_fd);
> +       cleanup_cgroup_environment();
> +       test_cgroup_link__destroy(skel);
> +       skel =3D NULL;
> +}
> +
> +static void test_cgroup_link_attach(void)
>  {
>         struct {
>                 const char *path;
> @@ -253,3 +324,11 @@ void serial_test_cgroup_link(void)
>         }
>         cleanup_cgroup_environment();
>  }
> +
> +void serial_test_cgroup_link(void)
> +{
> +       if (test__start_subtest("attach"))
> +               test_cgroup_link_attach();
> +       if (test__start_subtest("update"))
> +               test_cgroup_link_update();
> +}
> diff --git a/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c b/tools/=
testing/selftests/bpf/prog_tests/lsm_cgroup.c
> index 41e867467f6c..0dd44dbb9c95 100644
> --- a/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
> +++ b/tools/testing/selftests/bpf/prog_tests/lsm_cgroup.c
> @@ -74,6 +74,7 @@ static void test_lsm_cgroup_functional(void)
>         int bind_prog_fd =3D -1;
>         int bind_link_fd =3D -1;
>         int clone_prog_fd =3D -1;
> +       int socket_link_fd =3D -1;
>         int err, fd, prio;
>         socklen_t socklen;
>
> @@ -156,6 +157,17 @@ static void test_lsm_cgroup_functional(void)
>         ASSERT_EQ(query_prog_cnt(cgroup_fd, "bpf_lsm_socket_bind"), 1, "p=
rog count");
>         ASSERT_EQ(query_prog_cnt(cgroup_fd, NULL), 4, "total prog count")=
;
>
> +       socket_link_fd =3D
> +               bpf_link_create(bpf_program__fd(skel->progs.socket_first)=
,
> +                               cgroup_fd, BPF_LSM_CGROUP, NULL);
> +       if (!ASSERT_GE(socket_link_fd, 0, "link create socket_first"))
> +               goto detach_cgroup;
> +       err =3D bpf_link_update(socket_link_fd,
> +                             bpf_program__fd(skel->progs.socket_create_l=
sm),
> +                             NULL);
> +       ASSERT_EQ(err, -EINVAL, "reject lsm_mac link update");
> +       close(socket_link_fd);
> +
>         /* Attach another instance of bind program to another cgroup.
>          * This should trigger the reuse of the trampoline shim (two
>          * programs attaching to the same btf_id).
> diff --git a/tools/testing/selftests/bpf/progs/lsm_cgroup.c b/tools/testi=
ng/selftests/bpf/progs/lsm_cgroup.c
> index 3bfa479104be..30727945cecc 100644
> --- a/tools/testing/selftests/bpf/progs/lsm_cgroup.c
> +++ b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
> @@ -213,6 +213,12 @@ int BPF_PROG(socket_first, int family, int type, int=
 protocol, int kern)
>         return 0;
>  }
>
> +SEC("lsm/socket_create")
> +int BPF_PROG(socket_create_lsm, int family, int type, int protocol, int =
kern)
> +{
> +       return 0;
> +}
> +
>  SEC("lsm_cgroup/socket_create")
>  int BPF_PROG(socket_second, int family, int type, int protocol, int kern=
)
>  {
> diff --git a/tools/testing/selftests/bpf/progs/test_cgroup_link.c b/tools=
/testing/selftests/bpf/progs/test_cgroup_link.c
> index 4faba88e45a5..a987744d129c 100644
> --- a/tools/testing/selftests/bpf/progs/test_cgroup_link.c
> +++ b/tools/testing/selftests/bpf/progs/test_cgroup_link.c
> @@ -20,5 +20,17 @@ int egress_alt(struct __sk_buff *skb)
>         return 1;
>  }
>
> -char _license[] SEC("license") =3D "GPL";
> +SEC("cgroup/sendmsg4")
> +int sendmsg4(struct bpf_sock_addr *ctx)
> +{
> +       return 1;
> +}
>
> +SEC("cgroup/sendmsg6")
> +int sendmsg6(struct bpf_sock_addr *ctx)
> +{
> +       ctx->msg_src_ip6[2] =3D 0;

Bot is right on this, this as it stands doesn't affect the tests. We
should remove it.
That being said, the test itself is fine so please just remove the line and
resend.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

pw-bot: cr

> +       return 1;
> +}
> +
> +char _license[] SEC("license") =3D "GPL";
> --
> 2.48.1
