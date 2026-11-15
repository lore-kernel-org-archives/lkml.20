Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770969;
	b=FJCUOCuTmbtoA8kMUbtErJU9q+f5EoXhMHVdPeurILoaRImGFyCfJiZaD36hIZM3nJ7T
	 jeSzdi45YMhECNPe9ukw0DfNf4piO2fPsFcLCmvaXqziCwx3hgvEzAawG1Xa8f1FjkNvA
	 ypAvCwKmi/ngY5V3fVhu2co10yN6pw0PRr00KUFQuCNrsGklFrstlDAiDJ47ZnLK1xScz
	 Tkcb4TSPR/ST+WGebcjao1pXMIMKEWOLoQSbl2x7BB0KEu35SGLKwTdDfPvpoTNcw1Dr8
	 HUZp9bW4NCNn9WJ2KB+tElaiSppwUjJS9kgElIS6go/XqVA0dtRVZGuPq56cOEHTs5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770969;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=w/Qfye4USoNiVqb39FnhpQx74r97Vedt+PqJLSo2rds=;
	b=aThSw3cn25Zlul59W03Lco8pnTqJdu7zlRkBfucB7xFENFBm2NWZj3MjaXzmvWCHknk7
	 KGchBcUSz2yDHTqsyHYKkGbGaAh5Mw9dMPAnh4pkF+xrMiDvSSDEHo1FQbYUWHBIueBQ+
	 VIZL8yfOUOa6CSVFLJlNzE2QDfNrB9pJQB3dxKUa5bL5wTnbxZsnTy8R8439RHLUYm0gH
	 Xp7aEzVCvGQHbsHdfRt5NcPxDWkEnguXetdZJOgz7GgjpIO/JsLOxadK0xs/5kxRAP4ZZ
	 1//wPi0KI4uDl/4zIj4uEd77l3PgV/in7rzstskM2aexkD5C5OpFBGtHnuBxiE32MBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iL3orEa8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D5606A882;
	Sun, 15 Nov 2026 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iL3orEa8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473711F000CA;
	Sun, 15 Nov 2026 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770969;
	bh=w/Qfye4USoNiVqb39FnhpQx74r97Vedt+PqJLSo2rds=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iL3orEa8IbotLOVhN77lMohI7TgLYKV96aiB6KHCbydHlcbxkxiVERcK41dmzSoqZ
	 y9MKQinGKevxS/Ytec+At+sIh7r6XIETUmOF9rjqmSw31BZVDZNjfFi5WY+4CX41yu
	 5ZPEykN2dxRTVGfB0OjX8D+7b18605VKM+y5CsyqraqmjldU2odLSjLDHCvokH9AKl
	 7tfeahqXM3tPWtyG/1rcAkDN9aiy/D+xnXocUfMhX5TIYFKkVbeKt6zPDD94mjLadF
	 V3vWoTQACEvh53QIWGkbMrlxrIU1wjZe5KnA42DepWTko4YCEnBGCj1QXWZ6Nu/2iE
	 fiQ8uTWKLAc1g==
Subject: Re: [PATCH net-next v4 5/5] bnge: create NQ0 during probe and keep it
 active across open/close
From: netdev-bot+sashiko@kernel.org
To: bhargava.marreddy@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com,
 dharmender.garg@broadcom.com, rajashekar.hudumula@broadcom.com,
 ramakrishna.koduri@broadcom.com, rahul-rg.gupta@broadcom.com
Date: Sun, 15 Nov 2026 19:29:27 +0000
Message-ID: <179477096781.3136.18075947087153422171@kernel.org>
In-Reply-To: <20261111190011.53437-6-bhargava.marreddy@broadcom.com>
References: <20261111190011.53437-6-bhargava.marreddy@broadcom.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] bnge: race between bnge_napi_poll() and bnge_shutdown_nic() on
  NQ0

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch adds
  more callers that hit it.

--

bnge: create NQ0 during probe and keep it active across open/close

This commit creates NQ0 and its MSI-X vector once at probe and keeps them
until remove, so firmware async events and HWRM completions are still
received while the interface is down. While the interface is up NQ0 is
serviced by NAPI, and while it is down it is serviced by a new nq0_work
worker. The BNGE_STATE_NQ0_NAPI bit selects which one is used, and it is
switched in open and stop.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index 400ada1023ed6..ab917c0f81b1f 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -2963,11 +3057,32 @@ static int bnge_hwrm_if_change(struct bnge_dev *bd, bool up)
>  	return bnge_hwrm_req_send(bd, req);
>  }
>  
> +/* Hand NQ0 from nq0_work to NAPI. The caller keeps NQ0's IRQ disabled; it is
> + * re-enabled here.
> + */
> +static void bnge_nq0_wq_to_napi(struct bnge_net *bn)
> +{
> +	struct bnge_nq_ring_info *nqr = &bn->nq0->nq_ring;
> +	struct bnge_napi *bnapi = bn->nq0;
> +	struct bnge_dev *bd = bn->bd;
> +
> +	bnapi->in_reset = false;
> +	bnapi->tx_fault = 0;
> +	napi_enable_locked(&bnapi->napi);
> +	set_bit(BNGE_STATE_NQ0_NAPI, &bn->state);
> +	BNGE_DB_NQ_ARM(bd, &nqr->nq_db, nqr->nq_raw_cons);
> +	enable_irq(bd->irq_tbl[nqr->ring_struct.map_idx].vector);
> +}

[ ... ]

> @@ -3017,6 +3141,7 @@ static int bnge_open_core(struct bnge_net *bn)
>  	set_bit(BNGE_STATE_STATS_ENABLE, &bn->state);
>  
>  	bnge_enable_int(bn);
> +	bnge_nq0_wq_to_napi(bn);

[Severity: High]
This isn't a bug introduced by this patch, but the patch adds more callers
that run into it. On 32-bit builds, bnge_writeq() takes bd->db_lock with a
plain spin_lock() and leaves BH enabled:

drivers/net/ethernet/broadcom/bnge/bnge.h:bnge_writeq() {
#if BITS_PER_LONG == 32
	spin_lock(&bd->db_lock);
	lo_hi_writeq(val, addr);
	spin_unlock(&bd->db_lock);
    ...
}

bnge_writeq_relaxed() in bnge_txrx.h does the same thing. Softirq code
takes the same lock too: bnge_napi_poll() takes it through BNGE_DB_NQ(),
BNGE_DB_NQ_ARM() and the CQ doorbells, and the xmit path takes it as well.

Here bnge_nq0_wq_to_napi() writes BNGE_DB_NQ_ARM() from process context.
By that point bnge_enable_int() has already armed NQ1..n with their NAPIs
enabled. The close path has the same ordering:

bnge_close_core()
  bnge_nq0_napi_to_wq()
    bnge_nq0_poll()
      BNGE_DB_NQ_ARM()
        bnge_writeq()
  bnge_disable_napi()    <- NAPI for NQ1..n is only disabled here

Can this self-deadlock on a 32-bit kernel? Suppose an interrupt for one of
the other NQs lands on the same CPU while process context holds db_lock.
irq_exit() can then run NET_RX softirq:

process context               same CPU, softirq from irq_exit()
bnge_nq0_wq_to_napi()
  bnge_writeq()
    spin_lock(&bd->db_lock)
                              bnge_napi_poll()
                                BNGE_DB_NQ_ARM()
                                  bnge_writeq()
                                    spin_lock(&bd->db_lock)  <- spins

With lockdep enabled, this should also be reported as an inconsistent
{SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock state once traffic flows after the
first open.

The existing process-context callers bnge_enable_int() and
bnge_disable_int() already followed this pattern before this patch.

Would it make sense to use spin_lock_bh() or spin_lock_irqsave() in
bnge_writeq() and bnge_writeq_relaxed()? Disabling BH around the
process-context doorbell writes would also work.

[ ... ]

> @@ -3243,6 +3402,8 @@ static void bnge_close_core(struct bnge_net *bn)
>  
>  	timer_delete_sync(&bn->timer);
>  	bnge_shutdown_nic(bn);
> +
> +	bnge_nq0_napi_to_wq(bn);
>  	bnge_disable_napi(bn);
>  
>  	/* Save ring stats before shutdown */

[Severity: High]
Does this ordering leave a window where NQ0's NAPI is still running
against rings that firmware is tearing down?

bnge_shutdown_nic() calls bnge_hwrm_resource_free(bn, 1), which calls
bnge_hwrm_ring_free(bn, 1). At that point NQ0 is still in NAPI mode:
BNGE_STATE_NQ0_NAPI is set, vector0 is enabled and NAPI is enabled.

On the close path, bnge_hwrm_tx_ring_free(), bnge_hwrm_rx_ring_free()
and bnge_hwrm_rx_agg_ring_free() point cmpl_ring at the L2 completion
ring. __hwrm_send_ctx() therefore waits until bnge_napi_poll() reaches
bnge_hwrm_update_token() through __bnge_poll_work() and
bnge_hwrm_handler().

The waiter can wake up as soon as the token becomes
BNGE_HWRM_COMPLETE. bnge_napi_poll() may still be inside its loop and
may not yet have updated nqr->nq_raw_cons or written the NQ doorbell.
bnge_hwrm_ring_free() then goes straight to bnge_disable_int_sync() and
bnge_hwrm_cp_ring_free():

CPU0 (ndo_stop)                  CPU1 (NET_RX softirq)
bnge_hwrm_ring_free()            bnge_napi_poll() on NQ0
  rx/agg ring free                 __bnge_poll_work()
    waits for token                  bnge_hwrm_update_token()
  <- wakes up                      ...
  bnge_disable_int_sync()
    bnge_disable_int()
      reads nqr->nq_raw_cons
                                   nqr->nq_raw_cons = raw_cons
                                   BNGE_DB_NQ_ARM()
      bnge_db_nq() with old cons
    synchronize_irq()
  bnge_hwrm_cp_ring_free()

synchronize_irq() waits only for the hardirq handler, not for the
softirq poll. Nothing here orders the two doorbell writers, so one of
two things can happen:

- The mask write goes out with a stale consumer index after the poll
  has advanced it.
- The poll re-arms NQ0 after it was masked. This happens while NQ0's
  completion rings and stat contexts are being freed in firmware, and
  while vector0 is still routed to NAPI.

Before this patch, NQ0 was freed in firmware on close and re-created
on open, so any state this race left on the NQ was discarded. Now NQ0
persists. The same NQ also carries the async events and HWRM
completions that the worker mode depends on while the interface is
down.

Is the bnge_nq0_poll() re-arm in bnge_nq0_napi_to_wq() meant to repair
NQ0's doorbell state after this race? If not, would it be better to
quiesce NQ0's NAPI, and the other NQs' NAPIs, after the TX/RX/AGG ring
frees but before bnge_disable_int_sync() and the completion ring frees?
That would replace doing it only after bnge_shutdown_nic() has
returned.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111190011.53437-1-bhargava.marreddy%40broadcom.com
