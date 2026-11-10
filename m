Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332368;
	b=4abkwohaOn/H/UxtxoM02q1t+qpn/GsziQ2wcBo1CqVC9WJSlZUfNgHaplPMjnV6FbbL
	 zO4U10RjXWTHZ5KCQaux/KumQRTnGoXhCl8ojNoDXxiqOjgvO/UpeUQn9XdRRI3mvSV0p
	 UerPD3quW7+L7gAIxQ0F7H0zmkRlhnXs7JJ/C6iXakHwX40Fwn2NJ6MJARijU20u7j0+x
	 ypcubo4vabrECx/vquH0V96fJdmgtKzSH8/bVS/PvPrAwniWFFRaCfy4VXV9dOa7j0caD
	 /w6eWXpyf3oCcq5wI/8UwElHekP2L3C4E2wullKxfmg/ocuOuKq3IsPgKaX8paJCdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2nzMZHKj3hE5fscinAAUlVlDiG5XpzZxcETT0RVQ/Lw=;
	b=sywwao6eze13fqJSlMlOJrB0It6ey0qMrV5M+JRf+TwDCuwKBzAxF3By1ohJqK6fYKRj
	 Kqi2ZHg+P/b6TcK3jTdauhd8xWI2uemfIuI2ZpiOaG1uRgqGrOwgducQLHIB8OyU/9qeJ
	 NEiGm7bq4v1/gllG1z9fwK7xAHDhFZYn4Oc279hs6Ngj0PCEdNjKXc6aiVVBeFCA6jxXq
	 NrqWdmUSJ7I0XSfreK98KG1pXz3KdFqFlzIia6YH+wvNkG9iISnYD28kvGgBV+MDAkifr
	 3DGL72ch8hYLXg/VjKkD7DIqCrJP+rILDz4wQHC+rO4XJu91Wnp9q9xdLMwIAmNEOAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jkpr6sIz;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jkpr6sIz
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so995731a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794332367; x=1794937167; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nzMZHKj3hE5fscinAAUlVlDiG5XpzZxcETT0RVQ/Lw=;
        b=jkpr6sIz1EGGbjXotdPensVeUlAmmDlAkCQ6QiTWJt3NAgl0ri4jpyPmP1OGOBXmS5
         SeN5R85WCkoFcOwPUkrLiwwhH9SitsWu+QQxGrcodtP4GWO6neQusNsel7Gw5yKd9Fit
         Pl7fX1kRauVJh6MlnjL4qsvi1+/JxyQjYZxClaSireoRlDOzEuD2HhgWZF/YR7+F8g5E
         KGoOozXEuQh+4yGzRpwi/yZDcK5ja75bmkPdpKNvQMfUpxBcEu6FwdPnBVkfXx5BD471
         bnz9iBRN0awKMWMiJrZWYdqJmO14MspBZvALUcZYn182LCVGVrij/JSVwqEhh7SafI0b
         +5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332367; x=1794937167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nzMZHKj3hE5fscinAAUlVlDiG5XpzZxcETT0RVQ/Lw=;
        b=agU8kGDwSNTQs6iyp2sm9s/Lw+7Fg3ZlivQh2ZqXbQFtkIotBPZ4JiU3MppcNBibhn
         TAE60JnS9B22bHo/lxM8TTQtEyuutBEpmmZkGibMDerieGCfxu9PvelG/5rnvQDn7Q3l
         QI4Vdsx5JwDROZnPSDWgu1614rlSUgAI6Lm97j41bm/jOJktgJmT+16XoMxm5M+6wbHc
         HFoZrEHDP7k0BdSfNvxO2qirAiKkW9lKIxW3MEATABjr5ou346219+Zmra+46ZvUoTQE
         badU7sWMxktl/vbV8G34aQjAk6/6DcsPjhOXMfFkg7YqlwYhNaEL6WkvHkmrVi/M55ee
         DUpw==
X-Forwarded-Encrypted: i=1; AL+hErEUPh1qHLu465Hzkz4oAD77TPxRRcTx/f0l5WUDF/veypqbyaFonIaEczamyctMeqamfXk4bi+wO1kgvJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pPj7hkzCqppl3jXXcA+OeUBi27YKmjO29NmvYera3LLbr5jDZ
	psmA9J199fKyrNcl6bWZJw4MdY4nUlUmYd4cjK8BD/al8szLlxxHPOnl1Zy+VF5aLnO3UD5CPDu
	sm3ZM
X-Gm-Gg: AYBFou1C2ngQSTvorT9LfaBELrl1d3ZIvnwcDcUdlduTf1FRl5k05+aCn8dwk9wJ3Sy
	xSITQPLh2x9VIydrmXcF7jOnzp6MNugAkx9MYbvoZovyPI4OEw0JVzsr1WbItZU/8eqnIWc8it6
	+aVswOYkCR2MA83FpmZJrB8dedkBcmmnChPe59Gz02PvUxU48/mafmrQqvpB7S0wjdWjxacPfHD
	YUMMfn/O9cN29/VBpKw7QNHoE1rGbJm+RAiUuuXzyOxyTSKNvESqY9u7EJAlbvquAUGaHGTiQ0C
	7CjbMMjyY90yxnxAtCc+xNx/qrEGExeF9n3ojb9p8lp+QQjcbff1lsDUWFTKQ9bsEhBRnmByOR2
	3QSXranPTX0gkte/LweUViiXLLb6Blo8/H6Ip37u92/H31xlQ7P/t6Ftdx07M+wZtgkzEU8gPvO
	okJKEI9gZjCAQ53F/B1br6DtrzAN/clZybsjkk7TGUk4nhvQvgk3hOUoAdTO6KlslNPQwia8zxO
	9D5uK1CU0AXmzPcn9O7u8uAIpLSXAOTmvhvIotTSQdU5dSN2jC8QQKUGA3mSJ8yQvsJUHI0lckA
	ok2RnbsOi9GUtw2osaV4367XcZAP7Gw2/n03xld3FQ==
X-Received: by 2002:a17:90b:4d8d:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3b166d1e021mr3103752a91.52.1794332366522;
        Tue, 10 Nov 2026 09:39:26 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dfb9827sm580993a91.1.2026.11.10.09.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:39:25 -0800 (PST)
Date: Tue, 10 Nov 2026 09:39:25 -0800
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
References: <20261106191423.4194081-1-joe@dama.to>
 <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>

On Mon, Nov 09, 2026 at 04:13:57PM -0800, Michael Chan wrote:
> On Mon, Nov 9, 2026 at 12:12 PM Joe Damato <joe@dama.to> wrote:
> 
> >   - Notifying bnxt_re when DMA is stopped.
> 
> I think this is probably the one item that should be added to the
> patchset.  When DMA is disabled, RoCE will not work at all so adding
> this will make the series more complete.  It may be as simple as
> calling bnxt_ulp_stop(), but I haven't looked into it in detail.

Hm. bnxt_stop_dma runs with rtnl and the netdev instance lock held and
bnxt_ulp_stop -> bnxt_re_suspend takes both. So, I don't think calling
bnxt_ulp_stop is going to work.

Maybe I need to make a new patch where bnxt_stop_dma queues a work item that
calls bnxt_ulp_stop without locks being held? Not sure.

Also: would you be OK with bnxt_re treating BNXT_STATE_DMA_STOPPED as
detached? I'm probably getting this wrong but I think with DMA off
bnxt_re_suspend only takes the detach path when FW_FATAL_COND is set.

LMK if I am missing something here. Just trying to limit the number of
revisions it takes to get something reasonable :)

> We have tested your patches by purposely unmapping the TX buffer early
> to simulate the IOMMU fault.  When the number of rings is small, the
> fall back logic to check the HWRM_RING_FREE response during message
> timeout works most of the time.  With a large number of rings, some of
> the HWRM_RING_FREE messages do not come back at all and DMA will then
> be disabled.  The FW team is still looking into this to understand it
> better.  Thanks.

Thanks for testing.
