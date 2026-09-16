Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB1383980
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570842; cv=none; b=SPAa8uyboBVAkCpu/h8N7NKk1qKtVmzfP7cBhiQ3imssyDH8rXlQLKpfIdkQ53rrAwh5tB3OSscxgFhfzw24Us7Jz3WAZEvW52w32AvelMO+lWGDQRKBy3sa4geNx4F8Yh8OkY7iOiSzztzUkJR0FHIZjMlXj1z3Fg8GBECC/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570842; c=relaxed/simple;
	bh=uU04HW0rlwbhgWn7yH5GWNie4AC/PYWKfZPU/6xM78M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+O8u+72j+bRMHPma1eFT5JrDCFmy4Kzt7MuaTPeEvPdlTdsNP09k42O1h86pAH4uBzayFD7Ebs+GwlWwRFScAQqy99+DDGW/flXaFAUmTlDQ6exw3F8jTyeZzNri7YDceYVBG08e+18ZEzn/wv3kRjbQNcPrvE2cGc3HJqUh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldLV0S2T; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldLV0S2T"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-853e2610bb4so1418806b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570841; x=1790175641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UxeLBpawt5FLZ4rmHBRsuTB8sPX9iH6xiZFrfBJ+a50=;
        b=ldLV0S2TDPBfm9mP7nDUmw2J+2ypLJo1/qe+fdBmPnhXWhk86x72csVvvfdxm0CPAW
         64X+yKOPIUfv0jsRUYvlcgSvcqHVGPbAAqHH3UH9F90ql3HzBSu7KjzzXR/RRdhoujtX
         rJTYS4GSltXm47eeny1tRdPsWccdgIpkCbNVUwva6gS+1+QlCvOXoNHfeM+YjrWin6Ku
         V4sm0FtMRhly4syPid4ov9y0fSM/T5U/2vkRF4OouB3r6m+ARZ0rmNWO5m+WSGIUX44B
         a/dv6ZVCfAz2RL0OfBdcUSo0o3t3SP/7+Dw3O3CP0zVRh17+xrFClwOL+0hVOXhH47w/
         7r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570841; x=1790175641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxeLBpawt5FLZ4rmHBRsuTB8sPX9iH6xiZFrfBJ+a50=;
        b=CHC9PiBjWBRFU0EFzwvQoOMIfNIksmehS5q6lzWkRWvpLnIXPlp086SovRKdaL7sxw
         zWhX9lDWfw7BvmqJCa0M+GVbQHfN84LiiTo5H2Dl4EesoADuaGov9v5Wl/JvVjCQ7/rR
         stKOFI6IAB8bZho5rOl8YmlT8MPt1uWe5i447Lyd5L06uCdi34CxhqxOUikTnxosS0Mr
         fi9SvSBnD/SPGcgJ1JAgDzfar4tewmWzIVjtQA28qmik78FuiweByDWgOhpQYUf0IM7S
         oIriUHD0xbVN2Qh7W/RlVbHeofUrLCW9RjSt+2TCER9gpU9yRuLieqLNGTfNJqaP+hc1
         98WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX+7op1RGuAzKbC+3Zxp+4G6alpHIlcSadyKUoNmmJXhvUArjP7J3IZbACVdjxflin82TJOyZ7WJ2E8qw=@vger.kernel.org
X-Gm-Message-State: AFuF++m/wMMAuB4NoInm6rCSFlLrbgvO0o0of9eWh7RnWREOTn8qypY6
	E9DFYgTa0+YIf7Er2ckv5ZxNdEsnGdyVMScAxdtVN8ioB6Wnh7IecBXY
X-Gm-Gg: AYBFou0Zdjem2hVMSbENdBIs6YO3taIsmLvUIzsqDWfrIdZcenooimrmZlr5FcVGlzF
	Zn6Pwcr472dioN/XSAS0dIWU/RJeUnPniXHxeYZ5c7VeFe0mXE9fOg4/QRnf56PktWw/005AcL0
	zZQcR6tPKG1LMrdSO9IYSmE7/1YbXhkFHx8IEVlgShBuBlBaU7Uk8fWKQnHSfpdSEbyRHBN40gf
	g23d0zbyvbFgRGkIytruDR6dWd2dfMOgfbUQEsHwLKRk/FaE/Le4aEkCfOzOq6jNLF8NZHD5av9
	C+L2HDU8cOctPqv37Ra9qPAZ/E13gFQTQ8vXQ1m6n0dcZ408U/2yBx8UuMn22ECKJnu4EmC0BjW
	FCLRLTgmgkIkp+MdLiZ1yUCV3YMCKRi313/q2osQtIaZpjsuN+ZaXnzO0aKZ0unFvsMWKZhIzwo
	ZvUMPw7RIdE/vF80XilNOjDdoqb+gR+Y/+V5LHLHALXWBs18ngIYJJ92P2cYBfZK68KJUvNIgTa
	3SvkzQ/ZjEE
X-Received: by 2002:a05:6a00:414f:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-8708981c156mr10606570b3a.1.1789570840509;
        Wed, 16 Sep 2026 08:00:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb30a3sm1719789a12.28.2026.09.16.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:00:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 08:00:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Luca Tettamanti <kronos.it@gmail.com>,
	Cosmo Chou <cosmo.chou@quantatw.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: use named initializers for acpi_device_id
Message-ID: <2b837c9b-791a-4465-ad7e-8d9c7329d41f@roeck-us.net>
References: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>

On Tue, Sep 15, 2026 at 02:48:20PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Applied.

Thanks,
Guenter
