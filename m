Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931077;
	b=psBnE9qVm30EWmrCowsWAFabpohAb6AX3Zv091DcFw2WH0E1CGbWZNamQF6epZ0UG97Y
	 qrrZShmc+phM/h52erxwehfdXz79qus60mOqKH/g3Kq+Pl1MYC+rqkDSOavg8JUTvFTvm
	 7JHRvrWy2Kxq7enNTnWvMZclEXolNUhok888mdzp69HCUIRWrMQe0KlyWOfxxVZb8cSyi
	 bF17xxp2y7xMyMfcXnxPQ3QSLnRaJ4ZIavdC3w/nNiNx9DADzVijGpiTZgA3u1hABa0kq
	 Tlh2U9Yo0SMU6Mut4M7+PUJOM3hOxp4qP3scTOBSDmTN5Xi73aXgwxNRG2nVy3u4rgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:In-Reply-To:References:MIME-Version;
	bh=jf62vaeUsY2yO43cSs/blH2TUhxnaYyy44Chrc7BGd4=;
	b=HQmAyWsGC9mLMfzmWc4brm2ShVUc2f2dCDMqplw7n8YbgUsLo3RrN7/usN/RB5IGCoKw
	 /gSUPoXbr7gm43dNVIo1hLOHgTo/lZXEIEt+j77mHCMJC86hYTLlM7RP8u9PoshI2iHVd
	 +zTmx9zrl2/iBu/UIkVGTgFkmMKO9zq5qNyoqxePDAKUZvL69UBbiYXz8jkxFeg8Va74b
	 oNgCRvrFsOweWr8KJZFH85qeSoL8VimQTS62vj2hIQXlOSOSBf9mB//HU8W7Em7mWwevo
	 88iKZAQmTN0nscccyNZF/B0rQZ0eey88z1/pEcuevydDqgb9NLmZQqPe5TdbYbeCs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="bd/1gPIM";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC9E606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC9E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=bd/1gPIM
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso466769eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793931076; x=1794535876; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jf62vaeUsY2yO43cSs/blH2TUhxnaYyy44Chrc7BGd4=;
        b=bd/1gPIMML4DE+FFEFx8J25j7lGYR+PX0sSnFmHkdk/bm6JCWrsXM9/nNxODkEmv7v
         KYTrQjqwUOlS5hJ32SIXnTgqZRCQUFhel1fwmuxL1iV4oDrFFbxGRi3/GoS4Hr/l8V7u
         tSLNPHRwD+6ezTizTFhHUmfV7in9PQDZmcVdoW+BOz98YatfDA9PaI8sFjVHMfVCj54+
         0+IsgPM2bWdNTaY/6Dz/IqRsPD7ndLzUU4r2wG8Skit2rcjfYkmTvAJCxN1oiFQ+vBfC
         hDxhM3rLfxnZ43TGzhYgEFDOscXW/0apUlg5ejiR/7bf9HwuKqb3YBc3gGzJFfxk6V/R
         L3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931076; x=1794535876;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jf62vaeUsY2yO43cSs/blH2TUhxnaYyy44Chrc7BGd4=;
        b=hKnTdv2ind8fmx9Go/agTrWesIK5Dk6Ptit2vIudp5gSATAeU0mipmvLh8ZB1Hxw5E
         vAI9LlELQSC+00s8f/VvEuGlpWvEdTEwG1IndovbKMfXSkURsw8U+Xf4LvsAuaF+gsmt
         oeSr7wqgFI4SGvsTg5/vDyMk831j9i/lN8d2xkWGEhwIAE+puZBNW19JEYUN+WW4rmFv
         xsW8SOesoxImNV1GgJ+eus+78yvsOxRUGwL69uVIKIWB0HQPxtbLKI0hMK5fqToXurnK
         WmMMEpLBsd+N5nSWZ+5u1Ky530PygjldKsgBVTMXURIvQ0tViT+YCiJovkuXEtCs7I1W
         qX3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBiRbh8y7LGXUT8oM+hZtNLYLz6a2lJeKZvwiGR0OwW0UDpa2I4VacG0N97+5u6zdDP4iLhayXGzgxIII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y6+CeQaWLJ7qVfke2BUJm/4D/h6Mj2uepkdLl92XoPKtE0Yf8
	TBY77QdWaNKybWKG/pXbBySEep0uKsRMYQfAoC8njPFQaHeJo3AqVqwnDTMqqAQ5Ivw=
X-Gm-Gg: AYBFou2K7GdfQCPH+YXxA56l8yg+4Aw5u1k2KPxwsnvRC3ba/HGY2PVAVLVnTfQXqLS
	lH2O8twR/jmEa5p7bev2F03vvsm2po6jTsDaEXxUOd2N79TND0keo1BzAJuh7EEquV0fsSd1Zpu
	29R3+DCRQSzFy5nUubebg/FAE3qkgJfbj8JcN1KLbkHBaByNwZ5BApOqCrBl6W7b4tZ6ApvTVdp
	3lrwKMjICLFDRzZ80wthtblKOi4HFBIqkrx/TNjQxsK1zRs1iSd++BA6MbZoN/nCKlOIBHSx8Bh
	Udu8akoT0tjeo2jpObi2X10FH8TKq09iDCNE5CNr/ZNDXZQfaNspatvWMpr2m9LM9mFWFE1GBIF
	N15vW7+71/spHPgIdgduKSbB+ccGaINk9tgXSHITpoIO7KUut0P3urFL9+TQVnvNIHd3rPZOJFc
	WqX5aVfIvISvhBhAw5SEaB/XZNWdaIun0BDO7ciW1i0UyeN7Qt7O3fW1qyBmU/3Ei29QTKEP41F
	YKeupW1RhAM5czGG7vohLhASQzniL699tExovmRMKZFys8MHN6CSLY/T8UY9sUXg8t4t5yjnKuF
	dXN7wNQxQrvRxbFrBjyiY48+9PIgeQ==
X-Received: by 2002:a05:7301:18ac:b0:36e:c04b:53ca with SMTP id 5a478bee46e88-36f76c11206mr1366102eec.28.1793931075409;
        Thu, 05 Nov 2026 18:11:15 -0800 (PST)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faaa8f1e9sm1136097eec.28.2026.11.05.18.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:11:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 18:11:14 -0800
Message-Id: <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105124030.GA1449284-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261105124030.GA1449284-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 06:40:30AM -0600, Rob Herring wrote:
> I'd rather have my added device working than refusing to probe because
> some arbitrary device index couldn't be used. There may be some user
> that has a working system today and then this change would break them.
> We can't really have that. I view aliases as a request, not a
> requirement. It's perfectly valid for an OS to just ignore them
> completely.
>
> I have no issue if we make the failure to use an alias louder, but I
> guess that's not your main issue.

OK. I'll drop that from overlay-notes.rst.

Watchdog and rtc already treat an alias as a request: they try the
aliased id and take a dynamic one if it is in use. The subsystems that
fail are the ones that keep their dynamic range clear of boot-time aliases,
which they cannot do for an overlay applied later: i2c, i3c, spi and
mmc. On x86/ACPI and other systems booting without a base DT there are
no boot-time aliases at all, so that range is empty and dynamic
numbering starts at 0, right where overlay aliases would land.

Would you like v9 to give those four the same fallback, with a warning,
so the behaviour is consistent across subsystems? For i2c, the alias
lookup would move into i2c_allocate_adapter_id(), so i2c_add_adapter()
just sets nr = -1:

	if (adap->nr == -1)
		alias = of_alias_get_id(adap->dev.of_node, "i2c");
	...
	mutex_lock(&core_lock);
	if (alias >= 0) {
		id = idr_alloc(&i2c_adapter_idr, NULL, alias, alias + 1,
			       GFP_KERNEL);
		if (id != -ENOSPC)
			goto unlock;
		pr_warn("adapter '%s': alias i2c%d already in use, using a dynamic bus number\n",
			adap->name, alias);
	}
	id = idr_alloc(&i2c_adapter_idr, NULL, start, end, GFP_KERNEL);
unlock:
	mutex_unlock(&core_lock);

i3c, spi and mmc would get the same few lines in their id allocation.
mtd and serial don't keep a range clear for aliases, so boot-time
aliases can already collide there today; I'd leave them for a
follow-up.

That would extend the series beyond drivers/of into four subsystems,
with acks needed from their maintainers, so I wanted to check you're
OK with that scope before going ahead.

Your two earlier suggestions, keeping alias and dynamic ranges apart
or only honoring overlay aliases whose names are absent from the base
DT, run into the same empty range: the first would reject every
overlay alias, the second would accept every one.

Thanks,
Abdurrahman
