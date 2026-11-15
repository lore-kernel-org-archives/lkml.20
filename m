Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748819;
	b=Xd6lLSZ/OxnQACrFV78j0JssxQw6oHReUIcC2+EQ5GdyHsLMwfrErO7nmi+UwxA0uute
	 6OA0tXM9+rj4dVIWM+tGD/gSTtdFWva5dBib9yfOxKKWnZhCZ6xwTEN7E9ZVEdYDNAYhf
	 nqctXudNRowUvpNow7xXdK3kc1Dzoh1lzB75N3GgGa+gmsHJftk3HE9MebjVoESxMsHHz
	 ZXKk17lHzKP02LUdDvKswlwjyl9maLsiEJO+DZg2O4wv+HfAUJk8lVz1My2PFmbIBoqa3
	 6OrKZPJDxzBBY/LiDifyDCSuUqclNeOIcMyGOsRgQY3vhsYW/zhcV+9W3Kmai90Bybg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748819;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W+UpOO6DEn25URdVBLc7AeAdrcKMrae8NJE1l5vt8gc=;
	b=rbaBOkJz6vY5nk0MGyl/dQSwDHcnxz+scqSOvZVG/G6nfhYcfRLMDeknHi1hVaPJ9TX8
	 +OJVjz3NZ0bFurvSUeauGyEiMBnNQPPnD49iDUw23WVRtIg1dWuaRpO2EVqNKntb7R0iT
	 5aBVJ9RmMlu40GdI5b2E2vdD3M9vVHQ7FY+nAJ0y5NCSx4lmx9Zk0soxTYqfopMLWqih3
	 TNQT1KFgnTp5I/owKYD0rDCL1xmeswHB/+Axi2t8JR2tMzyUSzlRqH4xLz5imeTwQ3bXc
	 08A02YerOoMTErHvDyCWn8CQtAWZhj3IpSW+eshP3AjHvXuoHxMLVMRfio1i+psfpfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JhEUuMjY;
	arc=none smtp.remote-ip=95.215.58.163
Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6F3606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JhEUuMjY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2Kp2E0/johYFo8M8Ky9xP207E97x3L3vqHNFFy5qtpw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794748815; v=1; x=1795353615;
 b=JhEUuMjYT2vY0EKeoKbAZ0iTEtLSPEvlQH61HbvagNkEWcS3/vSUjDj7eon54V6cYLGDysea
 E6G/eCrLsR6LQ8VqBLUVmXuAek4Sf2X9nN5Kz2DenQ+nno8Oryzn+/RA58iFFRjhLC/6fdjNqkG
 iSGX64B9DZQZXg1p9CwCMj30=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f207da07ea8041fd;
	Sun, 15 Nov 2026 13:20:15 +0000
X-Mizu-Trace-ID: f207da07ea8041fd
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:20:13 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_correctly_expose_beamformee_capabilities?=
In-Reply-To: <20261115114336.1739863-4-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-4-hjf3108@gmail.com>
Message-ID: <7807490F-585F-4C6D-8C2D-890C7DFDD957@linux.dev>
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

Hi Jie Feng,

Thanks for the update. One comment below.

On November 15, 2026 12:43:29 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c

[ ... ]

> @@ -1624,10 +1625,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,

[ ... ]

> +     if (rtw_bf_support && chip->bfer_su_max_num) {
> +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
> +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
> +     }
> +     if (rtw_bf_support && chip->bfer_mu_max_num)
> +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;

As far as I can see, this also changes whether support_bf can be enabled
at runtime. It is still writable, but if it is false when the adapter
probes, writing Y later and reconnecting leaves these capabilities clear.
rtw_set_supported_band() only runs from rtw_register_hw(), and the bool
setter does not update the bands.

rtw_bf_assoc() checks these cached capabilities too, so neither SU nor MU
setup can run. Before this patch, enabling the parameter before the next
association worked on chips that already supported beamforming.

Could we keep that runtime enable working? If the setting now needs to be
fixed at probe, maybe the parameter should be read only instead.

Best regards,
Luka Gejak
