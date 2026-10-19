Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424382;
	b=MrnshFTqfx9alrgv2RLKqLLxcfld0FF2mtB4D9A1teBBD3Rjj3rST61Lqeyl3PUDurgA
	 R7524wkNhbFKhYRIrkVXad12BpPWkYsQSmf5T6NhWIOyKxVY66SqXT1N/YQJ+OeQQuJ2T
	 THF13l1LvB9zplv9mq2ea6CoUOLFQmZm4LS4uPU1yGrnJAnbTJF84SiIrKtNUglJeLP2+
	 wQdps6iGt7evtiQqrt0fRjjErt18iwmG17MCueMxbeSSxxbdqPYVVWNSLcMk+oaN347hQ
	 to2tvZTaIVEk+n0DxYC0bVJ8fUKahdnpwJeYZB5aKeQZ4P8e2ZPltCSMNeWGBm21eOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qw9dGjmaG6kOfbUV6pqCrbzsxSdjzC6KiOr3TXVHAIc=;
	b=SUw64I3ESpX2GyMMtuST1DMQRJ0noNMu0JPpzQwBg2X6+jDO5edB9cgbz+cNgnv2hgTa
	 DU/YQxipWR/OjJKyk1hgTOB0/S1LolwZL+XOxUdiByPyDtRh2XQljmNzwAOu1Y+sgw4td
	 MvAD7CCaj8vM3nWpDDfR9QpxqhlRF60+CDviNr81jY5EDnHQzczC+IMu6VHRXlYEheeu4
	 GisUcloTWOxXeG+P8eUl8Xpe8BAc5xnuN62P72BLUfdsb4rp056x3vMXKsuB0JJrPGi5W
	 VsAIeVa+VE/rmwAHJaAcqXySg/6LkZ4G9gPQjk7Xiemjf6xeWqw9wxY8dEDh1I10w9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPPpiVBn;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F0606C15D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6F0606C15D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPPpiVBn
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f432ac553fso1531829a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424381; x=1793029181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw9dGjmaG6kOfbUV6pqCrbzsxSdjzC6KiOr3TXVHAIc=;
        b=BPPpiVBnbEz0KPAPJJXVAcRRm4jSS2MrTVVnW1OPLNrA5KbHCOQ4q3OHL0l7yKqug1
         4Qbps9P9D1O/smmGRQ2i2eeXWVEz9FPBCj/9R824TA2xG26IU8xhC/S3v04anM/4OsD5
         hRck8AdDJBZzAsHZxjpqQbBqv1il2fO5OgQgDhpGolCMXnSqaaEuu0F0xEJns1+JDCwu
         yT6rxfX5pQyvkrLN2MezPerJIAmcveqSbfk1debKKF4bmcm5Yw/GO/WmSIBJc9ZBJTGW
         DfQGWmzrGYfpWUMsNcPOzyNtMJIKZvN5zeCpQVVeXzolArqL+h5GB67+pb+B4cyE2N/I
         cgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424381; x=1793029181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qw9dGjmaG6kOfbUV6pqCrbzsxSdjzC6KiOr3TXVHAIc=;
        b=LR5FrJNAukKbwgCx/7QzbHI79hPFCErd7sTtPrBCTg1n+lFDifaM7/NW0b1I69B+/P
         Q6QKgZmq+0UtlHn7wVhthVNhC70eTHqunCeCu2BbZYzSy/WTizqm7TtwQsoMYC/OE3N8
         SHfxcUte70qevImtyRFBmP0OepXCwMW8fxC5LV0C/pxl63/rAcEBBBbuevecf58W8+hh
         grs9OXbH5lUo9UCOs6JbWx4sGYyiidYkNuKLriavZkhPCTp6QUcm1luDv8qpNESY1/zH
         sbP2NnQneEQqXsl7pjNdqDMR00DT8Q5/NpieYvzjNZvYkAb6tJnIl5lv0Poq66WVrF9F
         T+Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxtxmzbLXvrTXl1FD6W9hDcYZ8TMiFpO84Bdb2/4mzfVCQxAIise3JB3l9ttBmQQmX93JwNh5m8DkACe/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJygzUp6XLY7IwmLEEcHNq1QXjEZsl+IDewufOTMhCBua927Mpy
	8mm93HF673Hote+hcWsH05Kum5Z0L7BxXD4AwKxAoCGfEAYqaxIkVsBL
X-Gm-Gg: AYBFou2iCSjUwvC85HXcPKjvjCwgcxMNtrhO4Aq636yplYMpAk2qZGKRMdzOMasrXe0
	HavA4y8paESpt3jnjYia1fivwBJwyK/B7gilPbdxZpE+G4KoWP+2m/Q7PmGldqHH5+UIQESs/0/
	+LdbRFlTkJtintOW8nrfY7Div3+La2oI0NaZkN2dC1lWWn44QrrnTuVRx8dbWGsJSKLchSYbavW
	jgG+5L3d+pQFCT28LoFhVPH+cIKuXfeUDgad/flF/QqURjLuuYa34HeXXP3lRi8Yl5fI8WGEc1p
	lT0naMHr3GeqX43XLevKh9AVO57G+nZUejZgM1eJBqhyu6fTm7jWPgd2axUz6//8jKXRGVtaB7Z
	CQ/raR3GY28pu5LYUojd0obbobRPUUZ31IfOALv9dhcQEjZ69+KA4ChG9tUdNpWjsNA7QVdTL/x
	m4iMf0DXnCqAAYCXMBmlaQBySlHP96iWBIHBrHRiS36dtKYfJePjAMceZUOjC4E86XKtJ8uz3zi
	4vRDOBG0Ex0d17zcWv2zDsnvN8X5CDqIdmaIV734A==
X-Received: by 2002:a05:6830:3495:b0:80c:d30f:978 with SMTP id 46e09a7af769-84500980620mr6640234a34.25.1792424381178;
        Mon, 19 Oct 2026 08:39:41 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm6706057a34.19.2026.10.19.08.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:39:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [RFC PATCH 0/7] scripts: convert remaining Perl utilities in scripts/
Date: Mon, 19 Oct 2026 12:39:31 -0300
Message-ID: <20261019153932.27283-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87wlrd932j.fsf@trenco.lwn.net>
References: <20261019100505.3199861A74+hca@linux.ibm.com> <20261019133452.4826-1-breno3011alves@gmail.com> <87wlrd932j.fsf@trenco.lwn.net>
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

Hi Jon,

Thank you for the detailed and direct feedback. You are absolutely
right, and I appreciate you taking the time to correct my
misunderstandings.

Regarding get_maintainer and checkpatch: I was completely mistaken. I
conflated the ongoing discussions and RFC proposals with the existing
state of the kernel. I apologize for the inaccuracy.

Your point about the maintenance burden and the "consistency" argument
is very well taken. I see now that "consistency" is not a valid
technical justification if there are no active bugs or integration
requirements (like Sphinx for kerneldoc). As you noted, people running
the scripts do not care about the implementation language, and I do not
have the track record yet to offer myself as a replacement maintainer
for these tools.

I realize that my v2 patch for checkstack.py falls into the "change for
its own sake" category you described. Since the Perl script works and
has a stable maintenance status, submitting this patch was premature.

I will withdraw the checkstack patch. Please disregard the [PATCH v2]
sent earlier. I want to contribute meaningfully to the kernel, but
clearly, I need to focus on fixing actual bugs or making changes with a
clear, undeniable technical necessity.

Thank you again for the guidance. It is a lesson I will not forget.

Best regards,
Breno
