Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460673;
	b=w1ZKPfgNuHOtegTBY1LsFLfM5OEB+kvMLlFs5t6MhZe4QsZzICiVGCtzXe1jRmxI2AFZ
	 Bl/3FtkOmtnfGHYEkqAxo65OH8xzvNN/KrpI80VkTbCua3bgv7fWtAZ6kpMTsToL6FvN2
	 li/mRf5QEo3HWEB54qYW4T9J6CEJKAJ34S88m4e8WBQtSGp9byW9wxniXToUUaTO/iUI9
	 9AMr70UF4B2wx3f4vv4c5S2bwnv3MVZbGqhmt2kDDnU5fmLKpdDg5Eh/2vqTPWwnkQypq
	 8bpqiFX0cUxT2MJvelreDr3rYhwFpDV87iE8koLaptnmWQSJqpymKp6tQnfEzX5t32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qWPo6Ih0/scjWj9tcKOojGIcqQqtvEcjo0ZHZ/nTgDU=;
	b=a/9PNFeZu/9S8UTtGahxYpREhP+s+TJrKEX3IH9ELLLWw4RM/PeHgVqGWvN1J1VFjFN1
	 8kDjAMpP1/xcnpaZCwy7fue8tcR/bbzaMUBXRPwr57x3xQ4Xt5hHtT4BNwZY3L2qm1x/1
	 9NJY8BOvm/nyi+d2D8XHNL/zc2qRui/oMkrJBb67aVC/mCeOZLNUnIElmEw75G8TAz7Pc
	 nMcCRuQDW5MjNR68tldog1s0Xg2Yz0VLWXsuWrps1L890n5zNJJYrhGQCYuCbhBNv9p0H
	 wNq+Hndu0EfnckYrjBQRaaNopoGnRe7U8j7OEuk67Co3pLiVhVMWe6vNZE42jhc2npg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0kBGz+c;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E8B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0kBGz+c
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3423679eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460672; x=1793065472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWPo6Ih0/scjWj9tcKOojGIcqQqtvEcjo0ZHZ/nTgDU=;
        b=q0kBGz+cG6DGkD/uU4F68V/2cKLUWhiIBiHJGcDUjjlVLJaDmiFKV+QKN8IFa1TRKT
         DU921CG7iyK6EBdWo0gtnqgyAIOjCMLbX+1MrQ6OpkpQ1VZah8oGdM0BrsUXguYCe82P
         sPz+60w19lF9ySvhMbWy9SZMoNT5vgCPDALs/0CSKVt6KGJk8G/8LHxzJLxLpLOjQroj
         acM1HKlZ/z4CQBlZ78Ixr5DffYrFp6z0ZiYBRgisIQ6NYwoo64ok9CSfRzdUtenrjC99
         mczDZodAICQKKYqD96NLK2S7qG+u7fifdMA9mFb88TJg6yChVxQvNHuJsGn+Th2Eb9bB
         P+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460672; x=1793065472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWPo6Ih0/scjWj9tcKOojGIcqQqtvEcjo0ZHZ/nTgDU=;
        b=iJ6cUEUroltPFH6m6oyWtckWgbhEx+XPH1NskcvKIp+UVl+lVYmJQiJWf607tCsMc2
         64/rv5X3yuY0wsrMkZ8dNY7YKtp3lc1p1SNXkG/MiWcO1fyPnvr+TAOzZxv7BupHKhhO
         hD+ojI6JR2U8lhR/warQbwGGrIvGjyYn/VGDIIoEt4tB7ORtnEmIdiH5aQ7Uh4sn/Q4B
         9GiO9vBI+KdhCpNZ9bggTVomi8AS1HbWFdX5PO77FqOuSJ2LlOdCKkUUgSaCDKN77jyx
         kYO4+iDdqVrwDbREEORX+I1zCUJlKF3aB4dQ3cLBxzUaMrpJoHVAAIMRtu7OaRmYde6I
         LmLQ==
X-Forwarded-Encrypted: i=1; AKwUvBywlbllfz3cKJDznxfVJC8cIEpKVBHgoqPLBcyBJlkk7xF+FPC+DxOctPojprOFWwZZWn955J00qUcpFOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWV8k6b3OXXqGY4Ee8BKHs+UgmrhtIYYSjuvKkO7V8yUTAOGDs
	5VbjEGNwA8kaFuOIrwyN+00l0gBQFWwSP6umZPwtBQNjSopr+kMXY8Ug
X-Gm-Gg: AYBFou2m9UNEUFvuKwL+otzUgfyIi9rO4hSfxugcku4p3QqnQFNLD0QszY8JyX6MGpL
	3PXNQKriTWNwJ4LsNU8xBDrbsXno77i1zpj39uQfJieb//z2kjI/+0AV4Ke6Ls9/U1wRFholg5p
	qxGeLXasf85dnGLbxgFogGAVtYoRtFabPfDiLCT6A0LjtbyeHlaqv1yl1iFQwKpngW7JBzj7zJR
	qRDem/mj4ji6VMU9Sx96zqwXYDpkOAk+HziGwJegAw7rjceKd29ZXAF5zr40+fGycdfYbCddZbe
	XmyBHcXzLt0sNOLvrZTYEyqv23877qSCSfWGQPk5blox1kmm6Jac+Ea2aLVmK1wC0k3huxgeUIf
	D2owNk8Ck4N2CHiCOE8xcgyzlcR0qDNymV0x6eE/EC7lr7skJ0iJlgcUQW23xFHF5HI0KwHUJVW
	hKl6jR72uDuW2rgYIZsD8ReeDbsPC8yk/6+IwBJGVyMM5O99MqP9d85cD0v28dy4qhtujNm50TP
	SRCyaCtQi6d
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr13183669c88.42.1792460671660;
        Mon, 19 Oct 2026 18:44:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37657407c88.0.2026.10.19.18.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:44:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:44:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: zoan37 <agentzoan@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: mtk_wdt: Stop a running watchdog over
 system sleep even if not opened
Message-ID: <c34d9fd1-6fc6-4229-8aad-0377166e5768@roeck-us.net>
References: <20261011013631.1149228-1-agentzoan@gmail.com>
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
In-Reply-To: <20261011013631.1149228-1-agentzoan@gmail.com>

On Sat, Oct 10, 2026 at 09:36:31PM -0400, zoan37 wrote:
> mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
> watchdog when it is active, that is, when userspace has opened it.
> 
> But a watchdog that the bootloader left enabled stays enabled at probe,
> marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
> takes over; that has been the case since
> commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
> to prevent the system freeze and it doesn't reboot by watchdog problem").
> If the system suspends before userspace opens the device, or userspace
> never does, nothing stops the watchdog and nothing pings it while the
> system sleeps, so it resets the system one timeout (31 s by default)
> into the sleep.
> 
> Also stop it on suspend and restart it on resume when it is running in
> hardware, like sp805_wdt does.
> 
> The watchdog core keeps pinging such a watchdog until
> mtk_wdt_suspend() stops it, so it stays fed while tasks are frozen
> before the devices suspend. It may also ping once after resume, before
> mtk_wdt_resume() has started the watchdog again; that only reloads the
> counter of a stopped watchdog, and the watchdog stays powered over
> system sleep (it is what resets the system from s2idle without this
> patch). watchdog_stop_ping_on_suspend() is deliberately not used: it
> stops the pings from PM_SUSPEND_PREPARE on, which would leave a running
> watchdog unfed while tasks are frozen and could reset the system there
> with a short timeout.
> 
> Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>

Applied.

Thanks,
Guenter
