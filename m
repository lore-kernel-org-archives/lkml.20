Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9683DFC7F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790920719; cv=pass; b=e8N5wXZhRIvhCLBnsQfiKLgivFWce9g/u9tcErQ9FADvVklQfVTb8UomsnPvAU39Ahiw1hnEiUvsC0AJfrhGXQ8u35VQkHDKyl10XYsxXjkX5ayVczzUdNaIRnpvrizpIffv5ScgjZYYl77BE6FZ1PyeTH98V9RGKXZ6D+RsQpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790920719; c=relaxed/simple;
	bh=6ul12ShhhdnSjEzPLXZMAI9Fhat/ocCFJ2S5mpN0AkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdqKtIjTSkwBxrVL+TGVOy8TkAw/KqGmGJqhYOU6vB/9hkkMzQRRhk5MOuiYNqOSCuLZLlc2kRARlsaeNR51YaBBxA2aUl7uzh9GYzsj0sSqat/ZvuMrp8s8wK3bkGubARcD3QafJrwVIgASjPY2F2weRDYVbzF6A/OmDs9dpYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kraz9GB0; arc=pass smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kraz9GB0"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6dd42533365so1342191eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 22:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790920716; cv=none;
        d=google.com; s=arc-20260327;
        b=dy6lMIKhcAlrnoBIGW2+uFqXJ25RVXIBhXCLq3yfhLDuybo0ZyRxda/cmkujW9S4mg
         jegGZR2hE/xeEjvg3VDQa+dz5Ojduh+xHE3tXHoSn2IGdFctKoduODL0kZw3iUgVWyBl
         AwDOIwM3rRyfNp9BN0VsGfg9tgq2YhH0Y91ITVoNe+482zlRf5tYDF4pP0KqlFl4Cotc
         yyXrhvg8xYQKIyW6x6tVY4LG6e87clnpTwTS0g9YB2MOAnuxxuwgnRsfdxKAjlWn53DV
         0BbJzEyxf7PFX6sM46MZCHa0KS8CQ02gmUr1djEPBbkAPiFfRIDddTSV50FwrC36P7MJ
         7TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ul12ShhhdnSjEzPLXZMAI9Fhat/ocCFJ2S5mpN0AkM=;
        fh=3u7/zqUiiZvHwqTi5lw48a6FRoQJvdx3ZFomPkrOL8w=;
        b=Gn7XiWfsrbuw6L7yRxtlVqd7J2yN7vhcLS31O186E1rBvqaiu9mx96zY49Fxhv21Pf
         UfM8S+e67j0J7NR2nFkCwyOXHUVJFL/ElLN1LOo25fF7ndFlhZVk4uujXl0DuD+z1X48
         /BIVyECrPpQxveI0o0AwEaulCYb7W/FtFmMkr0xSadenI6YG+MruJ1Duvwj/vXE3f9oH
         O0xk6PvB1VBG2SPGh5K3WQIZ3BKC6j1V6o/rTVlC05e9ntoLJ4X3tMePY8KsBsUx4si1
         MIr6pu9HG01oMvzl49o0Q/S2dYHMT+EBwzWmlsxXecdPXMBC+Z1f5Eeoqq/aqEntKWWn
         V1JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790920716; x=1791525516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ul12ShhhdnSjEzPLXZMAI9Fhat/ocCFJ2S5mpN0AkM=;
        b=kraz9GB0ePLMEY1SjAjSo2lnKHTisdKvFBBI6/EidtLcaSsMdsgd19nJvTWOJU+Apb
         X3ge4mjknG1rzzRwJbVM+cF0tN7Lc8fi/Azh3Om55rSzxUDkCnIHtakWq6ipp4BiPzI3
         fTdVkS+1jrvwyHDh4QuI7Gbztrq1rMBEgpHuW7iz3vbsX0ga4eeuYv1jQVa5YE2GPJjw
         2RVrYGzW9j9ND8S/qtWKVQip3gPnjkoNbvKxcmL1OGwogDIHcQUSabdhZdUCdjLy4TY4
         KcioLU8haKmXsD/8TOAHhjfdjlUmHoRrZCdHwCfcBTvauSEGfjMf3+HSL/tUSjTZvFdv
         YMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790920716; x=1791525516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ul12ShhhdnSjEzPLXZMAI9Fhat/ocCFJ2S5mpN0AkM=;
        b=khK6PkFLjwpJyAo1y7jgmuecBlwSOtLHJuZB5km8PlX0SgfppMwEEimox6rICa1EU3
         9JQfFoC5GcIZ1yiKPnsPGaHveagjYfQ5MjV+AwP6lK3x4ackm+q3abxLqu0nq2Ziqna/
         Xh/AaNZL/+a+VZKcYBGJouMzfDD41PoSKm4h/d3UUkNu0RGSZ9bQj27yopdzy+NTwRUm
         vFJWyWKC/2UDMyGsHcrn7tdRVDS30fZHsB1YOSTUYrSvqAKoy995LG+XKGXBmvvKOhT7
         OxBSQ3inse3AjkLX9IiMHljF40GyLgAzqqdRYC7b5s9fDL/N4BHmrh+Y+oXOeQVFjGW8
         QIUQ==
X-Forwarded-Encrypted: i=1; AKwUvByqsM4XRnOD4a9ZQlQyKrvlKzbqISQrDMX8Zk8KHNv5Arct/rl8DuUOiwt53wxSJnOOO1fGTWjhuH7SK9s=@vger.kernel.org
X-Gm-Message-State: AFuF++kSrLxT+CIlptofdxyqp0PGHJyLpk7bq4FE4MI8qiGWNLf1shlL
	qI203WF5r/FnXD2PjY9exQoVbDdC+5BNjoRtr5kQACzE0OwiVmWvP98AcBG1SKiyklS2P8FkYgU
	DOimTRqYVfiEQ1YBrBzhDJbysJgfARiM=
X-Gm-Gg: AYBFou07LwvMerCp9ocwDib25vJ5yOa57n+UhtmGyhSfwuHhm4ppYTIQtPV68GemSZ+
	9fSV43nM9GNenNz06B+hmbFxd9Uouk1KY7bb8YW3eTxpxUtDRv4/Ki4i04tB+TaVkUuBvijYUzC
	YWHYQYKQIQbumUpla+zezkGBHgkUJ81BbpIAy5thQwwA7hqgLGeNJu27d3FFjCpWtTMYj/SjAiz
	CGXts8Ku7DdfY9Ff7IaCTaoUxMlOYZubkKld8+T62lLGGfSK1HAkFD6JE3FdJ54W7HmshfWO1kR
	m/TtAHwBu9bL8ARt+brlZWvyCALVImlJ/kMYaNadwqwac4VxtigS3MD42MtjqNEdoKqkLvVyGC8
	jv2z4k7xHnVxKThopqaokG6DJZHy0cqKjA81KHU2Gc143ITl1qBiBf5UtsZBksANmxA==
X-Received: by 2002:a05:6820:81c9:b0:6dd:40e5:3788 with SMTP id
 006d021491bc7-6df35a3ccbamr1230139eaf.83.1790920716194; Thu, 01 Oct 2026
 22:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930005914.2133-1-lirongqing@baidu.com>
In-Reply-To: <20260930005914.2133-1-lirongqing@baidu.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 2 Oct 2026 00:58:24 -0500
X-Gm-Features: AclHuK8wuXwhFkjO1EDsKiUX6JlQiB783NRqJazobSzq4sh95uymDiPu59MfE6A
Message-ID: <CACVXFVMirxfOJ0=fBabi_nhZJKyTeGJXEQuxLGzi57P6xpVYPA@mail.gmail.com>
Subject: Re: [PATCH v2] ublk: use global index for reported zones
To: lirongqing <lirongqing@baidu.com>
Cc: Jens Axboe <axboe@kernel.dk>, Andreas Hindborg <a.hindborg@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:59=E2=80=AFPM lirongqing <lirongqing@baidu.com> w=
rote:
>
> From: Li RongQing <lirongqing@baidu.com>
>
> ublk_report_zones() may split a zone report into multiple requests when
> the number of zones exceeds the temporary buffer capacity. The index
> passed to disk_report_zone() must refer to the zone position in the
> whole report, rather than the position within the current request.
>
> Currently, the per-request loop index is used as the callback index,
> causing each chunk after the first one to restart from zero. This can
> make userspace callbacks receive duplicate zone indices and may result
> in blk_revalidate_disk_zones() updating incorrect entries in its zone
> state array.
>
> Use the number of zones already reported as the base index for each
> request so that zone indices remain continuous across all chunks.
>
> Fixes: 29802d7ca33b ("ublk: enable zoned storage support")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Reviewed-by: Ming Lei <tom.leiming@gmail.com>
> ---
> Diff with v1: pass done_zones directly


Tested-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
