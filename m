Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A137BE9C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073586; cv=none; b=rXNRCqJxKmitBYkB28sNUXblOn0fLnk6jjCOBZtOI2h1l/4ymSr5molWi51NiHoDQL/7y0OqSTpXMz9YYgSVVrzJP35xOuGq0GgXYjOm6HS88C5lt09El7z0sWC1kAgDSEGXMzlT8Gbw4crfIxTFoGRs9mBfqczf4KMP5zE4bgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073586; c=relaxed/simple;
	bh=4myePDbGOuuvFHg/eT5rjXj67qALj6mkkV+jO0qZ1ho=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7LvWKMseDq3D0cuzeLrxbJSKsDQQsW8Gj/q+iev3Tfu09SHlVlARS5JlDVv9wFR2JpE6UHTQzcMXPo+t3rjr1HQhdQUYjnfwPAF9ica1FjRPBQf/B/792lXBEk3usxei4zc3vnvJOAwTjbXffoVuAgdcBLxK8T6N3+56k9RCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMDGbFsy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMDGbFsy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso2390615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073583; x=1789678383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BCq0kuHs1j0acWRuibtXq3pLZmgmsIKMo87HdJz9dU8=;
        b=VMDGbFsy6VMjqvGLqOaUxZGHQrYUg1H344c6DejVFMBJXEOFz/QKXHkB+dyqwTjZsN
         nbWBolb8oFeMoQDB6AahiL/6jjYzWYPKNDxP0XZpOVFNLZaFm+Ft3eCHUbZPbTL9DCSR
         fyQlqujw+CHCHtol2vCocfzGTbgFfiMSXaBMdCKI5p0f2XZrGR07GzqAb5eF495qpGcg
         TuofGOFe2NSrZKOOEnV7EE1dIEI9Sga6FEUKPuFiV1Ip6XDlcJ7jvNLpJsLFQxvcQNoP
         uhD7CqeUGXZNL/lNq8Dx2hYxnDdn93EAnRomu4pS+Q+eOzw4u1gfZUbJTykLWnn34NU9
         nEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073583; x=1789678383;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCq0kuHs1j0acWRuibtXq3pLZmgmsIKMo87HdJz9dU8=;
        b=IUgpGezOSHkV6MOZmQmWxgPgycAlN5EYRxhOeWIvoIl5WS0g1DwrWt0n9O/7dFz3rV
         hW8uNLjHkCko2vVTA7snn6xU0WJoHFe+ZtNv8rucFb9aF6Tknfm2jiNyJRr7xXiEPyjb
         rEBo0iJLsJyvk1NBJrHKwARJg5OMzhZEnI/RMxRUudPHMSmsNn+4xeIwOiXazOSlgeaZ
         7NgHMdiJL3wN+Vd8oSXYUFvLT296RqjnoISKIu6ui+sm+ZbHiqnBdURwO4J4ye0jfCel
         ZtOFLyUmL2TpjN8LR7p/GrAiwHeAn1OBaTvw9bvQax0TvmxYId6Mu4XjIsJkXmV8U0Sj
         taZw==
X-Forwarded-Encrypted: i=1; AKwUvBz3Xrfhp1hkui+I93ogOGqHXNRE7QPXoN3+2qZts7CiyPpUIZ7YDNRMeMuOgr/Ofqi109b6RMTSz9w9gXU=@vger.kernel.org
X-Gm-Message-State: AFuF++ldDyZXzw0QaDCA6/ee4jKDsBm6+zOs5wb5o6IK6yyugdmJmWI2
	0cU66zD47drP2HMi/jI5MKVTyxVhCSFF8BokSN+Z6FzlIhpQl/TgIkRA
X-Gm-Gg: AYBFou0HHD92vLhv4V0GfTxETQ6Jm+2Y2kWeNLjfIUhFs+Dcz4csdT7MwBZOnfN2Ao+
	KiLYsUH0470D30SrUHdLaDE3Wx5o+7LCvQyK+9qCiiqpqwkO9tS6KebwqWwL/t1/S+PP2klPZoG
	COxYsKcnK84KJd/asMr1wWNgxcHmr9MX4WqvRMyNniBksqKTomtX6RsxxppPme5Lrd6FctiIV8+
	/oFJ9Mbz72HHsU8BpVBfqM5c2g9dfTgjkuODUEMWN6Jw9IGhlVA+WZMwiOfrWjGNDqROkIbpL8H
	kdtOIud4P/iDGUD+oSxPMVBPKZ9dWpaz3lFVkYHipMr6u6mjm/a2xldjAC2+OTkynmdmDwjxCkS
	2kUNdLnYZI6qroipZW8bzAkAXvCqtqZDHRyJPyzSXCalrapQbMR1Z9/9u8vsK1R8Hv6zudnIi+N
	3B2WAl7Un8F5j4Pq6KZTtnBCfDeRiAUTLEVdwXuexlZf3eYii4Q8pLJ09WnnKpEJFeOZJOHxhMg
	fMzf1xC
X-Received: by 2002:a05:600c:1385:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49e619bfebcmr7617295e9.20.1789073583150;
        Thu, 10 Sep 2026 13:53:03 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c38e3asm106663825e9.9.2026.09.10.13.53.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Sep 2026 13:53:02 -0700 (PDT)
Date: Thu, 10 Sep 2026 22:52:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Curtis Vogt <curtis.vogt@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Pierre-Loup Griffais
 <pgriffais@valvesoftware.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "open list:USB
 SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <20260910225259.66b480c6.michal.pecio@gmail.com>
In-Reply-To: <55918a70-72c9-4f55-934b-81a692d4619b@amd.com>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
	<20260910170254.833871-3-mario.limonciello@amd.com>
	<20260910220421.40356e51.michal.pecio@gmail.com>
	<55918a70-72c9-4f55-934b-81a692d4619b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 15:43:18 -0500, Mario Limonciello wrote:
> >> +/*
> >> + * The headset's EDID service is lost when the host disables the DisplayPort
> >> + * PHY during system suspend, so it needs the reboot on the way out of
> >> + * suspend.  Doing it on the way in does not work: the headset dropping off
> >> + * USB is a remote-wakeup event from its hub and aborts the suspend.
> >> + */  
> > 
> > The internal hub which will be quirked by the next patch, or its parent?  
> 
> It has to be the internal hub if quirking it works, no?

I believe there are two separate problems here:

1. resetting the device at suspend causes instant wakeup
2. a few seconds later the system wakes up anyway

1. is solved by resetting on resume rather than suspend
2. is solved by the quirk

Questions:

Any chance that 2 also solves 1?
Would resetting on suspend be preferable, as the comment suggests?
Maybe it would, if the reset can race with DP seeing empty EDID? 

Regards,
Michal
