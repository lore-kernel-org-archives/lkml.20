Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2460A421220
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790530219; cv=pass; b=Tg78EQs84fVxgpJm/OldHuhmYXKWol46fgPdD3fR0WDfPetAa9bJfw5md3CgSJJt6Mubo7ClVlD22Eu04340Y9w7tHxH6+UfEnb+MpHiYjAsmwWu9R0CiGZgJqlGQIcFpwtSkSL/ccGBcEuhQqd18zUFOTrfYpaECd+xDZQA9Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790530219; c=relaxed/simple;
	bh=dD1UhjeT7zU7kb1z3bo3WT69W4Or/n4qKZs34fNelHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0V2+GxPx1lEPVObxl+OUcv1yyvrwbM8CyxIWF2eKY8lZI/+JUlgZPVGzCoqffjhuU2hXlus/b5dZuNVS4wQock9Czkj4hYcMEj9lA9wLlt77NkpBAyUCp54RTbUiS29KRcLhMdmDtc2WXFC42aQiaI5PyNz4pE3ml8hWgWnceY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9wGJvUf; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9wGJvUf"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae7b7fe22so3825373a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790530215; cv=none;
        d=google.com; s=arc-20260327;
        b=mPKnXwcmLQauVRDpqGRRroo6phF0k15g0WSgC5bXA4e7kXftvM8/bbhK5QWOBLGvdr
         B4uzcHWhTj6I5H8viCPswQhqoE8vlz1NQPoOBpzHTiUFz5Hx2dKrWZcypvZc+8EKj27o
         ei5e7G8IvXxw4HcqFCdK80hf8L3IaqWEsE7wnxHNZwvthW68e9z6GmP2h9KURcQYT39A
         0QDf/gkvHXOjMn0R5djXXZzTkV63tyfMYah7cEV9rwPv1ZGBksrxSKsjqA+LyLBR0Pl2
         kWKN3D5yTn9QZ0uDj7C0+Vswg99CpBaIjrgD2z9iUhAxvwZV06dbs6Morqw2Pxl8a3mx
         E97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nA8xqLD0QYF3fgc9wwDqVyrLzcYng8dIPEgQq7nNoy8=;
        fh=QGfL3PZbZYG1Ok77qvudVwcSuUy5NyKIAvb/1K54RDQ=;
        b=IvbMYlmEen15KAWHKSxXTtSqnQ0DJFEAX2cdVQzTEqo2tUkh5BcmyrYygVQo1ztv4r
         PWnw5CxPt61dkb3HgKmArKwT0ejGqUY8mHyuzm6lv+POMGc9zoYttj9ILfAqFuZc209T
         RY/oBdLmxtk8lvgbIYQlqbAiMfA37rdGb6FDbwGsFImlRh6F6zEwg2P+aMzv2EZNFzzI
         Ww705xvoxzDccXn5bHmxhtI0MiRhAfSp2DJQTdPxCklCY7T1hhLe7sYMr3Jgr0uYxPCY
         r87X6nfh0pW54XPwOak2ufcSoZxalW4xqabS7mlX8OjQdBbfYSsmToN7I/93QQwTNXB+
         kqFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790530215; x=1791135015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nA8xqLD0QYF3fgc9wwDqVyrLzcYng8dIPEgQq7nNoy8=;
        b=W9wGJvUfaVf2zYP9EfFU816ywKwCu9LyrVOTXSMUvCgfY3wsFCmzT0kWBVCwJMUzQs
         lcstrJUxKHWbf5d0UCZFvNkNgUVNGKO6a1RJZ37KbqOZGXbuwI/J+R4WQb8eAu50kij6
         +oBnbRMkeRO+aaPVl8pG8dmzK9GLWJUzlRGJZZlfQ5BZp+wmPrmK0WLqCxBVTrQXYThx
         RXe7nwkON+CYucWKe5sG46PW0pwdqW+WY6rWaG8JnqUWWLFl8XT4B0f4gA+X19rH4SQz
         TmRQy6upRhwbScSuYbnSLlAWes4oUYBp8KP7auCpXDh02ht+sEB9GwyTvAuZlQB+0hDM
         W1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790530215; x=1791135015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nA8xqLD0QYF3fgc9wwDqVyrLzcYng8dIPEgQq7nNoy8=;
        b=1ev6505qZX/ewSQYTFvb48BgMefBxhNlJyDTkIN9XxDFQ/kFGIeo4FzM7ugDRAxKE6
         Swkd2t2a6/GZjETvVtXEE5aVK2H5xtLonPZThWjvDW9sZ4UfHf+mvekzSaLNt3F46r0M
         7e3+g6nzL5NDmzqhKL03sc4gOKgutGj786ask6YrkLVNfD+DhKIWPZzWFOlARs33cZy7
         0MJxgwgpGPH7RXabZL/Z8EDsNj2Qe3n7w1QJ2wRh6oUplmNcE94/YHZcqio6YEulqrp/
         lra/JcVmH0xIExkJWT2VwuxlVOOIZzbh+rz8vabpvQTCoZjmq45kiDqReEV4y8ROC+cM
         +YTw==
X-Forwarded-Encrypted: i=1; AKwUvBw7LLQDIBRfNYZmrJUwcMe7iaO85fbuPy3fNrO5ZnpsRtmtouD5QC2uyy8bLk0/1WQy2gO2cAmUZ7Zr6kI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfYYe1sTp553QBfVNPYtoXS7kWNciFUYgJ4fOUh1Puy8+xiDT6
	dEjEQLQq9ouocnNaSLtC18/IzIHQ4lUk5P12bphAe2U9+Y+Jl2MAVqr/f7TFiAeWByZoOEfSL0/
	0yXDeaZjeEdPcy1aYiLz8L3M8bHsCAA4=
X-Gm-Gg: AYBFou0vhEHCe3WmYScwLRGirqhdN+mNGcfEjNmHlybe5zoFBAyoG55ULfkFZNi70+2
	FTNNXnGyi+92UvMyZ/PM99piOUuBPA5EqsjLuBuVZbFXf8edPrNZTGfaW3PA9oAfElooYzpPsdE
	6Wt9kWYPKr3rv46NpIOjAtwxPDOOftwm8nAPLaQRNEz3dPI+TJswPx8RRb4vn8++eDd7MEkgIoB
	nSA6Q13nmcaxfev4Taf1ZVtHhy5w3tzJIgzFa3ejEuSQZ3PMf7JXspH9pmaZ5fWGH348NQvSs/W
	Ced6ytbTeoXnKLzCcaGmd9Hy93CSv4JjrEEkI74YbZX+wlbfqqxpt9syepAa+GpIhtG5CTRewV5
	QJ/NrVlMpXfbZEbDONAbwwln7qifhv2fKH8926xTWp4d8SJ+swg==
X-Received: by 2002:a05:6402:a0ce:b0:6a7:ee55:dcc9 with SMTP id
 4fb4d7f45d1cf-6aae8eb507cmr4939715a12.24.1790530215085; Sun, 27 Sep 2026
 10:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>
In-Reply-To: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sun, 27 Sep 2026 22:30:03 +0500
X-Gm-Features: AclHuK9Hcmu4RWyjIGBf_-swUxL5jtq3uZ3np4nkJaYCT3zSshFwDkgb_FjT-UY
Message-ID: <CADqcGB=Jfg-=UoTnFJRv=+=RoKX4LhCz7sr4TVPS7F4_xG=WhA@mail.gmail.com>
Subject: Re: [PATCH] Input: raydium_i2c_ts - validate report parameters
To: Pooyan Azad <pooyan.azadparvar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Herlangga Maulani <w1zardsec@proton.me>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pooyan,

Nice fix, the size validation and resize-on-update handling both look
correct. Two quick questions:

1.  Does the IRQ handler independently clamp the per-packet touch
count against RM_MAX_TOUCH_NUM, or does it trust the count once these
static sizes pass?

2.  raydium_i2c_query_ts_info() can rerun after a firmware update. Is
the devm_krealloc() of ts->report_data protected from a racing IRQ
handler?

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>

Thanks,
Muhammad


On Sun, Sep 27, 2026 at 4:44=E2=80=AFPM Pooyan Azad <pooyan.azadparvar@gmai=
l.com> wrote:
>
> The controller supplies packet and per-contact sizes used to allocate and
> parse touch reports. The driver trusts these values without validation.
>
> A packet size smaller than the two-byte checksum makes report_size wrap,
> allowing the IRQ handler to read beyond the report buffer. A zero or
> undersized contact size can cause a divide by zero or make the contact
> parser read beyond a record.
>
> Validate both sizes before publishing them, and reject reports that
> describe more contacts than the input device has slots.
>
> Allocate the report buffer once valid main firmware information is
> available, and resize it if a firmware update changes the packet size.
> This also handles devices that probe in bootloader mode, where the packet
> size is not known yet.
>
> Finally, return main firmware query failures from initialization so probe
> and firmware update do not continue with invalid report parameters. Keep
> bootloader HWID query failures non-fatal so the recovery interface remain=
s
> available.
>
> Fixes: 48a2b783483b ("Input: add Raydium I2C touchscreen driver")
> Link: https://lore.kernel.org/all/20260728135127.48971-1-meatuni001@gmail=
.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>
> ---
> This partially overlaps Muhammad Bilal's earlier patch linked above. That
> patch propagates both main and bootloader query errors. This version keep=
s
> bootloader HWID errors non-fatal so recovery remains available, and moves
> report-buffer allocation into the main query path so size changes can be
> handled safely.
>
> Compile-tested with:
>
>   make O=3D/tmp/raydium-build W=3D1 -j$(nproc) \
>     drivers/input/touchscreen/raydium_i2c_ts.o
>
>  drivers/input/touchscreen/raydium_i2c_ts.c | 64 +++++++++++++---------
>  1 file changed, 39 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/t=
ouchscreen/raydium_i2c_ts.c
> index 0256055abcef..1d7f53d0b9fe 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -64,6 +64,7 @@
>  #define RM_CONTACT_PRESSURE_POS        5
>  #define RM_CONTACT_WIDTH_X_POS 6
>  #define RM_CONTACT_WIDTH_Y_POS 7
> +#define RM_MIN_CONTACT_SIZE    (RM_CONTACT_WIDTH_Y_POS + 1)
>
>  /* Bootloader relative info */
>  #define RM_BL_WRT_CMD_SIZE     3       /* bl flash wrt cmd size */
> @@ -331,7 +332,10 @@ static int raydium_i2c_query_ts_info(struct raydium_=
data *ts)
>  {
>         struct i2c_client *client =3D ts->client;
>         struct raydium_data_info data_info;
> +       struct raydium_info info;
>         __le32 query_bank_addr;
> +       u8 *report_data;
> +       u8 report_size;
>
>         int error, retry_cnt;
>
> @@ -341,26 +345,22 @@ static int raydium_i2c_query_ts_info(struct raydium=
_data *ts)
>                 if (error)
>                         continue;
>
> -               /*
> -                * Warn user if we already allocated memory for reports a=
nd
> -                * then the size changed (due to firmware update?) and ke=
ep
> -                * old size instead.
> -                */
> -               if (ts->report_data && ts->pkg_size !=3D data_info.pkg_si=
ze) {
> -                       dev_warn(&client->dev,
> -                                "report size changes, was: %d, new: %d\n=
",
> -                                ts->pkg_size, data_info.pkg_size);
> -               } else {
> -                       ts->pkg_size =3D data_info.pkg_size;
> -                       ts->report_size =3D ts->pkg_size - RM_PACKET_CRC_=
SIZE;
> +               if (data_info.pkg_size < RM_PACKET_CRC_SIZE) {
> +                       dev_err(&client->dev,
> +                               "invalid report sizes: packet=3D%u contac=
t=3D%u\n",
> +                               data_info.pkg_size, data_info.tp_info_siz=
e);
> +                       return -EINVAL;
>                 }
>
> -               ts->contact_size =3D data_info.tp_info_size;
> -               ts->data_bank_addr =3D le32_to_cpu(data_info.data_bank_ad=
dr);
> -
> -               dev_dbg(&client->dev,
> -                       "data_bank_addr: %#08x, report_size: %d, contact_=
size: %d\n",
> -                       ts->data_bank_addr, ts->report_size, ts->contact_=
size);
> +               report_size =3D data_info.pkg_size - RM_PACKET_CRC_SIZE;
> +               if (data_info.tp_info_size < RM_MIN_CONTACT_SIZE ||
> +                   data_info.tp_info_size > report_size ||
> +                   report_size / data_info.tp_info_size > RM_MAX_TOUCH_N=
UM) {
> +                       dev_err(&client->dev,
> +                               "invalid report sizes: packet=3D%u contac=
t=3D%u\n",
> +                               data_info.pkg_size, data_info.tp_info_siz=
e);
> +                       return -EINVAL;
> +               }
>
>                 error =3D raydium_i2c_read(client, RM_CMD_QUERY_BANK,
>                                          &query_bank_addr,
> @@ -369,10 +369,29 @@ static int raydium_i2c_query_ts_info(struct raydium=
_data *ts)
>                         continue;
>
>                 error =3D raydium_i2c_read(client, le32_to_cpu(query_bank=
_addr),
> -                                        &ts->info, sizeof(ts->info));
> +                                        &info, sizeof(info));
>                 if (error)
>                         continue;
>
> +               if (!ts->report_data || ts->pkg_size !=3D data_info.pkg_s=
ize) {
> +                       report_data =3D devm_krealloc(&client->dev, ts->r=
eport_data,
> +                                                   data_info.pkg_size, G=
FP_KERNEL);
> +                       if (!report_data)
> +                               return -ENOMEM;
> +
> +                       ts->report_data =3D report_data;
> +               }
> +
> +               ts->pkg_size =3D data_info.pkg_size;
> +               ts->report_size =3D report_size;
> +               ts->contact_size =3D data_info.tp_info_size;
> +               ts->data_bank_addr =3D le32_to_cpu(data_info.data_bank_ad=
dr);
> +               ts->info =3D info;
> +
> +               dev_dbg(&client->dev,
> +                       "data_bank_addr: %#08x, report_size: %d, contact_=
size: %d\n",
> +                       ts->data_bank_addr, ts->report_size, ts->contact_=
size);
> +
>                 return 0;
>         }
>
> @@ -428,7 +447,7 @@ static int raydium_i2c_initialize(struct raydium_data=
 *ts)
>         if (ts->boot_mode =3D=3D RAYDIUM_TS_BLDR)
>                 raydium_i2c_query_ts_bootloader_info(ts);
>         else
> -               raydium_i2c_query_ts_info(ts);
> +               error =3D raydium_i2c_query_ts_info(ts);
>
>         return error;
>  }
> @@ -1116,11 +1135,6 @@ static int raydium_i2c_probe(struct i2c_client *cl=
ient)
>                 return error;
>         }
>
> -       ts->report_data =3D devm_kmalloc(&client->dev,
> -                                      ts->pkg_size, GFP_KERNEL);
> -       if (!ts->report_data)
> -               return -ENOMEM;
> -
>         ts->input =3D devm_input_allocate_device(&client->dev);
>         if (!ts->input) {
>                 dev_err(&client->dev, "Failed to allocate input device\n"=
);
> --
> 2.43.0
