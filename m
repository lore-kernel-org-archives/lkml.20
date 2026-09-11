Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469B2D47F1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171064; cv=pass; b=Uqj8LX503QObV4LXl/GpwiJeQxqHElML71FfhEQy2kfvRGa4RDspeFiN7sV737XQhpvuZoH7zU2YfYtZWyP7wPro2bfHxjUQpWuRHvtBaLS5xm5x73XMAV4b33iIQDRb98xGi7+tXLadu9TpiW6z2M9qtv1uve+YiynXNfPaeQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171064; c=relaxed/simple;
	bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu6T2F8jyxjaXjEVWhPME8bDz7wKnOsCBb/n4gqgGHZg+DGOAHiz1+DObzWUsZFoAJ6mcf/TpuhhrMPLOCyJ6CYn8DKZ3CMC77kaZXiY06YOGj5Og6Hz+lelCB2fqTosrD3SrAJcJVkrPi9F/oiczpj9IIQalQ8vGvXGHa2I10M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FM4cyvu8; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FM4cyvu8"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c29so922177b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789171062; cv=none;
        d=google.com; s=arc-20260327;
        b=g/TvMuGceOak6NjWMFC6SDXove2f+s+0NIbU9GzDXTtLamfAL6FbdU+IOqKrhDsdbu
         HWT/HnzlBC0yPVghZLXpbQUN+HV0THIErEqmJ8bcFHsHJSejWoNtQYbd/FN3lA+pTwer
         i+mFQ3YuZb9gHG2OyxJcO/Ig6jVYga+0deXEtyZL4X1uVkuCPVrY/TaDMEsqWf7qRCic
         QjcmrYLPlq0L6U8i7GQzhWnho5EwoWn7fgshBel7gCBT46Off1myB+Xn3CYFwhimpe32
         oUgHxa4DzqNPjEtku/KvrLUe2mdBPLdBQ9L0tUONMkk2kmZvTTfDObeIntGeUCtMQbR7
         fd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
        fh=7b+jzSfy921INtyYmFJLItnpnSvyXhMvi86bHAheqnw=;
        b=Z/+KkeNNwal83HvhsJMINxbD0weLDdAY0Ewwy3eeMtNoNQFAWJ2vzS79YZ4p8I0UUm
         b6UaLebRu8bm3s2NQl5Ka6q6kMlKUzDwuCfT6SV/H/GE90dqI9rMS4Afas29FYTfZeWl
         xK9olMjHIRb1r7rXkHWkA3j2sds1hT4d+/6ctTCCVtzhkKVVOer1DE8MAFNPMo7mLlgJ
         nIEiF6VTt4lHUF0wUCyj1r4gM+DXW1PlkGtFxJu5OCh9iicrLdzoN71oP/QDQYTxMfxR
         tP8tgbP6uxj00pgopyFQ1XWB4L+o9wvRGllaZU3PRKZSVtF2Xy+K6/yhacZUykFh/gp9
         ywbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789171062; x=1789775862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
        b=FM4cyvu89E1OWKk9hosCSj5zbM4oQeW1EIG4jJBAz8eDsapssYhgU17X5+Zmiu+B5+
         Ge2NyNWN/z3fHCOX9Evx4sDzjJRVHUJImHBwsaCKgIQ/v2ctQSXq/RvEaqg7zfH3gU26
         l+zAON5uQsVzsvfOUYKrWahnr0TvrZQIs5uEl9xxbuOhFwkQoSwxvaD3GozL+qLDYO9s
         TcWXGvoXlBylQFuENoGV6XxUMYAMFEtA5G2q//KR/6g3kYqRu+lRG9FnYsBtPwUjGtYZ
         z5Irnlht0h3VI+Kw8LLXw+bqHpL3I+gdqm3wYlJv+zhJVvHC7m8hhDG5uiTAS3UyoACi
         7d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171062; x=1789775862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
        b=WikiUPLK6ysT+aBT3J/gsBlEg2js9zXU8NZmD1W4l5rkQ8rymWdM4DM8vL3TxsdQCc
         ms5LcyeX4E8jMSfdql6/dDYhHjvQUwZ7tLrElfkdfb+2nfsw/uiLg9ynHs5biw1R/Wmc
         XNTk/LPKlHIYqwtpQDHWlK/V3lr/XzfJjkwl7c2f91dZ5Wem1N3yvLT6jmHbBCgJu8aK
         60wCxGl+sCLDbASwIRqsYTmtSJ30U7k9g8ddBTFKVQ0l37l3bzWdB41ct5fA5Okl96QE
         KlVdk+wZz720C5aOzgNvOzl0cyeZJXv33XwvOV/8JBKWr2QNh03LowIKgOshgVFXo7it
         N+3g==
X-Forwarded-Encrypted: i=1; AKwUvBwpsQohuEWkPDLzEe/dN6RHRNWBr4+Mfl7UPyUVPa/CWDCWs4+kN8AKHhmNewc4pUS7PPf6dbTG8q7nfjg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+gDxcI7PuaQILUsoVoUB26O6PwdBtcOdWckCtLW34SjV2qCv9
	S43ZHgEmP9+HpM2imMMV071TDwltzOKhhkgjLVpBmC4UsRNR1jcSRPfw+fpyQdeL30WGacG5wY3
	+kJmpREcrAcwNTrCUJtSJNxx7mu9eHoGTMxx0pC6iQGyXARTLSl1B2iMRhDQ=
X-Gm-Gg: AYBFou2HcIxTXfQ2gjzzhwXXtgAUdRfT9T8sCN3kZ+2mE7ki9rFuueaNsPyGIRqDSWs
	yXcAMeV1428j63DjbsL0Xf4KNTyeF6SUckC+W36B/Gvi9o2gz7/8w0ZK5P0Nsmw3KQayuDQc4LP
	Y7aMOO8asIHLSw49OqMh+Ncti86Ex+nlXeY8l1djWRxgeHNPe2gRaTyOQlCccHjr1tT3R/pVvo2
	IgWz9ctU6/lJ2V7mC4A/4YuntLu339fskjnnDBhS71/tEDkDjooNm5sYkU7bpykjqwsi9aSk+Gb
	AVqAolStJUDo8jirFhMyYKFzJrjDDpeaNZwfd8eZY8cZFpaZpGy0mCgbRnzJrHS/fc0/kl/s1hc
	KmsKUjI0M3w==
X-Received: by 2002:a05:690c:281:b0:869:adba:625b with SMTP id
 00721157ae682-887a87bf532mr2501367b3.25.1789171061244; Fri, 11 Sep 2026
 16:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com> <aqQZzqJohIxBwnk0@SMW015318>
In-Reply-To: <aqQZzqJohIxBwnk0@SMW015318>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 11 Sep 2026 16:57:30 -0700
X-Gm-Features: AcwNN1WTU8WlhVvS_yNOKejgBbjum4EMT2blUBC4r1H9SFjK7U-mdGDrxdPBeGA
Message-ID: <CAHreonG_BH_ri7_p1VQ6h=_iTpWxhqzVLksc=p7Kyro2D3nW=Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> this is problem, Maybe we can use ioctrl to set default cmd, hdr/ sdr(default).

That makes sense.

We can keep read()/write() defaulting to I3C_SDR out of the box, and add an
ioctl (e.g. I3C_IOC_SET_MODE) to allow configuring the default mode and
command byte for that file descriptor if a user wants to use read()/write()
with HDR. How does that sound?

>How about this driver built-in and other devices build as modules, modules
>load maybe later than this driver?

This scenario is handled automatically by our bus notifier
(i3cdev_notifier_call):

When i3cdev is built-in, it attaches to unbound target devices at boot. If a
device driver module is loaded later (e.g. via modprobe), the driver core
emits BUS_NOTIFY_BIND_DRIVER right before binding the new driver.

Our notifier listens for BUS_NOTIFY_BIND_DRIVER and immediately calls
i3cdev_detach(), which unregisters the device clears i3cdev->i3c.
That way, i3cdev automatically steps aside whenever a dedicated driver
loads. And if that module is ever unloaded later, BUS_NOTIFY_UNBOUND_DRIVER
triggers i3cdev_attach() to re-expose the /dev node.

Thanks,
Sam
