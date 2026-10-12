Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1246AF2F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798473; cv=pass; b=shYds/z5PD2ze90BP5KJ6c1Y8zW25c9VMZm70Uu1zQytkUn2CMdayurEkXqPE+BZbxa0l4IE0smZ+h5o47bI7eB2Px4KvjF6DQPIg3W2d744/0Mx5aiKR6niMMqaAPdy30fn7zX0hx+MV4jPKAwJT4oC/orOY1L0oHjOF2xVpKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798473; c=relaxed/simple;
	bh=SsZNCGRw3F7uVhp6Wx0pDGhtzKaaM9O6Ixab44d94cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slUNEc4dX3jfBGbmjLQME84HM2ATZadRJzlAMGMKLk2cwgopMsQGpNiixNdfNY5iuo41PI/Tu+vGK65lwVt7wKo2CBpHFT5vakDlC+SM2xreSWSKQMs5m+RIX6pX89CUCsqqwaK4sLl6wkAPy8xJ12gW45/6GMILmLrEE9zVWI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJpDWweA; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJpDWweA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c34bff61551so114577666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791798470; cv=none;
        d=google.com; s=arc-20260327;
        b=XKez1kEJYvXFvokw4VcZOuVN5+/k5BgQTich8PKN0Z0U88IoCh09oUxqiiKIlNJzV9
         YGXffJmz5aMZGsNyCga752yC9EZgTRrOvwKfVKKHBEAINNpsjxD3xmRaglZEih/Ngzun
         OlgZLT/MevvrG9ee4x8ySDfodBCeUA2/HrK2BKk/Q6d2Wjrjmuxc8JCaX2Uc3/M4rXkN
         lKspFbpoG/AXvawWu9/pk5MfdiePtYRm/TaHJYvhm0t9pjdSvHyypfoDOyL8XfgbU3gI
         eYc0K0WMl8h0g+5bFNEo+TxpTqI0T6HKYLg80iVvcfEzIOgFyG3lj0Nedc5MY3xjC4hX
         3O9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3VGDcycFylt1dIW2Zqg85s1x16i6rd6gN/8M5j2Yg3s=;
        fh=X5Gi+B4LyW6i97EAfxmcoou1Qs8udBtCgGFSKBFFyjU=;
        b=eiiABFQueF7HA2wP3gVPyNdqVEKNVbbylzAeqfSYiwFznGwRlJjeq5FltjjR49DatO
         AQS2RJq95qftqFdZ6MFi8OfE1qhcNiyZE8FuU4crKGjz2ccqm7JshgZ++9jiK61wXRZe
         wPatDrC1pVWg5Fj0iu2thmj2/+VEZKW8bREsIGqa26fQLyCzZPmoNrC+TfsLOozVMmj+
         /IorHw8r6MJzogVugtALNIR67Qmz6mm9p7Ibk39giDXSHQmLAgRyTumh5pQ2WmVDHQsr
         Z0NkYcNuRiLno7f+17pLu1vwGcQo4WcoeikqNQylBYUVOlSEY8yE9BKU8jvzkxhJOpUC
         ToEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798470; x=1792403270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3VGDcycFylt1dIW2Zqg85s1x16i6rd6gN/8M5j2Yg3s=;
        b=cJpDWweACXRacSVT4LUgxxf87aK5w5wilcvKFuOZ4hSHUv5GdYrXHzgXdhievRis6X
         jl0xIjapAt5p2r46+E5dgtJAncP1DPY2+3KKRCM/pTHQfR5Xh7OqlViBA2MIEHFsYYbA
         ODWNCCd9592F/T5dnNuSQcEm7W9P2ALQ8GVuij7HKAiqH8e6oDrQy/jhHggcQyZgnRqy
         PzefJWFJBiPMbCuG0wwkbVzASTcrry/A2qyVzZPTaXujt3z0qLr6IqNDeJDNYLasWtT0
         SV9OFsORZCWpFw8i3AhN9i11Dzne7ksZSITjc5EJsGK9qG/54L93LZM53XWDIq7VFLx5
         MXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798470; x=1792403270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VGDcycFylt1dIW2Zqg85s1x16i6rd6gN/8M5j2Yg3s=;
        b=ir4Dl/eNXdRQZuTYpjsocMDv+hn6UqsjvYnTpeeXwHAFEtvHz5wqMqFwSmmMhQqWu9
         y2huyvNO/3ArogCylRAYvuugyGjhcS1RCydU6UZgRYnK4EsGCKeUdKaC+sGfOVyeheoY
         q/5U1fgWZpXuTTTR8l88LukwkOctEch2fAZM66+4cSjqaIguT8VMWkG6Mw474tuDsRqa
         Vm4/I0M0qUWquVUqkDucHhm9ftdpJrVs2fuKoTvtDG0zzA0XI1r3ihPQb1OpD1zhIlAc
         f7ISYot3xwtA/pAWI3W+Q+OzwWmLQdKsqQhTZaH1Ro8yCknpnSFfoLX6BMM6O/c9TVBK
         kdeA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ4u4KM4E3hSiTKtpf3YKsWVXiueas9zP/hFztg7ofIYf3hk6idihDCsVbtcEncHeIEUNScTVjPtEmPJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIErm9T4xFva6hQw3fHgL8g7iBp6f5Mnfz6Sy9A+Ncn0gKpm+S0
	fOu2J0iwUcAaONDgK6f2+MJZaz9miqfxaDJZGbdhqYZLrjfkInIuMGE+foUTWIKwWcupt9orjeO
	x94aDQB6iMlS0btmy8XpK1uXJ1U3y1+vKaSjvTWo=
X-Gm-Gg: AYBFou2Ds6rTPUMMoPNbPp5KNjqYqddj/ZriBoGx9qbVDKvi8gD9AyIyqe4pdskV8Mp
	6+hsQIe25C9f/6g6eo8VDLMz3k4n6QsXBFWPB2SpHnLxvHoKvLA6733KWVCYTjVJFSh5RnFBDKG
	VkzxDkwsym1EB4QIfUoihSm8ZVwwR4n8XoYxI8A3gsx/1Y4rFYv/Lcs0LvmaOUxYNHVHRIFFSc2
	M4nZzTdL6zlrji/3FOwY7k7A/OWDevXd7OxNsifbgXL2zgRFdJa9ZAbZjqZA4weMRhZJi3b+bfX
	gjW6t8loIiiBcNggRQERGQSGO2R5JBVMglWjDNGgfS+RUYjw8/6VGRVT
X-Received: by 2002:a17:906:c105:b0:c31:5bb8:4b3b with SMTP id
 a640c23a62f3a-c31a9a335femr914440066b.2.1791798469497; Mon, 12 Oct 2026
 02:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012060847.836027-1-zhugl3@xiaopeng.com>
In-Reply-To: <20261012060847.836027-1-zhugl3@xiaopeng.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 12 Oct 2026 11:47:37 +0200
X-Gm-Features: AclHuK_9ajsePmXQfH6j4Ek8BMjJ530fzizo6S3nLvq8SngFf7HNK5QSGn2kkRs
Message-ID: <CAOQ4uxhMUfrBmD-cad+hTP64uvf5KXby7c0u+RCU2Ya4C3KK-Q@mail.gmail.com>
Subject: Re: [PATCH] ovl: reject lowerdir ending with unescaped backslash
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, liuc63@xiaopeng.com, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:08=E2=80=AFAM Guanglei Zhu <zhugl3@xiaopeng.com> =
wrote:
>
> In ovl_parse_param_split_lowerdirs() the escape handling consumes
> the backslash and the character after it.  When the backslash is the
> last character of the lowerdir value, the loop increment moves the
> cursor past the NUL terminator, so the loop scans heap memory beyond
> the kstrdup'd string until it happens to hit a zero byte; a colon
> found there is written over as well.
>
> A trailing unescaped backslash escapes nothing, so reject it with
> EINVAL.
>
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
> Found by code inspection.  Behavior check in a QEMU guest:
> fsconfig(lowerdir=3D"...\") on an unpatched kernel returns -ENOENT
> after the loop scanned past the allocation; with this patch it
> returns -EINVAL.
>
>  fs/overlayfs/params.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
> index c93fcaa45..5a15e5478 100644
> --- a/fs/overlayfs/params.c
> +++ b/fs/overlayfs/params.c
> @@ -216,6 +216,9 @@ static ssize_t ovl_parse_param_split_lowerdirs(char *=
str)
>                 if (*s =3D=3D '\\') {
>                         /* keep esc chars in split lowerdir */
>                         *d++ =3D *s++;
> +                       /* A trailing backslash escapes nothing. */
> +                       if (!*s)
> +                               return -EINVAL;
>                 } else if (*s =3D=3D ':') {
>                         bool next_colon =3D (*(s + 1) =3D=3D ':');
>
> --
> 2.43.0
>

Hi Guanglei Zhu,

The fix looks correct, but the commit message is inaccurately making
wrong claims about heap memory and scanning past the allocation,
which makes this sound more severe than it actually is.

See Sashiko review comment:
https://sashiko.dev/#/patchset/20261012060847.836027-1-zhugl3%40xiaopeng.co=
m

Thanks,
Amir.
