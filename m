Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7135A46D095
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779883; cv=none; b=OX/j3gRblhlkgIxz5ditF5Dgjt+PHQoBnZMBnCmkz3Rc6+uLTCKwyEQeeRXfiEmYEu0WCt2mUdPo6PFmHWzpy5nvfDWhZLl65XNGa47/23BXc1vcdL0eRyXi/+OPON3OkX2X27bn7HeaxfdsttfFO6Nq3rE6ET/RRGkaunkVcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779883; c=relaxed/simple;
	bh=XYqEV1M0GpB+fKUY4FbmTaxiqGTleihRUV7J7Wx1cSI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jJSq/dWmqHwECf2ErhKWKKtOqz5zdszJtcMncIBBXBdF4UO8BxkNZGGZXzRaxcByFeojMvcHSlHXAcbaMy3Z8kCF+H4VSOSk9SHMQ4XAXx1QxXNvLLrQXhVd5odvG3klOluOuMo+c5WZT/mR7M9G9iQq1T9YmJj/BI8WA81vvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtGcz1qC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtGcz1qC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-485850cbac3so2172083f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788779879; x=1789384679; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XYqEV1M0GpB+fKUY4FbmTaxiqGTleihRUV7J7Wx1cSI=;
        b=TtGcz1qCoGur1AWzOGbC7r+6KXeDxBiuaJBX7bCeFzbBUdW/aUKItYWvZoe7RsBYvm
         5TzIbCE5VynFN92BICU4PzI834qCfCwkVWOjlJ2JRlGbFRAHZRzat7IgXvviPgcGzwOq
         +QR4E7G2uEHx1DVbOh8lUNwrjTjEK/jiKTDR3GPQ94uw9JoO5Ff1AglPy2AYbn3H3ZQP
         JrySE7ss5NpUtZgqviEURQPaUdzZKguI7mY2y5AIe0U9KxZpf+GOgKwvmlZZKoXOZ8VU
         qnnVvSHmeAO0yfmbJ+Zn9mD2HSG8ObJauwJYpVa+1iONbWdWS9BKWTYY2T71npsfyhoH
         EAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779879; x=1789384679;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYqEV1M0GpB+fKUY4FbmTaxiqGTleihRUV7J7Wx1cSI=;
        b=nmOI+sejD2zeTAc2r9EZZTOfXPwQbrocyvUz8RdDUP5g7KY4PnLekR8/POSXvWQTUa
         XlFj6ePUw3+NcawdJvAyOGlgeCmqK5AgvCJzc94mybngLVsQPCl9JMUEoJHxjnXz5qFF
         6f5VARjl8MGE6OZbEnAB9XK4ua/WAAyY9qxwPd334so+huPY5S33rZ+SubUXSMTjsCxq
         F73fdsYX2NQKfMSU3NE3rDWe68fSReGn7Xl2W9ZnV1yW8Zs5JgwQ7V4RJlsJW7xoYLeV
         KR7uCw2jwonMASjjRekS/fclgjW2CRww8Ez329YfaPVLnNva1Wod7Ka/vIatSlFRDQTi
         qwpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0JFR6eefzLZN5OIUjjuoLl87pVp0mX7sya2CjCdcpU/MuaVhRQONHyETdP5zDWqSxrOevsbvMZsLaGt8=@vger.kernel.org
X-Gm-Message-State: AFuF++nuPBYDCgEGUPkMauS1n4m0nkcakz1CJCJLyB5tu6IIq5QDSHNu
	PUh+Tcr9ujrIzlnrWWTG7w0r07BPXsXjO8gs+X6Bz1EluQd9+K6QI+0=
X-Gm-Gg: AYBFou3z0jg9qQ1iV1/pprav097ocHJDNAWO9WkGs/FYM0z31ei21YNsVkmxpkOonCQ
	GelRB6rvAK2y9SZ7ZHrx5IiReDpYpDn4CllCoDJEipC6rKVx4lknyGtWO4IbxMsRsQqa6qj9+wM
	qZJkU7ieGJ1Cac2hPd92JGxk2nvLK3vrDxV25TTEteassqNkjoyibHLbzPyonK+g4CscdbK8CFg
	6jCY8ufid8eZwOaZysyVludIes1vinhr9eFUwT9RG52Fq0v1nvnsEfnrLX0bv7n9h/I0Zzmpqw2
	YwFKSw1P0ExXAQhHfG55GdgLu0cwWEHDp65/sxM2HVFZ9bnGSJyZmFrcKU3bODWcLg33pVcT78c
	QlqQ/zXNjOhnbgdDhK3SNKp2a95my6MnRGs95v4mHv+RtFWJTKkTkLTfq17dpFHtgkH/9kIiDrc
	wTjsf23V2c0uRgTM4zL3v+Z4Je8VWHs1wXoJp97sAnRaTJjvViqO8peRPb9RaAqUdhIPnbM4Gyp
	kBwe7lnI6I8/g6ITxkpaYvZRnhnYSurL0GohALMlbfJ5D2uIGCK/SKvMxnfXxwk7wq25wvzimFG
	j4fstqzkr7KBKVinmffKv7zOpECKCOPCbDmBFPP9iqBKhgl1EcS43TiYR1F50Q==
X-Received: by 2002:a5d:55d1:0:b0:481:4697:8808 with SMTP id ffacd0b85a97d-485872dee4cmr22090578f8f.22.1788779879457;
        Mon, 07 Sep 2026 04:17:59 -0700 (PDT)
Received: from localhost (92-242-248-12.broadband.mtnet.hr. [92.242.248.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm16032918f8f.0.2026.09.07.04.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 13:16:59 +0200
Message-Id: <DL91IWM6YXRN.3892K60CVKZ3U@gmail.com>
Cc: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Ulf Hansson" <ulfh@kernel.org>,
 "Guangshuo Li" <lgs201920130244@gmail.com>, "Runyu Xiao"
 <runyu.xiao@seu.edu.cn>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
From: "Jakov Novak" <jakovnovak30@gmail.com>
To: "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>, "Johan Hovold"
 <johan@kernel.org>, "Jakov Novak" <jakovnovak30@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816153809.7067-1-jakovnovak30@gmail.com>
 <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp>
In-Reply-To: <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp>

> syzbot has an AI-generated patch at
> https://lkml.kernel.org/r/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.kerne=
l.org .
>
> Please check.
I checked the AI-generated patch and it just uses the deadworkqueue in a
new function. That is the same thing I am doing except that I'm using
the vub300_queue_dead_work function instead of writing some new code
that does the same thing.

The real question is whether mmc_free_host should be allowed to invoke
the sleep function or not. Geert needs to elaborate on that since he
added this change in 1036f69e2513 ("mmc: core: Cancel
delayed work before releasing host").
