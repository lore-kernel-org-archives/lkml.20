Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605973B14A3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279119; cv=pass; b=jvTotcIOviJW2vI871U0ma+WoL7CGNjpC3ubD3RyoVt114Wqw9vAh0SB2iSO28F3SsdpwAgzYVqtorkBS3PShT5iHktlcfzODoVdeBiQdr0MZzI20vaORu+wRUuepSryIhjgiEdXNb5z3nOrLHROWfGOzoA6e/m7xGKJC6cDZFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279119; c=relaxed/simple;
	bh=XL2BqdaDbBQGl2le1+e15CvxQeIuTY32niH1hZcA9BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lt9rw6N0R9FeuZPnAIbLizt8D3RTGSg32M/GCWOVQqZefQ6nLhvfAEEDpJV9RCTk930SiyefoCxTuW3NUacTOGoM44jdwk5kT6/Fy9rHPYNHRkwil3jwkNKN4JiWsOqLUs8uu8W0EkGkD8Eyzd8DX0t2AYtiy61U0qT/Omor1vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBuD8yye; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBuD8yye"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so1010819a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789279116; cv=none;
        d=google.com; s=arc-20260327;
        b=GYl1qkC8NrOubO5PEHL4PDmAEuQ5G2LInPHyx3ovIID72qe5H4xlMz2Be02/nsCaf2
         +YeFu56zHxXZuGqfQ2F3/xqcVMIG+CSP1C/qG+CwDzCEw5RWhjZNtV1alO4DhUhrxhBz
         2XP8SnAaAkGJ8U+ytpuPQ+SPVxqvCkIHmUPQaQ+bHXTKkXI9wkHmWSYxnIJwS30DLXdN
         aNpsyuXqfsooM2fhpptJNOpFq+bTjM5I9eAKwI63TbJpjZ9iWWJiC465qQpt978nkOSu
         v4mir4l5qjYGyG/WGXlSl6j2/pgwr9p2rOvZRcApFNCLpoQnVUFsA4h2d72/Nbb+Kev9
         urBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUEiueZZV2yqlkScy30M7jIekL7G0zJhj9udl2hgLjA=;
        fh=TrPdbOV6YNWQAU8Vs8VWjiwcJANxjhs3pdJ3vQOo/RY=;
        b=iAAwnSNwMhKVxDGrnk29V1K9JgK41Y/q3t4Zk482XQVXu2CJ2txupd0q885V/CZ01I
         QB1t9OB452fLYP9VKW0OL/PBZN+K6kyOpQsWETruZeqHY84LCtna3zAWqHEdaLwiRbVs
         xe1dh/mCkmfarpZx6i0PAo6+YPARCcCgmLSjwpj1lcCwRzRwnFWqwWh7hDCjSb2JcXu7
         oRSFRCBxoME8S89OIe1dpkQ8Tn2dOZLyZ/NumtwARQmU4QDVPaRJqYrpZDLXpUARa4EF
         9Rb4IL0dcU8IACENsAp9KY5ccEpkCvwO9sI3CirDSBSawNH54nEbIWSON7CuyYrX0duV
         3AtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789279116; x=1789883916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IUEiueZZV2yqlkScy30M7jIekL7G0zJhj9udl2hgLjA=;
        b=RBuD8yyeGqJZW6JT2zXOEdjG709cS90bvQPawkony/4PHo31VpQBXplb/XzfihFiMT
         sf3joOUpOWsqZk68cgVD0pfoDowMHFVHZK2DyrB7lyZn8oOWZgOycO8FYpZRQvQDfbsf
         UvGY0eQ3iMSasHWbPtczfK89PQpMqa5MQWkJPf8GvG559F5KDEREe2GQ5/hyFNmHOEas
         JOl4OOp7CLIF8ktKpsKXAi9nL48Lk1zy7tQT+f8m8Rs2dE+AGme59El+XEHNBbsyZ9YX
         zKMJJfLk3dK7zat+niAAZh6Lx5nCsI9jo/557tOVqA0RSPcKq771BoIuYBwmQ58WoyAB
         M7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789279116; x=1789883916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUEiueZZV2yqlkScy30M7jIekL7G0zJhj9udl2hgLjA=;
        b=rTpukvdYzsyCLhrCxz5Xl9vB0gVYaHhpzGKzyLg1Kksx1lWuZc7PubxgateFDrFVX2
         nt6QjApUConTQzXY023oLMP+14axlH8WopmxqPkVcz8lU0nsaiMZXlAxVkGO5lV/E5u2
         vG94OlPPqElUVo/+7V4XTZHkLEvpRWTWnUBZ65hhz2JlOIMbq0qJeavO+RlUME8LqR8S
         ffV6uMWHZtdW1+fwIGBHkoYKXDhcZpuorqgwvbEfdOptkiJHOqsFZlfjvMM8UfrOmYbc
         qz1kTQQhxbgPyFxoOT/uaWvXOq6UA2IcMv37zOU5KgUuIFOL3vhOeybLYrmiYO+qCJZi
         zG8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzilTVzkvgcfxlVYqSUHxqFbkRuPHU5B62xgmKuSiuCavt7pGEJM58+K7hODD44eCz7WzZHrvdaMrT6JdI=@vger.kernel.org
X-Gm-Message-State: AFuF++mnFtV7cYW357YLty+zJVnKk5EVCCVKsYR/j9wo1HEmqejiuXoB
	gQBxtR/2tWTSh0ph44whV9kHtaKXg9bNjCNchrOVzDKZ63vFyTqEySlEsg1+TA/1/2ZJ8O2dc2k
	IQcWCYlce1CYN4QOI66oG8S7L2Tbu8tplYtHS
X-Gm-Gg: AYBFou1sb1SNlwi0D9jBWAXB5YDjJyG3v3S7Bcz0WWjILUbVNs7JiZvdz6W3uKpbPnD
	1lcmJlAxhhJH+re1rICiaSDIxjQDhmmG+lEd0OmUtXhtW+xpdZQfdhBTkcK4mRvu6cV1WvDYWPm
	ekoaOajib/hlX1VZnDdSK9rPB8IMdMthgqmIrdTFYJjgRhyC6itOlnkSlwEJXaBiUo0pXe6xfnz
	fWx3sJoJwNwjem6+W4UE99qGL+uO14aEd5gedaaAdiu4zdUB9ke657lDBysLzmwxqe7w98mUola
	DeB90yGG7J4NESSI65Rob5nm0ItlcR5A5YgZkcbFRJ0B3cb8EvvRcyTLZMBsyjQfPeoSzGhsKmJ
	dmQXoy/3FdiXJfQ==
X-Received: by 2002:a17:907:1c8c:b0:c29:5340:182e with SMTP id
 a640c23a62f3a-c2985725e75mr277141166b.2.1789279116193; Sat, 12 Sep 2026
 22:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c8efa35aeff7b6ee4f66f1d48d4392976dbde128.1783329551.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <c8efa35aeff7b6ee4f66f1d48d4392976dbde128.1783329551.git.u.kleine-koenig@baylibre.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Sat, 12 Sep 2026 22:57:15 -0700
X-Gm-Features: AcwNN1VGFA-W-o06oLsLxlJUvDoT8ZSEjCsjMCAPFTIzYsU6qr0WR_WS1UZO_W4
Message-ID: <CAF8JNhKhL3pC2yvMxg87R9TKJ4-b1vQ8Y7J8hWmKOLHCp0on8g@mail.gmail.com>
Subject: Re: [PATCH v1] HID: wacom: #include <linux/device-id/hid.h> instead
 of <linux/mod_devicetable.h>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:39=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:
>
> The single device-id structure that is used by drivers/hid/wacom.h and
> its users (drivers/hid/wacom_sys.c + drivers/hid/wacom_wac.c) is struct
> hid_device_id. So #include the much more lightweight
> <linux/device-id/hid.h> instead the full <linux/mod_devicetable.h>.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Acked-by: Ping Cheng <ping.cheng@wacom.com>
Tested-by: Ping Cheng <ping.cheng@wacom.com>

Cheers,
Ping

> ---
> Hello,
>
> there is no coordination needed, just make sure to apply it to v7.2-rc2 o=
r
> later. So please take it via the hid tree for the next merge window.
>
> Best regards
> Uwe
>
>  drivers/hid/wacom.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom.h b/drivers/hid/wacom.h
> index 1deacb4568cb..d2398b1cdbb2 100644
> --- a/drivers/hid/wacom.h
> +++ b/drivers/hid/wacom.h
> @@ -82,7 +82,7 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> -#include <linux/mod_devicetable.h>
> +#include <linux/device-id/hid.h>
>  #include <linux/hid.h>
>  #include <linux/kfifo.h>
>  #include <linux/leds.h>
>
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> --
> 2.55.0.11.g153666a7d9bb
>
>
