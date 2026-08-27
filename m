Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FE3DC4D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821693; cv=none; b=pKdjHJXuXV0C4e0cxwI6PPKkW3PzHknhwQlTrX0xvfTjkOnyZqzbRTG5yFsnTVTiL5l4fr81h0ixq3l99m3LfrzE/vayRCpq01qDyd0rV0GrrLqDsf/FgHjvS3HzDDpJ6QbMpuvw45oZzw9ZggwU6GnjghUmmXzR+xWO9n9TlCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821693; c=relaxed/simple;
	bh=Wn97tQUxuyvvv1tJFmLHl464HCpS2Xix17TyRvVpILE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlwmoSb28OLNTM5tkEyTA/YdKlR2yEOQ3K+/zmiAn7DEeuoX5AWtYoN4aUY4C4Ls5nQvKkLgYf1Mc8qlMRCKxOd36W7Y8los1oCcZGFvZVICWT6hSHltBMnhRSz3BjXtO75EjBIFxrH2uJtGS9oO02y0KmTJmdD8PpROiE7Kyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeUHKjyF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeUHKjyF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so18164355e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821688; x=1788426488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c47rpv9RyurGDhGGYkGZTDAHfRgUQeclm5jfaqZLKqk=;
        b=IeUHKjyFCuNNDOO3Tzn4JGoPiX4Guq7rXFcnBRwQXZEdKzlDMuHmBvzuS4g/CQ7giW
         vf0CgJGD+OEdR2NgCj08EHQ0X65hnRufL6GIfF2JIedAUwnRTvs0RDvCqcblGm+VGgDl
         5pSH/VOc1lmEpymx+55ePB6WytuyAFH3h4v4xAOBU9sMg6R03X+ruHjslzFsyvuom8Wa
         fC3T6XDVucjQPBeFEby4lJxn0V+8idcbbDmR2I/tFs7EdWeMk3/F7lUR3CHvGBd4S04r
         8QcCS3cW5jn3AD0At1wBN78zf5pLvj0p3nefCrN+LMcf7YOwl2FnaCG3oPEHbHLxzM5y
         voDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821688; x=1788426488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c47rpv9RyurGDhGGYkGZTDAHfRgUQeclm5jfaqZLKqk=;
        b=mKHx4mwGi49ERP1m8JPLEyLtl1qsinPww85l/hH/raTWRd9IMyp/Bg2d6QZazPfZ2a
         ecXB5ueJpWdS5jEoXs4GAm2gEEhRXX4HtX/zOiHrGtymndXHUzD9NaB3z9Xg9corIVxS
         bDiEXF7BoI1ATL6fXenx2FOPsbVt/32OTEv4DYoYSsQ+nXvlXxsxftFKLhyR7q5PZRtn
         FmLD0gFJJ8uaHh9dVyRu8GmtxtRrFXuekQatUwVQZyWNYY+LWLP+BZLlO7de3wsqviRE
         QI5au2vAyAagVOFlI8ww3u14BC+/i039AyF1tZb2/vxJZi1H9xIBkE/UZbZXlJSBbPcD
         qfOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+qyNHRy0rcdfWkV9gYg3rN1KnDt54KdKxWY4c5PTix3W5D++Hsx8ykIiAB4PnAiKtVQZNYrxRn94zH58=@vger.kernel.org
X-Gm-Message-State: AFuF++lA8rR/OOupmv73fgNydtc3wQ5IXMLc/3UPKRzOR/IoxbF3H+bg
	peELnKgMDiKa6gu731JuMmDXGpExSTUnxcusg5CHfZxocvZZ2OxpDwzf
X-Gm-Gg: AR+sD11ljCFWaJEixHtT+m3s6vWwhMV2ropPU8WJCOTlrovJsmBeai9xo33zcSF2GaP
	6qnlcKqh/wdKsHxAZ9bRyXHlAjVrMI4OaZ/VnT4QNW7imEBvrhtrxJjsuwc+slecC4+NoglNx4+
	HTbR10GvTSOBKa1fzP9VCtcesrXc+W3dhG/44mAu/GFfu2foQcQvkJBFtu4w/0qrlohpugG5rDB
	XL8nkqzlsdaZSu+3pfQD688exbWUaGSxMNq+oHhzGx9WyUizd7G8qb39xJH/p9d8uRvgmX8VAvO
	0sVViZ4fbSsHJ3EXjrsr09fmZCq8SZaOvq+/wYTpfqBHrvjse4ckHc58pp3dRAOX+slrAVKZgq5
	3EAwXJN6cA/JU/zGGwkG4VmoJbkbQ0InytV5PnOWOecm0TX2XLKqpQLjcmqnzWG5TcCn0qVTl0I
	r6YrYGDb8Fao8jnZxs7qk6mUI7740UyBUKnwW9mbaNzF3Nvg4ZK4cnlQcQIVU/6sY5LjI=
X-Received: by 2002:a05:600c:45c4:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499dc8230e3mr148761345e9.12.1787821688010;
        Thu, 27 Aug 2026 02:08:08 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm53937925e9.1.2026.08.27.02.08.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 27 Aug 2026 02:08:07 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:08:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
 dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827110803.49790ae3.michal.pecio@gmail.com>
In-Reply-To: <20260827110006.66b07ea4.michal.pecio@gmail.com>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<2026082307-negligent-lusty-750a@gregkh>
	<20260827110006.66b07ea4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 11:00:06 +0200, Michal Pecio wrote:
> And something is also wrong with those timeouts, because 20 times 5s
> should still be less than 143 s. I asked Syzbot to try 500ms instead,
> which ended up being over 3s in practice:
> 
> [  566.662036][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  569.717341][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  572.777761][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  575.845365][ T6636] usb 4-1: sisusb_send_bulk_msg()
> 
> Same on my system, but patch below reduces the timeout to 500ms.
> 
> I have no idea what's happening here. Looks like a bug?
> Is it known that jiffies are totally unreliable like that?

Sorry for the noise, timeouts are 500ms as inteneded but the function
tries 6 times, which makes it 3 seconds.
