Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC174E021E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608208; cv=pass; b=FJ+8v5LuCMXvN5J9NTHtMYte2b+gnglP1wwsWBu8eADvlRwyUknP5UhOFwLmMxosd9kLL07qLkYy+mgGsjMjN5mcf9LP/Yru8fNUUh2EohJfP7rYhz63U7BcOCs4LskU/v51MaGMbLp2RpMgY4qFBYnbcyEHNQK7FsHGSVqrKUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608208; c=relaxed/simple;
	bh=4FCRUAOy4qGBOqPeEKjQNXGdyxQDtJohZrPEliiduGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvex1ZY4X3xHW5wg0PlmKeMaE6s2PeGQpxNJCRln2ACSpl5pW2PpfP9S2Cna68UjQg4LSUvcOcBQLPqnQpzAXirhpveGRi/4xUrinHaVRlTKNmBjTJfiL2OuUwRXDzOzvjZcvwHcJJs7v48itGSpYF7xXxWUHyg4eAFfniAeTRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vcD01ljV; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vcD01ljV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso72125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608204; cv=none;
        d=google.com; s=arc-20260327;
        b=qB8a1Fs4MR36hqe+XeEv30sVTfWMRJgZvs2zB9OAFzwUFlzDU591Q8/kCjlXWyUHio
         2slqiFDzpGxWUynC6uDoh7YdFyhSlKXfw3jTUoSlGqG8z0R+ClXAWliG82XC9vc3hADX
         tR9+EaZn5CLPc6H/uF8WIDGIxqa9eE6PI5o83xlrQYQyzO7otfjjd2x9HGZYmlfPAt98
         V7jxGMOlGTCiSqz2lwBUqdLGkZtsv4X/tMYs2WruJEBbn3c622FbkgFTa8+1dgS5jxvH
         aKF/qHmXmAsGBh98PczTEd/1zF5cyQhC/7faQf3HIkRJJM22TP1fN2Ur0IQ2+p+/xFzs
         5mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOdnKdZSsp21Wh1GtsWQOZQyXk9VHFHxURgHVJL/kIM=;
        fh=gu3W4uxJTNRy3rZ7t2lfG8NWofHILQvYNYTmKQfN2Yo=;
        b=P1CGAhVGd9ohzwBsK2SWPsDSB63eXArSkTCDXvv7J7+rDpEy2DkMOr7pNhFa91VcWJ
         hi7Qk7HZaCJJA5TIpYuWOlu1u8ujd8C6fsy0EZGpiwQDAM0I6Wpo7kOsAcIf70pbi4+e
         mEmaYJ8X7hNv73gyS2EkwHdWbnzZ2VGdljH1JfS9pOdyLwo7dbgj82Zl5GMwhjIAgz6O
         zo91eFL0383tZn4xCokvCIjRSoqR53fLeyhuzwiiN8o0uwbax0V9P/3YnjLlJihntRwi
         voEaaF1CyFSD8AqPW8OdoCpYhM3AWCZnzhOAiPalyWaDIIPCypc4sYY6EVOtsV+bHoiA
         Qohw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790608204; x=1791213004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOdnKdZSsp21Wh1GtsWQOZQyXk9VHFHxURgHVJL/kIM=;
        b=vcD01ljVTnzDGl70Y8e0CSiQ9y0wIOrAootNzIkwEEMcYlvk+3+R4y+g1KLvafXUt2
         vTllTS31s3X/OvCoVmTGKUCiRBonRh2dnjj192BacWrPq+L+FMbGfO7vCgDvix7PSb6G
         jdu2A5QvD9cUiUSVeT254vnw/dRXJdoUKU/5sMBchmwP6bzf/Inn6DtKak3Qc7pG2Faf
         yZkt3jpNdn6w4eGnTdaCnRx8bmjPTjDr9ZhLQRBm4h2e4q2+YTxj638cvrnAH8xs6VSo
         aHNeR0k21IHr78aLDbXe0V/jI0YzCdYqs6anfe1Mmat0M3HP9HEYNRzYPvQapltj+Umm
         gs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608204; x=1791213004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOdnKdZSsp21Wh1GtsWQOZQyXk9VHFHxURgHVJL/kIM=;
        b=ll6+JH9ngMaR6vlz7hxRhz84S1JzEKmIl0Zuwftkc290P2pMaY7WNPuVFUx8JagU+J
         u0n8XdqfN6ugedSZY8Fw4fyeSVZ6qtVzW8AHCHEWO4/UxVGXcAak9GRvPw4IfldjqlsC
         pGVVrtCXqngwCiYJVq+O1/48bPlSfLRAi8ChFiDdCVdGzrsQLWfyJUzoHSJuhCBoo4fJ
         TGQeRFRZXwIFJ89RfqLCibrL1eka5CiZHW//qg31faDQIPzRfFe2HGSsuKcRhswK7Qim
         qjEoQSiIZf12pGhKSjPRm3olc90EjDxsudMtDSzA/C9KLEqzXc1btFGUL4K7Sd7tZows
         gdcg==
X-Forwarded-Encrypted: i=1; AKwUvByHy1HclLsjuVtx8kRzd9wPeL2cf52LfyJWUeeSHnJSAILLNfdQQC4dBMlJyEWv/VmuTet7U6ZPh9pHu7M=@vger.kernel.org
X-Gm-Message-State: AFuF++kHWjp9AX8PyZ9fFcTge22b8JXGZ4v6ncrBrEippZhktpKw5tNc
	EFhZRM9wSa9s8roZ6sT1/gN0v1TGquTj6HxjQWPkD05hVUDXenOqgOrP1OCY7FifMLtFP05gi4p
	+AnJhSr69KjaMVXtmugmmSL/Tss4ubwHgsPy/3Ou+
X-Gm-Gg: AYBFou3d7kfbhJeqqUpr3VN8kFxK4tZEsZaiXliRf9NEuN7xD5cPETUg02lPb4qrYpT
	QSfE+Rbb+gIESxHK61EZq4vvEwJuAc+D8P0FygJhXll/1aOVisZMuMhVq6DXG4QURxXb/GAGPOw
	E2jr6XErPpqFkir3r+EXwqbpYBdB0cX8REJBPDYLzeullRu/GyzXarH23rYEWjVDuc/0tjoJ4ua
	idLEgu2JG6+j/e8tKJ3BmXnPjaJWFfhpK2l0MhsJrE7CaJYM3LTtwB3VMaGLBYtGx2pCz8E00+K
	aL2g/YKjQmZbD5u0W95doosV3DAYSvCFn/l3/YG0ZONxECAY4poD9UZGA80BNiaOEDH5wVYgO5y
	9UhK3oRdmYQ/IeF1EUClDzc7any72yurC6Szkf8q0u/7fSQ==
X-Received: by 2002:a7b:c049:0:b0:49d:21ee:1d7c with SMTP id
 5b1f17b1804b1-49ff9060be0mr2197165e9.14.1790608204011; Mon, 28 Sep 2026
 08:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926054205.28933-1-sebastian.chlad@suse.com>
In-Reply-To: <20260926054205.28933-1-sebastian.chlad@suse.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 28 Sep 2026 17:09:51 +0200
X-Gm-Features: AclHuK-UI-y0iD6O63glrzneLIs_6v53JO-jYanPzVVSviUMa6FZaP0zTiAkdhs
Message-ID: <CABdmKX27xqreLSwf0u7F=abmVNEKhMFj95WjJVQP=+QZsWH5WA@mail.gmail.com>
Subject: Re: [PATCH] selftests: memcg: Don't hang in the inotify tests without IN_DELETE_SELF
To: Sebastian Chlad <sebastianchlad@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Sebastian Chlad <sebastian.chlad@suse.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 7:42=E2=80=AFAM Sebastian Chlad
<sebastianchlad@gmail.com> wrote:

Hi,

> test_memcg_inotify_delete_file() and test_memcg_inotify_delete_dir()
> wait for IN_DELETE_SELF with a blocking read() on the inotify fd. On a
> kernel that does not send IN_DELETE_SELF for kernfs files and
> directories, the read() never returns and test_memcontrol hangs until
> it is killed by the kselftest timeout. The remaining tests do not run
> and no result is reported for the inotify tests.
>
> Wait for the first event with poll() and a timeout. If IN_DELETE_SELF
> does not arrive in time, report it and fail the test instead of
> blocking, so that test_memcontrol completes and the remaining results
> are reported.

But this polls for every read() through read_event(), not just IN_DELETE_SE=
LF.

> Assisted-by: claude-opus-5-5
> Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
> ---
>  .../selftests/cgroup/test_memcontrol.c        | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/tes=
ting/selftests/cgroup/test_memcontrol.c
> index 0ed82347044e..c00420acc9a1 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -11,6 +11,7 @@
>  #include <sys/types.h>
>  #include <unistd.h>
>  #include <sys/inotify.h>
> +#include <poll.h>
>  #include <sys/socket.h>
>  #include <sys/wait.h>
>  #include <arpa/inet.h>
> @@ -1655,10 +1656,20 @@ static int test_memcg_oom_group_score_events(cons=
t char *root)
>         return ret;
>  }
>
> +#define INOTIFY_TIMEOUT_MS 5000
> +
>  static int read_event(int inotify_fd, int expected_event, int expected_w=
d)
>  {
> +       struct pollfd pfd =3D { .fd =3D inotify_fd, .events =3D POLLIN };
>         struct inotify_event event;
>         ssize_t len =3D 0;
> +       int ret;
> +
> +       ret =3D poll(&pfd, 1, INOTIFY_TIMEOUT_MS);
> +       if (ret =3D=3D 0)
> +               return -ETIMEDOUT;

This mixes -1 with -ETIMEDOUT. The lack of consistency for error
handling is kinda weird.

> +       if (ret < 0)
> +               return -1;
>
>         len =3D read(inotify_fd, &event, sizeof(event));
>         if (len < (ssize_t)sizeof(event))
> @@ -1678,7 +1689,7 @@ static int test_memcg_inotify_delete_file(const cha=
r *root)
>  {
>         int ret =3D KSFT_FAIL;
>         char *memcg =3D NULL;
> -       int fd, wd;
> +       int fd, wd, err;
>
>         memcg =3D cg_name(root, "memcg_test_0");
>
> @@ -1701,7 +1712,11 @@ static int test_memcg_inotify_delete_file(const ch=
ar *root)
>         free(memcg);
>         memcg =3D NULL;
>
> -       if (read_event(fd, IN_DELETE_SELF, wd))
> +       err =3D read_event(fd, IN_DELETE_SELF, wd);
> +       if (err =3D=3D -ETIMEDOUT)
> +               fprintf(stderr, "no IN_DELETE_SELF event within %d ms\n",
> +                       INOTIFY_TIMEOUT_MS);
> +       if (err)
>                 goto cleanup;
>
>         if (read_event(fd, IN_IGNORED, wd))
> @@ -1723,7 +1738,7 @@ static int test_memcg_inotify_delete_dir(const char=
 *root)
>  {
>         int ret =3D KSFT_FAIL;
>         char *memcg =3D NULL;
> -       int fd, wd;
> +       int fd, wd, err;
>
>         memcg =3D cg_name(root, "memcg_test_0");
>
> @@ -1746,7 +1761,11 @@ static int test_memcg_inotify_delete_dir(const cha=
r *root)
>         free(memcg);
>         memcg =3D NULL;
>
> -       if (read_event(fd, IN_DELETE_SELF, wd))
> +       err =3D read_event(fd, IN_DELETE_SELF, wd);
> +       if (err =3D=3D -ETIMEDOUT)
> +               fprintf(stderr, "no IN_DELETE_SELF event within %d ms\n",
> +                       INOTIFY_TIMEOUT_MS);
> +       if (err)
>                 goto cleanup;
>
>         if (read_event(fd, IN_IGNORED, wd))

This IN_IGNORED case now fails silently while IN_DELETE_SELF prints a
timeout error message. What about moving the error message up into
read_event? That would address the comment about inconsistent return
values too.
