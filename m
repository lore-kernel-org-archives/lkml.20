Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB6D412269
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766292; cv=none; b=e3SgthxaN2Ow8OBYNBCVe6HEDrXKF7LgLAWRYA8eGOQtIzMMBj9Sp5Tvef3O+ynVMQ9FRMIrwtM3yATA0e2P/ol+sToaXZUMHLadIxAwckl9OCsiH6kNaTrS4w3zepvTRZDBJXB/2leSKb4zA0G8unnpl7vfg1M4mN1sJshEPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766292; c=relaxed/simple;
	bh=XfnvZ+tGyvOEX04e8DPs3Qx6yRkrqyInvUwTUbYGHgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ap6nnvwbLvAaQw4yR5HMKtMNl8vgtl/OS/OmmgrUyoJNJ+fz1V5xWuajMZMJMeIOp8KvCH+QkXUmt6TStM8TPxShjQFVPHyM1M5JXODNpR8mMHmMaWhecd9Q5R/WNbC5GAmI1zU6vplZPrh2Hi7EFcLQ10rLpGcCXhgKjZ8fasI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMoYMvNe; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMoYMvNe"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a482cbbf35so3427491fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788766286; x=1789371086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEX1aCK9nP42qtFnudljLMoJtVeAMHoRCznJunAcW28=;
        b=UMoYMvNe/POuG0HOXyp2T6Z3jfsus6mPHI1rteuPKjd0EeYbxML4eT+MSZpucxXwo6
         SxEntXokxlPeMVA9HY7Q1bP70OdNfkmqMhI4vPY4LrhvYIZQLcmoPlm4hG3C1N7JP+fx
         hH/55Q/dKWk7E2PgKzOw8S5vefHegBYe0uMfnW8SxOGv8jZBY+0KyhCWjhhqApA04R1I
         OAgmgHzoFhhuqLqTsT53ZyCLxrFxNIxzr6wH+xdQTKa1OJbukNMKwEy52e2izQpxBDaL
         +KWr2utLyghN5O/rcTyf0oeOBXyadHkvrKIYZFH1GuCsnlFn5tNTa9w/eQbCtN3y0xS4
         jCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766286; x=1789371086;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEX1aCK9nP42qtFnudljLMoJtVeAMHoRCznJunAcW28=;
        b=RQ5gwaloesONZwBCdrhz1fWRLTB7Xd5EY2wKXrMACJH0PKzIPq7tYYOo7oKXTuy9Qu
         B150uVOSGARDZbPf2ji7Yvk1EgTaWS26pLHFnI9M1ABwDXE0VABOXm213h27g2YFe1Ox
         wKWj/YPiuvaWg1l6SMEzY64AM/kVuqpykfynrtml+9OXlluXnySS6Z/vWNWN0kqeb/46
         2UTP9/U5wyX+bFtuCV2vQZAUyYvjWqhue/ihWPIs9eM78wLBTyll233JGQYddA8EfP+N
         q2A6+6rWd+2kL7DDL8qVpRZ/I9HzX8NIqFby/s8LudSvfo5BpLyTxR/PRaM6T3poGNG1
         YYfw==
X-Forwarded-Encrypted: i=1; AKwUvBxN63/XBpDq8HX6E6k8JWvv96kxxx2YGHUGzwt6g0ZDgLVpqnbUhtX3zxPeMoumRhWaBHfSL7IMkbxy1Bk=@vger.kernel.org
X-Gm-Message-State: AFuF++kLqPYKe5JKX1g/ezrba/hOk+/MdPCCVneV5ecHwHf5UKk0Jl5r
	kN2fXpZZr8fQCkeCmCtHWy+beTHzrHDHyT8Gy3GRuKYY3uBOtjVkO3g3
X-Gm-Gg: AYBFou3Ga/RGJkmZG8P1GjSFjn8cL+05EWtNfmU+xc9ZwdAZOnEVbPF89cAcA4vuc8r
	b9j4YXjIERTqAiWrA+GUyGneK6BQDIZOSMT8PDHs9o3kAQ3hBMGQbNIddWTE0Go80frnukDg9xU
	qRKpvO1k8rnJvXzBZLszHWMg+HsxC5JLjsTK9aMth05csCHC4p0n00b8LkxLJVBplFDdu0sbYTj
	kz+5RKq0WX1ZvZgwqeIge5TDb76FyehJm0Yjp1Mz3glApyT0IWVqnec3bp+yHXVmMgnt5mmdJbq
	Y1frW8CuhUwoDqCCOfevvg4nQESncJPNiVDKLKt0uP3DZqTaltgkEWJPZxfs/Gs/ksn6u4HDl9B
	fZiKwXApHSjhzg9wRfoss9q96QVntQ0NBdXJ7Flhoykg5FJtUfi7t55rohSLGceR9bQkcBp2zs1
	1rRi+ldoygk80buciJFs/7EDwbMOLnv6B2c2ePNaKir4Ff9bRzva/opdPkNKU=
X-Received: by 2002:a05:651c:3049:b0:3a3:a3:3560 with SMTP id 38308e7fff4ca-3a371b2e558mr23880441fa.6.1788766286141;
        Mon, 07 Sep 2026 00:31:26 -0700 (PDT)
Received: from archlinux ([94.229.17.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37059aa61sm27035991fa.27.2026.09.07.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:31:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:31:22 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Gabriel Windlin <gawindlin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unneeded else after return in
 enqueue_reorder_recvframe()
Message-ID: <ap5oSuo4v9ZZaHeY@archlinux>
References: <20260906233552.971860-1-gawindlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906233552.971860-1-gawindlin@gmail.com>

On Mon, Sep 07, 2026 at 01:35:43AM +0200, Gabriel Windlin wrote:
> In enqueue_reorder_recvframe(), checkpatch warns that 'else is not
> generally useful after a break or return'. The duplicate packet check
> returns false, making the following else on break redundant.
> 
> Simplify the loop control flow by using continue when advancing the
> list and eliminating the unneeded else statement.
> 
> Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 7568fc514d7c..498c7273f273 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1782,14 +1782,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  		pnextrframe = (union recv_frame *)plist;
>  		pnextattrib = &pnextrframe->u.hdr.attrib;
>  
> -		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
> +		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
>  			plist = get_next(plist);
> -		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
> -			/* Duplicate entry is found!! Do not insert current entry. */
> -			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> +			continue;
> +		}
> +
> +		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
>  			return false;
> -		else
> -			break;
> +
> +		break;
>  	}

Hi,

there is already a similar patch in the lore:
https://lore.kernel.org/linux-staging/20260820162601.74952-1-myeonghyeon.park@gmail.com/T/
