Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792826190;
	b=kG18wrIqmIjG+0FKXI16F6xtDgW0fyPVIUibDKDDV/3OEeYLXDqXYDXlNg0GqyxSm+i5
	 hY1zmrtKjQRvHBeh2MC5dQV5AI1glm4E/TMSft2+BkX8Z+nKyu77uW6wq4F5A7DFXJvJB
	 8QvrSly5LasHF4JbDvCVMZP3W1PSocRs9OsZRbccMmTXFuEbSdWMBAoOFjT95UB15vlnH
	 fH+ClMRVEJyzp5v6slyGt7YetzSXGZ0I0FuB5yxRF3wTLEdmc18nO5cp/4os5VQkRGxb3
	 2xFpm4ZhTqsIgtV9t1I7SWbus2tgCUKTMUH1HHMaqQKfdcj1AmlxZE5j2z3fuMp4q0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792826190;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=RMZPxDYP3Ysk1YBTg7uZyxVhQhPtS13iaSAO3aLy8m4=;
	b=OPilpYkiaRXUBt0IJKYTlXLD3PnhwoojT2Tp45Eix/eCjtwb2da5ioAbykTo6WGZduKU
	 AWTjInRwutiCt5UduK1npfGM3gtm3B7jixDc3/w+MnlDPLiC3rO6S4iaqu3FCkG123RWL
	 f2gTId+STAJVz9K0k+hoyB/2P9Exql9OrCc35QYU1tYINJxdwjLetR4q/6S2Z1qKMhSOE
	 ND2kxzRNLdkZX/zcCUbgT+ztBggQ3lW6NeUvSh5U+odcFPawl8JKiISYdRH9PCsH29MRB
	 9NZPV9/Kh27ojvTek5N2CjxMT4ixk1fv1f/caWsSQ2xKJLPlnykoQK58flSiU8KKBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fPwO4C5M;
	arc=none smtp.remote-ip=95.215.58.16
Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BFE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fPwO4C5M
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RMZPxDYP3Ysk1YBTg7uZyxVhQhPtS13iaSAO3aLy8m4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792826187; v=1; x=1793430987;
 b=fPwO4C5MM+XXuqgpv9jIlw7dcnmHb7zaiJtLQ+i/IgpzSKDCHGXDjlbAMZHOJARGNH8l61uR
 jEoqRgb4yws/l7nvctI4MuwryNa75aSsRthmIdDz7cqF+wQ05hlOIe8vejFUxJ8nMsoiHSMMy/3
 dYYC99Z3EW0vF/sBPDxF2jUo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49f86fe828731dd2;
	Sat, 24 Oct 2026 07:16:27 +0000
X-Mizu-Trace-ID: 49f86fe828731dd2
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 07:16:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <aa1fe1edaad7440ef095524349adc8286ff4d839@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v5] wifi: rtw88: pci: wake the TX queues after
 restart_hw and interface up
To: "Abdurrahman Karadag" <abdurrahmankaradag19@gmail.com>,
 linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com, linux-kernel@vger.kernel.org, rtl8821cerfe2@gmail.com
In-Reply-To: <20261023104154.2755289-1-abdurrahmankaradag19@gmail.com>
References: <20261023104154.2755289-1-abdurrahmankaradag19@gmail.com>

October 23, 2026 at 12:41 PM, "Abdurrahman Karadag" <abdurrahmankaradag19=
@gmail.com> wrote:


>=20
>=20When a TX ring fills, rtw_pci_tx_write() stops the mac80211 queue and
> records it in ring->queue_stopped. The completion loop in
> rtw_pci_tx_isr() is what clears them, and it needs a descriptor to
> complete. If the device goes down first, rtw_pci_dma_release() rewinds
> the indices and frees what was in flight, so nothing is left that
> could. ieee80211_reconfig() does not help either: it wakes only
> IEEE80211_QUEUE_STOP_REASON_SUSPEND, and an interface down/up does not
> reach it at all. TX then stays dead although the device came back.
>=20
>=20Reset that state where the device starts, which both
> ieee80211_restart_hw() and an interface down/up reach through
> rtw_core_start(). Gate the wake on ring->queue_stopped so that a
> start which stopped nothing leaves the queues alone. The wake cannot be
> narrowed to the queue the ring-full path stopped: the flag sits on the
> ring, and rtw_tx_queue_mapping() puts management frames and multicast o=
n
> rings of their own whatever queue they came from, so a flag there does
> not name a queue. mac80211 also keeps a single non-refcounted DRIVER
> stop per queue, shared with the scan paths in fw.c, so
> ieee80211_wake_queues() releases whatever holds that slot.
>=20
>=20Signed-off-by: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
> ---

Looks good to me.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
