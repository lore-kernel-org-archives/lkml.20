Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483184;
	b=ljGbmX8AhtMi3kFquQPFJc7oJgT0/cDw5OA2n8QFqQrID0Ysk4drTM/4yBNNc9H8uCBl
	 H8bWXDpqXZBXLajFwD1FmHNUkKiqmjDvFSoHoViAark/76WPDpsU1Iebc46G9lxKbIuxB
	 3gYO78RJNUhWqDbBVnZEvTpcw2Q/JmBqhhZARjJAeAGsXIAWEm/2pIEfXOCWsxi4ZElwt
	 OJtfYXuVsMySc+monqtm++YscRe9Wn/ceB1KvztcBlPmI2VUmzS748AbbrDYGdIfC5Cvh
	 0B21ff7H0mS8GBR+AI3m5cXjl//gHOt1k1AzaUf0v2jQOyNM8XyJdWrv1fsKrlMV4XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Zg6hXztxm57ZgutA6Jjq14W1datgteH45TcPMGjkBVk=;
	b=lvz3b2VSVIoOIo1XfMBtOL5cIqsJ0iKAkBXDbKMWJd7l3lqXA4JsATI4BQoWDNe1up98
	 0avxIZKvlkrP+NFs0WAKoBuiD9b+omtlsr1aukMvA9QFmYSbBHU6wztOmYQ2uZMq2dL9C
	 zhfFcd8YEbFEU2hrw9vsbCAODfV2Jzuoskbv+CANgYIwtfKglGYkpdMa3PRk51fmwkNdm
	 1/Ye7Obv9uuSWXSikzhas74PC7v09VI/rsdNNT40b9QoBz271fJNxq4GyHJPEa23arUTp
	 njrPTg4hTgaKFbf9SGBpvoWnPawfhLt63vCOCwv4J1xAPMShz1y+HsLB4Oq6KBo1K5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JwmVh/q7";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JwmVh/q7
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b042c0728so831725f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483182; x=1793087982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zg6hXztxm57ZgutA6Jjq14W1datgteH45TcPMGjkBVk=;
        b=JwmVh/q7XOUjWXSlgpeq8sAkiSMaBdn3GXJLLjO8qoXyBD4SbwvvtPxNWN6uFYwRZ0
         f/OVSJ90CXZL9/zm+iyQIR9WqMW+TPQObWw93zga5hurcvvBY1EA4GuqTYRe/zN312fq
         WFt3n3k4+ESrjovm4maAWgY3STD1WzVjC6D9ooJzqfhhYDYMIX54vyOvdjEtjH96YV6v
         b+DssIoLkkVtFCQkrG5FBN9kdfUYIKFpJCo8qmsIQXZrV4zpcMpkBro6Jt8/2WhDuS4v
         xka5AsFJlx6B9xZy9p8a2yQ3C2XvPCwPbHLdIU9v7pC9udK0+SVVPuDx6iRU0hrMl76Y
         ML8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483182; x=1793087982;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zg6hXztxm57ZgutA6Jjq14W1datgteH45TcPMGjkBVk=;
        b=Q0LwyZ2Fq5bXQJYCtvdDdNuCFFBeLYs8ZmI7eovkOFoYbonp1zREkh+/b7hjNPh+8e
         hpbWjycJ4b7EGbzKKwOldIKMGOH0M0rZG6TR8DJx5p44YtsMmzilf4V8RwxcCmJ3HOLJ
         6tBoNDVN35UcvOYEcnc9KWAHBSj6qjU5rFS7kOYYEQy1YrSRVvP/Y9+DjApyf3RaGA0K
         Za3jS8zESYORagZGClvpkc9eun0+/Fr0ruNvBp7GDn8FObQMqdA671l4WrSui+QfpA9r
         TC8tERZOWPu+y5UkfrLEdwj48p/WpfffsynwoUQGn36RR3fX8ErUY8H2o1uZcAZRgXGg
         cEpw==
X-Forwarded-Encrypted: i=1; AKwUvBxjtCj3TSoLsKkPopBhvKV17HYfWkA7T9cax7itKSR5UQRLrSk80+i2me3911vyDG0OLJmdWHfxU38dNaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLehW4chJesh8lZYqdmK/LbTRQ2vHDjLPYBWmvGB/+Kv3AfN0gj
	E3575SBRg7Rdidqhm8rEsoaPf0qhLm/bpkFDMMt/LOED/lZJA3KXY6r6JsrSpA==
X-Gm-Gg: AYBFou0sCG92gSQyOR3kMBkRZCpH05CZePNVvkNRL0sOSj6nJYKm1LDcCqOMIfA8/8y
	SyrZ2wP5+cn81eSH+1swnlMGMt1wr1iX6cK/bYW8bmj1Kfv/yRIb7k4tXzQ6J9D0gsJ6+UasOmM
	QVRFOXD22d8iDaKe7iFCbuyFYF+uLzhJLd6J+k8wFFdqp8GPnUru39N5HTef+e0aDsY7WxMDM7w
	KNvcPmsa1FmA2aalxhdVJogbTWqmOKr0PaS78w/XL1igtRwWT7z5xfr6LpuhTz0isPxrm9i80Rx
	sSAgzhlPk488EThjV6d7UKv8/mkXvZkdIFEwWPHDw3j1jYwL142gOP3SwPj6wwJV9+k3LqyLqxZ
	PKgEBd2bjeG/XTpCPWvhGBGZBFPoLFJwuNxlfN0a9xc6Ej1Vvn0KTnjmPui7fco2adndeudbUk8
	KiGazouhq0tfFb94MVe5tz/FaT4OnRiLZrqHzQliHl3MII/LykooLyzKKJFr9ZQgFt/w5bJpCZY
	gWp/UwJzxCZK+juwFzZr3RKBMZojqQxjfAuqJI8BXdj0Vz2Bcb4PL237K61BUAyiFo0jEaV3pf2
	8MJGJi+BCb5xlS2RbyRVffozRXKhu1I3Z+iGPYdYiyRCr1F1yP4I25Rx+qboFzJ+0IkGAv94LM5
	K0RwBIlaIQlAwESj15ebeTrjf4Wwitp5z/Rxv5Wr/ylr5uU82NNupFZwmhu3rfXzbRA3TIaJLnr
	EkV47ZM7UjGAv8YzM=
X-Received: by 2002:a05:600c:468a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a1efba1091mr63117565e9.35.1792483182082;
        Tue, 20 Oct 2026 00:59:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbd43sm3586563f8f.4.2026.10.20.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:59:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:59:36 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jonathan
 Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: imu: inv_mpu6050: use named initializers for temp
 in hw_info[]
Message-ID: <20261020095936.00002ff3@gmail.com>
In-Reply-To: <20261018000924.758186-1-kapoorarnav43@gmail.com>
References: <20261018000924.758186-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 05:39:13 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> The temp member of struct inv_mpu6050_hw is initialized positionally
> in every entry of hw_info[], as { *_TEMP_OFFSET, *_TEMP_SCALE }. The
> order is correct today, but positional initializers of this kind are
> how the accel and gyro startup times ended up swapped.
> 
> Use designated initializers, as already done for startup_time, so each
> value is assigned to the member it is named after.
> 
> No functional change.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---

Your patch fails to apply, please check it out.

-- 
Kind regards,
Joshua Crofts
