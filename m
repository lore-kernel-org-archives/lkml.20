Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38C3043CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943843; cv=none; b=ja5vjvhf9nib6TsphdD5TOMH+korG6RSyYnMSCTeVmBUsG4PPQYeWT9Ij5ceu6Gkry7Hsg00TJh3PbdizsNPoI57FBz7zTZJn73vEJSe/7tBcGbAGhG1GIR0mwjMLxsQGFGsC3z++IcVQd8KhBeRg35Jl098OB52QXnm/Ium85I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943843; c=relaxed/simple;
	bh=V01dN7/IfsEO5pHq2duFtB/TRqL+3S234iS50A0mA8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyhFhObwcaiCHm92gqt+2B1qgS6E941fg7kZP3dJGcPLR3de/xYS2UQxgSZtwZJQa6TvYON5tNGwU+y/pRcgmeppz+Ajj9da/1Lobr2Rn022h/dJ8+VDy2sBZdGdGSzxqv2MayFczPMCy4AX+qJI3C7/7JV0Po7BhDlUdnHuaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khiVaIq7; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khiVaIq7"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso209377b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791943841; x=1792548641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0p3i0gAxxSlQHkl/PX1ueeB867F3mj3/aOjUbLcnjU=;
        b=khiVaIq781TOIXCYQdfhI0zo1v06OwgDwQ+AfU7re7r/EI0nliwzLSk/d1Xsw0ESMj
         S+wDyDj8jYlQ3RtzYoihSHwNiO6ChGAd2dIEJRRHKncKlcL9ZU6Bl/HElxOxZdVVWKrO
         3/bxfFnR+N5R25W5IaQrZADN6vdmkrVaIsGMYKwNCAp/vZ2V8kgiYbQ5WQ6ojEj2thp4
         rCXqMQcM+TvaR8Kq57tZxFyqPA0yADjkx+BVEPby0hpePPdeuH4LeFGIHjz0JevaHvS+
         Scf3Vb3fo3A2lYAayzQISW3k79nQkVc4Pe1W3oLyggNJBtEgeV6G/kp9lBuxj4EG8D2a
         3Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791943841; x=1792548641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0p3i0gAxxSlQHkl/PX1ueeB867F3mj3/aOjUbLcnjU=;
        b=fI+sG+LWizmC9jHgfcvxtHjV2LcFZgkwbj+GxJ0dG9/cbf/qb4IHBPH8N9ymckPOxy
         6VzfRuXFdrIU9Ghm2YQbiCBTbsG0DLZPn089+Ok4CTS14BFOL4Bb3e2q/wB4xfBR193U
         UuA9qKO5JSA+xAXYESiTXfqdFHhHnTBdwW4723PP10kfs3QHf5RObr6N5lo0xZ7Udfem
         ImxjOQTuKgGnOs0LM7N1Cu+oZl39L/AAD8tAHdx+rhK8uSoCsOERmLpBZYAl+348m8wp
         5E/IgZcXHHSpwR2Dxx56J8yhhrCIfo1xkq0gJw6N5GBjK/q9oqaOjcY2DDaiD6mLVeDO
         R7fA==
X-Forwarded-Encrypted: i=1; AKwUvBybdTa1/jjoJyEiNrDiieDkh6AS+EHLbCLLWlohxzfuHpnHmIodSDN5gJ/wb3quzVePTHGd0ljmgZj8z68=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/fk2Mc1Fj5/oS6zEkTE3HkL2vXqqFuT+kpLownWl1NQ+JM1+G
	0z6sjq0fdrARxDIAJaTjscCbLqx6RTdiB4MoXnySkNeWbpGy01Um1olF
X-Gm-Gg: AYBFou3TqgN+O+5QlJ0F0Iqt4hXyElI/MfOGvZtqYsM9/FfLOPmVXteOgK/cHjkBuWG
	1Jn8tAfcHa72SZy9sTXEO93GkGn5OMsofmCiM3yFflApZcLTUSSpBEtqEZBr0MUS+6KM6fy6f3M
	gMrhoGct3OSbyaC435ga4iZU0/CjSHoACJ89Zu5tIsdyH/wurGyGTGhTsJqQR0rgfRIkoDSnez2
	1jGI2yCzv729O4nZJA8cwypY/s7b2jJBTPJalGjJLYBGQfIEcN5Xgj4AR+W7pxIarrQo5x7xI6B
	eipm7yhM/vb0aqAWJGV/zpbjYJL7gMfL6T5tyzZUqkz2aprQ2sQnwHIqfdwvKX8PDNydQllvKny
	SqOhMdyYezeGRp9mYtYZXNqcfKgD09hSL9Sgw6vucQ5ykO/xX84ixKRuwym1EgwWZRVoaysv4hx
	FIAAxTfnnI1pSxWh6XTG5fG6eygLqawSrLPlGkW60lMBMebc0ddFLYGNuPoQ7Jb6qwsMYUnFzAZ
	2h9r94h8sASSroNbkSzYRoat05BEpFM
X-Received: by 2002:a05:690c:dc6:b0:89b:6beb:1149 with SMTP id 00721157ae682-8b07ee94aa8mr53781347b3.54.1791943841047;
        Tue, 13 Oct 2026 19:10:41 -0700 (PDT)
Received: from localhost ([2600:1702:d60:1bc0::46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ecbfbsm50290417b3.23.2026.10.13.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:10:40 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: Re: [PATCH v7 5/5] alpha: decode Clipper environmental events and retain console logs
Date: Tue, 13 Oct 2026 22:10:20 -0400
Message-ID: <20261014021020.3842132-3-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013211551.991723-6-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com> <20261013211551.991723-6-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 23:15 +0200, Magnus Lindholm wrote:
> Remove the redundant silent first pass now that every valid environmental
> notification is reported.

The silent pass only existed in v6, so this is a change between
versions. It belongs below the --- line.

> +#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED	(6)
> +#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED	(7)

Where are these two types and their register layout described? I could
not find them in the 21272 HRM or the ES40 Service Guide.

> +static int
> +clipper_process_environment(struct el_common *header, int print)

With the silent pass gone, the only caller passes print = 1 and ignores
the return value. Both can go.

> +		if (packet->class != EL_CLASS__HEADER || packet->revision != 1)
> +			return false;

el_process_header_subpacket() prints the frame name and, for event and
halt frames, the timestamp. This scanner prints nothing for the
wrapper, so a decoded log no longer says when the error happened, and
the halt code is dropped too. Please print them here as well.

> +		default:
> +			return false;

Your changelog says the ES40 record is class 5, type 4, which lands
here. So on the one machine this ran on, the log is never decoded or
cleared, and each boot dumps up to 1 KiB of hex per CPU. Please split
the scanner into its own patch so the environmental decode does not
wait on it.

> +	for (i = 0; i < dump; i++) {
> +		if (!(i & 15))
> +			printk("%s  %04zx:", err_print_prefix, i);
> +		printk(KERN_CONT " %02x", data[i]);
> +		if ((i & 15) == 15 || i + 1 == dump)
> +			printk(KERN_CONT "\n");
> +	}

print_hex_dump() does this:

	print_hex_dump(err_print_prefix, "  ", DUMP_PREFIX_OFFSET, 16, 1,
		       data, dump, false);

> +static struct el_subpacket_handler tsunami_subpacket_handler =
> +	SUBPACKET_HANDLER_INIT(EL_CLASS__REGATTA_FAMILY, tsunami_process_subpacket);

Nothing reaches this. tsunami_console_log() calls the function
directly, and the handler list is only walked from
cdl_check_console_data_log(), err_ev7.c and err_marvel.c. Drop the
registration and the three functions can be __init.
