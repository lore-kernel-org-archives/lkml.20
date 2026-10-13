Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC56B5616B0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931361; cv=pass; b=q7IcfOfIH+sYENyVi6lGGPwbRFRl1Q4gJD300FqNViVLiPc3DwGTreZuFHIs78ZplH31fTrgVlTs56kzmsdKfA5CbLfKPyFr1P8kYCnxl5/MkwteWgwHeyHrT3mUfAdwNgHHaHIut2w/YOb4FKR73w0qTKQ/eAy/XIbglUSumGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931361; c=relaxed/simple;
	bh=C43seu/VWFpovdumtyJjepkGjp/Pd2/TfXo84siSmcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gB8aCiBnTQOfdu5NstEJqMHVt5g8AP44vWc4ZpYMwZ8AAWvt8z+RacsHXNNCMFWOvjpQPnWdwGuBGOUrPAxP8SvPzlKV7bf4OHIjQkWCV/ZjYj7g1VPnnNjHhRfE/7SQtwUTtVKAgvsBZzXMdL5bEfWYCSAnuy5hf3sNwxnZuKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe8KxoLi; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe8KxoLi"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e441e14a1so252375385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791931350; cv=none;
        d=google.com; s=arc-20260327;
        b=SnlcDJLz1Lib78/AtlL8eTUw8JgBCxcJc2h4UNwITwht1qiFmKSJiv3RhKrV7tB2yj
         091FfBeJ6UrZ+S5d9h9MyJGZVVoSk14av1t/wuQIYOAGWS+3qaGv7i+LMHxAVKo78EkR
         VKu5nV36nEE+BUPSA1i60fJI2Jho3mcsZPGaU9kJ1clXqXMfkC9nFTtvvc9/Btci4U3J
         MfCVIp7wKrT3zhjUW5IW3twCJmxKmBKbBrKguNSWxk//zhLfXn6VLNd2RHcxOzXxw13M
         1ogO6he5q9sz0jQ+34OkiBL1m7xVQ0fsNX2RRPBAKUPKgy/aSwWs8TXpuAMWNpYduO2f
         Um2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fU6MFjVMU7wK4vdBVH97bBR61iQQtpiyRXrWiXvtIyc=;
        fh=R/61HdJ5JvXa+J4MY4jmeeVSZVk9V1f9nut3LTC9EPo=;
        b=UK6P+RXMLcHnnHBq6+mGzIl9PtfVTueZ/FaPdjVYTIqtkY9v6ykD4gxIhrC0PKooSN
         141Yr0wWlOrim9k1PEPqYWHkX2uuSfBnlsJsS8Ua2KxrWB8GTg5PY1st4AQkNMoN/rAB
         AV6ODfunGHNuCYQN0AVvo+SXFFLT85sFzJ2YyHhZZXZAuLbgWXO3XJGlY+Uac5UZWg75
         hX5bnYmbTV1/92omjkabd3fniz1FkqsFxGPmhxy9uV7wdmLySnPoU32AKwgC2R3ZrJpQ
         67EgJ2xKTJvp7HqnJHwoCtdfTbxOf5LvQRoCodigWeavM9yc6oLF0QyUqL4/8uVCyeye
         UPjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791931350; x=1792536150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fU6MFjVMU7wK4vdBVH97bBR61iQQtpiyRXrWiXvtIyc=;
        b=pe8KxoLiF+935KH9jlcNLXmzLgHfkfzSjVMvKz4B0K5r4Z3JsJpTfXMgVLRoMJBSmg
         crcJAZlrStwp/y656iNs1Qc+Ewlv+2/D+tVtd/5E7S5Deu+/+Iq5gKMilPinCkttLgBd
         7wZDKn+lfpOk957ekMKfTbPkxQhoLZDVhaABoFYncvG/MRZyuJWm77Kk3ITeJ+9Sg0fD
         mlApPgPNQb7lp5eATOAnU76+n/VJVJUwWXmTLk0MfQ4zAXwU3MMdgNoKkuRw1DpwH2XZ
         5Vp78HeRt77SJDjvI3M7XHmBDfh5h5hwye6vUzm3fAyCUZejMF8dQurKAhsBcWpfzO/3
         D9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931350; x=1792536150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU6MFjVMU7wK4vdBVH97bBR61iQQtpiyRXrWiXvtIyc=;
        b=kTfTEKvKkOZjakpwj3csasxmc/MKF6Eb6NqISPcGax/wSFB/oIOrreGU0z4xYOpjua
         eBHtTZrg0Rg07+6S5AUL6hQmjeb831Jig3zwNsHG65uXjW87JkobwtUFw8es5E05E7Ia
         7Jpo0cHUdOjiGnfCsMTcXZ3ZXNZginq2K4pq4KJJNeXmQALNQYebqtdm90Tcqycmrz74
         xHb0C1vVwbuMpzpsToDjb6+fmzHEnneATUlYOjIm/099/OCHOw8A51+U2EQ1FMJ1vbm6
         fMWZPGEcUn+2BWKgk/agbu0qQ7CDG/U/8xazJ7E65JRNFt8ErNiZQgS08VJTjkFVo3xP
         SxLg==
X-Forwarded-Encrypted: i=1; AKwUvBxgaQp/s3Z9vGuVFgLJtjMA7/a4kRC9MnN/CTLM/zIHrCnKJhekmZ0lE+CGVKNKaN06I6T5uNwOmhANjkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMs8YMNqvorLNTqq+vmtVYth0N8Q8E5qebF0HLqhUElxUigfdJ
	2xqKoy39odyExHkO8z1rRk2mXoLwjdZahWPY29I78y76Zx7NzGMBEjQmN0AikF0CSVYqDmxfIOb
	ZOxz3NYQg3K61z4w60JBHeIMunD/dlVo=
X-Gm-Gg: AYBFou2XqsXzz8AmD2cSSkWbokmD11n2NBG07BBQfcXq9JnzUGSgoCNZOUosn96RPJR
	cZUu8AIl/lB5il1JaCqkahR5VCRyOyqOAVYJACcxoBedOUC7xdlSu4/CLnHECFmYRTqPODlCW6f
	Vs6ERW7h03GZd83VCYcGXCmdqVBtKbDbWfoH/sG6i51uqpoqe4eZlvaHKumB1nnYepBr14cljwD
	jOTOT9qfynNf6ySTwEUwZv7tVZurNOttw/M0Y6YvkAZ1Vx1lWRRoBbNezesp6Nprl8mR01oqeU/
	ebczyk3qYXOFpuyNGZYN7lMzImOjrcS1Z/a+mZJXcF2r25AFjWgBCT4=
X-Received: by 2002:a05:620a:4009:b0:939:733d:cbe0 with SMTP id
 af79cd13be357-93ebd0e4d2dmr2283163485a.3.1791931350324; Tue, 13 Oct 2026
 15:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009190746.803607-1-dmitry.torokhov@gmail.com> <20261009190746.803607-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20261009190746.803607-3-dmitry.torokhov@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 13 Oct 2026 15:42:19 -0700
X-Gm-Features: AclHuK_vVSdpPBKX9wl3s3nrh7_1Mr_Atvo0afOjkov7vZ5leLMMruIoft8t7r8
Message-ID: <CANRwn3Q-vJd00M3ntY7tLmnAc06Euwpqcf4C2ECm2vpvzfXG3g@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: wacom_w8001 - use ACQUIRE() for interruptible
 mutex in w8001_open()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Peter Hutterer <peter.hutterer@who-t.net>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 12:28=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Switch from scoped_guard(mutex_intr, ...) with an error fallback of
> -EINTR to ACQUIRE(mutex_intr, lock) and ACQUIRE_ERR(mutex_intr, &lock).
> This flattens the function logic and propagates the exact return value
> from mutex_lock_interruptible().
>
> Assisted-by: LLM

Aside from the Assisted-by comment in Patch 1/3, this LGTM.

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/wacom_w8001.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touc=
hscreen/wacom_w8001.c
> index e967f2413706..b34fcac44f63 100644
> --- a/drivers/input/touchscreen/wacom_w8001.c
> +++ b/drivers/input/touchscreen/wacom_w8001.c
> @@ -387,18 +387,20 @@ static int w8001_open(struct input_dev *dev)
>         struct w8001 *w8001 =3D input_get_drvdata(dev);
>         int err;
>
> -       scoped_guard(mutex_intr, &w8001->mutex) {
> -               if (w8001->open_count =3D=3D 0) {
> -                       err =3D w8001_command(w8001, W8001_CMD_START, fal=
se);
> -                       if (err)
> -                               return err;
> -               }
> +       ACQUIRE(mutex_intr, lock)(&w8001->mutex);
> +       err =3D ACQUIRE_ERR(mutex_intr, &lock);
> +       if (err)
> +               return err;
>
> -               w8001->open_count++;
> -               return 0;
> +       if (w8001->open_count =3D=3D 0) {
> +               err =3D w8001_command(w8001, W8001_CMD_START, false);
> +               if (err)
> +                       return err;
>         }
>
> -       return -EINTR;
> +       w8001->open_count++;
> +
> +       return 0;
>  }
>
>  static void w8001_close(struct input_dev *dev)
> --
> 2.56.0.385.gd3acb90ef8-goog
>
>
