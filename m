Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594696;
	b=jjU2wDjQy7wjzjOqYI9ZXWyzZV/6nDfBc+ZWz2KhKrH3NNJfX1f0oUpLs/oxXHOT8z8u
	 B55P+XIXOmlotcD6TRJkVt1m3KmLuhdWioPZZtz0RS+k/G7Tpm/yOuuzu0tx6W2azAQIO
	 u/38gR+2Q2WehzcBUX/PsEi+qktDFsf3t7Hd7v5eLRVRLihLpCGeXckjDKc89Za/SWRQR
	 RF66fiM3TpDG2psljKWbLyYP3IlgdH/luVopb/ncE0lGiKbsAsQJkFC9XMTjUm9NV93Xg
	 TJP3fOX+yP1D3dlbQLeaA+cEkL182rqJeC1rfyBbA6gXW72hsLYbMflUjBQEsVxDv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hkWxYIZuoyGBV/b4mNoBewDUXIu1CyNuAuzdw5QNZA4=;
	b=DfVJQM4YF1BY8dfzVzhM+twUyqXuQakl+Ey0vHHSWzfZhyTMPf1jfnFKL7Afw/+Ef7J5
	 Hk9zS3yrZiBaIOPsJsM+r7vxVcS8MwbySAwOjNKuM9Jrj6WqY9NbJGzeCxYaf/LmzVJbq
	 DqXi2tEHrWsAYnGlnNWDg9jdHIu4+4Rkl0wu3axvy5s+eGm+bBlYg/v1iILXwR1eqiOJj
	 06TkA7oo2+PedxSSnDyWKk87UvoE/+D+esdYwZ0kN2tjxnziN7fOKMoVd0nS9eBCfZ8nl
	 7+1WlHBBFh7AjmkhpuFTrbFonRJf6E7jSvsq6Cj6Ia/wL2WsTnGY8u5Vbhki1TxpmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fh8FwM8j;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAA606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BAA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fh8FwM8j
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14fd9dafb0dso240127c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594694; x=1793199494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hkWxYIZuoyGBV/b4mNoBewDUXIu1CyNuAuzdw5QNZA4=;
        b=Fh8FwM8jbElmwgtoQS1HHK0QJx9AmKU+OuV9nTsMFY4UTwasrRUUYdKWbBcPjND7KK
         BqwR1tw6OwGjTvhoTzI09KqvxOUn1tlq9LcpJZlg2AmR1mMxXOyVOXubc9J8JCuaxyI0
         U7GBNO+UPuCcFGRP7b5XWj6/A9gH8o8OOftCG6SOWvI53+3XhQiJQXNWyDn/kfC1xkKz
         KpYGhat+M7nbYms7Mb51UXi/Mjn9PbM1Qvi++1q0c1HhNuXsTHSjJSE73U5uS6pjaDuo
         dbU44Tnl602EholdY9Zwr9DxtR6Q92ZqYGMili3wMg1CLH9w1h2p0p2SYU9I2bUR51wV
         f6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594694; x=1793199494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkWxYIZuoyGBV/b4mNoBewDUXIu1CyNuAuzdw5QNZA4=;
        b=TbWoJ3Qc0PqTHbDtoA8VFcoJNl3gm8SiYQw5P/wS4APhMEwzSZfjs9BBn8NxRT6rZV
         QtxHA6+LS4VbRSqTjepUlZlkjqS9qOIXaAA6OYBoAjjLJv44WlViogIFmpqpeoLAky3e
         qPSR9WG25kyEy0esK2jZoUUBZtF8t1FHtmf66w60Qbsw2/oJOdfPQ5t0qYFeXmFq51Cf
         n+O/CTdUKGp+M0JZqoduts2PVnuqqu1IEo8i/c1wHmsjqb5DWjERtPq/AgVWogthEovO
         6mvIPN+qXXa7ZjeQQ1F4DaFPULabxG0O99lAfbCVzjMQNUjCEHMxSufK998SAfo0bGQr
         5U1w==
X-Forwarded-Encrypted: i=1; AKwUvBycNch2sjdc47o40nnSgwkQPBuJKvai0oTebcuTMozZI/zCuPtIXiQ5y26/z38dauf50Cwk8URES/beTwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQZWPB6gZVUy5fJ0tyTobGvLztj3gvRgrfDH9PxHxKFzvR1toN
	Iaj+0gvsQQwwBFKOFJNa2UxL+pA6ozbQ+Z47qqfNfjspfVdpKdBpaPgIhP1hIA==
X-Gm-Gg: AYBFou0HC/A+G+H7sWaD9m7FL9vRB6Sl9Ku48Yp3NlqzVA2AJmUjym++D+/2yW3RaaD
	CmH9WBT27tiC/efhODlqVSwUIoBH0oCKoIqn06lzfvHdloF6pfGMzr2DGbL4wdzzbzNR/akSiAi
	xzmH55ZDtnN/uU6YDyPJhC5xw9BRRLF9T+Nw+el7tYxmvrFGKieHFgE22SzvIXvqbUk+jB7R4v4
	GBkHLurPCMxhwViKc/S2AcXdWJwtU7y03OjIPtgsA7GxpaHP3eiV/6CjLfNx9kSRHizJcMj/GSy
	pOR13QKS33gOQWdpc9OzHjL4hI2VWaKhheUg6khXnKxMEfAoSqp4sQUCRrkmC9WChsc8Rv7Wu02
	VBhcSkMRCYy5068fS33biIsuKvKdCnnWBm2NKwPo+x2YwAVyOSVJ2qniRiRPYwJOawUcdOgqfDG
	fAvbLJQ2w8aQ80Nc203i2a4yIUII1mzvlT1XyKsGPLXXfXfezVCfuIMkvG+SUA5j4VAgwDZ1cd5
	py9dV38gtF7+u+rca8su8B3Doq4aN44NrMBJYxyT7rr2bLmRa9e+HEZyw3ce6ttRkEiY/xhLr+c
	t4BAFfQFhlEdFxyGrf5qnFb7vpOwLTUD+JxN7n9Z0le/XN2qUvmWknXs/K1iGAxRJU1vUqbSmIf
	PiO4Pu37eU293/zozclQ=
X-Received: by 2002:a05:7023:a89:b0:183:3140:3ac1 with SMTP id a92af1059eb24-190a599a2damr3082389c88.24.1792594694400;
        Wed, 21 Oct 2026 07:58:14 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926035sm6213108c88.1.2026.10.21.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:58:13 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Arik Nemtsov <arik@wizery.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: reload TDLS header pointer after skb_linearize()
Date: Thu, 22 Oct 2026 01:58:07 +1100
Message-ID: <20261021145807.3018338-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ieee80211_process_tdls_channel_switch() sets tf = skb->data before it
calls skb_linearize(), and reads tf->action_code afterwards.

ieee80211_rx_h_data() queues TDLS channel switch requests and
responses to the interface after pulling only
offsetof(struct ieee80211_tdls_data, u) bytes, so the skb can still be
non-linear when the interface work handles it. Drivers that build
paged RX skbs do this for every frame that does not fit into the skb
head, e.g. iwlwifi (mvm), which is also the only mac80211 driver
that sets NL80211_FEATURE_TDLS_CHANNEL_SWITCH. If the remaining data
does not fit into the tailroom, skb_linearize() moves the data to a
new head and frees the old one, and the action code is then read from
freed memory. Depending on what that memory holds by then, the frame
is handled as before or ends in the WARN_ON_ONCE() of the default
case.

The frame only has to be a data frame with the TDLS ethertype from an
authorized peer, e.g. relayed by the AP from another station in the
BSS; the read happens before the sender is checked to be a TDLS peer.

Load tf after skb_linearize(), as the request and response handlers
already do.

Found by static analysis tool CodeQL.

Fixes: 8a4d32f30d11 ("mac80211: add TDLS channel-switch Rx flow")
Cc: stable@vger.kernel.org
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=x86_64 and ARCH=arm64 allmodconfig, W=1). Not
    tested on hardware, and there is no reproducer. The frame can come from
    any station of the BSS via the AP; it needs an iwlwifi (mvm) device, the
    only mac80211 driver that sets NL80211_FEATURE_TDLS_CHANNEL_SWITCH.
    
    The CodeQL query behind this report was written with LLM assistance, and
    the fix and changelog were drafted with LLM assistance; I have reviewed
    them.

 net/mac80211/tdls.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index f663d28d9209c..71db07aa301b7 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -2021,7 +2021,7 @@ void
 ieee80211_process_tdls_channel_switch(struct ieee80211_sub_if_data *sdata,
 				      struct sk_buff *skb)
 {
-	struct ieee80211_tdls_data *tf = (void *)skb->data;
+	struct ieee80211_tdls_data *tf;
 	struct wiphy *wiphy = sdata->local->hw.wiphy;
 
 	lockdep_assert_wiphy(wiphy);
@@ -2037,6 +2037,7 @@ ieee80211_process_tdls_channel_switch(struct ieee80211_sub_if_data *sdata,
 	 * The packet/size was already validated by mac80211 Rx path, only look
 	 * at the action type.
 	 */
+	tf = (void *)skb->data;
 	switch (tf->action_code) {
 	case WLAN_TDLS_CHANNEL_SWITCH_REQUEST:
 		ieee80211_process_tdls_channel_switch_req(sdata, skb);

base-commit: 71a77ab76e74131a101f4d2d2afb0dcbf81b4e3c
-- 
2.43.0

