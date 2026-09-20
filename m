Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47502DB789
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789911869; cv=pass; b=PnltQsryeoYpecetz/JKpErL4o00zf85pWPo4RMmbOvODrZ+zipZsre046SCwrlCyYasvUEKhtH/pRLsSc+6Ry/JMAzzL9lgxp1AhwjD44MjdXXE+wPJCi8BbDfn2caI3e+omIjdO7QVfpcezBUSth7/U4QcG/oLrPb59GkUoJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789911869; c=relaxed/simple;
	bh=UXA2zp3XI42BtFvhO8xS/jRT2Pk6aJkddDnJK1FECbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBvK6ktkNeh1T/7x6FGHGjM41k8eSP6X+f/x5ahBatlwy3ErJS83qUGsit3RFntn0U71V5Lvk1Brx6QQoBeIOlKWTlnqUNQcfOS+9BxtvripPrjL05NdQX+MmgCCuPttPFJCJ6N16D8jq1JQelVoYGgHjEvmQkJsQ2Pu8RUAOg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgyK3aQ/; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgyK3aQ/"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a9b9so1488803fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789911866; cv=none;
        d=google.com; s=arc-20260327;
        b=C49YodrrFDbVa/tvbnX5crSSt8ASe/v4WvOomOdkDeTNt5W3L28Lv7624wAAu/Ak4R
         pe4yipbTdfz7iZEHcKfBoqMSvKxKU054qunxfQEkWJFxx7MrFwPK9tyuKLXUttLLihpz
         ibF7R84hrKizycRdSgQhlKiVVcDl9FwOG29ebzUTejLbe81ivTx5hfdZeNgIw1xB6LVT
         w2IOCNjOfcYGjEc2coH5tjiX10gxm+aqgUMzzHzsm48cuzaHFrzktubqIKQ/lxcsrXeD
         N4VfIvccx23kF48qfAm4EACQSZukGmursPK0UjEvfcpCRMf9AFp3pAmp/EUYz/XpLfWc
         XbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jEX4twDo/lUtcmDOQIlSIon0G7yYx0diVyTZgm1EyJs=;
        fh=lvIJb2x73eQL2w7qqaxxvxJ0yH2vdTmiWZ/mNhKN4f4=;
        b=gp8Y2mrx1OKnL9fNs+/IXSgh9H99CmWjToJxEjcFzmXKsGT4Pj0PuzM7kf1gEnQiOw
         qWmudvCnEvenGNXOnIbSRJ/xWQfcGQAueun+T7BIkuq4fjDkAGyIPfGVDC6VzaHZwRBx
         tHza+AG9OPf6Nuf7d6pCSrnW/0D7U4ghE5IZmaZsaxb+byw4SPSbW8ZCEt2B3RmUUdjf
         wEQ3UayiU2yGshk/RNVJeLw3G/gB+u44RTWLKmbHE3r8HeL7QHO+Jz0vBl34PrEwyxbw
         SMU0e6t/SAY9Yu/tsgSKCZZWC+MwXWXXvPJrAvgDOlc3GulreQ58EwO9xdYuCzhoef9V
         1llA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789911866; x=1790516666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEX4twDo/lUtcmDOQIlSIon0G7yYx0diVyTZgm1EyJs=;
        b=MgyK3aQ/6h1HplUODTa1qy7WG0z8Z5ZdGNO0jOHmwacei06LtsH2Fk6oVa0IXXSrsn
         ndu0aaG56AS0YeFvEAR8ZUs0yRuMUMpuZiZHCPgvuFot1DgKOlMeGmsQvuX7GBRBP18b
         QXZW4oPS9vTsaOGkU3PeJwzgvOyvMI8zFDQJgxqNqD+ZZucweBFQeE4eAvWK820xXX0+
         itGJyuKMIztS8wjbPwZPt+slgpFESRDFhJvCzvEsou45HxdwMKYpewzLqVVcYxGESHpL
         jcyZ4AQ+aF2tX+mBg+ztnprVe3Rh1YEonH7Kb7/ZZ7oikbiu0kMLO52ZH7f9aQbInsbA
         2rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789911866; x=1790516666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEX4twDo/lUtcmDOQIlSIon0G7yYx0diVyTZgm1EyJs=;
        b=1MYhXJEDu2y1Xvhpyb9GBmiLsRf6G4LRtNBqpcTMaixbFWw0ZA14UdG4x62jUtD6bm
         QmR5K80RkKb1fsh/WP7lNSHcyXCpvzLv/Kt0a/e9vtO/03ImnTcM/kW3rg1AECaqLwqR
         mX/Bl5Iyq5wPh7qcWUDpLhZIfl0zpYqANnVsUyRetggy8Mi2TKYd3fQPUIu3x7AwQ7oq
         7ki7yaGbAdUNSJied41+yIFPTsxhgbpNsITQbu0FoI2Y/oVFJlyLqBOoQEUzBS2NVbDO
         8uDDET5fSQbjZVqm/N1PrS6PVPyJCSrDiFM+AiJ3gVar0r55+BXi6ao9hxRTD5GQlMI5
         YK4A==
X-Forwarded-Encrypted: i=1; AKwUvBzCbmKYJP+BkI0/6X+c7U+QYqecFT4sEeKI9PqRfhQxbBTrUw/yz5AYAqPgyx0vm3xFw+NE2Kzal9BGQ6I=@vger.kernel.org
X-Gm-Message-State: AFuF++mVOKBnRV89FA6a07MfVAds6fRWO2yYcADLfV2EGu1Pk0hEO40/
	i1Ve4Z9YCXKsCV4AiRL5wmwqMxqEAsdNc5xG5diSA0h+3DSp/60KDn4hvEP4rweKrORQHbmBQee
	W19vgu0eMp2CGCeDXnmhZa/fqwa6N4D8=
X-Gm-Gg: AYBFou08R0Z1hqaSlUpwsxsD/CpOpugpl/q1aMxH/AmJqw0xDRw7bwkV5SSjgLqgY4F
	1GZWpUW6yhmRJQcXZ9NGsZY6q76ilz6sY08gQLo4lmaYJ1ZZOcIxnnRrEkBuMiQtdwnZxpW2U1i
	KwKUbQl8DHJroPgnkb+GI5PWqpZNguooII9dDigIDvs2NBqrJk24YYtZjd3GJUA4lM7ZI++qE5o
	rvKLSNdS8LuzfkRWzyZHmHc9RK3sDezFqafonSZwvUaW/g6HwU2FMnRzz2EdTAgEXSe+4rKK3pz
	AQq/54ptEu6TV52wGNwyleUDAFuqwsjWzB4nkqbFaiwWPS8dKi0+9abGsaC9vHTky7YK3MxZDaQ
	61YigyUpeZoZr+KdaaO6XBM20QqLkYKmKMRjdeW77Mhddmpz7fPhaHBCr
X-Received: by 2002:a05:6870:b28e:b0:47b:7709:5568 with SMTP id
 586e51a60fabf-486e564dd74mr6640425fac.10.1789911866617; Sun, 20 Sep 2026
 06:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914110145.41627-2-dirk@gouders.net>
In-Reply-To: <20260914110145.41627-2-dirk@gouders.net>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 20 Sep 2026 08:44:15 -0500
X-Gm-Features: AcwNN1VT3jlE_HOBtpGzW4wVVv5zCIPL3np61n-V3xFqz7HoPcojwrQzLe6U4Bw
Message-ID: <CACVXFVNZga4LMOep2U9XgGHE1X0+FMESKL9uYmeAKETf2qu1yQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: fix unused_result error
To: Dirk Gouders <dirk@gouders.net>
Cc: Shuah Khan <shuah@kernel.org>, Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Linux Kernel <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:11=E2=80=AFAM Dirk Gouders <dirk@gouders.net> wro=
te:
>
> Commit 166b476b8dee (selftests/ublk: add shared memory zero-copy
> support in kublk, 2026-03-31) introduced a write(2), ignoring its
> return value and thus causing an error, when building.
>
> Fix this by using the common workaround "(void)!" to trick the
> compiler the result is being used.
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  tools/testing/selftests/ublk/kublk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftes=
ts/ublk/kublk.c
> index 2400b4615766..5b19bfcfa8d7 100644
> --- a/tools/testing/selftests/ublk/kublk.c
> +++ b/tools/testing/selftests/ublk/kublk.c
> @@ -1589,7 +1589,7 @@ static int ublk_start_daemon(const struct dev_ctx *=
ctx, struct ublk_dev *dev)
>
>         /* Signal listener thread to stop and wait for it */
>         if (linfo.stop_efd >=3D 0) {
> -               write(linfo.stop_efd, &stop_val, sizeof(stop_val));
> +               (void)!write(linfo.stop_efd, &stop_val, sizeof(stop_val))=
;
>                 pthread_join(listener, NULL);
>                 close(linfo.stop_efd);
>                 ublk_shmem_sock_destroy(dinfo->dev_id, linfo.sock_fd);

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
