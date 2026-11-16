Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827326;
	b=filKbfbo8hdVKJcfFnaSLrJyKPrenUW5Tmgl66IrEza0us9p91iFS3qW5bgfA/15uzsv
	 bGieqfYls30iJFKS7ZxRgtpfcAMuV37QrS8n9ve+WX6xuCWakL4eahHqF5pFhSz0RrdhI
	 L2q54f/X4NJIpDpFcK9VFXY7NBCCDjbMLzwy0MgQjMmg45dZVPADXpAsmc9yvrHWGXAjz
	 Rmk1kUFxqoyPdDq+ck/Bm0s3d8Yp7q0a5my860DIJP7oZ3JbvV0XBT4ne64uVoRuvHyj+
	 aK+pRycDYeVYDjRN5P7NP6zxR0gb1UWdvFXZ58OKsWdJFZ/vjPJpVUlrvSfPXeJEemw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827326;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
	b=f3ga/f5oUcBky8h7VWpFUphUAC+tz+D4sRyigBHvdvf5Gw5ajEll6USlFE7P4U1QxAO/
	 eEk/0F73ty2haYG4dwcHo0+SOeNxU5/P4ly84YELCal+S9x6/K5FSPCO0lixo/NqpA90G
	 h1KtzIxlolEpWBoKmkx7a7zNyT5StOZy2C4agygSubIxMUJq7lLU1dzXQmWeWBVJ7YQsS
	 lWD68XETlULf53FIX552EeiBfKFkkB4S0IK+mHXwUAi/oVsesASZwCmWd+Y37r8qIwnsK
	 AJA1C49rNk2y7IUIb0ORWuWw59C0zMIHpXUDKAS4p5ljhCzM856Sxj2EQHvLgjWWVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="acV/63+L";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26709606BE1C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26709606BE1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=acV/63+L
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2763405a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827325; x=1795432125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
        b=jTKZwQjMIWrqRQ0eP+eKUIr+2tmQQOEYh/DQ6OzBWyXK5iZUPa7RGIzwKZU9W3SEHA
         Oog50eZyGb9eM6O0a22XYGpra7GSJ6tVJOef7RAoHebFhCVs/sGYtGpjwrE2er2d/xrr
         PZ8S13kHmBRCwoKeOHLSbDI/z1Qc96ptFoPurIGQK426suFFCG7LsG6IKXii1iEy604R
         cTSwbsR1U7SumRwAi+8IFKpcvVw3NFpTCKczEBGpYPp/kbHAFgJv+9nnUNiWJNsdGO6e
         XpQMVp7lMIjRAK6GrQDBKpTtqWP7bHiNL2OJIMf63vhDcyZYl+7PKbNiPmGIBXcFYev7
         Je7Q==
X-Forwarded-Encrypted: i=1; AL+hErEXt1OswIIP9w8v2j4NPWR9rU/DX6bv9LIM1qdbezHObqU5Pe7iQR8EZNdW2hVGzxojP7AlRqPL2T/O7a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86YITJLP0o0id+CG4gVDeL1Q5oCZX5+SLn9MqlWwfyRXJLQqct
	OeQ0lUTP9L1ap4a/qhZ40rSoMUhvkbu4jawaqX4qXWoCXaNM2aSi8dNMijxLYbMvBVnN8g0DvgY
	pomvy/BRkD2n/kaCZz274k4SldhgMDBVBpw755Sr0s3LB8uye6+hdlZxc8KOaw2psYZBEb1JUBE
	miSe1PM8ay9XQcI2LQB5gQlWKQluxeUj4zxRFNQrlWVd57DR3x54pqE5zHXMKePtiIH4Hg5PeDB
	8EfHcyuidnYV3C3TaAAp/I=
X-Gm-Gg: AZFdTZehFkFrrWF67kx0hzO+gTYTd8/K25Gk+yYoToqZuXWC6p5qJotojE27SGc5qsf
	W1pytY2iGw28jtsEYI5IzurX41Lztkun1fq+DWywAtwiUx/dHLuZJ1OJr8oq3vnKl9vLm0mxkZn
	UcPRtet2nNlQ4z1HKVzWGxtDTDxmZH7QCSf1LfQXc45AKkIsWqH7YhxS3UcYvWtLWWO7fzI27J+
	JfZpPAWqAKf6NqZbehGIcBAZf6fQIK9U/7IPaLJw4v65M4v/7BOmkLOZ6nBlb2RWKrSaU5Vwuw7
	D64mI1vm4/4hgg2Odw5c64V+wqKEbzh29pewuyfuMCALbzGPFrw51rOXcg1E2zqsgcGiTjN5gxh
	mAlXzhRIBWN1n5gIX7znDz1BSXAx2JoF7G/YvEjcONn/P9NaBV6ZLr2avylHZyf3uVMmFflbCds
	Z1WqOQA4K2xQ91cYmTHIz42J2BppxHs6xMldUVdz4=
X-Received: by 2002:a17:90b:3f8e:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3b1b0b5f193mr9334148a91.66.1794827325121;
        Mon, 16 Nov 2026 03:08:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e80bsm11785572a91.5.2026.11.16.03.08.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:08:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so1041651085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794827324; x=1795432124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
        b=acV/63+LcKWaG+HXY0uKI+57ALZCiirM9GVzYyfwUc48hCA4dOv/TSGJo3nDXC2NdJ
         ix9PjDv5IJBSqzyhGj2vkjAtteBH2AR9dsixeHOpu+DcaiNTvc7KGR5XW1VJBY1ZvcSh
         n++r3ef3NX9/t30Rc6KbsBZy+vuoT1ty4bEJE=
X-Forwarded-Encrypted: i=1; AL+hErFJO2Al6u3gTaKxFKZfoC24ABc6KyLp5t0E06Iv8wwmQdcR94us8ica0DYZ16LKwaV73ackdGk3e129k44=@vger.kernel.org
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1401764985a.67.1794827323982;
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1401761285a.67.1794827323573;
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c835b45sm825384985a.16.2026.11.16.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Lukas Klizas <lukas@klizas.lt>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3 ACK
Date: Mon, 16 Nov 2026 12:08:39 +0100
Message-ID: <20261116110839.4481-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151616.70623-1-dev@deq.rocks>
References: <20261104151616.70623-1-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 4 Nov 2026 16:16:16 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Since commit 6f88e6ebdc1a ("wifi: brcmfmac: Improve D3 substate entering
> timeout handling") system suspend goes on after a missing D3 ACK when
> WoWL is off. On resume brcmf_pcie_pm_leave_D3() still takes the hot
> resume path when the INTMASK register reads back nonzero. Firmware that
> did not answer D3_INFORM can do that and stays dead afterwards.
>
> [...]
>
> Record the missing ACK and force the remove and re-probe path on the
> next resume so the firmware is loaded again.
>
> brcmf_msgbuf_delete_flowring() waits for outstanding tx status before
> it checks the bus state. Check the bus first and stop waiting when it
> goes down, since the firmware does not report tx status then.
>
> Fixes: 6f88e6ebdc1a ("wifi: brcmfmac: Improve D3 substate entering timeout handling")
> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 22 ++++++++++++-------
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 16 ++++++++++++++
>  2 files changed, 30 insertions(+), 8 deletions(-)

Thanks for the patch. The resume problem is addressed by Andre Eikmeyer's
series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips" [1]:

- Patch 3/5 ("probe again after a resume through firmware") sends
  brcmf_pcie_pm_leave_D3() straight to the remove and re-probe path when
  the platform firmware handled the resume and WoWL is off, before the
  INTMASK check that lets a dead firmware take the hot resume path.
- Patch 4/5 ("send the flowring delete without waiting for tx status")
  removes the tx status wait in brcmf_msgbuf_delete_flowring() that stalls
  the flowring teardown when the firmware is gone.

Your patch forces the re-probe on any missed D3 ACK for every PCIe chip,
which also hits firmware that never ACKs D3_INFORM when idle, such as
BCM43752 behind 6f88e6ebdc1a, and logs an error for an expected case. Note
that the msgbuf.c change is a separate change from the D3 ACK handling as
well.

Please test with that series applied. If a case remains where a missed D3
ACK leaves the firmware dead, send a patch on top of it, limited to the
affected chips, with a description of the failure.

[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=1208304

Regards,
Arend
