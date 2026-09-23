Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAB2DB788
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134529; cv=pass; b=Y0tkuqLI8x4is3RarcwVI0bzUOXNe+gt4GVq3nvV3g8RjQ41OUlYVTkMH+NSewm1nOgyaShbV+DoaN+6sK6N8ItqVSj6YZ/FzgaidpT89619dV1oB+HxbXnUDhB3DDOy6SfKFFtBccdvhazq+SnihFqc2jNsrkYxZq+7fpECC8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134529; c=relaxed/simple;
	bh=d2Qu26JxNz4DdK7KNZRSYHH9xu3oRYAJPIgmwuU8THo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZszCMx1Ngvc3a7kxwkCzc0O63JLaEJUIki4keES1JwbMaVqubGQSifHvCRelRDQE2JpiaVc6UjKXnfR081rxp3JcB9dPg3IgZU2+lYT7DXCm7N3skPx/E3jzfa911zYhpgelXtXK+kLJ41Q2ZJIbdQeW8TrmfgMy1RY30oitpL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCqknjAh; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCqknjAh"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43f9b119so8581107b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134526; cv=none;
        d=google.com; s=arc-20260327;
        b=ZaLIhyxFAZrI/QtQAyefAh8O1OAPK37OlPH+Z+8+t1VaJ12Kw3YhsCEC4UFGoz/v+C
         BZUTAkzWbzpPiwO/Nje6fatAcQi5obmGKIj5gRg4D1rSdxZDB7OoA21fmR//14dJw5Dy
         Hw60/vB/z67HJ2lWLyI08T59nfaaO+dV64Zigx2z03DnTyN/ryxQMXct61OnCN9RobqP
         XXc6G85y/yBQMUyQEfIx55WNxc9M+dH+py6FzXfBJ4xffyPkUcvxibRq4u0V45tcYvqz
         Rp5pMlIu2UQv/5Z7h/9QZVy+GXumrl95vB/U15Ogs8ndm16MrHGNf0Q8DEvHqzAzVhvf
         /9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYEEoMGteHxFV1awOkLk45oTIa6yiwyLCwRO6PLmYiQ=;
        fh=2NP2ftjmrOHFvlLEHo8T9i3hicyD0MFCSoMt9jNQ8Vs=;
        b=kZG2nujpCz9Lj89jZmBHxF0wZuJlSFkQCB6r2eGHRks8RJuh5JVBiJwizhY+yWEzvX
         6kScQ12U2PYYOAH+qhf1Om9qkbe/NlMeoxC3WogLbZt+SWpcQiXB5+0uoDqC9Lcg2jhx
         vkbmkf3PnPP8a52qlg4Y4870ELjVFI9iItZxgdx191KICfWWA38WL4m3D3KSZ8uarFgw
         BcG4QhiUIHF1ZnaiM57AZ4yiEO5PLPavD94CQOq6/zX5g6QvgHImtRNtwhqdQDLD2pnK
         a/UmqvACD4YAf34szVNHlymSlwfFcRpHscP2W/7jprBXGaz6tuenveYr8lHioyesYhoI
         j1Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134526; x=1790739326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYEEoMGteHxFV1awOkLk45oTIa6yiwyLCwRO6PLmYiQ=;
        b=cCqknjAhHY7uGg8YfgJS23lyStKf/VDDOkxl05oAKXwP/iMFEbV/90ajZUPwRgGX1y
         O2bm2ivicfv7G3YtzOqCODZvopzKNJ5gRUhq++g9Romu7tlZZQI1fVkqyCJnT1coL9qj
         8EVcVFfDij2BFa0mwSvoi/o3Jihg5fnqQkOXBNGrwmNtj8mFpXEc9yIsSTeojCBS7rC2
         plDdLuVPA6jHula1CkoU0CsCrKvBJ2bzwfGZ2IgwEdq1KhdHAoE9kb+KJGJQMEwchAZU
         fq2llQiQ6UZG3XN+P5Ak/sf8IFaq20uNpqUmaKbhqdk7kOlaZvIQdhJ9KQ1uXLZkluke
         rF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134526; x=1790739326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYEEoMGteHxFV1awOkLk45oTIa6yiwyLCwRO6PLmYiQ=;
        b=Qf8Q+s/ydwjAax5PFebPEQDzZwFHx521FSxKpIc0djQz7d/qZqqQc4G56Yjqs0+Drp
         Lwziisq6eToHefd0TySw1kUVgYz3xmMmDoGQyjP6a86MJQUkvBwHHA1G8yraJiPsnPdS
         Ij2Y+d54zQ8wjgMVQrtgluewbM659iMys2zRa/iHFPChGyUjAjYuE189KUnycUF4lyVI
         MrCXSuGIrA6Vuy4iAVaRmRKiiBIVR2QF3NWtWx0oArxEmfstpqXsoXA5AqNsARGlobwS
         h3272mdWxETnsf2UnrW9vrMAtST5cv3JH8rC2plhcdAdOCBCJKkF9QFnFdtCF8V8fBFs
         Rt7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQAdAKHqmqpuwo8OgNxttZgaVFhOwb9DO9EkpklUs8tr4apVjHW7+Jx+yuk4h80xFXYQO8ddkDVPoW3rE=@vger.kernel.org
X-Gm-Message-State: AFuF++lclj9GecDHtMPcYxxZVi7gbqSZLhV/9hm6lvvK1zLLCsyDAkIO
	ziitBTzMTlFrqBJpHLUbfb9N0065fupL7QoTQiZp95v8cEPGbrYDydpy+Uh7uBwWQWcxLF92HGj
	+orRtPJ3al4CtkEm2FsmOojLafolQNP0=
X-Gm-Gg: AYBFou2r92fzr8lESZI4DV3+qgO9jrTv3J1VfPpwGKtFxgOcdXiQIH2ay388+9n+5ye
	W+1IE7plz7rfBd1aWbY6SM3eMz5ayAtbaypDWYjo4kEYcPs0oqISkij4A6OtU4nzC7cDZKrZI5S
	jrhQdpOWxkfChEQr7hAQv6x9e2WSc+n9aLHVk7hNIstvG3x1JD42C9tPVA/j8XFOHb8mlKDsbCh
	Upl8P7i3lSgNgyKwCc3iZdqXdVPCi/KCDr2mBvzdvK0AIxVp+zpilokD2LX07/0+l108nRmPtSJ
	4Ybnofup+cONhTR86qycKdbDOkc5Z3441XIw5jae7BQYdHZWfDz1EvskCKlIDdHFoZMVFIMG1b5
	FgHQ27fuOolj6R//V9ROzHKxxZ3uerM9ND7k9MVMLy3U=
X-Received: by 2002:a05:690c:a694:b0:89a:63da:fa98 with SMTP id
 00721157ae682-8a45bd920eemr4667137b3.83.1790134526646; Tue, 22 Sep 2026
 20:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809045946.15638-1-kartikey406@gmail.com>
In-Reply-To: <20260809045946.15638-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:05:15 +0530
X-Gm-Features: AcwNN1Vk4FtYBJd1sRBl8b5Y953BCfjbdBpM-mBy7PTV6woNSctxmWWAgsZFKB8
Message-ID: <CADhLXY7008e4JA35T2wE8TnJnR_r82RCpfSd=aLBmDh5xAQ02A@mail.gmail.com>
Subject: Re: [PATCH] PCI: sysfs: Reject unaligned resource I/O port accesses
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+7134530b25073b4ef373@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 10:29=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> pci_resource_io() validates that off+count stays within the BAR's
> range but never checks that the resulting port is aligned to the
> access size. A pwrite64()/pread64() on a resourceN file with an odd
> offset and count=3D2 or count=3D4 reaches outw()/outl() with a misaligned
> address. On arm64 this becomes a store/load to a Device-memory
> mapping (PCI_IOBASE + port), which architecturally requires natural
> alignment, causing an alignment fault and kernel oops.
>
> Reject misaligned accesses before they reach the low-level accessor.
>
> Reported-by: syzbot+7134530b25073b4ef373@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D7134530b25073b4ef373
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/pci/pci-sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 5ec0b245a69b..72f0404a34e9 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1175,6 +1175,9 @@ static ssize_t pci_resource_io(struct file *filp, s=
truct kobject *kobj,
>         if (port + count - 1 > pci_resource_end(pdev, bar))
>                 return -EINVAL;
>
> +       if (!IS_ALIGNED(port, count))
> +               return -EINVAL;
> +
>         switch (count) {
>         case 1:
>                 if (write)
> --
> 2.43.0
>
Please let me know the status of this patch.

Thanks

Deepanshu
