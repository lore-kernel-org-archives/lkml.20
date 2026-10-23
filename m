Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745514;
	b=1kCL8VDsqYU3IyUI29O8MA24/Qoq2aOld17QzbkAmjENs5N0bRh22pCY/LuAQFANPy8O
	 s1MAEFAMBX0S//iD9d5AxdaL8VEyar2OfrLo37jJLxfsXhPOMgA2H98yCIlw1dxkb7CCo
	 M6BmCZdFlJF9jsR/tLNxpysAY3rwTbOS5R9LmnLrkYk6EAKsrz9XJaWFJfKydz1pnh2Vq
	 9EZGPwGYxVk89HJZO/oDG9vOcLYH6ZBSKTkRB2vZJqgEJq5JQ0TSYjUXv1Dfsd64SetV3
	 NrS/OYJTjiWLaYnMNAYUFMOjJwSQ7/hGJdxCOvmYrWZ/OxxNkBfoEDYjSmVjZWc6YGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XsQ7jb7KO3Mrp8snOLVCes53wF+hkQPQbyMlf+Nofr8=;
	b=SEYSVA9QThf5fmtA4Vbq9gE536RNfru/qjaY4w91pG3Ie6lNFPnOyZLnV0LtlGOt86c+
	 rtAgKeH62vhIE+UEF+3QWNud6MKtcfbwWWsunwV+ez1ijfqMgzzVOeehCvK1RbUoWe1jb
	 FdeTiE7ptXk4S66OOfZq6u3A57eM8I0IYPJjU3RlrhDCxfTGyY120W18arL0hd9xIgXHR
	 BQbL4Uw0TsPF8eTiJ5JYkiUauTWhj3HkxDlpRIXZi5dQWoFJnNoehYYwQHYNN5rIifmgv
	 dKQwo7LqZpEjgpmBJuCtEOLw/y5Im7XJoLLl2Jtz/iz6pB3H9YZ304DTWLcflW6sJSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OlLf0Bg8;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC9606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OlLf0Bg8
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac01ff101so287590e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792745512; x=1793350312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsQ7jb7KO3Mrp8snOLVCes53wF+hkQPQbyMlf+Nofr8=;
        b=OlLf0Bg8codaTQcw5DcH+h/1/uwGj+Gp1nUwjStmUDhQDUIqGONd2WeFQGkvXClMUW
         j7bHlpOcJqBfCHIqNM40FRxOKlMouS+yza9v51Vv7WrITnDywHcTI9xXeMPt0C85gJMD
         x290lNXjcjVDmopfljxhH9DYat5XDr3jXk5/FWGkfLtNf3k6KoPmbcy8GmVayqlyvFML
         fkngQ4lb05PQHFd15G2kksBYmExgt90FgwA9iUTUclFiRhfVk2e4SfcUnkEv8KAWRXmr
         RlwT+bMTMLEwZM1PSIiO0ecW1+Z2PpKovuPpBF+8bmPE3XUnCUEsQdjTXrZqjIjA+nkE
         lc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792745512; x=1793350312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsQ7jb7KO3Mrp8snOLVCes53wF+hkQPQbyMlf+Nofr8=;
        b=xyoGkm8qdyqspHgznP7vhqKJGc7fBVdDiwi2+Hz8JmgnVxyWllqnXlqurbDv7P2jt3
         pjzNOf1agn8de+Dcm2AAS6vBWTCXNKhjS15U0XO7Yy/ND5DFqvpOWm0gXrGQVBgbDsGe
         2639zdvzSRqrDyV0Zah4bNhu1iQuO70lk+t9Ex0AC6KtyA8tUz29aOjzanltrEYPQMqI
         cl9ZEF8QLG8l2Vmoj0k3i3Hxf62AOLwPHjmJoSdjdqjAsw08u72H7UPzj+o5Ob6wOXRV
         ArvxlBUH3L1AFxQlMb9LTkzOL/inI/mHGcCJX4p1lNQH3h+oxejK0UBkUpZIsIag11Zw
         sxGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ3yVhuda8x19wED9sSDCgrVeqwtx1M//P8teMd751C/2L+L5KjVoiew/0KeSLVyceTmFwGIZx81sT49Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/wzL4I5splMO8sTsBqJpLTjiG6dcRKp3MwwTGvNY2ZdKGMmxc
	5S02ZAt7yf9jhu2+IdXrudLc7Efl+ohOBNodRG9rbDMbYwvfPkmoF9Mx
X-Gm-Gg: AYBFou3Gk+rRFBuwpwh387wyEXI48NqJn3x4jWnJ8melX9RsXa+MEVYPMuRRi0jlljt
	QChepTZ+0C235cC/IA48Awpy3F/GEBUtOpjfeTHtxNwfTIfmyyiNGp5IcYbycOL33BOkif9LEZe
	zHiXnZ3wDCgryKFA0YQfeolNwhJrgcGzFL3aiPpXGlPwD44CmjZoWerrM1bw1zN23wx3BwfSXOZ
	c+LAuMhTVkmoQoRJ+4aHtW2ZhxSKICo6FJD0SD8eQD+rPdd4dk/8tyOSr8iVYClKzlr6krcFxA2
	jICvkI2LCsqz7ppIMp44xNR9nlAxWiaRMGNqQXmMFgujEkJe0V/frO3MlGmNj0bgqNiuw9FlQ5T
	NDYhY7UQdV2dlUy8gCZFrYU7uTA37uE/aKW1T8Q25IM/zgut9jg7ZYYvfsMGfQ9P4SmGIP9+s0P
	tpOFti3je37ZmWukQISiXXdK9FIenrRSK4uw2QPuErKGbnoEo+hqePcwGwzMseF7y7HNODaA7bH
	Rfv7VtCWAFzcxBvB5JBr4F9Xcsu6bNk0zZWJRxlPkWcwRihb2veDQUYVBTiZqudBDSwbwZR+Cyc
	cpLCShlCGeF1Ed0TlIQ0
X-Received: by 2002:a05:6122:3482:b0:5d4:dd7c:b22b with SMTP id 71dfb90a1353d-5ec14a86114mr472271e0c.12.1792745512510;
        Fri, 23 Oct 2026 01:51:52 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f674c5sm1717371e0c.16.2026.10.23.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:51:52 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>,
	linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH] nilfs2: remove two dead '#if 0' blocks
Date: Fri, 23 Oct 2026 05:51:32 -0300
Message-ID: <20261023085132.4874-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKFNMomoPV87KM94eYMHNz9WG9CuAHOWVEgPbsEBUZi55jhHpg@mail.gmail.com>
References: <20261022220637.89697-1-breno3011alves@gmail.com> <CAKFNMomoPV87KM94eYMHNz9WG9CuAHOWVEgPbsEBUZi55jhHpg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ryusuke,

Thank you for the pointer - I should have checked the latest mainline
master and the linux-nilfs list history before sending.  Please consider
the patch dropped.

I will be more careful next time.

Breno
