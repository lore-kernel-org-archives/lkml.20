Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935122;
	b=uW8+7KMt8BCJNcb2QnnRveQHtLRYCLaMkBQQ50T4iMsBJKqv8gj3I/GA0txPNUVOYDVF
	 x5w+fFmRtHjxZ6pjB1xVrrBbt5jv5QHS/RmhsCo6kZuzBFlyiMOvCdIXoJUliFw0dZtPe
	 zW14qA0hJc2GyMEyKlQsqgS8AXoLeCuEI1Or7yJA3Ms7/4Xrl+hsG3htwkCy2cDMU3L0g
	 8sfLcNZxVzFHRDzOf5j6woIQ7nKAKqiPb07iFggVwbWw3G29ez/NjlVeeTlaa4bsNc8WJ
	 DPNuO0BhpczHdEoBDHwLFkDRqrcDL+4GU4JQ2RxzrKzvK0sfkwxZf2i1wNvokNqYH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gd/GZTFGoeGmvuZ9LA19Ix5VABOI0FSlCgZEpW6GbJk=;
	b=N/oijoRXKzt/bby7dKos2TqXCdzqQHx4qnqpnXY4AMzhGOxfMwbHcnE97WOrxiXA+jII
	 25X6wp9kf7Y0w8u6iIldZNfklxNhG7r9bAhaOA4y/pid10tzOkxe+LETqSfqOTrEIY/Gj
	 tFY0QWWgFlYDl+7RnfrJ0LehioCJbECos+48uEoZSwiurZ0VlRF/H9r2CKsFUwEkJw3aM
	 g6WTJAdKM6joF5czV7hmmV0mG+jtBzObOOu/dmEwRHDmoJ1186u3WRUGzBfyAL5stcBwD
	 2Z93xJBv8+wXiah4gyektyP7N/iqXZRODf3DzTO0AlChnkBxttBrpJkFt5hWIGthX/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbK28M1N;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E28606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbK28M1N
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so795825e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935120; x=1795539920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gd/GZTFGoeGmvuZ9LA19Ix5VABOI0FSlCgZEpW6GbJk=;
        b=qbK28M1N4YWjbttJCYic/dFVN4BLpLvkkWjoWFWCe/TU/Di6m+mh8Mi/PTfsBqC0QJ
         XxAyiekZ9/w0lWvZMyWo/UPWdpT7Y3Q4yJQEymYREDuDtWZEzNw+8idpBgJH6UpKp1Lg
         jABxpyXYWjAKrgqo8KHR517m/3AnDHTGqj0dQ5CpWWg8wcr9eNar5WEiJBGMCzVWp3XD
         w9WJD86eGjtamrxCfu8L9k0+nOGOFxhEr1XxcbvnklX/yhFYH7tGBLu90nrhlqo7ChXE
         yZCocUhfRMvfpxAAi1Siv0+FADk2trMv8AJPW//FriaSaibbHANIPIWUn/CfaHhY5h7K
         4GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935121; x=1795539921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gd/GZTFGoeGmvuZ9LA19Ix5VABOI0FSlCgZEpW6GbJk=;
        b=qFFHFN+DXKGyixZoVhA88LJO7q2g3t4JKxLDAOeciN6rK0BGi6hqOvN+8rq3jhfg8k
         l3Sl7Vq+woQ99wSui+tY51ySqvyejLoWL22b76kMCFxF7sXymEH5Jp2f/FOIZaZ2SNVg
         w1/ZBgEpGIuuLVuiaGQRvYf2kJUs6LLunsIpWYTO0ndBbHZ8zk7ET/XT87R/024Ll8ge
         2l89PBw0wSr4C7pHUMZcEva7wnnIn60Hmr0iqENY2aEJxRI7v64IJrG0ZCLxTBu7jKN5
         J1clb90ReJpDN/Y0sYJy6PqwUK13MzJd6cnPPXMI6rhKedrXIOlKB9uyGPmG2hu4hpx3
         iirQ==
X-Forwarded-Encrypted: i=1; AL+hErEIn7Liu/4L8mLJqDHpDatVTAKp0Lbe1m1skUExuASwNe4cH1G3YXKkzPKhffGWxthXT+GcLgdC4Ffmq+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z92vh6fTM/LmWCyWIubxBJ23OrzQvrczq3DY5o55h/NlATrLaxh
	T8HoiYDHO/ZSaUZzv5x4QjroUcoQrX6qf/0qLpITqJOcn1UjwWbjAxoT
X-Gm-Gg: AYBFou1PfwNzTd+kWwSRO8WwI1WqXeig9S+p3qTCXH5Rx/iESi0NgRsgs/Y4SMdLGDR
	CVtJQqJacIvARM57Mg2gTHjlOZMmMvmCLa343CklOR4kLvOd+HOvLpmxRAQm1sTAkSS8PmGKydj
	vvE5Y+e7oVhnLjDkck4hVMoeArEySNcgCdA2OfquCmIGE91amy8vh6noR9KitxQBgaS0qIPTQWr
	n53S1zct7b5xW7MXyeylCfm/Ck5ZeX/cxVfYNjvKNg4aoCbtRm5ZKCb/3fsELo1w6DmLT9Vx/DG
	D0wEQHjZmhwYqhlUy6jXpPz/HIjU0vqJ2yAiscEL5aDBCEyuWlgc/uYt8SbNzj91ZOiH5CAtgfn
	ciNf7oqVLcisAGrj+Y32CxcuVL7NstKKAyaSPYPfkkAcGRKCsSC0SBCn4gF+KVHg4r+mE1CJ2g9
	rJ18vEeCuY0Na9c8Zf/40tyZ8FcXwuE0D6zoi20aTz82YcnryZS3rcVn0t6hC8WVdBeqnWHeBKw
	6YY2fkiIWKt4x6cQRVSZrz8JcoWiV2c1LKVA/MCLvOQf0d+I6dsjS8yF1OJzks/TCBwMxjReVt6
	j3nHV7/4DjePz4HUYHM/LyqGmxJwwMWl0qQenYxb2L5BwWHXAhUVbZdQYA==
X-Received: by 2002:a05:600c:6992:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb68b9f729mr197712195e9.9.1794935120358;
        Tue, 17 Nov 2026 09:05:20 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm136645795e9.5.2026.11.17.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:05:19 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v2 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Tue, 17 Nov 2026 18:05:18 +0100
Message-ID: <20261117170518.1838786-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5285DA11-651F-4286-A0FD-52A6051B3A88@linux.dev>
References: 
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

> Could a skipped TIM update be retried at reconfig_complete()? After
> reconfig's last beacon download, sta_info_cleanup() can still expire a
> buffered frame and queue this work. If it runs before the flag clears,
> the beacon keeps the old TIM bit.

Yes, that update was lost. v3 drops the RTW_FLAG_RESTARTING test from
the work. Instead rtw_fw_download_rsvd_page() and
rtw_send_rsvd_page_h2c() do nothing while no port is in use: the
recovery clears the ports with the pages, and rtw_ops_add_interface()
sets them again. With a test build that queues the work during the
reconfiguration, v2 skipped the download and v3 did it.

> Also, if the last interface closes before restart work takes the wiphy
> lock, open_count is zero and reconfig_complete() is skipped. The flag
> survives normal reopening, so the worker still skips TIM updates.
> Could that exit be covered too?

With the interface closed in that window, the flag stayed set after
reopening, and writing fw_crash returned -EINPROGRESS; rtw_fw_recovery()
would ignore a real crash the same way. The pages no longer depend on
the flag in v3, and a new patch clears it in rtw_ops_stop().

> As far as I can see, rtw_core_stop() drops the driver mutex without
> holding wiphy. A concurrent beacon change can then reach:
>
>         ieee80211_change_beacon()
>           rtw_ops_bss_info_changed()
>             rtw_fw_download_rsvd_page()

Two hostapd update_beacon calls in that window warned twice with v2.
The port test covers this path as well, and v3 did not warn.

Mehmet
