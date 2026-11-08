Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138266;
	b=Pk9ZYFpsN+JlNV6eEwySkrspMo6j2Zbaqx/CwMKrh6EW4m4NQ/tlM6CmMj1F8xVTrv8L
	 opnSMNotex1yL698yIu1NovILMvpnK6wwGgMSNXYWAj0jD9CqLWKIcdoSa1bInFxb+Esl
	 NE+TNvzGV75/cvU53X1J7a0ivX30MQ/KDQa8X5/UuXJpm/BUK+kIJu5OA/Fp0wWtl9Usj
	 60rQrxMoYm2o9rCopo8RJAFXGTKpkzxNa5n/2QC/YaBuM06jVppgW1FWopFDpoHudPYM1
	 rWAxqs/LqOi0/wR4keJjZSKG/bdD2KrRLwaavjs5n3BxAdzz61rLW6VM1Fx1/hta0XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138266;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=3q/lah2BivF8l6bCIIx5ik0n39T6McQx2xUSAGLT6ik=;
	b=gkPineTR8ZtTKYGnW5Pnbdid6TC0KT9kgCY50DdFT/+chstMKPzyJfW4w77CxT4Wtib7
	 78AcsGV1szDQ4TkSRYtAz+sQWpv5gp8+jV+fVzIPQl+my7fzrONF0WesYnUIt1CzwxZQv
	 u/0yMKhM0SRL5WCQSuHgrrv4tt3IxJ4C8pxB6yoxx15g3fiH+BN/xrHrn/NgXMoCzztIV
	 K3UAkrsPKx6FSkxYJZqUb6D9AIDNhUxCw22NeOlkS9mMObgm3lF8o712Yg2NaOLMWHWxV
	 o/wI/hbYqBDW106yIiBCKk93Y7gCLtP6z1ocuLzaekX5e5UoIjJA2JLohW3z7W/RlKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lgqb8ZXx;
	arc=none smtp.remote-ip=95.215.58.156
Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6FD606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lgqb8ZXx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NfxEQyvo6YzvwIKDIqYTEEs+dBfaE7g8zWPgpNgj6VE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794138263; v=1; x=1794743063;
 b=lgqb8ZXx/vWcpQrPjMMCkz11FrUgmviA9aFeX5K1ANatpUqhjv48SdumDgQdqgk1i7iM58lt
 TN9xRur7ub72APowfK+7Jl90UEhW5YqXmy2XH/WlhQMkBVxx0X4sPqBL+4n4/KuAWw7KQXTgG8/
 xfy2EuwdTX/BUOuQwzFnvTYQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 47e901772c1c05d8;
	Sun, 08 Nov 2026 11:44:22 +0000
X-Mizu-Trace-ID: 47e901772c1c05d8
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
Date: Sun, 08 Nov 2026 11:44:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <da84e88e367522c239340aff5c3011d7c0642f9a@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v3 2/2] wifi: rtw88: ps: trigger firmware recovery only
 after consecutive LPS leave failures
To: "Kalpesh Solanki" <skalpesh942@gmail.com>, pkshih@realtek.com
Cc: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Kalpesh Solanki" <skalpesh942@gmail.com>
In-Reply-To: <20261108085126.331784-3-skalpesh942@gmail.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
 <20261108085126.331784-3-skalpesh942@gmail.com>

Hi Kalpesh,

I also have a couple of comments for this patch.

November 8, 2026 at 9:51 AM, "Kalpesh Solanki" <skalpesh942@gmail.com> wr=
ote:

> diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wire=
less/realtek/rtw88/ps.c
> index add5a20b8432..864e2be243ea 100644
> --- a/drivers/net/wireless/realtek/rtw88/ps.c
> +++ b/drivers/net/wireless/realtek/rtw88/ps.c
> @@ -165,7 +165,14 @@ static void rtw_fw_leave_lps_check(struct rtw_dev =
*rtwdev)
>       if (ret) {
>               rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
>               rtw_warn(rtwdev, "firmware failed to leave lps state\n");
> -             rtw_fw_dump_dbg_info(rtwdev);

rtw_fw_dump_dbg_info() returns right away unless RTW_DBG_FW is set, so I
don't think it can flood the log in normal use, and the rtw_warn() above
still prints on every failure. With that debug mask on, the dump from
the first failure seems useful too. Could it stay where it was?

> +
> +             rtwdev->ps_hang_cnt++;
> +             if (rtwdev->ps_hang_cnt >=3D RTW_PS_HANG_MAX_CNT) {
> +                     rtw_fw_dump_dbg_info(rtwdev);
> +                     rtw_fw_recovery(rtwdev);

This still reaches USB and SDIO, and as far as I can see
__fw_recovery_work() can't run there yet. It clears the keys from an
atomic iterator:

        __fw_recovery_work()
          rtw_iterate_keys_atomic()
            ieee80211_iter_keys_atomic()    /* holds local->key_lock */
              rtw_reset_key_iter()
                rtw_sec_clear_cam()
                  rtw_write32()

On USB that write ends in usb_control_msg() and on SDIO it needs
sdio_claim_host(), so I think both sleep with the spinlock held.
78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
moved other iterators away from this for USB, but until now nothing
outside PCI could get to the recovery code.

Would it be ok to only call rtw_fw_recovery() on PCI for now, with a
rtw_hci_type() check? USB and SDIO never had this recovery anyway.

This can also run during a disconnect. ieee80211_set_disassoc() leaves
LPS before it removes the AP station, so if that is the third failure,
the recovery work can remove the station first and rtw_ops_sta_remove()
then removes it again. If I read it right, sta_cnt underflows and
si->mask is freed twice if a bitrate mask was set. Maybe
rtw_sta_remove() could skip a station that was already reset?

Best regards,
Luka Gejak
