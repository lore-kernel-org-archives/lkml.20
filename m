Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994423;
	b=C6PSmoAGYvTbZhkTbJ7+rbdpPyaFnKxilgHH6R3cTWAvFJCqrp18driBEx6M0pb1Ay8i
	 Xzcx/S5Dtj3ZPPyq27sYBSWU6973WI+zKqwlOq233OZeABi9B11Zpn5qu+mZ3R9dq/7D+
	 tqMVef3FbNE4kamVDrlWwIaObXXqCLp/9rLPteynhECqbKuwz6XXNV7x/ygDnOUaZY2uj
	 IY6GcMgvAvGiViUAx53AAW2Q1gtL6bYpOyBwqdgpllTwvEgtNe6OtoyiY2/+Qeq+986MZ
	 M7KhakiMpup+5ZlT5Xn2GHO952NBSwOx0bBh+wz+Oqamzfj4Repy89g5SibaAZo59HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UGRkW91UEtZGZyGYD0O6bXaeLB7w9goCGwmJI1NFJ9Q=;
	b=X7Q0RkIkowgIOeqVoeRm+CkcyUiGQpfYI22vUN3xEDFZNvu7AZKqnCEHp3Tk1YDTk1wK
	 7fmYtwR1hvewK5PuxF4ymxrg+jTYp6ErnKqH0QADEoROllSAsml61+BoP2GH0PPkzE53B
	 pMKEdyadUSzbogN+Kw2LZ6++iE+ZX6sOCRJSVJ9kHfKFwOCCCynWvYjw6k4P/S2svqxQv
	 ImJMXUAUmExv7YrHG7V2apBFb32Y8ImQoyZ5kl1OnBzsFKDXs/BpeSUj3WDOljH6ML9YU
	 b7MkecOxVDckXfQ/5RySNtaFHoBZC0tHQSyctWOSeMzgQgSaQUKoTg+h3AkCm1T5RvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ep3uIcyd;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F37606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F37606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ep3uIcyd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10456055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994421; x=1794599221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGRkW91UEtZGZyGYD0O6bXaeLB7w9goCGwmJI1NFJ9Q=;
        b=Ep3uIcyd6rQoTA68m8oqyrJ+cxyThXI7w6/aXQ3tSUE2HqG3fuHEyAZdzwGO+7Vso6
         BUPg1wn+1kU2CvnJyb4juaMNydFgd9yMmryO7l2L2EJbEB/I4MpUArNulLEvM2QvYWSk
         QIOHw45ZQw2hFRlaitAYBALGKnKoPVS4XJmVi+7vwie9AP8b3U+vhuO8y68c4GQmpZtn
         L80JhgS0MXiRMBXtZFA68tleZWevIQIgGO4gMpWfHM+vjqo8UdmFXYYza4xV5tYauJMw
         /RsGghueCQbHiPaEj3vZdv8rXy9xngIWAEdl8YC86mKNWNBU/f6mUF0IYTbOJ904EvnJ
         xASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994421; x=1794599221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGRkW91UEtZGZyGYD0O6bXaeLB7w9goCGwmJI1NFJ9Q=;
        b=bJMvqKq+qfxXRW6BRo8F719yU5ckpqcCFFKXXhslFPTjIJoByPNPrBaAL9hMJOVCYU
         mIIfn2D3irzFADB+76lcAz7Skc/Z0hrAPTE+qc2589LhtHiVKqPMqhACUB3mAL7Tp8Jq
         Dx6LJSDtUABFoxkHOt+vPkKe9TyNPWABGGhFWjR9xPNjWeBrPq0kbmTj0GsWCkRg57rJ
         O/ypSRFCpCAAlcKNaKstrh7SRZWJ7MI7cgLvhTaF9TzkiHt/AVZlyKg8e23kt1NuXcKV
         sbjnrVFZpcPSEI3Umk08q++uO/XhUPoPvYRmnReuhtg/GHYrbzatGQhYYq9nMKDiu8rT
         MMEA==
X-Forwarded-Encrypted: i=1; AKwUvBxAI/1tCLxVflkCitxYW3E8/p24IjOWXHo7uZ79JE4GYSLkcOj/tRg6sNjxfn6YZ03thjno4RsXxLg+c4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FY8gOKsyk4igzEUhN6S5aHD4XV3W0FuYKPfTS0sjotkmkJPFj
	Zzfk6JpTCPKtQvw4F8fzokHe8XkQGuB2YEozLmltAk584BiL7qPc2w6vn5UK5QuN
X-Gm-Gg: AYBFou3szDgnDBZKQyvbdKww6f9YdbOiYnVONGKyGPlGH+07GjwOng7gAyG3Mfk3h8f
	oD4QDfhB/Mum52OSYlld91N2aEI/ZBqf9b/Zye6XEJTCxDbeffVC2f6aztGt/Lzd7rSkyc5XvGF
	af5/E4lBGAjT4bcpgt6kBajfLLAMiWYSSifTSgNCBlt1ruoxViDl1Ch6KUcpVo1kd0CaebFpkuj
	5hTLZNdGJJWGR2gdB69+lB5aACdsqaVnILtfvE4G/dGJAzjDW8whCmbo14GtD9b9S/YT9rMCP6m
	PfwbTQiCQvDVquhSJz5VMNKYHoUKcxNRFwKMxNfuZ+KIswkkX+aW2V5QsKBVpcI7/gkOZE8cdCA
	A+i88jilL28bxJ9T+E2oBOvdwupxyrq4oNAkNAbGb5GkhHU0hQqKHGxoW6DymDX6ZEwPm/gfPuk
	r50v/PM1FnDvGKOA+sqLuTZhZB/nY7wT9EkAEROBQqDi9L162u/iqFlbV2Q1dhq41cgIn0EPu22
	rA1svagWuPUaZvQ0cnEXro/dWKRnOgmsuYZSZrgeDGAPiC8fZj7GGAE910PS0vJ5dAUfv1iH6A/
	c2EOpYn8awZTlk4mopVi+eW6bkwpFrl8MRYT
X-Received: by 2002:a05:600c:8712:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b6df7d4a3dmr61300245e9.20.1793994420985;
        Fri, 06 Nov 2026 11:47:00 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm6072745e9.3.2026.11.06.11.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:46:59 -0800 (PST)
Message-ID: <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>
Date: Fri, 6 Nov 2026 21:46:56 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v2 6/7] wifi: rtw88: 88xxa: adapt channel sensing
 to receiver gain
To: Luka Gejak <luka.gejak@linux.dev>, Ho Jie Feng <hjf3108@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-7-hjf3108@gmail.com>
 <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 19:34, Luka Gejak wrote:
> Hi Jie Feng and Bitterblue,
> 
> Thanks for fixing the scan latency. A few comments below.
> 
>> diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
>> index 69998c0d7c1f851bb30d2702233d62e14b305bf0..7a04aec9a045f1e308a4c5d331c900e013996bd5 100644
>> --- a/drivers/net/wireless/realtek/rtw88/phy.c
>> +++ b/drivers/net/wireless/realtek/rtw88/phy.c
>> @@ -377,6 +377,10 @@ void rtw_phy_dig_set_max_coverage(struct rtw_dev *rtwdev)
>>               DIG_CVRG_MIN);
>>
>>       rtw_phy_dig_write(rtwdev, DIG_CVRG_MIN);
>> +
>> +     /* EDCCA thresholds can be relative to the IGI */
>> +     if (!rtw_fw_feature_check(&rtwdev->fw, FW_FEATURE_ADAPTIVITY))
>> +             rtw_phy_adaptivity(rtwdev);
>>  }
> 
> This and the call in rtw_phy_dig_reset() also reach
> rtw8822b_adaptivity() and rtw8822c_adaptivity() when the firmware
> doesn't handle adaptivity. They use igi_history[0], so as far as I can
> see they just write the same thresholds again, but since this is core
> code it would be good to mention it in the commit message.
> 
> [ ... ]
> 
>> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>> index 851d198f76f3b10d5ba77c7e07e4be9d7fd54e4b..ee72380757721dab7dc409aabc24b2b825969465 100644
>> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> 
> [ ... ]
> 
>> +#define EDCCA_LB_START_88XXA         (EDCCA_L2H_H2L_DIFF - 30)
>> +#define EDCCA_LB_RETRY_88XXA         (EDCCA_LB_START_88XXA + 18)
> 
> Maybe a short comment on where the 18 comes from. As far as I can see it
> is the vendor condition for searching a second time (IGI upper bound of
> 0x26 or lower), worked out for an initial L2H of -17.
> 
> [ ... ]
> 
>> +     rtw_write32(rtwdev, REG_DBGSEL, 0);
>> +     for (i = 0; i < 3 &&
>> +          rtw_read32(rtwdev, REG_DBGRPT) & BIT_DBG_CCA_BUSY; i++)
>> +             usleep_range(3000, 3500);
> 
> The register read in the loop condition is a bit hard to follow. Maybe
> read_poll_timeout() would read easier, like efuse.c uses it:
> 
>         read_poll_timeout(rtw_read32, val, !(val & BIT_DBG_CCA_BUSY),
>                           3000, 9000, false, rtwdev, REG_DBGRPT);
> 
> [ ... ]
> 
>> +void rtw88xxa_adaptivity_init(struct rtw_dev *rtwdev)
>> +{
>> +     struct rtw_dm_info *dm_info = &rtwdev->dm_info;
>> +     u32 dbgsel = rtw_read32(rtwdev, REG_DBGSEL);
>> +     s8 l2h;
>> +
>> +     rtw_write32_clr(rtwdev, REG_TX_PTCL_CTRL, BIT_DIS_EDCCA);
> 
> Bitterblue reported on that "firmware failed to leave lps state" shows
> up a lot more often with this patch and stops when EDCCA is disabled,
> and you replied that it only prints a line in dmesg. On rtw-next it is
> more than a message now. Since dc16902cad9c ("wifi: rtw88: ps: Trigger
> firmware recovery when failing to leave LPS state"), rtw_fw_leave_lps_check() 
> goes on to a firmware recovery after the warning:
> 
>         rtw_warn(rtwdev, "firmware failed to leave lps state\n");
>         rtw_fw_dump_dbg_info(rtwdev);
>         rtw_fw_recovery(rtwdev);
> 
> So a failed leave now ends in a firmware recovery, with a "firmware
> crash, start reset and recover" WARN and ieee80211_restart_hw(). With
> power saving on, rtw_watch_dog_work() calls rtw_leave_lps() every 2
> seconds before the dynamic mechanisms, so I think this needs to be
> solved before the patch can go in.
> 
> About a longer timeout, according to the comment in
> __rtw_fw_leave_lps_check_reg() the firmware restores REG_TCR once the AP
> has acked its null frame, so I think it would mostly hide the problem.
> Leaving this patch out of v3 and sending it again once the cause is
> known sounds fine to me, then the rest of the series doesn't have to
> wait.
> 
> Bitterblue, did you turn EDCCA off through the edcca_enable debugfs file?

Yes, that's what I did.

> With this patch that only switches to RTW_EDCCA_NORMAL, and
> rtw88xxa_adaptivity() then keeps EDCCA on with the higher normal
> thresholds. If that is what made it stop, it would point at the
> thresholds used in adaptivity mode (ETSI and JP regions) rather than at
> EDCCA itself.
> 
> Jie Feng, maybe comparing the IGI in the hardware when the leave fails
> with the IGI the thresholds were computed from would show more.
> 
> [ ... ]
> 
>> +     /* igi_history[0] keeps the pre-scan IGI while scanning */
>> +     u8 igi = rtw_read32_mask(rtwdev, REG_RXIGI_A, 0x7f);
> 
> The comment sits on a line that doesn't use igi_history[0], so it reads
> a bit confusing. Maybe something like "read the IGI in use,
> igi_history[0] still holds the old value while scanning".
> 
> Best regards,
> Luka Gejak

