Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906419;
	b=ChHZOfnq/wS0b3DCK1ZPLA3Fi8FcdvyyLmdGVAeY7Z2aCIbz8p2P+Y8gR9FEUZFNqljF
	 H5zLG6XFv++Vjw8LFKXDnoyUNAJ00L2eZilyeE/f+H8mKUgMqcG/O3vcaEgoAUl2dx6nb
	 Q0At93R46g8yREtI6lIMkycSyo5MBdMIc4i11GnrNQEjbyF/QuwqhgnuS3uBCvqtCULR+
	 3SqCJL35s9+hkAXrbFQkX5o1Wkq3hrgI9MzXO4dSGUXInAG12yfug5C+AumekcKszT0la
	 Le/gNdU7pG7tQ6yxr6WxBy1q8MAnCU+g5lRtOkZZnCOhTiyuSGSSALFpaG5qiK9Upsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pp/TG21mhE7k1t/eWybpON9LpBrMSOVs3egyXyjekZI=;
	b=QopgOhj9LJNQ5ZnYsnD5rwxnxRKrras5OHzjR2GlsfHa7wtgBaUuFpPJZvsUnwzmHOUi
	 gNCrUYbuY4Xh/xjSUaeRAqsQ90lT9+MNtW1Rxtt8R2Vq3cQIf0Zz9LNdT75OiiKuE4GRl
	 r4D24bvR200XTrzXF2Qpq3qpzgL/NtQQoUpkFxd38DrRcpstYXrk/+tt2ID/xGuP8MKv5
	 JsoDp5xyHSK6CxDHm0OyGI+yQN+VC/X1MwIAuLzeU9Js5uwTsEz15FBaLwvluDKKzEYVT
	 +dP9BHLIlMy2/25i0C/YkDNt6Eac6j6fl/vbrxJqnohaZDznd5opHZk26R8usvbuaPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goxBSdge;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04CF1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goxBSdge
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f2049ea7aso175244085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793906417; cv=none;
        d=google.com; s=arc-20260327;
        b=BbBwxgIq0FhL6E+gZ25OhAJbdw2oNvW+9cAvHTpIkotp+1h8RkoG57tf6x42cjkd/M
         OrwCE1qq5SITlTxr83DEIR3m0VcMRCg8jkzt3OMjf2pDlpVH+Vr3pVqKjQcy4GLd9o6y
         DUic8EfH3DXMe45DTvfVwtFAVU2JD49hwrT2bLs+duwcCvPz16xVyW6b262gQsXtdbbk
         BpLpO9ORDA2R3k/b0WfxqfVDy7D4EZ92X1Qi8HpuIIsQcruwNr7a1CVs/dXA6fTfX89C
         YAcm/5nBDSgiPaRQ5x45XLivt7WdR3eLeB4SH4kIuXSwKYQJTvcIgmt71NxWjQ3IVlqQ
         5FgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp/TG21mhE7k1t/eWybpON9LpBrMSOVs3egyXyjekZI=;
        fh=X5trX215dlaxUk/J3oa15EeTO5Y7ydsPuOLgciUqSSM=;
        b=qTo8xBM2C7YF43CPPsrCGzQmwkWSr8cgqE2caVEXX/OrZuhtPLKkFMO/DcHAr8HBG2
         RhJoEjThvvVOUKb7pTm5FELAQmk/qmd8CQKnwDWHhY8WTHJR5rD4x5CO30vOn4FRoj0x
         s2UhdXWiNjDXq2OIJs2l1dvh/+xzhpnVJP+PNXY2NeGUhwXauHIMb6uA9y0ZfJWxDKRE
         kG6RpTAPQg6yT4I05hv4DQb27hfyoEsA5boYBEua18eDm/peSMvIUIRHGmYV4OVVeQBU
         JoapMhoaJzRwX10WYaxE/bjclyPhLX1ovyQ9rBiBFQKZ6sGyyTW9aILPYY9a3j930r+g
         UAgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906417; x=1794511217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp/TG21mhE7k1t/eWybpON9LpBrMSOVs3egyXyjekZI=;
        b=goxBSdgeBbdHj66o9Nu3RNovXtI7CJhsb0Rr7p21S9IEWF5RADy2eV4UGrMXXidFAl
         cTO0oAVzKBF5fO9sS/GOG37u8hhgHva6nZ/mle/Tp3bNfFyFKTXYJRAtKuu76p953xid
         afvRQG/ybr6Ut8n2erud5xXY/aDItoKUKt6VGisPWURfTnLLI1F9adpLJGkPPQQMKa2X
         3ygmX5UszfB7oFk/DshDKWoLiKPhzINYoTv7p/1tfte7N6+0mVfMFUUBEkGXI5WX1y1F
         TaRwiDOCSfgP1UpHoUWjnfCzogY3bzcRPH7XygMsHTMFXkryttjpg7un4zngWdx12xFL
         huPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906417; x=1794511217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp/TG21mhE7k1t/eWybpON9LpBrMSOVs3egyXyjekZI=;
        b=qBh9hXSNo39lfZYlP1gMj0qzzh472eJh8ItrF0srFCHKc7JjNIa+A3l2d/DtCdrJOt
         vqDAnOP/Npm2vMK7C+KGY3SWO0Phm3FS4b+MzZexkG72DyHECXwAu2lOY0OurH7v/zCR
         n0yasDbL/wTENcLn1Vf3TYA3DquOnIhoRtzKRpuQEAHuUT8GY16rxOPSWz90d76EonXV
         q3mjMnB2XofEl8Ukiph3toqOUdNU7B6RsxCBLLVeiA4VO909yj2bqEm/lOFL31/jxh/Q
         B+y7UMAS1AewOmZOyH9hoL8+JhVdlXq+KjYKv+cg2wOCbXww9wgAwOA+vgBEpcjB9gNt
         xTzw==
X-Forwarded-Encrypted: i=1; AKwUvBzoBcSXc1urJKCbGSRPf/DQQmNGQP4L/dqaXM+O+shEFU+Gz3wd9H8leJsf25QvGbAhtSIb1tz9xZcC2zU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vC1Ci+hYyBCobljGKPgN8M//N54H6PBq7Zfuznq3OJN8QJ25U
	huRu6rtc7i8t1PInUgE/nigxJT+mldGgIquXFHGO8fL9BOqTHIszPJkBirL8uHXg/TJMe9OAPWy
	wjYpxtvjDjl4bZKsXu3Ep84e4Y1Th4m4=
X-Gm-Gg: AYBFou1YioHV3vePabb2++hfUlnR57PrV78z8idtTTWFKfEMThIyEBUIvXNIHhpr2jn
	WUygJrAlWtLlOjqQPAee1mj7shaHdx6PWbP+4N01cFQsflRyHficec2yiBwZLH6MsBJxiZbOZLQ
	CjtRmWBsiiUCbNYx8MadMpwQ+YIKW6KVUNKuccgbt4cOu4uF/ZkINBbxB5KufieNF8JtdKqn3uy
	ZdxMtOx1daUMpDcVBHuRVySei3iqDgfuWYotyXC91GDJumaJFvCmgTeC/bk0FQ48WeZq7U1ODQV
	rd5sFe2dXH59+rXmB4mPGIT7K5FHP2LXbwWpiD8/z5dba9SXaQFSJHVo7KGcqPJRtJCLlFBhcup
	KaD8sJqSppBy0euuqZf2TOtaPEToJeFst5fqR
X-Received: by 2002:a05:620a:4015:b0:93c:c2c2:40eb with SMTP id
 af79cd13be357-945f35e6c2bmr5090185a.66.1793906416804; Thu, 05 Nov 2026
 11:20:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260915111448.2726869-1-qwe.aldo@gmail.com> <20260915145229.3036596-1-qwe.aldo@gmail.com>
In-Reply-To: <20260915145229.3036596-1-qwe.aldo@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Thu, 5 Nov 2026 11:20:05 -0800
X-Gm-Features: AclHuK-4ryZB_pVHQTvIJoueiQY69x_P5hoZ4Ix7YJII7Qwx1mdwYxlfMzqsWMk
Message-ID: <CANRwn3RYhEu0g9Lx+Vg=Uy8V7BWWz-jWV9d7UVuyRK-MGdbHOA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: wacom: avoid overflows in sequence number tracking
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:17=E2=80=AFAM Aldo Ariel Panzardo <qwe.aldo@gmail=
.com> wrote:
>
> The dropped-packet calculation derives the sequence range in signed int
> arithmetic. A sequence field whose logical range spans all 32-bit values
> makes the range calculation wrap to zero, so the following modulo trigger=
s
> a divide exception.
>
> Normalize the maximum and current value according to the HID parser's
> signedness rule, and keep the sequence state and arithmetic in s64. Use
> div64_s64() for the remainder to avoid __moddi3 link failures on 32-bit
> architectures. This also avoids overflowing value + 1 at the logical
> maximum.
>
> Fixes: 359673ea3a20 ("HID: wacom: Support sequence numbers smaller than 1=
6-bit")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---

Generally speaking, I feel like NAK-ing this patch as it currently is.
I'm happy to take a patch that specifically addresses the divide
exception, without expanding the size of sequence_number (mostly
because that particular part is a bit unnecessary with our hardware
unlikely to ever spend more than 32 bits on a sequence number). It
should be possible to introduce a helper function that calculates the
value with a branch rather than explicit division, e.g. something
like:

int wrapped_dist(int after, int before, int min, int max) {
        if (after >=3D before) {
               return after - before;
        }
       else {
              return (max - before) + (after - min) + 1;
       }
}

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

>
> Changes in v3:
>   - Replace raw s64 modulo with div64_s64()-based remainder to avoid
>     __moddi3 link failure on 32-bit architectures (i386, arm32).
>     Reported by Sashiko AI review.
>
> Changes in v2:
>   - Normalize logical_maximum/value as unsigned when logical_minimum >=3D=
 0,
>     matching HID parser signedness. Store sequence state as s64.
>     Fixes unsigned 0..UINT32_MAX range that broke v1.
>
>  drivers/hid/wacom_wac.c | 33 ++++++++++++++++++++++++---------
>  drivers/hid/wacom_wac.h |  2 +-
>  2 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index da1f0ea856..af94f59a5d 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -7,6 +7,7 @@
>  #include "wacom.h"
>  #include <linux/input/mt.h>
>  #include <linux/jiffies.h>
> +#include <linux/math64.h>
>
>  /* resolution for penabled devices */
>  #define WACOM_PL_RES           20
> @@ -2527,18 +2528,33 @@ static void wacom_wac_pen_event(struct hid_device=
 *hdev, struct hid_field *field
>         case WACOM_HID_WD_BARRELSWITCH3:
>                 wacom_wac->hid_data.barrelswitch3 =3D value;
>                 return;
> -       case WACOM_HID_WD_SEQUENCENUMBER:
> -               if (wacom_wac->hid_data.sequence_number !=3D value &&
> +       case WACOM_HID_WD_SEQUENCENUMBER: {
> +               s64 sequence_minimum =3D field->logical_minimum;
> +               s64 sequence_maximum =3D sequence_minimum < 0 ?
> +                       (s64)field->logical_maximum :
> +                       (s64)(u32)field->logical_maximum;
> +               s64 sequence_value =3D sequence_minimum < 0 ?
> +                       (s64)value : (s64)(u32)value;
> +
> +               if (wacom_wac->hid_data.sequence_number !=3D sequence_val=
ue &&
>                     wacom_wac->hid_data.sequence_number >=3D 0) {
> -                       int sequence_size =3D field->logical_maximum - fi=
eld->logical_minimum + 1;
> -                       int drop_count =3D (value - wacom_wac->hid_data.s=
equence_number) % sequence_size;
> -                       hid_warn(hdev, "Dropped %d packets", drop_count);
> +                       s64 sequence_size =3D sequence_maximum -
> +                                           sequence_minimum + 1;
> +                       s64 drop_count =3D sequence_value -
> +                                        wacom_wac->hid_data.sequence_num=
ber;
> +
> +                       drop_count -=3D div64_s64(drop_count, sequence_si=
ze) *
> +                                     sequence_size;
> +                       if (drop_count < 0)
> +                               drop_count +=3D sequence_size;
> +                       hid_warn(hdev, "Dropped %lld packets",
> +                                (long long)drop_count);
>                 }
> -               wacom_wac->hid_data.sequence_number =3D value + 1;
> -               if (wacom_wac->hid_data.sequence_number > field->logical_=
maximum)
> -                       wacom_wac->hid_data.sequence_number =3D field->lo=
gical_minimum;
> +               if (sequence_value >=3D sequence_maximum)
> +                       wacom_wac->hid_data.sequence_number =3D sequence_=
minimum;
> +               else
> +                       wacom_wac->hid_data.sequence_number =3D sequence_=
value + 1;
>                 return;
>         }
> +       }
>
>         /* send pen events only when touch is up or forced out
>          * or touch arbitration is off
> diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
> index 126bec6e5c..74e7c5a04a 100644
> --- a/drivers/hid/wacom_wac.h
> +++ b/drivers/hid/wacom_wac.h
> @@ -324,7 +324,7 @@ struct hid_data {
>         int bat_connected;
>         int ps_connected;
>         bool pad_input_event_flag;
> -       int sequence_number;
> +       s64 sequence_number;
>         ktime_t time_delayed;
>  };
>
> --
> 2.43.0
>
