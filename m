Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167A3914EB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048982; cv=pass; b=oT+FhBOQ3P9o441Is2umLyJXtdvywPlZ3SY4Yxzn7C0JZJURRSjHlKPKkS672nwZK7Iq9W3ZdYxb0T+WN4td/R1jUem9KSLelMfxktz65KCGF5lx7pLTqUR1AO9biMValVGNARdDrF5eWGT+QwgAqNREiZNkc1s9RRaR/zgCIP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048982; c=relaxed/simple;
	bh=AVGS2+zsEMRd39ALRXdLR1/q0pZdvoIhDfXKsnzunTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfmmDNmIlE4s80+WAcy6gTKCIRzftm4ruHAPnMYrq4F/g7SPIkZ5RlLd6IpkcX01BcABYHyXwY+8zITo012qtufwD4OEGtDjNuUprDrFaYuuU8V58ZHH14D2bWvVlfjxIRqiDUiZILlSEbiYherEa+n9ExyRTBAlpVOdffoSLu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHYYfC0I; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHYYfC0I"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso88430166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791048977; cv=none;
        d=google.com; s=arc-20260327;
        b=gLr9fznWp0ygNEbu+H6hE7HohFXuu0zWVcjBtAG/RKP5K0PvIvDl/goC3NOoCi3H3h
         N6xDwHdK2InTD+9fXVfmrNa1yCNel1Dht5hqQj/2t92u4tLWE83ooASUkJoRn2uMfO5f
         zcNnMFu4Px1vWYzxzvnn4SD0GotncYzU7iuSOCwlKTgbwbFFWETKligdY7J3CfYyhduC
         0zZ8phVBeJyqk2Xtj2mIl5toYxeMsvRVvM5+5UJ+z0ci+5t1S6WCMuYflPMk66UR5z0m
         ABwVcCbMIK4RqzTznlk+A0H8HsRSIoP/41HD450mEXDyekC1HOfy8zGltnTsxVIc/yGy
         eGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        fh=nG5j+aAPo6qeU+/s9NjNUUOTZbpjy77calA7wI4uh7U=;
        b=BTT6RHMDeZYIs2SbSs+lX3ygQwNTw8FsCfOb50NtfvidfyYByYt39nRI8wSgyiorIb
         lm/NjirlC21CV7o3cBqMk4zcNm+0Y0oQQgykuKEA2naw7As7xePGg9UDddKvedjoLfl1
         ayQTbaWSoiCdqp4kxpp+5HJqoWX3lNUgYLuKQmkjZ2oVZod2s92fdZCs13/6ugpsElCH
         kZ9jiw8ny/HWmRJKcpcd1vzIlZGlHikc4WNiqhljMIZkfJA3tkUxqRd9OtQb8M3EWN1o
         XD7dFfqpH/r96H99Bt/eLb9w7Q3Ko+T7bmmXDxW16qDFjg2AtwmyabbWTfuTUp55VIJB
         HM6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048977; x=1791653777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=eHYYfC0IHx2Yg0EW/8SGOrvYFDQSoqAl2MMo02lXiZ3AxCnieqqLKFx0hBNnYpT+Cc
         +RIEfk4rMC92xtaQC2OZowH0rM41qjW0hYVutk2Bim5FHHVBO9qwiRroDWFUXmplNVKe
         EoNJV2TfTnchc7ko4/EoM0t68yJ4JFdR9bosGbS5PrJmoqjvcSPyEIHIWOC1Ei+7nQJs
         oWyly7TBte5BA/y4nNvx7c0K8gQtpNVW1c/vKG8tO31PyDlxZFltzd17kLIDGeqidt5h
         GrjdOCC12MYvvZfSq7LtKycXTiieQLodj4LA4daxzE0BhjKHTwsQeEa5JFL6JbC4p33f
         RFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048977; x=1791653777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=qLjjb3GMmUdPTceLls6L+Up1Q5lkxZ94EBujwmB5zbvueylwy4mHf8oEQns36a1uqZ
         F5OGpbT50dWymhb8Aa0+JnqB823vetdVA5HvbfnIE4mjK5bpVtHFekDS6YTTrGTDvL16
         NqdjD0PzCCwAOnHcUyqNpie9Rf5/hINgGazIQJUcT8pVQnZo1cUdET/A3wJa3SE/g4ZN
         acrN9dSS0oQxce8e1dAAwk9Js8H02wf3Immhd0s20lk5fgcj5zRJV7+u7q53xNMIOzW6
         XJKHtICXZ/mGdZWvkYUbrCp5UNa++5hzcAKMI6YDLnZmAM156aWMQGDA+jJ0cnJMPk/v
         B81g==
X-Forwarded-Encrypted: i=1; AKwUvBzYQaQUdRzysEchQpV0gNESAPqmOkMYSLKcYRPzN7OlxvLinTSkoTFqLZCqjv7sil5EyO1dHJhcSdtXCR0=@vger.kernel.org
X-Gm-Message-State: AFuF++kNMuuhzNnn5CipMHwOSFzq1K8orUmKrbm9UESA0N5PxwdNf0iA
	cMHWCNJp+BLAiIr+K7CbjeMhNCDBYVUFVbPPUyUtKH1+uRlszFeVqCrcuvv3Z+AxIYZwXf2ehtR
	LkBW1+UmZYH6aCe+glppv/wPvjAtm9JiVdxEzVck=
X-Gm-Gg: AYBFou3CdRK1J12XO2NF1z+RERSNOaU98bNJ4WDpF1ivdhnL/JqxjqzIv3QLxbM3ey0
	O/lLHDggyGRPeV4Xf4Q5AMogFbk/ye9CQb7otyCA4aNq7z0IBNUty5VYp587VRjKoKqtJstOCEs
	iIUCi5JXvlmLl/uqHtKyQTpBvIFS2pMhrjcPmp9ZZ6S2xdw15EbRYYFQdf+4kdU6vCLQ3SK++Vg
	HMMhNSAcBO0ahebmm2SYPbJC/pA/QYUFB2igjfO8FZfKC+4W8UgwtRTvuRveMLSaeypyoh2OboS
	Ez7g95/vEOtZFWeDGUPxgrFx8Bee9CSUvkhCtbthe9Zyec/RM98Oxbe1nzGZEC+4VUjB7I/g3NT
	tLWwPZ9WIpRXthjatcovrpToLcbGP2KYIvpl3sWRJzx8Q89JxbDST+clXbsry+n0Wm/WUoRpIha
	Lr+mumsejQ9F5uhxUmEtI9ppaFhe8ENrMeJfSbp107
X-Received: by 2002:a17:907:7b8c:b0:c2d:fc0b:551a with SMTP id
 a640c23a62f3a-c2e6e7ce8femr227244866b.0.1791048976875; Sat, 03 Oct 2026
 10:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:35:40 +0300
X-Gm-Features: AclHuK9bpapDMgc469XMoVwaBwPajoR_JzR60Owqy_i8pAhthfGXkoi2ZLHq1Yw
Message-ID: <CAHp75VdWQZSsign6YBM34UAtis=Jj5ENqKcNzkhW4vS=v-bqmw@mail.gmail.com>
Subject: Re: [PATCH 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps (gpio_generic_chip_ini=
t,
> devm_gpiochip_add_data, irq_domain_create_legacy, or mxc_gpio_init_gc)

We refer to the functions as func(), like you have done above, but here...
(No need to resend just for this.)

> fail, the error paths never unregister the chained handler, leaving a
> dangling handler that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.

--=20
With Best Regards,
Andy Shevchenko
