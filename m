Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208426;
	b=lNqHNgfe017yf8wc53C9C0h3uyVoo5sXFAp5JYineEFO8RHomkqznBgt+B4yH18JisG3
	 HjJeA41ugpv1dzxxAckYTa9L0ekOEh3jlW6YUTQK2hYCWwNowyGSmTMJEtBcIN+/BT1Gf
	 iA6UeA3fVTMT6RgPH1XkMHww7y8W/4K1q8Ph8YQDYDDiQ9Q9aL9s8hGx8JdfMvTSP3AbV
	 1aPLwTrYQQDF+xDDrQLqOATaj80XYLW3cDPu/gi1ciIqS6fkR0D1WldGPX7C7d0dQPqmn
	 Vp5zFH+r3MxswY/9TAh8VVxxcBN7W15F2RUNzw6ymjJQpSANIceYJug3hCwV3tsFLLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208426;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/LUR4ul85ZfMug8P/Pa9yYRn+q6lloGkvYAGuprMPmc=;
	b=jXL9SeR6ZE6Shv8VHf13FGjXIaWSPjdzN7rw6V40nKk3L2q1bLfHV7hv4svN+ClOl7/M
	 aoskhPKpv+/cliNvSoPe9vmgHqTe8hQ9it1mrNn0VIrH2zS0LMP6pGZN2+D34kQ5VGcAX
	 x+XOu6Xq57Skai26McmUgzwEzYbLLNbtG56dlPK0CiDlZ3vT8xWNLFt817eN0lGwZP8Hp
	 1jFO6O02061V6DLe11zaBM9qr85IklfRop2r+5VqIzy5RE181I8p8ST5mp7U3yAjP4HuL
	 b3JRI/NbvHZYXE5CssujGgAfJZhDGrGQVe8tD0r+MN4Q/v2tjWd00eR6kVi7hF+9AHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vy0p4Tnl;
	arc=none smtp.remote-ip=91.218.175.47
Received: from mta0.migadu.com (out-47.mta0.migadu.com [91.218.175.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA9606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EA9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vy0p4Tnl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UkW7kNSIS5yCNx6c/X6046kQz9p3i4/hywXzDevaqLI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794208423; v=1; x=1794813223;
 b=Vy0p4TnlA24GJ1ZdcqmZv9U090qdaXwu5e1wKLgcXnJzYlTPa2yRfTxuHalffdr0ibRFaQck
 62Xi48QtwWqLNu44N6jiCPof6zeCKaz8GI4PReGT670rZo95CC30sduGN2LaWZ8rAr5OJwHOJsZ
 4mesDcn8UVabkqSOS4PpZdbE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 79bb73de99acef03;
	Mon, 09 Nov 2026 07:13:42 +0000
X-Mizu-Trace-ID: 79bb73de99acef03
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 08:13:38 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_ps=3A_trigger_firmware_re?=
 =?US-ASCII?Q?covery_only_after_consecutive_LPS_leave_failures_on_PCI?=
In-Reply-To: <20261108142708.489067-4-skalpesh942@gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com> <20261108142708.489067-4-skalpesh942@gmail.com>
Message-ID: <84AB3D74-F70D-452F-B621-B5487951B719@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Kalpesh,

Thanks for the new version. Two comments below.

On November 8, 2026 3:27:07 PM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:
                                                                            > diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index a74f199a93ab..7009f8ae3e57 100644                                   > --- a/drivers/net/wireless/realtek/rtw88/main.c                           > +++ b/drivers/net/wireless/realtek/rtw88/main.c                           > @@ -638,6 +638,9 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
>
>  void rtw_fw_recovery(struct rtw_dev *rtwdev)
>  {
> +     if (rtw_hci_type(rtwdev) != RTW_HCI_TYPE_PCIE)
> +             return;
> +

The same check is also in rtw_fw_leave_lps_check() below, and the other
callers of rtw_fw_recovery() are PCI only, so I think this one can go.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
> index add5a20b8432..fa3a4e476cf6 100644
> --- a/drivers/net/wireless/realtek/rtw88/ps.c
> +++ b/drivers/net/wireless/realtek/rtw88/ps.c
> @@ -166,6 +166,13 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
>               rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
>               rtw_warn(rtwdev, "firmware failed to leave lps state\n");
>               rtw_fw_dump_dbg_info(rtwdev);
> +
> +             rtwdev->ps_hang_cnt++;
> +             if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE &&
> +                 rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT)
> +                     rtw_fw_recovery(rtwdev);
> +     } else {
> +             rtwdev->ps_hang_cnt = 0;
>       }

As far as I can see this can't reach the limit on stuck firmware without
FW_FEATURE_LPS_C2H, which seems to include rtw8822b and rtw8723d. The
register check passes once the bit is clear, the failure path above
clears it, and I can only see the firmware setting it again when it
enters LPS.

So if I read it right, stuck firmware gives one failure, then the next
check passes and resets the counter, as long as the registers still read
fine. Three in a row would need firmware that is still running.

Would it make sense to only count failures when FW_FEATURE_LPS_C2H is set?
Ping-Ke, do you know if only the firmware sets this bit?


Best regards,
Luka Gejak
