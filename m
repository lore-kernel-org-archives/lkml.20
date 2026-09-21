Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB8349CFC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026248; cv=pass; b=qxTWJNHegbDeJVVCmrHx6TE+f0azqE2RibL5QJEyHBzBSGAkfiKeBgmGqCuFrVXJKLryweMGUDTEIU6aJAHrr3wAIbcd40lXo5sZh9mPnpjvFa1YWjFkJ5Kvzj/JamTH9o4UHAirYMOu2qVg1mRsmCGWGrKYwC9OoPs0wrnTXgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026248; c=relaxed/simple;
	bh=iaXTPIKH2D73T2js8KZyUAj+YswgCyg2dK6ubYpwlXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG1zoWVaO6goZU2hH67eqiZKzOBSHoI2j33W6XnwX1SJSwWUqVd/IvLx0Z0AJS/sWbTEZUEub3lgZvYch+YXPMToIuls9r/7r7FTmzEsWsuUvCBph/fLW5mt78y5fYFeU86LkwVmM04yDTjJzH+8TR5Ea2e83nflXoBnWS126No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h43xxRko; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h43xxRko"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso4073675a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790026246; cv=none;
        d=google.com; s=arc-20260327;
        b=Le4is1GCSMg7BV+10qrIhvQ57dOWqheh/knXDfiopLBrvRdPgXhzEFDQaoJ3nSGA+P
         kpp6YoLDSVBhgFc+tglbP3itnLkR6g4uhFpQB3FiO7bwhybnF3QBhkqsmDxUjdH2ElOd
         QR9q9nCnAZiz1dwaoT6fDU9PbNi/HkbUDrvGPUGAH4+aHuVjb5+5B7l5j6lnSY4K/AEp
         ziYtDddakjC4U6U1N6igNOVsTkRTDYY/JvJkCCuBL7u0l7jscW8krZAyrwii2JV3g8hI
         ToiWkA0WlTlsjs1Ud9fj2tzZq5brNxAVBqKDuElZctMAjp23QUsQYEtZsOrmIM8tgotm
         6sTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UCNksm1oqsm+FKq1Whp9B5kNMlJu9ggUGVJnCzUXOA=;
        fh=QJRpy3TU91kQVVXMzwDyPjUGF0oJaXHL4wQARdbYZXw=;
        b=jfmq/I3BlmKkKyY0Ut0xyVkIWA/xYVqME+5e8An6lzaHF1TTFYQ4X3AL+z3jJjEolj
         czuUYCrCojXvmsHWl+2jtqmNiVpRVbguIGVpWg2mlgs9stJ9KNi59vkc52dG66XGw1+v
         wn63zlDvBKRLxEypNHJjKkDrpIo3v55WoYegQcJLeW0ITaVMvkPaECZ6+2XaLgxka2wK
         2KpTeNUzY0+/smeGaHM2TuTYmMTdr/kIcb5bxmG6G81fUK0np/SMRZ+3kNIBajuTcN3O
         PX21p8UNJ0OjB8AdcB1pOWQbf52G7JfknRUU0WT/uD4wDsCIIyyM3ERH1PQ3ikkjdnd1
         cjng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026246; x=1790631046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5UCNksm1oqsm+FKq1Whp9B5kNMlJu9ggUGVJnCzUXOA=;
        b=h43xxRkoWLubh3RXwVX8mcEXOYU2R7xBch6BiQsiMRaHVGS6J5kASrBJyTJ2O8vpQ+
         nT6Ai0akiRXwpez0og2+rzN5NsVysjgWLxQ11bPqnrD284FWpFj+UUgiiEVjtpgvlEIA
         44TBwmEXnENuLUUZ+6d09GKrHPBAyiDa9P/KS2On7EESxcJrglVhGejHJQsFpM+DcC9g
         8/SxKWNmul8XUufXhak6r++ulagL0+2Qez+ZT4qqG7rGau0Sae036hj5cvWpr+Mo1Ev2
         4Dl8GUQIw8IhMl3wAidhGCnzyC8eCcy3zn+8CQjbZV5julGyWAqQXp4jusFEEO9hJ3gs
         7/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026246; x=1790631046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UCNksm1oqsm+FKq1Whp9B5kNMlJu9ggUGVJnCzUXOA=;
        b=ckX/4KjRDrCTXVPDkVyq5xTJyBa6Yitk6HuFv4K/gEPGcu7FPiCBeUr0tIZmPPJNov
         c3m8W8u69W0ZRFcJlu+gqK+HHD1N7zKpNIbbKJAOyJdNJKZuWhP0umpjRV+B9RO7LwXo
         fPZVDoxoxF/Ynt1RDwVIWJI9rDT6EIyuffDwAZlvIM9Ph9UGDVZDLWcQvxRw+8VzS9Sm
         gJy5aAsstLa/S5uhIHTgLGKfFKZx3vAC+zryKdE208W3A1we+JmySzyQJC4ecTFbo2+3
         V7gWAtv/uqOmrtb/Qsmt3NnLbeSzbXFmlzu4gHgWfIzLjH5c5SzwWjDpzpjJ/cEXoE5a
         Ln6A==
X-Forwarded-Encrypted: i=1; AKwUvBzPNbNLEsHyjCH5EKv+jiQ5Ml7f0vW+9Ygoy8Id8KYQNd7VlMiEdiRKkdoirc8b2ykIuEuuOAo1KP8y66U=@vger.kernel.org
X-Gm-Message-State: AFuF++nMUiaUYHx+PPuOCsPtxxJGl/gJsQWRFqskfAEjHArMeX5p0wKD
	J2qQN3Y4u1m6+PhmB7udkNsjqIijQhh+t2q6RnHXZ5081HlNLqbLAv2PVS8otRRlie71uakRsBN
	/XhG4CNcQZHdY8BfZ2z3jA3uY/YTiaTM=
X-Gm-Gg: AYBFou232vEWIsF4dVbMs1wWD0W8o7pbYueSLdq33CJvIv7O83eYip9wGtEmpY8lMdr
	gxBl6RxRJvkio7dc/aL5T1WHu2CYQGWNYbdQiotGkHS2YJx4KZcDfVOs5udRr3FkY19phEf6v3b
	LnILXbAS7//+IvrqmD1UuMS1y7CALIcomPonCE6vItNo7iF9cj0nC10XS+cGUmdorwf0KpD7BRO
	e1uHk5CqXvCYzojVjqyxw7fpusJQp33u8PwCqcJo27h3kIeQ3c6HXaHLovSKlRYp3s7e0P6oo1k
	0pOpRJmkLweubBBdT3sr13pNdhmua+HY7OcMB9LB7Zu6GY5A4n1oGp/ouZcZxtCzGJQjImqk4Xl
	5dypXT3ek6pZ1GT6WpZOQTocIv5Mu+cItxG8e311t6FFRMBmEIiTQ
X-Received: by 2002:a17:90b:2709:b0:39e:6c69:9b8e with SMTP id
 98e67ed59e1d1-39e6c69b257mr10967181a91.51.1790026246328; Mon, 21 Sep 2026
 14:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918040919.3402577-1-tweek@google.com>
In-Reply-To: <20260918040919.3402577-1-tweek@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 21 Sep 2026 14:30:32 -0700
X-Gm-Features: AcwNN1UBLDNvhaONZR6woeBhYnn7wMW04jRG5L5QnSQolx_VpN1cA7taae-yCUA
Message-ID: <CAEf4BzaeKXEC-gBbxo36wdAGwwZxqkL6pV=oo0dke4S2BmuRmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] bpftool: Skip non-autoload programs when
 generating light skeletons
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:09=E2=80=AFPM Thi=C3=A9baud Weksteen <tweek@googl=
e.com> wrote:
>
> When generating a light skeleton (bpftool gen skeleton -L),
> bpf_object__load() skips loading programs marked as non-autoload (e.g.
> SEC("?...")), so the generated loader program only records and populates
> file descriptors for autoloaded programs.
>
> Previously, bpftool emitted struct bpf_prog_desc fields, link fields,
> and attach/detach/destroy functions for all programs in the BPF object,
> causing the loader program to store subsequent program FDs into
> incorrect skeleton struct fields when non-autoload programs were
> present.
>
> Furthermore, bpf_object__load() can update a program's autoload status
> during preparation (e.g. for struct_ops programs when resolving kernel
> BTF members or adjusting autoload based on map autocreate settings).
> Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace()
> into do_skeleton() before counting programs and emitting struct fields so
> that struct field declarations and attach/detach/destroy functions all
> observe the final post-load autoload state.
>
> Skip programs with !bpf_program__autoload(prog) when counting programs
> and generating progs/links struct fields as well as attach, detach, and
> destroy functions for light skeletons.

This seems like error prone behavior to me. Wouldn't it be better to
hard fail if the BPF object has non-autoloaded BPF programs instead,
as clearly it's not meant to be used with a light skeleton that
doesn't support such programs? So why not emit a meaningful error and
exit?

Or I don't know, let's teach light skeleton how to support
non-loadable programs maybe, not sure what that would take, but worth
considering to bridge the gap?


pw-bot: cr

>
> Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" =
and "gen skeleton" command.")
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> ---
> v2 -> v3:
>   - Move comment from gen_trace() to do_skeleton()
>   - Add comment to do_skeleton() why the loader is called early
> v1 -> v2:
>   - Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace=
()
>
>  .../bpf/bpftool/Documentation/bpftool-gen.rst |  4 +-
>  tools/bpf/bpftool/gen.c                       | 76 ++++++++++++-------
>  2 files changed, 52 insertions(+), 28 deletions(-)
>

[...]
