Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556332;
	b=AtBDiIItvdlg+dmLORm2mJ/+pTOAZ+hfYgKY/zsR8s/C32vCXC9ZWSk3YuOwDG2OArSB
	 xOK6n/khcVuQtbxfS0PpIW7GYCoYzqI4KpRTENGXe8O75LVBBWQaqIlSn3eeOjP9tmDKv
	 +7a6NkeFNy08zHmLgRbBLb6lbAko4fsfjOVzoEqCXRQH0Foiikf9JIUN8Zf5TFpIyuNzg
	 DfknifTnAiygOjB2iQijV0v+cOZKKA0hBruBIderJvPzdbBkG7VyoRX2LsvU73YWdzrBa
	 Ibuh9e9qB97j/TOxycCoaCjF+7dxiH9uag9LNizMecRvUYCtDxW3wIe2xGm5Ng7lW/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556332;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1n95aAPwg2IwT0dfMgvXN2ZGybZbnsTTZYo+iakm2FI=;
	b=N3VJsVY2flWSFQDsyDrrYZUHoyubax1soPIdjZ491t1CLcUJj1yRTf7EiGMiPLuPz71M
	 arzCa6Gtqi47TGSkuDJOBBOEpJ4/ED4hIVSFfHOpVQ4CXga/7Ft4WStwQXyrl1MHLjnrW
	 1h78ccAI35EKHVCVjm939tKdX5X1TVUrKmwi+XGQBj4yvF7k1koj6AYanBoBhkKb7IbLj
	 JzHYV7dsAWJvezeCdlhUg1J4K99hY78o/0bLt+fTuiDRkBhaBjN0jlGXdKjAmbF7qc0of
	 7iRBwEumXbXAoA/VTursOXZEEsCooQSr/I3cucxX8oKa/z0fpYxXYUkLoxb8RsN8ubA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FSgmam3W;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9575F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FSgmam3W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vHW+2YeyW7waLl8B7hAJg5Pmk6IRP/ExSvGaYGTcmo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794556329; v=1; x=1795161129;
 b=FSgmam3WZxPu5S7a86SBoEXRg7PAy34cJUYY/9upNKg7tWniVv/QOYyZygACLeZXVfC1xBmF
 CF1W/wR35mtsMBW+AHc8z0RNIBMoJJg2uMHTRSgpl3AQHafOcEmLTr2SAJnv6WbnqfeTI6hcon5
 X3L6ClHC+jB4xt4QDyUtZp+4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87e2bc8332c15c1f;
	Fri, 13 Nov 2026 07:52:09 +0000
X-Mizu-Trace-ID: 87e2bc8332c15c1f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 08:52:07 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_4/5=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261112173246.3201729-5-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-5-hjf3108@gmail.com>
Message-ID: <E6B17776-3DC2-43F5-9E44-97A8B63D0ACD@linux.dev>
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

Thanks for adding the comment. One small comment below.

On November 12, 2026 6:32:43 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
> index d0c1fb65be..eed3e2cb60 100644
> --- a/drivers/net/wireless/realtek/rtw88/phy.c
> +++ b/drivers/net/wireless/realtek/rtw88/phy.c
> @@ -687,13 +687,15 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
>       struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
>       struct rtw_dm_info *dm_info = &rtwdev->dm_info;
>       struct rtw_cfo_track *cfo = &dm_info->cfo_track;
> +     /* rtl8814a has 4 paths, but only 2 of them report cfo */
> +     u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);

[ ... ]

> @@ -794,7 +796,7 @@ u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold)
>  {
>       struct rtw_dm_info *dm_info = &rtwdev->dm_info;
>       struct rtw_cfo_track *cfo = &dm_info->cfo_track;
> -     u8 path_num = rtwdev->hal.rf_path_num;
> +     u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);

The new comment explains the 2 in rtw_phy_parsing_cfo_iter(), but
rtw_phy_cfo_xcap_track() has the same min_t() without it, so someone
reading that function still sees an unexplained 2.

Maybe add a define in phy.h and use it in both places, something like:

        /* RTL8814A has 4 paths, but only paths A and B report CFO */
        #define RTW_CFO_PATH_NUM_MAX    2

Best regards,
Luka Gejak
