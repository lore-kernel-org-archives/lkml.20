Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730236;
	b=0kIS/dJUCYYomyUNGlHY8TvVMFJtlogmvTOZ2WNR9yWH48HZ1nFAIpPvphI6XrCX0Fnn
	 9+JxuChsartgTS1gL9Qlw6lnwUntEGdaMDAncuWrYp4KvYluRAs0GfvgyAz6EidLlESbR
	 BgDCFnybsbyr5BUMf2Kr5g7gjYTRYthITrsfShfF6KgbF9RemVZ501u2b5/YoexQIUU5r
	 9XxiJqFN5wTjs4MjM3ADG7T0GVDgo9uaaFiW93c7vfRQhz6DI9Gk3N06bmccPP+C5ISWH
	 yrRxMa/AoyJyinR/efWDaao+nXwLOMbMMM9qrUnDeu5D/N8TSYscLh/fXeDVavk7fhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730236;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=3AD2NjAEnXh3TsyeQJyuQPBTmIH2AEBoMc1BO7pCl1I=;
	b=44Tj7qd4oK9Q1f9UEJkMBCaXiHKmW2+5+7fuAfuvCaKyKz3cH14KuHNls+3Yaazd+P/A
	 pzmqVGsWRhtWNzOoI370Cd4iLKxsf6NYUrwFFSRapga+YmLIalvlS8RqGma2oRruDegaB
	 N5APgzsB86gajSG7/zg3AU8GtPVr4O62NckJ3rEfafh9csWSOxqYLMLzSLauOBhMlRiCW
	 /8/00yX2ShPaWw21a4RNJazQ8aOeZVuZWjWU1K18um/WpTAjit5flSg2ihn9KsgoeTUPQ
	 wHD+TMZC/1zULgeq5ccBPnpEGck5kGb1M9RHgXdFW92L6IG397UpbIuXeXOH+MTcceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ER9zjlLy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="DB84/V9V";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF9606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DF9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ER9zjlLy;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DB84/V9V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794730234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3AD2NjAEnXh3TsyeQJyuQPBTmIH2AEBoMc1BO7pCl1I=;
	b=ER9zjlLyt2rGDy7WZUDyp2bOCUfc6rx+WItUKIPqDQrOA3Js3Y2Eg08yvFBIIdeveAfDlR
	Nrw9yB14/bIRJuReGBeKq5QHFtk9heHLM9/wPlHfQ45MaZmwDr6qWlIW5DuGE5vbQ8DCMq
	0dc4+mMhwm91dKGw+L/2ROeTw770LDA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-XfNLNpbfN3KfGOsfmVPqbQ-1; Sun, 15 Nov 2026 03:10:32 -0500
X-MC-Unique: XfNLNpbfN3KfGOsfmVPqbQ-1
X-Mimecast-MFC-AGG-ID: XfNLNpbfN3KfGOsfmVPqbQ_1794730231
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49166c8a60dso1590266f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794730231; x=1795335031; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AD2NjAEnXh3TsyeQJyuQPBTmIH2AEBoMc1BO7pCl1I=;
        b=DB84/V9VopxV8ZLFARtBAA6zG7pqGlYvH8XXCFVTB2aTa6rsPquz1BJnQppxmyrHmM
         5cO1/R+2Tbt1EUzrfazpxEFBqomVayQUIZDXzpxVy88SvSr5deTRD7my3Nlhpi+GcQpq
         fzrP5shcMfTx3s5jFgD2d4OpHi7X8FD5oC2SgcXre1/O8grzf+VWqA9tqQW3T5SuQoc9
         reTsJnm67xe8Sm3jrlWASFnouuggpQg29NWg202PpqXwXUqtubE9DS4xC66KYy5xh7eW
         GdKYXkjsah29akmliaksZ3AfisrQTKPIopg/W79dUg3FnfkDY1t5ERWuL19z3/Kr6ZWM
         ACfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794730231; x=1795335031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3AD2NjAEnXh3TsyeQJyuQPBTmIH2AEBoMc1BO7pCl1I=;
        b=MzwkMrM/2/ZDd424G4Ml5FxgfMcc4ainOqnGczx/est8pyPYa8f2PYihoSaaZLpSXw
         3HIgRdf7janCLEIz08tncnZZ47smWRImctJS0nGtEogNUf5EyKPmueD6wxGY+EtnqtKJ
         Ny9oMtHDnGW/zDV8dVB93yWog6hVkDDbPJysy5S587FZr3PYK39dTz/Hq88ga3laC4Yb
         i/e4ZbLjA45X6VmCnXYzgjs/FyA1EiBojnY5gVPS6VFG/5ByRW9cJ87Bx7jQRYffcUeF
         TNDEKGddXkUFsy/ho85/dgtfmq1VGm/bseU0PJP5IpcDmxui7rtm2DmcVIf8AdiKb6Ws
         H8Ew==
X-Forwarded-Encrypted: i=1; AL+hErE0uYY2Ze3tghqhJUBc0BlaEMaouUX07ZqrJpdJYH0k8lDV97V/sEhQNHzL0ifLsEPcnI+lBnqKoGa5XUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KYgmJuvz1PXO1qSH6SNa6JO2qNGT9tuSwMAkx3czuMrwnnluV
	B4qe2lRZZJm8bdh/PNS4oY/1Bqzfo7Estak+1b102y9J2HlenU+YEayQepgcMbYp+dk2taGDPmv
	1AYB2/wdZ6RkD0iMvbNWeTNbPJdI7oCKUcrknMaYkT2rN7XG2oRn7qbcrR+DHL3cM5Q==
X-Gm-Gg: AYBFou3IKqk6qqWwxRwaXGs14bz8/81w+KU4NZIEJlwIS4ulPH5MkUl4FZXzHuP9hmm
	CrSxYS1HQG6EPEyBPVZRlIYEBRBJaT9oWr/t4jjokmPtWmL3YECDJASo41aHeawqBa7R75yjOhU
	EMEBK7q5vvOO7p57RNqRoWMFoMWWaRcLqfbs3IcN6JvWIEDNv7cuwBIzgINSRdaeofGRY3JB9j/
	JPBpK1BLl3TpJAf7TdGIHxH4AEpriX6F7L2qKHpxvy7znImKm6B+Nl3kZgvqVuPBOhyuHrg8yxN
	DWfJ512CPEwlvyvOzLl1VzBxUlPtOgNtTcU1V2xm0qchZX+cmmhzgBnb9E/sRDavqG3CIAQCSIA
	g3NR8azggQbN3vv7/HC/F7TNNGs8dnpcFrhjqYDbM7d+bbK6bJbI0EQ==
X-Received: by 2002:a05:6000:25c6:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-49c73165309mr15480411f8f.43.1794730231241;
        Sun, 15 Nov 2026 00:10:31 -0800 (PST)
X-Received: by 2002:a05:6000:25c6:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-49c73165309mr15480342f8f.43.1794730230626;
        Sun, 15 Nov 2026 00:10:30 -0800 (PST)
Received: from sgarzare-redhat ([193.207.75.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm14853290f8f.46.2026.11.15.00.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:10:28 -0800 (PST)
Date: Sun, 15 Nov 2026 09:10:14 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>, 
	Chris Oo <cho@microsoft.com>
Subject: Re: [PATCH] KVM: SVM: Sync CR8 to the local APIC after marking the
 VMCB clean
Message-ID: <avlowrJCV-dgtAD3@sgarzare-redhat>
References: <20261113162556.461390-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113162556.461390-1-seanjc@google.com>

On Fri, Nov 13, 2026 at 08:25:56AM -0800, Sean Christopherson wrote:
>From: Chris Oo <cho@microsoft.com>
>
>Sync CR8 from the VMCB to the TPR *after* marking all VMCB fields as clean,
>as syncing CR8 can toggle the CR8 write intercept and thus mark INTERCEPTS
>as dirty.  Clobbering the dirty bit can result in KVM failing to detect CR8
>writes if the underlying "hardware" uses the clean bits to optimize VMRUN,
>e.g. when KVM is running on Hyper-V.
>
>Failure to intercept CR8 usually manifests as hangs when running Windows as
>L2, as KVM's view of vTPR stays high and so KVM never injects pending IRQs.
>
>Fixes: bb365a506b1e ("KVM: x86: Unconditionally recompute CR8 intercept on PPR update")
>Cc: stable@vger.kernel.org
>Cc: Carlos López <clopez@suse.de>
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Not-signed-off-by: Chris Oo <cho@microsoft.com>
>[sean: rewrite changelog, massage comment]
>Signed-off-by: Sean Christopherson <seanjc@google.com>
>---

LGTM!

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

