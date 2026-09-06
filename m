Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827E33B6DA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714568; cv=none; b=KJ10ZsOeGoVQ+RV4X7jr0aiXd07VMWyuhrMXvLDhfTvLrhTMLvCttBszYm6gar8aTuvYbMBNIl2YxL+dHrYukz2qOT7+Q1UNX7iVdZPAP2LcTHQPlBmjAPiD+zkZVEDYA5BTsma1xo5eAqiklQMGpNCtwIdJJucR4yV6qFDLp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714568; c=relaxed/simple;
	bh=kwIQkP/XpcdYd1ifwR6RBvVzjzYlUAzVO3Rm/HIniyU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kEwFJ1o1gVHoXSNxGCT2vK+kYVbj5zMfLF6u2Ktp3vkhNGK+kFBk2vNTtffgk41feJqOWzUL7sk3DqEUxwishSVVZu54c6McFYv0n1fhVoklN/iKzReuEseGP2+MF2oKHozHMT3sxANtQB6JK/lwSiPnc4fyVZlVEfmsIhnmMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p41F30/P; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p41F30/P"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c7127a73dso3442961d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714566; x=1789319366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OLktiA9uI3wr8iX7SREQBfG7Q19A9rLrew3z0lZbG8g=;
        b=p41F30/P050BVtjH1FtfGSTlCccqJkG6sbioflyM87QBfFRMeNJA0ZhsYOsNUuSdgt
         L4n1CU1LG43bDA6Zs2tX6GCQp4zzSNBkxvwRdw8v2km84xlIfpM5+QlzhzS7badOr7Mj
         pqv1Dvcu4G9luMUnPXflUtz27WFZqU8E6r7rvxx+ARBCrt7bPIV+ZHN3OQo1PaKnPOJS
         dMeUdG1TSBfdSsO6zHq6cySzYTJokfcXPM2K8FzpYFEZ/mWmgACDTyQ/RlZiKS/Wogzt
         +cktIfs2neGH4CHQmo78dceRzdpStYZpF9ALHbWemVabI4ys0sfwUqMN+TK1KGA8yN/S
         UGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714566; x=1789319366;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLktiA9uI3wr8iX7SREQBfG7Q19A9rLrew3z0lZbG8g=;
        b=qJuYpEKb+hs5LXA4bbRot2v0V93UvzDolJQreALrNGnSA4n2ibLAp/DWPt9OmTXxk/
         pNE2UblYgxczBmrVSUgNau40Fr45hu5duoMEK8pLQXC5I5LdAMdNWtbr4wyUN8keKnOE
         HE6CBOxZ0LI0P/b3oT173ZFjY/OwGrcxgb1ButCwp4YsULBIgq+ZGbEL2ePSsez0MPz8
         52ZmgcHNXkZKDDWdRPzSabLbNT1JMigFHLDJcbWnm4kmeKKl2RrmlAzHxAZD5B8d2Rik
         pliiv1gAKW1jbyeqHyQBKSWjzac6l4b/aNYWDvZinAq5kUDIEQjtu0NEma8qHTxpWZ6Z
         WZNA==
X-Forwarded-Encrypted: i=1; AKwUvBwkz3yMkeunuhSgrhVV+/zYAmCzfYwYqDEX9RYRI3fHrGC/Li9CFqSgSliLXz8iexX9/5jzvqD4OhbfhuM=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ4LlCzKqhDJ9KX9k04rhZUlVtZWvzYokAaz6vvsGCS3Kb3don
	cwSP/E+K63GQEcdAFUGl62YXxK6ZhX3+9I7OeqllUeqdSJRnknlQb//K
X-Gm-Gg: AYBFou10Tlx+VbzEeZKi9+K3VXt9tL2+QerrC6wjukE3JEexhgOQsnK1TNfXM1i1yJ/
	moSiZND9l/fkmQ4j2sgAu2YTpZOG5XC9HdujUsgDhxSlHpuXFXOj/cX+Ursrsx4Z+ovJI49DWtk
	LOK8bZvl3i5uj37lHXEh7qF9skC3gLqSav4v1e1pFR9g6dgzYoiBdRriykYBDWcJkmdXHT+CNf0
	NcdplyI3RzaSojENWdRl2vKnfiZCwKvqJulguKYrJE4CdDpV0zpD9QgGcHPMzfHuT+yYyrEq6Az
	SxPwKFNBwao6rMqkKSNOXBlDZfqu9WejoiPjkXF6UMTmTisuITy1a1ww/5yfK0jD140l7I5sbqF
	rdZ/YCsFMWsIfeZ3sWJm2WeUAH+U0Q9ixd6OLrM7AI6WOfBHkFBUhbqjVY61zv8b907L2uJvIzN
	zLfolrxd1G5zLnZGoO2CcqcEk9abAXWsDmEKG6AKCBMLV3CeYOoZbhuvSKJwJBBS4KcRz7qNdVL
	g6sjlNqMEynMKUIHTYlSvsnvxTzXMULF0jMkM3H5A==
X-Received: by 2002:a05:690c:c4f9:b0:874:f21c:2a0d with SMTP id 00721157ae682-874f21c35c3mr20020327b3.69.1788714566358;
        Sun, 06 Sep 2026 10:09:26 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871439c4566sm58475247b3.4.2026.09.06.10.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:09:25 -0700 (PDT)
Date: Sun, 06 Sep 2026 13:09:25 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1a11ed358eca@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-3-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
 <20260903-psp-prep-v1-3-d47e9c4c375d@gmail.com>
Subject: Re: [PATCH net-next 3/4] psp: allow drivers to omit tx key add/del
 ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Drivers that don't use an SADB for tx key storage don't have a use
> for psp_dev_ops::tx_key_add and psp_dev_ops::tx_key_del.
> 
> Allowing drivers to leave these as NULL gives PSP core a simple way to
> determine whether a driver utilizes an SADB, which in turn could
> affect how PSP core chooses to handle certain situations.
> 
> For example:
> - deciding if tx key deletion needs to be delayed during a rekeying
>   event to avoid in-flight packets using old key handles.
> - choosing whether or not to report device stats like SADB usage to
>   userspace, which only make sense if the driver uses on-device key
>   storage.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
