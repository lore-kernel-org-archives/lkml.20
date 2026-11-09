Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211776;
	b=q9MVeT/gbyMyhCiFF7gqEI9TzcgAUt5RobmzFRSvLCqMYc39K1+HJF5H5CMGomsGd2nG
	 73GPYLxm29imNEsr0pVTqX4lGC0wpHBqtSoeN+VTozg5ep5GmM3vJ6JLh8GrPsa6ZrIK1
	 ckbFEzGlubTPKM/y+niWyogiY8Z9pJhGH0w8oRkh30G7WrKEBy76vwufpthIJlekmj80K
	 yvJyx+jBMJvQYnIESzwvEvQotq3g60RecSnumbezW4EyBt/FLpaGBpbDEcpz9GCTN3i50
	 v4QHwfW+n4gzF3e/v2FNX1ifs0Kui+o1GCHJvJNLvgGAS1+2GgF+3920DwnPdDqjo+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=JsDKGMOU9swp0GAHJV/6e1W8mjoZhe2ZCwScsI7P9n0=;
	b=awLGss/tWH9EBCXxtw+SrzeS1pIx+woXQAAIq0qJxzXvUk1H62V/Lra9LSy5JbmzAJ9K
	 m/mjnOu8JjpTpTTyBJVgJPqJBQUCfLHtvC7fgSr9EpU+VhSw1d8W+vIjRj2BxARFbtqy8
	 3t9Tt3KdPbNkUb9/P74BW8T5oDlLS+aAtSN65l3ievBQ1+iA3H/q2edkX4MmlzqGzi2ru
	 amuXrBFIOM+YYOfUtRcfrXGqVWilkzGSkvv2fSlI+MRszWl1eE8qO21p6Bucsv1t+o8pL
	 so1USs4CiSKPjpBF+zoyEuI3AZqDyfJLGR8FdivMsxIZDob5f+ECdvgKW3Nrw1MArGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsJMeHUs;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21C606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B21C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsJMeHUs
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37198ed3727so848575eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211775; x=1794816575; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsDKGMOU9swp0GAHJV/6e1W8mjoZhe2ZCwScsI7P9n0=;
        b=vsJMeHUsuLmuwRFGQWjqexyf0lMs+FFMbp3YzxktWX9Z7Hfi6YU9iNvv99NilaFmcx
         xXZHfM2uVf0gfScXZEPRmTsPR3HA2Kypv3FxakX8i6MaX7QobwzarLkVMb5mpJcsL2/O
         36mMZm/x8VV9jOsWP4EKWkW3PqNh6LwEYAcY8iwXDDLu5tuH7e4IFIzYxOiG7ATzUeSG
         Pf6bpFOpzZ+47UMY2JH8+Vmn7MWhPq2EFybf6Ymu2SNTcUfCaY4XpOv40hnz8qbKrAiX
         gvFPjcCmSohdpDRIK2GPMUPUXhHYK2j0wnWNkDq8MqTkKsNv0c1MyzdPjck7tTFoA2ER
         RhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211775; x=1794816575;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JsDKGMOU9swp0GAHJV/6e1W8mjoZhe2ZCwScsI7P9n0=;
        b=R9zGKggpbS2qFr2vHrhdDjd+9DScKNu5hiLLaUMA3MNZ/LwodCGmwIc/xAVTDVyxPK
         WIeUOfK+aFgtag+2LGd5m9IOepm4I93anfhX8Uq2Nvt4iCp7e575hfJ1yk7SyHCCwewg
         JcRlNaHt2RnVOwclSFTmNFZE4zFj3YTdz3Rs/X2Ab/y/9Z/b23ITnbl63uNVuc2aECsS
         9+IIiygQUqRAI4uoZeMXpOPiB25VFGpJMD034rLwzn2V7BHSw3I/3UF8EeLdyL2X0qvo
         ig7iF9UbZckFHvbzIWQOOgb4eJ45tlNw0y9yiKCgkEufBprwWE7d8gZkeyuWHvqthH27
         mTlQ==
X-Forwarded-Encrypted: i=1; AL+hErEo+eJ+XbccPjuqrbDBT5MJJE88f90Jzf4zyzyKtWjBafRiUHYXLjMXJ/mj8N2+rRhuV9Q2Goi1De6nNR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6LqGxoY1e4zi+NLzd9FiMoCmQdbkxg0T8Y5nP9Nm1EXpfJml+
	U2qyAhok90+IRtGG93f4aZzALtWjvQySaQe8+iLYmgOTIxRcWlfIeJj4
X-Gm-Gg: AYBFou2vgSm12H3BHhOg3ptQs/gMuQy3g3vnfaenUEWJRd1Mh63e3hQ6HeKtNZ4uNJz
	34bR0LkG5UCteZOeQnwWLYvkCQTZQ6ORRAuSv9gJhllLuwmCRiZxDkdQba0qgIuAwE8l4psTL/S
	ZkrG9tApqVNVdMgVR8ZHh2/h5YVAb7sRj5VxXUGgs83AC0vViKg37tfF2ID5TrJ84SVU9l9uGQS
	zx0TPlvEEOeKjinldHkn71nZdKzHOFk8Ec2iCIpsqPlOUQHk4wZpmquavsIojRkQHYx+VSpKOOq
	4EAscK413oHy7YRkS6U6T6WiCWSEcpvWFA4ze5rYS4zIOnIqRrUF//02pcCrDUVFF7CcriIvh4x
	NXcLoZZAgJactkaSO4EkC/8uJSuw+wiLGOwL5+pgefswZTZw3AwPJmZ5kkhBRiaTjrmuh0wFBbq
	kByf7WYFwyZYXkqZROzpKBQV90wqqwVMSXbqyXDZTq+MFbWSnpugsBGQQNPMbjApzMpB3wjQN/7
	FS/p9SE1UVRR3K8Qv/ay0iBRnEbMrwP8/Z9KpuC71aN1faq2+rDtDumlJnjMc1JIh2ri2596Kg/
	/A2tnJEPuaZuTXNOWxvlEnT0tiQImbPdyb2s6uYcjSYD7UhTwWbDJ3MNkbeP5sFFp5dv
X-Received: by 2002:a05:7022:408b:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1b39fedb95cmr5006800c88.23.1794211775040;
        Mon, 09 Nov 2026 00:09:35 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm10241765c88.15.2026.11.09.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:34 -0800 (PST)
Date: Mon, 09 Nov 2026 00:09:33 -0800
Message-ID: <e9cf3745ebc09bf04ce0bf75b67a31f0@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] Input: apm-power - Rename to apm-power-input
In-Reply-To: <20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org>
References: <20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Nathan,

On Mon, Nov 09, 2026 at 01:25:26AM -0500, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to drivers/input/apm-power.ko and
> drivers/power/supply/apm_power.ko having the same module name.
...
> Rename drivers/input/apm-power.c to apm-power-input.c to make the module
> name unique and clear up the error.
...
> We would like to take [1] for 7.5 in kbuild-next, so we would appreciate
> an ack to take this directly or a stable branch that we can pull in.

drivers/input/apm-power.c only reacts to EV_PWR/KEY_SUSPEND input events
to queue APM_USER_SUSPEND via APM emulation. The only in-tree users that
generate those events are the legacy Sharp Zaurus ARM machines
(spitz/borzoi/akita on PXA alongside SHARPSL_PM, and collie on SA1100
via locomokbd). None of them were converted to Device Tree, both
mach-pxa board files and mach-sa1100 were marked deprecated in 7.3, and
Arnd (added to Cc) already has their removal queued up for 7.5 after
holding it back from 7.4 LTS:

https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com

None of the remaining ARM platforms or other APM_EMULATION targets emit
EV_PWR input events or enable CONFIG_INPUT_APMPOWER (and pxa_defconfig
already dropped CONFIG_PXA_SHARPSL in commit cc7852314abd, leaving
CONFIG_INPUT_APMPOWER inert there).

Since you are targeting 7.5 for the modules-check change anyway, let's
just drop drivers/input/apm-power.c altogether instead of renaming a
module whose last users are going away in the same cycle. I will send
out a removal patch shortly, and either you can take it directly through
kbuild-next or I can put it on an immutable branch for you to pull.

Thanks.

-- 
Dmitry
