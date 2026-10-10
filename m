Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BC35201F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791604191; cv=none; b=liAnYVU+Hry+xYUpF7dwNGjhWOQ3aLmkkvXKmKixKb5HIZlqPL7T/N+fgc0hb84YjPJM+X3UqsVJgvbGrXEK4X8xLMKjKQ5e66FasuaeGxxb42CLWOY5Szp+FetdFjDoHmYoxI9Nx1bpOZ/h67uGQiVg3iKyrRG78egeVl8s7BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791604191; c=relaxed/simple;
	bh=6/K+eNNExrDxiz4cNrHR8UMtpKftRFjou/DDzEJJAUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qELCYX9Gq/3E5JUl9y9FLgxeAD4buwBXoz9ChFYmUsMZ3k/kfwVCZ7G5CFKhDERgC71vD6+HmK45fMIt+BTfZKYY2TWxol6eMekWK2LmNcsyHV8zoEvjERPRLsZH57iDbqBqPCtYrB/WuIQaSJI8IDCMDq132q3JGROgGYjVb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5ZZ2KCz; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5ZZ2KCz"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15168a20b47so268419c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791604189; x=1792208989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVQetDWwW2PxKKO9Z+bh0RgGH3A8eaKFTq7bp+ejMxs=;
        b=q5ZZ2KCznOGwoh46UJDV6PO5mjOT1U/wdxIy55LiUDFFo7iOkPCoSQ6Vuh3ggwMQTQ
         Z7uUjM2/IDZitej+JHDCy4jHlMNe2ZtbCivR8NdyKPYWGFv1qIIaMtDQzUBBjMDSKx/u
         d91XVq6WJGQaLVmC7CiGSZvwQpy9sjx4YtfBJPcQEUVf4lmqG4uDdRh1iigd5X4Vc4X3
         lpfh0ZF61YnyOff9JmQiieNCtF4oEfw6Wb7H4iT1Q/NPp2rovpXNIuhD/1luiGkceGhN
         kj2yCrfLAuL+tCCZYqXAvu+NlEUIodCxpdyA17F3y4GZb9k7yLexg3JKJp2lt5QD0nRl
         rJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791604189; x=1792208989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVQetDWwW2PxKKO9Z+bh0RgGH3A8eaKFTq7bp+ejMxs=;
        b=DwTEnkWDohvJkyHeNPklQF5lFWKAaxsYFlsGS2e9UjB4w91SC56Bo8c6WS3A+5rXS2
         LAQS7vos1jgh+vGB+rKGPB5onm4OF3eeffzBbYMGnen/vrYhUjKUS7RwEy9JNSpjwSOc
         0GA885+6dEstc2/yvoqNwP20CEtnEevNWb35UrgbOEmUjNCmlbpzuB7kMTgNqp31xQjt
         2ASI9f1hkvFVpeuDEaqCRaYEKyfpM9tv/6TtUgzxwfY5aPSLowdvB6+gV4/pi94OPXBn
         wZL/UmYEe/35wmXgmwC0Xd8ICaRc0t4PMAG+7rRTRb/sz6w+fee2WIMwLhqQ9KLVZ2wa
         HlJA==
X-Forwarded-Encrypted: i=1; AKwUvBy0gkA9F9t5TCl+QXHvmBHtDkUnzlGzKS4ZpEnXWYtn33d3OkzdiDxT0+5I4Zg/dIWpbdxSBvYcPKk29+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE4jJqVfFPrxvSIckGTDJLn/AD4ZIBsh7BgFonjKOcOVIZKpYv
	jA2J9cCWxYO6ZEzyQ2tkJHbns9xyMH6D70p8eIwXQLHr24Ke2RRtDsJy
X-Gm-Gg: AYBFou0fudLawqzdrhNz+/AavEMm5ktPiGLOzsMf5bLHiWOQKByUNUcvHoswq2eLM3x
	Qj2+K/p38AsLB45p0LaJMbNSWxplFDV1AqA3newJAFuFkT6g4VLbtS1Z3hpPfzkcJmrwUS0uhr6
	G74hSF4IfzGuD1aZjTPsWsyDHG032OUZV+4viGLTY+6waExRwDcIPMNoPH2nd2rcblFzVhBXCE/
	UGJhtYidt1TjGr3MzkUV57ZkIp1NmPkOxudFu6Nga7RuX8+JuZXBEoffFjdAUsPHa+g4UjG2vDP
	xWVUuHRrsyx2DvGBw4retkr5htYUEIjkeWh6D3ST5fIVTyDtvZXW6yjHkUehGmQuKrd4pcg/NbT
	B55nlM1yERi7D17J1ZGMr4A5j3cJ+i3a6oL8UKs/yO5uW1/bEbMMVtGJF7JhyiWoncHMHq0o6k0
	S+Q8I97uvA/OZZQ1tbrUoVjw8ouNuGxdPMmKEKBjNWs8uPePS8qotW8UT/hy4X4RIt7/EqLi9em
	4tYYuGIVcbMZqeYdGMrJH6fFVhGgPaGM2K4zXqi
X-Received: by 2002:a05:7022:5f18:b0:143:298f:33b6 with SMTP id a92af1059eb24-16a6203ab5emr4327883c88.46.1791604189134;
        Fri, 09 Oct 2026 20:49:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7ea:19aa:c6f7:8c02])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd5cb5sm8835444c88.6.2026.10.09.20.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:49:48 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:49:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wei Jie Law <98lawweijie@gmail.com>
Cc: Andrew Duggan <aduggan@synaptics.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Input: synaptics-rmi4 - fix irq[] overrun with 7
 interrupt sources
Message-ID: <asm1vCJYVKA5bHnd@google.com>
References: <20260825103123.12216-1-98lawweijie@gmail.com>
 <20260825103123.12216-2-98lawweijie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825103123.12216-2-98lawweijie@gmail.com>

Hi Wei,

On Tue, Aug 25, 2026 at 06:31:22PM +0800, Wei Jie Law wrote:
> rmi_read_pdt_entry() takes the interrupt source count straight out of the
> Page Description Table entry the device supplies:
>
> 	entry->interrupt_source_count = buf[4] & RMI_PDT_INT_SOURCE_COUNT_MASK;
>
> RMI_PDT_INT_SOURCE_COUNT_MASK is 0x07, so the value can be 7, and
> rmi_create_function() copies it verbatim into fn->num_of_irqs.  But
> struct rmi_function declares
>
> 	int irq[RMI_FN_MAX_IRQS];
>
> with RMI_FN_MAX_IRQS == 6, and both rmi_create_function_irq() and
> rmi_unregister_function() index that array up to fn->num_of_irqs.
...
> Size the array to match the three bit field that feeds it.  Clamping
> num_of_irqs instead would silently drop an interrupt source a device is
> allowed to declare, and would desynchronise irq_pos for every function
> created after it.

Per the Synaptics RMI4 specification (Section "Function Descriptor
registers"), only values 0 through 6 directly specify an interrupt
count, while value 7 is reserved to indicate "more than 6 interrupt
sources" (which is why the comment above RMI_FN_MAX_IRQS states "up
to 6 interrupt sources in the normal manner").

Since the driver does not implement support for functions with more than
6 interrupt sources, we should keep RMI_FN_MAX_IRQS as 6 and reject
functions reporting interrupt_source_count > RMI_FN_MAX_IRQS with
-EINVAL during PDT scanning in rmi_scan_pdt_page() (after the
RMI4_END_OF_PDT() check so unpopulated 0xff entries still terminate the
scan cleanly).

Thanks.

-- 
Dmitry
