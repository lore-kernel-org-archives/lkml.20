Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776457;
	b=JMG8nzUc2CITDQhMpib+chSkaexbkOS/f40SxFRR3TKA+HKd7aIzKTEsfxwcqMKF+NA6
	 UV3x9PCaIv2ELxu1S9VPsZI8qi0kAQyiaGsmvxROOwCETLE7VLs/zkgxe/xA74kc9+BPp
	 67W0ZWxMzC//2uOXilGrdIqG2lMJHk9Nh1CRJ6oRGmpcND8Zm1WpXW54eP3tzovn9tYXz
	 OysibXTw0Rtn8PTHEMkvKL09ZdmsQuqayYMVCtCFKhawT3J4FcxwcwKt8MITB/eXsvUYq
	 cSDw6a34TbifUaKUH5T6t2Obgqb2Y3FzeF9bhgSxA4CsSpfjEDjI1mRFBBO2c5L0Hwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776457;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=656Da+jrPWmdQNHkO7/6kS8p2defFB4JOnbfs9xbp7M=;
	b=fYnpxZrHv1Iib2T9aq1KIKn+BmBpkA65OpjdrDWa70wl9Ku/wIk48mIUvrBJAzwjNcr2
	 C/HfNwEr3+cp4fAv8b0pvsK9lzsd3IKkqizkWaRpha6XYZXWXNlvC7qT/n759msGSg+jJ
	 yeVsxNQYqMCDtA3ksWvquaA7AfBjYd314ao7ybnUf35MExkS5sfD/0mtltHVb3+iXtiZ1
	 r/ievLIMQTcp80A1vwCDt20Cv4JJ6eVzEQT1y2GuRl64YvyRvwmXU27PMWuEpPVVfSzA2
	 Cc813I2W1gwhnpGdpswJjZ7Sly6X6ZCtmUHHHRjhe2TA1MZZRJEPGpa9GgG1T3o4J6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDfKscPK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45E2606A33A;
	Sun, 15 Nov 2026 21:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDfKscPK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3131F000CA;
	Sun, 15 Nov 2026 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794776456;
	bh=656Da+jrPWmdQNHkO7/6kS8p2defFB4JOnbfs9xbp7M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fDfKscPKjP13+xuRGT9Y9u5hlm5QtClCcpY7eBL86ndv3L1sNw32/dWj6PGk6HHEl
	 YQUAygylOp+q9vLbc/D42EnMUZmbbpzhppF9HqbvLLt+fs3Y1AYA4O8LMkGKWT5JzN
	 LrrCH7tckS1ovVZtzDUymr4Olx/nZOuUn1ZsKDiMlrKWWzcHZliA8e1+aiS1PZeoOk
	 oWimYnRtC1IkoIcaUY6Tfl2ASV4xcGL4qCEjJ9nQeEUXiHO4myUcllBFFjXfX/j2VU
	 SiASSG/Dv4ZIRovhG237hiXkzYxadJGQSkf9MjwSS+rpMrJQoJwP1EN0JRDnjeb0bU
	 ykq2xWdwQaKPA==
Subject: Re: [PATCH net v4 06/14] net: pse-pd: check the PI state under the
 lock when setting a power limit
From: netdev-bot+sashiko@kernel.org
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 21:00:55 +0000
Message-ID: <179477645553.3136.3930514306381646741@kernel.org>
In-Reply-To: <20261111211731.3193796-7-github@szelinsky.de>
References: <20261111211731.3193796-7-github@szelinsky.de>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] pse_pi_update_pw_budget() now gates the budget update on
  (pse_pw_d_is_sw_pw_control && admin_state_enabled && isr_pd_detected),…
- [Medium] pse_ethtool_set_pw_limit() still runs three separate
  pcdev->lock critical sections: the state check plus budget update in…
- [Low] The commit message says the race being fixed only leaves "budget
  is reserved for a port that is no longer powered".

--

net: pse-pd: check the PI state under the lock when setting a power limit

This patch moves the software power control, admin enabled and PD
detected check out of pse_ethtool_set_pw_limit() and into
pse_pi_update_pw_budget(), so it now runs under pcdev->lock. It also adds
an updated flag, so the rollback after a failed
regulator_set_current_limit() only runs when the budget actually changed.

> pse_ethtool_set_pw_limit() checks whether the PI is powered without
> pcdev->lock. pse_isr() changes that state under the lock, so if the PD
> disconnects in between, budget is reserved for a port that is no longer
> powered.

[Severity: Low]
Does this description understate what the old race did? It looks like
the budget was leaked permanently, not just reserved for a while.

With the old code the sequence would be:

pse_ethtool_set_pw_limit()
  unlocked check sees admin_state_enabled && isr_pd_detected

pse_isr()
  pse_set_config_isr()  (DISCONNECTION)
    _pse_pi_disable()
      pse_pi_deallocate_pw_budget()
        pi->pw_allocated_mW = 0;

pse_ethtool_set_pw_limit()
  pse_pi_update_pw_budget()
    regulator_request_power_budget(pi->pw_d->supply, pw_limit)
    pi->pw_allocated_mW = pw_limit;

Then on the next CLASSIFICATION:

_pse_pi_delivery_power_sw_pw_ctrl()
  pse_pi_allocate_pw_budget()
    pse_pi_allocate_pw_budget_static_prio()
      regulator_request_power_budget(pi->pw_d->supply, pw_req)
      pi->pw_allocated_mW = pw_req;

The earlier pw_limit reservation gets overwritten without being freed. It
is never returned to the power domain until the controller is rebound.
Until then, other ports in the domain can be refused power, or
lower-priority ports can be shut down.

Could the commit message mention this permanent budget leak, so stable
backporters can judge how important the fix is? The code change and the
Fixes: tag look right.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 44bc6d5579655..7fffe7e16f75e 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -1815,22 +1815,35 @@ EXPORT_SYMBOL_GPL(pse_ethtool_set_config);

[ ... ]

>  static int pse_pi_update_pw_budget(struct pse_controller_dev *pcdev, int id,
> -				   const unsigned int pw_req,
> +				   const unsigned int pw_req, bool *updated,
>  				   struct netlink_ext_ack *extack)
>  {

[ ... ]

>  	mutex_lock(&pcdev->lock);
> +	/* Only a PI under software power control that is enabled and has a
> +	 * PD detected gets a budget. Check this here, as pse_isr() changes
> +	 * it under the same lock.
> +	 */
> +	if (!pse_pw_d_is_sw_pw_control(pcdev, pi->pw_d) ||
> +	    !pi->admin_state_enabled || !pi->isr_pd_detected)
> +		goto out;
> +
>  	previous_pw_allocated = pi->pw_allocated_mW;
>  	pw_diff = pw_req - previous_pw_allocated;
>  	if (!pw_diff) {

[Severity: Medium]
Is admin_state_enabled && isr_pd_detected enough to show that the port is
actually powered? Both are software flags. The core already treats
"enabled, PD detected, hardware off" as a valid state in
pse_pi_is_admin_enable_pending():

	if (!pcdev->pi[id].admin_state_enabled ||
	    !pcdev->pi[id].isr_pd_detected)
		return false;

	ret = pse_pi_is_hw_enabled(pcdev, id);
	/* PSE PI is already enabled at hardware level */
	if (ret == 1)
		return false;

	return true;

A PI can end up in that state in two ways. First, when there isn't enough
budget, pse_pi_allocate_pw_budget_static_prio() returns -ERANGE before
ops->pi_enable() is called. Both callers then treat that as success and
leave the flags set:

pse_set_config_isr()
	if (ret == -ERANGE)
		ret = 0;

pse_pi_enable()
	if (!ret || ret == -ERANGE) {
		pcdev->pi[id].admin_state_enabled = 1;

Second, a higher-priority port can force it off through
pse_disable_pi_pol()->_pse_pi_disable(). That calls ops->pi_disable() and
frees the budget, but leaves admin_state_enabled and isr_pd_detected set.

For such a PI, pw_allocated_mW is 0, so pw_diff equals pw_limit.
regulator_request_power_budget() then reserves pw_limit for a port that is
off. Isn't that the same "budget is reserved for a port that is no longer
powered" case the commit message describes?

Later, pse_pw_d_retry_power_delivery() sees the PI as admin enable
pending and calls _pse_pi_delivery_power_sw_pw_ctrl()->
pse_pi_allocate_pw_budget_static_prio(). That function requests pw_req
again and does:

	pi->pw_allocated_mW = pw_req;

so the reservation made here is overwritten and never freed. Could the
check also look at the hardware state under the lock, for example
pse_pi_is_hw_enabled() == 1?

The comment kept in pse_ethtool_set_pw_limit() also still says the budget
is updated only "if a Power Device is powered", and this check doesn't
guarantee that.

[ ... ]

> @@ -1894,21 +1909,17 @@ int pse_ethtool_set_pw_limit(struct pse_control *psec,
>  	/* Update power budget only in software power control case and
>  	 * if a Power Device is powered.
>  	 */
> -	if (pse_pw_d_is_sw_pw_control(psec->pcdev,
> -				      psec->pcdev->pi[psec->id].pw_d) &&
> -	    psec->pcdev->pi[psec->id].admin_state_enabled &&
> -	    psec->pcdev->pi[psec->id].isr_pd_detected) {
> -		ret = pse_pi_update_pw_budget(psec->pcdev, psec->id,
> -					      pw_limit, extack);
> -		if (ret < 0)
> -			return ret;
> -		previous_pw_allocated = ret;
> -	}
> +	ret = pse_pi_update_pw_budget(psec->pcdev, psec->id, pw_limit,
> +				      &updated, extack);
> +	if (ret < 0)
> +		return ret;
> +	previous_pw_allocated = ret;
>  
>  	ret = regulator_set_current_limit(psec->ps, 0, uA);
> -	if (ret < 0 && previous_pw_allocated) {
> +	if (ret < 0 && updated) {
>  		pse_pi_update_pw_budget(psec->pcdev, psec->id,
> -					previous_pw_allocated, extack);
> +					previous_pw_allocated, &updated,
> +					extack);
>  	}

[Severity: Medium]
Does this still leave part of the race with pse_isr() open? The budget
check and update, the hardware write and the rollback each take
pcdev->lock separately:

pse_ethtool_set_pw_limit()
  pse_pi_update_pw_budget()        lock, unlock
  regulator_set_current_limit()
    pse_pi_set_current_limit()     lock
      ops->pi_set_pw_limit()
                                   unlock
  pse_pi_update_pw_budget()        lock, unlock (rollback)

Take the connect case first. pse_pi_update_pw_budget() sees
isr_pd_detected == false, leaves updated as false and unlocks. pse_isr()
then handles CLASSIFICATION. _pse_pi_delivery_power_sw_pw_ctrl() sizes the
allocation using the old hardware limit and enables the port:

	if (ops->pi_get_pw_limit) {
		ret = ops->pi_get_pw_limit(pcdev, id);
		if (ret < 0)
			return ret;

		if (ret < pw_req)
			pw_req = ret;
	}

ops->pi_set_pw_limit() then raises the hardware limit. The port can now
draw up to the new limit, while pw_allocated_mW still holds the smaller
old value. Can that over-commit the power domain budget?

Now the rollback case. The budget is raised from P to N, and then
regulator_set_current_limit() fails. Before the rollback runs, pse_isr()
could handle a DISCONNECTION (budget freed, pw_allocated_mW = 0) and then
a CLASSIFICATION for a new PD that gets X. The rollback's check passes
and sets the budget back to the stale P, which doesn't match the new PD.

pse_pi_set_current_limit() takes the same mutex, so the lock can't simply
be held across regulator_set_current_limit(). Would it work to do the
budget update, ops->pi_set_pw_limit() and the rollback in one critical
section through an internal unlocked helper?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111211731.3193796-1-github%40szelinsky.de
