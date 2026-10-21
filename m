Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792609054;
	b=Gv4Ke8+s19onL7/RhMLCWKOvVEZ9MuDs3HALdPaa+2Gf0xcPmtFMSXE+cshiJm1nNEWl
	 vP2rj78jnii8kky86CgIdDeE+N0GfkViq0toi1Jnuwuan4fvijJexW5Y/C7Y+C+Bu5R+C
	 XWFjc6g6nLqXmg6IW8aMY7CbUHArCY6tPKuHFzhDZAT06hTRqTK+ycuc0itQLTiQrhYbv
	 N/xmdDsGTtQP4QZI9lRN8k7eyd0C5rTVjuR2wszMQgWiOrtfCXihOqzyLgYdhY1hPA5Og
	 k7v+BkYvlTp5FuF7SCLEQXW1+RF+s+XUKufdxiFVViWB0F2Wq5C07+7Du1JN2WmAjdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxU+fpXdNAqE/uzoh+966DgHUBkiqVjMoTjja5oXr5o=;
	b=smn2mlZq978tfy1Mw78CjtjVAJ4H0aaG0/+VKPwP2TnVv++jXIUgV25tpObnjqPfsZ9f
	 mMORt4ec5g3AgZzV2jpI9UWyaO629WsxK/aActmovvXCzpxGdPn5aqyIRHs/5eoMe86Vt
	 dzm0y+7cxBhUMsDTwQKXtsPc0PjiNptVU6imAOQLVp98Z35VuQaGr1fXaywrf3KwvJ55P
	 aFIDgTd3lZ0dqQLF2YWFWoi8GL5i6bge9LlUTNMXfaoqAtNDCWaOjBlhMgZbTl6yFakZY
	 f6pMY6KHXQC126J09moz+6UTJLkHq9lTuQ10wDuUxHAeGCD6cKqFL+WlzobjJ1IbwAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmVclC5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE99606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmVclC5M
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b813ac020so14573706d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792609053; cv=none;
        d=google.com; s=arc-20260327;
        b=XLgnpo0S1UDEJnkXIxu5WB7SLPraosspyYkTkkepLqjCAB7E5OGCius1/Mmqc51eWz
         kRBbuCymE4jHiWYjVOu2mC7bv/hV9iDbpQSXnXh5px6BvhF0eKNGYgDjV+T8L/M3DVwB
         Exzxqoia8WHU+c6c1mzHiyHRIYUXnpx6KLzFe2Nx5+jzU8WH/1D0zY1fPU7Q9Zu49OPZ
         LbJccV0E1yLNIJ45dCV4HAIGCJCVsq85xEGfk0q2546zL1UgJ2ZEXHWkTqGiZq0OKIZ2
         s5KXE7DHnqLVCIF1r9oV35DZ3Ui4Cf7OT64qgoM71f0qPDegjB0X+V+/O2pdEZnPaB33
         N0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxU+fpXdNAqE/uzoh+966DgHUBkiqVjMoTjja5oXr5o=;
        fh=PctJ1Cm69pAhOpRRbHJQNR9kFAdFpsRdr89Ng9V8KeE=;
        b=Sl65BdVnniaeBPmQuEV2cpnQQtmshubhT81bVrEHH7Do0U71oncfvVA9Bw8q7DtRHN
         fsP0bBUEtMqZLApxluwVpxLo0fDwMWkGMLd7cXWYaaNd55exG4DRcsovMLa51D4+gz3Z
         AXR5c+W5P+LJhv6kCy7BpUy4zJTcP5oFX4oD9Cbk36OdUmDFk0RFDSAiaSPOtC3/jzLu
         zNJ2Ta9brbPweKbHH5Vxw0pWLCx/zRBmNeBxFFwqtQGeA+mw37BrWMmMeqa8s3T/cbf8
         +g51kFew1Q70XorOhdE6GFoSBY6C/x73xztVaTdf4PrDbP4noAFXs51E1JPlFHFCQEGw
         n4sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609053; x=1793213853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxU+fpXdNAqE/uzoh+966DgHUBkiqVjMoTjja5oXr5o=;
        b=bmVclC5MlwrTR45BapWQgbddpL/QxFqMLlQtOhGHP08FQUvEZuWo3GWybvcGgbhhx5
         CWqqf7dJuQqmHyZQAiiycqSDdSXitDAT0MaC6S6UiFQ8Nm0sQu+TlAhY6S+5IeYPdZiW
         RzJakPeQWusbAGhcqb/WPvIFeQDMqGQOT1gB6wTdDou/74bERRmvj+zCS9x6jnHqLNA5
         qpDWoxDYmzaV5IVY+K+W/18QWkty48TAWqaQq2NsmOpQbohk5Z7MhbbkB4N0D+ZcxCsv
         q3nELFMt5li1271WxJim9KthYN/1ypAwRUntNRrxQAmX5v2dBTaod9gLrg1OhCr07RZK
         2KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609053; x=1793213853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxU+fpXdNAqE/uzoh+966DgHUBkiqVjMoTjja5oXr5o=;
        b=amKV0Y1foKuRQDGrqUbYbt2CDfreFWlOAzbfxxzmubeQqmts9mKjfWiXUnhFEQ4fxX
         LzAnIu0UUOiXu1pMl80sSMVj4F8eK1jT03Qhf3MZfnGl/q5Ni/ZjTMD0QNei/RZ0EZI9
         lkZMw/vlUyr/jxACwJG6PEonbsRGFBdUQweR29hROhbiKQKjM9wT4fTl6S+TIj+ZyQI6
         GBTHoz/s8KpaEmlGq8YcGkGu63N7mqzQOiDxlBk8+cPnPWo2N0CvVyMtw74YmjWpd8Ta
         57T/hojJ8gWQw//ziPApKj+djI9iv3HZTxBo6iHKCpGo6ugx78ZZFlpIZT8bA2ffy9UU
         fX+g==
X-Forwarded-Encrypted: i=1; AKwUvBxVwuVdifZcOdSLjvXKxP86o2OA5Sk58K/fvResT9DbJpbLTGSwYIAJKdAh1nEbJnyrZM/B6xhNUA0Gqjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0hHrq+Ua9Ak7coeQZrD3MRPl6naWtXth4uJocwsuQ4+I+6F/+
	/8Wpnkqpz4kt0NZFCa+xsHL7MdfgZ0nOEmjljPzDAZ8bimaBYGg4U6Zb1RJTod93sZNKQKUdaFA
	34wJSuFSoGqEM5fEgT63kbNvRvLuApnE=
X-Gm-Gg: AYBFou05HgOJRF408nl/+LgAfeLyucRceFJ72IrnTBXGbXdD5993Ih/tcjaNdgjj+y6
	TrKrt9HO9nEGl5uaFtsHO3f1376DooIQ8JuLj51biqvf34/yNe7wwLW5g/5DgqK9UmGC251gpPM
	wUoWThX1wsZOvXuXtcXasq++Sfk2e9/C8Iw8TC12dzQ//Pfp2h+Gjoo7z/Bpo/j1T2qgDPyLpXR
	dGIWyVYc+X5q97gHoIP4ThRYHrgtj0ECzaBifU3+nqWzBDOJz/ruP0pO7YyB4jKwHis+hZO3A01
	k+nW/aPpdQ5Y7tpQoKeBKDVS761KrPy6gKEDBwzK4TS/J5UvOJFMoKIql7JclrA+wJf0unpoxBX
	hbYBmxvCimlBMZ4jUuhUB2zj9zIO19xpdNPn+
X-Received: by 2002:a05:6214:410d:b0:912:517b:40fb with SMTP id
 6a1803df08f44-91c12f1f4ebmr46726246d6.45.1792609052612; Wed, 21 Oct 2026
 11:57:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018124755.850888-1-jinmo44.yang@gmail.com> <20261018124755.850888-4-jinmo44.yang@gmail.com>
In-Reply-To: <20261018124755.850888-4-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 21 Oct 2026 11:57:21 -0700
X-Gm-Features: AclHuK9stdHp_EZ12QZ6ixOiQE0-gFWmsBr9NPmTz86JK-NBRQoQJ6Axr2WSgaA
Message-ID: <CANRwn3QaVYAvFHS-oLqChjCyhGdMFnmMvOS-jBCV7m4=cLYcpg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] HID: wacom: add NULL pad_input guard to wacom_intuos_pad()
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Claude Opus 4.6" <noreply@anthropic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:49=E2=80=AFAM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> wacom_intuos_pad() uses wacom->pad_input throughout, but pad_input can
> be NULL when wacom_setup_pad_input_capabilities() returns -ENODEV during
> a successful probe.
>
> Place the guard after the data[0] report-ID check and return 1 so the
> report is consumed. Returning 0 would let the caller fall through to
> wacom_intuos_inout(), which would misparse the pad packet as a pen
> event.
>

The other intuos functions (wacom_intuos_inout() and
wacom_intuos_general()) reference pen_input and a rough evaluation by
eye makes me think that they are susceptible to the same kind of
issue. I feel like it would make sense to add a check for non-null
pen_input at the top of wacom_intuos_irq() to protect its helpers, in
addition to the pad_input check you add in this patch.

> Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/=
Cintiq")
> Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
> Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
> ---
>  drivers/hid/wacom_wac.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index bec8dbec5bc3..65829de86363 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -581,6 +581,12 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
>               data[0] =3D=3D WACOM_REPORT_CINTIQPAD))
>                 return 0;
>
> +       if (!input) {
> +               dev_warn_once(&container_of(wacom, struct wacom, wacom_wa=
c)->hdev->dev,
> +                             "%s: pad_input is NULL\n", __func__);
> +               return 1; /* consume the report to prevent fall-through *=
/
> +       }
> +

Returning a non-zero value will trigger an eventual input_sync() at
the bottom of wacom_wac_irq(). Realistically this shouldn't matter
since we would never expect a null pad in normal operation (so these
spurious syncs are unlikely), but it still kinda pokes me the wrong
way. I feel like update wacom_intuos_pad should be updated to follow
the same return convention as the other intuos_* functions where
wacom_intuos_irq() has a "return result -1" to allow functions to
signal "handled, but don't sync".

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....




>         if (features->type >=3D INTUOS4S && features->type <=3D INTUOS4L)=
 {
>                 buttons =3D (data[3] << 1) | (data[2] & 0x01);
>                 ring1 =3D data[1];
> --
> 2.53.0
>
>
