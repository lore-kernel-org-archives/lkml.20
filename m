Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206515;
	b=Qad+t7XXOjSPwea+Iawr/lEmNspmbkIKVf4B1L3kCMi13cQCvELA3yA6i9AFalO4msXc
	 8/5mqBK9u0c/UzUWJCQpN7ENZtqVJ1o51mX2xovUd++ho20bj2BnqIOCvtDKPaagn+zpV
	 RSJh+FuQFPD6KYoT657iNqbiPaUWrY4eJ5TRdyp3clBa0xf18C84Xi3P5ua9mwqhYo5tN
	 3UEbD/wPtyKfgWEl/ZMaov+GyA7Qrw1v2SSWbAnM1gt7XdL27brT8voIgwjNyftfSiuUb
	 lsaXTEH3uuPVqAe4ALkl3qfswNjVvvSjoxDzi/uP45sCFoZcBl/aEHe1smcB9Br+gOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206515;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZzG+B6v080Z5FbgsRfwns3KQJ2PJp7hPF1hqKQeiP0I=;
	b=jf/A/2SbhRBHngpGqXVI3/PeRkj/DHIzKshyWP4nBPbIE7gF8q11ASQnorsajZMMCgbG
	 TRwrHEpXQkaSmug5Rn47SgI0cePFASieZLaCExSiXbqZ4GcnQiFWwT02jI6h857WupU4G
	 J5KS5Ng5Jh+yYwDk8XeFBslP0xalipLrgVGO0AQIffXHwhr2oELJ4UTcF8s/w4cWHCJ0e
	 YCmVhZd/rsIHVmugIkhfvTapKxh60rPyy+UEmKsqeZYTfGMwoZ6qcPxiknwPUYcOjsmWh
	 H63vqxX5P0m3O9Jb6eHeNbPt68XayefvxEXevWGGy94jtXydK/Re24unzvZp9+YerIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v7F+PgyF;
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006D4606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 006D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v7F+PgyF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nox8bTJLykF11nD4yonwkiNc7pDMafIXe+7tPzIa2gA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794206511; v=1; x=1794811311;
 b=v7F+PgyFV/RlIoNzZkTNW/LpuHk+gaaL8XmTOU2rbR7vYbYWxjVgo75l4TUdZKiyvxMmCznH
 N5tsw4GpOwRaDjJ9u9Kv5RaMwwyYqfH9aktHAV/tLPlpzisRb/yqP0yMQ6b9KmMqJQ6ykDGPRSk
 L8dJrMtP8XueB+Z18vLDCVlA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2938fe24122b836d;
	Mon, 09 Nov 2026 06:41:51 +0000
X-Mizu-Trace-ID: 2938fe24122b836d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:41:46 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_rtw-next_v2_1/2=5D_wifi=3A_rtw88?=
 =?US-ASCII?Q?=3A_8822c=3A_fix_out-of-bounds_access_in_cck=5Fpd=5Fset?=
In-Reply-To: <20261108182837.682661-2-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com> <20261108182837.682661-2-zeshanahmednobin@gmail.com>
Message-ID: <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev>
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

Hi Zeshan,

Thanks for the v2. One minor thing.

On November 8, 2026 7:28:36 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> index 09315d23e2c4..6343568285bc 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
> @@ -4406,6 +4406,13 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
>       nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
>       bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
>
> +     /*
> +      * cck_pd_lv[] only has entries for 20 and 40 MHz. A chip that stops
> +      * responding on the PCIe bus reads back as all ones, giving bw = 3.
> +      */
> +     if (bw >= ARRAY_SIZE(dm_info->cck_pd_lv))
> +             return;

As far as I can see bw doesn't have to come from the chip here, since
rtw_set_channel() programs the same value it stores in hal. So maybe
this could just be

        bw = rtwdev->hal.current_band_width;

CCK PD only runs on 2.4 GHz, so that seems to always be 20 or 40 MHz and
the check could go. Or is there a reason to read it from the chip that I
missed?


Best regards,
Luka Gejak
