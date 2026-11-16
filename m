Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837293;
	b=q6tGlz43Ksw5U0i7WfREzWkq8Z9SoFKLd3ZC6Xl2LwCvCORIV1ddlYlsA1s0voSHT8+w
	 fhV4u9y0vRoCu7zky9qH6P1edC90k6ZZZgB7bcY+B3gDpO+ILpCJ3VDJ1eSZ2KSJgK7Ny
	 M4qnF+OsTx0Y21F81dvaKIN00hQlbayQTGj2KG2ypRTYusmJwHBpjbhtM+w40rr36k1y+
	 qeSMc97mxjDR72H8syhTZqc+UzcrRLux3dzLBMDrl0CiDE2lW4svjRxpX+Eg02ft+Ce4P
	 +ZUhJs7TNMNMdbt80YoMza/pC0HHRFlJguJyc3SUhkaHX5oZLYhC1qolDlDGPCvalsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837293;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=unxNUnNvHo9UiEFNkytw5QgCqdwu/8SsVq4RLekX030=;
	b=pedOtz4Bpv0TyeiDESG5dS6JDFAsAT3hZh4tLFrk+LkMM0G7vtUNCWIR1MSm4pYwACwW
	 mZe+CC8cfeCnHb7FI8s9TaWa3D0RCyUEy5/4+7CeFGNLjs/vFXo4NMjr/bAutM3nWHOSJ
	 m2MrlyOzWqqVR6thzseSDTeF0sKa3VwGHqrHy2yOz3Nw3LVbtLXV0WFdf+lwnak9AMZXT
	 FzxTrklfFHFjTvsXA+6Lm4hHyaXdD2Z2dlbZzm/G0nVp8dNx/J6ciqi7bynq0BcTPI9lY
	 3XkwNn4CqE/U36wJcYSJVySvSojDondE1XXJd9mG5XudiqC5XdWXmHTUsEo0zjFye/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StcbKjgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015C0606A889;
	Mon, 16 Nov 2026 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StcbKjgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96D71F000CD;
	Mon, 16 Nov 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837292;
	bh=unxNUnNvHo9UiEFNkytw5QgCqdwu/8SsVq4RLekX030=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=StcbKjgQOuezUN2KYHQTEH1d4Bkt4C2KFvx2LMLVRBkBkx6OPpQHdbvTov+zqXlOP
	 6l1boZYSARnfVYO2All2qv6gm9ushbJjiOyn54jBTUMerK1JK2lD/7bfn3UAm97Oxy
	 FeOO/Vk7DBr+/E9cHP3I04LcJBAyhp5YNYtF8nBR8xQ+wKIWIKHKbsGmeqsOuG0fZW
	 cXpi9wuQeQ5MJg3Dxu8I8Llc6BeEGH4DY2KzmtOR9v8jvf89O/YSJ86EkwabHte7Pj
	 n3vwJkuhdnyVzL82z6ZgeyTXrcRGvyZqqZdyDyJlb4KOwQtsbvTHMFUNyfsFx2Cthe
	 X0gsi4XBEmzTg==
Subject: Re: [PATCH net v3 RESEND 1/3] net: ti: icssg-prueth: Fix TX timestamp
 cleanup crash
From: netdev-bot+sashiko@kernel.org
To: m-malladi@ti.com
Cc: diogo.ivo@siemens.com, haokexin@gmail.com, philippe.schenker@impulsing.ch,
 devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, danishanwar@ti.com
Date: Mon, 16 Nov 2026 13:54:51 +0000
Message-ID: <179483729133.3136.8884772760823152816@kernel.org>
In-Reply-To: <20261112102140.2744508-2-m-malladi@ti.com>
References: <20261112102140.2744508-2-m-malladi@ti.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 2 (2) · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch only makes prueth_cleanup_tx_ts() aware of the
  ERR_PTR(-EBUSY) sentinel.
- [High] The ERR_PTR(-EBUSY) state exists only between
  prueth_tx_ts_cookie_get() (icssg_common.c:1184) and the store…
- [Medium] The Fixes: tag names the wrong commit.
- [Medium] The commit message and the new comment misdescribe both the
  trigger and the effect.
- [Medium] The new check in prueth_cleanup_tx_ts() loads
  emac->tx_ts_skb[i] twice with plain, non-READ_ONCE loads: once in…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  prueth_cleanup_tx_ts() (phylib work context) and the TX timestamp…
- [High] This problem wasn't introduced by this patch, but
  prueth_tx_ts_cookie_get() (icssg_common.c:1177-1190) reserves a slot…

--

net: ti: icssg-prueth: Fix TX timestamp cleanup crash

This patch changes prueth_cleanup_tx_ts() to skip slots that hold NULL or
the ERR_PTR(-EBUSY) reservation sentinel. It still clears every slot to
NULL. The goal is to stop dev_kfree_skb_any() from being called on a slot
that the TX path has reserved but not yet filled.

> Fixes: e2dc7bfd677fc ("net: ti: icssg-prueth: Move common functions into a separate file")

[Severity: Medium]
Is this the right commit for the Fixes: tag?

e2dc7bfd677fc is a code move, and its message says it introduces no
functional changes. Before that commit, icssg_prueth.c already had
prueth_tx_ts_cookie_get() storing ERR_PTR(-EBUSY), and a static
prueth_cleanup_tx_ts() with the same check:

    if (emac->tx_ts_skb[i]) {
        dev_kfree_skb_any(emac->tx_ts_skb[i]);

Both came from 186734c15886 ("net: ti: icssg-prueth: add packet
timestamping and ptp support"), which landed in v6.6. e2dc7bfd677fc
landed in v6.10. Stable tooling that follows the current tag would skip
6.6.y, which has the same cleanup code.

Should this be:

Fixes: 186734c15886 ("net: ti: icssg-prueth: add packet timestamping and ptp support")

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
> index 4a7d1a6f470b1..8cb2ad2ebece5 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
> @@ -1426,10 +1426,13 @@ void prueth_cleanup_tx_ts(struct prueth_emac *emac)
>  	int i;
>  
>  	for (i = 0; i < PRUETH_MAX_TX_TS_REQUESTS; i++) {
> -		if (emac->tx_ts_skb[i]) {
> +		/* Slot may hold ERR_PTR(-EBUSY) if the TX path reserved it
> +		 * but has not yet stored the real skb pointer.  Skip the free
> +		 * but still clear the slot so it can be reused.
> +		 */

[Severity: Medium]
Do this comment and the commit message accurately describe when the slot
holds ERR_PTR(-EBUSY)?

Only prueth_tx_ts_cookie_get() writes the sentinel. A few instructions
later, icssg_ndo_start_xmit() overwrites it, with no return or goto in
between:

    tx_ts_cookie = prueth_tx_ts_cookie_get(emac);
    if (tx_ts_cookie >= 0) {
        skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
        ...
        emac->tx_ts_skb[tx_ts_cookie] = skb_get(skb);

So prueth_cleanup_tx_ts() can only see the sentinel while an xmit is
running at the same time. The commit message doesn't describe this as a
race.

The commit message also says "preventing NULL pointer dereference".
Wouldn't the original failure be a dereference of the ERR_PTR value inside
kfree_skb(), not a NULL dereference?

The comment says the slot is cleared "so it can be reused". The xmit that
reserved the slot is still running, though, and will store skb_get(skb)
into it anyway.

Could the commit message and the comment describe the actual race?

> +		if (!IS_ERR_OR_NULL(emac->tx_ts_skb[i]))
>  			dev_kfree_skb_any(emac->tx_ts_skb[i]);

[Severity: Medium]
Can these two plain loads of emac->tx_ts_skb[i] return different values?

Three things change the slot with no common lock: icssg_ndo_start_xmit()
on any TX queue, tx_ts_work(), and the xmit error paths. Consider this
sequence:

- The load in IS_ERR_OR_NULL() sees a valid skb.
- tx_ts_work() takes that skb and writes NULL.
- Another xmit reserves the slot before the second load.

The result is dev_kfree_skb_any(ERR_PTR(-EBUSY)), which is the crash this
patch is meant to prevent.

This only happens if the compiler emits two separate loads, which C allows
for plain accesses.

Would it be safer to read the slot once into a local with READ_ONCE() or
xchg()? The underlying fix still needs a lock.

[Severity: High]
This isn't a bug introduced by this patch, but what stops this free from
racing with the TX timestamp consumers?

prueth_cleanup_tx_ts() runs from the phylib link change path. Meanwhile,
tx_ts_work() (threaded tx_ts_irq) and prueth_tx_ts_sr1() (threaded mgm
IRQ) read and then clear the same slot without a lock:

    skb = emac->tx_ts_skb[tsr.cookie];
    emac->tx_ts_skb[tsr.cookie] = NULL;	/* free slot */
    ...
    skb_tstamp_tx(skb, &ssh);
    dev_consume_skb_any(skb);

Suppose tx_ts_work() reads skb S, and prueth_cleanup_tx_ts() also reads S
and calls dev_kfree_skb_any(S) before tx_ts_work() writes NULL.
tx_ts_work() then calls skb_tstamp_tx() and dev_consume_skb_any() on a
reference that has already been dropped.

If TX completion has already released the base reference, isn't that a
use-after-free followed by a double free?

The error paths in icssg_ndo_start_xmit() race with cleanup the same way:

    cleanup_tx_ts:
        if (in_tx_ts) {
            dev_kfree_skb_any(emac->tx_ts_skb[tx_ts_cookie]);
            emac->tx_ts_skb[tx_ts_cookie] = NULL;
        }

Both sides can drop the skb_get() reference, and then drop_free_skb frees
the base reference.

prueth_cleanup_tx_ts() also still doesn't adjust tx_ts_pending.

> -			emac->tx_ts_skb[i] = NULL;
> -		}
> +		emac->tx_ts_skb[i] = NULL;

[Severity: High]
The ERR_PTR(-EBUSY) case only happens while icssg_ndo_start_xmit() is
running. Can this unlocked NULL write then overwrite the skb that the
xmit is about to store?

emac_adjust_link() does:

    netif_tx_stop_all_queues(ndev);
    prueth_cleanup_tx_ts(emac);

emac_adjust_link_sr1() does the same. netif_tx_stop_all_queues() only sets
the XOFF bits and doesn't wait for an xmit that is already running:

CPU0 (emac_adjust_link)            CPU1 (icssg_ndo_start_xmit)
                                   prueth_tx_ts_cookie_get()
                                     tx_ts_skb[k] = ERR_PTR(-EBUSY)
prueth_cleanup_tx_ts()
  IS_ERR_OR_NULL(tx_ts_skb[k])
    -> true, skip free
                                   tx_ts_skb[k] = skb_get(skb)
  tx_ts_skb[k] = NULL

Does this leak the skb_get() reference on the skb, along with its socket's
sk_wmem_alloc charge?

When the timestamp response for k arrives, tx_ts_work() sees NULL, logs
"Invalid TX TS cookie" and breaks without decrementing tx_ts_pending.

Once the slot is NULL, an xmit on another TX queue can also reserve the
same index through prueth_tx_ts_cookie_get(), while the original xmit
still owns it. Two in-flight packets then share one cookie. The original
xmit's error paths (cleanup_tx_ts and free_desc_stop_q_busy_cleanup_tx_ts)
would call:

    dev_kfree_skb_any(emac->tx_ts_skb[tx_ts_cookie]);

on whatever the slot holds at that point. That may be the other packet's
skb or ERR_PTR(-EBUSY).

Cleanup and the xmit error path can also still both free the same valid
skb pointer.

Instead of another value check, would this need netif_tx_disable() before
the cleanup? It would also need a lock shared by prueth_tx_ts_cookie_get(),
the xmit error paths, tx_ts_work() and prueth_cleanup_tx_ts().

[Severity: High]
This makes prueth_cleanup_tx_ts() aware of the sentinel. Don't the
timestamp completion handlers still treat any non-NULL slot as a valid
skb?

tx_ts_work() in icssg_prueth.c only rejects NULL:

    if (tsr.cookie >= PRUETH_MAX_TX_TS_REQUESTS ||
        !emac->tx_ts_skb[tsr.cookie]) {

An ERR_PTR(-EBUSY) slot passes this check, and the later if (!skb) check
can't catch it. The value then goes to skb_tstamp_tx() and
dev_consume_skb_any().

prueth_tx_ts_sr1() in icssg_prueth_sr1.c only checks the cookie range:

    skb = emac->tx_ts_skb[cookie];
    emac->tx_ts_skb[cookie] = NULL;	/* free slot */
    ...
    skb_tstamp_tx(skb, &ssh);

skb_tstamp_tx() dereferences orig_skb->sk, so an empty slot causes a NULL
dereference.

prueth_cleanup_tx_ts() sets every slot to NULL on link-down. It doesn't
reset tx_ts_pending, and it doesn't synchronize with firmware timestamp
responses already queued for those cookies.

On SR1, consider this sequence:

- A timestamped frame is sent.
- The firmware posts the response.
- The link goes down.

emac_adjust_link_sr1()->prueth_cleanup_tx_ts() can then NULL the slot
before prueth_rx_mgm_ts_thread_sr1()->prueth_tx_ts_sr1() runs, which
leads to skb_tstamp_tx(NULL, ...).

On SR2, a stale response for cookie k could be handled while a new xmit
holds k reserved. That would pass ERR_PTR(-EBUSY) to skb_tstamp_tx(). If
the stale response is handled after the new skb_get() store, the old
timestamp is attached to an unrelated packet.

The missing NULL check in prueth_tx_ts_sr1() predates this patch. This
commit is fixing the case where a reserved or cleared slot is used as an
skb, so should tx_ts_work() and prueth_tx_ts_sr1() be covered as well?

[Severity: High]
This is a pre-existing issue, but is the slot reservation in
prueth_tx_ts_cookie_get() safe across TX queues?

    for (i = 0; i < PRUETH_MAX_TX_TS_REQUESTS; i++) {
        if (!emac->tx_ts_skb[i]) {
            emac->tx_ts_skb[i] = ERR_PTR(-EBUSY); /* reserve slot */
            return i;
        }
    }

All TX queues of the netdev share emac->tx_ts_skb[] (up to
PRUETH_MAX_TX_QUEUES on SR2). icssg_ndo_start_xmit(), however, is only
serialized by each queue's own lock. Two CPUs sending HW-timestamped skbs
on different queues could both see slot i as NULL and both reserve it.

Both packets would then carry cookie i in epib[0]:

- The second skb_get(skb) store overwrites the first, which leaks the
  first skb and its socket's wmem charge.
- tx_ts_pending is incremented twice for one slot.
- The first response could attach one packet's timestamp to the other.
- The second response would hit "Invalid TX TS cookie".

Suppose xmit B's ERR_PTR(-EBUSY) write lands after xmit A has stored its
skb. A's error path would then call dev_kfree_skb_any(ERR_PTR(-EBUSY)).

SR1 uses a single TX queue and doesn't appear to be affected.

Would a spinlock around tx_ts_skb[], or cmpxchg() for the reservation, be
needed here? This also looks like the root cause of the reservation
window races above.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112102140.2744508-1-m-malladi%40ti.com
