Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A109183CC3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045884; cv=none; b=V2y6oqAv51Dy+iS39IQYUAR6LFu8rKX6SU6l29100uwS1bBjyahpTJVVYVqFb/uA6D9khKyhcqOzbtnpQeojYsuWg4DjsSU/aDma24Mz9w01d+NqcnQ9nJ+7NmDtHHh72gKlb/OC1yKPoWQFMTm+9clDMLVvIHm5Jr5r6gheHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045884; c=relaxed/simple;
	bh=Xtw1FJ8iOOR37QXL3iy6kMoHVVICnPn0RaW5Wh+5go4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LzlIWLOYx9cBC3FomTKgwbu4ToJz1Vvrnv+yujXJIWe0b1p/Tb3lJ9S0gUK4E0Hha0bYN9dct+8M2R6lyzqaC0lDQUCsvpBQDDFf/qku4quuFBta5DKNTY3o9jHZVgsdKO45Y+mZUTiEWaWVSPYgKKL1iwyQmE3qUjW/n+VQOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JBzpLJGx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c/1rGlA0; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JBzpLJGx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c/1rGlA0"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id CE6DF1D0012F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:31:20 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 02:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792045876;
	 x=1792132276; bh=ASfHP8lqvduuVuTaNUF2AtMt1cgZoT5UrutKcXgZZrI=; b=
	JBzpLJGx4unXTSh4T1vx04wcz4bVVKbQHmlAt/Ial/w4Iqa7U6EjedgObcaE979I
	nMQOs+4L4fEu5IMK+JAPmGgzv7n7j4RLlMdhkDQR7fFemZyn4fwPhjRy/LumflAD
	U0wF4JJ9MDhKi+tRlgfzLdmDS9nRiZdHlwYfeeFtNpiMOkETPuAxURraDEN74XfO
	+TPdL9zfYYSxVcbvLCpYvyqQnWQ2CibKfVHDACqzM/BT9IJRoWtuf/dgzsB7dwax
	PNmjEaf7ngIf0ARyr7vSw/h2SkRsX3QlMukZgPVgzQhSF78ss9KnM3RzfdUvkuWh
	aRC4zkMlhqFfYDNmP9MWKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792045876; x=
	1792132276; bh=ASfHP8lqvduuVuTaNUF2AtMt1cgZoT5UrutKcXgZZrI=; b=c
	/1rGlA0BfQEICnwx4uB6ByT/oDlLDXwgRCqHfWv6bihgdoUPx4FGhrlKCU0VEWT4
	5KSGLoR+um8aCafnJPU9JDtX3p72f22FwSFU8aLCe8PU0tyrQ7W6g6u8XXjz071p
	wvu6Wlf8BD4YAp4uhLclnEifbZxnklC+525XoGTftfQkMcc6ES4HewEN7thUsl4I
	9SSj6wTGQQTKvKAR6T8CM7syNjfZlDnyaxoRRMiKNtbXpS8JJnR5tQv+TzfipzSn
	5BNK3WR/ombQOlHOmOqgikZw17JhbffI+hL3HGNYtSHAhHO2jWtY98Nn8M5rqCC0
	ghfmZa3fPJIxzNny+pt6A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792045876; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:FTbQj/Vb3pCVWbvIdjUCfR41kkphOPBy9pKAlLAR7Yph1Ip
	R02xSXphI6JsAlIQN29eiP+Bvek7px1BjLvjtrXZhpg+NOd9RwhcL4QWe1lrol0F
	h2cHqwIbKI7Fi2frnorJUwnUMmytis0dG0FEe9F8ufiie2jqHLMDyftZJmvRaQhN
	VVU2WD1g6GuXWEZSLHpAtPuDZh+JoSSHysReXunpsUAtJAIdfvbxk+Xy8cwy1a6E
	F6PvlSr5QCXb38X7Y5SxsXoW7DEu8paLi0DlqL/XOUoixICEivaswHPPd9HoK4G2
	QZL5SHDhBnh/8dyhsCXShgUWTU1wa2KjLuDTe2g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oY7JBQaeeJIR4EvE4kpQoX/1sfgEtGjG96RUtBHUbWc=:Xtw1FJ8iOOR37QXL3iy6kMoHVVICnPn0RaW5Wh+5go4=;
X-ME-Sender: <xms:MHPQauxNtaUaHSQUayQ90rb2t1AvfCppepsuMartOGDUv5qT4RF7rQ>
    <xme:MHPQalEJU8v3k0-gz16vTt22086tNmpW02Piwjj06CVXC1E6s8buw5Y2nwNvBksL8
    M5B5GyikIdihgaHTMZ9F6cLJYqKb9v4UmE0bHBXpdUoWYTgdmCh88ISeQ>
X-ME-Proxy-Cause: dmFkZTGlvaO+Ta+dZvvXovS0fV+Nw9WG4RYAsew5GiMaWbXaI6u2Q4MX/94ShSXCCrU9Qg
    ehhR9MSXqF6AFntC4Rw1tOTfIRLVJ/UGHRpgk5DGqm2KmaUMd3tmI+RB+3D5HjqBt5kEnj
    kR319spbI8ATKpPNl1um1TQCh0U9tLPkm3snOF9TtvQ32VjfnGh5T8LZTbYDVzZTEhyW2i
    PioHgnoGadB9s8hvvnJLpgupxKMhLXmUmT4xfCPEBy19tnNvg7eri/hTkOF9P3eCxyF8c4
    v3VjJHMPYPwKCjUDCjzIfsPjKUr9lc+plGgaq3qJm4oe6m1PhUFO39XsOqad1gjU8d7RWC
    AmSOF7NXJSJ4Qi4v3z87h1SuVTuHNJ1EYMSSk87US/u/yL7dUVh0k+KLjlS3xwtAplSRf3
    UxhOiSoY3QlV/O5s2b6SLML+h8ynZQrC5XCctp/jfB1xZ5UFpff8dtY8h1EhJbDrHwQ2ik
    pNHong9JGNo8+pGFLg5aOPNEEj9C01xB/WRZaKPg715RiuiXqmZF3+0qAteX0oe4DOf7eB
    Iw5LykC6MzXstoabYCCATsQ0GPt9wmiRsuGLYmmuEnGQ+h/h6yzVZx5qdLqLqEESl/JaHk
    hVR2A00ei3BUOEz3oz3pIsryHjRvH8KlbHKwakttX3wmgfpXnfGxTB6C4VGg
X-ME-Proxy: <xmx:MXPQau2DMPXFwA9dnxmtu2QA1i7JX3ct2ZXIL41r3L5vAzmkD7kxAQ>
    <xmx:MXPQagIVFK-fmnRxaKeuLulxg2wBHEUP6-sibp1rwJ8Y15pklIqNUg>
    <xmx:MXPQatF70UMwuEXCAENGK3Q2i1qR-GZdMvFh3d48o8IzSzlg-yXkww>
    <xmx:MXPQasWbBO255_TmqV9scuufrVZ3SZnw6k14lyV3Lk4u_04H4bctIw>
    <xmx:NHPQaqgfcbmmKXE_j9CtFdiYldFb3a_zILcyCiAVtWXAdI_QyA1U5Nzh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 49C9D32A008E; Thu, 15 Oct 2026 02:31:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AyGqpIRIZCcw
Date: Thu, 15 Oct 2026 08:29:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Menachem Adin" <menachem.adin@intel.com>,
 "Andrzej Kacprowski" <andrzej.kacprowski@linux.intel.com>,
 "Karol Wachowski" <karol.wachowski@linux.intel.com>,
 "Reuven Abliyev" <reuvenab@gmail.com>
Message-Id: <4253b355-9505-4854-8ee0-3c1db765d3d2@app.fastmail.com>
In-Reply-To: <20261015-issei_pm_and_itf-v1-4-8212238a57a4@intel.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
 <20261015-issei_pm_and_itf-v1-4-8212238a57a4@intel.com>
Subject: Re: [PATCH char-misc-next 4/4] issei: add driver to driver interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2026, at 07:28, Alexander Usyskin wrote:

> +	if (idev->rst_state != ISSEI_RST_STATE_DONE) {
> +		wait_event_interruptible_timeout(idev->wait_rst_state,
> +						 idev->rst_state == ISSEI_RST_STATE_DONE,
> +						 msecs_to_jiffies(ISSEI_DEVICE_CONNECT_TO_MS));
> +		if (idev->rst_state != ISSEI_RST_STATE_DONE) {
> +			dev_dbg(&idev->dev, "Device is in transition\n");
> +			return -ENODEV;
> +		}


> +		wret = wait_event_interruptible_timeout(cl->write_wait,
> +							issei_cl_check_write(cl) != 1,
> +							msecs_to_jiffies(timeout));
> +		if (wret <= 0) {
> +			issei_cl_clean_all_wbuf(cl);
> +			if (wret == 0) /* timed out */
> +				return -ETIMEDOUT;
> +			if (signal_pending(current))
> +				return -EINTR;
> +			return -ERESTARTSYS;

The wait logic is inconsistent here, the first one ignores the timeout
and pending signal, the second one flips -ERESTARTSYS to -EINTR and
everything else to -ERESTARTSYS, which is also questionable.

> +#if IS_ENABLED(CONFIG_INTEL_SSEI)
> +
> +void *issei_device_open(int (*match)(struct device *, const void *), 
> const void *data);
> +void issei_device_release(void *ctx);
...
> +#else
> +
> +void *issei_device_open(int (*match)(struct device *, const void *), 
> const void *data)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}

What is the intended use case for !CONFIG_INTEL_SSEI in the caller,
and what do you expect to happen when CONFIG_INTEL_SSEI=m but the
caller is configured as built-in?

      Arnd
