Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597161;
	b=GCIzg1Je9gXKTAotevY9i6LJY3RzS6V9JCPhmA9V8uILDsNqo5mke1us3SVZiPvI3Fgt
	 iW1qUvvXJn60wLJ4Co3CsWp81+Npz7isjS6Y/AEcyfyoIMHA6E8VAZe1cesx3wp3DsrKl
	 gPh6qbJ0gWalJMtu8QkUObWKuwQjBvgjahGCULkwABYMZjLoxgG12BqaZDjQK7scnXPNo
	 BBlB0aLn7u53O12zMTMxSExCKEDGHUK5pQa7uWOD1o14Guop40LVqodmRQhWSX9PXal4X
	 wpco8tNeIWCpTHpZNuriGg9XsgspXMn5EnB2bB3TKJ/PnIl7FC6eI8qBd0TGs2TXtvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597161;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hLZtGA46uUnhosvnrSpHGWny2vwTfNqO81vS+IzHZrg=;
	b=q9++LMF0udxmJl0QU2cJBFXwNiUvjbrTNGh8JCmGYv4MBiCCTjS9JdqHMS5S2+S4oy5U
	 SYZ6ADYqyy27rde/SVkDdLTJSLZa6l8cfPUgYPgXllyX6ZTqxWDR0opb3gnoHY6QuRGPj
	 OxyX5j7jVXNlb52OOcKUOgu+nZKL/6ez1jEZAaCY0hzjdS1oOv/2HXxLtq17tkUpo/y2d
	 /WO2LjdT56f9/SErhkTBs7yjes7zeCRIrtCvaKXYFbnXH/x94XqzooDP6UkQB+weiS9mU
	 FFvLubxi0+5tgrM3URQSXZEelSs3DFpKbWBc5/gQ87DtyUmZq37WSt+wZpnyhUk1nkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7NxPW5R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3C606A334;
	Fri, 13 Nov 2026 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7NxPW5R
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794597161;
	b=t59zogXt8EYW/vo/pYhyEgQXGJa4YE9NiuEo8mF3XDrgkcTTtvkpVT0LcEKjMtg6S35C
	 y0ym7mD8D694abINXtERcnIAtMZpW/0szW0hOzxAEGG7JF0DFHzbblVt3et3n1uZTBI3R
	 ly3K4cxOUCpo3DeB2psNY26/c3jUq2Z60dzWg86kaoy1WE5zPYCdEAp6GBp7B1JHVtrpL
	 3/hSTwRFaAlwZr4ZXO744h3f2H/b0q1alBmus8XJTAUbNCV8SNMA1HC6ENjFWb7aup3JX
	 yJOzwv91vVB8Ug3gbgH6/7iGuDyzZpLrRJI5c2bomUmj3uV4/dkt+wgQOhAfoA4Q3Pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794597161;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hLZtGA46uUnhosvnrSpHGWny2vwTfNqO81vS+IzHZrg=;
	b=xUaa3sTVJzkyL97+qOd2qZ0+WTgu39I18asIyeeD1Pdf9CjBIJN55MCFDE0q4hyE0EcI
	 BCwehLBB+DFC6+vMs5xeY1KAs1TUu5cecTsgx333a6sYC764aoZrn5PIVZKqy/GzHrqSa
	 eTn1bxarB6vS2zgl8vBrlgQmp+aRX16JdFrpT8pCkXGY2hMaS/DoWV7Jo0uL/U24CQU0y
	 +LOSDp3l+xLXZtkZ8wgzpNwryTE4Zw0+LuabsLojA1jxLuiZM9KK+uyl6OGwCNH7HQ2ss
	 tZXzU6rvRCtfW/bQRj6fTkK+rzEpYKfPbDwfbzbFEr8WR10A0eGPoKZCv3GePDNHQ/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF7A21F000C4;
	Fri, 13 Nov 2026 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597161;
	bh=hLZtGA46uUnhosvnrSpHGWny2vwTfNqO81vS+IzHZrg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=W7NxPW5RybjlOtaDm9qMqP9JGvSVC3YQdPg3G+1FX7tUlghT/SVIaX3MbMAanxNyf
	 2JZNyLNz3e47IZnX8O4bMzr0Ssl1xrJkprEG0y58Lvu9UKxAk6FzoHDzjV+Ekmmer3
	 XTMeCwSFKEcy3he/vTdV3B/z198PCUwbmDUEnSIES1g/IhWRNnATpMxozTTPD/gfgg
	 H0ag6G4aiiySQ/2wj6741UX7UpLw62dZ6tybJQmfVvh7ke+s29PY/uG/TOe57MrRlX
	 uhybmAAbrRrP767gUqV7BUGt5QM+qk1dPBTskYHmx7hOC5IlV0sMcm/h/ONfrxw21V
	 89YTmfC90mUCA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 71F8549A75;
	Fri, 13 Nov 2026 19:12:40 +0000 (UTC)
From: Patrick Fischer via B4 Relay <devnull+admin.tsv-stahl-riesa.de@kernel.org>
Date: Fri, 13 Nov 2026 20:12:29 +0100
Subject: [PATCH wireless-next] wifi: wlcore: Don't report RSSI events on
 the P2P device
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-upstream-wlcore-p2p-rssi-v1-1-754bd625daca@tsv-stahl-riesa.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q6CMBAEf4Xcs5dATdD6K8aHCquewdLcFSEh/
 LtV922ymVnJoAKjU7WS4i0mYyzQ7CrqHiHewdIXJle7tinjKVlWhBfPQzcqOLnEaiZ8DN6jdf5
 Q73sqelLcZPmlzzSLYoAZRyyZLv/bpusTXf7mads+Avpj6IsAAAA=
X-Change-ID: 20261111-upstream-wlcore-p2p-rssi-8a99e629703d
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 Patrick Fischer <admin@tsv-stahl-riesa.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794597159; l=3844;
 i=admin@tsv-stahl-riesa.de; s=20261020; h=from:subject:message-id;
 bh=HaLsB5FeE4e7mOdZ4s/ZKiZhR7ChbgmoXjUw6qN7ook=;
 b=2cHA0+InI1KT1A9ZFgrZG//bS45GCpNqhMjtHwb7EdWajV3IMaDEr63gN40QPqpd0ChS99Mq5
 lnMEF7NPN6+CbNrB2wihngbtumu4oHIEhEDZKbj+XdkT4rtVfTPEWBv
X-Developer-Key: i=admin@tsv-stahl-riesa.de; a=ed25519;
 pk=D+v6EloYcEY9PIUHFyTM5sqcGIU/fIXzLUdkR8vjAtk=
X-Endpoint-Received: by B4 Relay for admin@tsv-stahl-riesa.de/20261020 with
 auth_id=1251
X-Original-From: Patrick Fischer <admin@tsv-stahl-riesa.de>
Reply-To: admin@tsv-stahl-riesa.de
Content-Transfer-Encoding: 7bit

From: Patrick Fischer <admin@tsv-stahl-riesa.de>

A P2P device vif has no netdev, but wl12xx_init_vif_data() makes it
BSS_TYPE_STA_BSS, so wl12xx_for_each_wlvif_sta() in
wlcore_event_rssi_trigger() visits it as well. Its rssi_thold and
last_rssi_event stay 0, and 0 is NL80211_CQM_RSSI_THRESHOLD_EVENT_LOW.
A metric above 0 therefore looks like a change to HIGH, and
ieee80211_cqm_rssi_notify() ends in cfg80211_cqm_rssi_notify(), which
dereferences the NULL sdata->dev:

  Internal error: Oops: 5 [#1] SMP ARM
  PC is at cfg80211_cqm_rssi_notify+0x18/0x108
  LR is at wlcore_event_rssi_trigger+0x84/0xa0 [wlcore]
  Call trace:
   cfg80211_cqm_rssi_notify from wlcore_event_rssi_trigger
   wlcore_event_rssi_trigger from wl18xx_process_mailbox_events
   wl18xx_process_mailbox_events from wl1271_event_handle
   wl1271_event_handle from wlcore_irq_locked
   wlcore_irq_locked from wlcore_irq
   wlcore_irq from irq_thread_fn

The oops kills the IRQ thread with wl->mutex held, so the driver does
not recover: everything that takes the mutex hangs, and the interrupt
is disabled as unhandled.

A real RSSI trigger reports a negative value in dBm and does not take
this path. Here, on a WL1801 (Tegra Note 7) with wpa_supplicant running,
the metric was +54 because the event mailbox held firmware statistics
instead of event data: reading the firmware statistics through debugfs
once a second during an iperf3 upload overwrote the mailbox. That is a
separate problem, but any bogus metric above 0 crashes the same way.

Skip P2P device vifs. Connection quality monitoring does not apply to
them, and wlcore_event_beacon_loss() also leaves them out, by their
invalid role_id.

Fixes: 7845af35e0de ("wlcore: add p2p device support")
Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
---
Tested on a Tegra Note 7 (WL1801, firmware 8.9.0.0.83,
wpa_supplicant with its P2P device) with v7.3 plus this patch; the
patched files are the same in v7.3 and wireless-next. Load was a 600 s
iperf3 upload at about 47 Mbit/s while the debugfs firmware statistics
were read once a second:

- without the patch: oops as above after about 285 s of upload,
  WLAN dead until reboot;
- with the patch: 86 RSSI trigger events with bogus positive metrics,
  no oops, upload ran to the end with 0 failed frames.

Without the statistics reads the same upload produced no RSSI trigger
event at all. I will send the fix for the overwritten event mailbox
separately, once I have checked it on the device.

I did not add Cc: stable, as I only know of the debugfs statistics as a
way to get a positive metric here.

Tool use (see Documentation/process/generated-content.rst): this patch,
its changelog and this note were prepared with an LLM coding assistant
(Claude Code). It found the cause from the oops registers and the
driver source and wrote the change and the texts from my logs and
instructions. I reviewed the change and ran the tests on the device.
---
 drivers/net/wireless/ti/wlcore/event.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ti/wlcore/event.c b/drivers/net/wireless/ti/wlcore/event.c
index 6c3a8ea9613e..eb5db3c5ec27 100644
--- a/drivers/net/wireless/ti/wlcore/event.c
+++ b/drivers/net/wireless/ti/wlcore/event.c
@@ -117,6 +117,10 @@ void wlcore_event_rssi_trigger(struct wl1271 *wl, s8 *metric_arr)
 
 	/* TODO: check actual multi-role support */
 	wl12xx_for_each_wlvif_sta(wl, wlvif) {
+		/* A P2P device has no netdev to report the event on */
+		if (wlcore_is_p2p_mgmt(wlvif))
+			continue;
+
 		if (metric <= wlvif->rssi_thold)
 			event = NL80211_CQM_RSSI_THRESHOLD_EVENT_LOW;
 		else

---
base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
change-id: 20261111-upstream-wlcore-p2p-rssi-8a99e629703d

Best regards,
--  
Patrick Fischer <admin@tsv-stahl-riesa.de>


