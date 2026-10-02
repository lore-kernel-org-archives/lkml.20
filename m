Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C36353A67
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934795; cv=pass; b=jvfzKasYp0cJ7gTy5Aa/prXS4Dnz1JGkrVFd98WJTZCArhqC8XqWtVk44q6d1ZFTHJkudMNLRazEEqpN+rmZjVd4ygq6tpIUOM9vE7/n6X/E6mT3vymrZi2Utb/rX/6CZNvyTxseNxd5pqEcby9wvEb/3gmeL8RXLgz/X2abVoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934795; c=relaxed/simple;
	bh=I2iVAnQjuB2efbREqOoIFm3u1ZAEbnkLwA/mRmKPRhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+WWoE+hi6mRG2FqyK5Td/bi22igWYBK/nZKIsiv1htOBZDm7xZBWTloplB7ELBrtJhWunZFJXYS6UuFK660yQWYkudmDMCG8RezrCfny5R1oyuJ060RF8jVNujrbdoD2pD7s2H1/Z4Qg5hLe7EN1eVbaYQuse0fpH7YQ0ohxW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUMCz4qm; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUMCz4qm"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19959791so3762745a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790934790; cv=none;
        d=google.com; s=arc-20260327;
        b=XFY80AhNppjwdEhq1JDDiKcgUo60Qg6HfuK1XRMZFW3H5CnjZVPRvOVWiShBtKa0jX
         +WrSiEgO2Hef9HDjLtnEc//j+eEcR5boev+r+LdAkv8b6KBcoyg4SYDxO29ifYyKW3tw
         0lPZMBG/QW3YJsRZA/G/DsO+ZY85lPHAwiqo12kTYZholtYyJnK7HlZUogSGoM4LO/g9
         Z6KtzfcvgHKtmOux4U1z1S6yjMBF3k7iGH1HZU+dqMUEP8lRz3ZnF8FDk++EtD4t225Q
         IjV0xj/SjkVMdAxzZgNQX6ip4ieckMk5ZGHldZJ5pxE0tvYXuh0r3tPE9XBpwDdXxFNL
         SJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4arSkmG1a9JYvWYFRd6H2E/qKnzAPGl35h03AYNFrrI=;
        fh=o0Ow/npA+2bw2LelgakL05sSqj4ZDUWzYdZPmvBp3bM=;
        b=OWfKJLpQGhpjQ7i7mxvLBYUdE5va0aL80mX9pBVhEgSVws7mhmDufwGU8x/TbHDQBB
         nWJmfxtPnBkVRO5YBwLcXyfvYLGdV1WWRdVj/kSpLNOapniING+cLt/7fJF0K4ZUt3py
         zOCnvtVC/WtKhFJ0RqYSUtjmNYrnfYig4pigLxbC87bpGUh7NIwqcohmDjlKMdGJ/hHI
         HzZ4Ru0sOqh6dqB9Zmi+wty0dba4cVjdArUD++nqXaXfMNlB1EE7h7cfNxX7VIpr3BW7
         kQ96vS9YY0zZhlcdUz4POttXgRZ64xkzKecKoEWN7OiJf+XtgFnQ6kVsSjCGFX645Lrf
         FE3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934790; x=1791539590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4arSkmG1a9JYvWYFRd6H2E/qKnzAPGl35h03AYNFrrI=;
        b=iUMCz4qmERGAlenNan6CUNOieacNgnSjS8mHjPiYzXWcLS1E32pe3W3AsKwPpGRlpL
         lf9hvXbQkeBLQCRc/gvTsb1hIpXnEKTqW/W4Vyv0pI9ewAb4uGLFRTGaw+NK9zkBhnt1
         1U2wUwC/IR4H812RxRukMhNzOPzsiBpcuC15NMPEsTR5LgpoMKdqgBc6WIkXbKkAysDF
         jK+4+eQWAt+wCOxR3IsjIvsrC+sw+97G55N6mHHK6586adrnKWvrc6+aPLJVhyP1r1Qd
         odISBgTUAjpmhJu1wmXSlfw+Uue0GUraOhPoS2tA2kJ6xiXKdSE9EgeVIs+Ly4GQFCaX
         FS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934790; x=1791539590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4arSkmG1a9JYvWYFRd6H2E/qKnzAPGl35h03AYNFrrI=;
        b=pBEhkI93y5wdOCVZCUaZbdyebk8zwY4FpSNUEVc5GEmjUbnmYXhwVQwh376bYxNkHD
         1tri80ek4ApjpePso2RUqGbtRfOBHHyBCme1dMNuWuCo100Pqd5YFK0fIVVQsYmzepHm
         sJmzURepNp5iM9MhInudGiq47Y8sMFH5IzaRj9pp7/i/DIyJGAjGtBwyG/fBEEVh1Yzh
         ch9WbCdnmpOipCuLmNWZZDw9K6TXV0E4fYRHRd7CYLxBIlt3zTn9fufrh7HTp2QGW39W
         93SqPTdnUC9jvSsneGwJw4yEU/3MOougwVe9g0BkksM3E0oV6Z9TdqwkTgg42M7WqkiB
         ga/g==
X-Forwarded-Encrypted: i=1; AKwUvBxHML9Fpqi5I8peSAUGdSriJpIAecPBudSYyYojwJ6zXrhBiOZssduRKhlDgegufjv9Xi1TPmNSk1GZys8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZI2Vdf8owDmpqnGwFpyfI7or6gU3D41LxPcV9KThr/khU+pKN
	RabXzPJXHHKlQy39nkOVIuPqvT5jfkMdfmQPRGMVnDmXSI36oMkUKmJOHthvn3V0kFn6NIbjd/D
	bZnIg/VtzUf1204ulnfi30GNNM8YooA041TkB
X-Gm-Gg: AYBFou0YGy4phyv1Z4WrdjFo1+IHvBGveWvotelvOK73kn/SeT7JWUe3zhnwrmIKIfs
	nod8n8uP1vsnVtG3PEcY5LnDVWCTKN0v43Iw+wtENFIQEJsmtcKeZ2prJnXc0xPuvXvPPFxotov
	SXVeCpJmff6wqVbG2LRw9Y1/OadUnwfGECC4f+f64IdRI2pZqnrSpT5UhqSTImuQPFvC5kU6q77
	LX8VmlnARaDGIkT7PXEHZv0fJIL6Dq9CX/gzgIMAPtZi7hGnIyUQt7nQjlMTcFyA/25GSrfeKjf
	6331nbHBORi8ewGPK1csXoOa7LcVY8KX4F7jtwRo2mzB0ile9881QlVqtm4K9llNZp75x5qQRM3
	q4NIuHwin9I3o/yb9kXXEUEE+ebM+KPfB80GTszs/gXU=
X-Received: by 2002:a05:6402:401b:b0:6ab:eb3e:ef50 with SMTP id
 4fb4d7f45d1cf-6af9e31f56dmr1449604a12.36.1790934789894; Fri, 02 Oct 2026
 02:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 11:52:58 +0200
X-Gm-Features: AclHuK_05I1u_F6UhWNrqTl3drg919aiOwzfaMNOjFx2ztu5WOZ_5uYX6J9Ws-s
Message-ID: <CA+=Fv5Rznjz2qYiM4rtFs8iB3PefHJ4CdJxS7O+DcStWbS4kQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: replace dead links in Kconfig help text
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Linux/Alpha FAQ, the unix-ag LX164 overview, the Rawhide install
> HOWTO and the Ruffian FAQ are all gone. Point the "Alpha system type"
> help at the system and motherboard lists on the alphalinux.org wiki
> instead, give LX164 a one-line description in place of its link, and
> drop the others.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 92cc7bb8d29a..7c1cc676ddfe 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -127,9 +127,10 @@ choice
>           run on any supported Alpha system. However, if you configure a
>           kernel for your specific system, it will be faster and smaller.
>
> -         To find out what type of Alpha system you have, you may want to
> -         check out the Linux/Alpha FAQ, accessible on the WWW from
> -         <http://www.alphalinux.org/>. In summary:
> +         To find out what type of Alpha system you have, see the system =
and
> +         motherboard lists at
> +         <https://alphalinux.org/wiki/hardware:systems> and
> +         <https://alphalinux.org/wiki/hardware:motherboards>. In summary=
:
>
>           Alcor/Alpha-XLT     AS 600, AS 500, XL-300, XL-366
>           DP264               DP264 / DS20 / ES40 / DS10 / DS10L
> @@ -184,8 +185,8 @@ config ALPHA_EIGER
>  config ALPHA_LX164
>         bool "LX164"
>         help
> -         A technical overview of this board is available at
> -         <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
> +         AlphaPC164-LX, a 21164A-based single-board computer using the
> +         Pyxis chipset.
>
>  config ALPHA_MARVEL
>         bool "Marvel"
> @@ -224,14 +225,11 @@ config ALPHA_RAWHIDE
>         select HAVE_EISA
>         help
>           AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machine=
s.
> -         See HOWTO at
> -         <http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.
>
>  config ALPHA_RUFFIAN
>         bool "Ruffian"
>         help
> -         Samsung APC164UX.  There is a page on known problems and workar=
ounds
> -         at <http://www.alphalinux.org/faq/FAQ-11.html>.
> +         Samsung APC164UX.
>
>  config ALPHA_RX164
>         bool "RX164"
> @@ -372,9 +370,7 @@ config ALPHA_SRM
>         help
>           There are two different types of booting firmware on Alphas: SR=
M,
>           which is command line driven, and ARC, which uses menus and arr=
ow
> -         keys. Details about the Linux/Alpha booting process are contain=
ed in
> -         the Linux/Alpha FAQ, accessible on the WWW from
> -         <http://www.alphalinux.org/>.
> +         keys.
>
>           The usual way to load Linux on an Alpha machine is to use MILO
>           (a bootloader that lets you pass command line parameters to the
> --
> 2.54.0
>
Nice cleanup work!

I applied the series cleanly to my for-next branch and build-tested
every commit with the Alpha defconfig. I also built the final tree
with these configurations:

  Generic SMP, NR_CPUS=3D32
  Wildfire SMP, NR_CPUS=3D32
  Wildfire SMP, explicit NR_CPUS=3D4
  Wildfire with SMP disabled
  Marvel SMP, NR_CPUS=3D32
  DP264 SMP, NR_CPUS=3D4

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
