Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705615;
	b=kvwOnt35z/2eZ5WFw9W6ZetCR3uE76du/UVcRJRI92/7O/taIre3sh8zqs/G6Ap9CdtZ
	 nimu4QRyktVU+JULFs0uebDRG2Mx9GjIqtRk8DbEyiYNTkWGg/293KighFK1cZ4mm8TjO
	 ze+aBzmietbO2KkA6iGwcLXxAZpe9FrhM2e1pwz62GVAfHl/SSpfjhXdICJF+j7vHVJgi
	 ehGKCDUbUGWOAa6eS8FoGybn29EBgSg8X4z/gFNh2LFRICt/+hYX4uNVLsKVNB3iUo4sZ
	 SvevdTdIA8tEklyVggGXjaLc0GAeXSDm1K+o1i2NvkFNEpclmEPnkKGuobFdCGk1odw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705615;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m0qyUESMc56kSUhZkAax4TSYZKgGyd+m6l8qEmY93H0=;
	b=yMovFheTdcmi6kiVS5GADjPbHYnk7OKfAqWL3tQ17fTPRjTY9PS/4fvdwMlWIXhIB7vD
	 XQ0Lx1nXEiRMCH/OHpJeCw68gED85R0lPClTmzb3CP+hGNAo+XuUFg4Go4L759J9G1WQJ
	 952JjEaMsd1kSbBpOpwXrpxlv0TFFCMP06yST8HxRjDR6WgyC06AZYkWtJmQjVoWqUsEm
	 Tq/8Xp4wE/DFbACdUF94r7r7w30rKRxRc87efEcHfIqfjh5zotb7FlHVkpJvTRodghaHV
	 nPg2H7bsbvEfrlSICMkzsHuz+ZgLQvRw55zZYZCP7yZ3X+ERYlgp/HtZAV8NQCCFzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DGX2Qzx8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qpEPl1Bs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF8606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DF8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DGX2Qzx8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qpEPl1Bs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0qyUESMc56kSUhZkAax4TSYZKgGyd+m6l8qEmY93H0=;
	b=DGX2Qzx8TZPQV0DqKuZTKsJ3Wwz039C4uWPBMwRbb3w1A1GnNTq7uOIaWwJ5qyEoeFRkiK
	L0QYZ8raD14EBMi7SD9U1mAAA4vUBhdEgaXWZJhj3Y54lfWb10OBtnyEqtNMmJ6bL60f8/
	nBmdukyvYdGbcAa+dfvOMLUPR9ghtYw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-iza5a_BlMEyZcIXMj81r8A-1; Tue, 03 Nov 2026 06:33:33 -0500
X-MC-Unique: iza5a_BlMEyZcIXMj81r8A-1
X-Mimecast-MFC-AGG-ID: iza5a_BlMEyZcIXMj81r8A_1793705612
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfa054f26so3274644f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793705612; x=1794310412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0qyUESMc56kSUhZkAax4TSYZKgGyd+m6l8qEmY93H0=;
        b=qpEPl1BsK3fNos11elN5CdjrFrO1abEuF1unPCUzejiTg4NBDjTPsXPeukXcMhjlIV
         nZf3ZmbVcJ3hRBydHFBW/PhlSN9AUoyoeYVnJyww21eKW/SnXxtU/bhxafSzACgCOd8P
         Mdxp3ZFZflhc5OV+NIwhz0IB7HGd0TP6VobdcdwzdfDeZ4DRNDJvbD3iweXqzEnoAZFS
         A26d7Pu0wUhJVLOMoj5yVIMAIOwKHZ6aeB6KqRYhkaMNVYbqqLTEaz9bYpGp1/rQIqnt
         tIFDHF4sBwSQpNnCRVT8dW8JemSmpFdRcoWhGI4rYoDK09bSIZK7Nqyh8+T5lc0LVgzw
         ZsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705612; x=1794310412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0qyUESMc56kSUhZkAax4TSYZKgGyd+m6l8qEmY93H0=;
        b=G6W8XQa6MNvWAO959bNUrTznQqnmEWmrGublSEcrkqpISP8Liyw9Wp59I10+/aR1m6
         VDvK9uiSIOTWgUZLKqN99T9qUKFgf5wX6e1Ya2eLa842YtAL1sjBgzHj+EbgkqweKtaM
         /hQJuF8RExzRs3o0PHmLKby0JPOFmqk/z47Wkl/wv/fZjZx8GjPwJxelIyVa1ZhpxL8x
         mlwm8HZA0L9h6RUWdS/EcOZIdKn8dbo0rkB6ScPk6an2ffEJN6kWkywVatNcraZbaNVz
         OXLMEeiYCuJHf3QohJC8jfEjnVCfvCUaY6PEma/9OM0Fd3Oes/VvchV0VwxoE6Wr35D8
         hPPQ==
X-Forwarded-Encrypted: i=1; AKwUvBweNAUWbRpEqlMRYBSHPndc7zCBsFfQoMN16DqnXzhDziPNNAq67Rn3uy96BvYdk55FDOE3cmqlyEwxOn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TIEUkyM0EAQDrLXeh6UilzhGEH8URczvyYWHyGcFUx77i/LUI
	bEYSc2VZtJjZzcC5XAZO1uwQEF82L4ihEspsKdnak+w0gqRNhtq84S4kRpVmChoLFbtY/WKXyhl
	PPuTBNeUMqHLTRUEWS+nGQYrpgEotLZDeVUSvLqL8RbbsXPiBFPfvTP584VsT0xa0kQ==
X-Gm-Gg: AYBFou3pxvyTO7wgHtXFfXSA26ArocpQd+SuG05M8jTTOEP0ymChBXaw0FSdCtu4fCz
	cAGUM342FQ34QpIXqcjoP0P6K0fhF+oztMcmnFJYD3QsEVp2vQK84cfKGoCu5ykSVJ/FRo5W4yk
	lPAfFeBYB6HUPoY1celp5Nhr4fAfnS5bS9b83OMyfEyXVvEjFpbQtFvlXHzyWABc3FN//mNoKIe
	cQZAqgdR1W/3/Ea9lZpaAKKvKvxKf6FHOfCLaTrWUWC0kkhGrEoHM67q9HarlaKE0CbzcsWYYZc
	uiegE0TJvn+rg49Gatvx8yuew0aqSxqT1pF1lPZCGJC4b59q3VrfSWXlVm9vCNiNsQVswhX8wIL
	a4iLOovefXUp1Xcg2KFHq1qqnKsd7jrNoOH90CMzKoA==
X-Received: by 2002:a05:600c:4e12:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ac1765cf2cmr304324175e9.19.1793705611593;
        Tue, 03 Nov 2026 03:33:31 -0800 (PST)
X-Received: by 2002:a05:600c:4e12:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ac1765cf2cmr304323575e9.19.1793705611091;
        Tue, 03 Nov 2026 03:33:31 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm51757025e9.10.2026.11.03.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:33:30 -0800 (PST)
Date: Tue, 3 Nov 2026 06:33:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: amit@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuc63@xiaopeng.com
Subject: Re: [PATCH] virtio: console: check the control packet size before
 parsing it
Message-ID: <20261103062747-mutt-send-email-mst@kernel.org>
References: <20261103043238-mutt-send-email-mst@kernel.org>
 <20261103111734.472283-1-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261103111734.472283-1-zhugl3@xiaopeng.com>

On Tue, Nov 03, 2026 at 07:17:34PM +0800, Guanglei Zhu wrote:
> You are right, the impact statement does not hold up: the reused
> buffer still contains a previously valid control message,

Not always, the buffers are allocated with GFP_KERNEL on the
1st pass.

> so a short
> packet makes the driver parse stale - not attacker-controlled - data,

Who is the attacker here the device? it is absolutely
controlling all of virtio_console_control.

> and that is not worth carrying an extra check for.  Please drop this
> patch.
> 
> Sorry for the noise, and thanks for the review.

I ask that you please think critically not just go back and forth on it
like an LLM.

-- 
MST

