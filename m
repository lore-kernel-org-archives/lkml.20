Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033125;
	b=kUROI+OVc6O1a8ywPdREqonO4EZz1/AWt6CluAeIzd0VPwfw0yR6NAx5RHeYFrLFvLq3
	 qYHfSSRc76PgM1emlm8zz3SQFtrxPkwO//9ZNl5IiZOUZlWVIyOulJoU4/iizXl6ykp7v
	 Az3O8EoxaBH4WFIwnkXtDe2jWCpXWucfYXImQ1jw4cE5oPVz3y1Nfe2Vek9mxxKTQgezd
	 LAlJjNJoDu2/0GuDhhaIcSBjqfdwtlFia4nB3Dbc44gC2s1Akbj+l9CXY6Tb7WprbvVw/
	 WWYKdo5oLCG/nXcloO1cBRVfBMfq70eRiioNdbwAUBZMTJqT6yidj7dzQdgPtUVj2BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nmDEkhE/cYHjj1rCcenEeQ0aIXc5VQL5imvektRKuI4=;
	b=w3XBbHyNCDxGr4Z8Mv35xdut7rRHH8823/8j231L7apeP2GPSKDk8p+FHfbKnch0pgQc
	 +1XqpxOmN4yMY2BkqZ9Luvjl2NBoP9e/diMyMrhpGMwaUy55ApGgjUt79UBOon7b6i05T
	 ka1Kfij8Sl664/6xMK78okvYWSKa0qtUbint3uD8/hbcTMJEqj0CA+u0YL1LK03l4p0R3
	 sbLaGbLpfM7TznCAfLYHJK/VxMh5xtJd+98tkYsI5dkOOJqloGnPlnmW2Qm/dtCbZ/Y94
	 pI2bFVLuVMu8+gws5+bp0d1zs+tc0PG5f2mebwUaYHaMjjpt3HArUICcu6yo7/ssGVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Qf/F+6WG";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE04606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE04606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qf/F+6WG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1871864eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033124; x=1794637924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmDEkhE/cYHjj1rCcenEeQ0aIXc5VQL5imvektRKuI4=;
        b=Qf/F+6WGs10Xf1vgWbsCNbI3N90FJryYt15f4rm8bVD+Gwk3U6d427UWDlVVa1tVOw
         aNokICV0mFMsKfzeuVuM59SpyYpyH0dWBt++FmYwxBybpO/hICQRrnblpYJtYLy5yIz3
         iVSb1knVi5mhDqUFvYJUZdjJW/AfEFx4lfpTfcnBR3KdY0ZPK9GnsmCQqsOnFlSdbXe2
         qK1a6bwA6J6JTmjFwMSs57lvVrPQvJDBmPXHPSV7fqZmGohIPfPYJ/4GU/g7aRZi2xxc
         Y7ouo/Y+FXuuqBDJJaTVAqtRLCjicidxOKMOXMEu7qvoPfLqh4PYQqgr2Q/gbhkHvCum
         /eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033124; x=1794637924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmDEkhE/cYHjj1rCcenEeQ0aIXc5VQL5imvektRKuI4=;
        b=B08zq9fq+uwfJhkhfLL4fRZhpjzTb07yXn3gN8aage+Cr/hTH1jYIboXzEqc2jhKfN
         7YcKLsEQhKnNmqBunftb5CdNsM9c1kOqVCWqHOWrgjqewWzVaC29FBqTtogqTI6gKVlR
         N5FPURI8trhjmAylxHCrYS+AuUOe42KVlvCdRorT8HbQpa1EAD7M85vRZEeO/uDs54eT
         UVxcidqNBtBwpifyoCk3kHgGqeeta8/RWSCuV+dM6DfJ+P9L4VLOTMfTSxTEuMftAbqd
         FZ/UmLZEJUYEr/QxGBqkgqFlIV0dzLe9ezuNqjp0L6cn34U0lpFuRmcsu36BDp6Jb55h
         rMuw==
X-Forwarded-Encrypted: i=1; AL+hErHdR7jo6XGWxFFLFJUphmCSCXR1ReOSsu9cAg8zHuNXR415WPpXJ219u7WwFrrwrNa6W7uFDUrM5jQTPjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f8lo3qUxOMUPv09+rV0rr0xpeF/zWMEuZ2K6BPJs72XApM9tQ
	F7QGyBU1ygilppU9en1s3WAnAajZCnzwdNmXFgFLJWs4bjNHKBOvEUz9
X-Gm-Gg: AYBFou1LM0os21o2mV2DUNiIrxZMusWAuA6xMgt3jdjuuEAbiohezt5HKp9jXxtVMIh
	CUs2dUdL4ScfIm9e5rqhBq3mXxN2z6j/1/FjScJO+IifpqwLas+UXWvHEh7D4mTVx93j0gACzD5
	cMExXJwh3pH8s04Oa7M3VRmG6NG56tZfbW9X62QecljIvrI5/eh0K2PxY1e7t5h1/9NsMAg+PQn
	16PYmrmB5mh/N8GBIkwpomx6umlEepkWDr2VU4F1N77P5PD7gnP3g8R+HUM1xGKD74bmQBTt1kT
	psCrOrPeYqXb5/eKsZFhyXRgOk6JA977ufzyF6n+aVerghLXXLaI39Kg3wUqVhlMaUtMBfCTUpH
	XK3mZuXzf/BrIlZ/rUTmzhT1El0TEbzkEgYoNQgK/gYdodr4wcOSZSYtm236AcGTD/RZy7m5Eoe
	PgGuw7iHDZRekcMekkGEeq01+wVDNW2SpAzJQ0lBfs2c8WoRcxP+U5GcU2ZyYS+yj9tNZwDTmVJ
	C82ojxNHyVLpmizyzmPETdpKDB74V+VOnC535MDqrLB9s/MSJ6KlnNB+hQSD57X+UMPb1fAjvXj
	iykPkQAF/shsNV8QF1Ysqwy8qySncaMfg4s+cQ==
X-Received: by 2002:a05:7301:18ac:b0:36e:c04b:53ca with SMTP id 5a478bee46e88-36f76c11206mr6774309eec.28.1794033123828;
        Fri, 06 Nov 2026 22:32:03 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa5afffasm14871748eec.25.2026.11.06.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:32:03 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when failing to leave LPS state
Date: Sat,  7 Nov 2026 12:01:41 +0530
Message-ID: <20261107063141.25442-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Luka,

Thanks for taking a look. You make very good points on both issues.

> As far as I can see, this timeout doesn't always mean the firmware is
> stuck. The comment in __rtw_fw_leave_lps_check_reg() says REG_TCR is
> only restored once the AP has acked the null frame, and 3a2dd6b7cadf
> ("rtw88: check firmware leave lps successfully") says that frame can
> take much longer in a noisy environment. That is why the old code just
> cleared the bit and warned.
> 
> So if I read it right, a busy channel or a weak link now ends in the
> WARN() in __fw_recovery_work() and a full ieee80211_restart_hw(). The
> watchdog leaves LPS every two seconds on an idle link, and
> BCN_FILTER_NOTIFY_BEACON_LOSS leaves it right when the AP may be gone.
> This also reaches USB and SDIO now, which had no way to trigger
> rtw_fw_recovery() before.
> 
> rtw89 only recovers after RTW89_PS_HANG_MAX_CNT failures in a row.
> Would you be willing to send a follow up that does the same here?

Yeah, resetting the whole hardware right away on a single timeout is
definitely too aggressive if the frame just got delayed or dropped due
to RF noise or beacon loss. Using a counter like rtw89 does
(RTW89_PS_HANG_MAX_CNT = 3) and only triggering recovery after consecutive
failures makes much more sense to prevent spurious restarts.

I'm happy to write and send a follow-up patch implementing this.

> There also seems to be a path where recovery never completes.
> rtw_leave_lps() also runs from ieee80211_set_disassoc() through
> rtw_recalc_lps(). If the check times out there while the last interface
> goes down, or on a suspend without WoWLAN, the queued work runs before
> drv_stop(). mac80211 then never calls drv_reconfig_complete() with
> IEEE80211_RECONFIG_TYPE_RESTART, so RTW_FLAG_RESTARTING stays set and
> rtw_fw_recovery() does nothing until the driver is reloaded, also for
> real firmware crashes. Maybe rtw_ops_stop() could clear it as well?

Good catch on the mac80211 lifecycle path. If open_count is zero or during
suspend without WoWLAN, drv_reconfig_complete() never gets called, which
leaves RTW_FLAG_RESTARTING stuck and permanently blocks recovery until module
reload.

Clearing RTW_FLAG_RESTARTING (and resetting the hang counter) in
rtw_ops_stop() sounds like the right way to handle it.

I can prepare a 2-patch follow-up series:
1. wifi: rtw88: ps: trigger recovery only after consecutive LPS leave failures
2. wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()

Ping-Ke, does that sound good to you?

Thanks,
Kalpesh
