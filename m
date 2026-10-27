Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109286;
	b=WbZFwuPBhcd4TL4VLS2Z972nY7K9Pctuq3aumPYnsBVNCGTh1IyK3jAyjyujhSSyyPsd
	 JF+AxWW43iqKFzuKZDtm0U9Vs0akTjiZLC1qop5vXjPXMS8Bc3r0I4itvByunfBMIKlGa
	 iWrWbxtAfBa75ZqZuUb0NUKDBq5JeRLMCux8wobbjdyzW27GToVY7LGHKzfB4lzHHj+CV
	 KOhphfB13kHKKYhv0uefqHY9wK9GRhCInZE9ZibnTSes51DeMfqdPEXliWOCaTooP1QyJ
	 D0X/I3J44id3cmUn8vtkoMIedgbr6sNbmqalAH4QLWir5nKsKT9EXPnlOa3uEroSNgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
	b=Bpfb3U7tUuxKwhC1nIgV97j/TVI4Jmy4lTdKljtJQ1yY5UMekyNNnJthscLCZ822FGxP
	 sc2YDh4adSDxTOAfQnMZ/JRpqICaLrne2RunIEUVn3ICPOSxO3jHV2so2pcHjcbJzkaEY
	 K5sk6czb1JEIiTFrQUYxH9h8NyFv+NarAg2TizHcVA/rD8lqUj9OCgdRfXq93r76drtBY
	 MaJpwKG7x4qeq7sXU8u289hMyfEGp7MdEK2vNzyLeMd/LfgoTF1tLwYcGq2Fj2iJLv4ln
	 J1hSLZ6oUTJvogdzbUabMwN23tZu71UnyLG0MI9rEO4msOUZ4yQVkrcHpHLJbO88ONA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="FNj/m/CL";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F59606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F59606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FNj/m/CL
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c169ae1cb26so152383466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109285; x=1793714085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
        b=FNj/m/CLFG41YA1dV1oyDiEs0X78B+xLCpNSLf3GYotGxARVKAsALvTDkBXqn6A5Pd
         vNa3jpthwBdPOAAWSW/RhaJPq/vcBe5P51B7Q4s3MjqQzNuNDqrKprqJVtIyixocWI9p
         YU3CvJAz1J1mi0zOf8ztISM6Pt58bTx+bZrAllQulIHT0mfe0Yk9xsKMixKdR2n7vnXD
         WnD3BgwWNv/62vp8Q10b49Y2ZTmnaw7mXRFRz0EkYPYtF0zmmPgg+E+Y5xadxp5iqIxM
         lutdtXEU1lM41Hjr2UH8gM54465iCWILx2WIKA2VNiTa+NEFRKC7r18ZE6eoVnGg1sre
         X2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109285; x=1793714085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
        b=HJ6UiByqrtk424Z2ovg2USVYwz1Lbqv5mIfI8wyARLIiyTxiRR1/pFiJGCxQaTkMSJ
         nmUUE1nS66EI0Gy4btdg0BORdt3+9vWGk5kqg0WtPvfXZdLW/RrzF0cYzMwdaZ6xcHp/
         s3XdbAtR9uPbAL0gOHB9r1vkWGvodMnHxUy5QpLtM0Taf5cLDMXF7wBxxzYpdJLLdHGU
         mY+m5fSGFgUFgPSIII1ZQQK6m1nm74jr5iJxVegTSULpFpviXVIvjV6ZVc+fJWVlT2gs
         zt7hRJK5oQOoqgoawV71rJaPgyUpDFvir7pTf9OFqDTzPfSrFLvZTOerceCEpXLvU5Tu
         yJpw==
X-Forwarded-Encrypted: i=1; AKwUvBzfikEJRc8dXKqD+/umpnR9l3AN/Svyd3a/1MFHWu8/xnbkFJKyH89f9IdFY697ipUgGp7M5YjktEBHns4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRkRdp0W43Oz3aAR6gooDatYJv/Z+so5Hzf2LtyF1ueD0QI7/H
	Ur8LHMKJYW9dO1Ob16zNcoXf+AV78QH+yyrY2450HC2Xs8Ko8ZXgM0lA
X-Gm-Gg: AYBFou0e/aKHE6kP0VkjKqZy4VhAsqwMaapLbOqo0dVNSMYEyT7zQJcl4MOt6ZoK3Ud
	ryilHlEz/bKwJLrpvsuMB/AFVFULaa1YjEMNJ587/VsnJZZ8AXsQb8sfgw4QsixOZj8jtrBlcUv
	02bprHb0GaGNiyABO4UVWtBdgiblbvQYLo3OWaBdsVmzLzzOaDGAMyWkiTXKmDXeaP7hFx/bYeC
	xBw+/ex1sMGwGjOAYcLfhpWs6sMQqzVafit6Ehj5wDpscvc6cJqeeHTWjGK3brx3fRObQY0/ffn
	o1/poq/hmuOgqYeh3Lle6O8H/XxOqdAwkKBzyFrqvM8oi6/omxvIvFs7N9Nd5sGB60g+UjTf8sA
	sNgwrgNTuJpyJqevzY9Xlp0bfpcK8yUSJWKoesFgjn4enBa23pHxs0YWchTi3JMjXdXQY2lWBfm
	tE7yyUmQBhyiEA4vm2Qpd3F7ADYoBTUTkRQwfKPytuCdz/1gvKLfxcDbDLJYWwR+Mj7wHMq/7s7
	nSJgUWaICwEF45qvdnS9GZLnVFWg8TB5pnKiVycSDCMOFAmu3f9GxBs48/R/cb64LxXXLhDDoCD
	amVBMcapXj5cfBDz
X-Received: by 2002:a17:906:c111:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c49a735d022mr244123466b.11.1793109284644;
        Tue, 27 Oct 2026 06:54:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm59352a12.19.2026.10.27.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:44 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:54:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
Message-ID: <20261027135443.575faff1@pumpkin>
In-Reply-To: <20261022193853.670625-1-ansuelsmth@gmail.com>
References: <20261022193853.670625-1-ansuelsmth@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 21:38:51 +0200
Christian Marangi <ansuelsmth@gmail.com> wrote:

> When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> stack data is copied and written to REG_SM0D1_REG. Equally on the read
> part, an unnecessary read is done.
> 
> Guard these extra copy/write and read for the page_len to fix leaking
> uninitialized stack memory.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/i2c/busses/i2c-mt7621.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 0a288c998419..9ea5e3f9a763 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -144,7 +144,6 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	u16 addr;
>  	int i, j, ret, len, page_len;
>  	u32 cmd;
> -	u32 data[2];
>  
>  	i2c = i2c_get_adapdata(adap);
>  
> @@ -186,6 +185,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  		/* transfer data */
>  		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
> +			u32 data[2] = { };
> +
>  			page_len = (len >= 8) ? 8 : len;
>  
>  			if (pmsg->flags & I2C_M_RD) {
> @@ -194,7 +195,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  			} else {
>  				memcpy(data, &pmsg->buf[j], page_len);
>  				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
> -				iowrite32(data[1], i2c->base + REG_SM0D1_REG);
> +				if (page_len > 4)
> +					iowrite32(data[1], i2c->base + REG_SM0D1_REG);

1) Why is this using memcpy() rather then just get_unaligned_u32().
   (Yes, short transfers get tricky...)
2) Have you checked whether the hardware requires both registers be
   read/written for correct operation.

David

>  				cmd = SM0CTL1_WRITE;
>  			}
>  
> @@ -204,7 +206,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  			if (pmsg->flags & I2C_M_RD) {
>  				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
> -				data[1] = ioread32(i2c->base + REG_SM0D1_REG);
> +				if (page_len > 4)
> +					data[1] = ioread32(i2c->base + REG_SM0D1_REG);
>  				memcpy(&pmsg->buf[j], data, page_len);
>  			} else {
>  				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {

