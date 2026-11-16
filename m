Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813845;
	b=03LUqT/tfQ4EfeCEonZ9ay3t7uIFEjMIozWvtsKIkSLS/YMXixOA7/EgcbGefj8ZBbKC
	 urN5McERB+WjMjbI45EH3kp/6EqYBeFdwp7Bm6yb4UwXpU6gxrMl72k7dGYY9f5BWLCXi
	 cgeyS7orhhE18w6bSi0Dfz3/Cay6p3isQGigDeiYU3as6seTd2K0//mnquRuqLbBIjlbH
	 v15WWN3vkQ604zfspTeeT57Ja9YccP6DawIzn+H89r8WNHtdHZNflZo4NkUvKsPW6he4A
	 1OvKJl1MLBPB06N5sWchatkZcuiilv+zyoelOHgNPLqRVNBbhU43M6jEWXOI0ks9s/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZnkZ1InoVqbMzJo0ykriEGYJYWNq2vEyk285i6Z8tWE=;
	b=Mn99xCxg29iujVBfs6eIIbbV0ih397Ylfm9iu7r24df/8I/k3AGCC31tY8qUfGTyAPpK
	 FbgvxKnYmin4XLJ6O8mVCiGM3Rb8iWPoyZVm4q6+KQXSvIh5dVTsG592FYjA/JGGFqRpC
	 YSSDRuwd5dTOVLMzG6JuA7Jn34yAJNBI8mO08KJXG1mV9TZoMbwvYRt87scDAQ41gdNQN
	 9IRQG5h+fRIMnbOhIQ/JnboJ+s709CPBE7O8ztxxcnpbqo5w02CMTEOG52tuR0c0865kC
	 SJIQrfF+U4Qn6TDl8INoEe0H27o/wmA1gi8qIGrNUsQ4kMj3Mp4I+5bEKdd8t3O4rtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sV/HY1gt";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B406606A8B3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B406606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV/HY1gt
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1386165a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813844; x=1795418644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZnkZ1InoVqbMzJo0ykriEGYJYWNq2vEyk285i6Z8tWE=;
        b=sV/HY1gtIBmJlEnpqZ5GtCSoI7vFi1ijznjmJzDid/6dMqhULkair+am/xzHJf7sb6
         giP/t5xi8w5TCfmY2WcwtFxrlWwBspQPMtkOBeTYiLsqIEzmFTNQOILagk0YOB1l3KPD
         S1ZvFIQTX+pKMcTuH03QXg0BtVq66kAg3ch29tEBd9V+oy/p/x/+zh7JIb2iLNbjWTnH
         PALE6ObljSUAddTZeNMRX0mNWTeE/f/aFEijzWYfJR3FVqqjVqzU6UjfE5og51zESEo6
         LC9Vl1YoTYOx/X1nY1mxMktQRM7KTuCpQPMsIIVaE5EIajAB7HsW2JC+lrDVQuednAGM
         Amjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813844; x=1795418644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnkZ1InoVqbMzJo0ykriEGYJYWNq2vEyk285i6Z8tWE=;
        b=G72GDhOciOtTa9At8XLOlxpXlppSGeSc7rIZMMI9cPh8NMWXQl1gIOXKvWrelFCos0
         pj/qGiIO0yVcUx59DYsi6RbM9Hw6pFmWApOYf93auh5HiP5pCtsX80DkFIyo9H5mUJMp
         3JiJx2ajiUd3GTvlsM+sdO3wtRjxTAGh/xPOQG17h5G6kvvkf7m0thRF+2zzX7bPWLqV
         Gp3kJYmizuepA4BdGWH4IkcECJIEzVH2Hrok94hzllRRgfh/AzPPt7COFtYU6K9xDic8
         CqojqvYZRvAzgLn5Coxc8mZOlRDK1+4cGn+Yp7qiqNpm5UvvdyAumpH1KWnTckm2rnWK
         5aSw==
X-Forwarded-Encrypted: i=1; AL+hErFCP+o2GMDsHDTniPDdCHgfst/C2dF93NVkBo7jUzrx3Crwe9+yU8jt73igikOCuduIcAg4WSAEGjWSzZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fGlamupJkIuATJ7Dee4SO1yhexoInjNwZ5KmmiOQ8GDXyUPp2
	dGQa36jRRTfmti8Xv7+7YJjDHXyKQ+y/aTb8k7DDjRrETmMRrnjDCJEXq6e/TQ==
X-Gm-Gg: AYBFou2k9C74BSVEVUuTtXR53mPZLnq4Idna5OJujl5sjXS9HUtjeNWwidiYlfKE12b
	LAz1zq1lqvfcMHzQdinNfpigJ6xtEs1BM+UJnloYV7YcRAJ9mJZwhg/+zFdFSy3NG+neAKASf5k
	LwcOz+/XwvGmVjbp0eF3NXMQ8urck61Vk7Tv0WsYyMHXWD2nfrudC8Q5CQq2rjcs5uPmRMkZjkE
	6dRQcJPwZs2cf5tqI9z0j3dDqxq7ijvMQIHo426KqnrlS3SB1cdtp+mEP7Npa84znlJOj8GdTZg
	Galyzs8M/hsISJbRfBXnXJ/ReVDJu+JkAxlUyixqHxyCfvtFnMuWwq0xBlH5c5i1lHKhasZOyZg
	Jyk9S1NrlNAY75yk5ZQemExOXYlS+WnCXC8RRPpJ4ZtR/avkG1T1E9zBQUPRhpyCr4xIwhlvsKQ
	EkwZ4vPlr2Xd3F2YcSwDGv86pwQ+SrveOuhbMN1DUlKCrg+K8b/hixADZ6QC/z7pY8F1Cf6KQHs
	vcHsfw2bMLv6RnCA34drZCBhoO1LrNcNxjH5y8+uy9fIa25pCcReYuVn3VhkmCpHJA5VvcNNOrL
	Zut4k5DpfYyGEhJ0OXX/B8Or13MVZ8S2CAI3UxoOVnm64Zj5+9i1C6q+yPSePE1a3nuoDsY=
X-Received: by 2002:a05:6a20:6a22:b0:3fa:df2d:d3cf with SMTP id adf61e73a8af0-3fadf2dd8c7mr2922085637.14.1794813844225;
        Sun, 15 Nov 2026 23:24:04 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm3816508a12.25.2026.11.15.23.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:24:03 -0800 (PST)
Date: Sun, 15 Nov 2026 23:24:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: max77693-haptic - disable bias on failed open
Message-ID: <avqvjEZfFOzvRdXe@google.com>
References: <98F5ACA9EADBEC89+20261116022442.3298673-1-tuhaowen@uniontech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98F5ACA9EADBEC89+20261116022442.3298673-1-tuhaowen@uniontech.com>

On Mon, Nov 16, 2026 at 10:24:42AM +0800, Haowen Tu wrote:
> max77693_haptic_open() enables the MAX77843 bias before enabling the motor
> regulator. If regulator_enable() fails, the function returns without
> turning the bias off. The input core does not call the close callback
> after a failed open, so its bias cleanup does not run either.
> 
> Disable the bias before returning the regulator error. The bias helper
> already handles reporting register access errors and is a no-op for the
> other supported chip variants.
> 
> Fixes: 56bbc99e6914 ("Input: max77693: Add support for Maxim 77843")
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>

Applied, thank you.

-- 
Dmitry
