Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951A381E81
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532317; cv=pass; b=MRlUce8Rh9EAm8LT56FkqFXFMfXCfFd4vnRwlcc1RMxap5/t/2ZwMqEBgm+pNg/JfDGrMSR3k7xXwpNDvL71mqe88kzRSxky8aM0Qk6FGaikTIKo5irUT8hnkuYwY8tNWPPcVhMfk9inlOOGvN9QlYcVLu5QFl0EbGrYW7TybUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532317; c=relaxed/simple;
	bh=EUrFNP9BCg9WlG2I0gakVeSl3LFCWv3korj723trdLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYwSUPWM0S8BKkl+CwLN28fqmWW9AOayqxgjA7qvdFtBR0WzVhVVDWeIS31X3eb1pCvlW6U2Ig3S+ghAu4B0knwCi/moTxFWncGML54kMW2AgGI0Q4ZAE/JE4ThBjtrZlaOySON43LaN6sUXNItxXXMrSO6EB2UWexDHz6w5nPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFmpJ7GP; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFmpJ7GP"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-857ff9fef54so11430827b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788532315; cv=none;
        d=google.com; s=arc-20260327;
        b=MDj/1fuviP736lXUz1grPnk/9ZDQTpeh3PZxNUhWpf3FLDQ/SZ2WtKhDMZ9YH1OE+w
         TBhdnrZTugEcUwAhZf7f/gtEklRIc5LyuLyGYZph/TZ+8NEcwo3bC4jFteE9K2lVg8KT
         UFbyPJe+0GLWlEs7p4oAzkc91nCT3BZzm3wg/wDoLwx1L7+WSqpmBoYS+alb7qjmUgpD
         3yPW8EXvdBcWc+JANa5+ejkwdVFtZx36LWuoZ3Xu9DBm0Ij9++GoK+Vi5Htf9y3GLoMI
         QF3gHFxebNN8kY6nv/obvHBZnq7jPZ3rHYa6cQGSYLvCM0XurcSU8uwVDB9oiuW4FGwj
         M6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqCN/HI5RYWhLWtsiJphq0wPY50MMDouXs3XXBcYcls=;
        fh=A7DingB3eqx7HemFMZ1ekEa47tzNkzPAeqkcn0UtoQQ=;
        b=cHAdUZNDvXQJ7sOROo6fvBbo9Vny1WjzCSCZrw4JvdGsCl+zcJlqsx/oJZV+OY2wWg
         IpVWhnKpPjZkGir9XeyokuOSZIwJJT8JKCdk+VetLFJszbQD9uFdE2Cdhr8rMBvzBFTe
         9XQsYZ+kAZlvqOFoquE73RqIQSsj6Op1VfNu3wsMipvSQ1PSgBrA2+y1xN18wCFlT7Q2
         DYy0pgG7ArL1lAKkcnnc8pOOFGPxb/aet3/4xigJ6zjQtNSWSIZ6btz6UYY8kYX25H5j
         V3f/UqUvbDRYq0ULu4BpWBFi9I6IROoTsZoiL6LkmlkqBsgaYLyMT7XbqdTfYj02HS4n
         r9/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788532315; x=1789137115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqCN/HI5RYWhLWtsiJphq0wPY50MMDouXs3XXBcYcls=;
        b=kFmpJ7GPvpfybDmXCyRQLCycWcO+Cw76yl1kmm5ay1/tW5QroRLKMvPjefER3aJ74u
         zWc/UcvMkY9Vq7lBny/IHZEQxH9Tqe0Hk+klKy8TRwItQbK6oQE+rvlvBOBnqMEpGSBW
         q8zeh07x471DDmFcpk7Q60DjJoOTkPez+9/QBGGu0b5dwcOb3PUNQ3yCP9Di9ISk7FS5
         QYRdhokoA/EhKzXX/Gf6hnyLQtA5dVoL3pAKM7YFbIK+LPdA/wJvY/8c0JZxA7M7AxW6
         s6D3TIitoCE75rDamRmbGrMwR5P2BxTe1TpyjALC7buFxa/QjM8JNOcK1FT3yfXsO6PF
         EVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532315; x=1789137115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqCN/HI5RYWhLWtsiJphq0wPY50MMDouXs3XXBcYcls=;
        b=mw+FgISTulhQHMnTdWwSi9snCeXlnmVTm8e5DeZkdCJE72u4UummQfAscJvPpFdJeV
         3cHT3BlTt+KTu07IjMVvBYYr2OWIYrxGwzaaLcFqR6SmGLOjG/2HV6FQYR+7XZNCSB6D
         juDi3esWlovLKycCAKqHx5a1fpOjyXpOjX8OvQpIYgwH1EArd2nBdYhBe5t+ZgJcNYRy
         ffRoniyjQsDHRD7LJ5ZvdvYoxZW96TfmzsZ96qk8owcfKUMB2jqgj/sngm9E9PPz7XPL
         /X+i59Mkw2H8msqG2PEMRMG8oyiI9b8NX5rAnIEuXDemmgSZTxS4I5No1e4zIZnHam5a
         kDog==
X-Forwarded-Encrypted: i=1; AKwUvBzdO0HF6rp8TeLOdGF5J7n+3tfNZ4ryb4JW9v8zqLxi/AR2oPZJ6rloqukbZzTi2SxBgFESzREc5KZd/Zk=@vger.kernel.org
X-Gm-Message-State: AFuF++nqBoR0LcU0+C+vG1BPYfCim8aiGIr5fDDhwuXEqrLU3t6WafqE
	vugiee0E8UC3oZjcXjhFntIw24qV/rIdZPn8v50L+bpOYhdS8B2U2R0SYTbvWZ/lNDW+bG84OWV
	+LkLduDjdk9grlLWgv3ZErns69MQJZew=
X-Gm-Gg: AYBFou23SlyhyZ9GJ9koLN5oG1VoibYvQ6oC0yGxPTWvkueOzFajuz41M7U9O0oZbOD
	gWyNRtB3VCeuCd4jN4k3rqr3KWEbjDsTPWlsH/y5NQloG7Zb0g84vjbCiiHjBnrDdnWD5p1keZJ
	P6ZSLqqL5doaHvK2eA3IZ6Gh5LFzczHnOaTE+sH7/Z6hhAjqT59Kwgeg3gGdiw6C4yJ6aE5ut6+
	OudMYYelrSbZPusUvFFC84eTBeMAQAdIaszMbpbKQPPZ95tz0mSC2GjTSESVrMLBIO3eodQSHt2
	OwaMlgmcO1CIjOW2LjR3m5oabJBrei9iMpVz+CtnHLWoidrgVoQwG7weg3Dsy/Yy2oLQYAyesq5
	at+C8sMQmGSCtUSmshBseHni1qZpjvco=
X-Received: by 2002:a05:690c:e647:b0:873:5bb2:6c0d with SMTP id
 00721157ae682-8735bb26f36mr3450037b3.55.1788532314495; Fri, 04 Sep 2026
 07:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
 <20260903-vendor_hci-v3-3-015d62a57c91@oss.qualcomm.com> <CABBYNZ+1PqFXSqAPNC3krSaTccv4VT7ERNRWkO-pCg3k+qCH9A@mail.gmail.com>
 <985c44eb-38a2-48f9-96e8-292b0a39e29a@oss.qualcomm.com>
In-Reply-To: <985c44eb-38a2-48f9-96e8-292b0a39e29a@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 4 Sep 2026 10:31:42 -0400
X-Gm-Features: AcwNN1X7ssfGIul69kfUsJjbvYX0NYdULav0ZcJTvPLb7883mahkR3tWYmSMfk0
Message-ID: <CABBYNZLddwpM42-jpbGbi+wpiJgqwU6UB4TKc1KjC9pR=aM95Q@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 3/4] doc/hci-protocol: Add BT_RECV_VENDOR_PKT
 socket option for HCI_CHANNEL_USER
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Fri, Sep 4, 2026 at 10:12=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.com=
> wrote:
>
> On 9/3/2026 11:16 PM, Luiz Augusto von Dentz wrote:
> >> +BT_RECV_VENDOR_PKT (since Linux 7.3)
> >> +------------------------------------
> >> +
> >> +Control receiving vendor packets, requires hci_channel to be set to
> >> +HCI_CHANNEL_USER.
> >> +
> >> +Default is disabled.
> >> +
> >> +Example:
> >> +
> >> +.. code-block::
> >> +
> >> +    uint32_t enable =3D 1;
> >> +    int err;
> >> +
> >> +    err =3D setsockopt(fd, SOL_BLUETOOTH, BT_RECV_VENDOR_PKT, &enable=
,
> >> +                     sizeof(enable));
> > I don't think we ever applied this socket option to the kernel,
> > though. Anyway, I think we are better off adding another channel,
>
> Hi Luiz,
>
> Good catch =E2=80=94 that socket option is introduced by the below kernel=
 patch, which is still under review:
> https://lore.kernel.org/all/20260830-btusb_qcc2072-v2-2-5c0e0c9dd98b@oss.=
qualcomm.com
> I'll drop this userspace patch in v4 temporarily to avoid confusion.
>
> > e.g., HCI_CHANNEL_VENDOR which can then allow packet type rather than
> > just the known ones.
>
> For this new proposal:
>
> 1) Is my below understanding correct?
> - H/W wire: BT and vendor packets are serialized together.
> - Kernel: splits BT and vendor packets to their own channels.
> - Userspace: merges both channels on RX, sends to the corresponding chann=
el on TX.

I guess that is up to us to define, HCI_CHANNEL_VENDOR could just
serialize everything, so it supersed HCI_CHANNEL_USER which only took
care of known packet types. That said I don't think it would be an API
break if we decide HCI_CHANNEL_USER carry everything, but since you
are trying to introduce BT_RECV_VENDOR_PKT there maybe a reason not to
enable everything to be send over HCI_CHANNEL_USER.

> 2) How would a HCI_CHANNEL_USER user, e.g. Chromebook, send and receive v=
endor packets?

Would have to switch to use HCI_CHANNEL_VENDOR, just as it would have
to use BT_RECV_VENDOR_PKT, but then again Id rather do it on
HCI_CHANNEL_USER if we don't consider it an API breakage.

--=20
Luiz Augusto von Dentz
