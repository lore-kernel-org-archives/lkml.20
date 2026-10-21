Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605191;
	b=JJd0MUS5dIggYWvUOQJ7ovkEG4c1yVSTX28mS/uAtL8o1js7mrszqEz3IrMDD/lHaBtW
	 NpjTyYEQ5rtnr1t/agT5Jo8BfBxqB8xEpmc9wnquTdf6d2rMhkD6E5A1SPwxEmu+pVNow
	 mjFaZ2j7c+v8Tjh5Z7pCm6yZCt6z4j6pPXrXhdRiHfGByPWkSMMC227ToBKqyBKeWK3p1
	 Zc/0vCzHeDxHKhWOldQrenXh/CQgX0zQHtw/Yq6E7EsjtFI/YHtdFxoXJ8+5S9qx1BfhV
	 87CG35LRP+uQXmCJzdP4M2zd15PFJgq0geGWFnGtsqqsFp+yAIAdPT2UZOHYyl8Nh4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=weV/t3lpY+C1wlkMGy3iusRIaCsEICQ6LvTEtzN/MEM=;
	b=4qT0Vzc+x/zQVUy8a/2H+CaId1hZsjd+SqojTVylMVnTgPvXcLXWslcaE+2aVf+ikZse
	 mFt/k5lna+E+qGk+BmgRKM/p3obQBh5T2PBFd+Z/1iDhgtDmjQ6zHP+Y04z9dshJInNyb
	 FbYrxh40XJZvjPpZus7cfoWEdpa406Z/7e74kiK0myn10CN9wFNzuKFlFBC1D0hy7VnZd
	 SGBqFJSSfOU4M32iXl97zRO0YYFC+zmDzkJH9HV2qq+yTAnd1B0KyTSfIPCWtEdDLyOj/
	 qB/s+HmEfhfN8muIyuNoLtZjZqYEFv3jTaKVlJsgIVzEXybUHKaqiPAL0T52BxuI/Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OPWzM0l8;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C2606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OPWzM0l8
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1052420c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605190; x=1793209990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weV/t3lpY+C1wlkMGy3iusRIaCsEICQ6LvTEtzN/MEM=;
        b=OPWzM0l8ptIfPVIvgbXuCW6EegEHiRBkVWJ2jiXv+CgDRuQWgxn4j8B34jOF3TbI00
         SsId14XwxZB/ca92qNcQDYAqwu0aYF+FICOSbdu+3UNLzb1l7WgSQ8TNxY+7hYqRNEhx
         ZlzCoIy68vjLJIR5HWsSYMptL6AQ05M62VP3VWTT/sQ8hhFGxWm46BSY63vo0xMor5L1
         oD9Tf2rTMd0U/iF/5kOg433PbgJj8JsrrQs5b08rEukFFnreMPj61Ryk+ztvCbHtTxVk
         UR/n1DDwNmGIfHlpAJyCkU+BFwCqC3yPe2zpJgiFympa8X1dVa8pMfSEh6m+mWbQxXYP
         KRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605190; x=1793209990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weV/t3lpY+C1wlkMGy3iusRIaCsEICQ6LvTEtzN/MEM=;
        b=lVYDAooLwK+SMoxRcSoigtUaAfzghI0Fw8/t+FZL66DSKDAP+n9rn2Pn2fxEjKQYPF
         DdQfO/rZ80SF3IccmCOILsiOnHfEZH0dYEjj+MwZypgVI36HkYD55eT1oE5PEplqRdGV
         CHVowOIvCnpNlC4DZX4e3VphSyeADAM00z6JuiWXr1ik7SC/sj7pfdNWS33YapwhRLqF
         pTHZxxEyNHUPUXuxvseandKyHWTuH6+fcK29LkZhCkQtRVMHmYsAVQlJWpuzOMexkjl3
         o7qh+SkNEtvSSezB0kA43ogpOyOXMEouRKKQ6JOFXEqOBfbw3CyEcoTU+jR0MV3xBjdu
         Sl/g==
X-Forwarded-Encrypted: i=1; AKwUvBxD6t5+2RMcDZe+CACFxmcQNglNSYyFVS5QENf84Bj7teiK5rAbKIwA4lRsJ7sJTBVbcxAv+jVFtBAsPK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4yHHiF/SNnigb0ZKiOOHnjBh0xbsTxMZq4e9S0Pl7EaDngnMH
	gpv1CP24q1kda4cM4TZeO+6UAC6BTWhpWXw+exEUjs8Q/DCofQHCbH2U
X-Gm-Gg: AYBFou1LOW6bIjdO77MqJErDo5R8RqWx+OGftBYQ9hlsQpDFsAbZ+1D2BfTj8OASJ21
	w1Ml/3kyEDN/mNDLOjA2bZzoiXW3NNOTUCPDy4XZ+9qS32xI6cs/3/bWV1p9aWV9rIxvyE5fkp0
	qGncGnlLLreZNfrx9g0aU58hGfm+BBg7hOEinmmf06/TqhbKtrhi2azTUOykXoHpmlCzRD+D9HY
	TU8tTrzLbes6U+QLQZjfjRRHn/qbChdkhjnmM8rPiUxe2j6D0yRiWBw1OaqGUf0W0oB7bp7lhjs
	ScHoSkbLOg+kx2UM/cxZ74j/nSsxk3tUN6htLboNl5OF01XmDPtdLp9d598c22Ua+tebw0fgTDf
	2GDC029ALReF29olNMVw7n/RJH0qS+fjQP1PgCnFz9TadgqOCR/y3zQfWPIAlagMbrcFeoyAxTg
	XxSVuj6/9cXRIHc1098hU6zR8j8XoG7MAcYX1IzHqiAlwQaWGsYG11hpyzXmuu976Jk1fgTsYWG
	pvvQ3LeaToyS91oLV3nNFKBSatJi406JbNDiF3iJaCvEJvGOx0UmEJ6kcfyn0R76UspLVHIj5xs
	c/GzG1wBP2wzHXq0j+REHw==
X-Received: by 2002:a05:701b:2313:b0:148:722b:7cbc with SMTP id a92af1059eb24-190a55c1a5bmr3066254c88.14.1792605189885;
        Wed, 21 Oct 2026 10:53:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm7114896c88.6.2026.10.21.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:53:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:53:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: soc_button_array - use __free() cleanup
 facilities to free memory
Message-ID: <atj71VUZdpHO4aBT@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
 <atjw4b-ICVGH3-2a@ashevche-desk.local>
 <atjyyqxnlqEvwNxh@google.com>
 <atj5pgIU0VCcrHHX@ashevche-desk.local>
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
In-Reply-To: <atj5pgIU0VCcrHHX@ashevche-desk.local>

On Wed, Oct 21, 2026 at 08:43:02PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 10:15:43AM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 21, 2026 at 08:05:37PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 20, 2026 at 06:50:00PM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > +	const union acpi_object *desc __free(kfree) = buf.pointer;
> > > 
> > > Rafael added 'acpi_object_free' for __free() (pun wasn't intended :-).
> > 
> > Not sure why it is better... It goes through ACPI_FREE() ->
> > acpi_os_free() wrappers which might be nice for ACPICA code, but has
> > limited utility in the rest of the kernel code...
> 
> Today it might be similar, tomorrow it might be different. ACPI objects should
> be freed with their proper APIs at least for the sake of consistency, no?

Fair enough. I'll add a todo to switch once it hits mainline.

Thanks.

-- 
Dmitry
