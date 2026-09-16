Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7495A5157
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576185; cv=none; b=A0y3GBBmZctddjGeOHdAPBiiRiZrBjWV+JfCCS7OwNkAs68JbpLuQcBUJYK44esw3o3EKxCwLss8g0gpqYjgkmCm0Ij0nymxztGoKU1hUrMyODTgTBIJ6yaif1pesXCpN/A/dy8a75hNwKEf2BY3uUk1+wlpg0raG+ojAY0QUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576185; c=relaxed/simple;
	bh=rfCTD+62jY9yHO2p4lEH9EoauwzrB7tZLsKcVUlpPbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGJpygl5zjmGvSIx8S5OJzmSRby9uQkPPIcAp0/VtODUs8xhTU/jPBtPfTd5dGGiEYTPUQG4wfbxo6cYzDBDhFSxtD1aBqMearDbkxL71DTRWSM7tnJBD57yUM0TOPyPzxuoZMa+RstkcRg2IzG4lImnj0StFaM/abJqEHgZZgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c4Ikx4j0; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c4Ikx4j0"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso219864466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789576179; x=1790180979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oGsaKaCm6H9DIjQx0NqyVJZZj6VZWtfqDIqvxsFeHmU=;
        b=c4Ikx4j08+Z/Ya7L5ry0mZfAqsOfx8AVPzHc5Qk0EuYiBRwHk846n2UUW7QlxFljWb
         V1Lvx+eGtHhRryl7uufAdfrzRz3tTrddkVq7yU0S5Z2QkLLkeiYw0ifs9oOYvhfJFpUm
         fnm2eW9gK/CYX4pf0FrGa2RnoV2JSnK+yN9S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576179; x=1790180979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGsaKaCm6H9DIjQx0NqyVJZZj6VZWtfqDIqvxsFeHmU=;
        b=FbgdBnRBfJrer0WrKmDjBv+mZ2J59+IgCDR4B5W0wQcPefIufnC/ZmKto0ErG3NqaJ
         obqMt/0+80c76Bzo2HMCwtWW4oOUHGDqPEgHqrcqV2AB1dSj/JNTqXFNwqYrXppmk5ur
         gRgZcXEGe+F/+SwLdOdoGttyA3479P+A4NvEmdwfGZKmHME3za2dMz5p4IDkDllt3cmM
         pKoSrQ0br/SK+vNGN/GdjWD9z1tKv5am2k5qV0KILAQXivrCzv2A+EKtzs21mhqMsJ5Z
         FXdCyBWFcKu/No+UtHd8xPJPid/1SRMTS34vb7609cCDnrHCfZqS3N1xYzjI+/Q09vKL
         o+Hw==
X-Forwarded-Encrypted: i=1; AKwUvByRhg8ZBiHJe0Sy8KwVVotQziJoYZuQSyX5IaeQKKHIkLnpvVTR3b01anyxBCqCOSE7U5qsEy8N+574KTA=@vger.kernel.org
X-Gm-Message-State: AFuF++kUczp2FK8yFvL8QR06mSSlfDH1YbLc5y2g/GHfPvb3i7YPcebs
	RtnibmjPaxqTqBVkLP4EU/urFLlAyglNAARPrrrfgQ6k+2Nz8uj1QFmdwK2Z88et2mCPcRt57zU
	SxgI=
X-Gm-Gg: AYBFou2S1lyLGG1PHweh8fSynhPXr6Kcovl+PGS98fxlOGDPNzjYli3rWRHAJlqIFwU
	7mznF7LmSgM1OGIFHyBHuwp4sl+FgflQhZ9pf9hJpZXRSB452D463oD4xIvUGdrGqJwuAovoHhO
	WvQjVCRTAp6FEZEKp4wKxlh8fDsFCPFxKiUezyLXWFgu/hZ6bJ9r04lab/+2Drg0AfS5TflnuGP
	ZjoBpPzUPgTpSdvzrNCEMsZixPrkh5KZG7AQhxattT7J2kn57K+c/t/Wk8IudO94IcfbMbokgqY
	XGZlqe/pUD9cmq66f+5BifNpOoNAwrdJfqIpLO/M6gbF47xoh513FvWnl5LZZoeVZvjQtvvcuHr
	eBMCRdw6btLXcRo1BURxq57gDcV/LFFMKzUwKE6fwkLknD9ZLDrFX++6qHOiYpz2+dWW9S4KXpe
	q4sahR98Il3ne2/KFE31hEBcsqN+VFZmkmJ39RLcGprP43f8ng66J+/naxHPtMw1aRDg4Qc2h/v
	kljMuy1FXAz5exrCw2w9oz7S/utnPpqd7YxX8JakjWWkDcQhw==
X-Received: by 2002:a17:907:9405:b0:c24:87e5:6491 with SMTP id a640c23a62f3a-c29e5183d1cmr419923466b.2.1789576179449;
        Wed, 16 Sep 2026 09:29:39 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fdbcsm160290966b.59.2026.09.16.09.29.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:29:39 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so7038195e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:29:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwv7sOE75c5VHAnbep0Pw2W2oOzJEnIwiC9Bdfy3+vQLG87TQad1r59JCZsRUTUwZCHh5+G/QSnGAi3QXE=@vger.kernel.org
X-Received: by 2002:a05:600c:c48e:b0:49c:ff8d:b548 with SMTP id
 5b1f17b1804b1-49eb732fc54mr76705805e9.11.1789576177013; Wed, 16 Sep 2026
 09:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916151753.6722-1-fangxy@xiaopeng.com>
In-Reply-To: <20260916151753.6722-1-fangxy@xiaopeng.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Sep 2026 09:29:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqGXRadN8Ro2UV0hXZvNOTABDmAh+On-bUXFEGuJQOSA@mail.gmail.com>
X-Gm-Features: AcwNN1V3QXHsb6_b7XvNkZrIiXWsTtecG2wVDHU_J3bG9sbbPJ8EqsrduqMn5D4
Message-ID: <CAD=FV=VqGXRadN8Ro2UV0hXZvNOTABDmAh+On-bUXFEGuJQOSA@mail.gmail.com>
Subject: Re: [PATCH] kgdb: Fix buffer overflow in the qRcmd packet handler
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: jason.wessel@windriver.com, danielt@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 16, 2026 at 8:18=E2=80=AFAM Fang Xieyan <fangxy@xiaopeng.com> w=
rote:
>
> gdb_cmd_query() decodes the hex payload of a qRcmd packet (the GDB
> "monitor" command passthrough to kdb) into remcom_out_buffer and hands
> it to kdb_parse(). It sizes the decode with strlen() of the payload:
>
>         int len =3D strlen(remcom_in_buffer + 6);
>         ...
>         kgdb_hex2mem(remcom_in_buffer + 6,
>                      remcom_out_buffer, len);
>         len =3D len / 2;
>
> kgdb_hex2mem() takes count as the number of bytes to produce and
> decodes them in place at buf, reading and writing 2 * count bytes
> there. len here is the hex character count, twice the decoded size,
> so the decode runs over 2 * len bytes at remcom_in_buffer + 6, off
> the end of the buffer. On x86 BUFMAX is 1024, so a 256-byte monitor
> command (512 hex characters) overruns remcom_in_buffer during the
> in-place decode:
>
>   BUG: KASAN: global-out-of-bounds in kgdb_hex2mem+0x131/0x160
>   Read of size 1 at addr ffffffff8765ef05 by task sh/1
>   ...
>   kgdb_hex2mem+0x131/0x160
>   gdb_serial_stub+0x16d4/0x3170
>   kgdb_cpu_enter+0xb68/0x1520
>   ...
>   The buggy address belongs to the variable:
>    remcom_in_buffer+0x405/0x420
>
> Halve len before the call so kgdb_hex2mem() gets the decoded byte count.
> It then reads the len hex characters already in remcom_in_buffer and
> writes len / 2 bytes, all inside the buffer, and remcom_out_buffer holds
> the same command as before.
>
> Fixes: a0de055cf613 ("kgdb: gdb "monitor" -> kdb passthrough")
> Cc: stable@vger.kernel.org
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/all/CAD=3DFV=3DV1-gNZ8yTsC+D8inePWv=3DA+9H0=
9hWJojQf5NRpcNvK+Q@mail.gmail.com/
> Assisted-by: Qoder:Qwen3.8-Max
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>
> ---
>
> This is the third in a family of unvalidated-length decodes in the kgdb
> gdbstub; the 'm' memread and 'M'/'X' memwrite fixes were sent separately.
> Unlike those two, there is no attacker-claimed length field here. len is
> the real hex-character count bounded by get_packet(), so the only defect
> is passing the hex length instead of half of it to kgdb_hex2mem().
> Halving it is sufficient; no separate bounds check is needed.
>
> Reproducer: attach to a kgdboc console, break in, run kdb's "kgdb"
> command to switch to gdb mode, then send a qRcmd packet with an even
> hex payload of 510 or more characters, e.g. "qRcmd," + "41"*256 on x86.
> Before the fix, KASAN reports a global-out-of-bounds read in
> kgdb_hex2mem(): the decode runs to remcom_in_buffer+0x405, past
> BUFMAX=3D0x400, and the guest dies. After the fix the decode stays
> in-bounds, the command reaches kdb_parse() and the handler answers OK.
> The patched run does print kdb_parse()'s own "command buffer overflow,
> command ignored" for a 256-byte command; that is kdb's length limit on
> the decoded string, not this bug.
>
> Tested on mainline 704340f1cd0d (git describe v7.3-rc3-9-g704340f1cd0d):
> x86_64 defconfig plus CONFIG_KGDB_KDB and CONFIG_KASAN_GENERIC, gcc
> 13.2.0, QEMU under TCG. Both kernels were built from byte-identical
> .config files and differ only by this patch.
>
>  kernel/debug/gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
