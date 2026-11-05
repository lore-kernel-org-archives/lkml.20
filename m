Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885723;
	b=uJXfot70TgKXLE4CAXtmV4ePNG9obY+5hhgZbkphhoVSHptMiK0cWR0K8GcKdIx8saYn
	 4igmNhgOuKDbnaxCYliYUijOEZhHzfWUI/lHJIItXOz4yewB8b+eHu6NtBLhpDd9Jrj4k
	 p3VUQqSmljvX96hlblVfQkx4TWpA43E0AfKhcwrFqNGifo/VEkOrNPpfUhP/UEzkz2O/e
	 cgYdd/Hvu9DctpV1cb7GqKeNWy4JlVHmpiWWQY2x10EpZ1uYFmne3wp8uc3AiTXjphH0W
	 DfmnTQyjBkW+yFZjKiT/SL9La0Q9BYb6D/E4tfnsDzzkmOHfSQmzGLXGskxNUx8ZV1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
	b=eGrwjSbwFYiMZdAt86xv+0+wptFdXUMqB7wPgWFMA9BMWa9FIerU7lFgJdvk2pf364Qh
	 YWFBpyID96doMc6B27+6P6EYM6sKhT3ViP3GTI/6rAy59boGcP96QYGmUpj08vT/Yqxpe
	 9rFfHks5I4GgRfYX55DPkVltedn3gt730hB2h99QOeB2U1ObIsAPt03AyhpkEoUuZTFI6
	 91/L679x2LvPlEi3WkEjqLnq0kjbnHLPV7XR91yf6uj68vtOXaQBnS7Sq+b+xd7HYiYel
	 00CV4N86hauZvXPMy8mB2/9QkQBOPVQdyICNTbp4LGHzESOaN6ZhGRFctKyxdRDSGtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Lw8/kRVp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B3606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385B3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lw8/kRVp
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1077407e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:35:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793885721; cv=none;
        d=google.com; s=arc-20260327;
        b=nNdIOOnm8nrVJPu3u3YQ38vsECjVrp35C4dYD2wrB8TTbNCZ0YpBRmmqRAZTq6ZlPH
         wX3UuaBfEt+NKRjfYwzWedALHL1xbwnd4ezQq45b/SDjaY3gGqfDJmm7BqtDMkAn8B3O
         +zWZ7wsx7DIh8hC+NlqJs9i1wOl9R3+CyoSFYSCSnFlT2UTsHZet9C9xyVLjeNINs8zR
         vwxqsI6RaCycpuzDbCGXYSdcNRaQ5cgS5Fr8+7mzWWRQp+fphwSZA/WObRxhvpAWWePX
         XFkm/iXaD4F3NLuBhxbRzpLWo6aBRf6qlQfsUwrhzffbLknpoeWL7x9pQ9c0Gsd8uChc
         lOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        fh=XfOYEpm94HU6chcx+haqlhYFOMoBXg1A4AqDiFu6ECY=;
        b=gMHtotbMQ0VsP4fFl4dUYd94QuFu6kyjdCKAhEVU+AOJIs9buav9ueBBInGcCefDT6
         7YE+jTSvf2EYn4I0yWhi0PNCUe06WKDqE06Su9KivOa2rxuPr3yjLiEjsFrDsRCIxJAL
         e1LF+xG/0GNkfQOsEBgVEc1a70OheBF1UdjFv/kW4FbDPkYKO4UNC5cASI7WGkM+4IJ/
         66+eJy+1GKfouExJr/u4HcROcfWWdgGxkTZ1bhmPYsXE0td7/v0UAPxdeNMQHR1V117S
         5vMAndxbJ30PEpxGZwh/VW2Rk4ucR90YubMYEKYy9s6BwfWL7aJsA5mI2nrzmd0l+PJd
         fJbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793885721; x=1794490521; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        b=Lw8/kRVpv6LXuYIoaEpebahFoBr5aZQ9ihCcac9DQvQxhHJG5f1yXVdZ8NBn4iE63/
         My3JqwAGB4UIFXOtrNZsKgOeA8JZ/rdoi76sgNCs2PLA54x9NlEkUmAVpD6f1vyTclJc
         S7D//LCPa3lVO2Uwhj5G/hcL84G/9pYKF4FKGgBrdeaXQ9UnLHRSRlP66dOGALU3sqzm
         mqPb5VryuESGKF4Euwln6+MbFDyMMyW52Nhx1nT3YFbNboOekkWInjSmUKb18OZ7mHMj
         4WULOQsGIykLB+7IJQVJmMStu5vP61LTGVsjm2S533e0uxSeTSrepdB5szUtmb+Kianw
         LlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885721; x=1794490521;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        b=J8jI6FNcE8F5NTCHocjwBBCFPuQJ4zy4IcGVNzW2/oeLpVGGqsMpgusK+pAUUplxyI
         9qyQofQnKjXyeQo3SBmqkIaZujbClrqa+kW00TVALO5w3EzdJ2MMgd7EGV8cm7HbRKsE
         a2Pzz4bVhy9ZCwM30eAmJz+iB4MzS3JDyXeWxWiitTk0xaTrTGx4QBzGgfPsR//CLTBX
         yF7R0JyEjAtZHyc8kEI+xJN7JhBmTXLGV8rJDpnVFaHP/SKx6x9+1VJYQSkDVcuhcMwY
         /iQrWLu8x+j8WUAfsXMu3H/w780+A/5AFvvp6qCxd/KYndYg9maCuAvlpJWIgA0HorH0
         i1nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaHP+6pD8YacQIYxlr9lDuuQfU7r9pj2rzqzHNmsHaJk5pFZTEKoiVLc+a8mDf/3YhItPWpX55GZGxnuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rbtLsTbU8D+fGVI+SQyNFG5xx7OehEDeV0pkIoIQWXUp42d1h
	9m3OziO79mndLfljZKVPATb3utYs8vLBLNmoa7jjO0UelKCEIL9aEZCpfu/YOcZuxmZR1/X5S94
	S4ox0/pWOHtlhihE9aR7HpYSUmojscJM=
X-Gm-Gg: AYBFou3ZMWHKbS8fmoZ6wxe7ANQOVO8MD9HLnSGJhikSpPOi2MQpAZn4tp/wCsnPlQZ
	Ae7QhLn01DSuclyKVK7ah7avgYu76A2iVI1QbWkFv9ip0UtolwDoj+uM7f4xowx4fIStIMuZAvj
	FOxGcGLp0MM3YyJHE1UdUEOPVap/fwvGzbutY4/KRC5nciIDOWCI+nR4rtfRFQIvvaebcGafLVY
	xa9DgcUut3QQSvn3IbLvXWaGM+O0+fdLR7XCuZwyqRWm382lfbKFflnYv4DaYqJ91l+ZwkJ5SCx
	9X9K8idnxFvZ1pq1KOKhA6JLrDovQgO0NmlS0H88AfKo4iDqop6r/Bwbns6HbIiMB/cfp8Doy3h
	IiM7fFfuael14w81xyg1X2HrAAY425J08KMKC
X-Received: by 2002:a05:6512:39c1:b0:5bf:d2ec:904d with SMTP id
 2adb3069b0e04-5bfd9563095mr6994195e87.14.1793885721088; Thu, 05 Nov 2026
 05:35:21 -0800 (PST)
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 05:35:20 -0800
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 05:35:20 -0800
From: Steve Meek <stevemeek82@gmail.com>
In-Reply-To: <20261013-rm500q-db-burst-v1-1-bb850d54e2c4@gmail.com>
References: <20261013-rm500q-db-burst-v1-1-bb850d54e2c4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 05:35:20 -0800
X-Gm-Features: AclHuK_uyRr2JFV4uyjiNutcKI3LwrFFfmjL5VbrHIy6nDY9T6nQp1olD23DFVo
Message-ID: <CAPzME4ZmwuXDRAoYDqi7et2q=f1QU69g8ZUrocS3rZn9ajy6+Q@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Disable doorbell burst mode
 for Quectel RM500Q-AE
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

Gentle ping on this one. Happy to resend or rework it if you'd prefer a
different approach, or to send the traces from the stall if a core fix
would be better.

Thanks,
Steve
