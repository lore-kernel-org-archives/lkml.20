Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911125;
	b=Tob2oWWrva2T3wDbr7i7IVgtX+qfa+NRcV8g+RT8eELXQO/xBecC3/bLHpcLKhXeCRe1
	 tY/1noZurtCI9y6A3ShcmqB4c36LrfnJNYz/NRK3rjzU3CtU/7IXmkWe92dDk0oDWyQCW
	 DHy7is8VdTILJBD0zLUFCNDDbfuk4iIhVcYy6bb2mC8X+BzReEHEP7jUWtBxDyD1Of5Qr
	 wTJbctM6d5MXoL0+zLQLeDB3Hs8upR0Dhj4woEfTTOd4PevtZQ/qQJqkG2vqTXM6HaoZo
	 wwxNo75A9fyg9btwsCu8XfAG/u3tHUbA5mXAzQsTR3nki7KzdNNbBCLQjt2ZhMEoiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911125;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type;
	bh=Um5CS4DWBBrUH6jR7Nw25CFMYmy9leGAKLeb8NaQSdU=;
	b=I3OXvXACEBjISuGw/qmDNkU0A31fv5wvg3ppklto22w5CeBLO6H4n+OllR0rHkm7ovOM
	 1i48xkUPGu77rfhLShDPJu9Z/Czh26Byr1jq5QGRJmaYn2fEuZPaxpfWhzYKbLxQqFAZV
	 TmI7kM+p0aulYgLw0gS0cg9l3ox93sEKdXVaTQNhaa0y1yd4rWwHkdLg4iE++OAZJQi+2
	 fUXMJL0muGxUHVBqgGjELQcwXnkdXXt8VLRrz8myx6pUIrZvzZ84vs468X1/qV0Mr3ilg
	 vcOUSgRfvoGdnZCjH6WR8cjCvtQhj3mIeWLI+CXWf8OFtFh7HQmBmmfpFabRcrl8CNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B043606A31C;
	Tue, 17 Nov 2026 10:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B043606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a
 finished countdown
In-Reply-To: <20261102123430.1136741-1-mehmet.fide@gmail.com>
References: <20261102123430.1136741-1-mehmet.fide@gmail.com>
Date: Tue, 17 Nov 2026 11:25:21 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87fqwzu54e.fsf@toke.dk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mehmet Fide <mehmet.fide@gmail.com> writes:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> ath9k_htc_send_beacon() checks the channel switch countdown only after
> ieee80211_beacon_get(). mac80211 replaces the CSA beacon only after the
> channel change, and ath9k_htc_set_channel() re-enables beaconing before
> that, so an SWBA event can fetch the CSA beacon again on the new channel
> and mac80211 reports "beacon TX faster than countdown".
>
> Skip the beacon while the countdown is complete and finish the switch
> from there, as ath9k does for non-EDMA chips. Finishing from the skip
> also covers a count of 2, where the first fetch can complete the
> countdown before csa_vif is set.
>
> Tested on 6.12 with an AR9271 AP and hostapd chan_switch: the CSA beacon
> was fetched again in 3 of 40 switches with a count of 5 before and in
> none after, and all 60 switches with a count of 2 completed.
>
> Fixes: f0e449627e4a ("ath9k_htc: add support of channel switch")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  drivers/net/wireless/ath/ath9k/htc_drv_beacon.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c b/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
> index 81fa7cbad892..2b5bf07511bb 100644
> --- a/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
> +++ b/drivers/net/wireless/ath/ath9k/htc_drv_beacon.c
> @@ -214,6 +214,13 @@ static void ath9k_htc_send_beacon(struct ath9k_htc_priv *priv,
>  		return;
>  	}
>  
> +	if (vif->bss_conf.csa_active &&
> +	    ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
> +		spin_unlock_bh(&priv->beacon_lock);
> +		ath9k_htc_csa_is_finished(priv);
> +		return;
> +	}
> +

Hmm, there's something odd going on with the locking / vif selection
here. In the snippet above, you're basically replicating the checks
inside ath9k_htc_csa_is_finished(), before then calling
ath9k_htc_csa_is_finished() itself. Which presumably then repeats the
same checks, and does the ieee80211_csa_finish()? Or at least that's
the logic for why this is correct, AFAIU, no?

But ath9k_htc_csa_is_finished() doesn't take the 'vif' from the beacon
slot, it takes the 'priv' pointer that was passed to the function. Which
implies that either:

(1) priv->csa_vif is guaranteed to be the same whenever csa_active is
set, and thus this doesn't matter, or

(2) there's a bug here and things can get mixed up.

Since there's already a call to ath9k_htc_csa_is_finished(priv) at the
end of that same function, I'm assuming it's case (1) that holds. In
which case, I don't see any reason why we can't just do an early return
before taking the lock as:

if (ath9k_htc_csa_is_finished(priv))
   return;

The priv->csa_vif pointer is not protected by the beacon lock anyway[0], so
I don't think this would lead to trouble?

Thoughts?

-Toke

[0] Side note - the priv->csa_vif pointer seems to be quite
inconsistently lock-protected: it's set under priv->mutex in the driver
setup paths, under the mac80211 wiphy lock by the
channel_switch_beacon() callback, and under the wmi lock by
ath9k_htc_csa_is_finished() itself. Not quite sure if there's some other
dependency between these locks that ensures this works, or if that's
just a total coincidence...
