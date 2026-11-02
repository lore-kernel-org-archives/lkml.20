Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606777;
	b=eimV05eYcEtprGFWSLxbWKE+phdUqZeZSud23DTpM8+DMD8I9Oc4rarcFQ5Zd0c3JY+3
	 04P6i2hRG0fQAFrw5IvdBZCT+6Pt+bEOyr72b2hiVAmqUurTluEZj5CVDLjcdG8cNSsH/
	 vInVUrSLt6eLXOmmoyaCIGk5HmVX37PvvYjCrFeuCkrkBoe4BZ2Zn35wDPerIoD6iS5V4
	 H1BbGZbjUdjmvYcPH1Z0/iTnsETAYqLqBWBzBUAYgKj44hvUEjsmNTwHhd25Ch9d7/jtH
	 R17NYVqlvAbUNXCrfBpKFHjqvaJpoCHZm4r+23QPHOYN3lj6HroRxtOrXzw5FkH+eeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6ChYiWXtgGQBl/u4nMCQKXDJCoRvRajQXYwkXLNTCVQ=;
	b=cMjJVMG5EbvhSSPmuav5gdGerz5JqmLZklyrGXGEKF0QzQdxGZ/Y5P5nqJlt/AMfRJrx
	 2uSWE008xa+hBlPgEYkMs/DU8H2W3oDsumc+iPAqBzEhXo2OPJweBmydCHmcbDZi+f5ub
	 AwNDrX3uI8tiA+yikKfUYJMN4MGUkcRzVUvwhckEacNBuLppNmD8IqPbEZHreUSYIX2xp
	 zy88O2GsL+lxHOLzErL/F2jQpzKyv+pv4crMGn5vwffqL680VdcBmD2R6tn8Sm40+tt1d
	 pMu0Arjsuw1PSVALu5sh6eDr/3nHjRVkvaoyvJpEv1bVGAlwIP4+UpF1K3A6RWH/Jlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kN6ojt5f;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81942606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81942606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kN6ojt5f
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1254189a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606777; x=1794211577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ChYiWXtgGQBl/u4nMCQKXDJCoRvRajQXYwkXLNTCVQ=;
        b=kN6ojt5f5ThR6DoMCc9LycxLXyROLCv4XieWb6HZi6HaKkgYmHDnYmu7NiRHMHnQgn
         Td9qzoxcUkC41eMom3bmcyc/cDAFjG9VH9o/qmi44a3pSGSFMQBS25el1G67b4nqTjxu
         71S2FKmY5Dh9Kncq09miU+//WFBw8zsST8suRC8wfMBm1uNCh+9SlosdYtgCUbcidLfu
         W/IjpzvP2ShoccT/z+XzX9drcS+ZI1+v+VbEgi6PGRA3Bqw/VVaO4JLhEmxjVVlFQol9
         to1L4mMR5ItvwzvGOyXuTPDBAIeJHHqc2YC5qdU1OPdoaK1Fp43gF8qn6FnlCdzETu7u
         bZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606777; x=1794211577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ChYiWXtgGQBl/u4nMCQKXDJCoRvRajQXYwkXLNTCVQ=;
        b=W4S2OkTw6ZhnY3kHf0meSS/oX9r+V0xmQB8FJYKYK7WeS0+9+6LMLWzsHZrPjUZhcM
         aX1bznIubIj/OVyAqcDgd/ZzGzJFkVS/BzqFp7F45zg6qOaBy8+IW20l23FwwvVU4T5E
         P0zM1ZPKeeTtTB1LZbqci9V7oQKgOkHsbpQO+BkguBgbMAOUR0xC/6Zju9qBbxG0ODvk
         5g+tZ3L0O4ko+q8gT7pmP3z073VdBelrM4tGoVRkmY6hjSzZcHzPqmy3Bm0m+oALDuqD
         mFws1SJ7xWWabQSxIOQw+OUgx3dfKy4BX9YhHohqxeyrZARF+E53oV//uRlWPrLzZuPH
         l7zA==
X-Gm-Message-State: APuU4Z/jteU8xUmfC5yzhTM8u6E4E+vyFfZp8CbEXi0/oFq1sGNCfNs9
	OBX+rxwFHVczSE7g9lbiHYRdcEVnJeaR4cFRaCXx7sg0XnRZQFPN0D//
X-Gm-Gg: AYBFou36bGG6eATun4ETIJOBcYJq79r8ulHiPWR9Nx+j5GRCvrc5j//vFQZsL3cuov5
	8syfP59JhaKeDE6bSkrAbyKwPU+pu7m8NlRXNynitoRQ5iFa7TUveTKmeB0pS/Ug+CvklLzOKwF
	zSeMfV0gk7zfS4YkcpsAcQoeZC9be6pnXuuVQDt9bNR57YKcX7gWjDPBtg4YDTOw6TfiGrEY4PS
	j7UspLP7mwnP7qnXhEASNnHckbFTCSca9GqdrkhqS6lFA1TT6ic9+JGNtGUt1r0tFEb+3Zo3cAz
	FboZtDdwvraMkGnVZMLaxF4rwb5vPVvfDgvPl9GvVILGJBAMAZA7KV1FhwEv2uxk6mIexHzh6Jc
	5ioT935wzW+uQqvngC5aC8yyoH6M+L7zXMD5MSlAUMCBYFRnOC6GWOT0LwQ1jd26UOuQ0zYZqgV
	0Qhepuov4lv/t/0wSINkrX3BuhDyLnuepsAdAyBgtT8vCDILoayKblBDUf0hSuZ8R3cnlWBUHH6
	wb3Da97MO7U7FsLTnUqyRDRyN6//4nIPcxbdDFeDSuqnENF4XeYMtZ4auW1neEQ/8gdYqP+bXQd
	1f7Hl68X6YJ8udPR/7EysyO5KlZZKiRJRZn5YxIvgML93TTGMDeq/FqX5W8sUgJSJA0TWIkUrBM
	oAxo1llhp72U4t0wOawlxMaQSLe+rlmG0BKh7PsoBpdwuHIRPHrhc11EIbTAZb0YwIiDcu4X5ib
	X8kZvPf0+xwQ1uYw==
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5292232a91.26.1793606776740;
        Mon, 02 Nov 2026 00:06:16 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a6f0sm13214894a91.1.2026.11.02.00.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:06:16 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Helge Deller <deller@gmx.de>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] fbdev: pxafb: initialize IRQ completions before requesting IRQ
Date: Mon,  2 Nov 2026 16:06:12 +0800
Message-ID: <20261102080612.1469981-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2fbbd0fc-3f5a-4bee-9a46-1c313a96fa6d@web.de>
References: <20261031003424.1796478-1-matthias.goergens@gmail.com> <2fbbd0fc-3f5a-4bee-9a46-1c313a96fa6d@web.de>
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

> What did hinder to add any known tags accordingly?
> * Fixes
> * Cc
> * Signed-off-by

Nothing; v1 should have had them.  v2 adds Signed-off-by and Fixes, and
sends this patch in a series with the other pxafb fixes:
https://lore.kernel.org/all/20261102080332.1466689-1-matthias.goergens@gmail.com/
Whether it goes to stable I leave to the maintainers.

Matthias
