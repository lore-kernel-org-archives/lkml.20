Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378517;
	b=XzMGQzCGPrerjSsJzCPg24fYukR5G2DQ0q96/tOwA0Hr85s1w1agu6NkVMHfLJqSx6yT
	 6wJRON789OncAMIsGMApL57P/mgCtgl/wGZ/fZWE3pikmPx8LzwdfOkNfXvT/EtcfPsyz
	 1m3u0lNfn0yL6y48AUzkyaixPjFSZ/iD+i6zZbr8ZaIDDW5K98NMrrgEY1P4FzUwGJn5Z
	 E2BTTRLSZlf7ck4xvgovNLvwubD68fCoAmJdZuQ5eAHwsoPF4GOOeaK4wLMf+XhSmbiAG
	 eYp5DEIEnZpEcVktImHncymTXRen/DP8mNAxCsKI2W7zTxXxAUOeUR+ywUNoIG7IWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AKRiR21tiEzQNQfnibDihocnDjftGBvWd8nI+L+S9UI=;
	b=YWNRdXQ8OYYZGc1rMTWz5YCrqwmg6hBq33IpT6CxrUP21vpr57QF4VFpG4sFlwh/OlAD
	 swAen98QMtzbkkOVcl1DQ9U+xSskNGXsfkyUHh3Plx6FqlnzAJ5FeqC9Cl/8xrhynKeV2
	 89XLitGNwHbP/MPrO1fK9PIhNRQWsT4ImNQdcR45FzpiQQXG4Lw3/vnl6sD+o2fualWz6
	 EnAQIIOurF4vZYCdUDNxW7aWmLcPz13cF2ai6jrEIcYlCXPqo60ynD+teAEOr0p2CIKIL
	 ItbGCfVkEGNhcJ1+iSrcGb4X8CLBaqPgnNpL8gX09SrkNFM/AQ9cauL3qbjSliiAANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ElBOp89e;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EE606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ElBOp89e
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e10a70540so612335f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793378515; x=1793983315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKRiR21tiEzQNQfnibDihocnDjftGBvWd8nI+L+S9UI=;
        b=ElBOp89e0uVofDkjh8qcXAFrcQUrDhGRp1WMTx3X1j7EWXnyeWzLOPNO0kS6Nso9+x
         vgEzGoodQIDzhtDaJ2Jrq9dendfG0JhD4+SMenTfU/TcmQ6dcVBzHXGmm9F8J2H4o9PZ
         GG1Ox+N3Gls+kRIkJMNXGdngkOSlHaSlDaJf7P5DuF50NAeakS4cyeTJsnjpUFMNXH0A
         WeBjiTpTXb/vVnR4bol+7Hw0dYsjD/oeqigmoZVxdP7sIGw7vTvOovJJS2wqeYSIg+PY
         7afXzLFPy8yxfNBMY8XE3TS22BaG21rYrMTXYojKbuJaqn7jm8pmJyRAQaIwmpL35SLd
         +CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378515; x=1793983315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKRiR21tiEzQNQfnibDihocnDjftGBvWd8nI+L+S9UI=;
        b=yEhfpb/3xFDDZ/Hg9cw9kqFyUHNelSV1cjFBp1y5P6+EXXewedH/pkdMbtRE3n6TuX
         LNhBrJTMVy59Wxm0gQfjarfrLkaOa00rntg/aKCZhDGysqkPiFGq3+M4A4w1BGqUEr+h
         ujFTeyqfsYKIAkGQk8sNs/6dVECwtRr8Uy1Qg+hxIzF6W2g5HTajFlw6mjCsr291P+wx
         C/yHXmx6D5UPSx/XY95nC2MJoClAU/vLZgkpRthSpNZ61p4m0gdSLq+6H9o5gdXc1RIq
         pKAquwrlRaEaEfYJskZ7wY0jRt3uxjiMGaG059fK8t96NQ57e01cTmikBpfd+hrQWNgR
         m6pA==
X-Forwarded-Encrypted: i=1; AKwUvBzX7y4hNTTuKu0rdqEKvdVeSSl589vDyfKX1+lFUzmtkZGhtF8cuVJjOMkJeRc+co50DH7veVj7fgdJkqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE3uL36h0kW9gBy/SjN4wP1VHwFwXtQtVQWq3cclikrk5SUxCY
	2qCL9KI1Ubt9XCcPreEsZyYTsmMbUFsY2ac2dUxHIYUcaGYVYr0/BcwjofvB+naLjk4=
X-Gm-Gg: AYBFou09QRHf7Y77S+SmckHxWgEjvc9e7SM0q5R8ojNvLC8L4y/mmPllUy2dYo5zRTp
	ae1/jnGZrvUfcQg65774l1Vn/fzL1v6nR9+JZskNRFIXOi6TLBEageTBaiPS/CMKlI3tBwKewlf
	6mfuzG1MZ7lYkroDQJw2Wg1a8TX5NDEm9PLzVT/ZfHukcwhuKh/vMsdOo8wfVxsBeetuF+UPL2P
	AlNtJhEFmLCn8IWdp4IY5yRcVypd+23u3ptHfXZIYUvQBbjngwNAzuAJCq4hOT8UVhcBjVtfKh7
	QFA9FJYD52ATAxIJxsmsud2osA33/gOjtKUtbobBCc0Ic8MTXNCQCJu+p4q0PRLhIfELS7mSGRd
	dTFp1O55xIuCejgwirTrD/yobWnM/kTLELC1G20eY4jeTDaNUBakdkYHuNw2wLX3w0risnpGwmf
	kgdzMVYOR/36+SPEqyzfw54gM+kSU/KoppsGq6mVXuWkdwf5Fe4yBlilgw7ojEmAnLu3I352ZmT
	f5SGSr6gR11lo2HXd1vbhfPQsDAWg8vbmWlaqDw2JGcmaUIIb0JWulTY6HWRUOLcQgl/VR91/Lb
	dxbIuv+orZPn1e/tvm6JYpwaC5uLW2aZNc/Hote1nw==
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr63192545e9.9.1793378515124;
        Fri, 30 Oct 2026 09:41:55 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm165061125e9.11.2026.10.30.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:41:54 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:41:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk v2] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <auTI0Dv01budMJv0@pathway>
References: <20261030135802.663893-1-john.ogness@linutronix.de>
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
In-Reply-To: <20261030135802.663893-1-john.ogness@linutronix.de>

On Fri 2026-10-30 15:03:55, John Ogness wrote:
> unregister_console_locked() is called from within
> hlist_for_each_entry_safe(console_list) loops. This would be safe if
> unregister_console_locked() only unregistered the specified console. After
> all, that is what the _safe variant is for.
> 
> However, unregister_console_locked() calls printk_kthreads_check_locked(),
> which can unregister _multiple_ consoles if kthreads fail to start. This
> could lead to hlist_for_each_entry_safe() use-after-free scenarios because
> not only was the list entry removed, but possibly the following entry as
> well (the @n temporary storage of the next entry).
> 
> Move the call to printk_kthreads_check_locked() outside of
> unregister_console_locked(). Add comments to both functions to clarify
> if they are safe to be used in hlist_for_each_entry_safe(console_list)
> loops.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/lkml/87ik31iz4x.fsf@jogness.linutronix.de
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Now, I am not sure whether to queue this for 7.4-rc2 or 7.5.
One one hand, it is a potential use-after free. On the other hand,
it is rather a corner case which is hard to hit. And it would likely
happen during boot where it is not that dangerous.

Well, I am rather confident with the fix now. So I personally
prefer 7.4-rc2 to be on the safe side sooner. And there are
already two more changes in the queue for 7.4-rc2 anyway.

Best Regards,
Petr
