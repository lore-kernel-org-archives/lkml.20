Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793983815;
	b=atQ0DBXDn3Il5OTcLoHuGCKgGCsFVyE7D1HFXK49AkNfHsE7Oqb6dXHo4oJve1nt+KK9
	 /M/dFJwFaJXetA6u1ogoXmdm0kD79MTRTwSs48qXn3rcH8kDnln1IrgYGps0Ut9Z+kWWd
	 hZr1CVpiVq/biLcGrpWs9Nn2cjcyHczgH1CbeYHIPfTslIewPMnIAgdj3p9my5c2KA9NZ
	 +t7smOWpdL7cUU6z8/wGSHXk5PYR8Z642bFlFWjHAoBhflTKy4t6ISaGnpHtr2xZvSXo+
	 8SYmiixCKf8yUG13TBWucVK4HhUJRBeWiZDKlNkWyyoLCTVb6/qaRJ76tLQq+88egbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
	b=it77xh57X/7B8bDNO1ShOM9nVeWXXYjwQprnST+Qr54+qZFRzHjZEJG8FzSDRIeSu8od
	 H2I431LpXI3nhm25ZBxbDYaqQMmHdfQejsOQYL8Lq6AiKMsjFZl+BEe+A13R0jfs3I3wm
	 WwZHaTKUDGrGJB3Bnu4mUb4zm/IXrihsCVi5EgLcwi0FFldsYDoJ2ab5l1v296ClEzLPR
	 zyLoz0NEiRFS3nbwPi0HDmmJlP4uB5u4lzJayxhLx/67Uz1DATH8+oP7PU/6pFnpQXChX
	 TIG4zXP01xkDt8dz30sbSvKvwDVRnGYgd1IiBL9NNGLrY12/LB/S9W0knh/zBZ7fiHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ft2X5jZ1;
	arc=fail smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D21606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D21606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ft2X5jZ1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so8345285e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793983814; cv=none;
        d=google.com; s=arc-20260327;
        b=kCdP6auoNF72jYIhwRRrOIf1zzyH/KKzGElFrTRGa9iXoXHw5NjMDw1CgcWWTkUvGS
         1TT++otICv1EOx9DYo3mRCtliHQgbxY6/2O70o3WPvdspfFrZqnmsHlITu7+N1SzBBgT
         qpAvqqbaIOA4xW4AhbeB/ovV7Vm6UxfYe6RlwkOlBiNb66ePG6Z3w7XSa/tDZhVlUpjy
         Pjmn4/NQQUemW2oIjL3nwn130t0W6JE7FK6cbKdcdxgnZCP1X1ActL8/polbky5bdVXY
         /9qM7oXx3b3KO7q2iift3Tyhf2pRZrcDAt+PE+MVDLHtNZoImgmFPuD3PvwilR9U9XtI
         6NYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
        fh=q628AkXOWqf6H9JeOKQ+DtoqL8ajX2nuN6ecT1wotqU=;
        b=eNHb9dVDXBw7y5oEPnucyBThzT7kV9erhy4LhfAJ1APNt0RB075KaVsuATdYZGXKBz
         DWc8nw/AVJGy1r82C7dXkxefAsEyIPbGebVaXNb5DBirDbD6O6b7MzYVnAzSLgE5buEU
         EpfUjqWctDkwkrwiBQifLJ8qu/C/chS8QLttJ09OYeFHbcGRQtld/t8bYbbZieBQBaX9
         gJx+lpQhTSN744muZkXWZTTnz7YrjJ9PmGvNKyoalcDxLzv/uBpCmkNjD3Ev2igV2EoQ
         8AEqn8F2r8U/FrcHRzRt/wqrEi0qwfq0SBH0gxCbkpUwk/EzMg6jcTFmsWqgJOSKUZ7h
         z/Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793983814; x=1794588614; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
        b=Ft2X5jZ1lI8h7klghApXq0FuNuF0U5uWbI/EGwdkCLouO9jnchDQHVZIPJLXe/1X+b
         Pdd6ZX4+fa8VCMFkFUbXpMkcSueTAschYyWQZTZLoNiIGHSmqwCpdeg7dSmZVJdQuH2T
         sHqrmWUQdLag0Yzn+Gojg8b33uc/EgfvEALAj1RZZdRY+AlhdJ7lj/v5zQvnxY7QRzJT
         jSVgpif5144onxVEAXUAr+hqylI+rQhJgqGT93QLtGpQsSv/tOeNxW4WO6/w3hfDKR+n
         OwPghxTQ2FVLONUeLvDwordzrhmb6ugCL7Q4RUxZmly8URb5/Q8NgjAdK2lR9kCFyfRN
         Njmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983814; x=1794588614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
        b=pcupoKWhFdzA2+wY2kfeYBHuaKmZ9z7x7FvIZ77ZeOw/+UxXPudx3M7ImXMP/rfivG
         zDz7w4KRgGfaRuIigoBJtirXxaWGXbgtCUwbWf/ZWf6lKx4xJk+lh6/WBBinyopchMZu
         KaYm+6L/9NjhqRa45IzMbLFFCXxWdpDTb0f0B7n1KXIy5RNMGjfVxMQqKbwVMUnxDJam
         kfm6PYbVEIQNtsYCwPEKlt7WKVzz3E6rp/QRIRCk7QGEdhdm3VWrjjQfKLIDzfnbZY8g
         KPtGIlIcLnL7QN+0wfhrTyF59lQLeQKdAfNvz18/kDQBJiiooJ6mBHPyYLN6HEL7n3xd
         KBDw==
X-Forwarded-Encrypted: i=1; AKwUvBzJyyZC6X4aMdElMAY8cnfImF62o7UyuPwXBplWU1OQvJONiwp5HCwcRsfLvkZH/osSh+K0vh7c9vhbhCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FgFd8Bq2DnoTRPcLejcucguoZwsgeD0bVnrHBcm1RqkQB86rs
	9TZ/bocwNA9DZKxw6jeuk+4NMXa52oBLkAPdLBRtFMgmti8yx9SoT8ME71b+sEUkuyeQu28iiAQ
	5l5fet/MFjP8PYtMkLlanlY+F7TXQJbc=
X-Gm-Gg: AYBFou3zhAo2OosbiAPmoZia2FIaEz1ieMJYSXn7y38BeWPHuUI5mvWfe+aLmzkQaPx
	OEt/0rkc4gZMjgeSdhGrQMAHfWCUxwfcsZwhikvVGB/1+Ue5rhe9yAsfgQv+U3+ItVcubZwMO8I
	wKrtowyXjS3Dppqal9iONgy2qnJZeDQtGS5FeozIPmwoyAvwkvY1aE/fpvrzF5moozy/7gAxkh2
	cXmxH30WsJUwp/kUMtnxR7hhBA8BS9Ny8vNeGNlxhThsmENCbaGOAI/qvwLfN2gAOVnPB9DAov2
	UbUkJzczR0Smo7AD+GjzwjxnkJOUHnOs47nyNn+CsAQiotmuD6TuzUzwimks9KZ0jk4mxz5fW0F
	VJTwpW50kg92ucfsdqueNrPbcXCUKZBCYlNnYROEzNMb7DivuZ5Q0yw9Wldg29/UfB9w3QQ==
X-Received: by 2002:a05:600c:608a:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4b6dc6dec3emr54790815e9.4.1793983813665; Fri, 06 Nov 2026
 08:50:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com> <20261105-tle493d-v1-1-3246e91e6394@gmail.com>
 <20261106023612.344f3b86@jic23-hlaptop>
In-Reply-To: <20261106023612.344f3b86@jic23-hlaptop>
From: Viral Patel <viral8854@gmail.com>
Date: Fri, 6 Nov 2026 22:20:02 +0530
X-Gm-Features: AclHuK94pqY4o9kDaIq0ZXjLoVkpvvbtbW1DPpiIVyi1k-5YacPr6LPcR1PnSQ8
Message-ID: <CAFkCdFz6zLMQPiAuDs4U8_6G8us-YoAJAjiT0WzB02=5RfJLoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: magnetometer: add Infineon TLE493D-W2B6
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 02:36:00 +0000, Jonathan Cameron <jic23@kernel.org> wrote:

> That doesn't exclude using a shared device tree binding (as it is a many
> to many relationship between bindings and drivers) and it seems like
> nothing stops you combining this with the tle493d-a1b6 binding.

Makes sense, I'll add the compatible to infineon,tlv493d-a1b6.yaml in
v2 and Cc Dixit.

Thanks,
Viral
