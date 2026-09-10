Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04DD3D953E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034011; cv=pass; b=J6kypCPoVkBcNbgYy5uC2/4J+NMToHn7yQlEb2NMM2el06eNIsNDVC7khCY0iWn5sElnxHeReLGQ2uehM5ca9t7lgjZr9ywXYhATOLakSSWfAjwSwDZ+fh8DSgeY7araiaapwoQBt29tNDlsg2+VxLp30JNJQgTLAGWRhunu+RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034011; c=relaxed/simple;
	bh=3QU1jfCWX7LaB00N5H0qL0k+c5PTLtBxL0zT3CyJSO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJEijp6JorgIXci/N8pnx7hfYKfusJNRyn8SaCyYQMsqOigIoblr3fhrhUzFD3lBdwCrTHENX3LV1BIaQRuplQCKMZdRZN1fOz0ESTLFGLlueniocghugX7W/989kTyPjbrYkF/WALU0ORQVRRGrKfs2n7ryvoODj4bXj0mYkMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=rzo/mAU2; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="rzo/mAU2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c294183384fso222407966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789034005; cv=none;
        d=google.com; s=arc-20260327;
        b=QJ2ttC0oo4zbJepi6h4BxbmZoUVSG/kUwKAq5m3ZfijzStRVKydIWkPZNCuS6XNOBH
         vh7SjC4T0gB7mrTm8A0yYZLywsRU2BttSV7rN0ntjWaSWTcozr8lJy//m8vHbiOlGcS0
         fyO+ZFWx1IVKOeui1y+o/vjuFOsyZ8BHeSwXb4Rs8Lp3o/Qsg04xw1qrSfaLCiQMJIcP
         lpXm9J44eGNstjdN6nl3Litfs9ljh/f4WhJRzLTH6blE79C74/42iVdvcGLIVYu+GTmD
         61AYR+A5NSuA6sn/+m0QdnLNg0Aa6f/NcJBbO+MLFtz/yDp9P8gY/KJ1Ro+dIn0x4uBR
         a6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3QU1jfCWX7LaB00N5H0qL0k+c5PTLtBxL0zT3CyJSO0=;
        fh=MMnc83fe2/Ta1R21FPzYMWk0APlWw2enLYJzCVpWbl0=;
        b=LA92DeZy1fV8BQuXr/dbsmXrbPEHULdaI0dbldW/HA+8KYjNZOu3NeatBuT0mim7aX
         iWhZFbdYUseOh+ZYaFODHrLJAbstUiXmgLkyuTObcfiN8KqcKLAZYBDLCAa2jp0Vc0HK
         53yU70wTBc3L1VGzusq3djKgFTHivhSWSdemHSH/5icFR8aY/u04TcDs3ZOueoLzFsTp
         8KWkonqUOuQunxWNz+GiAo7k47VS2aIk5gf+REuxrrQnw1cdNSU1V70Kkxb5p5F41+B9
         e2/jEmS3YfrGumkH2tNggLclv0SYBkC0W4Vo/lTBF6DJHllbpOJI0zSBlwPzHhYIO6vf
         7E0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789034005; x=1789638805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3QU1jfCWX7LaB00N5H0qL0k+c5PTLtBxL0zT3CyJSO0=;
        b=rzo/mAU2ziGKLpvybwiDmCPq5Fq/pFXsTMY8qPbQ1DruoEIR7hpQoPR0v/JmiXPkyt
         FXjV6kfdvzaLGlAGDrwmNtfqXs7m3UmTvykHh7cKQkpMQSLO87t37QRGMOWqkS3sxnlJ
         OVg2P3aandCQZuszWHXZA3EJvnm3c/IsrvNQ8TGxzaa0JnGghW2K4Vv4TWRxCV7zOy/t
         OyAILl4ce386R/9joBv2BrKak74sFU9I5Pkf35oOIF5rO1DBdCqnPW6LFZfpoqxaDuCp
         gk2Gj3fpKFr2mxEhSbvo1q7q/hHT1lBNoBNsO+4QsCWBE9gCzQ/yUdfJynvaHkqlU2u9
         dpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034005; x=1789638805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QU1jfCWX7LaB00N5H0qL0k+c5PTLtBxL0zT3CyJSO0=;
        b=kRNQw2UOh9bVPR8EPXjg9qCyxIybW4xnkgXBmNl6zWp1HJ8RnXLS1WfTKiX6MnmNJc
         0vbguPEpvIoWwZ5BrggvOYWppZ0t3pgTkkUFylhLEBVjHVjOSLVPhfB0IBacEeVpjptD
         2nF+kwnTrCTOX503XvkUKUWX8qNbeqOiLfi6oWtBltcsImPS3tB7x0PSxXpBn0IfGxp5
         TkYjIihf+73LxdXVYgzMZoEmnFeTy5E2bCzEe2AVWYau6mzSrsn1K9Kbj+7g4R6rFm5B
         R+U7Fvf6v3B0Bc6bRYmWD/vkM/S00Gv1Sg8mRyxYjkRUNtffFH/rffREZDW+K09GBnRY
         in2w==
X-Forwarded-Encrypted: i=1; AKwUvBwfYIHSygsAr1AVjhaIHWI8wnoJXMPwl14IHQN5jK3FKMIJfh+Xfmz4fflNJ7W7VcBMEJuUP00Qn0HLy0g=@vger.kernel.org
X-Gm-Message-State: AFuF++mRbHiFUzvf+eICbDq3GgOZgR4e+D4Psw1UmQd+AmCvEpsLV24N
	ERLvJEVjOtIIMPXzgPeAQnchynd0IYOaz0+F966iuSJDPaqVD+HAbkrjPa2xMx/csLYJQhaf6kK
	63261vDWfPHt76bC0G8QKdoAKKd2j35M7xsvHcd78HQ==
X-Gm-Gg: AYBFou2u2r2mkmVGECPNTCnfe3KvtyG3G8zc4arCCa4K5Oy2Qaao4W9RIZ1DLzgWj7W
	RVdRxvhFZENQfuqUpZNI/yiT2cdAiwNKyVbV4OFGJngVIW1Vji7hwnWgNTX8Zoynohtl5g0mYfo
	p+/wJsTtImoJuNRt6HXNGG45llWFfEW0+KpHrNYLnjcnLcEfzYKvQI+NMJ7GIOz/C8yZf9I3QfL
	WDos0sG+e3Cnm9eFsUwSd6otmdvmg3jhMBndXfQQNM0uOd2axO3NDV0iVyWs3GuDyJo7jXchCmw
	CVUgw+Zf6+X/IMDgjLwdbSpElwX0iKM+zFSu/N9gwXauxkfSTFxi/3PQTvkuOeIn09g3hID5FPV
	WQhiZEPbmebIi
X-Received: by 2002:a17:907:7b82:b0:c21:9b4b:2690 with SMTP id
 a640c23a62f3a-c260c9e75e9mr1533229166b.17.1789034004977; Thu, 10 Sep 2026
 02:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-bq257xx-init-v2-0-deb4076b1f02@flipper.net>
 <20260909-bq257xx-init-v2-2-deb4076b1f02@flipper.net> <aqG3p_GKtncRCRI8@venus>
In-Reply-To: <aqG3p_GKtncRCRI8@venus>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 10 Sep 2026 13:53:08 +0400
X-Gm-Features: AcwNN1W2BrkdebgjQ65zbLYQqJgSpk3t26ruwQKsK8HzTRUFbxoKV_vgeb2TRlU
Message-ID: <CAKTNdwHCN7D=W1o088RnEYQrNRf=RzfZ=qJiUa0Wz1N-kubgPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] power: supply: core: Allow getting battery info
 before psy is registered
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sebastian,

On Wed, Sep 9, 2026 at 11:52=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Alexey,
>
> On Wed, Sep 09, 2026 at 07:41:45PM +0400, Alexey Charkov wrote:
> > Some power supplies, such as battery chargers, may need to program the
> > device parameters based on what their connected battery allows. Current
> > API requires registering the power supply to access battery information=
,
> > which is problematic because a registered power supply is immediately
> > available to the rest of the system, but the battery parameters may not
> > be set yet in the charger.
> >
> > Given that the battery info helpers really only need a fwnode and a str=
uct
> > device to hang devres-allocated resourses on, add a pure dev-based get/=
put
> > API alongside the existing psy-based one, which can be used to query th=
e
> > battery information before registering the power supply.
>
> Use the new init callback for that, which got introduced in the v7.3
> cycle:
>
> c1eb5905fdce ("power: supply: Add registration init callback")
>
> See for example fdece8642eca ("power: supply: bq25630: Initialize
> hardware before exposing the power supply") for a driver that was
> converted to this.

Indeed, that should work quite neatly, thank you for pointing it out
(I've missed that addition). I'll then drop patch 2 and rework patches
3 and 4 to use the init callback. I believe they can then form a
separate mini-series only touching the driver but not the core.

Patch 1 still stands on its own, though, as it prevents a
use-after-free during teardown. Would you mind giving that a look?

Thanks a lot,
Alexey
