Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793523435;
	b=vA7sL5xt5fqrp32DFhKTXLgDw4KpVJZ+W96WKkGZ070VStwMe/4SGNtlWOunBkumWUnY
	 XMwtmTumqjEURagQsuvBwMScD2b3Xg+4SfdMAUtVt4yBANM+8R3jYYsOR4yx6HguLStrq
	 KbgeOvzQt0kaQXibByNZL7UjuikTi+M91Lnwfo5p3TFOQg2pWdXVQDLQH6u7kmFDkeUoD
	 g2/to68znu6tAzUMayt/61QDizQffBQgzuqovEhU+g057zeB9Ny5d3iWd1zQTUpYwo/kE
	 IXQnx1dXmscR87bzAWpzDQPeRVCmagsg1CN+Dpve+W3SxhamDjWfUqZBHLmiIHpqVcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
	b=sWzvgjkWi8EItV7ctLh59E0Uh67MUvmr9ReM5T0smem2XWt6y7bzuj/JYAtK4WTCcmGZ
	 mrQlZ6TtJJhQYs0r5P+dG3uY+497m3wxj0xzTPjm62G5RkPBzXIjcXYXwKU3dV+M0UXie
	 IjqqiivzYIXRnSEBP9soiSqrjXimS3a78CIqgRA1pgx5CdawBIlsXQhhWDD7i0JK6tV0N
	 9IVSPdwDgyRsdU25zHquKRpnlr0udA82h8Py99Kt5pp4xvY9XGdZyZjtekm9KJKr4ef0L
	 /1UUqGnPjr2OSifzN2QGQdgBzTjkFVhohzGFmNT+MoMn4cD1G+ssLQ13k4NenaC1MOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lMY/TGSa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8458606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8458606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lMY/TGSa
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so3560607c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793523433; cv=none;
        d=google.com; s=arc-20260327;
        b=WjzKnWMWNKewkNWf0DqYkmUXgUW4imHtHnP2zaNu7RqYzaxn0RfNLDoYr4I/yVhDHo
         Ega2NH80p2aCCV42nscscudqRiJyOQ8RUgknQ6S9GfcqA4lAiJojeCAL3oWI6Ek6UDVY
         zORvfV7Zs6GsDvWhxPQV6mnzSi/JTxalkfsjEs30DdxjB+DnB5H8exBmlPEXtOrrtprG
         8obbAUyfDQFPuIRTrDaKhbtza9bd/SJt20++0NnixyuZqwfcQDC0HMZlwAsQi6Oh7tEb
         ZDKgN2Zk4E1EGISh8AM2v0t0HZeQByDblhkvJQgvCd85KJj/JQ7JS6rT/OjAtmQcLorO
         fWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        fh=1E/gnFX9aunTeLgivnHDa6ObTojYno6nDUtcEEIajtM=;
        b=rxRB3BBCoktrYv//v3jXEYNmgyR7t6X1zsbLGTIwG02Ad28+pf9TtYCrmzl93w4LGQ
         DPhU+xopwRqAMDtl0fx8bFhKPKG3kPO+E8AwEOXT4DkH6TLNRqJL/gIx9BOt3xSS+Jph
         OMgW7fJqxbw9Bd0tD0qLH8rBwuOJy8WA/cqreUaNpjzq8hesNAYCBf2aPM/Jx1rUEU/e
         BaxOsx+92JgQHYAYPWSkj25+qbXdYAAMg0hd87fedsjToopMuNZQjOcHB39UZ+5xA8HU
         gGJTgWf6+Rcu/sPxQt9TjvMirn9Jaqz1g8wKymdE4H18Qkpck+Dr5ulakwoR9L1L4AVl
         2wMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523433; x=1794128233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        b=lMY/TGSaogsOEauCsh+CyhqkTn4rDWf8Essg3a2dLP0h9Gr/SrE7Sqw5hWF5VvHG8n
         JrJN0dHuk0hXdgN7eGUaZ9icXM9iH+Y8zt/d2BOXig6pNKJDCGSH7NBOhRRoZgMzEYK5
         9cmSZ/X/cZSVFTVaYxa03C0vDDlATRHBzpK9Dk+pQ/oob2ywC6MVfPoBl2cN3YkyfsRa
         WiMPxMMm4rDiGUlOqW9lYYe3fw/DBEkrj6SHt7OBX9WTbCiLCTFQJm1MPLUvF5hAjCUC
         3e7xAlSIOzO8SJ2QTQFgXcGvC6UJCFcGEf+4rSREknW04H6GqwnGziJf5tqaXNa2KNzP
         UqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523433; x=1794128233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        b=oLVs69K2x3CQOVl7C+waeQs/w/SbW7Rmkj0MJL/KqZrAFz9YUrZMPdnvd+mVssT+CW
         mQzOK68zPj9psEXIHZH7WyJBcZoVxtBuhOcLhwtqK6awZ81GPsEQQTMyZSZbk78rkTTf
         d29JYwt98DN75CevDRtsGhVEr/sWXOtPYsuwDgdA6pDRUXNryk1ADQc1jwP6i+95EL31
         6JySM6QUnLaDNZIBE5HunP07MCT1GTVvMhwMKsgiRy8raVhAo8VlenG/lDajoIszd59J
         UVHF5DKSUSXWhoU5Fs1xy+o9b1EEw3B00EdvKel//ggOwXymg7H/MgXe/9KJos6mzGwC
         l+gw==
X-Forwarded-Encrypted: i=1; AKwUvBzjpQMr4kYB1AjJawrgLcnf8D//YdnYYSLOIJoWrdyqLmM42FjjqY1jWXsox3bAljDIfebwLgopZxVpgR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbGjeYBM3lk5MrmO9rz7eoFN71P4BWa61MF0xzMhD9nJHYuM4J
	b31GYRv/1E7Q5yykw/HJnAQDeI/TZ9+U0MB2JOIeSkQX0qbLtzbJyjeF1w/mT97TkNyYjkFAbjW
	kPvEmRhL7qhUo+bPqlV+JH67sz2D+QRMMUA==
X-Gm-Gg: AYBFou2AU+jL07WF3JApjKvmhgrN0e7t58z1bXN09QZQSQ7Kly/uIE1/e3UcvMbgJOx
	khYDC0or+Me5X3YGbvyffxe1Q5L3K/Q6q4ebNRZItEmi6gnK0g+z4w0TJzds8dwpCxLfeo6sSDy
	TNIoXVeXiRf4h2vFe15iM6PG5hao2Qvttj+tvyFchJF2slWMd8OwZd8D1WPUymP7piyk8U6sPwq
	0UqPDkdTs3rjWMjBKTSgalS28UE7hTM/9NbPrmqrUISy/yrjS1pvbbmtb7D0zVORI+77r8KhMP6
	ec1i00hWPRhYjXDoJHi0FzHvbqpLuJmqxQNaXtLSPXRu2+WjAKxXP2FiU68fPPPhoDUuFLpEEii
	6boA6MqGI14uRs+FdgdAVW75fx8q6SzLfaQ==
X-Received: by 2002:a05:701b:240f:b0:15e:6541:3099 with SMTP id
 a92af1059eb24-1ac5a0b8b3amr9647957c88.7.1793523433136; Sun, 01 Nov 2026
 01:57:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
In-Reply-To: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 1 Nov 2026 09:57:02 +0100
X-Gm-Features: AclHuK9wgaJ_HkNnJv_xBJjiMMzCDxyfUAruQ6NGbegvoXIPxxM6IwWV1dPVkkM
Message-ID: <CAMhs-H8qmxZZ=6LD2qCJfM0AciX60AcPz3pqCp+gS5De2P-bYQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 8:02=E2=80=AFAM Sreeraj S Kurup
<sreekuttan2156239@gmail.com> wrote:
>
> The PCIe port initialization code acquires a reset control handle using
> of_reset_control_get_exclusive(). However, when PHY initialization or
> power-on fails, the port is removed from the PCIe port list without
> releasing the acquired reset control handle.
>
> Since the reset control cleanup iterates over the remaining ports in
> the list, the removed port's reset control handle is never released.
>
> Call reset_control_put() before removing the failed port from the list
> to ensure that the reset control resource is properly released.
>
> Fixes a resource leak on PCIe PHY initialization failure.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
