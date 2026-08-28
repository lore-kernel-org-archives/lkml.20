Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544F371880
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932797; cv=none; b=Ke2pwO88E17CORoyN4vAEvurjmq7l6nydDPRkI0WgEGojCTx7rJRo9vxxdFZRIQv97+5qNzTLJWYnGBaX3gcdvBxLS0OzSmSg2ChnN3xD2ARvZ+dAlM1eU2XmxPbWa+pKf5BaQMemKKsJpSSuat/KyPqYI16ZUO7RZVRDkHH7Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932797; c=relaxed/simple;
	bh=c8Ep/ag34C91Q4xe5vZf7F6Vyd5bRxB8vKk9J4+36pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SINjxzz+5alwcXOia9bQqpJyN4PjDfOZUt5CjGR9HIjDo1V+H0wrSWImB/IiN5XLL4qteQBL78+Z6h42LvCKN4zk3sofNCNxWBIKfqZAUtrQlXgfUS1JSr3SN+oaanQwmKtQgnXL+DnCpXtG0HxJxmN1jyjagzXYy4ndrRpuVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clcYvKd8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clcYvKd8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf452def93so18611245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932796; x=1788537596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cr7C0zQrIkhunpo8t3KyB70o8NQ/OZIdfj8LBPlxSYU=;
        b=clcYvKd8azPLzMfcoJdwtOCFOCGOY+QXwDUiLuRCrd+1iCA+W/M2yFLK1gVguFNVKd
         uOte6Gb6CBZetpvRACBDyUGlE9jqADaSQep7n9uu8e8ueFjJXczblTtKhwnJO9BAjrzN
         vKXuqQJeLnJB91Egt4sOUhbmk+cdOrLeoHQb+jeMDyobsRGhJzNZj2FvH5u9b5OvKook
         cOlky/gzQkuEeAod6H/TLATpu1S5pgvfXOOK/2LrPtwpg43Q9+8wQv9Qy9AcKBlo/zp0
         j018jpq+TlYa0ZPsrlOrW3P4FtRqApitSXarxDDAtkw7sWcTOLri/lCv6herlMUzHdRM
         4VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932796; x=1788537596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cr7C0zQrIkhunpo8t3KyB70o8NQ/OZIdfj8LBPlxSYU=;
        b=X2MrLPa6hrdFdaD3/gmhiufMsSa1IVPqh2Q35FsmcU7Qtjdd2rJFzhhZlKakwmlKMy
         /npeYJOAL3a9G1Q7fVjfh3YvtXuWvADF8h0lQU6gBQaGeCcD517y3lCKuYUVyJ9+ZHsa
         oMUcRhqwcBnAGoK3HiUDZ6oZwOlEKNjKDV7o8RdzPtotnUJokPDjn6qDgfQE271SPil7
         T9vA/etjyz6BGdJopbMBZ60Pi6QGD4nUFUANxMyDE6z7HVrWT3e+5aOPgRnOi+LGTHrm
         ZJUqTVSFYNPWKmifdBI97sX/+VKk8aaUXhaJVEEfDwE6aRQvLg+GDF9wZpAuDK6dJchs
         saUw==
X-Forwarded-Encrypted: i=1; AHgh+RpmGalIMGuAjEA9sV5US1eJuK9vEPKNz07XotESI0/C/8eMNBDNWJFMVdGXzEYGWejiauPjxM4dp+bqtmU=@vger.kernel.org
X-Gm-Message-State: AFuF++mG8Ekh55vJj5KW98KqVVd92fjsdRPzqxpOPS3Po6/3ESDOFDcP
	mmVHAfZD7U3eHosCcHjjh2oDeyOD2dglVqpqNuO3nmmFE4qmLD9AfMeDHia6KA==
X-Gm-Gg: AR+sD11JoeslePCqJyHCS6b5O4lWaHKdAUoHqK4qz1CWxK6CR6R7s4AEPSOLf7wC5QY
	WVg40TcXmiYjYdw9QrhxFuzWenS79T3WAIltrXxa0hNor8pNzEvtsNiZm2sGGiNHXhbD7HjWmiz
	UN/7dBL4tz5hV+NVCZC1AypamFK/Pcd+SHQ1oFvDWGXwKqqJZiXHpQdq4NCdMzoXUmpilC6aX3m
	crTxWUEBpPzbE1VUSErUnsDah7GWIE/efxuDmssWW1crIi1BdNVH+wWsheX5R0iNcg+jrqNatOs
	KogfVqbiulk7198YK8nHo1UUxZq5Dj9vRVDeHpVkW0DOy97d9F6jCylglo09+ASuN+NZnj2bIjd
	rI9MFRQ+4nqCbPetimVCEivUemcTdzoO8zbZL2kJSWoXovVvZfPKmU3ATjOTgfibWp8Q7ZF+JJp
	F4FPGjwVk38t8dSv0Gsqs6/1m+MJVfdP9qJmgnLqELXVf4WBkCLusORgSi2Az6Fvrqf/m9P0Mjl
	g==
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr192211225ad.15.1787932795656;
        Fri, 28 Aug 2026 08:59:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm6524806eec.18.2026.08.28.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:59:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Aug 2026 08:59:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vishnu Razdan <vrazdan@openai.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	vikash.chandola@linux.intel.com
Subject: Re: [PATCH] hwmon: (pmbus) Clear generic status alarms with
 CLEAR_FAULTS
Message-ID: <53d1d7d5-629e-48fa-8947-3a3c294ff16b@roeck-us.net>
References: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>

On Mon, Aug 24, 2026 at 11:58:00PM -0700, Vishnu Razdan wrote:
> From: Vishnu Razdan <vrazdan@openai.com>
> 
> Some hwmon alarms fall back to STATUS_WORD summary bits when no
> individual limit alarm is available. On PMBus 1.2 and newer devices,
> pmbus_get_boolean() acknowledges these alarms with the same byte-data
> write used for detailed status registers. For example, PB_STATUS_INPUT
> is 0x2000, so it is truncated to zero when passed to
> _pmbus_write_byte_data(). The resulting write cannot acknowledge the
> input alarm.
> 
> PMBus 1.3 Part II, sections 10.2.4 and 10.2.5, excludes ordinary
> STATUS_BYTE and STATUS_WORD summary bits from individual clearing.
> Their summary bits clear when the underlying status bits clear, so
> changing this to a word-data write would not fix the generic input
> alarm either.
> 
> Use the existing page CLEAR_FAULTS path for generic STATUS_WORD
> alarms, including devices whose status accessor uses STATUS_BYTE.
> Keep individual byte writes for detailed status registers on PMBus
> 1.2 and newer devices. As with the existing older-device fallback,
> CLEAR_FAULTS can clear other latched status; an active condition can
> reassert its status.
> 
> Fixes: 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning bits after read")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Vishnu Razdan <vrazdan@openai.com>

Applied.

Thanks,
Guenter
