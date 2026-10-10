Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D403EC82B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634613; cv=pass; b=Vj8iD+2Og7wbivCs63SUhMxQSPCut4w7qTUworWPW8POF9gjdAHJ9KDKIg4lrOT6b+ZKMYFVXDyTCKIX9httyASKYZtVUp8JWc/IGBGOERv9o52WoP4X1uuoYA49yluzT1U1VwI6dOR2w4Uf+teDNK6uTtBfLKQsK9vlwX7lOrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634613; c=relaxed/simple;
	bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZz5D/+NAUiInwtYm0VpF14urKMc7/+lUiPHqmC2d/8vIrbqe2/45LusvzZJvfk/lFQB/ZMtPTkoM0ejT2Oj6qj0kZqJH/97qrXqIQvzhOyKg5z0+rMF+qSstunooQTO2IyZxbdSgXk5j66g0TT4L9+YRoVKb+xQtwyqmYoP9EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLzotch2; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLzotch2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a026611b2cso8275e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791634610; cv=none;
        d=google.com; s=arc-20260327;
        b=UWifPmG7bto3FQSir+C0/2499rLOcX/5/WgF5b3R9qt5I0VJWBAT9r9FcfsjZpvHzD
         N0s9dXfUP4ZbW/YFgwD9CzLlG5dA1zprJ+Qm0TmBqsNmtj5Cprr9zPRi4eDQb7kvzZNh
         IoDnSow3A49BLC4j6FZusZkkwbIfKpFE5qw+7uD/bs83KHQfEaRwJ6bx9yhd4meAvbd1
         uUzNNal1FRD7q0FEyq6sDH81jTmtxoJkOTy2ZDifBtTSLiQ3WrpKbDPhSgN6MrqTHZNL
         xcfH+BSEJ/TlEuADuIhOrPzJIFmscBuFF/JP0oi10U6MztU/9eHP6XCGkvkCFp7Nb+Q8
         IByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
        fh=Fd+ETls680/qvAM8pmvaVT4+LlUxEGJ9D4VKNGolIsM=;
        b=W+Z57UfxyUTTns7nViDO2j+q9JsqA+TsjT+7I8sS07KSXJUrAJG1i1kvtuqgvrE0no
         zWDe3jlNx5pkI2ZYd9mevfiqeFAcwN396+AxtPzG7d4RmvFwCg719Ey3qyYCIVaeLZXN
         hSgufRN4WV0tpJgn0qXQbm3/9pNlQZ+uP3mPr+VRLogMC0hSpJfdkAv1FlCse+4blPZG
         Tcixr6jhrOR1DlIPo7xmLEk1YO4VbYZjWJZYs0R9OPo45ymJTpDYLnQQFA9PaUmSS0k4
         M5jURBhogfiIi+RfSOGGR9jaCBnBK87xSwGN4t77D9o3wZgUWTF5Ua4aMVQlZ45cT5w8
         mK6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791634610; x=1792239410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
        b=SLzotch267cSplIFK/3jOGd2uYZhN2LkMIowWcOp2gwgO8AfsKn45zcr0lLMYeW+NH
         /XcTIARa8COLG6FrUJIn5H5ZynRIoKUPPcOejFhIJCM3pb6LNaMKoFPDBwtPNaDDEhLV
         4yHDHF4wXgQmZtp+g0avsyh6UmpteQxwzs9je44ybM2qydvCFEPGgT6P7LMA2+6FD2vd
         83vJXIJZ5PdSwJB1NtvOy3vqts1q9HskoOq0XJDLhJHYTzqcCbQjAyMfBP3O/ahEJDw/
         t58CusoJuXmpGU8sMqK3wDIqFOJdg7OHbWQYIWKJ8sPqw/a/7LcRYIHejnp587v7Kb48
         lddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634610; x=1792239410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
        b=yqwd5se2i2Uob5S9dRzxzUlJBd76HNwhO9MkCOz3xK/NhelwdN6tkbQYYI98EqOKTX
         sJRyhr5a7DUeI7CooF1xHDvT895/diYOtY+1e5RZyjUDeeD9L7iTXUBlKInhVByta2+y
         8USyDAPp+XFnumuKSYfvbfgUub9PmeOMNPGracfmqub6A1jGr/BTYzbzNeitzPp80zzr
         3st1+3331kBFDO+bIP+6IM5f/eNbKFzW9NIZmHSd8j/RHDZVCNwDYaY2ehjXJ+gqaMSg
         qW3YSruFqKgvq0uCr0VDoN7M4W8GBL3aKxzRZ3lKi6nReiXqTPvlG1G0PabUH+6nLe5/
         1YkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAMrb7kfN4zxSKodkeNkGGkhsXheCsOAu94pmorZmQovE2ghBs+IVNr/acziWqvc19Dhpor7Ig9xSaQos=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8EYLrLey1YKoqv3oMCTaYOiiG268DWqBH6UQfskAqrdLyaIki
	bB5f2i1UpfdT9jEq5G6gJWt+Pm8j19PcAfj11Kc3Tz2g83ddWDxYasHPPLQO9jb1S3h6RJqMBxJ
	0stAgFMZQKfap9OB2iR3rb8+slZYtFkI4HgK1O8AK
X-Gm-Gg: AYBFou3JKUJ0AOGFSMqcyXOyNumB4gbbVu/i+Uj4MDkSXoTq4Xe2X3Fxvw0VFAB5Xbf
	GuKaRpei8fEujShxH4xZJRU0SIjPOeabFRvqhwpFSDDh0m+oUjFqK88gyAw1ItEJHsT50JRPnn8
	k4J1tkYPVjRaf7H7/9hUFGT5/beuPX43mkbdZz4hIpn49Lb3fHxFtlC25YsGHrcAIjn8FVe45Qh
	qSHHBPrvrWh0hICh+860KS/idv0PV+6k532cJbSa2ZuKa9z7F7ozoJzyG1Phv2t5/dKjSAjzYe5
	y3uDMCpADZelCwypGO6SY67dNnpw+IjKT0q7veqqfDUILhpj+TeDn+btzYWnl5Y7BIX15/zm/ha
	xdc/J5xDo4E8=
X-Received: by 2002:a05:600c:a10e:b0:4a1:80d4:55ce with SMTP id
 5b1f17b1804b1-4a195b30c84mr305755e9.4.1791634609468; Sat, 10 Oct 2026
 05:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
 <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com> <20261010025252.3716641-1-odys.yuan@gmail.com>
In-Reply-To: <20261010025252.3716641-1-odys.yuan@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sat, 10 Oct 2026 05:16:37 -0700
X-Gm-Features: AclHuK-buTBub6GSvkPbrPC0OJrukJaaCD5TTns2vZsTz9QpTX-JSgssQ-hs3Wg
Message-ID: <CABdmKX2CkaBzSqeaDHYUC594wiwjJ0edjZyGp6uSD+5GeDk_zA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the
 dmabuf_iter default test
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 7:53=E2=80=AFPM Qiliang Yuan <odys.yuan@gmail.com> w=
rote:
>
> On Fri, Oct 9, 2026 at 5:07 PM T.J. Mercier <tjmercier@google.com> wrote:
> > Hi Qiliang, are you running this locally instead of with:
> > tools/testing/selftests/bpf/vmtest.sh -- ./test_progs?
>
> Yes, I ran ./test_progs directly in a Debian testing VM, not through
> vmtest.sh. The VM runs a GNOME desktop on virtio-gpu, and gnome-shell,
> mutter-x11-frames and ibus-x11 each hold a 4 KiB udmabuf without a name
> (their fdinfo shows exp_name udmabuf and no name line). As the
> iterator walks every dma-buf in the system, default_iter fails on such
> a machine before it gets to the two buffers it created. The minimal VM
> of vmtest.sh has no such buffers, so it doesn't show up there.
>
> The subtest only checks its own two buffers, so skipping over the name
> of any other buffer seemed safer than relying on all of them having
> one.
>
> Thanks,
> Qiliang

Thanks for the explanation and the fix.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
