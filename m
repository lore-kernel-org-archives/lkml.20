Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29422378822
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621884; cv=pass; b=XGLNnZ641uohuMa811ohbNN9zrcQtsMY+tmLBi1lESZ6ubx5UaiCZAeQCmlafxPPjykSfoj6Vv2B2oHrp/US7n6vxKoPO7F9qeqWQABes3h9HoEfpy5/rGsxH+Bocfc4RfkVGLrYs4mmjXtG1F974R5OLQNIXxhxWcWyaWMv7J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621884; c=relaxed/simple;
	bh=Im1NAfF0TnV3CDpW6n2DT1Ez9Xb/l8e1pIhIoS8My2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qgk1XfDbaHbo65iF6L346Qhl18QqhWmaFIYukiHSg5dp5t5DDiVC0dWKnsPmKN1cnn0HmK22EysY088cGN+SGLkdvVINilq45FTbJ/yfocARTdO/UXBRB2DEVeCAiDsDnx/SPjfskz0KQgDNooAWnTr021xEnKhTh/sHPYfr1g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sZqVXuoc; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sZqVXuoc"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cd1d9d66c9so1076172e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790621882; cv=none;
        d=google.com; s=arc-20260327;
        b=gvCGUj74Qxqw8bMFDSzRZoIs8mXH3VFVpkF90mLRUzCFbB/iQJX1S2jlWGlHn30Xbt
         PUObHPz4HTqvfgbgNAjgXK1i8EiucdBBeOmzU5Ah4FdhLhcwtgIneMpavs1IMHAU7gk4
         1HxIT3sHXTuXmKT/ZV4J/q9odrg5KcvypZ1eL+eLx128beP8Wk33LhNoBzHZyHR+jZt3
         hL4zFEi5h2qrdnI/QPHWRzZ5F14V56MiyGbPlFjR7i2n1Wvo1odtuvtOYpXBGY0QX1zX
         5d9B1iMqRvJslDhP3vM69M075cBIby6KAbuuEgymgvc0ckLMGeqykdLLQdbdy0kVKvQj
         0SMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2cIO50UyguhSiU6G2c4CxKHoZiSwBuo4uMuhhmaldo=;
        fh=j+ByBT5YfvAxcbqBxuC63nk7PCNzZBVWloRRzjWBkjo=;
        b=B1QV6LrCqNexov2OTRKVbngALw/7cps5H0RourA2Yjzjto8/CFk/xvZarw69BrMHQ0
         RYDd/sUhbF01sxMI1P2wP2DLirzS2Ffl4uB6VIie3mVShV+rqyjca18khcb3OewPa7fl
         Y5txrhCMiWLqDmbX/zz4X+qr/GnECfpgmwtcMPX1kW+4sXbVcwDvpMFny+WjlT1mkX07
         tD5qR5JsKMQ6GkWD1CwSe+MX7T92zOUbcwerjcCV1S/HO7WZgi4If0/dWCI554uLb0x4
         QFSLEpNp3m2Vb2nJvubHZpvv16Is/EO8kjdjuzp81s2Evda85gzIFn+KhC3LBl5ze/61
         nFmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790621882; x=1791226682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2cIO50UyguhSiU6G2c4CxKHoZiSwBuo4uMuhhmaldo=;
        b=sZqVXuoc6h7XgKkZ6kU3dpZ6kYOv6gI4W9xnXG2hM6Z1O344XYWhjK/63pN2esHBRI
         H05fFVuuhbEhKGu8CF+3nhPraTmlbDyN6xSLF+ayaP/3m3HjCX4vR41ye7bTb4EKQGNS
         QlRlWu0YUff0rpSPmNpr4vOub6G6TwpULNbKe6P3TdmZTVoItMEeaJ93cWPMLRq1hNjV
         vLnjnFjIv7byHsvBAlsQ2FCpzAkSB7vvofs96fgARyVgszBZcDtkuxkjpEp43pwP9/xU
         AjZM/ObJ0zTOUWAmiVf/sj/7CFQvBt3D6zFXx9aCiwjBh3b51jTX0pUKYiJjseZqB5tr
         dm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621882; x=1791226682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2cIO50UyguhSiU6G2c4CxKHoZiSwBuo4uMuhhmaldo=;
        b=wwwPUhWrvcKYbwyItnjeR1WZ5VOU3RzGGarzqssL63I6yTKOtsbwJJy/feHoa2SLns
         gousC9Ix3IxYWXN5X3RJ9Xy7KgzumDrjcZJff3+tBnA83j9KoADYpKfqhKxB2seilsFZ
         9YP3XNyrpGd9afuVoXLyw8IIQhQbSbRBWNqm9J+7dNBGxVhGV5ZPnTjSICBzhs/V7NEN
         AK9ybdM/UUDN2NurycPTj1xb4/3fg5KV2XPwCu7fsoJ3b5/AN8TqI/vf4+7sdbgOeLK+
         8uGOK5ztE1a6hD3wMa/jGkmvkoP7VPT6R8N35rZjbK0ctgX/+mvk0aogAKLd4G855MhE
         OT6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzblH0KHXu9QL+keC5cWbg8NREVgP8tlLp8k6HU/ORwaBpGMBggSChsuBm8kqwquOAzbNnxbsxduKiJSOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm4wrTib+j8XXVLjeHO8hxWAWWHeflwOimYvFjXMgoveecrivb
	oFU380n9PRtHSwiHmS27+s6WDs4C4cuR3QjdFS/8aPmo+lHRPApex4X4405FJ3+P00OwBsNqtXf
	jwlixmIvlUcD5eQninBK7UcwpB2mqqrapyiDPrGE=
X-Gm-Gg: AYBFou3Fz1aE/y8UlWbn0AB+Nf4tZV+nQkVR+XfK5gg/gZbv4dXPlWbPpopDKPy13N2
	zsucwySuP+5fcolhyFzDm7DLGyyRT1dntuiymPgYfGnX2ZMh16dFZx/5T2X7xgbLhCZ5i3rLpUs
	cS+hMH/bCuoHnLt+qhC2lYQAzFc0RzBrdPSDxVQp7ks6ZcxjMl35avh45g4uFVvvk2l0kgXIdF6
	jyk9fwQ5drNaLugI9CX25978e5ViZGXWWhZODzPgYZuvhCHC4xamdsL14CFA4aGSdDCIHV4kw+C
	d/6Ptjv3bSD+N1Q0esqpzlz1YROZGr0sC5mlNaMQLTKgdVVx9K2YxwYKav+1Lh9FNELpCEk7ktL
	+bOQC1cub8M6ow7TmT7EO
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7af19740319mr4949454137.0.1790621880968; Mon, 28 Sep 2026
 11:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928044513.1330392-1-morbo@google.com> <fb409745-856d-44c6-b9a9-387bb7499811@opensource.cirrus.com>
In-Reply-To: <fb409745-856d-44c6-b9a9-387bb7499811@opensource.cirrus.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 11:57:44 -0700
X-Gm-Features: AclHuK_sC2R2kVmE83msZCKkzBaFLDE0QnCGPY-epZGSZc4zNKjrTMXfdmX0tnM
Message-ID: <CAGG=3QWAhuHptY1qGsMoP_s6rkBthx3nWadPmYQdjWRMcRCH=w@mail.gmail.com>
Subject: Re: [PATCH] firmware: cs_dsp: Annotate struct cs_dsp_coeff_ctl with __counted_by_ptr
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:51=E2=80=AFAM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
>
> On 28/09/2026 5:45 am, Bill Wendling wrote:
> > Annotate the 'cache' pointer member of 'struct cs_dsp_coeff_ctl' with
> > the '__counted_by_ptr' attribute. This allows the compiler and KASAN
> > to perform run-time bounds checking on accesses to the 'cache' buffer,
> > preventing potential out-of-bounds reads or writes.
> >
> > The 'cache' pointer points to a buffer of size 'len' bytes, allocated
> > to hold the cached value of a DSP coefficient control. The 'cache' and
> > 'len' are initialized in 'cs_dsp_create_control()'.
> >
> > Every subsequent access to 'ctl->cache' is strictly validated to
> Is that true?
> When I last looked at these __counted_by they were only checked by
> a subset of library functions (which was documented) so I was still
> able to write code that overran the buffer.
>
There are several flags that need to be specified when trying to
trigger an out-of-bounds error, like this:

  -fsanitize=3Darray-bounds,object-size,local-bounds

They should produce code to check each array access if the compiler
can determine that it's from a struct. E.g., Clang probably won't
generate the bounds checks if the field was passed into a function
that isn't inlined. GCC may have better luck with that.

-bw

> However, recent compilers might do more checking now.
>
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
