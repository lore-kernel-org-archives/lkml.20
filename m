Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35F386555
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494737; cv=pass; b=smObOIeq1zqCE/6gt9N00q95OOAlT8H4itY6CqmjAiTle1lCIzupc/hQQOWd6jDcZt3mC6zWI3tU9TzdnliQS7Vy3pROMA3SdAlE6AopFKPDH9bqV3vJsXRVV5P6BR1HLR0RiHQ+84tDwTIw8nz1ijzIBCswsTqHFj5mxDet+ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494737; c=relaxed/simple;
	bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqTbYSkqbJd75iu2xzZMGS5Hn5Zaaj5+65PxmirdTNoVkEwpyIlXsNILgujZvJ5B2z8kUPC53hqY1JZitQPsy6lWpcaqqjAvMmRE6O4NMIiZBoZUPEp8cGMa8KaCAsLwAvfSSJjkYeaECOlYLnf/ZWOfdfM9dP6W02Wt2bSG5e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs9kGkUX; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs9kGkUX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so3083895e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494733; cv=none;
        d=google.com; s=arc-20260327;
        b=bIvdacTQFS6riHidSjGpSkOTzOOxA9u8ebr2T6+dzTFA4AicWv1HRnRyhuEp/eFKLY
         IDthuux8E/0IQvD9/C5hJK5gbw9hul1S+UuFC+43qdFyu0W2HSBgUcTxYjFBnJjlkrkW
         BFYtacfCdWn98AJERPJ99eNIiLvrmI3aabaasyemHaLbSWXwYgVCdAS0/+AqlOEXS3xi
         m6JEHFpwpTGblVqNzAq5pEMqk5CqBhcmE0zJSj8ra2wdGydbGUU+w5NYiUsvL7KSqtTm
         RH5hCxzaFCVZyTMrAmLu9dkYGyjr0gSb2xzp8htnpzdwl4bY6TviV6aP0mZWOFVtP74L
         W9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
        fh=f2dbu55GaTVDy7gzdQ5e2mzTIhx68OYhYFu21PLAbG0=;
        b=XvL5ixtB9QSs8AdnMzrC0lXfFXK5p3vZDtAQ3A2+OBfpU8y/CUlC1KOp0qyOuUnqiq
         Jht08nT8k9TYbeod6HE7/rxuZ0OPdf6WT1N6iUAtIN+3PlYDkc/b5tF1ZgtFE2jQfB2W
         0ej24zIpIRNewGd8tDqc+OAmQB+IWzPIbbVRKcBjYw7Vqs7gWRmp+WfXRkt1oDw92CTX
         cHPi7yxPOrpNoz/5vcDl+YpapdAkWyCDiTcRRbaD68nAW5XKaDgckiiakP2fhOAj8j/g
         skA2Ej71afeAwBuMiuUv3CVEjl0uRpeUvinLqO/3tfHQAqGpSbFGqXID5cN6JKVpVVtR
         0aMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494733; x=1792099533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
        b=Hs9kGkUXVDGQNgSZg7i6qceK2VM4b3QhfkJ9Yn6EqZbxFRE99MYpBCX2GA5l8Lxar8
         PdvGoA1x7DRePTWyF+i5E4xv+2AaPo7WygKG7xjN59vFTcWJxNZ5eUEaJ+3WUoBzM0ae
         cVoHCr2FvwdYydBX9nl99UX1SyYxWQtLHqFYlZJmLH2sNQaY8jsrUA60ZjOTlQsLsmdJ
         spkO6Ke0PZeKs7wRH3/bXuRsNwOd4aa4b8rhRqDwLISs/y78b9usAn/b1Ty4KxwqGCv7
         IzUurzv1kRdiEa7TdWev3fxl5xjpk36T+3DaKzQ+DFTbcL28OVccwiSusdFJrJiIoosN
         63XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494733; x=1792099533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
        b=r/UTIKMBIpoSuo3c3js7RtzWpisggO4/PSE1Za4HSTgtLZ7SGC4B4BP2vr1RGP9kPU
         Vy+P4UoBKF2ccPSc7VTwztI8r+kBqzgNkARSGJdHxOCXapaL7xC0HM2MMts+/WxqZ/L8
         z2JPhYySrDLfequQg/8hZvdTt+cLJZa0qF1Lg879MHYBI7BWETzfo7Epol3g8rcE9k24
         Cnw/D3JQaPA4T3StmV9Rxs9ii4nsQgbbnsXrk0MTGVLQACmdJippmsiK3NG4bx0RYQbl
         PJTQTmu7i9tlxZ8OzpNfbnXDTNluUsVIpb204IQgATOO8W1qtNJqPQ0MKTt4RDAxGrgn
         1JTQ==
X-Forwarded-Encrypted: i=1; AKwUvByGF1dHNctSg0fgp1XaFU69pI6muEu3ljpqTeoouIYj2JRRd2bqkb1aLa2jMKvT4cisjuSIMVinRiyEocg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7VMbsr0leAl98oD6k75AhvjkoDUIp87NIqbF1BY8ij7Xt0+Cu
	UY+K5nGGubUtiH+QpA/7KjJ+/j402vm8826D0pWQ2RWmdyl6oVz2uunYw1RCtTeoKx3UQJ+dFOe
	mL0wv+b8Go8gfbAM1SIxtzKwp7e3weE0=
X-Gm-Gg: AYBFou2eyJGJevKiIvjnsfuGdaB6JfpLSJEk3MRw6ovIf0ZFIuNylvTElGqGBA81dF1
	GdSinT8F0LcLMT79nfvcGqrLYaTFy+KFyuKMPUtyoFpD1+U40RwwSRivduFqcfc5WCTD3nGOKNd
	xed+2sIgepp5ylObsvDayzbGhNF75u0odvJ0Hd4CTalNUxMaxyvJ/qwWLe06fnJdpS9q/4l4TSK
	8B9twZ0m4+Wuo31P7l9v6snEL0ChzValHHVdBovj4r1ZY3QrX35DI7RzCaTCHzwj2xipeKRq+tl
	poleoxKOop9k7NY0OLFNKEQLd3geRetputxPcMUwQjc4o//APpampJlHAUzwz26VzXAT4VyZrA6
	xPDVqLGE1cJEDyQ==
X-Received: by 2002:a05:6512:a81:b0:5ba:35ee:bd96 with SMTP id
 2adb3069b0e04-5bcdd54b8cbmr66712e87.41.1791494732764; Thu, 08 Oct 2026
 14:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008195608.965266-1-linmag7@gmail.com> <20261008195608.965266-2-linmag7@gmail.com>
In-Reply-To: <20261008195608.965266-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:25:19 -0400
X-Gm-Features: AclHuK9sf7yMp3FZjXD6vDdr8J77IFSBgkUkzbBb66SHYetuHtwbzGP3_Y_Xu7A
Message-ID: <CAEdQ38GCisZE83bOp13soyDjSrvprWd+avmxNONb3nee4oOUBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] alpha: load the MMU context when switch_mm()
 switches the current task
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:56=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> ev5_switch_mm() only prepares the incoming PCB. The context is installed
> by PAL_swpctx, which alpha_switch_to() issues against that PCB on the way
> out of the scheduler.
>
> Two callers reach switch_mm_irqs_off() without going through
> alpha_switch_to(): kthread_use_mm(), which borrows an mm for the current
> kernel thread, and sched_force_init_mm() on the CPU-hotplug teardown path=
.
> Neither explicitly loads the context, so the task can carry on running
> under whatever was loaded before while current->mm says otherwise.
>
> The stale page-table root need not be swapper_pg_dir; it may belong to a
> user process that ran on the CPU earlier, and the kthread's user accesses
> can then read and write that process's memory wherever the stale mappings
> allow. Translations taken that way can also end up tagged with the
> borrowed mm's ASN: ev5_switch_mm() writes that ASN into the PCB, which th=
e
> next PAL_swpctx installs against the stale ptbr. An address the stale
> tables do not map faults instead, and since do_page_fault() resolves
> faults against current->mm without reloading the context, the same access
> can fault again on return.
>
> sched_force_init_mm() needs CONFIG_HOTPLUG_CPU, which alpha does not
> support, so kthread_use_mm() is the only one of the two reachable in
> practice; the fix below tests the caller's identity rather than
> special-casing either one.
>
> The scheduler passes the incoming task, which is not current until
> alpha_switch_to() runs; both direct callers pass current. Test for that
> and load the context the way activate_mm() does. Both hold interrupts
> disabled across switch_mm_irqs_off(), so this completes before any
> shootdown can be taken and needs no asn_lock handshake.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Matt Turner <mattst88@gmail.com>


Reviewed-by: Matt Turner <mattst88@gmail.com>
