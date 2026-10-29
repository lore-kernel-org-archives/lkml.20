Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263265;
	b=E3XXKbdZTz9Nb1r3h5uXM1RZF56IUEpp1SXQIhE6BWEXv6yY4d1UGC+9gHAjHeqUiy7z
	 BUz4IcllI+soO6m8JfrNUmtKoTuep/mzs3Ldv8w/NAXmHniA6C+a+psydQAepNHmkkCgr
	 yhD/LZq4/t6mC14xlS9gpsbveBh7vH8fXymWgv2pmJ2BUSu+QMNqGEzh43dP/6Mma5imt
	 VISKq9wn37NiXBWbHJ4dD8vcVzecPhyFXLWgDEpXWAn5K5BLFGTIsyBsYX9erSWZbQc8x
	 8bJPSKGWA9er/0jdCh4cC21F7QosybcKAGXKnkB8t7yrId0LGNE/6piDPd/AbkWMRog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263265;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=SvRnkTYFzNTVywemRusqYidKM7+0WJFsMZZ8unX2qGI=;
	b=k66vryGFWGL6LmgMvwa+KQ8AjVggj3WnhBeqciQog5Oa1eA8zzFuesUu4GIz/d7HYoj3
	 EDv+sKGQR+twdeXTJdrLxkrwFeBaYtT9UtAdY40agwddrLWj2bzg+VmmmUk+NEb0a5L53
	 ZJA5NgTpQhrY+YYtdS/YGZuMg5ITEInHnrDqsD5YN2uqAAEkE1NNOazRNXq9UjCFa9GAh
	 civAR/4WCd6ytXTV4pDImXafCg3e4onehbzuiD5UyNY/Ke0ewZCLtyFNTrhIRNVE/GZ40
	 GCn39nND+QFD4Q5euK+QfVUDM/EVJsKH/cvpkOWgRqBqZRhtVsBKLjuoV2g016KkdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YH8OAcCH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YH8OAcCH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D3E1F031E1
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263264;
	bh=SvRnkTYFzNTVywemRusqYidKM7+0WJFsMZZ8unX2qGI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YH8OAcCHri18WyeJBVkcO2euTB7Bvk3VcNhggTrUkqjigPpECPh3BDsnM0bN+M+xa
	 +84j4lZbfJNh76UdY0Qzr32KOC0SPeXLQUkRWY71d8FfM+1vM3CbOx6WnbGdNbCoMQ
	 ntRm29YwYYDz+T7z7K5LPcz3BQ1T8qs6q9WewNI7sIceCNqPRArKV8ywNKle/v7qKy
	 NSPI76dJXjdmFdfkiNUwM6JWXRl8lxybxh5EMZLo/j6u9nl0ExFKhErkYC0DbiEDfL
	 LgAht4GKHImUt6g3f5H9ozAMFWfNmSEtku2iLnEECbA2mbCaBKyx5lBwLQ44vJX+CR
	 9aIhOdHfhC9jg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1898023e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:41:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9s7FAoZ+w9rQk/FbMhMLCuPy5AYrzG275oXpP6Yss/XyTkesM7GMR2m5bENw+XpRpTH/2iST4B4TTxHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqQC1D1yTjFvEWyvvskyYFOYDQF2t1eYm+rdMALfUKZAbemMNk
	QNzc4gazEYPdOUGgGTNdzdbrmWKYT3bg7WETkOA8MEMRm6ByLoUNUizfpNb95NAVyZVKVwNCACr
	crMrLClvjMYleO0IW4CGk5VNHq0C9Yo2DVG1pNzFzlQ==
X-Received: by 2002:a05:6512:6c6:b0:5bf:a46b:5546 with SMTP id
 2adb3069b0e04-5bfcad768b6mr1904258e87.64.1793263263637; Thu, 29 Oct 2026
 01:41:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 04:41:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 04:41:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
 <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
Date: Thu, 29 Oct 2026 04:41:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
X-Gm-Features: AclHuK9-Fk9LJoMHJ29dTtLnkXw9K6ph4LXwtcaCoBatL-DyIjUns29xXxZ2-UA
Message-ID: <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 08:57:15 +0100, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> Thanks for your patch!
>
> On Wed, 21 Oct 2026 at 14:31, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> In preparation for the constification of configfs attributes, make the
>> existing instances of struct configfs_attribute in gpio-aggregator const
>> and use the new st_attrs_const field of struct config_item_type.
>
> This has a hard dependency on commit f7528cd38b87fb59 ("configfs:
> Allow the registration of const struct configfs_attribute"), which is
> not yet in gpio/for-next, thus  breaking your build.
>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Since you have to rebase anyway ;-)
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Ah, dang it. :( I stupidly assumed it must be in mainline when Thomas
recommended it. :(

Thomas: Unless there's an immutable branch I could pull, I'll need to back all
of them out of my branch and have them wait for the next cycle I suppose?

Bart
