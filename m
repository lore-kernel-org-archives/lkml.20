Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6318C332
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250631; cv=none; b=JGU2UGxWjqS7uYeIAgwyEwjwCATwgrRqAcYwQU8onxoqByFp+jhUz0/p/AqeTbOOG2Kc4IwpZOm9aq0XIU/r1UPBXYx6EBv6lkxy2JImegwPeRSN6M9NXf1+ooJCqn89P/Z0oA+CBjvS4tS6+sNnsfOO8qN1dTh3JOh1oBwEQks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250631; c=relaxed/simple;
	bh=zGnQ84apf/mbpMHtA34xeCIz3kCTFXdRl9AvA3Jz38U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6YIJNmr2yG4IhFtHfdjqsdQ0jsVKGGcWG3xStgFRTT4fafXxaYRlH9bTtP5KycXMynC9eHXRwFt914/FpCe78PbvIPbJclSWbTWWc9344PR2FhH2P9Sv1IYLkp6QAfhTJc9RSt1gxdWilvOMQvhHWfJzBpDfobQWAMZnS1NKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aRrufnb6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rpfjXEOq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aRrufnb6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rpfjXEOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788250628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FaAfjcGylOA2zaTCnKXmz3u6FQBcwhDKCkrIkARVyTY=;
	b=aRrufnb6Zo7orMOUJNKxOIOmB8Bwdq1lVJKjZAoxmCeDNgtCAfziYNRYzqLEx4aaiCR4if
	NzVSTHAho6e9K0enxjwcvhvWlqn27SWxnhwGRJ8Zoc7dymYiSwVEDmnEetweWqF98Ampsi
	i7e8sBDDfhVkPpkcdz3I5xInyE8BaEs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-inBUWJm_O1u2FwfhHnePKQ-1; Tue, 01 Sept 2026 04:17:02 -0400
X-MC-Unique: inBUWJm_O1u2FwfhHnePKQ-1
X-Mimecast-MFC-AGG-ID: inBUWJm_O1u2FwfhHnePKQ_1788250622
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482e8e1ac69so347505f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788250621; x=1788855421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FaAfjcGylOA2zaTCnKXmz3u6FQBcwhDKCkrIkARVyTY=;
        b=rpfjXEOqD6rHBWHaWnX/vIVOXbzXV+LgaJNb4uV4O1a+eorWswXSikpKVo+CQKyN5i
         VFs2aUraVxXlQauiS6Ctolb6ByiAItHEsdKG8YIihnMBeumt02WnAil58Vrzga9iJavG
         zTY5pmbuPcBAzAE0tDFoNXA1azDO5eEaZBl2jH0OuCkl15Q/XCN/ggDCXss599KIHIJs
         8+kWUpg9w12gXVPrRpU+2r0RTClzaZ2HP/A5Eu+X/o+Ry+XlWMA/bjfSIkFuTF+XqoUK
         c2AR536tNl64J2ecLNiUXwzciCLkkhNwqnTzWEk4vELfCh+N7mRplvwUNA5JOi08uAX8
         F0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250621; x=1788855421;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaAfjcGylOA2zaTCnKXmz3u6FQBcwhDKCkrIkARVyTY=;
        b=QBAB5ilFsDQOoMH1kptQEtyFQ6YnIQ34Ko6XNurggYeGAWoySYJtoEhoCmQv1TiS9U
         ANdxrsBPfO3uaTGur+VZaWwXsdRzVyCEq8RE5067gffpTSdIRgc3xtsDJTc1BvHo8pH6
         YkH2kkHEJULLlS2IaOi6bIRnv5SwAoAXT4vx6vnNHsG2Q2BqgjimSkjE7vCcWZVoajB0
         pPxpYKeLJHIGkVZvEcn9Lq+CN8Hqoh4cs8fsfNOoxRjlCmXm4TpLHMc3xXWYYC9n3wOW
         OA+gCp7Rbgzq2Pjeym4VGnNqcMTpnMKCbp+dXZt1pitRb9juycLeAAFuSRxqKilFY9XN
         ubWw==
X-Forwarded-Encrypted: i=1; AKwUvBziw8tScyzeOs/Qb2b4AiOR41YjmbGKF1GKwqgrq54jH8kFat11BgmxXFa+MxdVJrzNrCRvnjaMuJlsNkE=@vger.kernel.org
X-Gm-Message-State: AFuF++nB5PHczLAXDVydcnlelB6p1so6OdSVJz9gdyFXJrp5JhKjdXRA
	UqBh6cRQUofJWKObyrbaB9Bl45R1EZxkCXfuz4jci83stinuHeBXRqOBhojlI5lAzoOAt6shp9g
	N9KNxzX0Fj0kRJqRB16WEG7y6tE0Fqw9bDI+DIfUXC9wJPwONhFG2TqeVlKHFnoBcLQ==
X-Gm-Gg: AYBFou1v/6YJ3nmHCu+1EahHiV8VuHVYSbNKDTVam7YMtYKzXKf0VmOiY8ANT5WG2rS
	yHYB85HmM3oMl/Kcf1SDqHbzGSEEqbC1f5k1wJrO6o0JxJcu9AlJl4YbwziJ9FEGN/fq8KO6N47
	xzkYOXYpk14j8A5JZrwOlpvQ3sDX0PFaHCSv1QQdTY+eC7VDopiQS2nLIIO7ftbznms76+web+M
	3RMMiOjIcpI6BMgnHEIDGgc4rYEL8G89TEE3G1XIPJC0JCG3GRa5CS0SEH2XKOafRajhijybUIY
	Ltvd2upx08gI4Ehf3V3W5A4ygvz7rweXYWzpWBU5jnQl1aVJ7G6SDpg9NaQypX1X1A7jraLAFmy
	9FGxFFS3kdaqC6aGrGXNuLFFm3yS64cQvvsVG9A6YJrf+qRkfU3lbFcY4pzP85uEZSPxE768cUQ
	==
X-Received: by 2002:a05:6000:41c2:b0:482:dd86:348 with SMTP id ffacd0b85a97d-48441fc951amr7391027f8f.4.1788250621517;
        Tue, 01 Sep 2026 01:17:01 -0700 (PDT)
X-Received: by 2002:a05:6000:41c2:b0:482:dd86:348 with SMTP id ffacd0b85a97d-48441fc951amr7390013f8f.4.1788250616845;
        Tue, 01 Sep 2026 01:16:56 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d788ebsm3428937f8f.27.2026.09.01.01.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:16:56 -0700 (PDT)
Message-ID: <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
Date: Tue, 1 Sep 2026 10:16:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Rukhsana Ansari <rukhsana.ansari@broadcom.com>
Cc: horms@kernel.org, colin.winegarden@broadcom.com,
 linux-kernel@vger.kernel.org, raphaelcf@meta.com, stable@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260828190900.1767611-1-joe@dama.to>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 9:08 PM, Joe Damato wrote:
> TPA IDs are generated by FW and can be up to 1024. bnxt_alloc_agg_idx is
> intended to wrap the FW ID down to a software ID which is used to index
> rxr->rx_tpa, and to generate a mapping between FW IDs and the wrapped
> software ID.
> 
> On a 57608 with firmware version 233, the firmware advertises 32
> concurrent TPAs. As of the commit under fixes, bp->max_tpa on this NIC
> is set to 32.
> 
> If the software ID from bnxt_alloc_agg_idx is above 31, this results in
> an invalid address being loaded on this line:
> 
>   tpa_info = &rxr->rx_tpa[agg_id];
> 
> because rx_tpa is allocated with only bp->max_tpa (32) entries. Writes
> to tpa_info later in the code are out of bounds.
> 
> This bug results in a crash at boot:
> 
> Oops: general protection fault, kernel NULL pointer dereference 0x8: 0000 [#1] SMP NOPTI
> RIP: 0010:bnxt_rx_pkt+0xc0/0x1560
> RSP: 0018:ffffc900009b8c78 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000048 RCX: 0000000206682516
> RDX: ffffc900009b8db4 RSI: 0000000000000000 RDI: 01ffffff038fe1c0
> RBP: ffffc9006e687480 R08: ffffc9006e687000 R09: 0000000000003048
> R10: 0000000000000480 R11: ffff8881c6083900 R12: 0000000006682516
> R13: ffff8881c6095400 R14: 0000000000000016 R15: ffff8881c6b66680
> FS:  0000000000000000(0000) GS:ffff88fef3c77000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fc8bda40584 CR3: 000000807c812001 CR4: 0000000008772ef0
> PKRU: 55555554
> Call Trace:
>  <IRQ>
>  ? __netif_receive_skb_list_core+0x1ca/0x250
>  __bnxt_poll_work+0x152/0x280
>  bnxt_poll_p5+0x1cd/0x480
>  __napi_poll+0x30/0x180
>  net_rx_action+0x20b/0x3b0
>  ? note_gp_changes+0x53/0xe0
>  ? tick_setup_sched_timer+0x180/0x180
>  ? __napi_schedule+0x9a/0xb0
>  ? bnxt_msix+0x24/0x30
>  handle_softirqs+0xdd/0x2c0
>  __irq_exit_rcu.llvm.3171231171502365008+0x47/0xf0
>  common_interrupt+0x85/0x90
>  </IRQ>
>  <TASK>
>  asm_common_interrupt+0x22/0x40
> 
> This stack trace is from a crash triggered when an out of bounds rx_tpa
> is dereferenced. The invalid write mentioned above is silent in this
> particular crash.
> 
> Fix this by allocating rx_tpa with bp->max_tpa rounded up to the next
> power of 2 (bp->max_tpa_roundup_size) entries and masking the FW TPA ID
> with that size, so the wrapped ID can never index past the end of the
> array.
> 
> Fixes: 54c28fab2fa5 ("bnxt_en: Set bp->max_tpa according to what the FW supports")
> Reported-by: Raphael Cardoso Fernandes <raphaelcf@meta.com>
> Suggested-by: Michael Chan <michael.chan@broadcom.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Joe Damato <joe@dama.to>
> ---
> v4:
>   - Moved bp->max_tpa_roundup_size init out of the early return path and
>     documented that TPA is unsupported there, as suggested by Michael.

Clashiko quite convincingly elaborates that the above is not enough:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to

Could you please have a look?

/P

