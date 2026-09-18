Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2A49A3B9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717927; cv=pass; b=RE+oGXm3OqauKUVQB+idw3I9cqO5rIiFUhFaNS5Iw/4d8Xio+B8sZ+SSzN4qaBh8u1BURJeVpi9U8Zjd1KgKFcl+mKrEjVpRu4gVt23BZ7I3a2th0uP8l7rXvJ/kwzB7M6VIcbK7BjKeHapcKgNwIMJ3+7nMvgKM65XVWYQwEy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717927; c=relaxed/simple;
	bh=HmU3O9u9jVAkFRCkWEdl+bin1iaF6HrroVvtBQG2j9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uY52oHJ/8UQ3+Cua7rQWzVKkQ8XxeGiUTYnZoUqBtcze5VBeA3EFnunsOYSW+KoNbaQLvV3XXlXWxHmPgIlvhqTGbF6svYsBBwzFnsLxh+2hduzVEVaD7TYeyoIpCamdYMT3SFPM/ewFktdGHT6vq+cAqFan8UJhlqie4WtsXtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/xlBZRl; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/xlBZRl"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-530fa0716f6so4915461cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789717925; cv=none;
        d=google.com; s=arc-20260327;
        b=d2HO39d0VGITuul9YJeKQH6dwG6Vib58r+x6Nl+C7BdLUhHdxPkSoGTv4MFTgAozVo
         kzTJkeFwAAm5lAV7a1wgNTBnBzkC+WdJOKzp9maGxO6KeLAga+DGXJuB9fAl3+bygEzF
         mmZWCKaumPrXYHmh7BGFCEb5oMASYx/5WFQZh09Cq/Svawgk/aYHiFv05jEICAwMR4Xm
         UKa1JCEtVCrjHcb+MB1YUtdFqUuRGMBqtHWksgsUsfHFKCqT+Yd4LVsQ7MCrLrYpaRZM
         gFBeX5fqsgTqh7+d9Ko1E1UmGslBwRYNxhhblLM6ryZc+YVPBG51sDfYtNEtc59CIk18
         dOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=;
        fh=gifeeWN38XiJQST6KPbFZPmgveyUf05AhzsnE03IZr8=;
        b=qSZVd4Mnu0Ei3wllr/dI/UkRJjpFbx1P8zNy8MSarMaBclDzcDXXKMWIOILKwccPS2
         7iUrHONfrb3ob7FM5qeae2+Se+HgQReqs/N0x/un0KuJ+0QshSqFB3A5769Jg5RjcP1K
         0U+6j5mR+WLIV3A4iCacW+W98E+Qr41XROHkdSyUL59KIlPUHfDQoisZzGCGI8tMuMM4
         hrXWxqLTsCkw/2HLrfpVvV7IS80Cl362pjoKyKBdPbiqAwSyEoPh9edLhwZ3ArZL0E5K
         SmJhCBw5WBuo7h/FU7F+m34IRsBMLNJKLHoY6cYerS74Y0x/PNLCcVsxoKr6c7BRzz9X
         Vrdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717925; x=1790322725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=;
        b=Q/xlBZRl0d1u4TvTkrjunTffRGdneS3ZGZ9KpeYJHWJ4j5vBeZcAQcajCRBlEKtZ1R
         9qcHZNY5Tj5gTnWw/gxSY2grlwWTayC403wG+ZHKG/+1xWWkQuPRWkXkon96eOxoaw9+
         /oYMDZTPmGa+r0JdjAfetHzpzN0FauE9zA26ewQG/lWJhMe/UklgcqWuQQxN/otC+U5X
         rOMzHO3e4TEQq+/C6ufRmdM/X83CNDZ8IJEtojCF+bJ1eGsugbqQR/iKWNmmazYU59RU
         HPs01ABdOHAM+JFkSrpRcEN7oPgBFJRVdHfjt3e7gfIzRjFWaQNio5RQqDhuVwjyXa2C
         CjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717925; x=1790322725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=;
        b=1kRJK/zxDVo886eXqlPpLlsAOLOkTO2dD1Y0g2YrpYfc1pLqiW0ZWJ7L/ODIgRVx2x
         0IcnP79hF+nUlq9jdUEIPVW+IPv9foSyyrE0NDrpFHd6FBgUdWs5wld6PA6UpLKRZALu
         VXSeO8TGzUZspwPMqkxqREhfqu9nQdaGtLrQDc4dSLDdQJYar5PhDh72iggs4ljzg07o
         nQc+8t+MYEmMccS/yV8UKStky5LZpKXyrp6f0l0zsl6cGM+0cgHtdQf6J3q3vkMd7ezS
         2ap3/kjCqct5n235kwRfH39XjDFYmieJihCuuXS30xGEjtdHCX+xdbfrJ8qRDsfC8yf1
         YvRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY8uzrgiUl3p0M2wjIABC8hmN62cwaOeJGvU5szYotTzVNc5fisXixLnhW2pmEi6wVRKdZjVk4xmvMym4=@vger.kernel.org
X-Gm-Message-State: AFuF++mFQ9iy20aOb26vcf1JjXixc98mwP8yVIKu6NR1pmVbgVz8JB38
	/PO0fJFAPKrd3LWZ1Y/wXVqr9yoH2PpUMyRcN6B7FFWhlkMbi2eibtZMTalzJbju/W+6SORIsDl
	F1fIfLqpL6bqd892ykgUiRQNPpWcxrCA=
X-Gm-Gg: AYBFou2jGDJOwCASPgrsKSBV3bH1DQvNR6Helx4AxOFCaHP1NuCIUJfcHkPvSHDyP3J
	bMO/saJyQ84+pQstBhLDBF+m3Nk7BIkR5NH/DWvKD2XLbLNIByK/v/Q15tQyBLOUSRXi/koX6+F
	nf6mVaSH8r2WEYlI6VQ5CCmyocdUyJpGKN/8Cguid9WZOIbMATHrg9h0qja2jP4e6OvG9elm48c
	U3uXDdtkWo44SOZmYDoDNgiAMHcx+2iPty7qm1XBLz7bj5ZFSvfTdNMudfhlVTf7DWc5sPVF/el
	AkFm4zAhuwC93zHC0qBcIdmF5po4iC50cL29zwn62Dm1ELluSr2DYBFQOQRVHQKiXJ0Qy6gtXea
	PHX1p01503xZVkQ==
X-Received: by 2002:a05:622a:54b:b0:530:e6b9:f5d9 with SMTP id
 d75a77b69052e-5329e2887c3mr28806961cf.20.1789717924743; Fri, 18 Sep 2026
 00:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917155834.2161361-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917155834.2161361-1-vulab@iscas.ac.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Sep 2026 11:51:56 +0400
X-Gm-Features: AcwNN1WPnMYUOHlV-frab_8tJfPEncIhhSiRLeqBqP4mXUOCMzFeKOSH0f4nq-I
Message-ID: <CABjd4Yy-9A0xWCDfZemHOTZDrDdtdO05nUjmN=w=sLwYjzZn8Q@mail.gmail.com>
Subject: Re: [PATCH] serial: vt8500: Fix clock reference leak in vt8500_serial_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux@prisktech.co.nz, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:58=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> of_clk_get() returns a clock with a reference that has to be released
> with clk_put(). If clk_prepare_enable() fails the function returns
> without doing so, leaking the reference.
>
> Add the missing clk_put() on that error path.
>
> Fixes: 12faa35ae5cb ("serial: vt8500: UART uses gated clock rather than 2=
4Mhz reference")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/tty/serial/vt8500_serial.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt85=
00_serial.c
> index 78a1c1eea11b..fc6fdc751b16 100644
> --- a/drivers/tty/serial/vt8500_serial.c
> +++ b/drivers/tty/serial/vt8500_serial.c
> @@ -656,6 +656,7 @@ static int vt8500_serial_probe(struct platform_device=
 *pdev)
>         ret =3D clk_prepare_enable(vt8500_port->clk);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to enable clock\n");
> +               clk_put(vt8500_port->clk);

The probe function currently mixes devm-managed and manual resource
allocations, with the clk standing out in particular. Instead of
adding a manual clk_put, could you please switch the clk calls to
devm_clk_get_enabled and drop redundant boilerplate?

Best regards,
Alexey
