Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270531B4223
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286375; cv=none; b=UI18zvwSwkuBmwu0Q27mjoQSXSTwG7Q5eGdJE4j2RvJPtawK3pS2N9A5+ZaZa8kwH2Etgtg985QVissG4d/4XYA+7484yB9Tegkpjt0BqI3Yh5LzeDO2KdirzcLQ8oKqxgAQN4Kv25T+qaVEUU+bE5Ul3LYqq6TtH3p5wa3k7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286375; c=relaxed/simple;
	bh=rJVQWVlBRPTsSgWg/9d5PnkDp77p5gzV4IdCIE71rko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDyWDiWoWfLRRnOyzx9+HRxKnxOCgAqmE25yKOjA0kYP8oeESPvCwELsOyFnpUdwT7D3cghSOqAPX7ENXS7qANkFmd4nmAS5ur8kQ9+I18MSMAjXxLLUH3XlEbP2HKifytxmcxPOnxgpROKNxCFWhVq6NB6IzlYdSsPEJWZodR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnmMhD3c; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnmMhD3c"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14129667240so276893c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286373; x=1791891173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJVQWVlBRPTsSgWg/9d5PnkDp77p5gzV4IdCIE71rko=;
        b=UnmMhD3c/DemDsW1kzUmTLCcHAhjLksBfrH49KWFTJRNAZV+0RmfqE7UDK3BYdKyPi
         TC30z8PS2AUSkcTV2FSnuFL0TRJa+Rl691xmJtEeAAjZMFhfKS9s9nNpUrwATIr5NIaF
         2edlrETUFRb1hb7iTkttTjS0xClllwb1GYCvt3kKWZawfGg7fptZ+/bnUCuX9BIE0/7l
         N6fImMW0Jf5gsAm7gSx4gaxTVCK9hL/bNTCF+oxcLTL4b8vLmdwcK3HC9pWZl9+1tR84
         137hB0uLjtFewk0LCubpHfbfkAPK4wJG4TwRr5/7MKi9e5tRfC7V1aXGsJ5XoXwNJKtP
         vCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286373; x=1791891173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJVQWVlBRPTsSgWg/9d5PnkDp77p5gzV4IdCIE71rko=;
        b=a9bzF7SF8ispO7JNCBnTSb9fUzfvqhZdRATrTbSCWMu/XSOrgqIFIx/79mCK7XTozK
         f8aVDArkXB3adkWAwgtK6TI44sqNPQB+4627z/waEd81v6FP0GJPQicL6goLA8yqTqZy
         mpM03n462naq/Qt2Q99AVyYpztxSjyxgbxlMuUA8ECMHTAK3jn7ySk/6PvJleiRB/s47
         Ga1NTmwJ/3Bujrs29jdWb3ZyEgwcoLhIOu10fTnMmc/V1ZuqHtXWWuYOlhUjIxlWV0V5
         FqN7PDMPx2HQqmRorEpSU7t1ZXpLKVvraOyiCbwqeNtj7bJomtgFoK1tNKWc6q4GCeER
         1g/w==
X-Forwarded-Encrypted: i=1; AKwUvBwh3FGjF0kro9xM1TP1olb7OFaCC7qb4XKNxFCY0LgRFRZ90oIEluJdqnVXfdokGYUx4C6Um4H4mhbPx9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nKaRq/GGCOPiH5/SjEWNZqcPiKbFYCBmnH9NnrvQXLGoQsnbRH
	11ctPFluVQT1PaGIBMo8v1POpR1ucQZFqMKYwYJ2zXRDHGTy3/XQcJT5
X-Gm-Gg: AYBFou0I6sC64LbLMDG5qjfFUB+WETWQHFdgAoQmebIpdyrROiSvI3T9ISxYKjZOY4x
	2mgMQl7tGYrKVG0blg5OvoI/roidItF/uKmk9GYDE4ZOXDABPZD78dbHZ9amC9yEYa59XN3H60y
	dfc2efq9b4SckXEmnnPypePp65OZhEeMSelDhNy7nbzh8UpkzzfWJyJmFRUKPa16KPAbxUpi75j
	ok+ZhOd/Hxkr9GzLHNxm0ofs+/JSphhOdQtWjfjTanLdQWCJU7jyFNIugEvpOo+3WWyKRe2YyQz
	lNjQ7SmW0Ob6SALey8o/x5GWNZMoA4B0BF0K9CzRcsdhmxeIz7yfulAK/vFnjfKjyvL3cWAYjN1
	ZNTjekDJx+K7DeKnS1VU3nHkxvbnSCw8hc7VlsjphqvJd8cWgzasjicZe7OcCA8f3K/zv4AA7sK
	8UZ4m0JC5zghDqUoNcey9W546bj3Y2iQSAs8dfQR2jOlMwNpqyPo2/E2AQNwYkk9CvVQUDXxGkn
	ea/uDSFplVRSoFC6kmuGFQIhIVPvzt1lVFHe9jYgLTPcqR3vOSsZyhH+8iJ291yN8mLjHWhWiT2
	vhfQSKntcj3z25mR
X-Received: by 2002:a05:7022:eb47:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-15eca269596mr1503491c88.23.1791286373021;
        Tue, 06 Oct 2026 04:32:53 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-160677a08fcsm241105c88.3.2026.10.06.04.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:32:52 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Tue,  6 Oct 2026 08:32:35 -0300
Message-ID: <20261006113235.86144-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e9538164-3565-a702-c26b-bdc0b8cb1c6c@linux.intel.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-2-vinicius.eduardo.pedrosa@gmail.com> <e9538164-3565-a702-c26b-bdc0b8cb1c6c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On Tue, 6 Oct 2026, Ilpo Järvinen wrote:
> It might be better to add __dw8250_set_divisor() to dwlib to keep the DLF
> setting code in one place.

[...]

> It might be safer approach to NULL check .set_divisor in dwlib before
> setting it as ordering requirements like this are easy to miss.

Agreed on both, I'll do it that way in v2. I reran patch 1 on its own
after the change and the console still survives the termios stress loop.

Thanks,
Vinicius
