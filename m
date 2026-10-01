Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1293C10B0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825185; cv=pass; b=Xyh5UuVK8mq4iKT+ojJQAiTXQGn1ehTZbOKihXpqIAG5RmBMSWknicU48qdqCWFGHfpkcvqWGw5pVsgQc5qLZQtehgqB+5rCmdqmupbnWmcBcS7o0ZKsMny8gFaphsjEnyeGD6gV+pT/rgQQhgXTgsXQlwsFv/sFs9r61PnM5YQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825185; c=relaxed/simple;
	bh=mO7cZZw6gbOK7t/+3Qun+Qcpm5Ph2b0FOIuuDPVuWPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAVykUFIcW+JQgrZRbQY4DV51MH8sWBXxR2v4AdXa/KBL1d/kW2FApf5Ot3zAQf52bQym8q5BSuyyiReesPmZzJzyS+5wquR667YzaJEQA1GyM9LXZkfRvrZSyRzqNbhbAw/qgIf+cgFc2JvHGwJ1CF/kBZkshxF9ipLyslNsGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=nGIxzlW+; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="nGIxzlW+"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a7823deaddso2332661fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790825165; cv=none;
        d=google.com; s=arc-20260327;
        b=KQw90LvCHWBa2rExU7XzeZuF7cMxm7/MTef80ZGxjXIaJ+0KWm5iEYFE5hL1nxAQmT
         USFZeKAd8zbp+0w+88Rw+75PyCpqx4cy6thpZ4XiHsUYfP8dxTC9QCQbUHUvtBufZo4b
         gsgw6XXlcbMmd7PnZEnlXkCfPxEhccGkxJ1GdTtQHBXAo3B1yR87cAc8xDlugsnkgKf7
         9wFMgKKKBsfU5b69KLvnStzO4n5HdAO5Xv4dADU586wOvO4IR3g0l/sfIJqBCEUZGrtt
         PlPbFepf2hsdfH9XBSKWaeXgX11DpDtll6xZmhNLS4/H4GOpk1MfOhHKk5CdqK7SI4LZ
         ftzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vbm7P3UAq4mEN8zDnHnpp8JluPeYIiuA08TMdFT7DGw=;
        fh=Tktm7sRZMjpWTxdTRkEbofmSqBxHta34fViKnrI7FpI=;
        b=Z7WBClfbWBDEglW7MdgjM0Q8ei83a7TBsFUdpNi7KL6CKl2WvRglBWvuwNCXazI9AE
         kALq3sHyvmznCEVi61agkkpCAeiIAtDcXE12H7nvudyLb1nlcWOesnrJmvnrbJkWUiph
         MDF7kRYVwnWboTiDPry35mJvrZUw684zoYuFAqx0JXfctGYCezGXooJojUqJOhIn1jvu
         9LuRW53TxW9ugzfHsRddzSiSOsSGxb+lpZzHwgkCMbesPcfxxyU+7C4REg54Vc+Z2c5F
         THwOviKImEaZFWmKzoxmsBKPYNI6hd5Ovb35H5qwQqGwXFDbxzFu1WhZH3RzWqpmV3sD
         m3WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1790825165; x=1791429965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vbm7P3UAq4mEN8zDnHnpp8JluPeYIiuA08TMdFT7DGw=;
        b=nGIxzlW+EhhTSa6xWfQgGYHuht0nQd3JoTV1GtSiqqbqd+acwsPpMztAr6iVnGR9ZZ
         gsj2qKLybrdfBlT5VdwiobpBx2I4IUU4IWV7BKiQnlh9WaGyqQ0tLX4cSsa1bphC0VQt
         55R8iRpxbV5fKtnifx6MFxGoDFIEqDBLe+ZOSo3o362tpg7BoQgCdJQuAtS+J/02S0IC
         iThF90xjYBez3Sl0Vlf2SFWtE/8uOqMGQXCJhkToeyEGMV7727XjDX7wtydWIajf2ZgX
         +lhvvOYjmtrtC7mJHHEOgDTZ3gaGmUGDz0V0JRDRv/lEa2hynbWeZ+GIw+FpwCeZKOXE
         GOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790825165; x=1791429965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vbm7P3UAq4mEN8zDnHnpp8JluPeYIiuA08TMdFT7DGw=;
        b=HCI6he4BADDnJLDOWBWtsriXVdYeYvByKQkXaHe9iHv8rE8ugK20FoO+qg3lXGgxoi
         54CnHSRybRqtih5HgO4ITMDC2Q4oq4NovwMmT9BznRr0aQUAsXuqSwm1Ql0HiO4Oxx+e
         U4F6UzPlBseWe0rf6KcZZBDxASpH6WQ/wZdQTwnHoQ6bJqW8caB6QPeQDqBC+ibbHKPe
         X1QDqCOqfEljeRpD5s5h6upXwUFcu/pXNQ9eEr8MMtNyGZnZJ5P8ylneTOv2VkGUXpiV
         fZm1EtTk2X4zvHCkg2EGFt3t30n/o46LNyJ+ieJMJeAZZDMs+8FG12xO/6atPdwdEKQ2
         12hA==
X-Forwarded-Encrypted: i=1; AKwUvBycKoc20AACmQTtQ/HWT15Wa2L5QsWAI19j0WYanwjT7l7rvzkeLKjicSYkuh6YfHrPhY8WACddh+RTxKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8PA2WVNZzEf9XRI8FJ/21rty80m/pHJQTsQDapjLgd+dmX8iF
	32hxkJSOoQi/XYlYX8PdatFhaRU3hlRHFWFyZrdtUm75bo1nPuCwyXfqjPJv2tuE+foMFJM9r0v
	BSCXI6BMJ3aRvRbgbPEmIQYCLn698nDk=
X-Gm-Gg: AYBFou3B3y/YHk3P6PSK54W1+SnWqJVRUr4Yue5CLsYITX3fnibyzKr7GDS2EvLmpDS
	nPHmm2I2agqjXnydsLDLvQKs7l7dEYTTlmjO9A8WQ0YA1D4tnGoyw+H1sEcn1i50/rrUEnVnFge
	K5o+vHSBKPLDmrU3jFYcRAvtG2oWHOfI9uDA6vXvF22oWh4FUYNl08Tht3WU1MBq0loViewFzrV
	eVuvr5zEK4UHWuutijjkA03IOQA/u89assz5YbqdwlaLFaWCosXW5xhYF1FnZkVgiU1CpvQuC+v
	Gdx9IFm9LeWsBaqoptuelA90Wrte1KggAOx4TcUkI6+SPLh1Gh52ABI=
X-Received: by 2002:a05:651c:1991:b0:3a6:772c:2770 with SMTP id
 38308e7fff4ca-3a783340ccemr3465561fa.1.1790825165269; Wed, 30 Sep 2026
 20:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901022754.3102934-1-acelan.kao@canonical.com>
In-Reply-To: <20260901022754.3102934-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 1 Oct 2026 11:25:53 +0800
X-Gm-Features: AclHuK_nYGrSEKnQrcZDBP5n4iALoJi1Vuobdqv_sext1dnPW6DXbN7ksHy05v0
Message-ID: <CAMz9Wg9NDqcZgVobYRDD5OFHe-28xX4X4w5wfq05DJL1U-fRkw@mail.gmail.com>
Subject: Re: [PATCH v3] usb: typec: ucsi: recover from silent PPM completion
 in sync_control
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Jameson Thies <jthies@google.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A gentle ping

AceLan Kao <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=881=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>
> Some firmware completes UCSI commands and sets COMMAND_COMPLETE (or
> ACK_COMPLETE for ACK_CC_CI) in CCI but never fires the ACPI notify that
> would wake ucsi_sync_control_common().  The driver then times out after
> 5 seconds and returns -ETIMEDOUT, even though the EC finished the command
> successfully.
>
> Fix this by polling CCI once via poll_cci() on timeout.  If the relevant
> completion bit is already set, the EC finished silently; fall through to
> out_clear_bit so the normal read_cci()/read_message_in() path retrieves
> the data and ucsi_run_command() issues ACK_CC_CI as usual.  Only return
> -ETIMEDOUT when the EC has genuinely not completed the command.
>
> Guard the poll_cci() call with a NULL check: if a backend does not
> provide the op, skip the poll and keep reporting -ETIMEDOUT rather than
> dereferencing a NULL function pointer.
>
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command h=
andling")
> Cc: <stable@vger.kernel.org> # 6.14+
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>
> ---
> v2 -> v3:
> - rebase and resolve conflicts against v7.2
> - Invert the post-timeout completion check so the empty "silent
>   completion" branch falls straight through to out_clear_bit instead
>   of being an empty if {} with the real logic in the else, as pointed
>   out in Greg's review.
> v1 -> v2:
> - Add Cc: <stable@vger.kernel.org> # 6.14+ as flagged by Greg's patch bot=
:
>   the Fixes: tag targets a commit already in released kernels, so the fix
>   must be nominated for stable.  Scoped to 6.14+ because poll_cci only
>   exists from that release (absent in 6.11-6.13).
> - Guard the poll_cci() call with a NULL check to avoid dereferencing a
>   NULL function pointer when a backend does not provide the op.
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d718..0363ed127a567 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -92,8 +92,28 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 co=
mmand, u32 *cci,
>                 goto out_clear_bit;
>
>         if (!wait_for_completion_timeout(&ucsi->complete,
> -                                        msecs_to_jiffies(UCSI_TIMEOUT_MS=
)))
> -               ret =3D -ETIMEDOUT;
> +                                        msecs_to_jiffies(UCSI_TIMEOUT_MS=
))) {
> +               u32 polled_cci =3D 0;
> +
> +               /*
> +                * Notification from EC did not arrive.  Poll once to che=
ck
> +                * whether the PPM actually finished without firing a not=
ify.
> +                * If poll_cci() is missing or fails, polled_cci stays 0 =
and we
> +                * correctly report -ETIMEDOUT below.
> +                */
> +               if (ucsi->ops->poll_cci)
> +                       ucsi->ops->poll_cci(ucsi, &polled_cci);
> +
> +               /*
> +                * If the relevant completion bit is not set, the EC has =
not
> +                * completed the command; report the timeout.  Otherwise =
fall
> +                * through to out_clear_bit, which reads CCI+data normall=
y,
> +                * and ucsi_run_command() will issue ACK_CC_CI as usual.
> +                */
> +               if (!((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
> +                     (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE)))=
)
> +                       ret =3D -ETIMEDOUT;
> +       }
>
>  out_clear_bit:
>         if (ack)
> --
> 2.53.0
>


--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
