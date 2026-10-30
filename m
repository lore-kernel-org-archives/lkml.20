Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793393038;
	b=p6zWs8Q7+ZTRwjXcXsYyv1v4LxphO8g7CQ2GiOR0afiiUUohiY2Rt8egxyh7QYM0IyhU
	 0Itakulj2TJLK0ilehvGrLuwXqqfYq8N5RyjdJLgk0aZjAxxOpC5wSEPQWACDd9vR2CPY
	 Oe1X7y+jmuIrxaIPBooA0u7G+ap1yXLuXNRqmicixcsdie1VQ6lwSUlbzSea37PD5HCw0
	 4Mq3MlAwJG0V5Vhefri5FocVPvuRRgGU80WX/GiOCQAKp9Isx1ArrT4RYS6etgWQiQPLP
	 ntbV9lzWql80HJjagzhWWAiFyTRO/yGlYjHkaaIUUxHMNxHBoU0GAoNEUzi8KMZmciQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PGrC9jp81hhttgbK2LxOaZQLL73ahOthq614Lwim9O4=;
	b=SSoKfwVCcITWh9tj8rSskBSupm1Q0H8kKNJdqACQvSPcOMtMpcVUV7kDACSnLaCL7xHl
	 m/aToVWnunTrR+DnLH47F8uSR0ZnYzkde+vf+dl4lKnoxiULSNg78LYtzDgCzF746e47x
	 SVYH5ZsS/+03uZlm9+DAutBGOLQEy0NC/pZvRWMe4u6VhzKDMMGOtIH71lc2mM5giv56c
	 bXO7tCILsUBv4pkcCffGn6RQ/D4BHLAztG7NdnE0B7oIpgDbJxALtUNIImfuFsN6trE4J
	 jYgqmO7EIhzCkVa1bQvsTxqCHaNP8x9RHUHfMAIWG+/c1XdBiFqdSLV9jmULProRMwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="miuS/TF4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8412D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miuS/TF4
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so688511a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793393038; cv=none;
        d=google.com; s=arc-20260327;
        b=rAQZ9YXGNF1cVLUN//URoCZTZSjfLaXLkhpZC//3JZfxjALK28BP5JcpIDV372clzs
         a93YDiwEI1oYobEufFGx8Gd1Dx94WY+sWnuV3YHVrxsJVNAGKNC+kandH93SV9wjrcxe
         HDK0uthIDPNdUfjzzb7lu7ojmymKw4S7G/YErPBwYWTwGdqucG4oRQDWKHTJPX5Sjxll
         6ma0DW6D2JSV9GA8TS9I04AlNGAe3VYa/KqojaWnsS2a6FrYBJzIxGxqno/uquc/0fpn
         AYsSF1JFRUzinpINrvSDEPUgUL0BTI5UbCvkVVQyrztB1Y9/cD9LrdcTQNKIDtl/Augu
         FUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGrC9jp81hhttgbK2LxOaZQLL73ahOthq614Lwim9O4=;
        fh=2NBAwCBDeq15GqON/neAIbKDodgZzkmBuQwpvxvJSdQ=;
        b=ftO4tBbdJ3TEwgM2+iv6OmO92phakRXjw1rRlzK3CBkkAVNPN0tjoQuN88A9TMxXOV
         CWS3BMfh6kBv4MK58cPmvQIc8T/obrvdzjMbJdRpwIj1ucHJieFaUNC0KNS+Qb6oyiyb
         2+MV/3mRSmtq/9USE8FYsDWkYx5u4kUkU29pmV/uRqqH1u+axGBwumUMdYvjIUKtf5xH
         u9uyJiLK4ZJxjLklxvZCbouybUZWQVVI8R5L755JhvNP6tZ6VwG2NleK3YZgy9F+oC7o
         G5VSFukY9jI68sxoLYmOZm9SIheRqA+VjTqPJpNBoY0EsCIadigDYI8Gxy9NVNQpIDg5
         jSNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793393038; x=1793997838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGrC9jp81hhttgbK2LxOaZQLL73ahOthq614Lwim9O4=;
        b=miuS/TF44qOoF132QOXvFNWRu1o0E7VzAOnjzAI+uNF60oUMS7MvSTN1o7w1wxVx9+
         6P0aP+c1QaF1TJe7ipN3fXi8JXZR/eopWEpjmw2DBq0Cqrj9wKbxTsSrt8+jb25v99y2
         OZKN5s479R2Wg3WZ1s0MV69MMB+FYpbC3LCKHz4hx0CIMr7zey/tiRsT3grDTBHPBu2M
         kOa4WYIdk2TueeZDNRBhliOVwfVra+tidFTfn4AdrKSds2btiYcX8acnr7a1xOMtLZ8d
         DAWeMJqsv9Px8tQkxnlBATSrqxOCvRpfldQDMtYscxtFYy+oLpTnqI9+b0rAXeBkag7C
         m/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793393038; x=1793997838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGrC9jp81hhttgbK2LxOaZQLL73ahOthq614Lwim9O4=;
        b=mxtFdEDZqxQuBY/7e05DO5nVdCPpi4BxuDi1QpRC1RODP2Jem5H8Dp7s3V324XQADS
         /j7cx4abVIkk1st0aeDrWRnixPJLFzoBjp+SwHZZ97TSRdPaEYmtQ0zywNoitDV+eTGC
         df86NJhRUY3WbRoW6DXxCChxVV9QYrlHiUctK2alZ17Bw7wLeXZcKWM9iC42J8P+dvkX
         G/qe9O1HYJLJLZZO87WA0QRcZ/9eK4KphLhcpRiMXORZjOgF4+M+ZM4VLq7JuOVhjPZX
         Sl1wqtNfnGESdDaPg/+pC25XuRpDmPtnrXHyZFFXxaJTk/FVTSiiS87uvc9nUmIjAupQ
         RaJg==
X-Forwarded-Encrypted: i=1; AKwUvByxUUY+lgwZ5PwOgGGcO/UlvPMvL75KI4bTnN1gMhIQaepyEegD3xjLuP6EicrBfKn3Lprw5cQmSaXXzME=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAJsvFqn21sDQC4YOLywEPAJ1cciP6vveO/qi0l0CWRDglYEOF
	bUtSU7JDSR0sHgRGqFvjBbHKZNWNId97K94kG0ySlN7GB+3OXVrKcAYMn+5faCDfQ3GHY2FpFx7
	juiotQ1qDHLimtxtNIXzrDr0YHfPhLiA=
X-Gm-Gg: AYBFou0G8aznoJugVvkOx+tNADl+HWiTZpFAuLbKrsDddSvuphEQe1m3iyJtXiQAfqy
	lZMyAkLCX6fSwgTuFyUGcXG5PH8Jy79SWAX9mUILGXO4cLj8V4GYYyj69r0uFRuC4uPUaQhonSn
	tNhx3PaaT7wSINhKLYPuW+fUwOUTqlmc4FWw/3M2ocKja6VekkmbBC+wisu7f0QKJzr23oSVO1w
	nqLKuPJau1oJVWtT9CET4txgsObYUjANvpzfyh4857Gdf/NefL5ZJ/rwqTShDx8J2UV4wzASccg
	nOyefZ3UYjyU2fsfRucQqATaEvtLQS9T9vMa4s+SU5Prw3NlOz4QYUUC+X4Lauun9+V7z4PuVyE
	kf8tWtIEyvbbJEKaOPlGnHRJumtThALL+8grZ
X-Received: by 2002:a17:90b:57cb:b0:3aa:fc22:8aad with SMTP id
 98e67ed59e1d1-3ae89855ca3mr2919962a91.54.1793393037441; Fri, 30 Oct 2026
 13:43:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030173108.45408-1-unseentactician27062006@gmail.com>
In-Reply-To: <20261030173108.45408-1-unseentactician27062006@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 30 Oct 2026 13:43:44 -0700
X-Gm-Features: AclHuK8D04ABqzfVwMfLf9BQljlnKexWMTD06uQ9BDkzY6GyDDHNgnMWwWmzIQo
Message-ID: <CANRwn3SF3Ywm_eLvH0H2J7960Ce0fngh0ToBJPiRnGjk_9ravw@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Prevent NULL dereference in wireless work
To: Devarjya Purkayastha <unseentactician27062006@gmail.com>
Cc: linux-input@vger.kernel.org, ping.cheng@wacom.com, jason.gerecke@wacom.com, 
	jikos@kernel.org, bentiss@kernel.org, linux-kernel@vger.kernel.org, 
	Indrath <indrathftw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko responses notwithstanding (which the rest of the function
would be need to be updated to implement, not *just* this patch):

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


On Fri, Oct 30, 2026 at 10:35=E2=80=AFAM Devarjya Purkayastha
<unseentactician27062006@gmail.com> wrote:
>
> wacom_wireless_work() assumes that the active USB configuration has
> three interfaces and unconditionally accesses interface[1] and
> interface[2].
>
> A malformed configuration with fewer interfaces can therefore cause a
> NULL pointer dereference in the wireless workqueue. Return early unless
> the configuration has at least three interfaces.
>
> Reported-by: Indrath <indrathftw@gmail.com>
> Signed-off-by: Devarjya Purkayastha <unseentactician27062006@gmail.com>
> ---
>  drivers/hid/wacom_sys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 628372ab818a..dcf2811a5c48 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -2619,7 +2619,7 @@ static void wacom_wireless_work(struct work_struct =
*work)
>
>         wacom_destroy_battery(wacom);
>
> -       if (!usbdev)
> +       if (!usbdev || usbdev->config->desc.bNumInterfaces < 3)
>                 return;
>
>         /* Stylus interface */
> --
> 2.53.0
>
>
