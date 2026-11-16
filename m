Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853898;
	b=LuG3EDztp1ui2R93TzICmn1sl6horBwTD+51KaEQ4EqolouwvrZue4QPLbzliGpEg2nQ
	 zF7fb7MutzSLlYQIncbqKmNPGikZqWZTdLtaBOeoNRVJ9FeQy7gYhiSu+zRSSSmeV8kUo
	 Ey1+aw+FeWQKdG6LpM7+HDTcT4LeP6WT38gvioGoKP5yN6uW9YVd4vjAN/aCfwQAJWb4T
	 8WKlipTIVrIibQjBECNQFdksdRnTHY3TFZiCxD+9UPuxwmAqdIhkW8mpyCejXlSq4KvvA
	 wrqxZFYapCYlTMC1pM1z1CidROd/Lxjf/IV1D2WuxfEBC85DQemxeIM25+KViOv8yFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3FVCd29/nY5upknxk8YUhTBqkzrzJTvA+JWUTuAvzHY=;
	b=3o3+xyyH8VmeK4OaqpD9lvPd4GY+7CDRKdFYmBaHfrz4Xs36V2xIhYQd1h8VUK5ZqqQA
	 GNrRPTekarEPzU5tNcatGsyU/wU++AJqiRy7LgSNGmOPnKLgcocHucLoly4wqpqH3DdyC
	 dYimJJW9o36nMcrDMLILs61qStkqIHruOQ7I3pkCc9KOe5rMs4Y2c/w07MT3rD4aKgM6F
	 8x+dST5Ha5Hwto9xiIIlZzlG39SCmZZq5QMx7xrQMgmQmT9vBnvTCH3QBzAqCqcbtp8jl
	 kmqvRNIBLJgW2tfbehLrDCuYUgueINdadfp0KVmMb/4o1lMMBqg/vBb9kTWtMF777cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VYA41JHK;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED57606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED57606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VYA41JHK
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-745497ac8fcso1100927137.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794853897; x=1795458697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FVCd29/nY5upknxk8YUhTBqkzrzJTvA+JWUTuAvzHY=;
        b=VYA41JHK1/7uyVYIWyme84bwPY5CiM4AjtFVKvc6/mhR32E9yGr51bV7oUZBtJrMdF
         Zi3TlXmqaos/rleDr5duscLUrFdWoaLCx/o8dBvUCl3rtAuwbpmNjm2azJhP32mekoxt
         w8HJsU0YRR5V1TLIhgR/zwsdyOgDZ3uDu94dlJ7sg7mD8mqNTswNGs5Iky0vHpAs1sZf
         wquduviertQoPKkEVOAndEWLrXdSEfkyTJTAcRUiw/M9L7qCWNuhctDx9zHlqa9EmwOz
         t9cTrLSLaX/UHxSZAHfjXN9BvmwjMWJ5kYSzjdhiesfe3Jy5TptkQNh5NCp4Y4z5LRwO
         ZjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853897; x=1795458697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FVCd29/nY5upknxk8YUhTBqkzrzJTvA+JWUTuAvzHY=;
        b=rJ/LQzOIOuygAtlNYJNhLlE0EBQrsxwHX8kOSEOtyif3TSEdflZM1t3Oxuh9x+btfm
         eU148ZV4S/GaCMdilAX6bm8w36V3No62QTgkDI/cOGGto5slek78o3ewpjJ61BsIq4rI
         kFO+PmIhSN7zUTBcsa/cbtxmMZYW/ysR+7aVMTk2wg8KUPeaEITWRxlarT7vZKhGMAdb
         ay0XMDBAvq3VgduLt+LC6dgICPgPp0SLwibZg+K/xiWX1SaUCaE9o2srO1Hk0iZ4cKpf
         bADvFqdPgOT0qkxUZ3i74R/oKX07kv/T1LENUGAM+V31j/XRDkJOvNKtM0pauoaSsB1J
         gnkg==
X-Forwarded-Encrypted: i=1; AL+hErFBtFojGvM+adjoS5e//wF/kDnazOnPYHR8gycn1orPwXxvde+SxJ7s2qItPBqu15DJuhSewlIXhnBHt3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sqpiwac2dvGzG6mAwcYQfRSZZ3WFsFRD0LO3ORiB+mwPfLW25
	IvV13/TZGFa0I+PBh2nT2JDIGRPOaZ18G2uASjmt6lJYhkjYyHkL6Q41HJ18FcN0Hg==
X-Gm-Gg: AYBFou04nX+ZkXjuwZpbJhmnR/Iu8RJT9MQW80li3z2QJ02qplMcsbEKsLmez4BfJ6w
	iPtBLp+pzQ7+FFeXrGNUzsMWd5zP2nmiy7lnFBeK3Btdqp+D6p9xjTvpc/gPfS8F///sxImqLSO
	sIfQVXO+BMiYAdgQdZHP1rQrA62r2kuhtr+Syk5DTnsHXq++4kXduDaBby7GKdaVIPEcRWu+zAj
	hF9zAQWCyI60R8k8GJI/MxdD9zBnCh0WqQh6AkeauFcajc3Zl6LfIJYvtD78MCUk03eDZRI9vn/
	PD6m92jITcA07d7EuMMkqBVxyaZUUq+XO7C52R8c/RNbkRZt3wqZYJKJ/uPR8fXvSJ0TdY5GtsT
	brCMfzslIIwOoDuPlMOWTaoxAC3UAprZw5Ys1mhKQGq4O2I3v6CwvUmly0CDS+ryNBRZBw0GUtg
	/2aLE1Zm+n0PC066bkooMhJLFJ2xsKst5hIExoKV+W+d1fL2+A5WEifu3TH8bij0xk2QnGxz5eG
	cef9D50atTofbVn2yo/8mByKE/BLQ5rY0pFk9Pp07KvIE9jljGVaCcpNwkBzhBKTuyF8tKv2wzJ
	aXyUb9MoGZ02LDUHW0dLDVJgBq4PeG60SKVdpBOze1xoJ+cdLxQ=
X-Received: by 2002:a05:6102:2c82:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d64d75729emr3525895137.16.1794853897067;
        Mon, 16 Nov 2026 10:31:37 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d702b8sm91768246d6.23.2026.11.16.10.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:31:36 -0800 (PST)
Date: Mon, 16 Nov 2026 13:31:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: ehci: skip companion handoff when no companion
 exists
Message-ID: <a222ec80-0865-4624-9c3e-3811a93e8750@rowland.harvard.edu>
References: <20261116063104.1018358-1-william@wkennington.com>
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
In-Reply-To: <20261116063104.1018358-1-william@wkennington.com>

On Mon, Nov 16, 2026 at 06:31:04AM +0000, William A. Kennington III wrote:
> EHCI controllers without an integrated root-hub transaction translator
> unconditionally set PORT_OWNER whenever a root port sees low-speed line
> state before reset, finishes reset without enabling High-Speed mode, or
> is relinquished by usbcore after enumeration fails. When no companion
> controller is present or enabled, setting PORT_OWNER routes the port
> away from EHCI to a nonexistent or disabled controller. A single missed
> High-Speed chirp or transient D+/D- bounce during reset then strands
> downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
> device leaves the port dead to later USB 2.0 devices.
> 
> Check during ehci_setup() whether the root hub has an integrated
> transaction translator (ehci_is_TDI()), HCSPARAMS reports zero
> companions (HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and
> CONFIG_USB_UHCI_HCD are disabled in Kconfig (such as in
> aspeed_g4_defconfig, aspeed_g5_defconfig, and BMC builds without UHCI
> or OHCI), or a Device Tree companion phandle points to a disabled node.
> Runtime companion binding is intentionally not checked at setup time so
> modular or later-probing companion drivers still receive handoffs.
> 
> When no companion is available, set ehci->no_companion so the handoff
> and companion sysfs paths check a single flag, keeping port ownership
> on EHCI when no companion exists. USB 1.1 full- and low-speed devices
> still cannot enumerate without an integrated TT or companion controller
> and will fail usbcore's normal reset retries instead of triggering a
> PORT_OWNER handoff.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
> Changes in v2:
> - Fold ehci_is_TDI() and its comment into ehci_has_companion() so all
>   handoff and sysfs sites check ehci->no_companion alone (Michal Pecio).
> - Drop Alan Stern's v1 Acked-by due to the refactored check.
> - Link to v1: https://lore.kernel.org/linux-usb/20261114051653.1353346-1-william@wkennington.com/

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
