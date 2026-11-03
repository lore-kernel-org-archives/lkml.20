Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667790;
	b=PCZ5Qmr03clJadlCtPoIuPoVcn6HOIrwifY3CCNclACbiMQZqyNmVX1DdM1rwNMfI4Nk
	 IqqOGvTF2JzuslN5XTKq7HcB41nfxu7B6SpX9nAdDgJ3WDKF9/gdmcCnNNa4wo9GuzPAA
	 3dHFpZ8QV++n0YL/g7DWzIrOI/JsDC2WWXdoRUuhSgpRAp/Wi9B0Biyu3IkgoinLH5oQ4
	 1DhZCDUJXNgCzW1PLcBLKRUp8WC7Jgw/b5LseTdwY6A/Lg1kSm3NOKfS36KSDipGfEwVx
	 hh1x+jdJxFWIrWiup5ROMG4vJrk/3EWU4JPy9ZmtRcZk9H6M4D7kQBOchF0NexSoV5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n0CzGjJGWSs7TyNtwS3AbENhTdJBxVqswg2+oAuEStg=;
	b=EuV0E21BGrlrXcqLO597AmE0dwi9kHM+HS6mQjJqaRy2/clVc25H1+pbvuKXxBkUDwOF
	 taPby4qg8vxRUZHRdb+FtJSmeAGlT3bUkik//hIDK/Ev8BeTqn7QVzooHiKyf/3DjW6Z4
	 7lunli8kngUG6EC1noMUs5Z+2B/xn9tCcG3O+SgodNmXtf+d5LvwvPvbPCg9kZ4ooQX0O
	 BvxEbqTCJmF2ttP6UIRSBr7GUoBTuF7ciov5ol8umbFvjbgPtd/BERsAJEC7UWP23ENMH
	 cboEvtk3/8pZfYMP/0mXlkTfbqIlO5oNRMDndbCsgPMA3hZEELni/KiaMmKj2XlYGBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PZo97RUj;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F45606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F45606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PZo97RUj
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so5635555eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793667789; x=1794272589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0CzGjJGWSs7TyNtwS3AbENhTdJBxVqswg2+oAuEStg=;
        b=PZo97RUjBjCMGZdvOa/HlTaLdNMNMxCOmFfPzjpcfg4YAk+Pn5mss95hBnF+dRw3+h
         oRd7a5+1Te8c97EL5HNv0Ah5VXVhmUDmX6ZtLg2HdyLYOpwH2VgoB+6vPt3zSKmvJbPx
         7Hn3H72Ihqi5nOcPcl14MwwHvTzddE+Zs16Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667789; x=1794272589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0CzGjJGWSs7TyNtwS3AbENhTdJBxVqswg2+oAuEStg=;
        b=h7LEzYFtiPzO3CtF3LJsg36JBIfAArRSILzyf5e8lAIRBqOAl+oZkO4Gjt8ZVIUTlJ
         bVA21+9COrJhn3OsbTFs43fkMcvtLMOI8CtGumzHzMFxokRingj7Tf/18fsPlCqwjLMK
         JrQS1kEA0V2MTQ98V0FiTFtqQkI7MSbBmc8x1FzRQkWSlJpQfuuT6xFEDtGBbysrR6MT
         ZC5OsQ0l29j1v8/UqXvvWuS5K/qZtfX6SkD8eeR8rKFuw+6ojEaaKrpG4pZc342BscK9
         OYHy7WolJCkJIgeraDiijNbU6TnMzhcBaGSLmXXTbOUIInybSe7tRkvRG2TavLqtCp2f
         WIbw==
X-Forwarded-Encrypted: i=1; AKwUvBytgYyjAXEta5x4qSK/TZ2/+DfpYTubFg0RFETZmEQxRfUz97xgkiJke3Zn9uKfGHBmChm7Y4RAtAfzzgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jIVblwhJ9viP2yEdwtZbP59g04XE3trAWVAXNBC5jKcu/YwsM
	fpL6zScyPeI8NANbnpUr+yUogROLGLDHHCPP2J9PvihN7dFpwSD15CZEJiicujkn9Q==
X-Gm-Gg: AYBFou26vOYfm5e1xPzUp2HAWfDieMYXELHTUjKzAVWaoSxbr6DIWehevMBhR914JQ0
	6nx+XxvAK7bGmFKW5i8dpjOn8IINdgKaHldIrcJMHH5FmmAGfNZkXimJ5VDnq36+xzcSFAIdk6e
	k8ZsmHsER7sbHDDUWznvlSqe6SouHBM2PlPyMKeHOZpI8LHVP7rN2Pfmcqjxid1lJ1Y2n+brdXi
	DhsotU8qZ1WVQhjm/xT44/NiZn1aTvslIcY97fHKrrI6j59hjv4UTx3CxF6A59cXghi/lmFJJ2E
	gk9DLf5OY5Ru/fHXReuOWC70rn0eo+ik2LbEmXi+fFn0RmkdERF0VRptzMmPvkeORUVqE0Bq0a3
	1MA3Wzv2OHA/dRWUM9L/yv16+Xn4HlCmIcXZ2apCIdwlzD7EZiN4QePG0N6Cr4YkB4v0AIEiKS+
	cpQUXCDflE9qfUj//3lsjzJi4CgBXz6fqjSU1IszO2/SMoW0JE8O0mTOW+64nUR55wwABBnOTAk
	Nxa6spMh2N2G+TKg81cwf7Z+6brkLnHpS9ELzPJlXqa43rQwhPI5nSp+uHAzho2IxShfcP3MFye
	5sXDwUZTkKUY5w+kkLk26E4zlAuz4Bx/Em7zKVXU/NtoySIx4l0AZKQh2ZDfM9nB+J0=
X-Received: by 2002:a05:693c:60dc:b0:36a:7c69:3f83 with SMTP id 5a478bee46e88-36a7c694623mr1481055eec.3.1793667788944;
        Mon, 02 Nov 2026 17:03:08 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a429000f8sm41756066eec.13.2026.11.02.17.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:03:07 -0800 (PST)
Date: Mon, 2 Nov 2026 17:03:05 -0800
From: Brian Norris <briannorris@chromium.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 6/9] reset: google: Add CPM reset driver
Message-ID: <aukyyYhDCBUdIH16@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.6.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <8d57f0a1dc8a07838bf1320f9b79588196264ff5.camel@pengutronix.de>
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
In-Reply-To: <8d57f0a1dc8a07838bf1320f9b79588196264ff5.camel@pengutronix.de>

Hi Philipp,

On Wed, Oct 28, 2026 at 03:03:24PM +0100, Philipp Zabel wrote:
> On Mo, 2026-10-26 at 14:43 -0700, Brian Norris wrote:

> > --- /dev/null
> > +++ b/drivers/reset/google/reset-cpm.c
> > @@ -0,0 +1,367 @@


> > +static int goog_cpm_rst_mba_check_ret(struct device *dev, int ret)
> > +{
> > +	switch (ret) {
> > +	case NO_ERROR:
> > +		return 0;
> > +	case ERR_LPCM_NOT_SUPPORTED:
> > +		dev_err(dev, "the received request_id is invalid\n");
> > +		return -EPROTO;
> 
> -EOPNOTSUPP?
> 
> > +	case ERR_LPCM_INVALID_ARGS:
> > +		dev_err(dev, "invalid lpcm_id or rst_id\n");
> > +		return -EINVAL;
> > +	case ERR_LPCM_TIMED_OUT:
> > +		dev_err(dev, "operation timed out\n");
> > +		return -ETIMEDOUT;
> > +	case ERR_LPCM_GENERIC:
> > +		dev_err(dev, "internal error occurred\n");
> > +		return -EREMOTEIO;
> > +	default:
> > +		dev_err(dev, "unknown error response from CPM\n");
> > +		return -EPROTO;
> > +	}
> > +}
> 
> Is this specific to reset functionality, or should this maybe live in
> CPM common code? I see that the return values in the power-domain
> driver are not translated, but the clock driver contains a near-
> identical copy of this function. Or maybe just printing the translated
> error with "%pe" is good enough?

Good question. Looking into the CPM firmware, it seems like these error
codes are more or less standardized (they're a common definition from
the Little Kernel project (https://github.com/littlekernel/lk)), so it's
probably fair to do the translations in a common helper on the Linux
side.

The strings are also probably unimportant, so %pe printing or similar
seems fair.

Regarding power-domain: it seems that the *use* of these "standardized"
error codes is somewhat haphazard. The LPB services within the CPM
firmware put error codes into different parts of the response payload,
and use a different style of error code. So indeed, the power-domain
driver cannot use the same helper.

All in all, even scouring any additional services we have in
not-yet-included-here CPM service drivers ... I only see clock and reset
drivers using these. So the "commonality" is actually quite limited.

Anyway, I'll see about a common helper, even if it's just for these two
drivers.

> > +	return goog_cpm_rst_send_mba_mail(provider, lpcm_id, rst_id, DEASSERT_OP_ID);
> > +}
> > +
> > +static const struct reset_control_ops goog_cpm_rst_ops = {
> > +	.assert = goog_cpm_rst_assert,
> > +	.deassert = goog_cpm_rst_deassert,
> > +};
> > +
> > +static int goog_cpm_rst_debugfs_assert_set(void *data, u64 rst_id)
> > +{
> > +	struct goog_cpm_rst_debugfs_entry *entry = data;
> > +	unsigned long idx = to_rstc_idx(entry->lpcm_id, rst_id);
> > +
> > +	return goog_cpm_rst_assert(&entry->provider->rcdev, idx);
> 
> Calling into reset_control_ops like this bypasses all reference
> counting in the core and breaks reset controller API promises.

Yeah, sorry, I meant to take another pass at whether I should drop this
entirely, or at least try to explain it better when including it. I
clearly did not do that. More below.

> > +}
> > +
> > +static int goog_cpm_rst_debugfs_deassert_set(void *data, u64 rst_id)
> > +{
> > +	struct goog_cpm_rst_debugfs_entry *entry = data;
> > +	unsigned long idx = to_rstc_idx(entry->lpcm_id, rst_id);
> > +
> > +	return goog_cpm_rst_deassert(&entry->provider->rcdev, idx);
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_assert_debugfs_fops, NULL,
> > +			 goog_cpm_rst_debugfs_assert_set, "%llu\n");
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_deassert_debugfs_fops, NULL,
> > +			 goog_cpm_rst_debugfs_deassert_set, "%llu\n");
> > +
> > +static void goog_cpm_rst_add_debugfs(struct goog_cpm_rst_debugfs_entry *entry,
> > +				     struct dentry *debugfs_root,
> > +				     const char *name)
> > +{
> > +	struct dentry *d = debugfs_create_dir(name, debugfs_root);
> > +
> > +	debugfs_create_file("assert", 0220, d, entry,
> > +			    &goog_cpm_rst_assert_debugfs_fops);
> > +	debugfs_create_file("deassert", 0220, d, entry,
> > +			    &goog_cpm_rst_deassert_debugfs_fops);
> > +}
> 
> Please drop the debugfs functionality or explain what it is needed for.

Ack. I think I'll probably go with "drop", but some notes:

There's no real way to test and validate a "reset" driver without a
consumer. There is no direct (even for debug) interface into the reset
API, unlike in some other subsystems (e.g., GPIO). I believe the main
purpose here on Pixel drivers has been hardware+driver testing, so one
can test reset functionality before hooking it up to real client
drivers, and without adding fake drivers or extra debug code (a la
"printf debugging").

(One might observe these results either via /dev/mem-like access to
registers, or even through external debug peripherals/consoles that can
monitor the status of the underlying component that is being reset.)

This all would generally be in an early hardware bringup scenario, so
admittedly it probably doesn't have as much of a use case in the
upstream kernel  -- it's a long shot for this kind of hardware/product
development to *actually* work directly on an upstream kernel, with
upstream drivers.

...but if I were imagining a better way to do this without bypassing
reference counting: perhaps it could be useful to a have a
debug-oriented "reset client" driver, that could bind to arbitrary reset
devices, if they're not already owned, and expose a sysfs or debugfs
interface like this? That could fill similar use cases for this sort of
hardware testing/validation area.

But anyway, I understand such a proposal should definitely come
separately from this driver submission.

---

Thanks for the review. I'll try to integrate the rest of the feedback in
v2.

Brian
