Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18F43E06A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842475; cv=pass; b=acyJKcMbGtwabziNF51nr7a4K6ggz5Bxc0bZzrwNYRyZKLGOBRJ1p0z4WQm4zgt82dQHoa/GtKb9oqCRBpe4vQ15HE4m5tYSxB1ECoK5EdssbhWWAZtrDfRJSMh2cXbR0zl8dXrHIdvm9S3nZgxaXiUebKy4nd9bzRXX6wiLRTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842475; c=relaxed/simple;
	bh=1SIOuhSKURyfBFcRwKanlIvA1e2WzgnUKZ5hYJTmwjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jv6dWu8KoMGAwncffhTPBJrUUcqG1zxxNvBV8vYtDc4v5Uz5KXKNWTj97Ca7ivu9GRzB9gyFtegC2vjxHvXBO+17EVrRO0LzO//dB+MMyKY/v2oLDuA+79FV15n/utFWS5z8n0+j2g4yVPmyjUzj2HXIm8fEIwvv1OGKsF6UGM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH2aIfH0; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH2aIfH0"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7466771f1caso628112137.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842466; cv=none;
        d=google.com; s=arc-20260327;
        b=bih0VmLuXpkpSCjrJgXOZ5otugZW4UP6oDP5I8gP9n1xCGl02d0Vftidx3CQmHTCwC
         pE0vx+mGCIh1hZPomGmWaKzFXkG/G9aken7DSAyCE/B34WwexdVr/00E45wBSoGP/SI5
         53vFkro+9t5q6P5Vo7+FJt6GgmdSbvS9146cMPVsQT9/y6bVoSFleh0vzgI/bHLOfyUU
         mi8FDxTw3mIuI+daN4viInM78c4+j4K0mUmvPKSYWUcnfhMQjSd0OUMct8Ctq9ikVN+R
         f+3BMP7kCeCIhDyI1VYjOZpDtv7E02wl/W+XZh03S0uHRc7X0VBR7Acep4CSiXFjhLA+
         ahjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbKY6MBOa0oB1ZoBMbPN3qx3VwVEsabbJ6U5jSNhb80=;
        fh=rkvHF9Auzrp2ZGR2pms+s/jnIMQbkpQ++PWt/ecBwhY=;
        b=g/Y2O71WQN3EkfhG3uS/mlDSpND2NBwwOPGH7JCr/Jov8HRiQ9UxhJC6/vg3C21575
         VZoWP/clCGl/Nu9xvTW6WTHQKNwUgLkcfrrfP8cj5CKWqWE/fxtn7wm8TwYFQETDud41
         Y6R1s3HI9CHGiZsojlkyfkUoziF+JGA5C0scXygiTyQfZa8q0GH51m95oAQyKLWWaas+
         L4f7JaqsP9pt3XkUIb3ebmaKiJEeiGw6QbRjBmBRRdoKzJYSqZXKUzOCVxgvhMMtSC3G
         sVq+LorjiPkhwkemjjsiKOGBKz4b7bX36VMOU3wuPfO6Qu0x4+kfHU/W5iQ7TaFFNIUR
         L1Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842466; x=1788447266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbKY6MBOa0oB1ZoBMbPN3qx3VwVEsabbJ6U5jSNhb80=;
        b=OH2aIfH0hPoiR7WU9m9K++nzmsKY9bKUp9T9aXADA97jmxC/C8LM5410tjYnauPR5P
         G1CyfJIGZUSgFUunF/xFBiJNhUHXP43Q7T4+8Uj50Cxn54LSpyb5uO0bBbmHCYHl9SyZ
         v3VF0sa6deHaoqcqcsSYJKo162nTBd2ikYZ9J4z/pF3lTnUr5dSpGNJdn2a25maVJeVl
         QyNe7/yVh0QlloT89XB37nq79xaImwMQ2BcXb3CPlseo+hRO1oxuY4nraih1Q80f1rdh
         YhKXgFENfwFUjemmeUUSq9qoDsgUt+hFpg5BDUCnrPgRLtKW4rFkPwHZzfX/DaGMHBJ0
         +K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842466; x=1788447266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbKY6MBOa0oB1ZoBMbPN3qx3VwVEsabbJ6U5jSNhb80=;
        b=G+FMqTKIS+xs3eQs3mb903a5IJfUx6E71AUh1mi5mTeFJI4EK2WUOWZ98TvSJsfJOT
         QKoO4gLfONxV826bvhftTS5bvqDouKePmbun+WOmRBaAmCSyoOb2mJmT754PD2qBnUov
         2RUys6aI3Zm5CeAPrBdnHKWccyK62zDZdKj3hXT/okTTItftTM/hZi4iRVxIZdwP1EMg
         oOkY63e5SGrVXeWZ77MH07av+cOv2NvyIORBIbgY5PgaiR4JtXTaA4euOwAT7c48U7Mz
         J7+Vrea73G04yDXWTUg+CeHxB/EUeIcxAJs1Iwst1YZ1gUSp6gXBISUCJ/mUYjRbfI97
         CLhA==
X-Forwarded-Encrypted: i=1; AHgh+RqcypsrFNjR4PkpRG82r8w8b//e7jPy6dUCSWfRclG5Lq367qBzEIyzpK55zgA+fnvUYZPebDjaysITJs8=@vger.kernel.org
X-Gm-Message-State: AFuF++lXWPOgwRir+2K07SS4jT7wygYkdhcnbkTZhyU/lfyhGqJW8h24
	SZiabJ+Erc+HGJYLAzXSvXmRGU3+hsEhq5s+BcLXqOXzuGO5PdrGrztGaWjeKwANGuhga9BEUoA
	dk7hblyBC4HC9yWVQu63A9gX8Qa3YJH0=
X-Gm-Gg: AR+sD12CcaSX+jaOSmZlFdkpc/tMvz7JAL+m9kYge4dD0XWTymuGUxhvwpJa0IintH1
	3IAueYt24M01UA/Rk0iQPhVpl5GkHA3GNqUkbuffseOh6Vn3SOML/+86UWh4Uh0Oe6SppVm0Smp
	fcl30SBV3oGUUeAGLEVbtBOTlilFyS04Rr95SiHAqOjCsYjShs/uqwPy3Zh+2S5Oh3nthEL23id
	OxaBHB0A6KStld4su8NxCJoxrcypM/hhMHW1Yq+k+35gFtmAQlxrZ6FOJvUUlNr21W+nEAPoouq
	iNPWF6ctpXbljvkXxDm2K3ttNw2fczhhVF8i22N4QBswh1EDRTowrOW8e9gpgNj7n7dpgw7IyJL
	T9g==
X-Received: by 2002:a05:6102:3353:b0:781:210d:2897 with SMTP id
 ada2fe7eead31-782c1804fa7mr4610077137.9.1787842465075; Thu, 27 Aug 2026
 07:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apA3H9wjxmEywmk5@sirena.org.uk>
In-Reply-To: <apA3H9wjxmEywmk5@sirena.org.uk>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 27 Aug 2026 16:54:13 +0200
X-Gm-Features: AcwNN1VTVrVILAfVL-XGKdB48xP3TUs8HMKahRqiSE9q2tCaR-DEximXSKokc7o
Message-ID: <CAOi1vP9AcAJD+1KswJ-mGrK5NhTs0hKwD=ANxhtRk2LKmxmPpQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ceph tree
To: Mark Brown <broonie@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Chao Yu <chao@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the ceph tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/fs/ceph/addr.c:947:4: error: call to undeclared function =
'fscrypt_finalize_bounce_page'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>   947 |                         fscrypt_finalize_bounce_page(&osd_data->p=
ages[j]);
>       |                         ^
> /tmp/next/build/fs/ceph/addr.c:947:4: note: did you mean 'fscrypt_free_bo=
unce_page'?
> /tmp/next/build/include/linux/fscrypt.h:380:6: note: 'fscrypt_free_bounce=
_page' declared here
>   380 | void fscrypt_free_bounce_page(struct page *bounce_page);
>       |      ^
>
> Caused by commit
>
>    0137f53184252 (ceph: use fscrypt_finalize_bounce_page() for cleanup)

Hi Mark,

Sorry, this commit isn't there anymore.  It was a minor cleanup but
since fscrypt_finalize_bounce_page() got removed we will just continue
open-coding it as before -- it's just a few lines anyway.

Thanks,

                Ilya
