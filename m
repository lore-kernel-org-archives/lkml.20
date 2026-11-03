Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722429;
	b=vIypzsnFytL2gJXxwBNIdRu66dGC0AR6uXuiquzVe5I267VTKC3TDV++LmNafr7xHq7j
	 RQ+yK3kjTnDq1D2Od0u+Tu3M3E1dJCGroLTHZnJYpyazD9JTyUjgfwHhfOo9kOey/6hLh
	 iwDTe6Rb4RG6pCO+VncPmKALGXC4NPJVI4r9rj1+b0yiGmCrrrl/PR4LG/Lp/VI8fSgoB
	 FpoXovwPASDptDbNccPqiG1S6eMG6piEa39DWBtcau8xVi/1ijxyIhL9lBjZ2+EFcgfTv
	 0mvCeFT5wCztJ+hlU5qKiah+I+wlCR8WVjFF8i76Y8z06mjOJpxe5t6IbDT+5vOzAcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
	b=QpCuFysbXAbSv4YnAwdQY/5RsJ4k6anjKWUVuQmI2kOJM/wSgmoaGa+DfbtQfY11ByEm
	 o8+9OrOV+p4q7tCk5w3jjiZEjx79yjnQljh3iP6WYOjgkMYwu0C+RLMRtHEZG3KoTPVgT
	 JzHB/54gLXULN4VKfYdQt0sqzuhFx96nTdZHN+erSx1DdJkGwc4Y6VTx/aM/xrGmdLY2p
	 9X6ZGEips04viYDH+cC+TWAcYiiaq58L0nlN1QaPWNmbxeyC0ebiQNNtEi9HURqyREDxw
	 DeYdkemNYWRuxn1e9uQT/MS6ZFA1M4GfyLHyDVjz2RxieAaYGuRWy8vwjg6qZ6Zgw/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9d4b7Ef;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A76F606EE97
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A76F606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9d4b7Ef
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3423317f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722428; x=1794327228; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=F9d4b7EfncJF5ES2462x+Zjbhb4TYd33M/P+3Y0mSFXz0xngNNtM0a9BCDpY6aPyFn
         EccfZpdj51j50gsAn5T7iZGoF2czsnhL/CgXIRFFxaUQJ8AIy8hcQrohqa7xZ4IiyqZS
         4NOjesdM1xKIaKZRE1G5Cns2zp+BR0b0zP6LwIF7DN0YiH5hclwDOhZw1f7cUwtj1DvR
         d7GpzilbGp54raXH9QSRZdvcbKUMIbHdXFLMJKGuUnVlJj4pW78JqPgHT7fWZtj6D4e2
         +qENEHrrgxujIH3GBfoqRlRVbsXxPpJBnVFJ9CMZRaPj6XSd+FYZJhscJXOpj2oYJg8x
         0GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722428; x=1794327228;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=F0qMRPxyPBC2/+XK9fWumjwT3XPo6eJRNaMB9NydQcbJE7uBDRmP0wCqR2n2q5InV8
         6WMU8oTgYR9YWySUm3xm+u8PZoYtwdgeB0EYF7zqaMG7gCZ9DB84m6iJS8svjd0aPUn2
         vkkmP0BNgj6COBSrNZB/Ec6e0DJyFqHwY3EJ7WLw0hlhTRhjyQyQxozIruv1yKr6u25l
         HIJAc/xP7EtUK68fxp1StcfosTjIsiaZwnjvJtoQLZ2Jdr3lyxg8NpeappSCy9r5Ae8R
         GIPrYW5CIi/kQtIs3ptVs/ZR5zf7lCBSxIClkBE65RHP5dfLL5W9D20ThTPV2hilIRh4
         LkrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgtGr0GrBCu3p5ucF2qEKTniIsqKmZU8+GF94fHcTxgP/xyzciv/6AdwhsL8vyi1WzGpKkN+z2pQg7zoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F+iN1wOIoH7eYAwG+TWkpkMb/a6WeNmkppj2TrrYhBmwL9y5C
	bhUjkVWnKvBZffcs3+yEuDnosE4Ne0jtZIaQmmOuD/RekdeJog2SMGXO
X-Gm-Gg: AYBFou2J50wAcJPlpqoQ9YMaqu+gg7ahqjAyqe4OwrcfNT53Psxgp96X23PgKtXekUa
	taMibeA6X8dR88tAkDEvgonUtdxY4NWaPUcHjjrwjr+2+XyhwgbHqKzEORFomogkGiIRmdw2BIf
	lh32E07B/sFR2nfgYhmD8C7nB2nOHx2gNajHOW+uXfEHFnsVPLmpNNKsPTzTpm+aAlJEyYeqnAt
	y7g93hKnlGV/Ctoz1W4EEXsbTepcpfJZkuNTWgK6j3/gVteHrprcg02bAzEYIXN4aG2bBA6nLw/
	oUIvLENW9mJd3qlB1LbRdEBTlMqLI+bISThRZECRqaLogCqvMhsjp+EEQpXg3z6Xe8paSYZOrz6
	giEeFgymG9kVhjfFebj4dG4myFVvQui9K+8OkSwf6m1RXkZs+Xq0NZQZJ3V0Tpe2fsxEzAGuT4X
	97puc1VWAkiHcIAmnjOdXr8d1xP3rdNOJYNyT9eo+4qXM+3tUKEllJKFJyFyTpwsBmJGFDVcDV2
	DmM/I8s6CFuZIL5BsjZBBKZhEVpUiAHFBp3xqV20q2F7fKMvjExo7kpPmenWBD+OAJpcIQ99G8o
	YQhJO9w5OTDLrrjSL4EQhXh2NkGFof/k69WnQQkZl0vZRs3Pt2FCE/n03x20N0HxJDofmwTmSjs
	1KJHZjASQSmlXPg==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr306531505e9.13.1793722427449;
        Tue, 03 Nov 2026 08:13:47 -0800 (PST)
Received: from [127.0.1.1] (ppp91-78-241-225.pppoe.mtu-net.ru. [91.78.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm24419506f8f.15.2026.11.03.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject:
 Re: [PATCH v3 07/11] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-7-181bb0d23f4c@gmail.com>
 <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
Date: Wed, 04 Nov 2026 02:13:37 +1000
Message-ID: <179372241749.1222507.6207957568716226558@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Guenter,

On Mon, Oct 19, 2026 at 06:46:41PM -0700, Guenter Roeck wrote:
> The issues raised by Sashiko will need to be addressed, or you'll need
> to explain why they are non-issues.

Thanks for having a look. All three are real and are fixed in the next
version:

1. cpus_read_lock() in the clock notifier (lock inversion with CPU
   hotplug through cpufreq): the driver no longer takes cpus_read_lock()
   anywhere. The armed state and the rate are published with
   WRITE_ONCE() and applied with on_each_cpu(); a CPU coming online
   meanwhile either sees the new values in its hotplug callback or is
   reached by on_each_cpu().

2. armed set after on_each_cpu() in start, racing with a rate change:
   the flag is now set first, and the start path and the clock notifier
   each have a full barrier between their store and their load, so
   either the watchdog is started with the new rate or the notifier sees
   it armed and reloads it.

3. Watchdog state lost in a deep idle state: a CPU PM notifier sets the
   watchdog of the CPU up again on CPU_PM_EXIT/CPU_PM_ENTER_FAILED when
   the device is active and the watchdog mode bit is gone. It does not
   reload a watchdog that kept running, so idle exits do not count as
   pings.

The earlier Sashiko points (prescaler of a watchdog left running by the
boot loader, rate changes, resume) were handled in v2 and v3.

As the driver is not specific to the Cortina SoC, the next version will
be a standalone patch to you and Wim instead of part of the CS75xx
series. It will be sent after v7.4-rc1.

Fil

