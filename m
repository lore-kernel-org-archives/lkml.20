Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247544;
	b=kuTXfPxX6BdBIDT1GcUW2tQJo0W2R2pUS+UrnGY9Da70a0ix9ejZP9wDc4w4/SVZCU4h
	 Ql6QY1Tq+G1C6IQoV9e4V4GJQgF8b3ldV/8mryQaJct/e/mPfVCMZ0k7Sij4rYrj9Jogc
	 a7HuCIABnDyUJ2qfg8X1f5gF+uBc754zZFvNvVwL3F1aWagwj97wH4Obcz+lvWs7Pg7gr
	 0w0thB7ur+WWSlznijX8xFQIxBWWiyAQKrKJgIQXEzQ9NLKzBkFcFvzamcV1RMQxM7GSk
	 OaWBC5/mKBWsZRihBZYdJaMjjmm8ymWQt1+OZuLn2y+rGglNKND8zWEjzzlQlHr/tPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=JYuSfXac2Sfe5LwfbGtGvm5F5xp51Jhaes/ny2DYZ3Q=;
	b=jDbEwGiwNfXX4K5EYkcunS1oWQQkA0N2H0GBu8W0/N3ON+R+6SQiPpT8z/D0PtisYFau
	 Mxy0nR4amATm7B6L9U18x6MmPV9hasb+fZmibi2isEJsg8kLVvR3sbiEAv5d2EO/QIVOR
	 6xZWpTbSTwMuiSFyYxyp6XAvfmBoH7K/udz7OpWYKkkeJ0t/SLTV/w6WwaaFBg2uLE+LV
	 k5xW5WM0C/qGKSIo6wmdAn750BNRZtOM2boF5hjOgslQqPquWbeuKJpjaXqqOIGQQzi8/
	 O2vJu6jDIVxMo+N7UM5zyDhwnTA+65byq7Qz94zauZ2rFcaT0aSE4vNekTGeIg4J6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PEp9OGfb;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3F606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E3F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PEp9OGfb
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so564577b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794247543; x=1794852343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYuSfXac2Sfe5LwfbGtGvm5F5xp51Jhaes/ny2DYZ3Q=;
        b=PEp9OGfbkDyV91LhqsYOULMnXpFc+36z18ZJC7vf/9OVLpkouLl9MMhHt4L+1s+ubd
         ysYx7qxyvj/Qw7rKj4ska/KqCFg3O7mS+P9JaMDtO1OTUCt/UXh59qlprrZiEXl0lW5i
         OW81nlw78k3hnDealNLnQ/xbC2165tUOu6g1iIW4jkB+tNWKuqahZpk4JQYbcT+gBZVM
         9krgrDGlPjtzk8G++FSN7zFMPeHLFFwZGP2FrnNm5yCow0ILs74TGqSP86bky5iVpmZc
         eaWDwJDs5cm+5HF8WAavWHAOQRBiFTqH3xXQKfjBY0dhMvpCYC3dUlJeX8O920iozn1u
         ITxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247543; x=1794852343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYuSfXac2Sfe5LwfbGtGvm5F5xp51Jhaes/ny2DYZ3Q=;
        b=caXQgn+mvamCBv9iNzuEYQs50JO/sB9++eGXp8i5hn1AV2nMXtvu04WUsEKVfr6cyf
         nfjRosmkntsZ4h79Fr/MypNRS8bVAZmzYJBMYwHizwevm5mbL3TMl3s1VB4vYRXLoWI1
         CvgqOjFnhdLstbqGMB6HeRWiDc4TnbscuGTEAyuel3LBf7ttDrxXcYuXBbXaAebAvR+0
         nQX5VUa/FRAjEX9yyE3whcBHy8Ewt6O/UUDvzU8TvgCfIXgnT6yE+fQX/6YEZ+gUhHW8
         RpkOI++a9UNVVnOf08s/ut4SSr7xaGnHs8R5dCVIf3BKYW0qIkO1OmLJg8vR29RluU8r
         MZ1Q==
X-Forwarded-Encrypted: i=1; AL+hErGH1VnjRTToq5r31eIcHD//RM7pBVQtMqk1buyY6jXNUzc3+sv/Bh/mYSukQAnLWh9mfSlPGMwSp69BPiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BUFunjSBHzECww/gi8clfaMjBzmHh+HfxDfpCDSAuEcIGyZms
	gN/BjyT4vTv9IML/YGF7pd8+JzBrLqeMsOFX9TYwxsSQY9Hu9cMrdkuhduM22OQMQGg=
X-Gm-Gg: AYBFou0O3/6ik+21AWj6YWnjSmKRoyCh2qk47tsanaxIPIGNq1FKZzeQIB8S8o7bkVk
	rg2q/iPGheTu6eSSscxqHAEIxE2PZftF7MZnFc+xD5BAxPvWoL/yZwEAW2f1ypIOoZ+7UkYwNdS
	M5UhuPNZkyI5Eqlm90DT4/jM3XdYVQ9X6z9ApLbFdYZGZsGvNcPGInl5CSitpop3vfTh6GgdfuF
	XTWGX/D65z2EIYstXOhoxADfd1j8ENHZptbM0J/oxXNTtUFWElusCYbVpaRQ5fVCh4uwqZU84wH
	RCxTsKutHtYVfywgEpjLQdD8HpBxDtpT4ykxWuJAhh6wIHr6/N32hV1ASIMsFuYeiCRd+rYf2uT
	aOESdljI+MdlMDaC5pcDpiNcrPGE35J3KtBtbKWi457K61NMvVLSvhcJWEOd+sPBQa8l9n1tzFK
	GF9fLAf873kQ9fCp37fIkSMPme2COyVv4l2/qpsi5hS+h3CTf8P6vtQXyIA2sOWHiWYDsoiKp+G
	PfWKqlNxDpNrWseIx7UlRBgcsiICPK6O1Il1skh/ozkiuYCKYbiaWtoOpVnS5uoDKRADSz7Uis9
	UaqZGs91/NDEAZypzY1sXKR15amT+47vvIV/q5sQMg==
X-Received: by 2002:aa7:9312:0:b0:8a3:7425:9095 with SMTP id d2e1a72fcca58-8ba83bd02famr386998b3a.7.1794247543269;
        Mon, 09 Nov 2026 10:05:43 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de768fsm3240b3a.6.2026.11.09.10.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:05:42 -0800 (PST)
Date: Mon, 9 Nov 2026 10:05:41 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 2/4] bnxt_en: check HWRM response if completion
 never arrives
Message-ID: <avILdbx3/kxRt67Q@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
References: <20261106191423.4194081-3-joe@dama.to>
 <179408153103.994134.11897477531270570828@kernel.org>
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
In-Reply-To: <179408153103.994134.11897477531270570828@kernel.org>

On Sat, Nov 07, 2026 at 07:58:51PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 3 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new fallback for a missing completion is in the generic
>   completion-ring wait branch of __hwrm_send()…
> - [Medium] bnxt_hwrm_rx_ring_reset()
>   (drivers/net/ethernet/broadcom/bnxt/bnxt.c:14467) sends…
> - [Medium] In the new fallback for a missing completion in __hwrm_send(),
>   dma_rmb() runs once, before the loads of seq_id, resp_len and the…
> - [Low] The commit message says the valid byte need not be polled because
>   'Several seconds are spent waiting for the completion, so a response…
> - [Low] BNXT_HWRM_CTX_SILENT is documented in bnxt_hwrm.h as 'squelch
>   firmware errors', and hwrm_err() turns messages into netdev_dbg when…
> 
> --
> 
> bnxt_en: check HWRM response if completion never arrives
> 
> This changes __hwrm_send() so that when a command sent over a completion
> ring never has its completion consumed by NAPI, the DMA response is
> checked before giving up. If resp_len is non-zero, the sequence id
> matches and the valid byte is set, the command is treated as completed
> and falls through to the normal error_code handling.
> 
> > Several seconds are spent waiting for the completion, so a response that
> > was written at all is complete by the time the wait gives up. There is no
> > need to poll for the valid byte here the way the polling path below has
> > to, where the poll is for a non-zero length and the valid byte at the end
> > of the message may still be on its way.
> 
> [Severity: Low]
> Is the "several seconds" part accurate? __hwrm_req_init() sets the
> default timeout like this:

I can fix the commit message if I respin (I'm still going through the feedback
so idk yet). I don't think it's worth a respin if this is the only real issue,
but I suspect there are real issues that will require a respin.

> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > index 5bfabdca7d0e2..4feba90f0bf68 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > @@ -582,11 +582,36 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
> >  		}
> >  
> >  		if (READ_ONCE(token->state) != BNXT_HWRM_COMPLETE) {
> > -			hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
> > -				 req_type);
> > -			goto exit;
> > +			__le16 resp_seq_id;
> > +			u8 valid_byte = 0;
> > +
> > +			/* The completion ring entry was not delivered for
> > +			 * some reason. It might be possible that the command
> > +			 * was carried out even without a completion being
> > +			 * posted. Check the response before giving up and log
> > +			 * the state.
> > +			 */
> > +			dma_rmb();
> > +			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
> > +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> > +			if (len && resp_seq_id == ctx->req->seq_id)
> > +				valid_byte = *((u8 *)ctx->resp + len - 1);
> 
> [Severity: Medium]
> Is the dma_rmb() in the right place here? It runs once, before the
> seq_id, resp_len and valid byte loads. Nothing orders the loads of the
> rest of the response after the valid byte is seen.
> 
> Those later reads include ctx->resp->error_code in the netdev_warn()
> below. They also include the common tail of __hwrm_send():
> 
>     *valid = 0;
>     rc = le16_to_cpu(ctx->resp->error_code);
> 
> and any response fields that callers read after hwrm_req_send() returns.
> 
> Firmware writes the valid byte last. The usual consumer pattern is to
> see the valid byte, then dma_rmb(), then read the payload. The address of
> the valid byte load depends on len, but the error_code load depends on
> nothing.
> 
> On weakly ordered CPUs such as arm64 or POWER, could the error_code load
> complete before the valid byte load while firmware is still writing the
> response at the timeout boundary? The response buffer starts zeroed, so a
> stale error_code would read as 0 and a failed command would look like a
> success.
> 
> For HWRM_RING_FREE, would that hide a failure from the error handling
> added later in the series, which stops DMA only when ring free fails?

I think this is true; the dma_rmb needs to come later so I'm going to mark
this as CR, but will reply to the rest of the feedback to make sure I figure
out what will come in the next revision.

> The polling path has the same gap after its valid loop. This patch adds
> a new consumer that relies on the completeness argument in the commit
> message.

This existed before my series, so I feel like fixing this for polling maybe is
code for net-next (?)

> > +
> > +			if (!valid_byte) {
> > +				hwrm_err(bp, ctx,
> > +					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
> > +					 req_type, len,
> > +					 le16_to_cpu(resp_seq_id),
> > +					 le16_to_cpu(ctx->req->seq_id));
> > +				goto exit;
> > +			}
> 
> [Severity: Medium]
> This fallback is in the generic completion ring branch, so it covers
> every request that sets cmpl_ring, not only HWRM_RING_FREE. Does it change
> the result of the ethtool interrupt self test?
> 
> bnxt_hwrm_selftest_irq() sends HWRM_SELFTEST_IRQ with the completion ring
> set:
> 
>     req->cmpl_ring = cpu_to_le16(cmpl_ring);
>     return hwrm_req_send(bp, req);
> 
> The test catches a broken interrupt path only because hwrm_req_send()
> fails when NAPI never consumes the HWRM_DONE.
> 
> Firmware still writes the DMA response for the command. If the interrupt
> or completion never reaches NAPI, this path now falls through and returns
> error_code, which is 0:
> 
> ethtool -t <dev> offline
>   bnxt_self_test()
>     bnxt_test_irq()
>       bnxt_hwrm_selftest_irq()
>         __hwrm_send()
> 
> bnxt_self_test() marks the test failed only here:
> 
>     if (rc || bnxt_test_irq(bp)) {
>         buf[BNXT_IRQ_TEST_IDX] = 1;
>         etest->flags |= ETH_TEST_FL_FAILED;
>     }
> 
> Would Interrupt_test then pass on a device whose interrupt delivery is
> broken, with only a netdev_warn in dmesg? The commit message mentions
> only the ring free case.

Yea this is legit. I will fix this in the next revision.

> [Severity: Medium]
> bnxt_hwrm_rx_ring_reset() raises a similar question. It sends
> HWRM_RING_RESET with cmpl_ring set to the RX ring's own completion ring,
> using hwrm_req_send_silent().
> 
> Before this patch, a lost completion returned -EBUSY. bnxt_rx_ring_reset()
> then fell back to bnxt_reset_task(), which also re-initializes NAPI and
> IRQs:
> 
>     rc = bnxt_hwrm_rx_ring_reset(bp, i);
>     if (rc) {
>         ...
>         bnxt_reset_task(bp, true);
>         break;
>     }
>     bnxt_free_one_rx_ring_skbs(bp, rxr);
>     ...
>     rxr->bnapi->in_reset = false;
> 
> Now the same case can return 0 and take the in-place recovery path.
> 
> Commit 74608fc98d28 sent the response through the ring's own completion
> ring for ordering: "The response will be the last entry in the ring and
> we can free the ring after getting the response." When NAPI consumes
> HWRM_DONE, that shows the earlier RX completions on the ring were
> discarded while in_reset was set.
> 
> Without that, can unconsumed completions stay on the cp ring and be
> processed by bnxt_rx_pkt() after in_reset is cleared and the buffers are
> replaced?
> 
> If the completion was lost because the ring's interrupt or NAPI is stuck,
> would the in-place path leave the ring broken, where the global reset
> would have recovered it?
> 
> What happens once stale entries are processed depends on runtime state,
> so this one is less certain.

I think this is legit, too.
 
> > +			netdev_warn(bp->dev,
> > +				    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
> > +				    req_type, len, valid_byte,
> > +				    le16_to_cpu(ctx->resp->error_code));
> 
> [Severity: Low]
> Should this respect BNXT_HWRM_CTX_SILENT? The flag is documented as
> "squelch firmware errors". The failure side of this branch uses
> hwrm_err(), which drops to netdev_dbg for silent contexts.
> 
> This netdev_warn() always prints the firmware error_code. The common tail
> of __hwrm_send() suppresses the same error_code for silent callers:
> 
>     if (rc == HWRM_ERR_CODE_BUSY && !(ctx->flags & BNXT_HWRM_CTX_SILENT))
>         netdev_warn(bp->dev, "FW returned busy, hwrm req_type 0x%x\n",
>                     req_type);
>     else if (rc && rc != HWRM_ERR_CODE_PF_UNAVAILABLE)
>         hwrm_err(bp, ctx, "hwrm req_type 0x%x seq id 0x%x error 0x%x\n",
>                  req_type, le16_to_cpu(ctx->req->seq_id), rc);
> 
> bnxt_hwrm_rx_ring_reset() uses hwrm_req_send_silent() and goes through
> this path. A lost completion there would now log a warning that includes
> the firmware error code.

OK, I can make the warning respect silent callers, so I'll fix this in the
next revision.

pw-bot: cr
