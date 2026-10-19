Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82A44C64B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413976; cv=none; b=Jq2tP+e5dRNgy6/UFBVYJ3DdOs3lXHpF6uJXV+fp9c0/kOWWqraDAlgB1ThBAorMPmhshfZj6ohbOwQw8dLsKcsit8K2qbyMeVNFjfFHMsqTEokGCpVmSn5W49bDDFpQMjBJwptuIDaPNvvDYO0BMav9V5ZEyksDGz2+PiOJO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413976; c=relaxed/simple;
	bh=xp+A0hKQQq1H22UYXD4AcfOE21QDOyZZTRzwG+3a2Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgsQ1mmOZLmMti9HK81rf7nc5USuqq/NjxfEEhO1WLrWwuCljIPTKy6xXpRRPRDSpyqwP5GspMmAtn4yCelHoSVHpINCEsk65cQ/nEdLuChNfH/AFZD7UIb5d3Dqgu8hZuOj6R/RHBYyXV36el7Rw/YQJHWNn/vExszVfGKQJ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVQV2mMC; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVQV2mMC"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15354aa70e8so1067489c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413974; x=1793018774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucqImzYK4TndSlhXSWzG/Thctz6staWsP5DajBsvrOg=;
        b=CVQV2mMCXKl92EJaX/fW4ZHE6QUrVtOXkhA/GHdGi2IWovUF0190v8M9d0KGdeZGHB
         eekmpm8AEuRdDw6xqp/uSU+phHXCpoENQZErq68hm3nzFbEqRe4VM1bvxRFmyVy1+zUu
         1FRX1pQ5BNj9uD84giznYCgaXMkC1p4KSqRxGpV7D1GnJJlmDca9G6OW6OoMKHoBHI7d
         nOhYxSaF79ZghbIU8dhpPXV9C7winPJYX51s1SRJcixd14K5n6PyqZgxB0rAT00WIedi
         ZSOFvs2W3B3jf0DCKK+E59W/divgwKks6Gbleg02+nq9AzC3MwfZeau1nLndORls+eu0
         QQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413974; x=1793018774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucqImzYK4TndSlhXSWzG/Thctz6staWsP5DajBsvrOg=;
        b=HZN+6j3xK95glVfeLAWVVimtvJ2zMePYWEAr8jSNXPdsd5ZRNKbx0HT7TjgCpxtfQa
         AZfii+MQ6opEdJAO264KbNR1gUgMByekgWgjPDb5reOlnt+NH6Wi1V+QJR203SBX2JDM
         ssE8W1tQ1NSVQdHWPCDsALW3xwHY8APMY2x7HzKrICWvAj8gVCDuYcqquBlYRh6mrkiq
         myK5wi9JUnOFgmg9ORn2W5HynImNgn8keoPjVstEzWwtr/gWg5wdqY3ilCMiBWq7CeG3
         xOB7abLz/mL+uclT6dK2N09SRu9nl591Cem5Q2UuwDdmLUXtORRB9BtDPk0jXhgg6p5U
         dYwQ==
X-Forwarded-Encrypted: i=1; AKwUvByTZKP93yym2me1j4AW8+Zv+JGGTnGI6YIT31TJwZjendZHfCqt3EzJvJRFpVEDWQR48W+PGdVkkhl81VQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOlY4z0DDxnVg35TGcmo9dbe/rxKdlNHbRZ2yb0Gep/FlJv8HQ
	sUdmZ+yZGwAQkcxsDrGsPcYKHured7rvIDZNj0PvqL9zX3XIb2tJHrTu
X-Gm-Gg: AYBFou3oVW0GT2LUimrJe/ZnMq4fycxrb1hP0SntbCJhgDowVEvdPJS9V1iZl06VggY
	Q2f+MAkjGEeFWGdNLFLDWZtQiug/4jxSE9DWnMPpCm/IKsTShjaCzAqgDQL9U9WGNcKyKSnjbJ0
	wdTVFADnnWqdtuGIOI+Tg8mmlGMdp/LoX3gIM/IvYWY+Z+ANs/7zgFbDy2Xt1NbUIW8n0fFgtzz
	pDlT+VqYeJ1GCL+5pJF0ywrV0+PVaW2xZM2B0QWgPqWkPKKw8xaRW1NQRRTxN7kQP/jL9OoDI1l
	uVekmhfom6dlQrUoj1+Q30ve5UmQ6FVoJKIXir2ebfFuZIx7YVDyL4au8EWDSQ4RksWEspax9pd
	94tMXMu5Sss6/T4jvtiA87t2fJox4IOYk4MajDQKq1ir3XCkG8YeYOboHkrZ6ERNh4q4QEHsOt4
	JqprOI7UULIiHrvmYM3C9FOW4c4MnR5nGw2u2XhMJq4H3Pv7iP16q5ifF2hbtUom74+3l2c1kGF
	ZEriBaorlhI
X-Received: by 2002:a05:701b:2906:b0:141:4a06:ad6f with SMTP id a92af1059eb24-1851238b5f2mr11785078c88.8.1792413974419;
        Mon, 19 Oct 2026 05:46:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm25845295c88.8.2026.10.19.05.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:46:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 05:46:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ximing Zhang <xzhangjr@gmail.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Fix handling of isolated SMT siblings
Message-ID: <cfcbef9e-82bd-4685-85cb-25d17f2483e4@roeck-us.net>
References: <20261016-codex-coretemp-housekeeping-v1-1-96618c5676b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016-codex-coretemp-housekeeping-v1-1-96618c5676b2@gmail.com>

On Fri, Oct 16, 2026 at 12:36:37PM +0400, Ximing Zhang wrote:
> From: Ximing Zhang <xzhangjr@gmail.com>
> 
> Commit 0f8b916bc5b5 ("hwmon: (coretemp) avoid RDMSR interrupts to
> isolated CPUs") prevents create_core_data() from creating temperature
> data for an isolated CPU. coretemp_cpu_online(), however, still adds
> that CPU to pdata->cpumask.
> 
> When an isolated SMT thread is processed before a housekeeping sibling,
> the mask makes coretemp_cpu_online() believe that the core is already
> represented. The housekeeping sibling then gets no temperature
> attributes. Package attributes are similarly not retried when the first
> CPU processed in a die is isolated.
> 
> The mask is also used to select a replacement CPU when a sensor target
> goes offline. Including isolated CPUs permits the driver to retarget a
> sensor to one, causing subsequent sysfs reads to send an RDMSR IPI to an
> isolated CPU.
> 
> Keep isolated CPUs out of pdata->cpumask by moving the housekeeping check
> to coretemp_cpu_online(). Sensor creation is then deferred to an eligible
> CPU, and hotplug replacement targets remain on housekeeping CPUs.
> 
> Tested on an Intel Core i7-10510U running 6.18.50-3-cachyos-lts, with
> nohz_full=1 on CPU 1 and its housekeeping SMT sibling on CPU 5. The stock
> driver omitted Core 1 after module load and retained its readable sensor
> after CPU 5 was offlined. The patched driver exposed Core 1, removed it
> when CPU 5 went offline, and restored it when CPU 5 returned.
> 
> Fixes: 0f8b916bc5b5 ("hwmon: (coretemp) avoid RDMSR interrupts to isolated CPUs")
> Cc: stable@vger.kernel.org
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
> Tested-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>

Applied.

Thanks,
Guenter
