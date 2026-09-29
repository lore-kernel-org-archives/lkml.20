Received: from mail-pj2-f21.google.com (mail-pj2-f21.google.com [74.125.227.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275751DE01
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.149
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685491; cv=pass; b=DWlT+trIdMpH+9s1rquS9CDm6Qi9QS8yIoSuTDqUEvrO6G5Zd7svOk5YkMSmuDQ4nc5AjJeqA8+Yg6grq4DW1xj4Y45L9uyubRO6mDH5a5HcoPFnBCMIjmsWP9GYhrEFi7oN6d3CNR62TDw9Fjry8JZY4ylNrKFq06m79Z7CF0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685491; c=relaxed/simple;
	bh=gdwEoK7FYkbsV8ilbpkgZH4Vf2p7L5T3GmRfoLao/do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWHrY697vVvjhgFgPrOaa6NdBTgXvPCZXmU+7TOeYY0xoe7ktAK17rrYfULtk3zjbf/YJQ7vaY6cmWHkeOI6GZ9hyzMzLQtr320mcC8xV8yOm/DIbWDpLz5aRbUMtV+iXSwe44rqZvxbyc6bDLMF4e5h/fi3tardy1jcPfyfVZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Olx30u+2; arc=pass smtp.client-ip=74.125.227.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Olx30u+2"
Received: by mail-pj2-f21.google.com with SMTP id d9443c01a7336-2d747f0b25dso26241515ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685488; cv=none;
        d=google.com; s=arc-20260327;
        b=apztK6fgU+YnnQNuk1vnLH6jhe4OAJBLzH/4J9JQeMbKwVsRyicId5e4dxx7d830b0
         uDlmSPE8KCQhNNZLY27/XymwoWODaokmPaA9QjU4+w5GK9YVumN5GOpi76RjrgPovQgf
         Z5+thIC+Lygk9SE1ryBnN3tlDO6eS2Ua/YOPLlO93c9kxoC7tA99jdXWxH3eQ2TAwkR8
         2vUF4q4CW0x+d+WVBmdx1wpRJAN3+CgaYHRvcxQYSKtF7eZFrQebDbB7I3efdbF3uhiN
         guf2cqWuWnzlFIdsZM3ynMwSuNQMRMzR2Ei5vbDfYSuruOv9Jux5dvBGpf7372ALVr3F
         UVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qoWvSXu4SSqUtmIwYczgMuYDrPposdeRENj3E/8sf70=;
        fh=gT7CvOMy9Z4KsBosJTbjadW9UKnHCPCzBQnWMLwAlUY=;
        b=d1HY06D8TKyRPrXyqooCfR5BF4x6Ag3fN9Kus+JQA1cGO/uS5Y64EYSwKCFX9HjipG
         jqod/sHCFNxSPsBfNgWrvzGFj/rVD1tHkeAcrJ8KmZXTwvUuj5spHPTeFqCVcwD+rcDL
         6QkJhkglLuKuKfJm0Jz6KbvY7BONLxLxFQwlw+6VDAySRPu1nzRrSTakGOlQH2o5cejQ
         cCYTo54VYDshAYFI4VuSf1wp5wZ1vJXWFqxAKxIrs7BqJWm5pX589HpGqJIW2P/S3e2z
         zUvnLyrTU5LO8nhNgvOxXImbO2oByI2yTAMpi/OBaX4saZBPN7IzniCAkgz3KCveRqSa
         9UYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790685488; x=1791290288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qoWvSXu4SSqUtmIwYczgMuYDrPposdeRENj3E/8sf70=;
        b=Olx30u+2vkzdBRWUin7CaqOCLIIXK1eMdtQVJTsR8tjAyFCYBTleImUPcbU8xHqYft
         IJvxM88y17wrSm5bgv9dY2qky2XIhsB+sUjp/Lt58sKAenzsCixSWDjbkbm10HXONv9o
         j77FQ9/ieXl6w9wbcMRONwV/FqlDC3OtTW7sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685488; x=1791290288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoWvSXu4SSqUtmIwYczgMuYDrPposdeRENj3E/8sf70=;
        b=SwHB8q1UElp/PxR/pV9EYxTSoajirsa1/OdBuT7hY8R6NdTTbeVZW2B7ceWRRxp0a8
         SezRUomVwZjgLeSbmcS+4wbVdkTn2YfD/Jazdc8nKuR9/0JLpUbbOgGnXOSUEah+UlAc
         8vH6nWoHDoNEQJltADf9OB3FDyXw0C29KzjOHCJ7NyczsEIQNti635nKSv1ipyArwkv9
         e+Ed4GZyXfKjyxfy9MGkuKykcRKfDL6mG7P0Qgz1/XeKIr6iMzBnKIvXa/JAuhMAR4wj
         Ig255O1St+oIGYIwYC6kYQgePleeT5n8l0l3IeSNfIhiJrBSKZBBT6ise43QUgLqB+Pw
         2yXA==
X-Forwarded-Encrypted: i=1; AKwUvBzd2bULaaStZZHDr/yTJ0vz/6qQFOv7yU29Igi7AHH7MbZk5OOrTs65rt83ZIcc94Q9vBn478UtR0t3Ykw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqWCSilu2PP5eEIx8A3HDL8YQRulNSOe3a9F/eNCmChxdY0YDI
	3iYumCkaIRptqfZ7kZ1u2NRD7dGM/VJdIqTNEqlHnPG5hO8J10pP1iDgojzXGV4m5HU64WKJJ8I
	fX7GoWY0yCRDAeSv2jWknztTgeR0OClnI73OI1dKEGEaJXkeQBLK6sOXBDZY=
X-Gm-Gg: AYBFou1zsYU02C3smlXVlqFKxEqm2WRFeoT1CeT2aRe06isSkL/83QsOHyKKFS//hvu
	G+hMJ0IEeXMREsEkRtCIWqMROiaLA9s4dl3bIRpOmKy6eOOAI+gesY7gqDy+6Eo+DogD+t/zrME
	NBogg4TSB8KpUzON/9NbRnkomUN1UQmrtRS/REZtXq5wb8JVXMfoyzIul23UCYEfm4W7YXLHfFa
	A5oHFjgZ6FazRUNL7ljVnku7UAAPKHRSjWvrOCuRahPvC18aqmx61tMoC0XHHEAJnin18dj1KxX
	LQu55BLf/b/AkBSJNKY5pZmIP65hDiEWZ5BN0Vh+8IE6u5hscjx2oG2ljjqcCJXXXJnwLjxbH/W
	nPks21Gs=
X-Received: by 2002:a17:902:d2cd:b0:2df:9eb0:761a with SMTP id
 d9443c01a7336-2df9eb07bdfmr90906095ad.25.1790685488373; Tue, 29 Sep 2026
 05:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927021649.8967-1-cnfourt@gmail.com> <20260929010937.21559-1-cnfourt@gmail.com>
In-Reply-To: <20260929010937.21559-1-cnfourt@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 29 Sep 2026 12:37:55 +0000
X-Gm-Features: AclHuK8Kr2_e3IG10_JsHj3zc5b55EX5CFHCX9UVqeJ6c3jOq4FtBB5ZoR7AfGU
Message-ID: <CAMMMRMf_5Vgrir_PtNPhvd5HDUP=_YsLzPssR+ciKtuHzqfLFA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Skip CAM query when partner has no
 alt modes
To: Gris Ge <cnfourt@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 1:09=E2=80=AFAM Gris Ge <cnfourt@gmail.com> wrote:
>
> Since Thunderbolt alternate mode support was added,
> `ucsi_altmode_update_active()` is called on every Connector Partner
> Changed event.  This made the driver send `UCSI_GET_CURRENT_CAM` to
> PPMs even when the partner had no alternate modes registered. Firmware
> that does not support the optional alternate mode details answered Not
> Supported, which produced a spurious error on every partner change:
>
> ```
> ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
> ```
>
> Fixed by skipping the command when there is nothing to update.
>
> Fixes: da87d45b1951 ("usb: typec: ucsi: Add Thunderbolt alternate mode su=
pport")
> Cc: stable@vger.kernel.org # v7.0+
> Assisted-by: Codex:deepseek-v4.1-flash
> Signed-off-by: Gris Ge <cnfourt@gmail.com>
> ---
> v2:
>   - skip the invoke of `ucsi_altmode_update_active()` in
>     `ucsi_handle_connector_change()`
> v1: https://lore.kernel.org/linux-usb/20260927021649.8967-1-cnfourt@gmail=
.com/
>
>  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d71..c392afdc27ae 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1519,7 +1519,8 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>
>         if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
>                 ucsi_partner_change(con);
> -               ucsi_altmode_update_active(con);
> +               if (con->partner_altmode[0])
> +                       ucsi_altmode_update_active(con);

Thanks for the patch.
Could you please send v2 as a new email thread?

Thanks,
Andrei
