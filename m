Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815842;
	b=3b11PTerREcojR2QmN8ulGr3wl32Wy8ARuGq26L+Gp2reAImxa87noByaMiIpxMcpODl
	 MvFVVX9TiPHbh0ELDT1GLTP4qaNUqC/xS1fqNuiPLYQTOF0WQQctogg/16PYTaf1SWRu4
	 lo83bzXR7AckPh8vJ+Z40f4nUjdKRL/8hsG2ptWK4ygRne2liWqz69Mur2vuT/ArMyVoF
	 zLeM8o+pdRmpOjJETrBiC/A8Ydy41PycJyW9myAT95mSOASzN8J4RBn/cHHFFB1WftfuI
	 gLKHHxZklU1OMu/9kkqS7FVTz5R4VFZSNJ81c7ill3DK3hWrnaBlVtZkOqy6d+frt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815842;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
	b=Yv3T9SiM9ot8o8sHc04FXOJI7y3Iq6NxI6GarpfSwy5q2JpjLBvVJQaKOyoFeuvIsRuC
	 3jCUJpVX4ZLQ9JoJCot9cxVuFTpWBFvbckYwavaXxyIwditEQGatp83gv3GVYxDkHJVz7
	 NpNfko6FW8CcSi6SwQmo5f0zL94xB4uZuA2kerJ+9TqM/n7f5RX8GruxGZNTWHZskJuaO
	 kGBZkFEmaSV/5GAeuNP0wmd+orzpCjn5zS/+L/uo+mKGonUnj+CZaWYXbqpfKJuevGrXQ
	 l6Rv6VjZSN6cSutTCFnGdKdY2OmrDv5Co7QtWAS2YfoiinFWr6hAaOXIke4n9p9zawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FhbHR61o;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R2vxTLqJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B43606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B43606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FhbHR61o;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R2vxTLqJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794815841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
	b=FhbHR61oTxtSbNozpVannwS2N5h3qS2/InHwJObHvBI29pxBWsNJqI58hD3EQp9PD0Q/ni
	B+lTocW1G5YBaH1GlLdSJ9RgKd4OtJoOPHrcpYr5i1oyOl+W1Z6OdMRPLR3LY/WDEm2Jgo
	I9E+1oN8wXpe++7l0P0CRPI734u1DKw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-x9kQDtQOMoKwurv3z18oOQ-1; Mon, 16 Nov 2026 02:57:19 -0500
X-MC-Unique: x9kQDtQOMoKwurv3z18oOQ-1
X-Mimecast-MFC-AGG-ID: x9kQDtQOMoKwurv3z18oOQ_1794815838
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b565e7a09aso2408984a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794815838; x=1795420638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
        b=R2vxTLqJyU8Ii30yKLRSYtiu2rz7MA/8Sn+zbq+3WLJsqmWjQiV9/qne3/viqeUpne
         UYKtGfk2+4DOmLPt2ipCB95uBkDYcrjNxo/kaiLG+rojc5o0UyJiRZqy7ltinbYVToYb
         ewpjf45xJxQGsGgqx/9jDkpfsSZylFNbfLCMnb7ytOW/Vuma9rXxO2heJuOUO7XuCkH8
         bHpmbtgytkKcVWkKkbnoXij0TAoxKN1v57G0I63xfrpeALpeD3HvJxIfMQxsrUO0g6Yt
         a8eA25ZgumdP3ez0WYMEF20afYuQN1k+yMUXi8iGOeNwhSYgaBooLHh4yO1gYkAD+5ih
         N7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815838; x=1795420638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLFt/FgQNeCvm9WtIbsmMxk/nmBpxXZrRONyGG570tE=;
        b=w1fQsXSgqi/LSiXePIrARd+KXEML5JSHrr95FmJaWB9hRy/PHoXo3khR7wlMrAzGJF
         vjK2PtqWof66ZCRmpYj8ImTzJKRFnyU/aTTy9D+qOqohFX3PlQzCZhKP2Omq6Wy+vutC
         WnMVFvJSCn0SjheRJBWJrbNil5C6m+Sc18XKIQwu0FTy0eoLROp9yPPn5Xs1bO2Tf7xQ
         ieDzRywNp2Udy1v+HbhvYc2IcrWly/l1OjwH7rtR5QoROH8AdXy4n+8SQVKNTEM4dku/
         RFbUTD4V0E0lqc3Y/zjDzWu0wMam8CmAxYvwbG14w1wfhmYeSYobtlX42K9kku6tXCZF
         FkWw==
X-Forwarded-Encrypted: i=1; AL+hErFavpz2QIBBVFgWyw6/0n/OsW+NG0WOV4eobuH++g8dLyf3Kak+z4llpww6Su/Aemfqd06AkWZZy0SO6N4=@vger.kernel.org
X-Gm-Message-State: APuU4Z95/PMyoaba0zfO3fOHO0RIbQFzjXNsnQy41ycpxSIJD+XLrSJU
	6X/VkbIMNVOSeral+8s/kYZ/O40tokxigOt8SqS/cGMd+LtBzmFKW98Bod5l43gVyYBvpyLhvje
	vNQ+4cgOTjyGOpoxyfToycwRH6KyeaWfmsabELQScvkEmoVO0NLdHagUsDkIVoXL0Ow==
X-Gm-Gg: AYBFou3Er4Q2lyNIc1rsJGp8YevbHjn+igF4patvuwWzvywMw7K3AKK+bbQw3gEpjzH
	tF9aoKKkjIsn8Kpwy3IA+JZ3NVu/fjrW2sCg1bIPSmxSrMLA7JCy29kc+gWoEr4CST+elxyTUrF
	aikyNfl8LPhnUDi33YJ5aoUtKNcv3YhOluSOaiXlkSTQsyHlb4ldeiBh7rnoO60Z10FTCusnaqd
	3T9D1Qi1bO3JVXkzW9gc6Vg6gctgA+FgUZ3llKBVycQV4ssV1373vlgHNXEEnwUWhVkZFCYsJAj
	LeI/E/iIi10pTUR1L2Yre7cVjFL0HiOVgJXWjFUdOFXEi69xs/gqggNl0RG89UlChI9xzZ615Iy
	hAB7WO23EXjZMuwiaQNJ1/+cZqDp0zmhAWSCW09f+jryGmkToCfiz7cFHWLgH3H23tmyImFR3ZW
	84oDZb5zLz+QKprLGeqaroLKqEqcnZViPBnvCcrNsErG1T9khllhy0J6a6IYULHDri/ZUGaZzxL
	wzyfHyrLGEJrFhs9EGjCUv0ZBLuS23HOxl/CoWr+tPm6ZiASq9p
X-Received: by 2002:a05:6402:1cc1:b0:6af:80c4:8981 with SMTP id 4fb4d7f45d1cf-6b7c0c5bbbemr7579328a12.26.1794815838119;
        Sun, 15 Nov 2026 23:57:18 -0800 (PST)
X-Received: by 2002:a05:6402:1cc1:b0:6af:80c4:8981 with SMTP id 4fb4d7f45d1cf-6b7c0c5bbbemr7579318a12.26.1794815837710;
        Sun, 15 Nov 2026 23:57:17 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236110bsm4461425a12.7.2026.11.15.23.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:57:17 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: netdev-bot+sinfo@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next 0/4] net: streamline skb_splice_from_iter()
Date: Mon, 16 Nov 2026 07:57:16 +0000
Message-Id: <179481582370.4133712.12198402768754157869.netdev-splice-background@redhat.com>
In-Reply-To: <179430999926.488859.4270273148397539600@kernel.org>
References: <20261110112325.3263078-1-amarkuze@redhat.com> <179430999926.488859.4270273148397539600@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

The issues in patch 1 were found during development and testing of
opaque TCP payload objects [1], not from a production report.

Both were reproduced in added in-kernel helper tests using the generic
extraction path:

- With a nonempty iterator, maxsize == 0 returned -EIO instead of 0.
- Deliberately supplying slab-backed memory caused sendpage_ok() to
  reject the page, but the iterator remained advanced over unappended
  bytes, both with and without an accepted prefix.

[1] https://lore.kernel.org/io-uring/20261110132006.3280986-1-amarkuze@redhat.com/

Thanks,
Alex

