Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864F38911E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709656; cv=none; b=p1rMlNJADShxdVcf7ZU8kFY3/aqKBvqmmO6tQ6joimXAU61xrxOqpzGZittWv4PCtKJ8oJwR+rPg7rlZ38HiWsr/x3luSmUbNY8A2ww9TlvEb7+X3/BuAjJItOfVv24rDXRbOqDIJoVyZ37ajZ32RuAiwbTCRJkGGw97DMMFBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709656; c=relaxed/simple;
	bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPoREpDX0eRRe2cTEAi5m5Avy3nhMSaM1gOqJSk+rEqlnNZRI1yEDvppM2ThTUMIcwszcpxnosR+yChGKZl+Vxb8zG1CBcLKQOBiWaITEXg6+8V3h+NwakCb2qaWvW3RRbRRNxoYjJMhASFD+jopolqdnViG6pKHbWc84zkt9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=X1gc3l2U; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="X1gc3l2U"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332a80a731so38180271cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790709653; x=1791314453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=;
        b=X1gc3l2U38um7Ld/2czfX6tZhuVMM5PMBpFluvKpCULxxCxmfI8sKVYDF3iGWUUJ3L
         7DmsfW10ia1CDyYyY7Of+L/NDX8qhowLy6WGh+5734bjjiSIU8ScgL5UiMLa9cMDZ2km
         0lZTjnPiW3o+UxPdoPX3LxoG4CWGB7ab1YypovdT0BRCiF4isH7yDsGVeWwF8aW3vDw9
         NoIB8EEuAu3IgHtPM+8P0php8nlAFEpv4jmZP+N0xyd1AJSBvHnG2xMDIjkExMPTKzF7
         IdWryBNJua5JnHdph0qTAVMGgKTbSDvZYR0A1K0z/ulrNv6oyXhIgwjpMmRHatvoVvPa
         fqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709653; x=1791314453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VADwhSMccUimO/ZiUkIG922aevQQ5rz0rj8ZvS19iM=;
        b=OfMTT3r17wSqB1wTbBytqI83Vb8k46G3QURGornjOYShafgCxs7cl/aPv/HSRHTUp6
         10ySC+ImnfP25Jsahb5Wyl/fwnsdhu3L85OEDRxzRKn9hRwquGoWxL0aiRhmyuoLfx3N
         S0f0J3DfOO3nGnRUiq0vSnkBrOZUiadkUqgOulwL4LxIXnj/8MW5jXmmxy6JLIU1ppKX
         HfvhuZPJ/gbx8CShtAJURHwHEUcr1YXNBggS0Hpf2obKyhPV4ST24gIK9N+wXLW5uWwG
         xI+dMTvo96xJOTwyDY9nNv7y6FM8/vb/0S6lG5dVsjhPpJLecLdK4kJdhtYbFo9kv8Il
         st5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy83YfdmiY+EkcXLrKjsLWqRoP8GBcdovgV7wC6SAUB5NboICoPAsMf0W3kscuNtKexTTb2U3WeksUYfjU=@vger.kernel.org
X-Gm-Message-State: AFuF++k8c5/1JpRenO9i9s9OzD4xCdfiGJ82ttZeCtbKyjgEZcidVE8+
	ngEWVEabrkZrZUf7BrdP95NwzWcTRGd3gDItYWyk5+eyDGYRWPD+viKEJRH+5jSJk3k=
X-Gm-Gg: AYBFou0s6IsjTUq2rZg0daj8RiF4hhlXtaJwN7mKmD8pYPaTHIKPU7berZ/QOyHezdb
	5cDadougC4QoOGTRJltsfRuAALc75LwJwPvp5ak2YEyZ4Hl1rIIVm/KeBJn/rvJMKXRMTwIWC1d
	a9zX6DkhJr7dJm8RhW/5PMdDXZsRFxTej7k97vZ+SGRnlhiwW1AdDBz/avckdNVujU7nYIYjlc0
	77Diq6XtfzqOAUwB0DjG+IPZYwzFxrYajgm/8XXEcvr1sbwPtPbHPsyxo4kEuL/8TQP/y2KRY/9
	lbn8cycOqYyUEDCrpUwua/6dj7gVEvlJQMqcStNUDFzpotzH0F+CHzbYKN5Xv2MRkLmZ/y/EkhY
	vSUFjsYBelPikM5wgBhCOsxKjN9Nz1gRkN/xaDjgAp+ZgL62PUHU0Z/PfCPILn3Cxpf3WOjF7Hi
	/QVkqZelQCd5LCxSKnyJnWX9Z4XBkK8vWjlOPcEdBjS4G6
X-Received: by 2002:a05:622a:903:b0:533:3f92:50f0 with SMTP id d75a77b69052e-5336a3a0ab1mr5522681cf.27.1790709653176;
        Tue, 29 Sep 2026 12:20:53 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533699882absm2723431cf.4.2026.09.29.12.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:20:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBdNj-00000009r7r-3fqI;
	Tue, 29 Sep 2026 16:20:51 -0300
Date: Tue, 29 Sep 2026 16:20:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Message-ID: <20260929192051.GN163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>

On Tue, Sep 29, 2026 at 05:57:46PM +0100, Yeoreum Yun wrote:
> This series adds support for Arm Confidential Compute Architecture (CCA)
> measurement registers in the Linux kernel, enabling guest Realms to
> access, extend, and expose measurement values for attestation and runtime
> integrity tracking.

I'd prefer not to add any more tsm_measurements users until we bottom
out on the attestation subsystem.. Mainly because it establishes uAPI
that doesn't really do everything people need from this stuff..

The actual code seemed reasonble from a quick glance.

Jason
