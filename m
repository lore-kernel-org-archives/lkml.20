Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792561626;
	b=0x1DyODs/sM5l8EFk/VH1ygkX5+0DbCpdRhuL9doD7Mfnwu7fwhNmjVe76oBgNz0f3Fd
	 cgIpKgiV12wTXN9BMKb7vylU0kB33c8qqFFj+Kh9FncEuJesaO36zFu9Ro4OZGzX06Ngu
	 yYWRfjds+KJaNv/v3socwSmGYYLreq2MvIks37vouON+8Sx8S0GF0yBqXKN7YD/W/p39s
	 W+85Zud6ekbdfyRtkxwlCbzj+IhuFM7PhUBeeVg+VHhrtffwqpQ15aarnsrti9/BOs9Ed
	 sOf8/qZLWMpCC8R8+3RkC7Q/O8RUNoNRuXJxVlqsqxKPCXTpDjjIBLFkoPSwD8Scwwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tSn2dX29VgDqk2hgfuzvCjkC5Mz2yIfzdQjrFRKGhV0=;
	b=hIAOt5uDGWghcsXA/FwjV2/2oP26rdQHgJVkpp0OaUd8lwq6UAlxMtvofRg2l9N+ILry
	 zaPtNyBhLv2vABRHGN2lwSmQOunj0F17K0AJdWAT4dbWcL7k7Mz2bC24FZZrlm1h5o2mq
	 eiJHx9xZRHUwhi6PfO20GrpKIG+G9kK9Cf47xNyIB/svAGw/Jlbvm8VjLGIYkBk9MQ2XP
	 KIlXmPrYw7p6vjrmE99BC04xTFKUqSYD9mc+YIJN/mULWZVqiN8F8iZKqFGw5Q2I4uLoG
	 mv/xtegsRsVkDnbKti4P/B+gflTaD4GBKp9g443+OXE6uIZoc1877ecdN01L3ifUV/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PPORQrRF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PPORQrRF
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679334baa1fso292403d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792561625; cv=none;
        d=google.com; s=arc-20260327;
        b=VydISzWG3fNjJUWLqknatXvJE/RA/xq7cfiVGCYnF6/wr6qkJmpAiv8ey1oms9J1iw
         aykEVnXbKBddxRQEuZBnVneFhrTSVAsTFZdIrloNvaBSgAzrODIVn0h3mRsIfCvWtKwh
         Xjqv67oei4MmRBjBVm72f6cdL5BXzMsbaAkn8vitn0ybk/+U5GdAZLSP3Tr6Y2XWdXBA
         ExJFKmJSHzotg3/QakshU8bB2bWb0Ahdddv0kMBk23/+oSQaRaXLpk3VBq55/LRhs/WF
         eVynUIVxzdcFpl4W1b6n8nGEmvYyLj2C5N7bhFYCeOO5YQ5Q1ZzXHig03X+Cq67d9UYF
         7+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSn2dX29VgDqk2hgfuzvCjkC5Mz2yIfzdQjrFRKGhV0=;
        fh=tjGYtamR32WZEcmbQ3eC8aoXDk4N6oiBwcOiqp1gLZM=;
        b=YfcGfIFYqZFZ+cYgh1o4Vkt3UfOsnBp9PAsLHELDJ+NtTMBA77m2Gxo7Qt0IwbxDvP
         9yoSjhhT9KSniSrthcQkrQjCxglpXLlVI2cI0SYNyeQF+WuUCZfVvdZEI5lxo4db/TrR
         BiSZbueA+YQAflKxS2qI3CiVValj/sXkUQQcSKryrk+mhhgt9T4cZu3e7wYlDDjguLea
         9d20lvguEILMBs9RDZp1WweT6ML1Mxs7yY/cIgvmQhKQsbbVcqIe5lyN36JDrvfxnxvF
         VvaiVS/esi+PclZPIZShd5nggXnaFxDjB7qjDc96KzBAHqsrai+NZGGw1YOTMsiqXRCr
         tMiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792561625; x=1793166425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSn2dX29VgDqk2hgfuzvCjkC5Mz2yIfzdQjrFRKGhV0=;
        b=PPORQrRFn7tZ3dUbqNotr7EMNnlKNVNCXlWCGZrOyaBVAF9EWlt496mVN9F89V7iIW
         Dgvr1ssi7Vixkf1DCoN0fOT8+ZVAK9fR5LesXxVuAcuXDQAjK40EmYAPUVU/21thJ4AU
         qvkAx7aSPuCZk8yRSQLOl1PS3sGcsFbyuZ1+JqblSWUrGt76EBa4/gW6XVdzBs7oqjam
         CbJzFige92dXRxMnPYrygO/mjvUjCCb1CYDB44/oE7PwgidEFUdRT2fzOfYRRdzwIMxR
         gsWyk0zV1rZLN5BHtIbO3EH+G5c0ZH/VtiIdvXbunKzIW3vbDrZ108f0vlFgOnu9AJXw
         c6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561625; x=1793166425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSn2dX29VgDqk2hgfuzvCjkC5Mz2yIfzdQjrFRKGhV0=;
        b=tKsCvQzdaR94Jd92u3FwHH7hnl8vdByMY7GaU58MckHT37mRMhUeo9Je5daelQtott
         V4fA818y3+oAHM+sd5leT0E9RRvjfLN11ylOB8oSttfKopr2LuHD6pHtYBxCTNDembj+
         bESCIMVLi1QoEmM1lDLRQp6Nw2xasMZriwwAAdJAeKqOKKc0XzGI/TK+SIe6mWegdPXa
         VpQMcWo5d35becaPqoRs+Eswy4WVnRLttawiB9qCPG0+arex2wGcgop9xUjgH4KtVmzs
         KyNH1vOrSGDfz5iAFgIFOOv9lC0NvAuxTH5PxGAnH2dacZV4LtoFY0LPVYZR/eVsxvKs
         /z4A==
X-Forwarded-Encrypted: i=1; AKwUvBytPXF0Z1+oJqfhrGg0tC3QkIAH6pa/zlTMGZhFDLtXMHVvDiS2bvlOnEij3SloVhgg5JgowSkvIt4t1tE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE++do2fQ9gKnupmmE6uEeC2X2v1mYro/vwxbCa+kcaEgA4Y3O
	zqQGp9vgCUjrG9OgOmKlOXRSsWrDzr/mth78G2T++fEIwVVZNw0LPzVZ0HEBr47yoYGlOLIvpuE
	gSpUF1HvHX5RqyHyao+Aw2I0KeWFNI4Y=
X-Gm-Gg: AYBFou2l13uF77pVo4J7KzKJfb3elxta7oSpcp1pw4t6i0OZ65SmTVbe7616kJ++Ek1
	/jjr9mFSItClSNgl8zDrw/nm79TGzQ4fTIuGe+bAViF6idT/CwsOX1ZgypfTXatdPXH9RBNfGSJ
	qkvGUYUrBv9TY4THKNS+fTxlPwFqicTK+sQvgDmH3NYtobRnU0EbdsfaEDj2R05Ylxx9hQQ0Y0/
	uTouSZT00J1IQCjnS6acsifHE4LdKU2fzn34z2nlQYGWUZMH6IA6F+TgzpdVnvunIPR5AbbN5tS
	jsfcQL0Ecmy+8fXzqFf3fSDUbZxmy3hVNbpQE2pS4PGq68A7yHNR/De+K4qhhLZKVH0i6aKLTF9
	kkVMXDuzAKIAQV1Q0glL4Tce7dA3Gd5cCiM6aMap/ojpoxqrVr5jo0oo2uF3MBDfY1M5Af+a++S
	S/fVMDE1IjPqnK
X-Received: by 2002:a05:690e:4390:b0:677:a7ac:5624 with SMTP id
 956f58d0204a3-67a0e4bbea1mr386088d50.44.1792561625107; Tue, 20 Oct 2026
 22:47:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019064157.29885-1-laoar.shao@gmail.com> <20261019064157.29885-2-laoar.shao@gmail.com>
 <179254940965.1919196.7604748267690139512.b4-reply@b4>
In-Reply-To: <179254940965.1919196.7604748267690139512.b4-reply@b4>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 21 Oct 2026 13:46:28 +0800
X-Gm-Features: AclHuK9yUw3q9bz6eHz4oS9_OplikvSYcNJ_NBkBIXr9uF4A9eTzN6CgKR5Bujk
Message-ID: <CALOAHbD_1rRWk+T4JU9gbQpjCnf6FnKmnj70U7G7CgWXdp61EQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 bpf-next 1/5] sched: fix stale get_pref_llc() stub
 for !CONFIG_SCHED_CACHE
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, tim.c.chen@linux.intel.com, lizhe.67@bytedance.com, 
	bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:23=E2=80=AFAM Gregory Price (Meta) <gourry@gourr=
y.net> wrote:
>
> On 2026-10-19 14:41 +0800, Yafang Shao wrote:
> > Commit b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_g=
rp
> > to fix UAF") switched get_pref_llc() from taking a struct mm_struct * t=
o
> > taking the task's struct sched_cache_group *, but only updated the
> > CONFIG_SCHED_CACHE definition and its caller: the stub in the
> > !CONFIG_SCHED_CACHE branch kept the old mm_struct parameter.
> >
> > Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_g=
rp to fix UAF")
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Tim Chen <tim.c.chen@linux.intel.com>
> > Cc: Chen Yu <yu.c.chen@intel.com>
>
>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>
> Please submit fixes like these separate from your series.

Thanks for the review.
I will send them separately.

--=20
Regards
Yafang
