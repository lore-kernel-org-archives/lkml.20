Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792832811;
	b=4l/xK+Y5lJPfTQobz3IhN2IxVcJ7bSCt66Do8NxvC6ud5tTPSiVNGeSDK4snOnZPM7Qw
	 BTjAU+038ujC/zwJxPuokXe9hEA8r8QOmQIQyuxQopoYJDXI0S0biD+1+ljTE5l8Zx6As
	 6niV9L8jf8h3ItEsMWqWl+EI3slwmga/RBgQtCvXjjRQb2Zfbh3HKRw0eh6WksYT9pOo7
	 qGvDYaVw+M//zzCaY9Xo0K5ZVGdVAeIIy/eXRzoiiJe1YxDKh7TOzFjTBqpSL+w5CnBDG
	 9ZS1UjkR6O6poY6MgYFASN+iniTG0qVFQe+Q2IdZ+YCM1RW3Yn11D9JuZ+RhavdfnxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
	b=QWnQf7cQJK0n6WBEOz+C1VtQLiGXO3t3Awy5GuY8+vXT+zhzSx90ChdMkZfmKOwBZyqx
	 OoYQsVpjGzcDsRZ/6LhjAOvJxtSE+zwXCPLPOKi628G2PH1GmaErUDRLwrvJVszB1DcZj
	 Wrv/6E1SguMrNSwJO9/HXwDmUBHnIAwab+HUIWydRmWxSrHm1oIP9qh193qqX0vy6Xz3v
	 /DhHJV/SPU+VWfaHjPOAUoNauPtHsuOkIZUm3SFLSQejTm3L5rzw1A8KT+1XoVEo7KJ2g
	 HaNS7WkXUmrayeeQgXkLH9/Q7HAlsp9IIthPFhPX6ty9gZNLJVdsnxoCUizpcKnPgBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peA8j1u8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E3606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peA8j1u8
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b10d24345dso15196167b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792832810; cv=none;
        d=google.com; s=arc-20260327;
        b=VcI0feai6Sfh289XKAxarFgaEjtbJ7YM2qi+kV1tgh524qEXfDw3MrX7QpnsCyiFiI
         qXLF+Vbiqdd8R5vJDFvBCSjbN8bUbGSkTcEM5P95gwLMII+0PpFjl81RtFOf9/gw+N+G
         6N5bHhb9GqW7wN03hpGowboKDO6Q+wdiI+bZE/6KK8iL7Lhrc6aAx9wlgPNZWO4spi38
         2/ixmkbzFdReQlqq577Alui5VQBv+RgA46KceekAV8I4KRmFJWNVcuN7eKQO+NXh7+Ye
         mf6Ge8ltuw8jVqj7iA3P74hJOlXKBxDyASEyu3JjqwJT16j+fgKNrOZrahvP4jCS+d4f
         RpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
        fh=Oh2E3NEwai+rbtrNKqW1GRqPqw6u21ce/a2VYgMrQaI=;
        b=WXS2No6ax51jON2k+OjBZSeC3hpuvShtKVEGTHtseSUeBPNSQM8F3O2awu2X7yXQ1x
         ERRRqIoVr2wn/9ipopW0Y0a5wgSgHXNwxrHrEbK8dDrGClbY96CbbcszfJgiPCPuI59M
         Fjx0o6Ax2Nd99vquTlbc5AGAjRHM6FcCYlKuhMBvUR90bb7W2kJJnibp6Sn0TQHr1Cir
         4JbTIuuCROirsGEmhOANc2zamMvj1gDvw0kLJlPxD5+OZQdNFtgwUnlzn/rAhQeyQMb6
         +hjOoTpdraGH2WDUvjULTdd42/Y8niybu2EXebEZRq0YP/lNJBLyBqKYDKFv04qBAE5M
         hdZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792832810; x=1793437610; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
        b=peA8j1u8fL46r7ULUkBuBOrWgZjcZROMYGZ7QeWZumuU39NtAgwbi4lKLjEZaLpi47
         QUg2Z6kytDvoBooMMz+RxpxpxOyX0nTLXumOofYA3zDvaLw3eSjq6g8XG5abZjxmwb1X
         lwYYayYMe06KZol633gBGMa9TG9uuDAUqcj7dXfLtMD6f3NfIwLnsj1LL/momBthowgu
         QZx5ma2WqvHDDmnQ4+lOruyPixXvHY9CzMrDSVsXvXD2T8AS9pqeR52DysctWcB8Pdn6
         1ceY6Rd1dN+cDp2NgeNqz3BGo7J1Yzd+gMjD3f229idHPJxrCUHKfs6N1Z8N+QrzXgr4
         Yaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792832810; x=1793437610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
        b=UtS1sQowjmQECwg2MP+ZrGIeiCQMinZmm4fIQTkDwV1tYgung3sIJzCChroUfxrhf+
         in0/5kpTPuhx5GdaRpZC+344ReYaYk9RYD8HR/Z+06vkMARnfiiDulcljefYrf+Nm50b
         ef4udPzULNM6cW3Xu79W1Hj5X+PbAm4ltcTGrqWjrB3HcefyuZt06j5rQVArEDX9iIzT
         EHDrBG6Ly9dVy46MXv6ldJOL70Mb+79HVhLj/SJsCXbIprFPdSPrrqT9jO6yT9ICoNPP
         66g3HjYpvONTxvYdySza4bzlr3RSjHVmfhPfMNSs/m2V5oO2HYk9tQODfmPRz+y+ZSqW
         u+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzp4D2R48XnBBTGkqZErCIl2/LJ0oEgcBzHtDahoyqzq2i0Eb4hIfuVWVouTBJJHhCYs71IuJlgVpcbIQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL59lKrxpKGSHYsqmTWBIFYLWCZHt7xaAEDIKx7337oYKl2Dk1R
	FpkTisOjllbvlVXjklFsaI0lqXY2iOo/LTkZyAZBy26RCFdO6WtB5ZknVQAb/UgaG4xttopHONc
	l6KFbNaeBx1oBxbkeUZNwkkdE902jlEo=
X-Gm-Gg: AYBFou3bK5PcqBdenGBbjmABcLa39pVqu5ux7DpAn7vi2ChhVKzmCZ31/G4ARhmdj8u
	3Ta0rLjwHaHmuOdQqh30umSrzeSFsbwnN5zQHsru+wVvYT2ClY0TKD1z7E1HH9QgIO2RRUdzKWa
	IDS+G5DRRHK6iOE05/1vfmFcuxOrng324GUMLyKovkCzkZ4Rw9y/V7Lm7KS8rgkHOw+D5zaH3vh
	a3tredKCTWBqH5zRDvJLEl5DL0mgt0d8XdVssOqxwpi0oIjByVF+wd/Fyrq3UrwJOQ21z+8K87y
	C+ku0GCRtcenEbXmKglsKuVYhSYCvSZsOWJL5AvU78k4rn+2RotY/lyf4HVhn1lzwmW5GQ4O0kQ
	0HtyKeYDXPXyPZtPUa3hyWy/dW40XmLG0MHIejCORtS1HzQijGqYiDlrcStZ+b2rlbcDk9M0=
X-Received: by 2002:a05:690c:f07:b0:873:5c0f:28b with SMTP id
 00721157ae682-8b166cb996cmr13153177b3.53.1792832809935; Sat, 24 Oct 2026
 02:06:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017020634.792390-1-nickolai@csail.mit.edu>
 <20261024041334.831273-1-nickolai@csail.mit.edu> <20261024041334.831273-2-nickolai@csail.mit.edu>
In-Reply-To: <20261024041334.831273-2-nickolai@csail.mit.edu>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sat, 24 Oct 2026 10:06:37 +0100
X-Gm-Features: AclHuK-67mTcSnyua7KyheG5Qgmdf3UD4Himo3_0JnMqb1NB2HpTAb2W0dS9rpE
Message-ID: <CAMw=ZnRpCvUBzHb+-vbvgoefZetrnqJc2DNjDKiKKup=J+SVqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pidfs: do not report fields that do not fit into
 the caller's struct
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 05:13, Nickolai Zeldovich <nickolai@csail.mit.edu> wrote:
>
> The documentation of struct pidfd_info promises that "If the structure
> size is too small to contain a field (requested or not), to avoid
> confusion the mask will not contain a bit for that field", and asks
> userspace to trust the returned mask when deciding which fields hold
> valid data.
>
> pidfd_info() does not keep that promise. It builds kinfo.mask without
> looking at the size encoded in the ioctl command, and
> copy_struct_to_user() then truncates the copy to that size. A caller
> that passes a 64-byte struct (PIDFD_INFO_SIZE_VER0) and requests
> PIDFD_INFO_COREDUMP or PIDFD_INFO_SUPPORTED_MASK gets a mask with
> PIDFD_INFO_COREDUMP, PIDFD_INFO_COREDUMP_SIGNAL, PIDFD_INFO_COREDUMP_CODE
> and PIDFD_INFO_SUPPORTED_MASK set, while the coredump_* and
> supported_mask fields behind the 64 bytes were never written. Trusting
> the mask as documented, userspace then reads whatever its own buffer
> held at those offsets. The same happens for a 72- or 80-byte struct
> and the fields added after it.
>
> Clear the bits of the fields that lie beyond the caller's size before
> the copy, in the one place that knows both the final mask and the size.
> A request for a field that cannot be returned is thereby answered the
> way the header describes: the field is simply absent from the mask.
>
> Fixes: 1d8db6fd698d ("pidfs, coredump: add PIDFD_INFO_COREDUMP")
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>
> Notes:
>     The three size thresholds follow the field layout: coredump_mask and
>     coredump_signal end at PIDFD_INFO_SIZE_VER1 (72), coredump_code at
>     PIDFD_INFO_SIZE_VER2 (80), supported_mask at PIDFD_INFO_SIZE_VER3 (88).
>     Masking the request bits early instead (before the coredump and
>     supported_mask blocks run) would save a little work for such callers
>     but leaves PIDFD_INFO_COREDUMP set by the dumpable-state fallback for a
>     live task; clearing the result once before copy_struct_to_user() covers
>     every way a bit can be set.
>
>  fs/pidfs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Luca Boccassi <luca.boccassi@gmail.com>
