Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462405;
	b=mAgnXnbQskrf2JCeGTqLxb1dEfwj/Vb3vTCghHVqTseH3CsTPAjeCPvDOMwnunJDBhzw
	 a4zvLNBTXYq2Ky15MBTSA6mH/ZuuQT31SGEDanbk1fzsliucq+tEAXsf9eavg0O8fdOJN
	 k+roTy2xeyoTxtZu1e8XDMql8M5Eimw3ub8MfsKx4U9qczjUBWYei/hZ3R+RWUfM/nLdQ
	 3aggr5/F/kgeUWlxR5k/eCrH/KidFREeCu2wOs0rrXZACPn8GOFMyal8GGlIvwr57cHnU
	 C1Rl+U9OfL3kU7yEU/mnuGmTpefiPTc8sa9NSCJCWD/BF8uyF74uLzRuPColFt6YqbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=+13rBtkeR+s+DndYboZRmZoW8VMp8Nay7Rh+6kbD7E4=;
	b=wRN7tzwubOXAJim8K9F7xZTEKILzUFgPqFT7UhUxI65sr7IjsfejghQh0YvluE5Adoet
	 Y3D8KAF/02vs+7FuRI+HHxCrCIORDpNK/2Eeu1wipe34pI/cM7Y/pctRBooZSg67F1AN+
	 4j4zV7WEvW62ZFXWqRQV03+ANwOgbYpuPEUcr4cbLECPUc7ETuFCMaT2LSiXE0nccmNzw
	 FjtHvujUcQiuM/Dx0eXY/IoFYTwzS9qoVfYzbM12QTyxwBSkpX1zrLMkvydnZdFTNG5Hr
	 CAwa0Fy84kMfjVV8VRJAa2IHlwv05U6nC7DUoHoWAzF+xGj7yCoCr+yT3IkL2VGDPBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ny08dYQg;
	arc=none smtp.remote-ip=74.125.227.199
Received: from mail-pi2-f7.google.com (mail-pi2-f7.google.com [74.125.227.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A43606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ny08dYQg
Received: by mail-pi2-f7.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso922374a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794462404; x=1795067204; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+13rBtkeR+s+DndYboZRmZoW8VMp8Nay7Rh+6kbD7E4=;
        b=ny08dYQgHyS1aoL7W3IywVpcNJWKttWcUi4k/lbUwGHcv8kpm1AnQppcEQESH4qsAl
         i0jj0ulIpHhqKoRw4TicGzk/Jarc9xrheuql3p1WoWRjUhIiWMe20FPzqBgFtisU03X7
         Uj1Jxvu7iex+W9YASHDgYL3Nyb6ECgXtvm8Dwu1Q8ddGIPunf3OSOP3xmG4FV7DDL52D
         HWW0O5s9fcmKOvBaK3LXUceW1fEZNMCrTZmqPvtMnw8hm97mLexoNLlfCJKpqfK1JFNF
         hqmS8oDhNzklm6KorH43IT50dxSWy82uii1p2X3DGW5qo5P2o/Y4rxX6zHYSE3+BTx3h
         yQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462404; x=1795067204;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+13rBtkeR+s+DndYboZRmZoW8VMp8Nay7Rh+6kbD7E4=;
        b=xBHlPHW4TJV0P19zih6u+59jZKHOjmo7muS35vfaIIxOdTUKRUkQj4L0mZiv7D2xAu
         twCGWYYUuO4WMfrVgSEkcnRJDXwWxZLU4d365DZhRzdvr6Aa0653fF2yWsedHVJ/RVgD
         Jryb1A/1PLl6v8y8pD9sVJe0lhq8odAghMiH5Z61/WrCJk7c3qvsC1pIYUehSwkx77UO
         iwGzJmgKdGG1pt0+yNUrArQYRgciHEL3BN92gbIL0PgMP1CBlHMDLgiiOAK6lMh0RJPb
         YxfzLx8MXocwCcHe8hYD7DR7QeY4cW5JxEudGifOqawqQ3IIJaRiTlaq+nW6S6wWBAwX
         zH9g==
X-Forwarded-Encrypted: i=1; AL+hErF9FqeaySqn2vRyx3zJMCkZ2w0ZJY/DlPudT8174hhhlxTSPHUP5DUK7k6NOiu1vfVtZwzur9ZQa6MFmGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DKTNchvtO+GQM0pWAGHJQG2iE8sTPY/fweAHLZ5RO1IEwwV0D
	X8ora+3uv0J73qCrNoKHIgnSqXaHhvocEPEYIA2zd169UQ1pfKU1jEqqP3RE2XCxfPCZLkTy
X-Gm-Gg: AYBFou2lFUiV6TastqiAuTn9Z50elynxaA1WLthNQF7ECNJmm5H+A1QxUtHtaI6oZOE
	PSHPtWhcoo+IshxPVBTUxRp5vw+R7JEX1S3bknOSNcKKsrm/vy2u8Kg8hN6a0dgYJXl2S/1iq+k
	sGdML+DM4k8rt3YNTPp7PhHtndSS9IHqUDSJWn42Xzgt4pKZ+v8nW/lOjWrjfDvDfLs/RauECq8
	OTDXh2pdTmMykF27EYwZ2b7szBh0u4e/cRgo2gPoUyVJF9U8GV3OXQf7aASrKMhzv1Vy2urMfPb
	mzbJfEpw6pK6kVIYxvil2F59zAtKxWKFdEnH1Tzbfa0ijO2hXzV4N1QYLdmJqFpk06KRFImPxk9
	xr2aDROKmJmap73CoGSnVBN3muCPcU/TOhiQ1+/h8ydFDlhov9JWOL1xkYXyYqlt3DCIvZbF2bk
	tYdNdlZyr2NHBrF+Uab78+9vdJImRrQ4oAp256ig9tD5CQOyVFKhFcjpQL3NCYdgse+NaOopeY8
	63zHSIafUOiIaMnqvRxflRtkAXFDT6AIyJjSNVh2yjzSRGK9QLKjLXLSj3pu3hJLq03ErKrii3a
	e4ObelbW1bvQhUgN2gfDGBAdBjRseJ5HIo5Tf/f8Ty+At3Wb+mEt0VkNFWrUM0MgBRYQ99wbG3t
	hkIn5ihjFGbmBge4T7/1U4n/4uw==
X-Received: by 2002:aa7:9a86:0:b0:8a0:4032:af85 with SMTP id d2e1a72fcca58-8bc16651ea2mr4128251b3a.0.1794462403606;
        Wed, 11 Nov 2026 21:46:43 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm2776591b3a.52.2026.11.11.21.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:46:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v0] Docs/mm/damon/design: document data attributes
 report infra design (beyond page table accessed-bit milestone 2)
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 12 Nov 2026 16:45:39 +1100
Message-Id: <179446233975.762943.16115029371266375222.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261111185412.145514-1-sj@kernel.org>
References: <179438255225.3134195.10613668244848761847.b4-reply@b4>
 <20261111185412.145514-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Wed, 11 Nov 2026 10:54:11 -0800 SJ Park wrote:

> In a real implementation that is aligned with the design,
> the probe will hit if a report associated with the sampling byte exists.

Ah, I missed that.  Thanks for clarifying.

Thanks,
Aveline Noir
