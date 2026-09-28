Received: from mail-dy2-f27.google.com (mail-dy2-f27.google.com [74.125.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F3311C1D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599699; cv=pass; b=n6YLNcjf2wpsrEDcK0p0mxu6nBvZ3wrL8PUl89ZOEZCtTOZKD2L3Y6YvvZ2o7B4eEDbXy2bNpvYVkXuy6FfRJVOgYCzBhtDy/ZDfn4u9CKorVdOvcA+vxSGhExMRI2os2+0rujtUGcfXnAPW9qCUt21efrTTDDiGfUuSoUXLckI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599699; c=relaxed/simple;
	bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLQUmAvbr3Yo2V8eU6v+SLiwf3wRzUVxVd5PA0H/7wevEqflBB34mQ7v7jLdqouPnVPRRDo2I7KhU77/OROd1ks1A/4VX6bUeaiID5Qyi83nMovED+8r2so6f0ZIhBJWMCZ1y+HF0bi817NeudzTNGMLN/AnOpYnFEDiMCEWpUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUVhF1s0; arc=pass smtp.client-ip=74.125.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUVhF1s0"
Received: by mail-dy2-f27.google.com with SMTP id 5a478bee46e88-33e62211987so3111039eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599697; cv=none;
        d=google.com; s=arc-20260327;
        b=O30Uo691VMo87/tQo0kOtIIqnZS/dgaSTDPtU2Xzm0cZZpqrUgBJUSk5Jfv9PSaoEe
         DoWVOzTdAVu4KkziF33320bTkqO78bgnHB9sBYWMruIYbCwKYkmgMJYrMNtOI5i4yc61
         BXRbdltNuzQJv5SducJBFPWmJrfLXyNf99ME3b51MriEJcqI5qdXXMewu4F81tnCcA6U
         FoZsCK53zhkuREybrf1mMGJgA9Qavz2XyU2/URg1bOSyaHHtQGjWqb92KVMGO/cWm1lf
         781fDhkkP9mBhOa63xcn7YZjCL32HFZHr/EVFPdNFAuskCYGzJlNPSa7Z1cgyNmWB09D
         O58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
        fh=RRO3JXCCX/0Hd1LAna5yr09vy4OK5uv+8Gl3F9RfuNw=;
        b=DjH6NYyu9SBfXWEBnE9xPGymJZgkxeEBd/93TQ3O5dXqejDFwnXOaT0fMr20PwR8gY
         uKLC6hLLkE6FAM2LzWnW/CX/MWpXsqWtEooY+j31Dk0DkmremrmH+Hwcb+QbaGTYIcF/
         U9ch3mS9C22uCjGCg0EOEbr6C9XAe8CKBvpdLWCLjxntNofPjMCVb3NLqNHq4+0WBvP8
         zGgrPcqeDdCZuTKEAST2JUd16+sHYmngQDuqrIDeUwZ7pItbMeQ5uKjl/cwsMsH4NPmo
         JHshGuckB4qeb9Yry++7QEO9bb50JvU/fcFsYfjwad/CshywjY/xZyNMsjWUlhm7BZb+
         HTDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790599697; x=1791204497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
        b=cUVhF1s0sIPSXtPr9iIeeIBk/cxu/75YRWbbdDzmbe493Ax1gWDP+RFVW62IRBEEhZ
         rwx/BsdNhaeR/dVlEgE1Nqk2zN5zxfch99Zp4Lg3FKSTyrpAzVDRWjH6m68Zkx8D/8HH
         S7QnsQ1gvYfoGXhZkYwxJJ9p4wsNU8gHA5I+8lh4kEkujvl/aEsJObIuKcCj/7bBKdXc
         wjyfPsGH52bXmarRpmhAbt++GVh/Xx+zvA6C1iSOP0IMbKrTSL6ogE0ej63rHx5PWKhC
         FDsxSS0PRB3Yb4a8+YS2FJMcpskCSwgpdt70P5KEhiEBepQazjigT5XvoY1SPpDd/f7/
         W8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599697; x=1791204497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
        b=DwFaCEUeRHedUEGjg/0gTSc8hZVAgQKybjQJWstfHF/NOYZSXDgtadlEBGFBe375nd
         XleCisCOZ3df9p74nd3rpCE+9hNw8mYB7FN9V+PfDUo2mhmILMZHyaiHunCLvdPODiu/
         oDomSX8Dtx1oaKyZSCT20upnqCpUOHy5lG5q6jYqDyGB3OFvEydk8yynejLv82HRbWQc
         tPaaqV0Dgz8pEWsEOXKnwnElmJRCHqFvuyT6AJHEYz0o3wkjFO5/iQyDL6nIBwzTqh93
         OFD0Wv7SvKzo+rYNEKP/FJsFCb/HiMT1MNb3XUbAd7vmBdmD6BJ8E+XGk/j0ap3iJEpR
         h1AA==
X-Forwarded-Encrypted: i=1; AKwUvBzIG7T583BGFg0F/ak6R/m0woFDAuU9smBZLZn39pGynYsaO3NghR8czS8WmfI2lQ8PvcG7RCSYptughJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1wVyq+ohqTI9D5vYQtR3TTj7DIrwRymrY4LRxCv8ts0UXMD3t
	6pEjj19vnF7mASuTHrxp7TBQIzYGKVqaoRCznHu0CX8FRdjNNn5WR4VUo5RYHM+AIucPkDhfvwH
	kZw/D/bskJw4NAOKbDTEPWiWlCTwtfQ==
X-Gm-Gg: AYBFou3Ti5pettN+BkWoz1jwVNFVQmtoRp/YDZqTVVuZ7S5BFwWfzDY4b2oO8tDj4hD
	/SXmZdEI5e0POHYQQ2Zra8fpYTJTmhoe/O1FYOC6j63NRk7PVQDTnXkk5CGgbHRRr2eK1wkhEpc
	aP4qHq2gpPVYGkK84YKqHARF5lwgwXqZwZdve7FvSBfm7ZbgU14MYzMewhFFM1NLJOITeTVrfAv
	ZHIVDZkqrjk+Qooe56g06b4ZKwICqpotKAIpV47xllN3jJ9CrhPd1Z2thzsGaX7F5z4pcGGkiKC
	QvY54gyAlOcGyh4a2/U/rmTRw3dOPx5GhKtMu8JE1FijY1zchyt2bge5fAfNh24bujPh62IyYYb
	AxWoPLunrHvxbSwYaC/PUv0jvuZPnOaTLDlW1YQ==
X-Received: by 2002:a05:7301:4d0b:b0:331:89d6:80e7 with SMTP id
 5a478bee46e88-342703c0860mr9551616eec.13.1790599696571; Mon, 28 Sep 2026
 05:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
 <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com> <20260928120343.49e02c07.michal.pecio@gmail.com>
In-Reply-To: <20260928120343.49e02c07.michal.pecio@gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Mon, 28 Sep 2026 14:48:05 +0200
X-Gm-Features: AclHuK8J3gRe-Q81xAxIPGhsJgUx0Z58Tt46aX_83uRYAf_M955FV41pJ0HJWPE
Message-ID: <CAM6_QD-CbYSsmic5LhpMi-aMXuC_VaniELBzaBeWO8SWm4UONA@mail.gmail.com>
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, everyone, for the quick replies.

Andrew:
As far as I can tell it isn't a regression. The adapter is new
(2026-09-17) and has only run 7.2.5 and 7.2.6, which don't differ in
r8152 or xhci. e765ab012f73 ("usb: xhci: Improve Soft Retries after
short transfers", v7.1) should make it rarer, not more common.
Bisecting isn't practically possible, as the stalls are days apart.

Michal:
> Out of curiosity, what's your xHCI chip?

Intel Sunrise Point-LP, 8086:9d2f (i5-8250U), so not ASMedia. The
other host with the same adapter, which hasn't stalled, has an Intel
Comet Lake-LP, 8086:02ed.

> As a bandaid, you could try increasing MAX_SOFT_RETRY or this:
> https://lore.kernel.org/linux-usb/20260905101837.4b7849c5.michal.pecio@gmail.com/

Thank you. Would you like me to try this to gather more data? If not,
I already have a userspace watchdog that rebinds r8152 when the LAN is
unreachable and the bulk-in endpoint shows virt_state 0x40.

> You mentioned using dynamic debug. Do you see "Transfer error"
> messages randomly during operation, or is it only one burst right
> before the failure?

I only enabled it after the two stalls I reported. In the 19 hours
since, including 71 minutes above 5k rx packets/s (peak about 29k),
there hasn't been a single "Transfer error" message, and no stall. So
nothing random so far. The next stall will show whether it's a burst.

> This should be visible with usbmon.

usbmon's debugfs files are blocked by lockdown here, but /dev/usbmonN
works, so if I have another stall I can send a 2 s usbmon capture of
the bus as well.

Regards,
Dane
