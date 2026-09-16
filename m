Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF1A361973
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570907; cv=none; b=upFKH5+S57BarxEXPcaEYSdOk9/WiIJYz7v2i6dZ/qZykY53ybbiKFe21fJk+4FIjrgHjmHkUJnXcoVp7uqADFdNRzL/yJrT5cGroRcow8ogom9WP+9VcBa0n7Y1kTkzlnPJeX7B0shajB+qadofpFLQTcVO8TQmQBT+79k/1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570907; c=relaxed/simple;
	bh=iFOavfqcbecw7h/v32EEfxZFJOc7LOr/gGBeiIbXWio=;
	h=Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type; b=u/wREeEov0q7ty8fkKQIZk2HacS3Dqshir8YfeOoVJQsTC4pcOcT8+tYFML2jiZJWmNrymzczcnz21aVHJPUZG4/4Ll0Q8dJFuCfcsovgihtueZ4NucUTY5iZg3iKuPzj4zJ0dINvgiJqLvLPbQAO42/yqN0oC0eMepQFcvZP58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak7Ph6o9; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak7Ph6o9"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4c6545d0f93so1289654b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570904; x=1790175704; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iFOavfqcbecw7h/v32EEfxZFJOc7LOr/gGBeiIbXWio=;
        b=Ak7Ph6o9vgvSZLlqVzVzu6XID+moSRD7UXs/4QFIo9OmyEgKU6Xcjh5e15azetDpoj
         7hkkKrDdz2ndf2mgozfGUn5rVW7l6eBKguN4ydMW3g8XLohSTsnPegteKyAXnpRutos0
         bm0N4KWm1GvDMsxA2bT3B22v6ZUNaf+Qz1TyDAsMkLVQcPgFM3uzLfkzZ/2f6VtUovH8
         BBTTbkZnJvMlbaZHQO20mLcVwEXYBWom32QMs1uwnqaFie3rqmpe174ppnI/8RwA/vYr
         nLfAqq2waLWbhvUuZkVDPPxbSaE0ObNzWlL6Ok5aN3APYMPwibfUX9DpPq6XxLtlZlmf
         j0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570904; x=1790175704;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFOavfqcbecw7h/v32EEfxZFJOc7LOr/gGBeiIbXWio=;
        b=F/mF2G6nDPS1NfPtu7BzqNdU/esGVSKvdcQLU5R1igwdRigesqG+Y2JiPV4gcXCTt9
         LWyVBB9hIHBfkib1xBcf4Y7D9Jo5BnBiPrRD8viX1xGUsL3k7jy4+JCE6ABvy9KYyw8v
         VxIPVT5vqQKSglNblqKOxvuGCxgYWwFbbqtH/7wmqgMD5ymi8e6X5/TzGB8rJknXvURr
         dtdsh8ZAC2lGMkma2vsBlUPCR1mGtrrePdTQhmS/+Mgvv6O3iLb7ApnQBu6JxMLkL+e1
         alJfJkL1/H8UE9+XqiJOG+xlRjyrT0vRQlqE8Mc3GWdAf+A6XRdx+BR3OssNbVhWgcf8
         ZU9w==
X-Forwarded-Encrypted: i=1; AKwUvBzKeJj3ko4YJqTgs7yoq7yP7URpmXHy2ysKDyX20swXHtdyqeUIvxXphb5b4pCfXDAr0wrhTw029pkOhoA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcq4/pUFAl9IuSGp6LyuA+f7l3NkJtslEhoj2Zi+7JvHTfou3u
	cFk+LditSkzF7HK1CEauZZW6oc57hWijDqOjqEhfvkzAaIqu8AIg0yDm
X-Gm-Gg: AYBFou1iL4JMvPu1+lM+HGhr60rrE17FudY8+DQk1Xr4JUvzXQfS8+wgRxG/stjcyJg
	nE5ekFQZjKNcOkzkIuOizjIU2rE44IM5tn4eh5gTfIfZ8gWDe7rmOmJ62yx9rONIqM6yKZtNYcj
	TDT6f9HGXPdbcZw+OerbIZZ+SO2p44mGKqNh+RQGKwJQ2hGNSLYQCNhNKe0xet07UaQ2E2aINUC
	jxroABjtjvgWFm3j4AB2yFeLzFnXGgoYEW8ovkuqgLTU/09+/G1m/iq1DgC1h6a+dGcJiVEu8J7
	yCh1Q1nFGx5oRngNSGeEst8yEULLfBvl3m4NH0LAyITaXbF7ONNPqb0ZYudNESMkGI7W2Sp1lNM
	dS7+Ony4DenlQy4laNlTjJ0gszLQP8yD0HuaTg9Gdpo78MPbqZZmqJLbXkEzOQ+CfqoSbjjtqLo
	kEbKAJteNJ/EtcP0DmldsZ6dQEmt0QrMbkrM7B9KIyNtnYj3PAW5EKkANjfVYSItU=
X-Received: by 2002:a05:6808:23c6:b0:4c3:b290:cf55 with SMTP id 5614622812f47-4ca49cc9e69mr3688999b6e.7.1789570904339;
        Wed, 16 Sep 2026 08:01:44 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aa986a5sm1797820a12.4.2026.09.16.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:01:43 -0700 (PDT)
Date: Wed, 16 Sep 2026 08:01:42 -0700
Message-ID: <756a472dad0f5f5c89e634fb8290b867@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
 bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
In-Reply-To:
 <CAHS8izP-gdUcgn2OewUVSWYFWKXrkWxhavPT3=4GwoziekHi7w@mail.gmail.com>
Subject:
 Re: [PATCH net-next v2 2/3] net: devmem: embed net_iov_area in binding
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Not worth a local var anymore tbh.

SG, will remove!
