Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980D51E451
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545679; cv=pass; b=qzByxxPUMS5pQXIzTI5DVgnHWu5TemQNb8f/j5bg80EsvEhZaPaUzVTGsTX1N1+QHncDtXIyo81UuFKTCq1JkR83m8x5D4Yk0p3V1qaYOL83apnQgzIQbXbnicpA3O8MrEuZjQFx0TVqLbVYiiZKlN6UzTXGc2cuXPhu32nRA30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545679; c=relaxed/simple;
	bh=5m/pay81xmy/8S45ZPXzH94fItYQkJjMwnM4hRsn4PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CajR0lKA+ipuS7dqMOErWb/8gaGctK0nBfUcL1ASrNiI5Mf+yVOSKF3hHQ97HyZkY5pt/+WpWuG3fHSQaKs61nNKsGf+aViZI2NKnZLuCkKU4u8Ci/HB0nQF5+OzhNz2VBCL838j2fnVOEvu+xcXdcCeQZ/m8WDI4xON3a6jDpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tm4555GZ; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tm4555GZ"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso544678e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788545676; cv=none;
        d=google.com; s=arc-20260327;
        b=bYG1GpNGyKzFTqAKnOOMnaS73lX/PHSTteUhBfoKMD21IOkJvDK5k89RnGRQ2o8wwY
         yQr6fbTxjXXGPxBCfhYdj3jOZO/m6ltMPcRELEbJ/ZHWzdXgSHPHHzrDOLSs0CLqAm8u
         PP32p+9j5Yg+ZLQxuGy7ewX9p3im43vPmVP2L3slwxN6tRMsb0O2r7n58zTaCjYP642r
         WXLnBO8LB94dHTqHuh5smx6CR0/HzmF1JDrzPn0VAKZg+nOerZLUePOO6WJRGFl86dLs
         UvJ/NVbiRK4EQZRqx36dRNUowTPDAgiRI8cFBYSHWk0dYfz7Cz/16nWgEe1AoSSvOLUf
         9BhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5f1sSkMWsx0NynE5i1A0A1wBIJQk0ydoeFqLf0ZyvTY=;
        fh=N0J4ZmnxKmE06Gwq4rKyaMNDpdW/aFQUhFPgeOLMZ58=;
        b=mjbCoU9lUZ5Cswgt6heZcYFj65XXWo1y1BrOIhjf+0wmNUD+At/7+a3IxNYn5gJyL4
         EGKn8N91HB/mYCc5FguWYQghLwKEUW89aDqa0TLPajYL+Z9LMhmeEkDqmnA85NSGWis6
         Vnkq38zwh7tTxNwjjwXsJhhZaP0J6ERhRTtlKHn3aeBWgnaC1HGloC6qxRdvt0ClSKs2
         sgUtB3StSCegtBUud5wX0W7QKGam9Wmwp5oW4/k+wHXD30Kiquwr6tPm5kgVy1BVLRLR
         1RJ1slbCuszZ3rB5LIrt/vcpb5fqkDXaZNHUSGuVVDy4D/0Wi0K6C98pWyoefJJKK5Uj
         nEhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788545676; x=1789150476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5f1sSkMWsx0NynE5i1A0A1wBIJQk0ydoeFqLf0ZyvTY=;
        b=tm4555GZrmGJdnr2hCjcQSWWu8EgaJU6DCuJ95RGmpz0dKnYV9hOlGV7Yn72NAOokJ
         5pHA0HlGK+85VHiL9Qu0Wv3T6ydqdphE6rCFZZ87diy1REW6v7PRwLrvFxNiJ/e2MvI8
         5cVgO1TlLAhESrP+MxoUfBoMDm13EX5hd8seCujicR9At3MQh7/1h/fgDwcjR31ZwnZn
         b5VquPb/OL7+gYdJh/6IZp9FfOn2IZAe5ZQZwA0H2t7xTYe7mEHHdL9I2yBrTKrl5U3r
         gwAdVSy4IUepNwWnalpHRuViPJWvY9Q0oAcMX6YwEDdnAvGF8wpCxhrCn3ZwSPplNKHl
         lUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788545676; x=1789150476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5f1sSkMWsx0NynE5i1A0A1wBIJQk0ydoeFqLf0ZyvTY=;
        b=n3T0cXoeDGKowCgZtiGBgNeTeF/xvX1ytY/+ZC/Eksfr+HZsQsAgwPt8z5qjgp+4Ur
         QMVmGGXwOCFz80IN865MlfFO97GVMoLBzASKziB3BcE/wx/mv/zyh/jScsDZIVdxJXFf
         lxpnQCg6ldCPgWMLa1SWj8471GcxpoRe/C3KLRGCa6+To07U3DjQUWBgPd35Q6n+4l35
         aWMNLAPW/4xhGFp+nEbocoMTLi0kj/3Zqrj6mMD7AaMpM0ziv4c71qMWJRrXP4bIV8tE
         8XD3iYEIwBwB6keQtrSRUVQAovyZcXgeU46tgt9Fgb7CkCmhaEiRCfjbGXpvfdALh+xH
         8d2g==
X-Forwarded-Encrypted: i=1; AKwUvBwPyTzHH26Z0hlHSbnYUPjkob9Y+PuNuIJJBgTcHLidbFg1yptria8w84BhJWkj6ZV5n05dRTmf+8LDzOw=@vger.kernel.org
X-Gm-Message-State: AFuF++n4L0ZamGlxp8m+MLG2bekvfalsojME4iS3e25EIzViip30IVNU
	xO1VX74jlQJEGUZm8PoMzeCc3VoS69JBO27yMyvIaFro/RlIH1nRZ7P/Gb0XrE2HV4Jg/ZEiRom
	BOMis22jQEJgRMHL2Wnq9ojwxfL9hH1zwaDn6dQ8=
X-Gm-Gg: AYBFou10+GNe1PgnWf1uC4A1CsXPb/F7zqPmbIVRWJsoxgpaaW1MtCSNKjPHFhQjLse
	gs3566tD38dS2pc0zZKNvdAG1lafJivBWqNx5m+wXYOuUi/Rdxt8VYIdR7epomyUUBkwy0D1Q7Q
	YOEDDONlKeIFrenKOsfPXg/9cZ8hSp2fEg7NdoetkyF7Lo9qvxEXn2uCyqxyMjq4+KaTLvbX1IK
	RyKuhvSO/E8wb2PIenFUbU8PwehtTn49gC8KqZE0rrC9ZeJDzTvOxsueNzu1dAsocN01umGacqe
	EDSATiPoj5W17sf1KIaAfGaSATviT931e1rye0tOGbluFuB7IPNHd15i2+KqzP0p2BQ5WKG8AWV
	NlBRjnio9J2ODqMLYJuRSaRUmzqIASpvEHX3qdoDOADzLXZh9H45q
X-Received: by 2002:a05:6122:2890:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-5c7ed2baa42mr3536633e0c.1.1788545675619; Fri, 04 Sep 2026
 11:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903232428.i.323-kees@kernel.org> <20260903232438.60394-2-kees@kernel.org>
In-Reply-To: <20260903232438.60394-2-kees@kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Fri, 4 Sep 2026 11:14:19 -0700
X-Gm-Features: AcwNN1XbDAT0_I910Gdu5ymI8yT08JVoK5EGJlbHpxWo_G4-k7gg2DjgPv2W0vw
Message-ID: <CAGG=3QUHtqFVCEcnxXO9fan_RBT_jjWtBbA8ECpQeiC1dKMnvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] randstruct: report bad casts as warnings rather than notes
To: Kees Cook <kees@kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Thu, Sep 3, 2026 at 4:24=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> find_bad_casts() reports a cast between two randomized structure pointer
> types with inform(), which renders as a "note:". It has done so since
> the plugin was originally added, while using error() freely for attribute
> misuse, UAPI structs, and version mismatches.
>
> Clang's implementation of the same check has always been stricter:
> it rejects such a cast as a full error. There is no reason for the GCC
> side to be effectively silent about the same problem.
>
> Build tested ARCH=3Dx86_64 with CONFIG_RANDSTRUCT_FULL=3Dy and GCC 14.2.0=
:
> allmodconfig clean, and defconfig clean under three different random
> seeds. A deliberate bad cast is still reported, now as a warning, at the
> correct line and column.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  scripts/gcc-plugins/randomize_layout_plugin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-=
plugins/randomize_layout_plugin.c
> index e2bd9ba08089..1e66f45fe29b 100644
> --- a/scripts/gcc-plugins/randomize_layout_plugin.c
> +++ b/scripts/gcc-plugins/randomize_layout_plugin.c
> @@ -22,7 +22,7 @@
>  #define ORIG_TYPE_NAME(node) \
>         (TYPE_NAME(TYPE_MAIN_VARIANT(node)) !=3D NULL_TREE ? ((const unsi=
gned char *)IDENTIFIER_POINTER(TYPE_NAME(TYPE_MAIN_VARIANT(node)))) : (cons=
t unsigned char *)"anonymous")
>
> -#define INFORM(loc, msg, ...)  inform(loc, "randstruct: " msg, ##__VA_AR=
GS__)
> +#define INFORM(loc, msg, ...)  warning_at(loc, 0, "randstruct: " msg, ##=
__VA_ARGS__)

Why not make this an error instead of a warning?

-bw

>  #define MISMATCH(loc, how, ...)        INFORM(loc, "casting between rand=
omized structure pointer types (" how "): %qT and %qT\n", __VA_ARGS__)
>
>  __visible int plugin_is_GPL_compatible;
> --
> 2.34.1
>
