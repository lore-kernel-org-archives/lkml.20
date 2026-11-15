Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794764613;
	b=iLJZW3oviRCNUPsbvZH2gfT0Xom5mPyBWVFRL0DHTHH/AQS/InJ2bS2W0A90YDMjYUkH
	 HrQgbst2C1d4/VG/DqtC0N+zRh0rWtt7tElB6rgsz+3ZkRik6WcK50+AeGZVu8bMj28x+
	 X86r78PXceqLmjnMcCSd41WZgntPmEDzYzhBe4+katIpwGAGcldlDYaLnjol5tLFj1pc+
	 cPji5MT84OTg6jqZ2nWeVXJeSWKqzjcUT83CnuB2EyWsj8i1HZEwhYTAAmLJyh4MPBieW
	 LJAruRXDmF9IG1Pj9PZm/s7REGxf1FHWOzfCLnletAtOFW4dlldsEZpkhDE+jY+mylA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l8m1DI5EER6esOn+ArrsUBin4P5lhG5O2vketHHBX+I=;
	b=qZtSqQwc7UlNvv1A2dQvNPH+oIoGXkg+hy8KrnlZdFqlYsYQFEMPqv6/L2dd1Ab2g34D
	 OxFuElyGYb2jG11M96Rc/+odg86SCzjIDTd47NhzkkZZn+Lm3RXD4y90F30TBsG0NpbWH
	 uGLE6K7RSfCL17Hp5ZFWMJFCfjKcemnFqKWjyTHZRibU5fJ8MbNh9Uvx7mDmHnqYHGhjR
	 lNm7MgAlTbVkptdq2LN/UrdkIZmbJ6Ho9h7V7mQR70rySEV1xhHyfzKJZLWNO/2V/rd0Z
	 BG7Ct0V6nm24qQ4emMOSksIdjzz/W2KroqEGWO+yEv4o53Tt5ZBC+8dTeeS6GPC/y4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhNNWAQf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E10B606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E10B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhNNWAQf
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso4252997a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794764612; cv=none;
        d=google.com; s=arc-20260327;
        b=bNZ1lh6/XRIu424F+Dz8TESulIV5nJIr5THvK8JnmGSgj92N9/Andn/vHGxDlSKRfC
         uEjF6CxDLe+mqrjUfcw3GlR5Z3m51PsMyXp3+6c8+rFt7lVCnzF/e1RcP8HovnTCf/FH
         /TKl31P5pAzv5y8EcjAA8thrQ+JIXtUmv3/1HgyCmNblhx572QyO7qQ0SESr1MWQkIH5
         hlh2ZfS1g2ITC+Jl9PIZrOrWnwRRhHi3LZBotMiawGHY8OF33cd7cbCz53d1/PBpcbc5
         Hmxi52jXEsoAxVFF4QDAXOA2tFlKHh3+yQ/qw/YW/iYBx6WIPu/lE3D2Uwcx5rye9JBt
         KDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l8m1DI5EER6esOn+ArrsUBin4P5lhG5O2vketHHBX+I=;
        fh=iWhuK1AQPSJ3T76BrCu3CNGgy7qIR50IMHCuAW1x4H0=;
        b=eGue2xpXBYO2Ksfp/ZYeIX0Wm7Byci0aqQYMLN/LG9+nCSvK0Pw5dcomNSxsECC2lX
         yzLsi/sk8tzkiTvf7ZafBQagZyMgZaFKcduME9Dr0KfgOloKx61RIJ0FMH8niUK/n+pX
         vO5Y4bJYIS1OhzCog2ppSbjrEVnXi2Q8FIMOPdG3T6J2wyLPwy04VWWwLU8u7geUI1FR
         tjrlnFyPQmAmhqOEgYEYgaigPVFG9sLZzlytE/A/nxsH0enZ86Zj0G+Z6Xgtt8Ubs1QJ
         o6zSF7/lE1ntc5Q6mSIEyfJxyKm+3UQtENRpBQPt2tdgsM3ynuotTLBz+VQRfkKX8/ML
         ZWqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764612; x=1795369412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8m1DI5EER6esOn+ArrsUBin4P5lhG5O2vketHHBX+I=;
        b=hhNNWAQf/JIrCr9UECu0XJL1iBTgKVciK/zdKQMU9W37KvfKSCdZvPhyS5EZUFRdqh
         1EreMhH0wlaNgmSgg1kl3h0F9CeXdjMzDlVuN2TofJ7bikgGEbo10ymONWlY40cJnv+J
         OlxnBaH1vrdqn/1RXLvKvyvxjLIcN8HzcswhTdkeEosvBsP0/magOnm45vpcRq58u1Si
         NKVVIIsuyrQtftNwQxudO0hqp3iVA9NfWPDF+VCWgMCxI7fOSstP8rUeTafT+/81lqID
         I6JGSFVYt5wCqJH85cvxzhPCNhKpY1TMumDuUtspikfXWtxx+8g/9bMTLYTixRQyCNTR
         ajLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764612; x=1795369412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8m1DI5EER6esOn+ArrsUBin4P5lhG5O2vketHHBX+I=;
        b=2S4csVYB7wSWnaMGcD85QkSiR9RMOivoo5jBgfB9MMRoPVctKpq3G5B524tOHwi+W9
         xO/tQ/Zhc8c/YyPnNbjn+avP3KuRjQUT4DCkCikIihZteyTCVkEY3LUJLHaEk9ybd0qI
         GeeNkM7zzaULfoYfVx0sG7T/eRGyjpFS/ZmXm8eD/O8JJaadkolbIcb/nawq2jLDgNhy
         CVdxa1vPRXgPK//aXfz5IJIx4fgfMIqyxf5ArVozpKn75Ia19d5x7YIvVMjn0AfLDgEG
         ArDmhUtWDSFhf2LeWlMVxH6aMiRD2Tdv8K0+2TWX4gg4x6MZSM6NmzFmDGpcToYbpBRj
         LZMg==
X-Forwarded-Encrypted: i=1; AL+hErHeeigKhcwGRVeyO6MJS+Zf/svjvnYr831cmlOuF8XLxJhsjOFeQ+zgvZ+oPBz8YDxR1C0JDagvzB3vu64=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pgFGjpL0Qtb1Io24fCFPEh2De1H+yoAm5GlwoFDrT2rl+eZPJ
	5iukGUPmId8MhQqluu3NUVyARVmr3z+CBNi+ZFIalAtj7ycE+gplhydYg9l5fmP6tLFFEibM3n6
	FiwtYuJYDhnf3QJoYEbHrR6AFRpPI65ncEswV
X-Gm-Gg: AYBFou1jzjdKT60+tXu0kI2AIiM9MsHKU/Hx7EL1wpQO2orq0JSEo03AY9mKvjGk/Gj
	KY7hA2+7GnMZgh9w8Gw64NqKxJQ3Cw5KUGv/xRiC0sBhG3tvA99q8ouaNJfKxhUfiPpCrQLujkG
	ooiQIx3I6QvW8717S25TVf7DYOemvygo8p3H1OeUoZbpGaWiQ0o2orcP8KV55x7jZnaHoi7l4wP
	S28Dp8kqodpHXhFDIRDwkaZq6g/FqsuHJRTETXX1dj9H3agocQBMO6N1iVfbwAX50aW2XC0fIIq
	CH/mv6GcuHvuPwdfH59zTdwqeID9cEk0sckmxq/D87SydNYSDakeYgUqugiF4jS2K2SM4uj+V2Y
	n2bE/SxpL2G9snknHuUfK3jGCcMR4Tzw8UPTIIg==
X-Received: by 2002:aa7:c1d1:0:b0:6b6:4dcd:9677 with SMTP id
 4fb4d7f45d1cf-6b7c0957768mr4340738a12.14.1794764611546; Sun, 15 Nov 2026
 09:43:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114224636.34362-1-mc@raidlab.org> <20261115125515.56112-1-mc@raidlab.org>
In-Reply-To: <20261115125515.56112-1-mc@raidlab.org>
From: Anton Gavriliuk <antosha20xx@gmail.com>
Date: Sun, 15 Nov 2026 19:43:20 +0200
X-Gm-Features: AclHuK_5e2lmB46bNVTzg6mCOVxTXXudn0oK0q_D37MwkgbB9Zl7L48-wnQHpY8
Message-ID: <CAAiJnjo=UW4kdcMqU62JChytMg6rOLOKvxJYDD2wy6eRK-m8QA@mail.gmail.com>
Subject: Re: [PATCH] md/raid5: fix write stalls when a write is queued during
 a drain
To: Miroslav Cimerman <mc@raidlab.org>
Cc: song@kernel.org, yukuai@fygo.io, magiclinan@didiglobal.com, 
	xiao@kernel.org, neil@brown.name, tj@kernel.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Anton Gavriliuk <antosha20xx@gmail.com>


=D0=B2=D1=81, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:5=
5, Miroslav Cimerman <mc@raidlab.org>:
>
> Anton Gavriliuk tested the patch on the same machine as the raid6
> store patch: HPE DL345 Gen11, AMD EPYC 9455, 6x PCIe 5.0 NVMe, RAID-6
> 4+2, chunk 512K, no bitmap, rmw_level=3D2, v7.4-rc2 with and without
> the patch, fio 4k randwrite, O_DIRECT, io_uring, 60 s, 2 runs per
> kernel. Slowest write and IOPS:
>
>   md defaults, 1 job x QD64:
>     without  max 59.3 s / 45.1 s    128k / 124k IOPS
>     with     max 2.9 ms / 2.9 ms    129k / 126k IOPS
>
>   group_thread_cnt=3D8, stripe_cache_size=3D32768, 16 jobs x QD64:
>     without  max 56.4 s / 57.5 s    472k / 474k IOPS
>     with     max 9.2 ms / 11.2 ms   483k / 479k IOPS
>
> Without the patch the slowest write of every run took 45-59 s of the
> 60 s. With the patch a few milliseconds. IOPS stayed the same or went
> up a bit.
>
> Miroslav
