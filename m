Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118425;
	b=zlrKM9HvuNvepLZIK2MnDHAhXw6qzCKZATfEBes5bdjZ31Gpg077N1+ME9IhrD6szUxw
	 fUcDe65OQLpFc/UKp0/7nBhOFkugxg1gEnDIhn+sSXICqz93mFqBXCWsAgL33b4Ic26Gp
	 B3qKWGRHDfezqrbcF8bFIxBd++hV7IREDgm8GBHLRjUP5LKlQgqetnTBFQ+1Z8wsmcFm+
	 tUwPE//mXaR48laP5VjHtcZPvNcZB2CBrZJr7FsBux06Q91Z+zebepyJ+Wwy3Gf32glQU
	 U8iz3+2AGaCASeIzlRbOvJMPF07VB0Wrmr8ZK1Pv9aumzbWryQ/B9gfgC6cflYv+grg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=OPQ5C9ox5OYC3Jbm97wqjDiE2BuBCI1oIX36fmfA+js=;
	b=u3NuGHpC/78jgIVQ4kAZfAAZf4mJ5Px/HkIviapXBOQcsffdpCCGlzAe/lz92KVbXCJG
	 YbPsFOnz5U+95h8xvfFhZ+OWEzrdCi6FLHEYDOraxUI5Sc7VXOYGd4TfnJgJszhSR1nPN
	 OGPYasWTTOt3FyRcsho+xz496NhchBJYZLSsf2XJ3IhNRI9uGqEeeGIqAfI8RMixWSBh3
	 u7lGZarG+6h6Y/aHtdWe0QXpJ+Hu+y1X8cucP47iwp0bhS5RZroUNkvtSxDmuMsZLNXw4
	 bQGlQIy1ApeTTOuPtbaMZhdYa9lHTs+q+zAT0sklT3NEVyuuQiI9BmmoHSVzGHYOCRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	arc=none smtp.remote-ip=212.77.101.11
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8285F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 18763 invoked from network); 27 Oct 2026 17:26:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1793118409; bh=OPQ5C9ox5OYC3Jbm97wqjDiE2BuBCI1oIX36fmfA+js=;
          h=From:To:Cc:Subject;
          b=DjCTSvW2JrntDI2UY8hFy7i/9e+mMPSImsFADNGFApLWLxtCV0nAbIK98ffUMxoOH
           zKRa/QeqVDip6BqMrWiL9uBOKFaBn/tEEf0qhgjK6OvZSKPoo6jcflSlF3bBLTtNhF
           sjmRMNpAj+kOAVgUBsD4HqWH3lVVQjMGlG9NJ0cvWCDkSbJwoFA7KCn189tzsjI92v
           QqHYmKCmM2SPoW5fDJN3LQBj/8ulM8g5+EeEuFQ2uKS+6ZOYFPA/cLt4rYsGfwj2Wz
           +XNKRlqiaf17gJ8DzAQZhfs6VP5dR2gc4DwdChfBwGmfvN02qxy8Ybr6RJUw+yOKTq
           LLbh3ZbgCSssg==
Received: from localhost (77-236-11-144.static.play.pl [77.236.11.144])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <tristmd@gmail.com>; 27 Oct 2026 17:26:49 +0100
Date: Tue, 27 Oct 2026 17:26:48 +0100
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Tristan Madani <tristmd@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Ivo van Doorn <ivdoorn@gmail.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	Kees Cook <kees@kernel.org>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: Re: [PATCH v2 wireless 2/3] wifi: rt2x00: replace open-coded IE
 search with cfg80211_find_ie()
Message-ID: <20261027162648.GA4623@wp.pl>
References: <20261026223213.2091616-1-tristan@talencesecurity.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026223213.2091616-1-tristan@talencesecurity.com>
X-WP-MailID: 5c6b4989cf0c7d2f1b05553d339c93bd
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [0RJh]                               

On Mon, Oct 26, 2026 at 10:32:13PM +0000, Tristan Madani wrote:
> rt2x00lib_find_ie() open-codes the IE search that cfg80211_find_ie()
> already provides.  Replace the hand-rolled function with
> cfg80211_find_ie() at the single call site.
> 
> Fixes: 1c0bcf89d85cc ("rt2x00: Add autowake support for USB hardware")
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

> ---
>  .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 30 +++++--------------
>  1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
> index 4d94b7062f440..921383a630bf2 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
> @@ -557,26 +557,6 @@ void rt2x00lib_txdone_noinfo(struct queue_entry *entry, u32 status)
>  }
>  EXPORT_SYMBOL_GPL(rt2x00lib_txdone_noinfo);
>  
> -static u8 *rt2x00lib_find_ie(u8 *data, unsigned int len, u8 ie)
> -{
> -	struct ieee80211_mgmt *mgmt = (void *)data;
> -	u8 *pos, *end;
> -
> -	pos = (u8 *)mgmt->u.beacon.variable;
> -	end = data + len;
> -	while (pos < end) {
> -		if (pos + 2 + pos[1] > end)
> -			return NULL;
> -
> -		if (pos[0] == ie)
> -			return pos;
> -
> -		pos += 2 + pos[1];
> -	}
> -
> -	return NULL;
> -}
> -
>  static void rt2x00lib_sleep(struct work_struct *work)
>  {
>  	struct rt2x00_dev *rt2x00dev =
> @@ -642,9 +622,10 @@ static void rt2x00lib_rxdone_check_ps(struct rt2x00_dev *rt2x00dev,
>  				      struct sk_buff *skb,
>  				      struct rxdone_entry_desc *rxdesc)
>  {
> -	struct ieee80211_hdr *hdr = (void *) skb->data;
> +	struct ieee80211_hdr *hdr = (void *)skb->data;
> +	struct ieee80211_mgmt *mgmt = (void *)skb->data;
>  	struct ieee80211_tim_ie *tim_ie;
> -	u8 *tim;
> +	const u8 *tim;
>  	u8 tim_len;
>  	bool cam;
>  
> @@ -666,7 +647,10 @@ static void rt2x00lib_rxdone_check_ps(struct rt2x00_dev *rt2x00dev,
>  
>  	rt2x00dev->last_beacon = jiffies;
>  
> -	tim = rt2x00lib_find_ie(skb->data, skb->len - FCS_LEN, WLAN_EID_TIM);
> +	tim = cfg80211_find_ie(WLAN_EID_TIM, mgmt->u.beacon.variable,
> +			       (skb->len - FCS_LEN) -
> +			       offsetof(struct ieee80211_mgmt,
> +					u.beacon.variable));
>  	if (!tim)
>  		return;
>  
> -- 
> 2.47.3
> 
