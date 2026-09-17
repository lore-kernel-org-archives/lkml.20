Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F034A2040
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682399; cv=none; b=spfyVYGAduyS/0sYLueUMjxSYri6M9FRXrvvn1XQFilKF/r9g3Wh+h4+9Vs5E65YhDmwA/dp6dwx0oR8svIMw+3BjG2mcgrdvKIAP7ltG2LQWBYNIS9t7mnDiXS+xiEkSgLDhd0gDEiO7XT0a7YZOTqkDkRo6QGW7gUT8pRjQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682399; c=relaxed/simple;
	bh=ip41HoXWI4YcOSbW1mEcNQBv0yfH8oGIibej8w1DMvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfs/3tciLc5lrF/NuNBgpwYBgyk2XL2oh70TBZx7xZvrPR083bosAnIxWm8cXE7o4Mf/9k8wsJKF86EYTxB6a2Pdnci5obNtR8jJVTSnmcnP5JqSI1Iff4S7u7PgzLK2cYZaPyf7XenLPYXmE4eaEbt1JZxnLhso7G/d3uaIBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HRh7bnsf; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HRh7bnsf"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so15458366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789682395; x=1790287195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r4cnNziyY5ivazygxhgE+WIDjeZucbip+tFrsvHGAeg=;
        b=HRh7bnsf5/jUBcvfJ8Zp+mxY42hIHGPDJm1Q3pCnXP+ZKLKVpda/k/q6OFJoL1/+I0
         UoWWzxADo8TYTAvgWx7k0c/D5KuqdySxt3AWCL9G4lCqaBfXKUYqVsnTuXEeaI1OOZ/q
         yvinHrJIrsvHNilrdW+kSuls/2hMWlgeIaTWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682395; x=1790287195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4cnNziyY5ivazygxhgE+WIDjeZucbip+tFrsvHGAeg=;
        b=tNwm/wlDSVXME0R25MDtqElVGY7jIZw6SeUajwq9RGs90TkVFjyJ4xqD5LFbaYnsPh
         sAC1i/OTnpjvVRF8UuhU58LC7h6QOZ3IJWFdQ6VgU+QkIh+E/skEAlxHTCbkm02GaEJp
         2sFrDlk5OMyiEPj+dbruCf9/YL6JbLCT8kUxaEqZ+IOvoD2lLwa/+eCY/RUewkVh2E9p
         08uHKV4ESR0WAVc5yKctp1rIBFvLylt01nr23FcCuOtTmdba1HI5S3cG8QexglXSJd5A
         HQpgxHvDkrPJXiVdBWGbWxj2RWN8yCvZhKEc5WIBHml9kux1wb4sS+dC7QLwD6/8p8O2
         8b/A==
X-Forwarded-Encrypted: i=1; AKwUvByFuRmQRAnlTesGnYKQktCIiOPbtVT4ln7idlEmKs60tgAT91w7s2yTmh+5iHgEfJZqXGXLnXWDq+SYTNk=@vger.kernel.org
X-Gm-Message-State: AFuF++kwvxNlq0+w9MbPxBh/pv3owm1SuOPryOGEKSpLHQBF8/9C6dTD
	OUro6eh9xqrQWJJs3DRKwdUooUQDh/KoTKElVWox+vvassVO6Okpu6PLSp/JYPZOy3jouWT4/HK
	v0JmxZQ==
X-Gm-Gg: AYBFou1PEJ2ODlR8HIzSdnF6G+7T26XEf9jLbnPvQCGxwBb9cULtwqyzCWuQl8dTKd1
	gNdo+45hdEU2XcXejoNy7TY4bYFYdXsh4IDvM3bmNVndbHYGt05IR+Q9h4E0nnumqpDrRnmENAJ
	06Jfi/1joNrIQvLkeUdBFfkfrIVW919khwS28XBMYSlOogGbYjgHcpjeJU9UVeFNzl4HWMgzuhD
	ioLlt2MShyCBWM0l43L6ma7lcp3ipltczoHqog4vjK/kKIgV4XJTw342Vmd3khH1PSeZDnBXEb8
	UZ2uJ8TO2au4EBF88PNyOuE/X/4oNFm7aW9pbn8Cy331Z+KMZABLS5i+38+MBAt1/Va7bTubi06
	vN5Wge1H/eqR+3gbsPyP4flQHPg0RYU7Wd7iDPklXAFyuS+Q8fU/hyUcSeVNRlqe0SFkyQo8JsT
	xmqxOdT1J6EClutfDgnCnS0XoLiifN4Dlvrl7rpFn1BJ4SDik77VKKauJLoBV0tmfX00Z3coj8B
	xp9pHfd6XtGSJQTTJYAZNYgPLysTlIPR1MxG18=
X-Received: by 2002:a17:907:a909:b0:c29:3838:dd5e with SMTP id a640c23a62f3a-c2a15e3d384mr50102866b.40.1789682395469;
        Thu, 17 Sep 2026 14:59:55 -0700 (PDT)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com. [74.125.225.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de487970sm348759866b.29.2026.09.17.14.59.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:59:53 -0700 (PDT)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso28772f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxnRIz4rCE7sxT7qk0sFoss6dwe3SsgWy9GpUxcqBSGKWvyCzMvIZkdQqtBXdIzGgClxBcjgS2J4RKOLR4=@vger.kernel.org
X-Received: by 2002:a05:6000:2211:b0:487:a49:69d3 with SMTP id
 ffacd0b85a97d-4871e373af6mr289328f8f.55.1789682392891; Thu, 17 Sep 2026
 14:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917155523.2161202-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917155523.2161202-1-vulab@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Sep 2026 14:59:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTr4Q7gOQts8HasSQoeovYMLu7ic8V2fkuy2TgyUuB3A@mail.gmail.com>
X-Gm-Features: AcwNN1UiO2RFa1YhyTUqFm7bdR6dSYURtFzuPkFnJib2ceEhsCbcSdyptjfk5VE
Message-ID: <CAD=FV=VTr4Q7gOQts8HasSQoeovYMLu7ic8V2fkuy2TgyUuB3A@mail.gmail.com>
Subject: Re: [PATCH] kgdboc: Fix tty driver reference leak in configure_kgdboc()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alan@redhat.com, danielt@kernel.org, gregkh@linuxfoundation.org, 
	jason.wessel@windriver.com, jirislaby@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 17, 2026 at 8:55=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> tty_find_polling_driver() returns the tty driver with an extra
> reference taken by tty_driver_kref_get(). configure_kgdboc() stores it
> in kgdb_tty_driver but the reference is never dropped: it is leaked when
> kgdb_register_io_module() fails, when the configuration is cleared, and
> on every reconfigure.
>
> Release the reference both when unconfiguring and on the error path.
>
> Fixes: 7d7b93c1452f ("tty: kref the tty driver object")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/tty/serial/kgdboc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Looks right to me. Even the "Fixes" looks right since the tty change
landed after kgdb was added to the mainline kernel (by a ~6 months).

Reviewed-by: Douglas Anderson <dianders@chromium.org>
