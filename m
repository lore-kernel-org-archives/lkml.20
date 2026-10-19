Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DA49B1ED
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400718; cv=none; b=KX/+F0nYTAV+16crbCpMcS3yYw2lu0n9tz808YBzPWi/52A/OtDPTgAVx4YIFitViYdsSsGnD8DtCkE6ZbDT0rASMpE/04gO2hm0NoN5BkiUt6lknKKjjSF26bOZzXPSbG9ADL42PfoqLvTbrQC7Y3yAzgJlyLKOWb4+uTqdX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400718; c=relaxed/simple;
	bh=gmnf5efQ2mINrLxGQXSf6UEgcGI1XJTCl1/2d7HLilM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QWL+59vm5rX8Bf/A+Igsq/SK5UvDflbg7oumVPxicL6SntMTr3qPGM/Q5ANCDzcDJ4nMBhiuuYDhWRNvqA7ioM0cMhhEF6CHHc33Na7Hq8hYuWYUMqviavx7TIznJCD2+EWXnj/sFWWOk3RsYjQL6R2wRHVbPiAxknIS6sqYePg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ftwC1tnE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nKuifPyC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ftwC1tnE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nKuifPyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792400716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9io6NcVa485axIU0tMIo8oUR5zvQmfTZbiDmw/REe/0=;
	b=ftwC1tnEmaTflvLhcBBuQ/dB83a9H4exv9xxtyi/dCWCLHjpk0IUL46CsqXQpsJriFLnZr
	AEvxr60UYqEDp47Hy5cd9kMkOAPN/CLiuMWUEERboM0HM8JTMXMTyw3PhSbfIg05JhV6nt
	6kS4YYSPL2QROzAwm/hLkKf1gWgdkyQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-LY1ZnB2NNhetQPfzLjC-Iw-1; Mon, 19 Oct 2026 09:05:15 +0000
X-MC-Unique: LY1ZnB2NNhetQPfzLjC-Iw-1
X-Mimecast-MFC-AGG-ID: LY1ZnB2NNhetQPfzLjC-Iw_1792400714
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1416692f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792400714; x=1793005514; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9io6NcVa485axIU0tMIo8oUR5zvQmfTZbiDmw/REe/0=;
        b=nKuifPyCwRR760ffFYIZmOet8G7WIOqxHEt+kSQgvTbPxTIO3ATUof7g94lFOY3Yis
         wmmGdWtqEyASdacHCP96OKcDoZqcs7M7EJiPNRFSvuhzD3Rvu3EKl4Pkx47UMb0CwY55
         rP55r/kbAz5djlujD2igUxINJ5h4bSXzYTa2JhGPD41wO7QH4IfucIeHeqWdwwasAeCS
         3cvci2tSJne+lYMhqeRbjIDy4H0hW2Hq3hdr3V1U4DwlzJo43bz5FZu9zxRR8RGsYUZs
         MjTMFTjPBPnR3BODMFkwMMOXuNSvXCjNDevsOcSu0N2OHPLvui7LYAI3OEVACXYSE8RK
         6luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400714; x=1793005514;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9io6NcVa485axIU0tMIo8oUR5zvQmfTZbiDmw/REe/0=;
        b=QD4QqUOZVtNzx6lIn6jsT6jazTVnUx7eIyUM2Bt9ZPERUPIMwcU89qTUJ1iqz/dMMo
         BBbZIVHWvpj/5DYe8VxXB5UU0s6e0C0S7cO7c1wGGKcWwShSrLYT6csUy7bGd6+vLBdW
         uQGepLfMqzedEqUEuWGtnl80dEhN8soFnvL4+m0KS5GWN3M/UCx75W1xof7YaGR+Ize0
         125q0I56bNeuB3H+bQ2D6Qpm3VDZ3zjKROmUTRjC0tfZjmZ6x4oVi4QVKKnA0CzOf4Gl
         VUmAftg41m7OhlH941lVYG61SuK/bR9A8kUOs4gWT7UdZCA2+TSyq3KNfqFGBYSIj2sP
         LMFw==
X-Forwarded-Encrypted: i=1; AKwUvByoR63pLlQf+tfdpa+/+TitXCF7Zxgq/5KoQKgsYQICHvK+HVtBpj5IWh+2eTKik/Be0ny2nEWIBOzQLdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdRtgeEJb3JFCJWGYYnArZkNFkOjCsKLcYtlUi14I9GMR05cbm
	ISUL2UTyGhV8GEC3NPnWYmYGncTL4uuvXH0t0gl7n1EeKCKcsRySB/5VUb0Xz321JoPDrmgwwOz
	GWSKyzISCmDMRop28Hsro1GXBkp4Gi6I/UwaHKC3OjIcCfMuRdD6mr9ZZfvcMtO0CNg==
X-Gm-Gg: AYBFou09iRbCgPLyK60dWVJP4MCrlnKi6VAOXwDdUpelWqORMcT2D0KqKSUce11pEax
	nVWasxuz46njV8QYJCeFSR8qI/1rRf7NQV7neSNMoY9jU3qDx9TCkzdu4vIez1sYsmkHFfv6WHR
	BI7ZuioqlRbqjlxXeCAIUUVtNSyDkHqbYItnX228zvG2LE+cngxOyP+1/ni9Nw7i0Az8jbedSfG
	aTB27W71D9sJ5wy2bLA+7xWqqcC6YGaDHsgjz0dfx8cBD+wwAYXQKbus/t32tbqac8GmL78x4qL
	8byhAMnAzrQ9MUGyT/zYGMe/xAfvGmLwzFKCYgPSpijOdfUHjeWYSuOqSzgYJ2rX/aUz+FnAAMk
	t0A5EsNDnNfmKjEh5v6kAnMXkbA==
X-Received: by 2002:adf:ec91:0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48dfae65b2dmr19629107f8f.13.1792400713425;
        Mon, 19 Oct 2026 02:05:13 -0700 (PDT)
X-Received: by 2002:adf:ec91:0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48dfae65b2dmr19629060f8f.13.1792400712928;
        Mon, 19 Oct 2026 02:05:12 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23527360f8f.32.2026.10.19.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:05:12 -0700 (PDT)
Message-ID: <0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: John Ogness <john.ogness@linutronix.de>, Alexei Starovoitov
	 <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, Wen Yang <wen.yang@linux.dev>, Tobias
 Schaffner <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>
Date: Mon, 19 Oct 2026 11:05:10 +0200
In-Reply-To: <87ik2zryzo.fsf@jogness.linutronix.de>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-11-gmonaco@redhat.com>
	 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
	 <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
	 <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com>
	 <878q3xtptq.fsf@jogness.linutronix.de>
	 <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com>
	 <87bj8s8ih9.fsf@jogness.linutronix.de>
	 <DM78SVMBI2XW.2XHVC67VON48A@gmail.com>
	 <87v770uuyr.fsf@jogness.linutronix.de>
	 <DM7I2PYHNKXE.3AYY3N1HATXLW@gmail.com>
	 <87ik2zryzo.fsf@jogness.linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-10-18 at 14:16 +0206, John Ogness wrote:
> My issue with the /dev/kmsg design is bogus timestamps. But let's just
> drop my suggestion to allow eBPF programs to call printk(). Since the RV
> move to eBPF will require new user workflows anyway, the users will need
> to learn these new packages, tools, and output sources. The important
> thing (for me) is RV violations can still be used effectively with
> ftrace/perf, which they can (using globs in bpf_trace:bpf_trace_printk
> filters).

Alright, I'll focus on trace_printk for now. As I said, it's rather trivial=
 to
add another reactor later.

> @gmonaco: There should be clean glob-friendly RV bpf_trace_printk
> strings so that filters can be easily and reliably set up.

If I leave the LTL header unmodified, you'd get something like:

  rv: sleep: <comm>[<pid>] violation detected

It should be glob-friendly enough, but I'll try it out.

I wonder if string matching brings additional overhead (trace_printk itself
does, if I recall correctly), but that's probably rather minor.

Gabriele

