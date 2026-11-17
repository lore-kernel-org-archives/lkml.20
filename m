Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883558;
	b=cWxhdOU3K713tSnYr2xqyu07DQRMvt4avg+ri7ThkpaIkAQiEHs/cEHICHOCkPUWRu+z
	 hIPbKOV3LPi8Y0W+Tn7+6Qk7WLqcq67i3CTgrwooUAEM2rHw0INhZetNcgCdnRwkxoH64
	 YL6AZJQ1ReRBF7QbBXt0sCuTqKGhO3AcIYJrIyJMder8ahnTkN3gqb69P49GLMI20ahPw
	 ZUZMiafIL4lcnzBh80rPW/nb6VDCOdZLtU/4I6D1uYLmQwG9wIKWun1R5i8w2hMW6p4Mg
	 y2Q8XQZFnau6Ssg52/RKaHkcoRJd2i5g6opLpRnRhJQvAAtrYoUlssQymptLkrNB2Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HSeX2aFiqx9nRUhyo25kThMdo5FnVAQ6iA/k79stPrw=;
	b=WzRsX1fVKi6WVdUaJ0PJnpCadoBXb+g/pSp9K4ORPoYfOYl/quYXrbcf6Uw6OaCKbVsA
	 wNpGbgnvKMAJf8Bz4doynfOkgh/daJ2Ki6TKCqlZWmixdYJfFhlcw6womV7gT301Sed2Z
	 xlYsWfcLlIWOkqmr8XZWRiAhSVHm0JiuRPvddWfPIJdc/jjz+zmgMjXX4EsUdjiXL9Rm6
	 Ab6PuJTyKf2tZh0fKh8/XBWfDhYKrn0Q5iTOlVu18PlQuZugXuY6oGxowPOPLqPkAi891
	 yRZVkwZccvT2mHT8jhEOglxMzwBh/BckEOs2KJz7HE8mHvrk3J8ovqbR95i8X5gmOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gQgedVEv;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515BD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gQgedVEv
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8623791c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883557; x=1795488357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSeX2aFiqx9nRUhyo25kThMdo5FnVAQ6iA/k79stPrw=;
        b=gQgedVEvP4NsoQGbpXmXpwtNykLoXhSCcwWCoxBy/YaPLLm4rwH/YT79l0YR5aY8tr
         dqkP9QV/xkjsyjLVTyaWmpHp2D3akNOgPrmPJv442hygzBEDHeM8/fRBF3vrC5p877bN
         BTGLY8M2PRakDcDdRD+q2LagYIRAvHn00nshol5r8ln0PbqGw8VwHMo7lcqP9/obsQih
         GctUlXZgbZ/EzlN98ynDubIswra4iVrRx3Eh2y0LHkIP1OTq2K6MlqRiBrgF3ClAECVg
         JiSDWP0Hv7FdYHcQBVQqf2AQ6IJfaRXljyJICnx6Vj8UqIrlyR2sZB0i0QfU0SPlPuNb
         +KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883557; x=1795488357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSeX2aFiqx9nRUhyo25kThMdo5FnVAQ6iA/k79stPrw=;
        b=DWM0JaaNfPqD/u6pLqa8RnKTpfMrZqIhnhc7+vKB2g7M3ENLrLguk8GgNKfNDdIWWX
         PjFR4+XEaKi9gDY49RXayjtV7iCyZEbU8WpFGV5llUZPUmag491JJDyvPVYIeKMxJIKq
         phpggO9WCes0d5k7v48gdZTEmtXY+r5KYw2ikeUeLAakET6rynGDvtAUidQeZpT7iBwg
         UqIsRmM4AOn0u/nQBg6RXYlATr+eqA2Ov7ASt5ifnRRN9oBbl8kj7PkUpevCW8oYyK9F
         W0i5AuhOGWMdyJOWIGbt3i4tBFg8/EZzwqCEVrF5WG/1dhxsJMX+CPNU3yrFwJXQaaY8
         HAgw==
X-Forwarded-Encrypted: i=1; AL+hErEPGGChy5vGHJEU/A7XIvhWks9UjoXOVnqUPzhugzCKKSQEV7173GQ8PSnv7n2xy4kp4u9Hde3e1rXGpIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FzJJSrw0MWAvNYXX+HFnSPojlDgEvQ1rKVxfDt9ZBS6/eFiLg
	G31BKhK8Xqx4GMQwtWNtrdiVWCPTQnrlmCV8FeB3VqZ2tkyBUAq6SbfrriukOD4XC+cuPe8n6LF
	2JqFIIww=
X-Gm-Gg: AYBFou1+HSXmsn4H6+ac/yqz3c5XSvA+LP/eNuQFjZdvngltWXWB8oCPe60tBOaDwiR
	7Ltkgdn0J8DxtoIM/YIqy1m4h07RZyAleVUw1TbpgcZydsSB5Yce4Iy7xzHPSzOvvx9WBiT5Ok0
	1NWj6LtapHmQFHX2z/eS6mC3QEVSxKRGx6fbmSXok1MUcKzCkGCANezq9oOmzmjSjojdWCBxHX+
	u2AZoZ0ELKIgyxPK6axXxqhu4Igbfw+m5Iu60EmphogfDBEyNaHYY13wclObN5mW2DkDSW2yqLt
	tjlMPN5CgzgC5w3ITbk9nakl7DLNux4Z4ohb+OY6DPrUiCLvZzVNA/xzl0PPqx3WFZ2fBxF0Jts
	0fUMYTFl+Z+qYF/db0BUKHIUH2D1Xtz5bgHam1z6y7omoEcSpXC5OiTF84+1oFgIYHn9xS3vE08
	PFdQQZkbFTNaVa47pWDt50H0HZirBAo1dM0u2Em1o0et4XULTGoYcN7HyJaAlc5uvSOOZAX7ew5
	ch9RMA6XXZQU1adKvJZoLW5lv0xSXGfjqTUG61TxraKLRE2x7nSYli7+0WQEdMc+sKdX3ZlTluG
	dfd3GfaPf0jpK8dSF9quB5P4wGuzlF92jId89J728+xGlh0kAE3tGvWr6xnCoonqN70aT99RGtq
	bDXNqaqtwjvEx
X-Received: by 2002:a05:701b:4194:20b0:1b3:aee5:20c5 with SMTP id a92af1059eb24-1b5030fbe7emr13399292c88.22.1794883557324;
        Mon, 16 Nov 2026 18:45:57 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm41527305c88.8.2026.11.16.18.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:45:56 -0800 (PST)
Message-ID: <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
Date: Mon, 16 Nov 2026 19:45:56 -0700
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
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261116111744.702159-3-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/16/26 4:17 AM, Clément Léger wrote:
> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
> envelope and control-message sizing was not implemented. Enable
> bundled multishot recvmsg by reserving its metadata in the first buffer
> and accounting for payload spread across the selected buffer run.

Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
but a few notes on this one:

1) This changes behavior for UDP, which has no inq as per a comment
   in here as well, now it asks for MAX_RW_LEN.
2) Why not support incremental buffer rings?

And the usual, do you have a liburing test and man page updates as
well?

A minor note is that the commenting is a bit excessive... I'd prune
that for v2.

-- 
Jens Axboe

