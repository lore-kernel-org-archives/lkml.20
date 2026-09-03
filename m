Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BE4A0EEC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470794; cv=pass; b=rk0BSW30XdkUWKwUojThL2IpgwLwQFGB6/qRFwQ6lnCzLA3ltkHNvOIY7pCp6ukacB/Q+Nbuze8d0jPL4gOMrcqhFKNwjz4DkWs+WwjXDmzbCaKJO5c8OlRvpPvG7AnV/W6wlcIlF0X9JxAnpKCJydgCcu4RnhOMbqikinYSziI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470794; c=relaxed/simple;
	bh=unUAuMwyR9D1haWKkId+4CIztodX4xmcY9SrOCNP38A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL5Hf0ZofbxM9b/KKP/faquLPp7CTX8f64NAqFKYuVAbh9/z9FTTYWG7wjdqQh5QKupD6qHIBer5YLd7P+20uIGkSqGXB4pfSZYJXYmEVDfJhgF+vpSBLlyxU1hz73wBo7+6z9IMwVqfqKmJp/Dg8K3ZD33ThBP/HMEncEvBom4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnCg5u/Z; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnCg5u/Z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so393625a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788470791; cv=none;
        d=google.com; s=arc-20260327;
        b=odomaWvMjgexOJwpNNbwgBF8ipm/haNiTaEAnjl23T5IkkgytxlJRc+r8chp30JHRI
         9JqOK+oedzkdC+IiLEkGKkTd5IQ2FWlAVzv18hL+paJ2z7Y/HuFaiSH/vyEiwxmRrk6R
         aFwgbVUgpzZu8w9FRfzaT+e9LnjLxtHFrO/wNAP+3zBV1N0VR5XV/kH5PbUlAOy59oW+
         KFGBEzfYNwFsCvjhtkxQ0c5ggPImJjmAYjmG2jpahRYxOTa8n5BlUTOM9B/DFsEArJwu
         CLdDB3BgJqrfl6MARN12oBd1D4IzxPb55d+nuNRY34+xoy2b8H7your4oaAAKiaCrw9W
         qLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i8S5ooVnhB3GMHix7Xt1yk3iIO8ygQJRzi4O8FDpif8=;
        fh=3u8L9aG8eOjx6nF/13YYdfrRqAC1mCTIBF2WQdJTLrc=;
        b=qaLCYtGNZBtCrJbGdIGFK2tFWcLLU39Kj4johnzhHuTQbgiJmLqx1ajPC4VJf8azyr
         JCmWqNL/qHgmd/o1VDkC2B9j5DM3Q0oOjmMnkEgMMBo/c30ELD5Qf7382TNuqm8q6KuR
         0zFxdBPMGQpRlrgHksKQ7GnCzXdxjXrFbrDEj15l3jsrLZCl2r/NuRf78eGtAQm4kp0B
         1h83HJRDni7IZ5NFJsJ2y3R86kia0+T8WolpMQoxn5tpFed/8w33vg/VzHQnYOENI+wN
         mfu5PCXWVJ6CdB3/REQVpRR+p0H8X96hSmcoYpSAOWXpxceFVMT5UzxOJJpL3e4MgtWC
         XC/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788470791; x=1789075591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8S5ooVnhB3GMHix7Xt1yk3iIO8ygQJRzi4O8FDpif8=;
        b=BnCg5u/ZOTCbuAkqRURzuJ8iSedhuWRNnfmlUQYE9X9A7UXJN8eXFtE1uch49/Xtt1
         lCPqDp4JqMLOJDfkH2R4XZ8CNfBu4VCNGmcDIJuol3eiCOv5H6dggKh5YnReiLx+D6YZ
         zPg/Noxht9EyrqP7Cn/GKmuyJqKTvYR6UlWvzXge6i8mnmQm8TP2V38XD1CqpPkTBDOo
         5jfwFQpNXS0mZGKrIj313ZNmuEbDXnI9c/usklz23XAQkWlE20aeTvorxH94rp7J4QMc
         5Huj/V3lyLyIFhf3zCA1nOmkhA6AlXBR3vxfEMsJ0av4alH1v1b53T3cga0wS5IReA0g
         T3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470791; x=1789075591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8S5ooVnhB3GMHix7Xt1yk3iIO8ygQJRzi4O8FDpif8=;
        b=XZeOBDgh2/l2q/b1hNXdZ0lk1ctD54FrLVXBMJXj1/cdCe2lTHB/ZmLubamBP1UoA5
         nTF26Ve7VQCERj7qom9D8BMAUzzhvOAPklUtlphACIqQldmawm+xe6cjNUWrlkg5ecwc
         zYdDvdHMkGGRacAhgzGn22fLaoInSBy016L+x0scFQ7neJrg3B8FHrXCJP3kKdBsbR5+
         wawZ3XOLfIPs/1XgG5QlxP7UEsIAeeu1LmzLVOhJ2NOno1igTTnSGSSP5IbV13dhQPkJ
         86Gxx8b5il6IVy6DwfAt/Vxu6srNFXZx74lGZwdtMSClfRgRE8gshgtuMzvmtJJHuU0h
         No2A==
X-Forwarded-Encrypted: i=1; AKwUvByhOzKcCO0DO7q+02SBKJ+ksNbI7obdwyGv3isTXtAQWlPQCE/GQD5mcdpfsh+c5Wn2/2e1ktC+iHc8lBI=@vger.kernel.org
X-Gm-Message-State: AFuF++llaeavItEjtAkzyf0uThpVics4hK2HteznlRBZBd8yfNAnS8MG
	yy8tCrE9AEVSDM670c4kFtkZnvZAc7iTQ5z9LcDZF/4xwuDpirnEC7qghkR9k6BaJ99UpvOQFhC
	Ejrp24t5Qz+P1vnU4mkRKFBagwdpFmAo=
X-Gm-Gg: AYBFou1fihAoOb1tIE2H9fsvXj8GITgMlSInwBOmW1K84Ua5oiWZmPuKwgSB5x1xabK
	XNkpzDoEzscQZFUUINu70ENQ4jVm5Ylc0CUj6nM4kRIwEUp27yBz6jD3WvAaQiEDjINDXqsjZSh
	CaG3V0+jgDyiIpHKIZhPu317SULBbRbjPd9ks7GEGvKOyLXF9H8vU83H7ZRgv4LuKQQ2MbdWkYb
	PmFGfUqEf87KgX803+g/StezeG23hLbcJzKd9QHFj/AHdpZUNRYm/sAaUH5vlwKi8p7JMDt5eFP
	V4sI4W6DSsnkS2hObkOK88TPVhoC4hKm2tjMdpKlnpXae7Umq50ag8A9iw2AossDOKYBlXA6u9x
	vWseptFbTefJFkPuW6n9nwlxp5b2gbln2JJZxZhOo5w==
X-Received: by 2002:a05:6402:2549:b0:6a6:1c30:bc4c with SMTP id
 4fb4d7f45d1cf-6a7e8d25de8mr442689a12.5.1788470790663; Thu, 03 Sep 2026
 14:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <def73d988ac3cee7f6454637902a296648c25d0b.1788277742.git.mattst88@gmail.com>
In-Reply-To: <def73d988ac3cee7f6454637902a296648c25d0b.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 23:26:17 +0200
X-Gm-Features: AcwNN1WrLaaTmggLPXFT6Qwv6G9ImfH2P137GVtKWBCi3FUkfl9jBwEDIvceqDU
Message-ID: <CA+=Fv5Tjts1TYzErVRkMSOk_MjShAMefB6MPejsmbRnHJn7TAg@mail.gmail.com>
Subject: Re: [PATCH 23/24] alpha: select SPARSE_IRQ
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> NR_IRQS on Alpha is sized for the largest configuration each platform
> supports, and for Marvel that is 32 PIDs, or 32784 interrupts.  Without
> SPARSE_IRQ that becomes a static irq_desc[] array of 12.6 MB in .data,
> carried by every Marvel and every generic kernel regardless of how many
> interrupts the machine actually has.  A real ES47 uses 87 of them.
>
> That is not just wasted memory, it constrains where the kernel can be
> loaded.  The image links at a fixed 0xfffffc0001010000, just above the
> console's low memory reservation, and with memory striping enabled the
> console leaves only about 16 MB of usable low memory before the rest is
> relocated to an interleaved aperture.  A 12.6 MB array of mostly unused
> interrupt descriptors is the difference between fitting and not.
>
> Alpha already goes through irq_to_desc() rather than indexing irq_desc[]
> directly, so nothing stands in the way.  The platforms do wire up their
> interrupts by number, though, which needs the descriptors to exist by
> then, so provide arch_probe_nr_irqs() returning the machine vector's
> count instead of taking the NR_IRQS_LEGACY default.  Without it every
> interrupt above 15 would have no descriptor and the handler setup would
> be silently dropped.
>
> Tested on an ES47 (Marvel, 2 EV7z): boots with all device interrupts
> working, and .data drops by 12.6 MB, from 15.7 MB to 3.1 MB.
> ---
>  arch/alpha/Kconfig            |  1 +
>  arch/alpha/kernel/irq_alpha.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>

This patch appears to be missing your Signed-off-by tag.

Tested on a two-CPU UP2000 with CONFIG_SPARSE_IRQ=3Dy. The kernel booted
successfully and created IRQ descriptors 0 through 63. SCSI devices on
IRQs 19 and 27 and Ethernet on IRQ 43 operated normally, with their
interrupt counts increasing. I observed no IRQ setup failures or other
IRQ-related warnings.

Regards

Magnus
