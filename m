Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE694D37B1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968152; cv=none; b=cRfzug2o0iPvFIxdmOJFBB7ED8LntTWSDAWE7dw9OYlNMrJV+JGDhlG0Fpa7RWJ/7y6m3fBvQUrTv5PkANHvD0j5xlyIq6I+4Y5TnIq8vtP4V3RPDEUK0a7c0dNzLGuEBOrcKg8UauMZPAY4bqD774PZy57E+LrEPc5FYcps0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968152; c=relaxed/simple;
	bh=lm+iu5n5093iTPvAm4b/0xhVRpxk5O455f+QlfZJK5A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=lJSImzSvdWsNqjPIIKl1gCFTSW3kgC2jMNgadQtJlD/iC4bS8AexsHDHtOYOXCkiIxDavmaILBGAW8I6uYCxwE2b8IBt6Akk1fCmEPKGcxuR3HuPniw6F0wtf5MITDNdO+ScNjJzNNU4k9zAKMdrlvOZUX6MuHZOeFeLiCtGdLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lYtlYW6n; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lYtlYW6n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E1DDC63440;
	Wed, 14 Oct 2026 08:56:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74C7C60368;
	Wed, 14 Oct 2026 08:55:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B33A2103286A7;
	Wed, 14 Oct 2026 10:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791968145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fr2cUfVwHpS0gQAAl2BplVTlMggZNGW5Syq9UOyYYuE=;
	b=lYtlYW6nORzpeaJOtJht7lLWf43BPtnqtMLzsgVNyfMHTq9m+bIgkUzR6OZeiBVEA8KlxQ
	LiL2EIB/WOTrDWmeU7IYhX8RpwMZnd+ZhjTBG4SJFWBV7porEQiBKbh96pTI/ab8J+5a45
	Gnl9A3I7/SZGYV52CFkwdIUG3HV1eAQFL5ZEDquFaDGmdPh5diiwGnnoK2zoQGewvbOVMj
	KoaKHp5F1xijoWOX0grGfWVojZ0yspqKBSJZVxN35qF9uDXKnzmlZR8GuRFBKsZUATdrlN
	5jxYvnVESKhByR9tzm+w+qGICFxLveCsGd+xVFqpFzppzoXO6dvjIgUn9sMXTQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 10:55:40 +0200
Message-Id: <DM4FOVA9PW2E.1WIY5HRJWA1QP@bootlin.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Run tc_edt serially
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
In-Reply-To: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Qiliang,

On Fri Oct 9, 2026 at 3:50 AM CEST, Qiliang Yuan wrote:
> tc_edt shapes the traffic of a TCP connection between two netns to
> 5Mbps with a BPF program, and checks that the rate it measures from the
> userspace sender and receiver is within 2% of the target.
>
> The measured time includes the time the sender and the receiver take to
> run. When test_progs runs other tests in parallel, the sender and the
> receiver compete with those for the CPUs, the transfer takes longer,
> and the measured rate falls outside of the 2% margin.
>
> Make tc_edt a serial test.
>
> Fixes: b0f82e7ab6fb ("selftests/bpf: integrate test_tc_edt into test_prog=
s")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

I don't know how to feel about the proposed fix. As a test involving
bandwith measurement, I get that such things could happen, but:
- I did not see this failure in the recent CI runs (but I could have
  missed it)
- if you see it in your setup, how sure are we that it is due to high
  CPU usage ? I guess it is very likely, but worth asking
- any idea about how much we are missing the 2% margin ? If this is only
  by a little, I would rather increase the margin and keep the tests
  parallel, there's not much point being too restrictive on the target
  bandwith, if we get something close enough, this is a good proof that
  the BPF rate limiter is triggered and running correctly

Thanks,

Alexis
> ---
>  tools/testing/selftests/bpf/prog_tests/test_tc_edt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c b/tools=
/testing/selftests/bpf/prog_tests/test_tc_edt.c
> index 462512fb191f1..1e82d88c987a7 100644
> --- a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
> +++ b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
> @@ -127,7 +127,7 @@ static void run_test(void)
>  		  "rate error is lower than threshold");
>  }
> =20
> -void test_tc_edt(void)
> +void serial_test_tc_edt(void)
>  {
>  	struct test_tc_edt *skel;
> =20
>
> ---
> base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
> change-id: 20261009-selftests-bpf-tc-edt-serial-9c65af71f845
>
> Best regards,





--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

