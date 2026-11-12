Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794444063;
	b=RKWcWY/3lY1OEwO5EPAsvcOgsn6/1ZaWem5ntAe55DdaCkKR1roigOP4gRvPeOcOB2KD
	 gCLcu0vaGbyB2Onmo1kFP9wstxDkkBQX5jbmU6LoVmaoeo6q2WjMxybG09M5IeGEjTOYX
	 PE1rrdoViQVlmQA0AWpn6wC4gcoVfykVutUSkGeZW1NOsVA7PCXXDaXG05vDpr7ta2cWR
	 c/iV+L/0bbYL41nkUGW0cdSI64xHaVHmimsyXZdaeipg3lCFF/3lVxqeaKZ4w8PiyliBx
	 HbW0KM0+IPiiKIiC/dwA2ZpQ8J5lecPOV4LCfAOTGYKhCuyOPr+B3U7QiWjMyXgIpDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aBfI4LwPIWDn397IEmYVFCKsIdTFBg5r1P35GnfG2Gg=;
	b=zG5N45oARnTzoApBwGbk6vOv27HjIstmvVeTMtcmDGwa8N1K8p/q2Q2Q3TE/+Rcu4UB4
	 CXJH/gcdrLh/BLT+O5CEN/9V5F+AM2WqeaZo4IS0Bvy8WEq7aA/5g/9F7FJwchbGhgoQe
	 snSZ3r0DZ6OguLq3JWT+GOxjS/NB9EHrALtUP4VWnmYdEJ5R3cRhDIu03Nn9enADBKqO3
	 1E7ud/5Q87Hq4D6uCNTCxykcyysNhoGx+KtY/8ZMrwuMl08IoYxOYu31unVJ2QKPivWF9
	 /cnvCwfZRYlzBQfIDYB8xzgmxy2Zol/WCkKNTJ9DMD5scYOkKaMmGysum6HqSGp3czg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eSFNQh9m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB0606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FB0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eSFNQh9m
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5383c97c8cfso43081cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794444060; cv=none;
        d=google.com; s=arc-20260327;
        b=dXtaVSYAVrMy13AXJSO8jeyAM84lNzpG5C0vJ1UCZ6L7j8eDfbtFx1+RiCJ44g23Nk
         LBQN53GXUYzny+ibFgahtK+kWSwfjlZR7Psiyt0BnK24lCuVjlBsbz4wCaMOLvLxPewu
         DPbXu/F+oPFH+IkM7AYIEpUWABLCIzvmR8eL/iQuwTRn+Lyfk+CQvmvGfMcCbmcUi4u6
         tq7WWjpdT1S/QocZNKTc+HTXTXrWYWYSHs441hBAv1SFqVMi5QfyDusfcOeIlxbtwk+O
         r7tL21VZgtwZHLSs3OUS5hWjeX60wy4uMU9wMEiNneD+AwQGXQvgFGJUv6gUr5QZ+6Un
         8msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aBfI4LwPIWDn397IEmYVFCKsIdTFBg5r1P35GnfG2Gg=;
        fh=wceYQ7Nayzmd3NDXBPxAMAPczBU0rsmJ6/mN3uD+B/w=;
        b=EUmfnfn8vNIMypuNrlmnEnlBONhZHbMI+NuRukpB3mVojwz+hdqAI/q7SX64v4UpT0
         3L7dCLNMknWN5c0Tx5ZlSRM9BHaZeQURUDaHyJmIoGEl30a6J/VfqF4kEX4hxS5Qh4uZ
         qg/FqK5QX4uEisMtnHRKQpsFaWnWcfeBKbSx+hICu2hw8QSQ35SOGa7b10s+nnF8PjR7
         vSDnZdHwe/KKcoBrITMrTTqfQa/MLPAKRGN08MieUCVAwvcfIWqBIh3qV18VJrsp6g41
         KXcRKw/4T0Zimi4MhBK9zmQj4GqFOG48ki4Dq7yaQg8qqpj6+VVn8hfii/VEntcAg0Qh
         uGHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794444060; x=1795048860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aBfI4LwPIWDn397IEmYVFCKsIdTFBg5r1P35GnfG2Gg=;
        b=eSFNQh9moOqcJyQ9dG77dKNM/iMvsPT+P9rDh0lpuY482Xiy2zDEUkuM/csCcBcLOJ
         pQWEP1bX/gWqN1mw1iwZ0PEqe1eFVU/Vk0tRh7eDTy9JrPaDuAGjfYLbjgp1Xe2NLpmG
         O0NM6tuNdspLDBewmlic3iPNH8+VTmkFzg8Sj786Xd+ba7QSX2w6W0Pw2qGEDQK5KcB0
         DRjGKAyTNkq5anfpNzZCqZPPdsTTjngUOiFaHk3Imre56Im7B7yYC7aiVva48MVrkhG0
         dj7+0I5w1pO8YrICaWvBoTA0+HTqCn3O1KV4TIyIZN+zPVb2fxNp1ifQJpouN6uvn7H0
         oTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444060; x=1795048860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBfI4LwPIWDn397IEmYVFCKsIdTFBg5r1P35GnfG2Gg=;
        b=MH8OlLS+Dn9IxhVqbC9qRwiA3d5t0fDLT0GrLy5IV8IyieQNEPspOIpisec1dK0zzb
         VZsefJALss8BxWdqPOzj5snzuOXnXGVk6SSApW4rlivVKVgSnZRkgJ69ozzD5ttUtnAs
         akXb/30lxGDboT4HFSP3ybl5ZNw8rF0JI9WGKkhjV0qFrE7SjAXpX4D1gYQL7yIXw5HW
         NmlF0eqzm5p2EuZIcebtA9FYx7UpTe+GkVWHMoUWwgGaX2spOJlJMNq4nl/MNG8E8RLz
         sO0yg6uJP2+9uG7/r+yDKYMrqD4QPz/xnVO3h4+O55UyEe1fIFef1fRUFuwIrYokiPtY
         gL3g==
X-Forwarded-Encrypted: i=1; AL+hErEdHvr8e+diTUxQXTWLaeAkwwi6yZuw/jflNtQTnlNtEoixulABkzWnjeqkGLw15KyviE4WsqMdLdPU3FU=@vger.kernel.org
X-Gm-Message-State: APuU4Z81GrMelakNlFOpPVqdmXtfVjvHEP/BPYun4abNOkRYUxF370AY
	CV4Dsc57tkck+DIRV7I4i4YtVKa67Yz7ijjuaptmOED60fd/6e6FH7aRaGeEdMR3GhWmRLnzIAm
	W3WqPwJn0XI715bALoq2HpCLdezshcxQSX8uDiZYT
X-Gm-Gg: AYBFou1YTrz2nWMcUhNRqsBwNPQu0Xxn7sgkiNViaPwOwWC2uKQr//si1ivWfcpIZnm
	cn+jz75NM+ZtWJTwdEjVry3ZY5RQzXppWwc1ovcKplhT+65TR3TevcL6kf/fyRBcuGib8KDqXeY
	wefGx3kI7vI7TJTHhKr/fFKMgNxuqSoseic69wH1AqFQxns5+pC5UV+rxBF29QjZnqYYed1uLsu
	ptsiOuTBLxhhryWbyW1aHPG4eoUmaMC875fpSl6fEKy7XA+HdXCDYuEk9MAlewCI2GLNejWja7V
	V7KKyjCwoqNPbhnAbjnAnKF+TeX8gPP7POwTTuGyJ5dp/NY0Q/6A4u9GqwmKl8qsDHiLIrNSGAZ
	jeLJHGmMkk/IWFYXU75DtHh65QT8ihJYvZYJ4
X-Received: by 2002:a05:622a:2b4b:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-55990ce917bmr5521181cf.13.1794444059678; Wed, 11 Nov 2026
 16:40:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111192328.3917311-1-namhyung@kernel.org>
In-Reply-To: <20261111192328.3917311-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 11 Nov 2026 16:40:48 -0800
X-Gm-Features: AclHuK_uaJBzba-msIabZxmfmAl0HhXVr27IHwWIve-ZoogqoqSz5W0jWx8eCU4
Message-ID: <CAP-5=fUDtatm5Ah4gzw7xHbvLysFEX=B7g-ix9jqufQDQGiD5g@mail.gmail.com>
Subject: Re: [PATCH] perf record: Do not fail with an exiting thread
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:23=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> When a thread in the target process exits during the synthesize, it
> can fail due to the missing /proc entry.  So __perf_event__synthesize_
> thread() ignores the return value of __event__synthesize_thread().
>
> Do the same in the perf_event__synthesize_thread_map() too.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/synthetic-events.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthet=
ic-events.c
> index b9dbd105cdc37f38..3c8d29f27fd91a2c 100644
> --- a/tools/perf/util/synthetic-events.c
> +++ b/tools/perf/util/synthetic-events.c
> @@ -991,6 +991,7 @@ int perf_event__synthesize_thread_map(const struct pe=
rf_tool *tool,
>         union perf_event *comm_event, *mmap_event, *fork_event;
>         union perf_event *namespaces_event;
>         int err =3D -1, thread, j;
> +       int synthesized =3D 0;
>
>         comm_event =3D malloc(sizeof(comm_event->comm) + machine->id_hdr_=
size);
>         if (comm_event =3D=3D NULL)
> @@ -1010,16 +1011,19 @@ int perf_event__synthesize_thread_map(const struc=
t perf_tool *tool,
>         if (namespaces_event =3D=3D NULL)
>                 goto out_free_fork;
>
> -       err =3D 0;
>         for (thread =3D 0; thread < threads->nr; ++thread) {
> +               /*
> +                * We may race with exiting thread, so don't stop just be=
cause
> +                * one thread couldn't be synthesized.
> +                */
>                 if (__event__synthesize_thread(comm_event, mmap_event,
>                                                fork_event, namespaces_eve=
nt,
>                                                perf_thread_map__pid(threa=
ds, thread), 0,
>                                                process, tool, machine,
> -                                              needs_mmap, mmap_data)) {
> -                       err =3D -1;
> -                       break;
> -               }
> +                                              needs_mmap, mmap_data))
> +                       continue;
> +
> +               synthesized++;
>
>                 /*
>                  * comm.pid is set to thread group id by
> @@ -1037,17 +1041,19 @@ int perf_event__synthesize_thread_map(const struc=
t perf_tool *tool,
>                         }
>
>                         /* if not, generate events for it */
> -                       if (need_leader &&
> -                           __event__synthesize_thread(comm_event, mmap_e=
vent,
> +                       if (need_leader) {
> +                               __event__synthesize_thread(comm_event, mm=
ap_event,
>                                                        fork_event, namesp=
aces_event,
>                                                        comm_event->comm.p=
id, 0,
>                                                        process, tool, mac=
hine,
> -                                                      needs_mmap, mmap_d=
ata)) {
> -                               err =3D -1;
> -                               break;
> +                                                      needs_mmap, mmap_d=
ata);
>                         }
>                 }
>         }
> +
> +       if (synthesized)
> +               err =3D 0;
> +
>         free(namespaces_event);
>  out_free_fork:
>         free(fork_event);
> --
> 2.56.0.567.gdb80ae8cd5-goog
>
