Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460064;
	b=loKrepOf5XcTzotdx85ZYk9LeS63Mk01h4KGZTkC90+ig3V442zLVB95+WrVsWswt4O1
	 55+NGbvv5QmJDhgxlr7aW8k6zw8tAeEKRVtQJTw6W1F9hmauV3W5EhinB0bXjxinxBxYN
	 7BwZIWoNQpIdm8IkH+KHyzKfGJTux5OCHjhLk5Q6VdFlao0NSeEyoB4zcLbtuQAbMYXOv
	 o19dU7jmO1PC3VD+k5R+4CVdYiH8ughfW5FK8OEO8K1p06IzIcyvZM5xfuHC9RJOLzTen
	 z5xhB98jRLkY/5OTL8zaBqJvoJPudzMTqz5ERjMPuLqn6qlbShmSwLId0/FDYzj5PYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lgcBWl0zj9yWJYZJtO20mhEVTw7e2l6L5r66HTPC7Zk=;
	b=tl3uoPyPfgroLrpjcu5bRdFbdj2gNY5yp5YZF/rOnK1GOP2YyJGW+zCmhRjv1QG7TYlf
	 HLc000FMQr1bQPzw4jeRtREtzv9ifZlx+b84a/fFBKFc9y0T02Sk8OlVzvj+jmrUF/boe
	 xGZJ1hZrYm464kF960v4JjGpzvp6wrFaYZEZgz6DFxsv4HgKiO4de91vB3RhTcDioosk2
	 ONq1bgjI3PczxE1+CKPUw4ciZtHeC5E1k4MYHucUObnJM5pdrKMC73QUksqqqkOIIjAZn
	 GhdCjvGkM6UDebr+vQVlI/EhDKOWp5K+Sca9En1/n4SCjGu9+3uLXskgygdK34N0+KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZdt+J6C;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD321606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD321606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZdt+J6C
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6596192eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460063; x=1793064863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lgcBWl0zj9yWJYZJtO20mhEVTw7e2l6L5r66HTPC7Zk=;
        b=GZdt+J6CBL/Jx2mWmXdSINlLG8x4mR+njCSqzzzJj2VXqEibomN6ViUwBz2LnPmX0B
         PQIoWLjTRWMbQm8jsXYY1RW0k5MniDwMqry4CyeTOug4xOREKx0iULC3qH1AUmxwB5AI
         AXbISyhkgiNYOsWmdVcgHd64WwtQqYZ4F+uNrI0Hn7svLy6mGzvEzj00F87J3GBx1+uR
         x93lxnpzoFK1CUea6sSOw1DoFnSlZ09mnJMp5zQ5y3rmldeDpROy2emAHksM6Kp+wOM4
         ZT+tlcKuPOzWrkRnY7BRQv6QxSUyJ4BiGMp69pOp9SILLnOYeDxmwlfC46GggibYJIas
         7ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460063; x=1793064863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgcBWl0zj9yWJYZJtO20mhEVTw7e2l6L5r66HTPC7Zk=;
        b=tjCisaGyZXrKWADVUoEti1h4sJploz7bMruYO4bCNxhO+nKwzt6JQlOX03R2JLU56W
         3T4Itk7F0gcDhxB6TeJ3Zc0EsfaGllaeD+KQv56jLM4HRAmx9gl4r3U4Qgc5Tetk+Eox
         diFV8f3uPHnttdb6twGTgv1XIxx+lkHVKWgjVSrlu10uJdcVKerBx01AfhMhDkSyLygj
         G97DIitbJ717IZOSWNkH43Jy83Fz34Zsp30QmV9Fa/PzEUyT58GowA4OnXzsMGGPKUsZ
         0NjRQCbozaMIhV0GlQuOrQevF3kyCT3U/NkdNm+3c4MKBxp6SW3CLxFa7ByhdTbNGfHM
         rnHg==
X-Forwarded-Encrypted: i=1; AKwUvBxKt6YQXjjSh6DBaH+CuPmAEHQ4uNaitITs99rnqKdSTobn5iDLOB6KftvKZFeH3iSA+k3BxWiq8XBd6VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLivZzxIGJTPy97oZT15nSKBboNKEWcKOh1IHOrqCDikiF1tuKj
	NCG1fn3Vze3NT8NH0BivPWPi9VZlZzEHckmitldQfD/+439WlP9GQPpx
X-Gm-Gg: AYBFou2lUAhf7/I/egKGsYUcFIE/YoFtIJYaI0CqoAt/VsU0OVD/Vw8te69YN0pZA9a
	xVBauTKkdFARDctfOQI9/A+/tZPvngtkEX4gMp6TtP3B5Kfl5fXyO82CK74vRThwMhImo850yNc
	NBeICZ+fN39itlKZS9PhM5VtcpjCWjWmJFbutdG8WIFFNWPFLr9pffPgf6vnhEynO6CkdOb39KH
	UBc973nPZ0oZmY+lnrcae/971N23Aoxjr0pNkqCV9aFNMFwIfdw49QpiB9+GfqY3KL/OiYuqfDe
	lXQqhOv2xcIqrlzPxKw1RZL2OuxrW9xQ0iUGqKXWL35toraf8aKEoS1dvtcK+WpvJsF67XcBG0U
	zkMN+kklh955dUtcJQ23cN4kHeUTD9ob1uD02+zIxCKolo2sekojteaEfKmztcglwmb72jAoA2v
	7ducX2ayyzGHgjWBW2UHP0s7T21CwB24+PK9k/5QhY1cDhv8YIY4DhkbrCWk3HolEP0Okq2wglk
	zSvvLMLxTjr
X-Received: by 2002:a05:7300:ce0c:b0:35c:7d45:c6ea with SMTP id 5a478bee46e88-361a2053aeamr13372981eec.19.1792460062920;
        Mon, 19 Oct 2026 18:34:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm36624354eec.4.2026.10.19.18.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:34:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:34:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: orion_wdt: stop the watchdog during
 system suspend
Message-ID: <1cce7809-dc7c-4ea2-b985-d3ece252fdea@roeck-us.net>
References: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
 <20261012-orion-wdt-suspend-v2-2-f13cf71443ba@iav.lv>
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
In-Reply-To: <20261012-orion-wdt-suspend-v2-2-f13cf71443ba@iav.lv>

On Mon, Oct 12, 2026 at 03:46:57AM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The watchdog timer keeps counting across system suspend while the
> userspace that pings it is frozen, so it expires and resets the system.
> On a Kobol Helios4 (Armada 388) with a 60 s timeout the board resets
> 47-61 s into s2idle, whether the watchdog daemon or systemd's
> RuntimeWatchdogSec holds the device.
> 
> Stop the timer on suspend and restart it on resume when it is active or
> running in hardware, as sp805_wdt does. orion_wdt_start() reloads the
> counter, so userspace gets a full timeout after resume.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Applied.

Thanks,
Guenter
