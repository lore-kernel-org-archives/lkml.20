Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555068;
	b=23tloMY1tEGhu/XPWLKx+7eW7XCVpDEpx1dWnTzraVDMFSBsD08uvo20YtcYxielykyO
	 KZfCo9IVyx33YD/aPsYeeQHaadQF6j9Fdy7Lk1V5/VHjONHlqIw6j2Psol0EKiHnvPMgM
	 ueILwR+hf3Vqi+G6Nd2wiKAe7NP2TQdCdnCRZS3bVNGZwmLRPUip76uxF3a0WHg88swW9
	 +MtUrp89DyO3/LLlR79CBCCe9TFyLI0xa9OdGI+DEOhxyiFjZpiFAJmuVXxQ+oij8w56o
	 IDLYwAhCGALfxuZls16buW8pofikwamxbZA9ZQnn5LRFEldjud9ELF76YwwGcOt7HJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555068;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XNm3LmvLDAoOMp150KbZwglunPFF846Cqv2g3FpPcDc=;
	b=ml1roDbPf1qeNOpmDbadvhof9ZfpFEcGbRzMQ79EjeUdMPzDGjHTqmEGiFA/G/c7Ft+7
	 ClspSO2t+qZ1Ist4KrsG2rWCSaYdXwPUMBb6Hr+GBpIcZ1kWxJKZGR48WW33DreJWMAfv
	 rWVePROoGmzktVRYphAtuof8uwKINhI0FOnvi6EplxlGckfOrYMM1QAKV2gOlkQVGj0c6
	 BzfiHylKNYeVFxM0sLS8zlSG9C7jiPvkokz+qr6+pkpLxaegJLZ3vsMQr2HHMSihO9adR
	 mGlLTopDvhLOCkvJbF23WkIQqGMMmrk+fW02zKwzJnkr+Goy/Gij1SkJc85XeS0DEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="g8/vnQvF";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lQAOWYS6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E0606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45E0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g8/vnQvF;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lQAOWYS6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793555066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNm3LmvLDAoOMp150KbZwglunPFF846Cqv2g3FpPcDc=;
	b=g8/vnQvFv50i+CMcblbld3jryx3EYs3qIdXFcNq2qte75gjL1QVPnYB9iYtagZrB2J8/kL
	Zs+CHB1IG7T3WRAqEnz7BgVzIVCv3hrFKxSSMEa1eSZWD8rSAZuRbaz6B8OfgBcy9hp04D
	YSSkrDNc0RZIrqY16fy7n2CpqxLvkm4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-MJC2Dt4HMmCwUbA4QblhLw-1; Sun, 01 Nov 2026 12:44:23 -0500
X-MC-Unique: MJC2Dt4HMmCwUbA4QblhLw-1
X-Mimecast-MFC-AGG-ID: MJC2Dt4HMmCwUbA4QblhLw_1793555062
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfdc0f491so1213526f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793555062; x=1794159862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNm3LmvLDAoOMp150KbZwglunPFF846Cqv2g3FpPcDc=;
        b=lQAOWYS6S+5Yf9TTn5qo1vLRs/TKvPqiCoXOqp5mNMeDDCFVPvK+Ms8pruPNkilKOk
         XKyiuEGS2IYRBo6rqQIQrPCZnX9wlUSHhQmSoRMub96VP3zDcsoqk8M7zS1zQQzipL7T
         T37Qk2PXzQ1gjvJ4MOzQhEMEua8/epD5iax13CfLh30QdzNx2wyDkkyurqP1y71z5hfg
         ENIJJK/0K8LlR76g1BQr+JKqMgO7gX3ra6jqb2jjqR9ySdDs9+4zAnzyf2Z1XZDjyDux
         Cdiqb+GFdiTpSjuZjpbSy+6CvJPxbpsCZ5gktrNlcn8qdm82zHYOF7i0B6bXqfJU/Yzp
         /smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555062; x=1794159862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNm3LmvLDAoOMp150KbZwglunPFF846Cqv2g3FpPcDc=;
        b=LY3/3PYT9LIQKpGNPprFM9V/9Olq/iIOf7UYGP35pUr+7enbnHma9BZLIst+LGQ++F
         QYsJQNe4dDyl88nv1Qw1x7IwkCc7PKoJgg61DSvIq/AdAJb1F7ZME68zURZPj3rEGs4P
         jXmeq7YWMiSV3a0v0dwgx+tR4onVf23edQRFsDxlCBR2nYFgdrp1JKR19WUHgwisBdSv
         de1sxlAdPiVGScCNc6l/fayAtx0a6pkivKkseIEJT0krVG9Q1iNC7hQKAyh2BTAYYt6d
         W1fSj77kY9l1audGXBQZAu/x4aJx2idmHd4U4CuNamdNU10GtlY8ABbcWNqxneHPeeEi
         qsbw==
X-Forwarded-Encrypted: i=1; AKwUvBz6WLf9X2VQCBI8MBkajtJzuLOdsRsNFxZAKZYUDwEq8iu7o60TO3svNiFHCFoT0qHJWLjl8i09zlJfdSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRo8f46NNB43hh6s8dbtB9JYgiBZKLkyi9k0jDmTx7VZYg2U7X
	iwlALQTIKO9Ufisi6/XKOsbpZUcWJ3+IX+h8h3DSscsL5gml++7+jtEavQ5zt8s5f/Py6IRWbeT
	Z85E1uptpWVe3/GMCfluLtVv1riEomN5WdtItKugJ/6F+PR/xly0k6tVmcNDEIZ7oZjLJLBNkeg
	==
X-Gm-Gg: AYBFou0oLUe89sfep9R29Dk+yHN0cRJJewO3dn/z04RE0UzY6c9XVC3TIy1lR5G7yyu
	Fr38ML2mSasx+To0zx53KBBUZbNtZL/100E84OwpXuGmbUCTF+P/XCbO0jVu/8PV4/iEJNnO67k
	D8Yw9sddws9kQrZabQ39tRgMOeCyrNw/Ot8N8lOFOL9jwLY7WNfTxqd4MmCRemh9TiC5ghtTbUa
	PenOHUhMaycXZxcY3BAKkjJ7KG5Nw3z9lRYitugVv+l6vXnFLgt7Xeh3RhqNNe9EYHw8h8snJGG
	TbXmc6l6gH7Mfd5IIj/jU8TyS0Cu6ljlr3JT8KbiHOXNgld2wPn0k5jA3CO3ujAvemtG5HIlMml
	dZtwAiiGmRiN4pQPWKz504Hp/RbGEmxXzUWAAA0nGOVwSaU431A9m8aXePj2HY1ElyQaR+hwDT2
	7ZsoQ/0WlrnJwFI+ljQfKgU9d9Sz1KxXOWCvB1e/bmJ/0=
X-Received: by 2002:a05:600c:1f93:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ac180f299emr171019035e9.14.1793555062124;
        Sun, 01 Nov 2026 09:44:22 -0800 (PST)
X-Received: by 2002:a05:600c:1f93:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ac180f299emr171018685e9.14.1793555061751;
        Sun, 01 Nov 2026 09:44:21 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm233727495e9.15.2026.11.01.09.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 09:44:21 -0800 (PST)
Message-ID: <ce0bdf39-d514-42ba-bbc4-066054737944@redhat.com>
Date: Sun, 1 Nov 2026 18:44:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/rds: Do not unpin a page after a failed atomic pin
To: Kyle Zeng <kylebot@openai.com>, rds-devel@oss.oracle.com
Cc: Allison Henderson <achender@kernel.org>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 outbounddisclosures@openai.com
References: <20261030042110.73571-1-kylebot@openai.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261030042110.73571-1-kylebot@openai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 05:21, Kyle Zeng wrote:
> rds_cmsg_atomic() assumes that a non-NULL output from rds_pin_pages()
> represents a pin that it owns. However, pin_user_pages_fast() can roll
> back a fast-GUP pin after racing fork() and then fail in the slow path,
> for example after a concurrent mprotect(PROT_NONE). The output slot can
> still contain the already-unpinned page.
> 
> The common error path calls unpin_user_page() on that stale pointer.
> This can consume another subsystem's pin and allow the page to be
> freed while it is still in use.
> 
> Clear page when rds_pin_pages() does not return one. The error path
> continues to release the page on errors after a successful pin, and
> successful requests retain their existing ownership and behavior. All
> four RDS atomic ancillary operations share this path.
> 
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
Picking this patch randomly.

Please slow down a bit: you have already a dozen standalone patches in flight.

Note that that 15 patches limits apply to patches tied in a single series, having more
than a couple of series in flight is quite unusual. Having more than an handful is putting
quite a bit of pressure on the maintainers.

Thanks,

Paolo

