Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520943;
	b=beycmVPSyctP8Kdjdnacc6AP0cweyJj3e8Hy3FH7KpjkaldF9QH7xzo6tQwEJn4i6kOl
	 xhSBY/LYCEkBmUbVFRCAyLmZSeakdn+jnL9JiPmkCQ0Sy5FMuXqnH5wRJ05cbAKIINuub
	 oJC/Zv6kIMFwu/L6gEjPbydw5NY+4uxJzSJYGE1zVveFTMUHtZbnhJs7pgdpZ6neJfTNk
	 AqbhUw1B/vOnF+EHrSFzftqxQ1ocfV9JBHhnItC4uxl2r6fJNaxhc2BE5xyEAowdkvG4X
	 Rp4eZhpo98IxH8lzaEEaJZAFG8gwk/h/RVYw1pDFTNKm5n28yqG+EzhSahLI0wkK54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KkjN1cxceCxoRkdu1/EYi0tZwQkA6fRy7dyW7MOKnbU=;
	b=2H0j0qBL3yW66Mw9Fid69To6gb0oYTXAZ8EzL0FA+7PdL6hCByqQ06SGx6csx3LP1Slk
	 CRm6eGrJlfxV58fMW2RSMsvg19WycXXx/E+lDTnF272lU1aB64XrHocNTEEWF9m2UzztT
	 lo5BBFug37b+XP5ibGRFU8Ag7mB1WNr9OMxWMtC5yoRNbAQgtXeiYKmvAqpcyRHxwZ33w
	 Uoka1ZueaONMcRLLDr8I90YcUB2mNuJcRvtElBhMoMOG8OgWD/g0URv+Sb0ejR/J+RWR4
	 gjl9HbTDBiNJbfDMEZHQKFCWosw/AUB7hCQVIw3XNSZFsgpf3zEZQjtSXSdhutGpYaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTocFYkf;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91095606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91095606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTocFYkf
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so258306f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520941; x=1795125741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkjN1cxceCxoRkdu1/EYi0tZwQkA6fRy7dyW7MOKnbU=;
        b=fTocFYkfKMlUAQIrkpvAt6eSIdot2UERMCemdv1uXBFQSWdfL0xxN07LmxCJrn7ppt
         9jaiDix5Mc7lPeMNttuBtDDgA7xRy6NirAbZg+PE27VmYUkbKbKEY4azF8LI79V8YMG0
         40pS7WX3Cynp2kEgjegcPQ6riZQ1/2UhmabGH0yZ2E6UQI8OVyT9xrWHyjKL/xhiL572
         d758c992jPKsARShBAzvi3HlqZ+IlhV8spirDHQFHWvOHoLBGUs1sbXgASQfang9fs28
         40K2WYmWTykI7YeAaTdtHFpez0L/dZkfdomSQ48GoLBiadoB4wgzKH9N2q1f7y0WHAgr
         1h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520941; x=1795125741;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkjN1cxceCxoRkdu1/EYi0tZwQkA6fRy7dyW7MOKnbU=;
        b=TZf85pOrVKs3+ztKZeIRyKvKkRIA2USvFQjkF1HCDkGzyPSzKXzrAqUFDN8UvnhVOF
         /bbUbrL6w6rFNBRg4F9Rue4BsR+ps2L8dS78YqLDmmq9aj8GvaXgdk9tM88IltmIB1U/
         +gOmf4CgLBr1f8fl0D8kIxlF5hosq5IiZ5wtbZ2vR5lPs8FsFithO2ArQrqjZtRPfIrM
         UByHTu+PEe4Sg9hfGvA8stXkg94wbUTMO2Aj4z61lYlr+YG3ymUKX+wXR3eJ6NuMaolx
         UnjjcEHv+VsHwATFEqcTDmy9uAWDVuhAanFnYe4IZixEqXF+e3sfmmSMJTidd+/NWcXv
         Laaw==
X-Forwarded-Encrypted: i=1; AL+hErFXyqahkd6GZ8kpNKnb+E0VBmjK42XoM86WrHEjj8crxFTjhc+WKSN39dOnSyGmdSD6JSqRTz15Hz4622E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pEadgPQRalY+KVWHLIjb9ji+fPv0u66eNlvM7eHaa1Vuwwo1Z
	p9APKSJAQhnXaoSQ35BzbZyl3gyIbP8WhSVCmqh+yv14cfyJvVrRBdYn
X-Gm-Gg: AYBFou1e7dIoljpF1peDjsnzYOmlPRrEyAce4XhTb94FlCIZnmkt0GQ7rvMlwxpbVJD
	ZTX37KbfBwuWJ5BWFMv8Ud0nTrxQ0UxB7+75mP51gHIwP/TnCE8JoC0rmqWDBPn1VhuJtlwaQp5
	8r7i9pqm4fgqnH1kfy+5hFmFrU4e396YnuYjLCiCZEWuLTqkg2GmGaTobe166JqtkvcQxTFLzNH
	/Xv4QeWBTD3Ss+T537125ghY0AA1jXvCdARcihyjNHbpFzclSBL+eHmKd9dO1qldg25gKbE/EfD
	v7C5dBGbOgNqG5iUulcDxqLKf03/D0JxleTkCZLDk3cJYRBbKhipnAvLJGvnyMkTjWn6+4AHkVS
	3MxMuTo3NFW0Dyfk8gUEx88WcAxVvqQvjoLXgFRhVPjES+3jMaxkspN965Y9X9TiKbS6pnH/DXJ
	mfgUHDTu3BCOZsYu1U1ldJ1+ZMDe5JD8ugZ9rIljEBjdSENNAfJYZ5malxbfHXD+PkiWR1LP1jG
	Poav2mpkJsm4khWwXLM6Sek1eOuGh+6rat0oLo+ry3j400eKYlOF2BP/bv85AxXhSdMHUGycF4t
	IobkTdOzuYMCZoM2s1EHjsu0ezl1W5aUPnHBZprIX/SKAD4YcrskGpSmqwDTU+kuGA==
X-Received: by 2002:a5d:5d07:0:b0:48f:e879:5890 with SMTP id ffacd0b85a97d-49c727d1ea8mr1719571f8f.32.1794520940752;
        Thu, 12 Nov 2026 14:02:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm1796040f8f.1.2026.11.12.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:02:20 -0800 (PST)
Date: Thu, 12 Nov 2026 22:02:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Di Wu <diwux@google.com>,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261112220218.1adae5e5@pumpkin>
In-Reply-To: <20261112020439.37b0da70@jic23-hlaptop>
References: <20261111072608.3490763-1-diwux@google.com>
	<avR-KT-6e77EexZn@ashevche-desk.local>
	<20261112020439.37b0da70@jic23-hlaptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 02:04:39 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Wed, 11 Nov 2026 16:39:37 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:  
> > > Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> > > and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> > > PAGE_SIZE limit and is the preferred helper for show callbacks.    
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > 
> > ...
> >   
> > > -	return sprintf(buf, "%d.%06u\n",
> > > -		       latency / 1000,
> > > -		       (latency % 1000) * 1000);
> > > +	return sysfs_emit(buf, "%d.%06u\n",
> > > +			  latency / 1000,
> > > +			  (latency % 1000) * 1000);    
> > 
> > As David said, since you touched these lines, make the less amount of them
> > while at it.
> > 
> > (But no need to resend, usually Jonathan is kind to tweak this small thing.)
> >   
> Done and applied.
> 
> 

I just looked at that line again.
Why is it multiplying the remainder by 1000?
It could be:
	return sysfs_emit(buf, "%d.%03u000\n", latency / 1000, latency % 1000);
if the 6 digits after the decimal point are required.

David
