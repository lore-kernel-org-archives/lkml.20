Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350983;
	b=ebKKjJsmVw+FQ+8KSWysZUMFoCQL6Gnriebkv83AXj0yewKrPoq1cmnKXCpyd2IlfM8+
	 TX2F70GJ6i8QbLmJykaPpWspRwWC8SImE+4XeKzPx6WwWQ4A408w9ttgIzVhafB/b2siU
	 1hccUfbmYSCeFyU0kfPxiUCBU9trjzIjlHspB96EvTcM+X6uEXQP8KP0YCa7DZyyPSXVW
	 e5k4Pgjqhg9qYg0Z9xCq8dHuQZT5s6Tm6Qw/DW6H/WFhhxLcHsVJPRn/EfpH9QW15E52W
	 aTpnDT9uXvrseDtuOMeJ0KCt54868lR7k+EjxUSW7DTNJdjzks/ygYgs5AqHQPLHIRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zb5GE7voOWxwh8UbV4qumyj78WA5sPTQl21oSAR4TuY=;
	b=DGPNRLsIWS6NLZo1G+3/MzNCHnJAbik4/Cabs6C64WvL2GMx9suilptrrmgUpVDMsroQ
	 b/5kg9AeHP01Npns5ecowDwH2+h4/a4R4afNijQqDpFteppRKbLcsiBmYlNQwkKAkA7M8
	 Sr4JQVYqHbLcjvyLs5rnRr6zYyOcNqcwch57Udljemje2gX+RJ4eItwb3PB1tBft/c73L
	 NpbVdjLuNVWvAL6ajhoBgMlPm6ZbeK6S/j3p68/tAnre/BB8zC6Q2egbXV1kEFaSTZ+8C
	 i0SExJMX10L5CILIF6GZrtp0RYHTuPc9vZ7MpxLJ5uQom8y5qL+ko5C6K+zqqXkFoIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q6wsO1oT;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9045606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9045606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q6wsO1oT
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-930c0f9c1b1so261590485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794350982; x=1794955782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zb5GE7voOWxwh8UbV4qumyj78WA5sPTQl21oSAR4TuY=;
        b=q6wsO1oTqdGikupBZB0pAkfYl8nLQNYg2IW1q2B4ZhBGHY6PT5ozHH3XZ5pkwQ1qXN
         QY8MLEglOGyRWF+Ab9VavTiAfZnnHryJ/VU5+k+ZxCPDX3ySe3JA8V3TU5razLymCST9
         BKWvX++hciMqb4NRiXYcrQssLabmACzVmlJlMwI3+5VW9iXTJFCQd0Qeac/tl7NhfOq8
         VxtDmwKx0CmCwUcqfiZ6W07fHrJpaHfW+9VvYucycnEfsdPGmBg4SmlUTu1ohw2OOTMt
         dvKKageeSbyuPekO3ReSnE6nYPorGpatcyjYf654TwUKchrGGL3QJ9FgcCXRIOjTKlKB
         oEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350982; x=1794955782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zb5GE7voOWxwh8UbV4qumyj78WA5sPTQl21oSAR4TuY=;
        b=ZXmeV2qmAm+kWu1vtMWHGgOXf4X9gdUhHkanKpgsD16VzQPoQhbhDo3iJf2dZUpkXj
         OB7zwjstp0rM9QccKhkLsgd+j9x/5/MZh4PVODhKV3E24S1a+oAGt2ONWIXv/kteiUl1
         P3Atom+OCa/P0PHsW6Q/V6eA0LaMoRu2B3JU2vAIcl6K/zj3p7UgXLm/bXWX9YtZho/8
         8sFEfjcsdDeebHPr8Ti2oDBbsgFq5Jv2qMdDFVR1lWbiM1j8Fp7kLz7ilHnCxbXQn8r1
         b4La4XKFQCpb6lE2l2q8L12gIPA6U5Sv45tR8DhTUUu0ZJ6hAKUL2tpN+SOlg6p33e71
         QkOA==
X-Forwarded-Encrypted: i=1; AL+hErHDRR3VzVOtN41HPa8vRs0wxjbh0AEdhY5X8ekb4YJptYPLcPh0zvcG0XpIyibm688HpySf1STkkVyXbtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/wI0HDzcyGmN1FXTq2DufrlBOE5llG8+RbAZ4wlHy6SuiA4OW
	eqfbl5wi450M2ovt/47Q9vGo6HKdp4Y4OnuWalmV4bJ0VYJCGH69TfHSgzfWlFDNcw==
X-Gm-Gg: AYBFou3+TOJIDpazUOrhh+U4f+hlyGRTfgZo1EM8MLdttEt6wEcKQg95u8DgpZDJenC
	uHoFkpcrwjysifYIhiS0yXaU0J0pmXroXzcY077nxDEDYHJ7S5bi6avvFbGpdoNGAzr3TMcIv5n
	P9gW5wmJpzt5vNzI1lsiMPDKkPFIbrt6zTIyjCRwMjQSFVJSNdG3XqQv22cQBsN7l0zfBpLdUKr
	yfVeyugx64xuNXY3sH0UygxQOKHucG1tFVyJQcqUvyp5+38H/WboWC7MHLCbnicbVW5bpU05L0a
	Orouxo6joL3urjyD8qYeRFi9fJlL9l6oM87+2xgACPhsiSCZ1ZGZZ6VOdvgF+rVconuEPbMH7JC
	jXSbIsuFZr+oSiNUWWK5lNZEds/M/HpBvDgHKRCxfHlReaa5obRmheW7+w6nbhZAMBm1G5ZAIKu
	h1psF9lax5TioA40x5flszAuhwUjDJFJS6ZD/Ya8JYcTo0StFRSyLtp2101Vx8W41Xa9EHLi79k
	tt28lQ83xA4nDDAR+HuyZbPlVu+Utu60kdo+PCtNfglGmyNan+dWw5Frn2Rfx6GVoD+5/QVxrDg
	h7ocZHTXui88hm1cP+B0IshE+TD1m+OUuU8O+DZoP7db83Yx2y4=
X-Received: by 2002:a05:620a:3710:b0:93e:e531:b78d with SMTP id af79cd13be357-947afcd2ef5mr91279985a.7.1794350981531;
        Tue, 10 Nov 2026 14:49:41 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm335467185a.36.2026.11.10.14.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:49:41 -0800 (PST)
Date: Tue, 10 Nov 2026 17:49:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 0/4] usb: gadget: gadgetfs: fix ep0 request lifetime
 and event counter
Message-ID: <a63177cc-ab89-411a-a6f0-a8a71925aa43@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
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
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>

On Tue, Nov 10, 2026 at 12:13:21PM +0800, Jing Lin via B4 Relay wrote:
> This series fixes the ep0 request lifetime and shared request buffer
> races in gadgetfs, and the pre-existing event counter underflow.
> 
> The first patch covers request lifetime and buffer ownership, the second
> the ep0 setup abort and unbind state races, the third the event counter
> underflow, and the fourth removes the const cast in gadgetfs_setup().
> 
> The setup() callback runs in interrupt context and may not sleep, so a
> mutex cannot be used to serialize it against ep0_read() and ep0_write().
> The shared request state remains protected by dev->lock and the control
> payloads are handed off through private buffers.
> 
> The series was tested with the syzbot reproducer and with targeted
> lifecycle, request-reuse, abort, unbind, stale-setup, and event-counter
> tests on arm64 QEMU with dummy_hcd, KASAN, and lockdep.  The syzbot
> reproducer still exits 137 on the fixed kernel without a BUG, WARNING,
> KASAN report, or lockdep splat.
> 
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---

I'm going to need some time to refresh my memory on how all this stuff 
works in the current driver before I can review these patches properly.  
And since I'm going to be very busy during the next few days with other 
matters, it will be a while before I can reply.

But first, one thought about coordinating setup packets and their 
replies.  It seems that there's an unavoidable race between a gadget 
driver queuing a request in response to an old setup packet and the UDC 
driver invoking the gadget driver's ->setup() callback for a newly 
arrived setup packet:

	UDC driver		Gadget driver
	----------		-------------
	Setup packet arrives
	  Call ->setup()
				->setup() returns DELAYED_STATUS
				Prepare proper reply to IN request
				  or carry out actions needed for
				  OUT request
	New setup packet arrives
	  Call ->setup		Call usb_ep_queue() with reply to
				  or status for first setup

At this point there's no way for the UDC driver to know whether the 
request it was just asked to queue is a response to the old setup packet 
or the new one.  This is a real flaw in the gadget API.

I've often thought that UDC drivers should assign a sequential ID number 
to each setup packet and pass this number to the ->setup() callback, and 
gadget drivers should include the number in their response so that the 
UDC driver can tell whether the response is obsolete.  Too late to 
change the API now, unfortunately.

Alan Stern
