Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAECE45A2A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774737; cv=pass; b=XUWmewEGVEt8xGAWcmZBub5V/d/EGtd87COteMkpXEQpoEQFOJQbVYoj1dtUm4H3AgjZPvpRQWwzEcDGcJ5WOl5/ujvOUdfcuY0Rnk/KXPm2T5bt40P6MaCRUj44bv57IjcAycfWAcgMgwGvTDK0dla0qdF0OSUdu6b3mwfFCDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774737; c=relaxed/simple;
	bh=3xW3efaKmi9Dz9Vb0WuWLDIqg0HD53iZMVu4vjA+zeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ8D7EcpGsqGaI9wRmhC1XIWTLl6/MXSn2ac0NrySRxIBdvhUD9KYQNvTtk0ycv0wFelu1JEQFe8YgN/Who/oahPcl1H4QfH8+e79/k1H1KaclVXO6nQqf5Z3kVd27sial3IzL6OjMLGkVNCAmSUSjz20bax3yxY/17xEMYlynU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyLWaHpM; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyLWaHpM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so2912780e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788774726; cv=none;
        d=google.com; s=arc-20260327;
        b=BcpP3TVaqBqILpfi54xzcnskZzCW0HLv1BylMoNYtYralmGrpsoMVI6c3TrPEnz4NC
         A9dRqy95aKSIO1Ac5PU6Ov32KzmciaP6E223Z5gDC/femL8xNtYCv6HC4QSbbMQHgyVk
         RIaHsqVLhJLsnGfduY3xSa6DHkkf7AuiasJqy8e4uwXl2ev7tuRG9e5NsEfOAjhpwUvv
         wp29lCXE7T9QmhQNYDHhrvi2dU1iGcYMZKT4rZb5XTbHsnpef2vVGKjU35pWmKj3Mx+y
         tCpoCorK9zcx9m30BLzquW+CV0nUB/hdwKHPavJmd0HywdFWpb4Pc4LcyCaL56VrPdgQ
         s+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZBjOJo7EwsCWCLDF7JfKkzJJNA5g3AFjMG4w1eSnQA=;
        fh=WRuQb9jeJBaISzuaSjAwCz7eH/4pCcUmyRGU5iZPBB0=;
        b=JPPvFZD7HuRRg5ZNyrlpjm9IeySFtaQJ9Qdc6mP3/WsLt4D+wfp0gsZICjgS819K96
         m3zCwD+bTFkFBg4Sk6mYln7fIHjHmEKZGS45IvzF548XDNS5zXcDKuhQaB2vFysyFnTJ
         nv0mzxz19Eh0SJTMRnQVCZoAcstWj+os/+i5CAVlrYpWUYZWjU9dj3T+gjSyL2lSyazq
         lIlET8+S1/x8CoafoPXxqLjFYfdrSS6LAkEQGCd6URaDdjufFzWw0jBTpWt5f4+kT3uT
         Xuq6/JGRYRYe4etSlBKGq/mYhj1RQRdfTOZM5UBpk0VgX87/Ec0ajKtRmNY6EX+GyYfd
         5I0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774726; x=1789379526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZBjOJo7EwsCWCLDF7JfKkzJJNA5g3AFjMG4w1eSnQA=;
        b=UyLWaHpMcHWWHqSYlClJrAQlDUoEbk7+3jpxdWxzosZLQcgl9JTkhdf/MIVIbvZtjf
         GdyEfx8u7jx5EimIHPjLQ4EWBHGRkmOvE1XIUVKVIs2TEb/AHneSkXTxhiuM9mpYhBA1
         Qc4M48I3QbPHL/9QbCdiBRp7UvBCgNYLak7JcZkKIihoJ47feMEc3x912XlUdgPRjdjD
         uWxA5I490r0qxQvCE5z/fd9CkrKS1vPdGiTHti6OPVfbxO59ckxd5xlUHfaOsjZ5nnZv
         khmtDbL8xmwSRjyQ7l2Kbv0psATO7C5NwVu6R2+hN5DgpWMNx4XGaLbCB3Rlb3AoJpNt
         E0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774726; x=1789379526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZBjOJo7EwsCWCLDF7JfKkzJJNA5g3AFjMG4w1eSnQA=;
        b=Rv9OV/LhGtBLnQ7P73z85ltlc1Y94wReKI8Bf0Dq/kcisxu/3xEsaSLekX9SvqjWdx
         yfYRq1QsjARfovbZyTh0KNRZ53NiPDdYxsvim4PPzJW5MqQS5ZUjxES2qjt6wJNF8YEr
         2oFI0Wx94DiC4j/H51KyrJhEgL9C7/UcCHV5ZZhAjef7RQTZOswyLyiaqYyDYEKnEBHM
         CiPNsCNn8ZRY9th8zMun90Fj1eHuCmQe/VGe9W5LqpGwEa1gJZVkskHaxOX/wp+tvXbR
         fHmz1jE9RmsFU97z6eBPsa61zEPBBzOwDfnAVoPRTkCAt7L7a22Lxgx094e2kpvnw7UU
         j2XA==
X-Forwarded-Encrypted: i=1; AKwUvBwDLmAjtsk/604XcyR5qkcHwmsq8E6X3LK1mdM4d6RH9tQdv9TYo9S+NtkowhTtEYG6e2wyloV07mgfF1E=@vger.kernel.org
X-Gm-Message-State: AFuF++mjTOxhFA+MHkAoZHvYYff3nlx+Ob6jTrUgeoV3Ckbld0at8LDW
	ND771a9xLi9o6chkrteJGrJRtH9JHV8BRlI/Cw9couLyurb+5Krcz5kv5X+frx/IFTarw3PzWvE
	mmuT7HBk4CNuhqPMJBvt8lKqMHJkh8XA=
X-Gm-Gg: AYBFou3z/UCR7+cWnci56Rh2t49JE5+Fh5NiY+7Em/02OL6Vu6QdZRLi32niH/toojR
	NNY8Qu+L/wU+NTcHq5TrgS3QM8D5UWNWXSQaCkZXcg5r8tbysYI4XzW78TfnroOd+weaeUDa/WE
	7+MB/678h8G12UuoPIWFkmFXbHyTqBGBUhuJoLi4TqWAZy3Rt6iipcrg7pnMpWw24dnRq1Qib+r
	mZVx5m9eD5R2lnxMtnRiH1+YR1xOV2VyCo0Dunpf0amOhfDmpA3RjbS3N3m/hiOJcOx15Hd8rzE
	A+teaMnqnCRGw7Doo/qPcNfiLyYZtbdbYbajKIjcNl3o
X-Received: by 2002:a05:6512:3c97:b0:5b5:e2e3:4dd3 with SMTP id
 2adb3069b0e04-5b616f325f9mr5904093e87.20.1788774726258; Mon, 07 Sep 2026
 02:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907035726.37123-1-zenghongling@kylinos.cn>
In-Reply-To: <20260907035726.37123-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 7 Sep 2026 18:51:54 +0900
X-Gm-Features: AcwNN1W35E_APW41_zojqmd7aUw8N6t-AJaJP8-EqtmOcwckOy784z6QuVWrJKM
Message-ID: <CANFS6ba6VqnDTXeUzBPDEKTzVK7kMHLk-sitncT-oGToVQ0J6A@mail.gmail.com>
Subject: Re: [PATCH] ntfs: use fatal_signal_pending() for fallocate
 interruption checks
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 12:57, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The fallocate implementation uses signal checks to let a long allocation
> loop abort early.  However, signal_pending() also returns true for
> TIF_NOTIFY_SIGNAL, which io_uring uses to deliver task_work completions
> to the submitting task.
>
> generic/616 is an io_uring fsx soak test that issues fsx-style
> read/write requests through io_uring and calls fallocate() directly in
> between.  A pending io_uring task_work notification can therefore make
> signal_pending() true inside ntfs_attr_fallocate() even though no real
> signal was delivered.
>
> That caused the previous signal-interruption patch to return -EINTR for
> an io_uring notification, which fsx treats as a fatal failure.  Switch
> both checks to fatal_signal_pending() so only fatal signals interrupt
> the allocation loop.  A real fatal signal still returns -EINTR, and any
> other error still takes precedence.
>
> Fixes: 4dc8f4ee2d46 ("ntfs: handle signal interruption in fallocate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


--
Thanks,
Hyunchul
