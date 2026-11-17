Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912233;
	b=wcBc28mFuiEiAFySLvDWjU7EHfGyOwE3wcs+xj0/nOSqf/cZQu9R7gsgkTNoX/9HbySM
	 RUenovOawYVPizOvZeJKECHUfTCq6lrksysxJlqm+JQr5kUcFlVwR8BTxgUiB1rtBmq1I
	 r7ITMU0lWkq9d4lmkT+xf7mBX+CQ+cv31M1qelV8vyy45vI2OmjVLbGVen3n4E+UEn7R7
	 E7MwX53CP7P2/OvvNFJGAZ3Lyu24jcOsQbxN2oxCr3F6myOFgrqmhoBxjzW1eTO06qDgp
	 8DQGgZ4lEyQLDszfTNHAkg4PTjBdcBErIT2okDhLqL7a9IoO1x4Uj6Ssp4qStolQH+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912233;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6XRGV0h/xGK5n/LyMLZlDfzXeQN8+1rTXZFdz5xnDYk=;
	b=X3G7A+q2B5ZFF2WaXIXPIQTE9u469R1PUWQQylE5O90CIhVbkfAZ9VdvhOVDJj1Z8ch5
	 JoWMFRYx9/PGiKrnMWUSuK1hL6vjrx6RA05pzez5s0A5wlBYP4/jlo0uaYONgrLz9jkp6
	 56rNSdEVJ2UldpNL2AnFhGVwsxniSXWaGQlMUZequMPOCXE12G5OwsaH3m6vNfztS214w
	 skQLv4AavWKVTONtGnlOivBpPNpPFipILfPoJJDpNAC035BTWHVbt1EKo9ApxVWKbpG+G
	 g91R26U7MGtrHVp8USVPb6QPKdltdcXrj+qDEpNc+0s5TUT28Iqo0+25utWQZwgWrqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pisu.la;
	spf=pass smtp.mailfrom=pisu.la;
	dkim=pass header.d=pisu.la header.i=@pisu.la header.a=rsa-sha256 header.s=protonmail2 header.b="GAaZ/9ew";
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745F1606A31C;
	Tue, 17 Nov 2026 10:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pisu.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pisu.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pisu.la header.i=@pisu.la header.a=rsa-sha256 header.s=protonmail2 header.b=GAaZ/9ew
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pisu.la;
	s=protonmail2; t=1794912230; x=1795171430;
	bh=6XRGV0h/xGK5n/LyMLZlDfzXeQN8+1rTXZFdz5xnDYk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GAaZ/9ewN/z8YcwSRUR9eNgGHBhdUQKydfrw0a50IagPDjTErTNuw7KdSd1pHhkBe
	 me7ikx1eci952A41IwSY51s9x8Gb/MEQ3RGsPZEP2kyWvS58Rxlngf/5Vzk+2sowzQ
	 idpKmFQHK5AZ/gNyxcsIE/sTC359QDg+wEdJGkE3H011M2GBMCnCx+9bzn/svyi2rz
	 CbrsstCWp2FW8bGXsoaesFwSAV/fyEZT/v5KZfxXvlq70q6iWCtj3lAysxtF6BDZw7
	 LJ54Om/kAiukhqmf2ZPMV8vM5RZOq17BQLHCOTl7kXP4bIhD41jWtJqxr6z++RZPM6
	 18QEhsqyuKvEg==
Date: Tue, 17 Nov 2026 10:43:45 +0000
To: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
From: =?utf-8?Q?Miko=C5=82aj_Pisula?= <mikolaj@pisu.la>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Miko=C5=82aj_Pisula?= <mikolaj@pisu.la>, stable@vger.kernel.org
Subject: [PATCH v2] wifi: ath9k_htc: fix use-after-free of tx cleanup timer after failed start
Message-ID: <20261117103918.33701-1-mikolaj@pisu.la>
Feedback-ID: 197744389:user:proton
X-Pm-Message-ID: fc204216182a77a794d8f67d82e5906feb60edf1
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
Content-Transfer-Encoding: quoted-printable

ath9k_htc_start() does not treat a failure of
ath9k_htc_update_cap_target() as fatal: it logs it at debug level and
goes on to clear ATH_OP_INVALID, starts HTC, wakes the queues and arms
priv->tx.cleanup_timer. It then returns the stale error code.

mac80211 takes the failed drv_start() to mean the interface was not
opened and never calls ath9k_htc_stop(), which is the only place the
timer is deleted. The timer re-arms itself, so it is still pending when
the device is unplugged and ath9k_htc_disconnect_device() frees the
ieee80211_hw:

  ODEBUG: free active (active state 0) object: 000000002df157c8 object type=
: timer_list hint: ath9k_htc_tx_cleanup_timer+0x0/0x770 [ath9k_htc]
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x1a4/0x3b0, CPU#2:=
 kworker/2:2/110
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   debug_check_no_obj_freed+0x44c/0x5b0
   __free_frozen_pages+0x724/0xed0
   device_release+0xcf/0x390
   kobject_put+0x19e/0x530
   ath9k_hif_usb_disconnect+0x371/0x540 [ath9k_htc]
   usb_unbind_interface+0x1a0/0x860
   device_release_driver_internal+0x35c/0x560
   bus_remove_device+0x28a/0x540
   device_del+0x371/0x930
   usb_disable_device+0x2ad/0x6a0
   usb_disconnect+0x27f/0x990
   hub_event+0x1bd5/0x3ad0

Without debug objects the timer core later finds the freed timer in its
wheel ("WARNING: kernel/time/timer.c ... !fn" in __run_timers()).

The device is fully started at that point, so return 0. The interface
then goes through the normal stop path, which deletes the timer.

First seen with a TP-Link AR9271 adapter whose interface open failed.
Reproduced on v7.4-rc2 with a USB proxy that withholds the reply to
WMI_TARGET_IC_UPDATE_CMDID and then disconnects the device; with this
change the same sequence produces no report.

Fixes: 1057b7503908 ("ath9k_htc: Unify target capability updating")
Cc: stable@vger.kernel.org
Signed-off-by: Miko=C5=82aj Pisula <mikolaj@pisu.la>
---
Notes:
    v2: Updated the 'Fixes' tag to the one mentioned under the v1
        discussion
    v1: https://lore.kernel.org/linux-wireless/20261116162702.15393-1-mikol=
aj@pisu.la/

 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wi=
reless/ath/ath9k/htc_drv_main.c
index 6578114a4019..773787416694 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -970,7 +970,7 @@ static int ath9k_htc_start(struct ieee80211_hw *hw)
=20
 =09mutex_unlock(&priv->mutex);
=20
-=09return ret;
+=09return 0;
 }
=20
 static void ath9k_htc_stop(struct ieee80211_hw *hw, bool suspend)
--=20
2.56.1


