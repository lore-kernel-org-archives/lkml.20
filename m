Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389611;
	b=llnF4GUsblyvri5dEsntuPYOX+iBAQ3VrNij6vAW7X4rrq7NUWAfm5gCC9kEKDuX4sQ2
	 BOu4AYFjzFmTcb+TAXltr2RTV5/girsD888IpVQUdFsJcaf9ZsSfMzogsdbY1trjRW2QW
	 WKXz9EmCXFWwiaU6rdYwqw4u0S8humceNy1gdZxWjC+sPATowoGoBkyeIJAkAMJVo/OnD
	 LYNglbo7uGz2MYzVr8+plI65FYcrcEZuolZ9CMXmnmFJambFoLNBYwtAjW11Lw+j4BygM
	 AAY5O/Q7YWbByqTmS37Pv10k3k+wkjAEewG0fSoWWNiSJUwmArviSktSDQuCbkl6/tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CeYMnZ0Hs9kQNFmpvk862xE4RzZLwCSbGt+rYjnTV1M=;
	b=IPcms/EB445zK3SdVURG3w8MqpZNx3V+iO65RivACO7ofeZx2xC4vdWfBxrdBdpbsICo
	 MwuRfngX21Xnxibn2Zm7/sq/R4Wdv7AIWw3HKZBy4zV/5Eiys5aAabGWum704aF5SoVNZ
	 5oJ9MoEnOCFWvG2X3WyMfKR52Zb3hbuFE2c1OdHtoyfiwiZBuwqxuHYew/OIMg8Fcf94v
	 fob2aQlea+zKQWxXmUKDINL+p6v8zivcSPqmEOHwYK6rEqUQNnIkUkjx6+UElkb0ofq1N
	 Jxw9Lluoj0Orlfke7E2/GHOF+Wmxgy4JN/iVAaDP+k2pzhoDtJ0vbs89OsP5tX7536g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7nx3wsk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7nx3wsk
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so869329a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793389610; cv=none;
        d=google.com; s=arc-20260327;
        b=gqL6Egrp4pVhezKDtPasTijKZYCOlPTc5ERPdveBSwTJEM2k7HErWh2YvdFVHRztp1
         BPWsn4YLwptkot9US62dzr484CB68csPMs1oLl/VFISYwtD3yQU7AmMrxa/rEpgDMmtG
         OqXevBFsiJHX2XH0EwAs/4PEATuu90YOEzcBkNDjACLH0QiRi+UmPymbkP9ITQ5kHS+U
         34OESCECxpU/jL/Do61d8uGGpdd4fAFA4abWatJVzb26wC0kTezzB0GlpHxUCR/bA1jZ
         n3tYNCdypG3sNmkzS0kPrNnWa5fGvLQwa16uSLxTcVjoJgj9ZVMah64Xyh77NeI/aQFA
         rhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeYMnZ0Hs9kQNFmpvk862xE4RzZLwCSbGt+rYjnTV1M=;
        fh=fGL54L4qnAS9+F+iwobvN0uWraG+QDRLcbKsPs2Ct/E=;
        b=eXW1+0/TY7GwFzYrhsZfJKf2hYoycQhrIk+i7YVHywq+us7xHV7sE/g19jMw3RAx1V
         dKUPasObWe7bTsiddRkzWSCtt1cbrzxNeYF52puV87FO1CnSHk/ZJO80m9sWwHsbi0RO
         nvxXJHdK/BcFLyttjRjJ0efNt+mFPRbIiY4Qwg0dmKohgySB0UvNF0kRtid7HMS7aTga
         Usf0G5zQbTjSu2wEqh89242gMz/XjXjjL6XIpWHwF4vwy0m5x/3CeyQNSdNvXnu5bt2v
         dLZZHx53D6OnShQCvg09Uk4Bc03dJ40AfLcPHhzNesIS9o7VlZIt2AWG1jtEPqgH5U8g
         3cXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389610; x=1793994410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeYMnZ0Hs9kQNFmpvk862xE4RzZLwCSbGt+rYjnTV1M=;
        b=W7nx3wskyb2ms97zKTp/IUvbkm16RpUyZ7ZVI+nDMuMj8eOaoVJbzfyvFZrHU7QioU
         pX24TlS91J9chO/RJ60ZdnEagbwf0udpmfqMNxLCXD8ZguUf1j2N6/RUNU/pZmR8Lrny
         joxtSu4vFkkfBstV4lB5alhZNoLYuDwGa1D71oUxMYjjeHJp97KpmQRBLQNxFwshfNhp
         haFOoMzVolc2eL8JoIYkDcTJUMf72TEXBLVWB2D/w/GtqkQo86wr99nPARpuTfTgXbkf
         d1+stu8r0+utru9aQuGaequzrvuSxF/AQkyQdTgNOTWILDUh2LbOeagZeQKHCzcFq+TX
         d1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389610; x=1793994410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeYMnZ0Hs9kQNFmpvk862xE4RzZLwCSbGt+rYjnTV1M=;
        b=0ZE8ynjryvwBWHnbRmosIJGKlwID2I1o0eQizMOzysLmRFyyj+fi0RXgsQ7WbeNuH/
         6SdEe0EwuXVb3kukUqmm8VjVKfdIsVXec00gEnk17aOwGTN/hRvjZBHkzrkEghSEfX8V
         Sx3t+RUPMyCOe/KEd76jpDBEUlFzu4A2Bm8LutVDSQ26RUgQkOi7K2zWLyl6YwOteUM8
         2LhaI8T9Cw/lyg4/n+uofByYUuXvLj181ZhIOPbUAL4K/vdbEBo5BQqdrfgioi2ZfvKY
         S494jf14dVEZS4DVuK7r4GsnLkd3r2bqzd5K9IGxGQZ3xVj3YRpDUmakz57bHqPGlHGS
         nFFA==
X-Forwarded-Encrypted: i=1; AKwUvBxGBZO3coVT+7BavFytWB0VMIXsWUXFAs6sfbUxtfoJLkYMMZx/jxUpKjUl2C8OuCOM1R4uOg3br+SRoIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYILhnwySYLItXGgQu5X+uYJCadqrnSm6MTkmpbJMhD3D2QiSBFW
	5XbdVEZ1p0kCKzspzvPsHWcPOyzOMc67cluIZdxWV4LxnNyyIBcowRqWSH3d7k92HcRp5GqpKls
	LXho0p4M/dUGD81YaR2gKnv3S6usOEtA=
X-Gm-Gg: AYBFou1rJztYxYjkVGZ5XsOBv7rhbVfBRkZP14z1CCbbhhsz1EPAO9ZZ0O1KcwuEbVY
	2jb5ql9UKTKHdit/8FxWIdmYCsflTVGVIGoa7HEWdWxDFw7Wv9nnxWhi9eT8Gs6elvpJ+9etP0o
	P5B86TQnmd/XH3eeWe4DzhwyFEmnuN2LRNFapoPS+KnFWQ5kLYPHr3qG+7L7M3jsQ2k3iaL12YY
	jGv2sF6c77VDskQiXUu53FQKluPSQhc7aPdEQQKvy2g9+W3U0D5HVZNIFbXgGl+IEVkoADYUSwI
	6oW+j3GpcPvFz0O8SoqJNR+6MxpSgtoih+QMIW+BqYrl+msDtQxiGH4zoJTANPs6f546pP708TO
	F2GwSR16cD4v9giTsY0gRvVSAjufdHifj0L0eAP0SxZYYj5kc8ceA5pVFcSkS2/ctu4eApaERB7
	05txgBNpxjtUtc6jYVlfqZoGA4wOlaPBbRxg==
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id
 98e67ed59e1d1-3ae895743ddmr2828942a91.5.1793389610430; Fri, 30 Oct 2026
 12:46:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030090913.76944-1-dennylin0707@gmail.com>
In-Reply-To: <20261030090913.76944-1-dennylin0707@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Oct 2026 12:46:36 -0700
X-Gm-Features: AclHuK99K7jolqpzeCXX2GNRVUBbkjuXo-dgHHmAo-9xOFMWgJ48dDT1RplKGj4
Message-ID: <CAEf4BzaMDRa8xD1oR587P82MYKCYR61gyjgvjKySSnnqFb27pw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next] bpftool: avoid sign extension in unsigned
 enum JSON dumps
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: qmo@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:09=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> The BTF enum value is stored in a signed 32-bit field even when the
> enum is unsigned. Passing it directly to jsonw_uint_field(), which
> takes a uint64_t, sign-extends values with bit 31 set. For example,
> 0xffffffffU is printed as 18446744073709551615 instead of 4294967295
> by bpftool -j btf dump.
>
> Cast the value to __u32 before widening it, matching the conversion
> already used for plain-text output.
>
> Fixes: c93cc69004df ("bpftool: add ability to dump BTF types")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/bpf/bpftool/btf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

please drop RFC tag and report with Quentin's ack

> diff --git a/tools/bpf/bpftool/btf.c b/tools/bpf/bpftool/btf.c
> index abd661db91e6..385521e6b028 100644
> --- a/tools/bpf/bpftool/btf.c
> +++ b/tools/bpf/bpftool/btf.c
> @@ -482,7 +482,7 @@ static int dump_btf_type(const struct btf *btf, __u32=
 id,
>                                 if (btf_kflag(t))
>                                         jsonw_int_field(w, "val", v->val)=
;
>                                 else
> -                                       jsonw_uint_field(w, "val", v->val=
);
> +                                       jsonw_uint_field(w, "val", (__u32=
)v->val);
>                                 jsonw_end_object(w);
>                         } else {
>                                 if (btf_kflag(t))
>
> base-commit: 7101b10cf281f629ac58c99697ca6f6d082b99a7
> --
> 2.43.0
>
