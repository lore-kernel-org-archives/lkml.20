Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794640702;
	b=e0mn41pQkAIYYsMmSPBokJeSKvlUEMKpI98kw1TVpYnutYyywEa3o87QZkmy3k4IX32n
	 m+foNZHWHucQ4pBh0UxWFbxMvePocQv2J47kj2BHHPibhGbU27nDdDAlLqUbu0krTo51q
	 ZzpHwTyMmiT85CQoyDgrblJ/CqTpofN2JXm56csbCjNhNZ1jUTbeWVkV4jZUX4f2TYE2V
	 i95bU2FgNBhgKFdn9BMn3YUBzvwZEZ7EqyIavA2AZbOzWTt0wHtFf8nw0cFXl0w6pGkz1
	 CYjEJHvoZ+C7XXC47FtOSKoHMXq6EHttfL+6UR8BW9YCBDpNjilueUnxfxEPeOdScLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
	b=fgIEC4UxWjYrzYb1iWLaJUUuLFW58VcINd4lQJgYBSuN3vrSisn7vrybaZuSqaqTTWP2
	 YDH5gdkjyKUZt1G8wkzUdFBKDWkLOkPQ0qab5BYENSUpvnHkVxPoQCV2jccgzmMY6Sos9
	 JXn86EU6v9TVbOumRd1yGhIkYEhUkilYNYOE81niNWTYq9O4i8snsCSy5cPOjhKZNocMF
	 LvYf6WyGNflJLOyu8f8+vxyFoGZshWpz8OQqZi1G8KP6tqixGP+fH4VTX3lBq6H2Yaz5X
	 6pDE0Xf6OGucxCS/vwXk0XllPeBozH0FrFAJfKs59HeHlb+IuJCLm35hH1DvxNKSZ7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwxJcI4o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4DB606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4DB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwxJcI4o
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1876003a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794640701; cv=none;
        d=google.com; s=arc-20260327;
        b=WNEDNWVVaJiVUcrHpufWOI71xEpK1qxR63gATzL0O32HJUmQMtkMHqypSgEEYBjHWx
         PndZVAuMg9BfO/+4golD/Es3r7Cfm4XYr9RJ9p3BQGWp08tGTTIBHYfUU0LKwF5BIqcz
         PhSRjLTQeuzp0a1Hh2II83tSWap6t4ejwumR6DBnzRtUlJPLppY0nt9MqMiDB3n27Jz4
         0eR5ohonzx11a73dNoDp1iSAnqDTlvpmBTXBTyLzan7fpqtco+7fgMHcOmQ/hGWLZzy/
         19KD9jR9m2Ot+1RYksKVYTDcXT3xuHY8EymgkUNJ04M4piwqagi8y1fJMENIL6YdF7/q
         vGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        fh=QeNOIG4uMWky6ZhdgFu3K9+3BJ/0OeDhWGeWocp5xSU=;
        b=GgXDNMFClOqTVNZ++Xra4U5xNuuVCXX41+sDrwk8TKmrbWWxKHAeYPpDwSL6jfAOQN
         zXVc5H9a69F6jGHGoKkREajJFv9VfThttpBLrLPbmQL9SUNJoulSf2rBz6/p2XFaEldc
         MjMqtxaXo7/3I2+5IE2wPKv9TRZ+LZV9Zft+roJn2srn5S8uEvZ5fkZkz9KrC31UCv4/
         dngNMRdA2AyBHs3mVSwCWFfuRr6HCqGKMktPQxsSC6yVMhD8f7aNfyenae0ZoFX8+gsR
         Z7dS3UCPmKJRrBRIBz6Je9sHMuPkE6yljW2hQeigfA8Kfj63jJYzEzDS5fxHZ8UqHm2N
         WGNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794640701; x=1795245501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        b=RwxJcI4o5k4txShP1ACyIu2E3HSVbFXc/DavqXi5iM2Nx+c1HmXr5bZ1djK36fDlqp
         OxFJondbxtCAKlN8o3/OWNKPZ6VUwc4Grd1hw9EHAWwG3e/zh2YbzMxLwomCPQ0WBDev
         yNDeQ+SunL8l30yurKTQ+3hPqn6zr9Us5zYsW6m4gxNmHG8IUw3OSMqRmUCa/CQQIQKt
         apo68HElI3KFO2WPJ2zow7y9mMQ0In36lpUJiLjz/q7VWlLk7+ecpXeZLkYNc7AeqblN
         uVZuZ999V1FmK+Fq1YqFccnILkvPCqxgrjmvVzyZcE1lfSlwzNQxT9pDa0hQ6I1bPIKL
         YjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640701; x=1795245501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        b=RH6Zu6yS6H7k/B/PfJV5KlpDRTZCxC+VY5ojOhjpwafqaSdYOTwbIY+h+oaaim8GLh
         Bq7XTcoP/up+lrwNGLSb4FDygI7IZ1UsnFgB9dKFvAEKAAQlmb12VgqDKznWrz4xluzk
         yscldlT3f0UnMHH6dguV1HRy2URhCaJfJv9FfNsBRvuGNzq8Tn97IQi8MAvU4U1UMlAS
         NxFKkMgK6g+9HZJ7XEBhhfxDkUGGA+aU/vx9xdbkMbLOzL//wQbYVDqs6d1cgGnR2YWa
         nF5t4uYyDRbpELlfKUfbqhcFAL7zhqlXoTDnm49xwZBTZbPObZ2YWjj3WGlmgNozxy5E
         DaTg==
X-Forwarded-Encrypted: i=1; AL+hErF9E3D5rkE3hBegEOnpXWDOUBWO6GTL9jwM4JhM49lK5VwQoOtfduB4vDsqsiR15x6hmiqoNYDe98d3Tvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+24Jqd0mJTkdrYDaHMZF6ypngfpe5oFilxvX+JIX0v6YNDBKA9
	zDLX3Xs59d2lF4SYAXwcSEsKZWzBIKb8+TdfrTvVSvAJ0zvrtg7MUl2UOJBDY7TXxmpvJimtEWB
	S5Ez6tBoNSfxYXu/KebhPuUekN0d8GYY=
X-Gm-Gg: AYBFou09jx59S8VdKEkD7c/EEj6x3xCA/2KUMLC9f19NV0vidiRyAur/NAZeo9RJHCm
	rWEoikdIK8rJ0uO4m/x8Cy/F9b8Lniv6Zgy/mxZC8a7ZhjR+AqGK7askbBLxB+qB5IMYkPP4UaK
	ifWgdyfM8vAkc3mXGGOwQ4PiVcCfy2xUd8/jrqAnBa2gOiPafbTKcMYLk81BuCaQE3DcZUa5kgX
	4SVjbJrU8RzuAs72WbhVTW1prwB5KRBPkTib558KeP1kCjsCOwTEx+x1Yq2FUV7aJpE/FVCnL0p
	skbvZoS10EstiM7x046D0e8ehIzugW2ZXECjkXwNKMtIO2iR5tmFHYbqCh/n5JufOkewNnNRMbV
	InapGmQXQQvRBsU/AzIFEuxQzerGf7hNuZFRi6xfv0sIzrwwps2Ay+8r2fBA7ITx8XQ7QlsrzwE
	FPmqXdFrU4HgZu63HrE3k4
X-Received: by 2002:a17:90b:4e8c:b0:3ac:9d14:fe9f with SMTP id
 98e67ed59e1d1-3b1b0ba3320mr4593791a91.31.1794640701364; Fri, 13 Nov 2026
 23:18:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg> <20261113163219.16603c83@kernel.org>
In-Reply-To: <20261113163219.16603c83@kernel.org>
From: Wei Jie Law <98lawweijie@gmail.com>
Date: Sat, 14 Nov 2026 15:18:09 +0800
X-Gm-Features: AclHuK9uXk6vP5W88YBE9Yv3ZhCaOZI4ovsQnoN4ClZqfcPMhl_ARhhXFj-lIZc
Message-ID: <CAH049wmDwzb+zwQBzuw9+PA7-+My+r0QgbCpOi_snr=+oFpgnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/2] net: usb: lan78xx: do not use
 uninitialized data after short reads
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Woojung Huh <woojung.huh@microchip.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:32=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> Why are you testing this on 6.12 if you're just using a gadget and not
> a real device?

I have noted that the patch was applied but to clarify, the reason for
the tests being on a 6.12 kernel is that I am mirroring my Linux laptop's
kernel version as part of bug hunting and testing (against real hardware)
with a malicious USB device.
