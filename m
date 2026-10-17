Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3A7134CF
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195559; cv=pass; b=E042NxlyAxdnXZI7tgDh5vV4eVbehE8qf1EU1zo5op8kGFbuGJpc+qmNQu4Oe+O9H++YcwaprHc0WAFUp17P/5zqCWiY/s7Rsrzr5i4orFfyWin9lPM3yv0mr0abimzqGGDybmSOADZkSfOFhDFpPgMyBMe0JC+EWeDWETDL694=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195559; c=relaxed/simple;
	bh=A1yBBpLJ1bJ3Rv9E3+TAn047VSvJob1S4KjyARr4O0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhFZBQeaY53rZ6L4+n3byHUpQr6hJ2Tpkv6aHsZ2Kx/GvKH2k9kfgqg7y0EG5mF3uE+p9YeVjWMy+UOsKqEHWd+WKU9QncXfsX3ZLTfiqTpO5zw1I4G+Y4nPWzcLVMBC7l4eaQsvKmgp3mnk6ibbGdN+3kHW732jq+Jjph4ySUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdQoA7gQ; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdQoA7gQ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e762768f3so49138285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792195557; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcR9xQDovMJzl/cp4pMWhCiG8jF/7eChFcXU0GId8l5lnuVsPuDB6H4NdvqKS8E+I2
         3Jjjvs6yv/ihpoa/C+UO6EkSl+FOSZMWLliPcea9hyXYSq4zRhBXRIGwuqShwIlbrKho
         ECRuyME7uA7RiPG3uiVj5DPVTA3NIeBJn4Des6tRdgsv3myx/npdGQQ/fzyALr+NEAur
         tM/PuxCbNEDJ3UJT8Qj+XWwC3naATLFjx1qre3JtKjEbuc4grfsEqwPKUYYgGefkcX2y
         qFnnOVsMHyYAUilFZJTcOGbLWvTeQrEjCzFJvMnxnmwCVaGP/hXp6L4d/1XgAE58My2J
         OFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9m04eWmztaCm3Wj7dJ9THoHZwUu785KZfKba5Fj3Wfg=;
        fh=+zoPYm/1B6j89+SCis2cApYNkZS41O8ujT4bU15ruwo=;
        b=P6SugMwMkIabNo3NuiNapicU14UPgGaEZK8/cnE492pgzqlpfbVEGs9rabW/u0KHgd
         uJfV+vyw5O+pi6pnIYU57caNejap52PxLcvumB5b4Fv/oUGH/w+al/1dBgvnYpaEMiWc
         6jVw+vj3HP68kxogoca47JZwTfAjq4xP7M070m8pGyn0i4pKIB93PY6pNbiNLc0eECgf
         MHeOGeHadQw7F/hAuXi+GpFHwyQxcVQwYf/3zVoAedT5I4Awrz/kDT9S08xQ+wyIG9fF
         +/Bh2i+sl+q0zBI2CdCOLfKmLIIK64cqU9cggk7oIhwQw9kxvElve0v01av4k7Wz7V/L
         ANCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195557; x=1792800357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9m04eWmztaCm3Wj7dJ9THoHZwUu785KZfKba5Fj3Wfg=;
        b=VdQoA7gQkThRoloVTJi3lLyl6W/YSOqabe47GQKVkVANrIrNj272DpJkOt8kK7BT2e
         O25+869fWCIkuGNIk5ep4NhBPcwEeMhPo6YN7oPXUJhAJMHasQHWm+lHHX4hvfrr8TCq
         yxaL0JyFRJ3itPc61U2svcirnk/ScSGacEtmot7XM/BqDciMQBNiWkIz3/5jwJzKT+fZ
         GYY3h/jDDsdIhuMsLRo8DqGZJWLLSIfRZVMrStrrODCj94/qVzQe0pGcRp932x9ISP5Z
         feYo6R3tpaxUje6WmGbIJs1FlLFD4V+MhciT/IqX2m/CKnJAiX5041XfbqJG8mqzVo4M
         h/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195557; x=1792800357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m04eWmztaCm3Wj7dJ9THoHZwUu785KZfKba5Fj3Wfg=;
        b=NVOwXbi6NGcU2hcpqodZX1pqkYxpeGy9YPddnDhwQgwp55h8qKv1vfhvClBUrfkdh3
         V2ey800rpVgk96bQiQiBp24wqIPVQT13jcRXHZwRNed/Z1cIvAux8deYfMTpydegwD5q
         vCrK7oH57buYC/tZwJ+2Io6llAIhJjkD0T5KN3OppEQKxgBghn9f9ENXtoYRUhmCoYHq
         C5+o1p64OXC9uTbUPlesu86TaGDPGALijGaTZhePwFDik8m2QnkHYwgo13wmULhMhRt/
         lGVXivswfzFBBtfSSTbz0Q0DEUy1mPUgFeycUZ6y6Cxf3ybUckfNgwQzK8th9rqZccR9
         kG4g==
X-Forwarded-Encrypted: i=1; AKwUvBwtHsBXec1FHct34gmdZ6UQd651exRVOA6+otBGnYRwJdDboXCdc7RyHt024AnQ54cwYwW8YPIUHk8k7nk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKChELlMbG5TdMniMVcCIpu0tAKvYeofQz9/+HF4XjdgNY4Ca3
	G5SYcp4gdf4r7adRHVhinOnZpUcNMVvjjN6LktUBLbYVTft5iwS3efTUBqnx5qGIvU6zNVbrJvz
	mz4DmGxnbhlIMC2SaVraMVh00jeoiYMAiPw==
X-Gm-Gg: AYBFou3DkYMcfPh0Hdk7zuGmTCVu+phou8rh80G3dvJrMub2uvV4v6lehpscS8PCpLP
	y90XsdussxZIA9QXC4H+s0rGWSCgiDREABLqDZAq+1xdl550Dq6cHZLLORBiiLFyHW5unFwi1Mc
	HBsMZ1JLZp9KEkfpVedv1UwZh2pOsDw1gdlPwiuHXv77wcH1zUKURYjUo3XppoIb+p8w7cO2yzX
	0cogR+YE8ceOSssY9VhhU6voVtiqAc50M8J06kq6JjQHWuWuJ1INNDO5KOJEhDbMVnnSE4BPHL/
	0eaTMVBWTqxk5nWxvrR4ifO7kRyTQmn3w+gu1smLphnpDgmuC5l7kgE=
X-Received: by 2002:a05:620a:6cc9:b0:93f:baf:279e with SMTP id
 af79cd13be357-93f29b72b3dmr256358185a.8.1792195557231; Fri, 16 Oct 2026
 17:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
 <20260927041138.4112920-1-jinmo44.yang@gmail.com> <20260927041138.4112920-4-jinmo44.yang@gmail.com>
In-Reply-To: <20260927041138.4112920-4-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 16 Oct 2026 17:05:45 -0700
X-Gm-Features: AclHuK8DOt62Xds_xVpqa-lc0Zk5FJujgPMgnOItP_EsoMr5iLn6xlgBeOOCC30
Message-ID: <CANRwn3S26juDz-Ad74Ehh2q7SFvbjzBNDMjS65WMdJvK=zaU2A@mail.gmail.com>
Subject: Re: [PATCH 3/5] HID: wacom: check the input device in wacom_intuos_pad()
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 9:12=E2=80=AFPM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> wacom_intuos_pad() takes wacom->pad_input without checking it. An
> interface that declares no pad leaves the pointer NULL on a fully
> successful probe, and wacom_intuos_irq() still calls this function for
> pad report ids.
>
> Reproduced on linux-next 20260925 (x86_64, KASAN) with vendor 0x056a
> product 0x032A and report id 12:
>
>   BUG: KASAN: null-ptr-deref in input_event+0x44/0xb0
>   Read of size 8 at addr 0000000000000028
>    wacom_intuos_irq+0x1b46/0x3300
>    wacom_wac_irq+0x1b59/0xb3f0
>    wacom_raw_event+0x68f/0xb60
>    __hid_input_report+0x398/0x4d0
>    uhid_char_write+0xa99/0xfc0
>
> The function only ever serves pad reports, so the check goes at entry.
>
> Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/=
Cintiq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
> ---
>  drivers/hid/wacom_wac.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 794c2865064a..48a58a6672c2 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -553,6 +553,9 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
>         bool wrench =3D false, keyboard =3D false, mute_touch =3D false, =
menu =3D false,
>              info =3D false;
>
> +       if (!input)
> +               return 0;
> +

As with patch 1, each of these checks is for an unusual error
condition so a dev_warn_once or hid_warn_once before returning is
suggested.

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


>         /* pad packets. Works as a second tool and is always in prox */
>         if (!(data[0] =3D=3D WACOM_REPORT_INTUOSPAD || data[0] =3D=3D WAC=
OM_REPORT_INTUOS5PAD ||
>               data[0] =3D=3D WACOM_REPORT_CINTIQPAD))
> --
> 2.53.0
>
>
