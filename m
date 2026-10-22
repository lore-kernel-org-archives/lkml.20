Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691259;
	b=CXxWdQfEidXtqv//JvPK0Ph01KM7GrPA/5njJcA1odzhwNLw4gy/uq7sQ0MiSv444hPX
	 yEbbIQ2MeR8ZRsiF0CcI9OpAEPrXUsfCGcd/HFvaVX1fyYoNsL+xu+VVps6D3rRB8HeNH
	 BPDd1OBl7Gq4jptTXYhGmeRIj6c4Z8jHWpG3lI2PX37TXDOM+RJKzorMOuJeLDJeSbJ6V
	 vHpqNQaIEimTGqFSFVg2cG7IIEeJgkLwRglBqJhZkFgwSyoxAUvNeNT9M4VlE/V1+HZpx
	 llvH0ze8vF4lWiuTgjEANfbRxLt9HCIpaqDM5r3xNtoDc0daeyolzYpyYgCPkXtDfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SCWBGn+DbuJPekfhEu4uXLYMGCLHZ53aEkUTCOxglzU=;
	b=micHoTM7wKckUajNaVG0CCsjZuxT61Z/KiWIvZzJppmWAqbLVXGpVrC6HChoYwVNTb+C
	 Yiy6BirMIyut9CcGHWbOYordQqoUPJsBQUSwoBS/l0WeSiYvcQOYjOa5dJC2nD/DJKFjf
	 /Nseb2bKA2uVJ823mdEMkDm5OAqyxwy6BKXZ84Pe1tmiARC18Cz/J5/L0AlTgLSHKtQOP
	 ByCqJIVNUOxyTFGzHMIA5gTV/snxouUW/iwekWhKkaIElsJaIcqPBgaXfAXWaZ6UL1NqY
	 Wwf0S/C/mSPwYQ8hRsoPo3Q1hZBubneUy23rXlHwKDJMCQTFn+jKQJEUcF5cDxapgyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAD2606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAD2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so30836c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792691258; x=1793296058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCWBGn+DbuJPekfhEu4uXLYMGCLHZ53aEkUTCOxglzU=;
        b=RRvkm1u8IQ2Mlv0vsEHcUE6HX3QGyQ0zuC17cFWJH5zKzqe8B2RbjaeRf4virWKdfi
         BxvSMALrfPAT1sQvmdnR9hn0E8NkF0DPFeIIZicEO8qpgQ4YIQGxDGKxo0a7LhN0KIAb
         qrpZ4ahpNCVhO8d1q5QeFzajGWihKNT++R1NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691258; x=1793296058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCWBGn+DbuJPekfhEu4uXLYMGCLHZ53aEkUTCOxglzU=;
        b=WdtwPyq4BrwepJ7Abf+/8UMd9S5pk7mtMazeWk1WNjYWChKOfbz2c0AcWCs/o0TMnM
         Bh6QyEQcncUukOR9QsK6+UcZQTGpvu1KDu63TcT3iuN9ZhZb6+oSLqEM9yXrDB07rQIT
         DdIoKtaGEMuSUXPZ8FAkxUscQHUdJGdP7hsnf8dZgMYxD5D2N1t0iybg/RGHfM37v348
         VRGRhZgbSsbig82QDyKdwQ+Q4uNgXimnhPc56MsRVYA/3ZkuJwTLyPyuVrIL+8eJSsi7
         hpIFPiJu9v0GxycQUMDBm3UkgArsAmh2Vh07hm8US7MMl1mG9UetFkiN5Wbkz2IvJPAJ
         hvHA==
X-Forwarded-Encrypted: i=1; AKwUvBw6xTUZTW374A3OENO53INWdDSK/Q1iK0yRoWj2Jn3c3IlEoeMNUEy57tW2WCIecCeyuWiKzlRohPyCYek=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjD72ietHVSZa4WYrBXhwfY/QNblkGXiy5L4hfuQNoGfHY59gN
	TG6HSmGsvtuRwqafoFSFyvl0d4VBHtxPUWNbkOUCWpe8DYBY6pjV/+fy256vv4iAtA==
X-Gm-Gg: AYBFou3BrSr4LIoA5S/sBcbm52QaG/JR8Ft6HluxOfCuKCITpALhCRFusLV3xHEIkdX
	FTT+1P42GkXcIoghI7xQUwGJ0l27B5umjB1tqdj0mKV/AfT/0DDClU0125yBjoosqcY8jvLCKYo
	uZlv8gXuXCDr3SMoSck15riPeoQMvZfxX3ECUY9myDI/miZR+FdZa1860ZcEOHEatCEKhSIs9FE
	9XygHac8kWij/MSF/6tqb/OebgU+B0ep9leXso35HfysXxEHIWctkGkhPDJ4eOVvB3I/7S5/f2E
	lt9/o6oL9UvgYRV6uN5QBrUhIbxvHkO59ZtIVSxMG9Rk/rOazia3jxZfqE5H7ujYVk2uWFBkkca
	SBHnc9J/XYEk1JZ8ODgh2zyPYJoFpDYQvM/gGXUN1rfTMzo4pRUnbmmNmq6Xo3vpqPYTd+IdGS2
	BsUfE/RVXESJjJ8XtFQuMpo1rcfn7qWAjvWyvVoasTirUiXj6Ude7oc/MatK3Ex5c4wXEhD5MwL
	7LiBDz+tyqyLPnD1kIM9bgpmnyY0V3hjjig/Cc8CVpsrh1WZ9nqZB6/x5norX6kqurzXW5pJmrX
	K0Z+23ZgTAA0xtWBaZQ=
X-Received: by 2002:a05:701b:2608:b0:144:c127:dd1b with SMTP id a92af1059eb24-190a7f02797mr6894593c88.39.1792691257861;
        Thu, 22 Oct 2026 10:47:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4a1d:784c:3fc4:37a2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-195a7f4432asm146724c88.6.2026.10.22.10.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:47:37 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:47:34 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/17] iio: Stop looking at
 pm_runtime_put_autosuspend() return codes
Message-ID: <atpMNk6ymCpC5BL_@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <atm0umwtxZlQSAhy@ashevche-desk.local>
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
Content-Disposition: inline
In-Reply-To: <atm0umwtxZlQSAhy@ashevche-desk.local>

On Thu, Oct 22, 2026 at 10:01:14AM +0300, Andy Shevchenko wrote:
> After three patches I stopped because it seems more works needs in each of
> the individual drivers. Yes, the series can be applied as is in exchange for
> a bigger additional churn in the future. My preference is to see everything
> settled down in a single step.

There are limits in how much work I'm willing to do on a bunch of
drivers I don't use, can't test, and frankly have no actual interest in.
I'm sure if I spent a few more minutes on each driver, I could find
another dozen things to try to improve.

I can go back to the v1 approach (fix only what I came to do) if you'd
prefer.

Or, I'd prefer to stick with the sentiment Jonathan expressed in
optionally requesting additional refactoring:
https://lore.kernel.org/all/20261018211807.66bfea0d@jic23-hlaptop/
that most of these changes are optional, and that fixing 1 thing is not
a subscription to fixing everything.

Brian
