Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497726;
	b=AmGMwAM6UhjbiDT03BZNVw/g3Md8az8OsnRTH5V1G88cgY1juu6cIGk5yo/Ej2CF6FPy
	 NzJHm84R1m+KvJW4Id3HUw5/aYvzU1Nm/7Y7NWgMIawArRs563Gsq5TIEQ37QbyMvwEgz
	 Yduzsy4Pd3/wj4cni4GP68ZNAM3VjLr8+3g/IXTq+yBWHInOnaxdPO5ieEUonxmlG6MFa
	 uQnJtVJRFTqANayEzKHC7x3mpsUh167CBDkwObsRB4ffopSRFxr66spa3OcEMAVsT4Eie
	 bgffEEmSOAyIzW6iyxrJlW/gtYIqXH0ojQS3GO5lvMavvUy2hT7qC8lQnqi1iDehM+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BsJlBCPotEOl3Ms/1GKReU1OR7zbrzwg9fRjbrgC3ks=;
	b=1AYjHhlEC45j9Df3l7S6WiCHSNM7L8GgMsAT0suQNCfjzC3grj2iWCdftkx9whxIwnx+
	 WjsgKAOQ8Q3J5sQUK/YESIdVOU5uqvezpr+DvImzrLNLfB25etP7IY8sMtJ7EOEohj8v/
	 cnpnozSjhxDGvrqPpPU4OKgpZvQMyYDYPK0Bc/lg65Uv/Q4sCVdv7mr6wglLt2dxJGxpA
	 ZZIWdV0mDfjYmdAlMT0GoEGHKFjsqDyhcdGLts4mu5zdCePh/MAQB1ADnrAtTX8tqHT/E
	 xP/a5OfKtJjmp97P/Ys48jGGBxkX+6KqcoNE6buFcYmgkq6tvXRanI2RujRE66gNDXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBkLjZ5v;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAE606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AEAE606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBkLjZ5v
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67be538da49so2140666d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497724; x=1795102524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsJlBCPotEOl3Ms/1GKReU1OR7zbrzwg9fRjbrgC3ks=;
        b=VBkLjZ5vsERKU6se9/AdwZznL8IRocmJeRhRPP6m7A3NRjPAMnCyLb97xUuU2TB1gh
         pEDqyd7pnR0HlT1KAUcAeDTtsUsdOlhonglmRmTrTz8IyFS/Amw+96MoaJMfL7swccwD
         q5ig8oC5pMeNuZg04bG2hQMQcxwIPyfKX+q/3MJhja7VqjxrFm8e/X04F0AtVa4ceB8M
         OCz8orbXoIvs4vETY1fwpyVp4tD+ms1isltT71Yv8yclsHwq4lDudHefRM9wfYDxWFK7
         3IgFUdCtNhPc02iENqU8J90r0lY+5jD0G06EgSzUMxYLLQ79G8gPIR8MGgr9ap6JSoAg
         HMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497724; x=1795102524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsJlBCPotEOl3Ms/1GKReU1OR7zbrzwg9fRjbrgC3ks=;
        b=1PPhXZXYh2E1bwQpDiIFUkUBkXEZEapF+sPGjQl4Q9fcWfX/c+PbXM5keKXqw4CqQu
         xdJMmuQsvVFcfInjPnYdUEr+lYx7W7nD0TbUQloI6KqEgJDraEfkDVvkP7UjRZNsqY6x
         p6OXYP+6CHLbewh3Kb9gCVb5DbH72j91YnHZJkTYp9TWunxa682l30p2qFTJzXjQml9y
         IOpFdd9EMhZK5OH74Tly1xD8SbZ//5rg/n+Z5KkAY67dPy7BAMZ5B15omSwLbI8N308M
         5CnL4yu0d5yNuBPC9/wf6SNZGMVGAgJuY5W05oulzLHfgl77CPzRQGpnrWW6HRS+wrwh
         K8uQ==
X-Forwarded-Encrypted: i=1; AL+hErEq3JjLIagqQ3/sgT+mTuhE/lqWtHECvteSYM5irW17yCjikgaGqH1dj+v1tAXniSOz1fthr5KgFpkjQdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z90XCLHbEQB+Dqj/owsVoEAynSt1TBHtdFZZldX3HuLdAjKCpF1
	3IGxPuz3sjbgeZ4OOzFhW4dGWDYDKfMp4QEDJ7gJMRrxTKG1R68ij6hG
X-Gm-Gg: AYBFou1DFoH8odwNwwnhAPLx8X7fY1eXILntfV3J4Bolij3cbo0MgEtA1iw0w+CiyUj
	WfAnbFJklxvTJuYbgqBicpIY4W6aZrYvRXiGp6yzrzayggFyRKw1RO5YW8l7+xoWci9qw/snVpU
	UhGbJqL97BPdecprYHnpH5Dpqy2ptkDYMfrU1wlY5QBVVpVzm3OgMKjc2p0baBTWxSyaWJpFDPB
	J4ukIxIpJz7SBtPyjRGHxpsK9uKvNXRvGZB3yHFt9+LTPKbT70JZ83TYuuLFiERzugTg4zdlq70
	SSDr5BwvRfoHQHydWANa2orYpTAorBQogsTSbFFn2b7G187nzXVwgjCo4gMEx4fMy7lzisQVWN5
	qSs4SjAicQaR5657CqGrpOU179ja9KZKgZ8GkFfnRG0mMhsECdpRBuT3HPU68rbc3BDAL5eyAH0
	YYXEWQrDpEQz3CgF63jkrXq+awf36s5Nn9AWs2hc8pd1qbtqFpyNJmM90JJMMCEw4NnhGE2Lwq3
	JjzDdc22hjhtFkV+4C5TfDCvPGkmh8FDU3nW6lAloRPbwXCuNfnifM+f8YArqJo8xsG/Fbx8V8V
	c51PN5VEOFN51IUxAqoi1N6Ilpm64h3/4Wc=
X-Received: by 2002:a05:690e:4386:b0:67c:58f1:80b0 with SMTP id 956f58d0204a3-67c67fe095amr2023215d50.80.1794497724340;
        Thu, 12 Nov 2026 07:35:24 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c4e9bsm7462376d50.10.2026.11.12.07.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:35:23 -0800 (PST)
Message-ID: <225d164f-f95a-4c55-afe5-81237c6d5a22@gmail.com>
Date: Thu, 12 Nov 2026 10:35:23 -0500
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
Subject: Re: [PATCH v2 3/3] nvme-tcp: consume TLS records without application
 data
To: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Belanger <martin.belanger@dell.com>, stable@vger.kernel.org
References: <20261111-nvme-tcp-live-ctrlrec-v2-0-6295202b84de@gmail.com>
 <20261111-nvme-tcp-live-ctrlrec-v2-3-6295202b84de@gmail.com>
 <8f7656ef-2730-484b-98cd-701616ef1a8f@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <8f7656ef-2730-484b-98cd-701616ef1a8f@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/26 07:32, Hannes Reinecke wrote:
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
[...]
> +             if (buf[0] == TLS_HANDSHAKE_KEYUPDATE) {
> +                     dev_err(queue->ctrl->ctrl.device,
> +                             "queue %d: peer sent a TLS KeyUpdate,
which is not supported\n",
>
> A bit awkward; maybe 'TLS KeyUpdate is not supported'?

Yes. v3 will use "queue %d: TLS KeyUpdate is not supported".

[...]
> +     ret = nvme_tcp_drain_tls_record(queue, &msg, MSG_DONTWAIT);
>
> Hmm. Doesn't this assume that the KeyUpdate is always the first record?

It assumes that the KeyUpdate is the first handshake message in its
record. RFC 8446 also allows a KeyUpdate after another handshake message
in the same record. kTLS has the same gap: tls_check_pending_rekey()
reads only the first byte of the record. v7 of the kTLS KeyUpdate series
will check every handshake message in the record, so kTLS will detect
this case.

nvme-tcp needs no change for it, because it cannot answer a KeyUpdate in
any case. If kTLS misses the KeyUpdate, the peer's next record uses the
new key, decryption fails, and the queue goes into error recovery. The
queue fails in both cases. Only the log message differs.

> And we do have similar logic in nvme_tcp_skip_tls_record(); can't we
> merge both (ie just call nvme_tcp_drain_tls_record(), and drop
> this switch statement?

v3 will merge them. nvme_tcp_skip_tls_record() goes away, and the ICResp
path and the live path call one helper.

I would like to keep the switch, for the log messages. Draining alone
works: kTLS sets key_update_pending when it decrypts the KeyUpdate, so
the next read_sock() returns -EKEYEXPIRED. After a fatal alert, the peer
closes the connection. But then the log only shows "receive failed". The
switch logs the KeyUpdate and the alert description. The alert is often
the only hint why a target dropped the connection.

One change for the ICResp path: a warning alert ahead of the ICResp no
longer fails the connection. If the peer closes the connection after the
alert, the next read fails.

Thanks,
Martin
