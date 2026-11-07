Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039221;
	b=3rCZVaYNmMr26F5y+u91PDTeou4TX2W7YoE3RmSjWfRIP2NERWgHw5u6gI0iuE35kwf6
	 hFzEFHcAv+JP9Vji7tKmvr5h9YqaGToVFmITGnYtShf+RfQToCJbR8oZxpqh1I+uVM7YV
	 A3KEHV6HB8HuviBh/9Sil4WKJGQoJSZn0Kyr4sgdm6Ok0sNzyLEAtN/5AzQ6gt46CEGyc
	 YDLgGjOpNLdLllN9H6PnC4WONlgwlTkUp5KfQdfMD36Gpcx/Oe15wH16p7tU/TCsFJHxC
	 /1o+blQW7DSyWnnh6EfoWEcW+o1JxeNKGQgVa7R1OHy0pmxUZg/W6+0MeJVy6P4G6PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=drqqMV56464i4tsg6wHrzxaF+Ciezd2Nv4lHeIMrI/0=;
	b=MLGOIBZSmkXbxF2bFMXOqRycEJ6iTFhYpEsWDHY+pwC6uCE2eAldloXmhcBAMtEoGfL9
	 m7bpVuPer4sXELmHPO6XxmH5idlXydAi2tCtPEhML0tFjDSNMTH1ToHn+OjKP+r4AaiFN
	 bVap4ehm5sqmvA9F8IOfw7jJQwzcwHmsrZiXFWItgE1zQsJhq5Ra1uaPSrwx81AWYJfTs
	 yJDxy7lIHOC1krAKTjtoKwPRLY6YY84cC0LacYGZA0jP8i8SZ78+FTzFyWevYQxEwp0z2
	 7ImwNlXebU3nTpqIZHVdA5Obqq5N1DCYYdC5AMWJPxIHmvVpn5ZPMFHARHHa7bZpjZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZvVjFvY;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B5C606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZvVjFvY
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so1820629a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039220; x=1794644020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drqqMV56464i4tsg6wHrzxaF+Ciezd2Nv4lHeIMrI/0=;
        b=bZvVjFvYYsdSzfWwQT9YkMoTP8JqeZm4/UzCAp81sLLhJzxMtyORcr2aeCuQYaE0yN
         YMguZpntuDTDP4YvBUkVr73+CnKn3upZ8VOxyXz9OZX8v5pXNMUpjWSGRQiStPu6y6LT
         buUjSwLh4C8SG0Q90s4kYfgivk/FS5Icm/8zhEfN30QKHh1Uedv9t5IZN7euR9Zh6h3s
         mEGBaFfe6+6QAhdmq1zecfl2fYrBFQ5nVlOpWk/E4cd+AAoPId8GoRLEoPcOvpFp1PR/
         tio5yKKhX+mAxTfnvUy7t5/IM0VC4XzhVc+sX+Q44IZGGFAWkrX6ZOMDEt+DhSv5JnrX
         0ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039220; x=1794644020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drqqMV56464i4tsg6wHrzxaF+Ciezd2Nv4lHeIMrI/0=;
        b=fLOjaHW7E/i0xDZTFun8GMXSFQCF1hCjP76YLjdb+OdmqTk/VV6hCwsHw6g3/xxEMs
         08Aa6fs4YvXHubGkdcF/d3mG23A9YhC1N5XDTKJ2hLVOxlslA2/R/hiRID+MDqWhHGWr
         6OCOjUjxS/FQ/ofD3VIgLW8NRS9wD0viQqBTZ18+weiyowMlguZwR3JhjYrQnafdXdZ+
         qTQ/6nyCgFwJghpnzguSOUB4gd3c+9iL5Q/JMemu4V6DGKwQ+3momO35CU9A46Uh6dMs
         pEHkUKEsfEonyYoI/Ii1GMEG/5SUp2yb4vOW6MplX+6LQ3QJDUX3v8K5k4vB2ej8xBVA
         t9eQ==
X-Forwarded-Encrypted: i=1; AL+hErF0qoZB8s7X2JZaV/zTwFfR63HlL8aztCAnwEORCFax7KZS/IC5+yhmgfL6yXlXFK2a0QKxdBHdshGoOuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+9U4+CLn0UAer7pgO05HeK2zIuOLn7ncp1RNrYTVuUsPmbNjU
	Q5MjO5gv4lvxg6HKCgyyViUlWrZrQk6hWh8CkkMmSzYTsBsBIh1uYQcj9tKlJSUR
X-Gm-Gg: AYBFou3EGNrBZw07XADF/8NJUvpSSIKBH9E9a+3l0pfbdq5ksKWSj53f89RVhLrCuRC
	seOw7aBEtIUASA294c7/p0CW1jVVHCH774hxH62RA2kZd7spgLSNief0GQFLfDNVkGR8wVQmOtq
	a0Z/uLuVbiBMzpqFseQPeMMs9SvX1Oz4uFR5UvbvLKg5WvF1K/eKKpwR++ftgxAYwrolvW9JEAv
	yK5yogjkNAZLxv4iLJPxWhbh6mthHGfphsIozZ3gE1iTsnh4+KkC5zrUinUewXHxd+qVmOf5nLi
	t2qYMWOxDonY5jT3QIW6PxKi1KnACb4m4FBGO3ljrZhwQKE9UZpYs7BRUePjj2umLY/oV6lzsWV
	+9P0FAx8uPxp3z8prMgiyl67Rd37Mb0o+aXIHsAQ5+vTH8pO3ycBpcXoHeS7pYAfOoUaJmVHSRP
	yiMG6SuvgnesPEfSjYWTSu+8f1/TgVv3Dxj/EQDvwRwPnBUYa1lrrzj1zWhyXlb4567TmsB1yLV
	g63A4nOalUcZNya+1uOxixB3wBdulgCgXZOpq+ieEnnu8Yvb9foLI89nLJFXKD0m01tOujMu7xe
	7o7UK8OSwA/CTj8BfJyiTHkM26HjkJtmKPgY13TKyHOz0yw=
X-Received: by 2002:a05:6402:4503:b0:6b6:e857:19d4 with SMTP id 4fb4d7f45d1cf-6b6e8572a11mr2906303a12.11.1794039219559;
        Sat, 07 Nov 2026 00:13:39 -0800 (PST)
Received: from localhost.localdomain (luna.k.pl. [193.239.59.185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ae576asm1527357a12.19.2026.11.07.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:13:38 -0800 (PST)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: rylos78@gmail.com
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ata: libata-pmp: disable the SEMB port on Marvell 88SM9705
Date: Sat,  7 Nov 2026 09:13:35 +0100
Message-ID: <20261107081335.3360920-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103215706.508495-1-illofspeed@gmail.com>
References: <20261103215706.508495-1-illofspeed@gmail.com>
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

Tested on a Synology DX1222: four 88SM9705 (0x1b4b:0x9705 r160,
6 ports) behind an 88SE9235 that is passed through to a KVM guest,
6 disks. The same 7.4-rc1 tree built with and without the patch,
one boot each:

                                    softreset  reset failed,  last disk
                                    failed     giving up      attached
  7.4-rc1, no libata.force          60         12             197 s
  7.4-rc1, libata.force=N.05:norst   0          0              70 s
  7.4-rc1 + this patch, no force     0          0              11 s

With the patch, each PMP logs one "ataN.05: failed to resume link
(SControl 0)" and port 5 is then left alone. The same disks attach
in all three boots.

Tested-by: Kyrylo Biryuk <illofspeed@gmail.com>

The test boots were scripted and run by an AI coding assistant on
my hardware; I checked the logs.

Kyrylo Biryuk
