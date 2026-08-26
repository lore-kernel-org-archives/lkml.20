Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBA3D5656
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744698; cv=pass; b=kah8cRKjunpO0LhUvvpn9sN6685BT9WoJmsiRTvFfF8bOjdtBpJZnA4TwAATwyzTHDDqlWvxs5CnzX/T+fJ9yzk7XLV7ZVDMZ/yWVAegqOGr9X1/wCVnanQcV9hge8Xe1L+zIseYid2gGIUSjkIMwM/lOBHkJlCaS5K1YOa+LVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744698; c=relaxed/simple;
	bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSr6jkLwvefbeHvG49Iu2ko2X+Qkk7l6TDrm6H5tjq4BvaMLgHPLWVH4/NIgxhurSz/3hglxBuc1cfaHSGr+G5bxt5rIz3jPJ+cHA1l/5z691lm31tdMA/tJOcbiXcQjXZZp2p8IGNbcAZsahh3OuC2WCxjxBZUhzbaPugW5XbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvCMQJ7R; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvCMQJ7R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccae46de39so1316525ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787744697; cv=none;
        d=google.com; s=arc-20260327;
        b=EPQo15nlTJz7pyKO0ur7rNpu4Itp5HQOJEpHRbkxx3tXpmQ3gxOeIgmAMNpqd2SDao
         3bPUlKbLbDxD5uDY33wA2hZqYuJZfXJLIeCQyJs8iuWDIR9K3TGInU7JkqwH6OI6Kict
         I+I06dF8qjeI7YQ4o8nZJirKKJfqPm7kwD9EtWt01f6S6DCE0T0k5pLcLorWPxoUAauH
         ogw4AVtz4Fbgws8aGKZl/xbRZcPkWr+w7O3hByFEOstJ3zL0TFtJxFwWNPfUMcPxpWCX
         /aP+XOwK0dgAtPh7VH6ZOnzoy1tMRdX/uehtYpDDO6kzXIszqLN08OqPL2lBY0Z1lTu3
         42Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
        fh=leY8ybePNxAaDldW8LZXelJemjsH/+cJEJ39vkVczK4=;
        b=OZBdJ9YxIcGL3MYUu4RLF8IqN0fFd2fuAd02U3I97DNZ6EzvojY2BF9ce2DNC2We7f
         GFrxktwu+FNAieLWYx1ZRErC1T+k0n6HdMrfNQfz/LtIuVvgXkQLFTT4zEUxYvxIDKri
         j4nhCSP8HFNWYRc1sUw6lurH3Vb6IqA0G1BS4bf+IpGnZeOb5fnv+W7ZOdkHAyPvHLkY
         n3BYJ7yBKhavKfRQfruK2NnqPpMJ5TcouxVZ2vcxEaeyM1cDaDsqmt2MKrZCA5RttLPa
         +zRjF0zCxOO+ONF7n13bhpjoUTOS7UPQ6rRAl5NE1ksKUwSuNXzO212K4egG1kj7HwZg
         Pv9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787744697; x=1788349497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
        b=MvCMQJ7RZoJ36ZvVoy+KhMnUcwP5b6u5NS20J6Li7LMzRsM4AKV3+ZXEdnD+IDzgbw
         ZtK0q2K0jwsTVe3lMO818TUhxCFU11+6bdZABT1U2qEO4MAl40NbEsWllagrH7PFSRG9
         8Jz/6EwkqOcmcazGkjT+f4yX+lEA+eH4vH22nmipeEcRP+4nqFpTL8Z1OeihSdIXa37D
         rNYsK8hx2ewbuOdiuPKhsZPvm+ArU+tSKM480wK//OYGgq17IOrJmJFHvQBHfV3R5ERf
         6PXcoi/Yun3s1k5KFSC9vsAL7+QctJZz0wHeWLbg9eefD62o4Wl6+IyWqJRhx0iAUMyQ
         BRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744697; x=1788349497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
        b=ahxojYbVllcH/PxxGO8/4HMrkRBz7ZJvJJ+k81qnRSinlMW3Sf8vFYgh4ZH68DInUu
         wa6wzmuy4g10PO+DjB2HLov+zo1VZM+aP/+H5cKkExrAWV3l5Pi2HZeelp+SpP/II+l7
         BTCb1XX87cbhQIsOjZTvq+QMRcGBJ09FkijbCfgcTGtkTU28Tkj6WWJncjhxVezX2cE2
         u0TBHtYJVEawRj8WtN41qSbuIc4Tbla6VeYGpL+PQetxOPoPdMaoxxGy0LSoBFR5lkEF
         xFzsv5kQp0VFifdqPAh2nXFNe98TVsK9dJHE1xOIWPdN0h4XPUYW4cNkZzPcMuRCGQ0l
         rx8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpSyoJmJ1NUuj2doq/Sfn7fy5aH3V3kbqZYqURuXEngURyb2fQjzk6zbeIg4Z6Nk17dQkDHzuVShWu72JU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHmZKleCIykEDVbOQc7AfKy/MH5nKNG12i01wscZ1k3y4VtWNm
	F+Xdw76GPguTRYw94hv0bEwbU7WHUKnKMzL36nhQozy8gXm9TXp607nhB6SZ/Yit3mEazVTdlLW
	2H6+V9KED+ZfHHDoasExePx6Fn/oCn+U=
X-Gm-Gg: AR+sD13x0BVCGgVGcYBme+tp31KCg57+yKTpAQkl3Q0EnfWVRmMLa7MAe3Jb77gc4zx
	D3SayXE5ZuDE/mI3tXeS0B+TyvnSH+HgunrfzgBot4Jw5l48iB435b2JS5P1BMZMiIvZy5A9NT1
	fxOaZue7p1uoewqUP7eUSurZJ0hXSAh8pwz+zNlIJ9oumQ055ITychb1yv3HbdPbpcrQWCzQqQp
	skZmmOJYwvdFJqgL2CuWaNVTqK5TAYh1KUPfQ99y8a6Svnva6WO2eLvExzVhKDDJ4QDmipnGPL1
	dre58zy26pAwzNlkSrYWZkER18NgeKedIK4hKng51xIIQRhm+NL1FGKuCQzN2tLeVVRDxXc6X6h
	po0r5HgmmMZPk8B1WdHXJYBc+qZqYJTiH1pKbE4FP8pImc6NXDK3MT1fsekZL
X-Received: by 2002:a17:903:3b84:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d707b73febmr51355925ad.4.1787744696684; Wed, 26 Aug 2026
 04:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818084633.1673214-1-zhiw@nvidia.com> <20260818084633.1673214-2-zhiw@nvidia.com>
 <DKYU6ELNN060.154BHE2QG442C@nvidia.com> <DKYUBX3TU66J.1P5UZ908CCKBX@kernel.org>
In-Reply-To: <DKYUBX3TU66J.1P5UZ908CCKBX@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 13:44:42 +0200
X-Gm-Features: AcwNN1ViXIyYBwk3UCoSH1F24R1mvItcAAdRfKXUoySGlw38Kl_je3lenZCJsk0
Message-ID: <CANiq72m3pGr+sywbZ=woVnpbHW616VN2sG+RKYZWbWHAehRvvA@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] rust: pci: add extended capability and SR-IOV support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, cjia@nvidia.com, smitra@nvidia.com, 
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
	targupta@nvidia.com, kjaju@nvidia.com, alkumar@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> So either this should just be a regular as-cast, or we have a signed tag =
to
> share with other trees for [1] early in the cycle. Since -rc1 isn't even =
out
> yet, I'd prefer the latter.

We can also just keep the "old" interface and remove it later.

Cheers,
Miguel
