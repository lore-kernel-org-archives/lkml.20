Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794654995;
	b=YSkFLYdiyKEtIphtqxmPkMPiGRHIPJ0fkwQXE8s+BeHeSW2vURGPG5lrcvSrLOO+P/o8
	 53Y3FD7zU3WseWIq+0vZhl015hrpXRhzlDT0ftpQzquyuC2nxTnx2zeLVp+qVzuyY7m8Q
	 GwUvZQr969PUZDILvgudKCRYjn4RdKeDmCE3xMv4UNCuQGtLb17ciXUvmNccXq5lntmTL
	 sY8zk5Fl69snYigi+CqtFc46jxgC+Fw/6El1phik4lE8e+2G348tuwosegu/Hu18AJ2mm
	 4b0iwsWPvZzFRibggoAd7CnTmftTp1b/5a+cf0G4AgBhXAr2UQV5jTG7snJras6mKJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
	b=PcbFcfovpU/eyNRSzMWsGZogkZmayTbk3n1bp+Ep+zfsDubRZnHiRyJl3T/3CuQ7ocgk
	 ubZvtoyMc/wbq4UCj7wcCFdMLHx010JIR+lTGmF52Zycgqbj5dXgWDKoYPvBd/qirnygz
	 k9VQQVgXb2bG18lqtC8IN5Dqz/TE5LDJwuEomwSKebt9ZC4dTjyNhuaxiFtpr27m+LlUN
	 Czuma78uRUvYa8Ae2SEgHPuxK35LaA+ngT3IUwCZtEATvhrYC2yyZaLfF1dk0WivY3Pxn
	 04E705RUAAKYf1QrRFs5UXuTXQ0ZFNeR5h69BXKszNjPNqGWFJX3X3TnLe9KALwTE7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLJe2tZa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461B606A8AD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6461B606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLJe2tZa
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ecc11bd26so234568eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:16:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794654988; cv=none;
        d=google.com; s=arc-20260327;
        b=K1hBzfG8D79bCcUrBdrywrIddgFvMzCZG2iIBdxwSD3EonRNXhwo3aIBTm97Fngr6e
         zpCsoe8rP6djdDOeD42Ij5MzCUV7ATau08HaCsCzxcR+ENq2TcGm7vPqy1D2YDDYiIUf
         5njwdbhYW2PmjRxBdNttqqcZ9rSfLZNj6SabX+dxny2qDnUjunvblUbLv9loZePrQ+UX
         aLl0bLYmTdfcmm6l5oq0gC0VPxjzO9UL3vaX0f2QntC9HVl70QYW1Gq3s68nOYuTB/O1
         +MWCYpvowT8hm2zMdtX3p5//hUAz/8VeBx+ryCc/lDOp7jHXAPnQ29k357cW4zH+oqDL
         kZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
        fh=btUrjB/kS34Js6T8yuDnhgnhnNHJYjHqg12hupxVvMM=;
        b=LS11K1xV5Kfle68SGcjDrvHG6jjjqEQCFMCDx2iiEdZrfdNIdIqsUH4fIuJ8Q10qiM
         L4XMfrGsJjnMSq3X8/7aQF6Hl/yYJtRt4I++bGYH904WdGYl5GE2qh7BhelnmIZTWNMc
         hlIOlXTkz4LHVN7Aug2HijWFn8JWRL7QkUkbz0WhQ73oVJK9cNi+okhLiN+4Gg4IvNZA
         uSomSv31siQUunVqFiQdHb1qL81zevmT3reN5xwTrtuhlsI7jJe9kTyEQ4F4KTYcB9cd
         hiFfdpScA/CAo7OFWpxnSb4apXdMeqNGvHz6rv5lEr+Ipi5k7oR6U4SU8N6ibdxCa/tB
         sd/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794654988; x=1795259788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
        b=NLJe2tZas4dC5doQy4SdAqJOkCOyI+B/f0AeVx43H7VZXGCGgKCcmmy9w7YXye3fA5
         iW8ogwNITPUiLBTWZmrUzgmPfEJ+q7k2qYLRcZIkAD+AVlYUnzluVR+a8ca369CnnDKC
         HtxAkbUddwJj4aqJnpJDoYSAgRhreSiTcswsiVUxFlR9GJmBlVC94YruuNheOXn1OVZ7
         KM4qyKN85bBgNntR2xaT2QFOKQxybCuAdewLz/X2XhyJvF0JC2Vg4BaE8pNmLUa5+5GW
         6F2zcqpdmHcaUK8HFGWSD7HkZH6sHTd6NhRBnMz2FGOiyDDVsz9mFMYjQMUEneykIyLa
         tNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794654988; x=1795259788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
        b=pLJIE07azSXYFBcc5lMt21hSDKSk/z21P7Y3yaQyKBMtFoVOD0uyTeo9XzQBRFz3HD
         h8e3+cp/OiZdLL1Xr4EFlZ/AIiO1y4gEnT/yFn/G7AjFSGuLYCV6KRWT3D/v0WGrrfCV
         XUReMJE+K3H+7ctKnpKS4hg8/3541iXNerlb2MV14E9d3uMyZSYV1WGoIe8hHSRT+NiX
         82hexNFE/8s+xkv2ni69ZQCGx6btEqMmvPrG9vOqfXzfThdwCDkD4EHC+r9tPnRsWtWa
         0hRrx/8ZSJGI1/oXex5Y4gJc/OPglOG8CUcj3cq8pOdktTB18qiGkZ5fKxnhstbe6goe
         fNVw==
X-Forwarded-Encrypted: i=1; AL+hErG66YFgg4SuOQ0cmU31iApa6Rfe9o30qA3NbegSqk7boy1Fx//Idv1hYPtEBGM2xWltCN8bmNgMPaTrz5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z977Et9UX/W/fHiPkxFYyqTL0BQk2wvQVk7f9uYG07bKs/85OLk
	TdMIoIhbhHaXDQyZfURWvdYNfY1k8plLvL3IpLYXlLbNrl3KrgAXK20hoGBCSUclvc1bHMLFvIw
	EEdS+5D93ns3XrzZK+1y0tAPhdafkWag=
X-Gm-Gg: AYBFou1dklE6nyQp3+yUwsNeOF0dICCj1DLWtECKIofvQ06/JlqzgU40TVgDKLAtWv7
	if9Jgic1k7MX2McKv4yfzz4fZcApIznWym3NPmgOQbTsrmVmZ9X26VqyuSimQVmDmBSQKqWKKBQ
	+XngRSougqPIcO3YQRFKQYfXo4WRZ9wdjT1Xyqza1P0d8fQ69vUT2a2dyMrabrIdgsjTye5p8K2
	GPpbUdMa5OrZ9pL/7b/XVrE4zqQToGuoC4gtVapsQWagO+YbtdZdOnEFIN7mLTwwk2y675N4V3d
	joODUJB61lKgaDqdp7It2Kv3Vq34bCmws6fODVaMOT29JR/TbaE0fzmbU9Lr66b7g558iCB9cet
	E7h+DaK6jJSBpJTb/FRlae7tEEEnHGQ2myRR0qDOc0piaeNz4F0W6GqTDH5gdy34xJA3LefDMps
	vLxQmTJ21n0WIm92FJAIl79SeMWw8dua91bgWOI0idcaY+VmkCYlT91jHvwL7dT6OisMRLoAyMN
	pC4waMZgGzkZSht48/PYghm31NdciQkUmgM+ZrQIlM4NOFTym4E+cs84oiUSjWsATGlDLgT8nm4
	6gbfWfdZEccopmxFLw==
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id
 5a478bee46e88-37964e03109mr9445400eec.1.1794654988480; Sat, 14 Nov 2026
 03:16:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114024515.1000882-1-marawanzein222@gmail.com>
In-Reply-To: <20261114024515.1000882-1-marawanzein222@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Nov 2026 12:16:15 +0100
X-Gm-Features: AclHuK96lOhqn1CghAV94ECJPrEaox5jn8-bjo_998dUQqF5BAg3A6nFGX7-HtQ
Message-ID: <CANiq72ntx7OypsqD3QmeMiYOJpqRBgzDJv17grZQA-M5J_r8mA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
To: Marwan Mohamed Zein <marawanzein222@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamir@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, spidermana <xuyiwen14@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 3:45=E2=80=AFAM Marwan Mohamed Zein
<marawanzein222@gmail.com> wrote:
>
> Reported-by: spidermana <xuyiwen14@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1265
> Signed-off-by: martell0x1 <marawanzein222@gmail.com>

Thanks for the patch!

On top of what Alexandre said, for fixes, please try to find which
commit introduced the issue and then add a Fixes tag to it. Then,
please consider if it is something that may need to be backported:

  https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
  https://docs.kernel.org/process/stable-kernel-rules.html

So we would have written:

Cc: stable@vger.kernel.org
Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURCE"=
)

Cheers,
Miguel
