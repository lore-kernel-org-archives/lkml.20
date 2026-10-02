Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971C414403
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973781; cv=pass; b=LpLEe+mSzjIuK42gK/ckV2G7tQdqWFVDy4KMFi/erYXm6GI/e0ZjT0qbXzebJkjNvTC70n8yACt8f7VqixXN3y1Lg/Qz2BmFWYbFNwKg4O56Q+UluAY0+sbhKngWZJmH6PTMa1xWRuF+fRip63Br9A3BifK53awNbXKL5/26Gv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973781; c=relaxed/simple;
	bh=O0oErUdvCGd0lNeKXzKbX7E7eK5xVZTCX98mTa3dJ6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyKUnpuPXLNE80+/OFRtcRpYuhwylYuo16bonQgHJQdhOWork6vQ+5iFEBNZk1OuXREOVFMu27LG8TfvnzTaQNLjtIlQ94RG7GpO1e3x8NIr6dyaSK3qtc6TqtXluWYIzd+BKssfma5jsiRxUGfdjQ1GZKN+GOetF1cEeXxxkKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2FArZdd; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2FArZdd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so1746015e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790973777; cv=none;
        d=google.com; s=arc-20260327;
        b=NihyioAM+DQK2Gf8X7ITGxksrA2hCIX+r0eRLUMlMTL8UmZXj5bEa0bwHXgqcnXJAJ
         DY8NgP9hMkpu3EigTFiAlqT1pX/jc/kpe3m1M8VU3PBm0EiLajIOdkruymWCNfEPiSwU
         XAVRfx6rT56EFp6Ov/Lrd6vnkF5+jSTpfSIU4CmkV5Il9CIwUIXwlAZ/ePnsi3WJ2oh+
         EZl0QmDdsVTpghBkwOTb9QQAGv1RrI5162JiNg03p0yVpHR+t4DZRdHTsuxvRDlf5svO
         SV4E+aBU+Rh76gUpzqbR2ULiLdDyFhRaRjRTFPY0dHucsZWbpL8rw/3z3zIhUR2s+KJf
         V7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        fh=OtFCTpKvFbRs+D0kotSrXWq8oguF0DboV7QJmZ3nO0w=;
        b=Xh5Ru6S/I3twuCnkfFQq/cNeRM25YWmu1GFfNGvUoMDuflnGHwBgYXmvoBc4tIdA7H
         vZwBYvo3sb/nzyEoPOw2Zy6JDweYAd6mm7DVMSNwopos74oHyzyZnsV42HRizXay/rgM
         lP8C2wx1SGQuJ9iGEp7WeTkuTD7ypHahN/gaZSRkbAY6ot98zWY6C+hEnjpqOC4d4asq
         3oinc3HtRBG1qCJRC2XgGzOuhmJmPHbSJlg2p7dU3Ri8rZYeBRvE6Dxie1KxOjMp6hdL
         NFwJM0iLtOOHgfjJTEDPPgaN6u6kLvQacZu8stDbEQ+15kHSkpjfBdUgrqGR+AtjcRSU
         k5Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790973777; x=1791578577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        b=d2FArZddCvzzX4kGFZD/GcsWkEm07K7qUaqAHzs+JQ10c03/DY8JrDKmqEl2fDAm80
         z4oetGdhgfPtqX2Stf6uHwFmPns7GrbyueX6EsLB776UJA8Qe5yuzuD1tNqXjzvbN078
         QrTH0k6apZxgd7FYmnS9sZiF1Z7MN9Hfkn2KdewBCUv6VSn/8Ci4Wadvd2nhSRlGQdK3
         zuQmg8BYUdnNkeD82XjrE7tGoQqVBrted1FgefCdh+9kdZTfu3be2bWn1ajYFznwtEjy
         40teb/pvgeLJn9lxQ+wr8qKnEEX0xZeIT0oWmWUOo8oXCPPrzoD7jB1AxJt2ZSi7Zz58
         a1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973777; x=1791578577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        b=Akl4HT+2FmRZ0Nia1+TXpAfHQOFFoz0HeP5+WhhrcXtIkpL0UJYxUtyN3VQULTcg53
         Ud4wZf2E8McJJT1FPPXHYnHbzusd/JddzC5w9DBWgsPQMpV6+hL1K6BMWVUllTgRZ9jJ
         lS8pu+Qu3QrHaY1xEzNRB8MpEdU7NTA7RsKD2JTAWS+j63f4al/sLcoIcMXli9YZA5QQ
         +YAHYlHNJSYio2JDShnUAeO3fD1HpiRzGdqfhK8rEnt68jTcKlDQSXtzALeznW3+w0uB
         NVc+LaZXkH9LCDnTLrwOaLAwjM8kZOLvFH9G05CSFOHje0mAYkJ2SSEx2VfAgXw6vDlN
         U1eg==
X-Forwarded-Encrypted: i=1; AKwUvBw4u+T0IPZzCTUpfNyu9hyc8kS3x7Bje/Yt3ZarYG94ec2MoDsg06irK2T7vC3gWaBl3jOaf1uWxgPs2jA=@vger.kernel.org
X-Gm-Message-State: AFuF++kV64bs55gResL2FGnR+Th7aCoaOVCVF9qgMGqYS/SNbzCx4VT3
	j9IUq0Et8P3gZkmJuQZGaGQy/4KvZ96yuohvNGVlft1g03QBhdiRBfX+R8b2xzQffItQZBHX9kX
	yewzPnzhejFZiV7gbQKB8aqQ9fd6ANrg0FlnVs6Yc
X-Gm-Gg: AYBFou0P8+oM5FPm3XPrUF4x8+A3dvg07mRNM0FLybH72vD1Viq40TSGPO7mMtwxU3x
	4qm6AKwY/1f39ADSyTcMfw2g3yRXxkeUcbNH+wOco32vzSgGiZj7z4L02Wcnp3Hn6UbMVICjxxw
	QRhcFrZFJmWEtdCalxpKT4nl6UpIHFS7OtqK+fVtLfEMAs64BwqOirzf0bbeLp0uls9Rr6VAaX4
	SGKgdr2Of0gSWshfNUwOix4uCh5Z6NpYPv6SPaOemKAdDf00M0Pi3mxqAvz1ivA+bQpWMuG0vwy
	CMg5m2rZn7tYqc6E0N6xfoDVv4B61JU/h9R2D+V9nE3AFZedCuXCdZV5vxj8XiF/JVAvZvbbGgy
	oJGCnvFudJX1e6S9T5bDJ31VG2nAvoCTg6z3rRCmyXjANJGklBKK5rAkMWIPIEENNsxfx9Q==
X-Received: by 2002:a05:600c:a011:b0:49f:ce78:356f with SMTP id
 5b1f17b1804b1-4a0276b869fmr57980835e9.32.1790973776781; Fri, 02 Oct 2026
 13:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
In-Reply-To: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 2 Oct 2026 13:42:45 -0700
X-Gm-Features: AclHuK9GtaEMxub0C4cC2iFOReeGZtM2r5F_DDQMeKZ3U6WaUokmOoRrco02awg
Message-ID: <CAKwvOdkjLkKb1503q6HOnJG5ps3iZ3GdTxP5B6rOSPEfkJ-PBg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add stackinit KUnit test to HARDENING
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:27=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> From: Justin Stitt <justinstitt@google.com>
>
> Noticed while preparing a patch to lib/tests/stackinit_kunit.c: the file
> is not listed in MAINTAINERS, so get_maintainer.pl does not suggest Kees
> or linux-hardening for changes to it, only the catch-all list.
>
> before:
>   $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
>   linux-kernel@vger.kernel.org (open list)
>
> after:
>   $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
>   Kees Cook <kees@kernel.org> (maintainer:KERNEL HARDENING
>   "Gustavo A. R. Silva" <gustavoars@kernel.org> (reviewer:KERNEL HARDENIN=
G
>   linux-hardening@vger.kernel.org (open list:KERNEL HARDENING
>   linux-kernel@vger.kernel.org (open list)
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f72b4ac27ee..019f443af051 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14164,6 +14164,7 @@ F:      include/linux/ucopysize.h
>  F:     kernel/configs/hardening.config
>  F:     kernel/kstack_erase.c
>  F:     lib/tests/randstruct_kunit.c
> +F:     lib/tests/stackinit_kunit.c
>  F:     lib/tests/usercopy_kunit.c
>  F:     mm/usercopy.c
>  F:     scripts/Makefile.kstack_erase
>
> ---
> base-commit: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
> change-id: 20261002-maintainers-stackinit-230afe234e5a
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>


--=20
Thanks,
~Nick Desaulniers
