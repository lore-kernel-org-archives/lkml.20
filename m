Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD9463B61
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141185; cv=pass; b=Usq0qohJpqnxl76L54GruSWCx5u3fTGGvpycupzEWOWY2rHT9fp7rgz5zSxArZ/iQd1H15Jr2VHQy4uZSeNYH/pB4cHyPGdg+dqOyAdGgtK03UrtVoRFjd2ejurxDJK0l9WYFJ4PU5BtIIV48SJNEdCiUaC2MdKtzKvVnyrg9Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141185; c=relaxed/simple;
	bh=tX8oW19EzNSpx55rVPyv0ZfQzctQtnlywYu1+2gW2R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyUhJjY7Z7dh8UAjdPSTWRLUi022MmnLfbut8o97jYWZbBbZSEPUZ3vGUOtAvpOi6WH6RBPCww1xiPSLnafXdzSYsx5oyfYwSBfEE04w4a9KG/oM5BJCpvknf85OqbAwYyentOPRRvw7zWSN002nLqsKixHFS72eBqVxOFS7m4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AqD6hVh5; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AqD6hVh5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so5643a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141181; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9aMHeCc9E0pQiDhAweuD4FGlH6J80SQg72DhGe0FEA5s4SShBREPKCTG93xBwmQfC
         U72rHb2UmLo0HPPZxH+MmubsKLc+2bwuWGl1BRuu3vqLAnwDDXmJoW777dOCj9C+Ss4I
         HCl5yDbllPqbGa4P3fqBZhCjNqJBzzFpweC0GYqsxuGFVYj12Rf4lAJiIf5Ngnxgcz7P
         WyXywz3qbrn4o5CTp35wNguRZzHnTCgkG8ZnHaSCtb95lODtkKqL/c/ylHwyGAnwRMFV
         aqMziycaT6iFcK/YrdqPNWo/wZMxyXDk0YP/h+EmHZTHQsNwesrkX0FrlCZv0NNgiKKs
         kTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZlGH4yy9O7O0nf1ZYvJL4ZoQnTfHAsB9O8BKxrx/Xs=;
        fh=BF0SSbNuFOsBhCN0YBPvNYEbOD3ZzkCTEVNLXjQO2aM=;
        b=LiFRnpDhwrDLNVdPYdhjvijvhCLsiPXPGpC7T4EBXb5Me4OKk4uGwrrEPpr/E3KX8L
         af7yMXfnmo38sTbWA8wBDTfwHizNOqyFBKnzulMhCdolDs/2ch+vb/RLTrp3aVYEFAFO
         eug+kIP3yp1oD6WowYMfNWtr2cl562ZQrqGjgkxSawfV2YOj78eEIDvgo2x9nNbJ9yvV
         XLBMvGmJMvyhDhG1TFoYN44NDyGS8PGu7QLrIu4gnNinWgNO1JztibBjhual4g5+fU3e
         YfZbWWqwY5AG7z5BEgvupfByhBjf0iSO1WqBPm4GMnQx5TUudtDaensMxYNhiepFChZy
         TSPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792141181; x=1792745981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZlGH4yy9O7O0nf1ZYvJL4ZoQnTfHAsB9O8BKxrx/Xs=;
        b=AqD6hVh5Z8fsmeU9NWVsCuw0LvJ4423W89OeuInlBsI6XDsT6K//yzPoLT5m8HbJfh
         offi0z3iCY9M7g/YE/QZ9uSCmbzN/yB+j6kHHYXPfPp+gJEco49tuFOYQRD4fdtKnpia
         OJ29jEM9LUnCBAIFRwV7Qo61yGxZ2XbCNVCXvePMbQJ7OokiX56LnTyj8TfZodb9e+6J
         2yNoBfR8ijIVY3SfKdln8IF4BCMScMOLgLasTQA/ZEXk5YH0Whv2WLcn8YNZmtAyfn9Y
         9l4vI4wlmM7f4Mn+lyI8VxxB6fqJfSro1+mLMppkUBm1AXdtxhZk3QCRy0luHD36UGzj
         h3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141181; x=1792745981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZlGH4yy9O7O0nf1ZYvJL4ZoQnTfHAsB9O8BKxrx/Xs=;
        b=NjuWHM0kio10V7RxXA3Enl4eKMr1WqdagVBsulszDvvNMjsBP8khlRNIQx3pP7fOCm
         5YQ/zKosyEFUuyEQfpvjbekWXz2SSuV6wCrTLDxlpl/wlf5kgt+EZmk8DdgwnTdMHIw7
         WJOx+Dlus08gNWG2av3S7wzfpD+6XhrMGjSZrWIyYIk6v3Ak7AvfvUeYNj3mcgGv4XcK
         W4U6dYNfL9hVlnXC6K9+HXhOO9o/e+bjA24WBhhxaGqfWMWDoBOOkfj6KpYqh+rJWzgK
         t77BoaKGRLIsUJTPGJjAQ19uyJcocUwtrQS/WeuWCY6fYftZj0gC8afaI1hPp3D59wcs
         UXfA==
X-Forwarded-Encrypted: i=1; AKwUvBwELhxl1NStCv60RuZ1NUOeNJ3Oo/XdD+Iil+7DHmXsSM8kAY4oQ0DwLGoizhIqsLChV/nwrm9QTy9iRCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOhakKJi1ghXpTrpc1zuHRkFNA5HzELfFtUSFon+KalLkn5V+4
	ZFqYpuXbE8UkiddIHvazP4c5BpSXE5j16FknZnuvjxLbbUxP4AVUOwQnA6L3oQk0gQiNDgfFwkY
	qhg/xo23UyYYSWo+Sy9kkd2qRyuDqZ5/5uE8u5uSf
X-Gm-Gg: AYBFou1eeRtXtSpoX8ePyywmzW1Vj7LlbKR7YF/06FceZH5WXKj+IkXn9sEfICE+Qwq
	cZPH8u5fQ5fV7GZPGZOr268pWOnDvO/52eykoTQ0xRlaLqv/SLVrhoTYTTrK+QCUVW1esj684/n
	IhA3diiuuY7AbvIcVpwupOI473EwTRpqJXeuyLX/B7EmNS4tFGVtMFV0N/GIdGNZEFFsg9KRWnG
	LKj97xn4RxJ5gZxvVyyQm++uV01BcSuGvSyKIhYbINCBvKjSAR2UuwClZTvHiz8bNPd3XoBE3Ac
	jkoJY3MWWCHmcgjKd2tPjI+zJaKitH0NN7uWKhmcDar10J+/dFS2CEkYqMAxGaRGNRHDnplQGzT
	J5sJ5ZdomSc+FfpQ7wKOUWYbp
X-Received: by 2002:aa7:d7c8:0:b0:6a9:d188:2374 with SMTP id
 4fb4d7f45d1cf-6b38c3c7baamr30067a12.1.1792141180097; Fri, 16 Oct 2026
 01:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-3-tavip@google.com>
 <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com>
 <CAL4WiiozXgApewA6WWQA--YxaweezQASpiOiiLz7=ijrqbkqgQ@mail.gmail.com> <CAL4WiioJjvno8r7YeLCTf00q9L5w+OOGLbGz-t330R=NZ8ATkQ@mail.gmail.com>
In-Reply-To: <CAL4WiioJjvno8r7YeLCTf00q9L5w+OOGLbGz-t330R=NZ8ATkQ@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Fri, 16 Oct 2026 01:59:27 -0700
X-Gm-Features: AclHuK8hZWfSCQBFUZf2062w8cM86knegB4R5UxwwsJOxtJtgSEQ4r1q2T_WaWU
Message-ID: <CAGWr4cTPTqYvfKg_e7kTgg_ioav+v2AWTre5aQqzkm7tvfS1sA@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Eric Dumazet <edumazet@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 1:23=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le ven. 16 oct. 2026 =C3=A0 10:22, Eric Dumazet <edumazet@kernel.org> a =
=C3=A9crit :
> >
> > Le ven. 16 oct. 2026 =C3=A0 09:54, Kuniyuki Iwashima <kuniyu@google.com=
> a =C3=A9crit :
> > >
> > > On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@goog=
le.com> wrote:
> > > >
> > > > Add a packetdrill test that drives sk->sk_forward_alloc negative vi=
a
> > > > tcp_collapse() on the receive queue while sk->sk_wmem_queued exceed=
s
> > > > sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking wri=
te()
> > > > under TCP memory pressure fails with EAGAIN rather than returning a
> > > > negative copy length from tcp_wmem_schedule() and failing with EFAU=
LT.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > >
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > >
> > > Thanks !
> >
> > Are you sure this test is passing on arches with 6K pages (as some
> > arm64 and ppc64 platforms) ?
>
> This was meant to read : 64K pages.
>
> > We might need to add a check to only run it on 4K platforms.

Ah, yes it would not pass. Thanks! I plan to add a check like the one
below in v2:

diff --git a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
index 0a97d5ae34699..e2a418357bf1c 100755
--- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
+++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
@@ -52,6 +52,12 @@ if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
  failfunc=3Dktap_test_xfail
 fi

+pagesize=3D$(grep -E '^--define=3DREQUIRES_PAGESIZE=3D' $script | cut -d
'=3D' -f 3 | tr -d '"')
+if [[ -n "$pagesize" && "$(getconf PAGESIZE)" !=3D "$pagesize" ]]; then
+ ktap_skip_all "requires ${pagesize}B PAGE_SIZE"
+ exit "$KSFT_SKIP"
+fi
+
 ip_versions=3D$(grep -E '^--ip_version=3D' $script | cut -d '=3D' -f 2)
 if [[ -z $ip_versions ]]; then
  ip_versions=3D"ipv4 ipv6 ipv4-mapped-ipv6"
diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_nega=
tive_fwd_alloc.pkt
b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_al=
loc.pkt
index 8e31db546f432..5e6a40e740b42 100644
--- a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fw=
d_alloc.pkt
+++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fw=
d_alloc.pkt
@@ -3,6 +3,7 @@
 // when sk_wmem_schedule() fails under memory pressure and
 // sk->sk_wmem_queued >=3D sysctl_tcp_wmem[0], returning EAGAIN rather
than EFAULT.

+--define=3DREQUIRES_PAGESIZE=3D"4096"
 --mtu=3D65535
 --tolerance_usecs=3D100000
