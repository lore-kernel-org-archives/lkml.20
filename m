Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794428120;
	b=soWqAIzxdfC3Ws0KoRv6v8CLo+9cd1czNtYn7olNudewOsJJ5RgR1h+utqneb9f9qAx7
	 gEGq0RHlFKamYPN4S1FNDC6V6vXU33d6s7DjSs473FN35NeoYFAMu5pLbh0U2R8YIFlLf
	 slbiDLo+zIQ5tQAuaY1g/hULvrrwClm0UoLyUyTnP7871Nq/dNxbJ8bFSZLXPyONgepBQ
	 /8em2X33AwejtG8jxKhURLl3j9l8hQkKIGd/a0/VgyWhnfa7F0gFggaPQjn87YyOHEMEJ
	 0+7wNUF2AvMO9fkQSZwWPitw4Pa4M5rkM0Ig1OBlHtkkmX/kH8aHJPUaV7fgaIACwiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
	b=5YsrWEsQqW1BDE7DwYk2SFbKWXV5aNAa6zQfau4TGR+Qv7MXAIyZOvlBVkPPa4eulZwB
	 ++BgoFwMucCPY+d8WsprWFLhCr5GmQ7KGw5+dCe4aoD7bVwWx+kX6dmiIEG3gI22shkzV
	 cA9BtQk9MbxWVd2V5k9eA/pnBI910Rt9yAdp4/2u9illLGA5m6saqCqnhm1lDGZr8AnS3
	 y0cuveD3gOwz25W7IVc3VmH9Pgs/9JrhWpVxtN7pK2nDyx4E74yZWxvdPD1LhRNJh1Xaf
	 4Qf2a9DFEhWy0MrO7vbghIOUJpmvUtTIcAizurPO8DlUtiA8I/+wgX9l43Lm8/vtjRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iQqhYlpi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA85606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA85606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iQqhYlpi
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4c9abc1824so503392066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794428118; cv=none;
        d=google.com; s=arc-20260327;
        b=fRZd3Bnq7cqgVV/zxlB6rmizLYchecMnkjZpnw8BiXmgMifsFfBi3i2FhQjbzhsDRL
         E98RMIl5klgtl1WIlmazhl1xswrcA3RCYlnydz7X1n+vImWbqFJ7c8RkDcUZQTWFkm4F
         1dYEwRFBZTSEbXQ5s+zBqlkBxW4R4x/J73mDLETh9XYpBRoFHw4/DKj1L+csxQ3aqKai
         aLcndMNDiXTBWViSbjewocpyCtk8cDjkVVt39DGpUVS5BFcy6Yc48D0QB3MbrKdzDSwB
         C8GyYLpQYGVges/VBECSi8sPkoGSu4Khzr05UDpG6ADq/Axlf4SkWOFU681GXJAMQnyF
         xLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        fh=pRc6yAdhZdoIXf8YmL5zcnLWpznY5UzPCgCkTwlEQm8=;
        b=TOI/ucOhONvA30qAnQNcTaiWO/+A/WGV3g+o5jp8YATynTOAiAP4Ud6hC39fGNHHpW
         MHnQclNjcz3jP/wox5H5cK9R4AizZj3+y95ff5gaefwIi63d5C4EUzqax/fpqFNY+/Rq
         CENYFZhO+teIRQGuWKq0FqJQ60A8+66vl8spUpVsZoVHy0T34Po5mox8bm8GZECyJ/si
         w28qGP9IiV/c5hyINwIt10zU+SSdTB0vU0WOW7MIMM31WZuYvF+pLTu+2gdio0uXW3Fs
         d+MZxRJTTLzc48urCmREvOB3ECAox4Qfl81eYtFmxnMW2iPA+FOnPnBqMrwWboHAPSqU
         UdpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794428118; x=1795032918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        b=iQqhYlpiDzFnw6ASBEjBccgiaVPkZLP1FAaSdtAEVe5kR3uRwNmNV1nIdylZJvsqlT
         G01QdTGkMev8XoSkokAVURNlnVoMEgNCcVOBxXWGIgQnskIgoJAoZT7LNXfrWtBHsnfb
         pLw5xoVF25+2rFnQpLCVi7mdFLVBUyDPoA0zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428118; x=1795032918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        b=EYaChD9+wrs5v55yTJXU9AYtBPPL+sWLB+uOyVyLFHlOxOY8RTTZRrrIRjz7wOjTEJ
         qlumuuzf0Ir+mnoPC/9/AaePbKmYTOrdhgIeXnEzeOL+czW9LNuyTwct3sXnnPtpLU7R
         2DtsKsoGWrKLSuy29vCzmihyCukp8dUzFcB7CWVci7mszYqkccd6SNjNrHOHsC1tpeDI
         I3X8ekxB17GZQoRpcLTl4FRowQZoCvMjBfli9N3WwWwQK0GEP10tp83E0Jwpk6saXsLV
         xDad0WuWlViQJlkCunT7UZYgTnT8dIf8/NuhLU9Q1g1HCdi/+ttIcIvuXeJVHSsD/DK0
         ZgbA==
X-Forwarded-Encrypted: i=1; AL+hErGghQvobCz9Hkl7/lOAB5J1kTiOxjbd6rNfUeBRVOutn5hBWKHzHjEU0XsAW1K6Smb3FhS2McolJVxV3nQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ndoJJ8BzfnjyWoUtLfx/K/popKV9PCJ81Q0h8WnxASz4/yc0k
	40EIxKYdhfMD5l90MpQO9dWx/aR54pXukZ2+nVifYDzENJ++QVXk9kMDGMToGHahF9AwPuT9fgh
	CZrFteM1tQ9W0YTBnwsZcMx8QXNr6bySpysZHOcRD
X-Gm-Gg: AYBFou3NAguc3bvKvK1rnN6RW8bKvgu0ypCfs2gDdpjTW5CgOT3xHk9n6xt2u/sEJjq
	wYXmm5lXSSB2wqj6JDH78c1ogAZaXehACsgbNNSb0qLzrrR+DYGm4+QhZjZrccaSY/Om4y73ldf
	POCWfu5Rlw6EWxeOXfDe2agP9v+iRkebKWvHvsRZwWcvLd73ZB0no/eD4/QIycVaa3luFT1gPA8
	LXC14TxK9Wo7bcvGLDxeANgRMeSX0Uxl0C8vl/fsQBxbsxdDCAJNaKZWgqRopZJklfNEP4OrAoo
	AFbXOJSJqOKF8HCb3XvXdwwzf51vFUVitP/AAGDepYp9NuTIXCziNokUFBP7A6znC067fLwsMsO
	uSjTqaiyup132KPCEMa0hCGNuTXS8NhPztrJf9EKQ8oTInMKxOSnVfoK/PgAinuwcvLh9NunRie
	kwFkM//ogDX9KrbD2xE6Z038ncftS4PETS04YEDC4jxEJaQ9y4
X-Received: by 2002:a17:907:9454:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c5066a82a5emr284901466b.9.1794428118138; Wed, 11 Nov 2026
 12:15:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com> <avPZeSgU8ABix34f@gractus.seuss>
In-Reply-To: <avPZeSgU8ABix34f@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2026 20:15:06 +0000
X-Gm-Features: AclHuK-kOq9TFXAlofL_aQgLmTwNgVeU9jF5L7666dJWRKAUQkobhjJQaDq30ws
Message-ID: <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Doug Anderson <dianders@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 10 Nov 2026 at 21:16, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Nov 06, 2026 at 06:43:18PM -0800, Doug Anderson wrote:
> > Hi Simon,
> >
> > On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> > > > representation of a devicetree node and its subtree:
> > >
> > > Please can you start with the motivation, i.e. why a live tree is
> > > needed and what will use it? The list below mostly repeats the
> > > docstrings.
> >
> > Makes sense. In my draft v4 I've updated the commit message to lead
> > with the motivation and condensed the summary so it doesn't repeat the
> > docstrings:
> >
> >     `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
> >     device tree blobs, where inserting or deleting nodes and properties
> >     shifts subsequent node offsets. That works well for in-place queries and
> >     localized edits, but makes multi-tree comparison, structural diffing,
> >     and bottom-up tree construction (as needed by the upcoming `fdtfactor`
> >     tool) awkward and error-prone.
> >
> >     Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory live
> >     tree representation where each node holds `props` (a dict mapping
> >     property name to `libfdt.Property`) and `children` (a dict mapping child
> >     node name to child `DeviceTree`), along with `unflatten()` and
> >     `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees, and
> >     helpers for path lookup, node creation, and pre-order traversal.
> >
> >     Add unit tests in `tests/devicetree_tests.py` covering `DeviceTree`
> >     round-tripping, subtree unflattening, duplicate-name and corrupt-tree
> >     rejection, and navigation helpers.
> >
> > > > diff --git a/devicetree.py b/devicetree.py
> > > > new file mode 100644
> > > > index 0000000..f81b8fc
> > > > --- /dev/null
> > > > +++ b/devicetree.py
> > > > @@ -0,0 +1,226 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > +"""devicetree - Non-flattened in-memory device tree representation in Python."""
> > >
> > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > [1][2], which installs a top-level 'devicetree' package.
> > >
> > > I'm not sure what to suggest. Would libfdt_devicetree be too awful?
> >
> > Right. I'm OK with libfdt_devicetree. David: do you have any
> > objections?
>
> Don't love it, but can't quickly think of a better option.

Would libfdt_tree be better?

BTW we might be able to change pylibfdt to package (and even call it
libfdt on PyPi), iwc perhaps libfdt.devicetree might make sense, down
the track.

Regards,
Simon
