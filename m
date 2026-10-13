Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4892EEE89
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853128; cv=pass; b=kuPuLMfxN75ljfTKP9eoKKlc/5a6bdRC3wgv4HQTLxFpkgLpvY5kFncD/EFleGo+v32h3+B8gLdKxXZPdJD/K6k9KCVmG27UlsBJBj6v+/FHsd8TgypDYwCsretXB+SkIQMVeFFexXe2rB8iqpfHzSHvxAoKtzeIpXbPp3HK6ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853128; c=relaxed/simple;
	bh=k4uBOr3fUC9C9V/2LEU8KbJ93ho9bjIXmyZyw7xe/xQ=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw92op9Ke8hn2lpNOuJQP9I7CYpNfat43Rm1j+EBXgnJeBlzLmRZgV7CPJd537F0mWVDNXLrhag4Xy1gARsOn6MhNmNkngArwFlpb6oDwZ3FZEnWtHAxbesFHS/Zt+3X3z+/KdY+hr50K4Bq+dh2IABT/wAi1W7kQnM4gYnbQKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=BMtkzgR9; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="BMtkzgR9"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bccecba199so1635653e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791853123; cv=none;
        d=google.com; s=arc-20260327;
        b=Grmcgu5BcAV72gLCGjKwv80yrjZN3frxCBqh0BlZupz7KL8qvBy8SYkPwvhqVwS1L3
         MBQGdCCJvXPU8lfJkhUKnT/RXOxkSFvTyCWVHHrZqi/NOsFlvWiDT3LwTH2QzCR16Is9
         tVq9TgTy7CUhxprF/Y9H74MBqmE5BTgWgGlLK9WQJ9VYCN03bgO/ngkP984yWBG+kZtP
         lVnYa9yKerGZWnwy4WgqnOXSgFQJ65Mo9hnalhI4ca6sQ+ggcsk3t1SUa5G2/Ha/IBgk
         hJp9jb09i8lP/tPBPmk/duWvsXzQQ2d1KV+kQpXTZlYwsoaQ7SlvgM9TGAzHs0jVsy2i
         XDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=0wOhigAERgw/ecq9Zfp4x327PQ7aRIqMRodPt/se31w=;
        fh=2Xhxkgv0WnN0D26iqtDuWl3Si6UtYNCPNMaRww2Bdww=;
        b=Rx/pJx+i3fGm0HiEKAfGvk0+rEKHhgrdu20qIrMoX28d6w33S+71ZB4HFr7c7WYYUj
         gqKqLy2un7zkQ3GZCc/g6CW8gtkp4IBBLANFxs8jfAMs8lKU45XALLPhQWS9FJctLDJx
         7W2CkPIa0zKJgJKmivXUfIqgv30OpuYMbsT78gHINbWpTkgbSWYYB33OVblR5vfijsho
         Vm8RzFKCvJEAlHxeO4ay+T1UGN1yXdqzjFZ0MXbq/ngSA5ybJhTTzht/Nukh34EPh8i1
         oqsKMGeuCF1gLefSkSNgxIMcLBypukiKJOmKTuiL7Pv7nRpkmQiAGA/Njnsr8eFq+jtH
         nwog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1791853123; x=1792457923; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wOhigAERgw/ecq9Zfp4x327PQ7aRIqMRodPt/se31w=;
        b=BMtkzgR9AyZ2IkE6qpDGPnMWdFbq/no756w7o58F1IxN0ulDLrxzXRlpH+bgKG1kXn
         ZkoFrAhqXXnKT9U/iFKiN5nbvcl1MZT5XUXnt/pNuaMantJfrlaUAyISTCm8ejPyh78G
         gRa/YfGRIn6GmIwKJz7tJcSswfp+Tis5FQBcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853123; x=1792457923;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wOhigAERgw/ecq9Zfp4x327PQ7aRIqMRodPt/se31w=;
        b=yF0cRgwaLAerYs/XDXqR54HVaGQbE7SLuVAVICanAns6ov7MYtQXbgf4C/BZjNXrKN
         twvNsHhZoMOkJZhdapwQb0yI8iB1F0Ne+KQ7uaFggMgw11RY+w2CaHU3ntv5ZAIM8EZr
         RPxDemr12gNi9apl15F9l8HvDi6bGwPYqVRICzO/HUv01N1PMkJ058h+1w6WOWheiNSI
         VPXT+mRVpHWhs0FLQuBue+/FlktuVlsjoXydrZmJ3gEITWST+OZcuetNA3G1aJ4muohf
         kg5jPcSztluHMZZUHNNxtBNQ8v4vQH0nERpROnXEtrLPUmDEZoh4LDgT+GL4RTQi7PAr
         g/Ag==
X-Forwarded-Encrypted: i=1; AKwUvByeP+D1QPoIi0kj4m1OLjBpNNfKKSHVJiGkpH/+ucToZqGWlWy2QZRfSG8weEXM3meNBSuv9575tUOjkbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkIKuhHz5g4MvaZn6XA8uUvllzTUKToCIFE/twELviQztvc1eL
	fzYoZYNniJRmFDPwafyNQtO/0YAC3/eaFUfq/XeLu4wOKLeRYFW+Ft4QFdcST+BR/N8LeGpeSVO
	cmrs6KH2aZ9UuF6xX6/l6mF2h8rouU6S+j+DfZ96Cmg==
X-Gm-Gg: AYBFou2Eo7Ks7UYYwUZ2AAxthyJ2H7ECfb9zvUZ9gOHeEFvoUdX6FImSK+KVQjdiaH3
	u7SYzoP4dVvsQ+iQaNg+LjvdwALZcOFgZIFY4RtPw4upyGlnvIdYH5/b7R9nquDdfAcgN90yTVe
	jtSKUTt2qLp0mfLri640v0MLtOnrON9oX3MMp6lWkarQBkd2ils1/C1sxzKYK2MbyNcijmw4dyb
	J8zmhOADc3zfthB/NCqkUX/AM7FGXMhBIsDlIwLbJGjEcK3HU4Xo+mDwojSTTQLHbg7EVEU+mIx
	RLS4j7A+rGbNqf7kcM7kUFotGgl0qZMqzpss/SPyGC7s49dQDs6jL/5KjQMqHELSnLxQ+fJBrpF
	RMQ6Ibc7ZU0vwW9+kimrxxLCxGQ6abm9hkgw=
X-Received: by 2002:a05:6512:696:b0:5ba:3339:6f6b with SMTP id
 2adb3069b0e04-5bcde6bcb06mr3984876e87.20.1791853123500; Mon, 12 Oct 2026
 17:58:43 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 12 Oct 2026 17:58:43 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 12 Oct 2026 17:58:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 13 Oct 2026 02:58:08 +0200
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <04d26f79d5984920a9584d3f31ec3b58@realtek.com>
References: <20261010-rtl8xxxu-usb-dma-v1-0-e670d9c08fdf@khu.ac.kr>
 <20261010-rtl8xxxu-usb-dma-v1-1-e670d9c08fdf@khu.ac.kr> <1fc8c339df1944afa6186197337edda3@realtek.com>
 <CAH1Bc_yOhZ9oqreJOLKb5RDFEW=0Zid=h4xu9oTR51RDwj_bww@mail.gmail.com> <04d26f79d5984920a9584d3f31ec3b58@realtek.com>
Date: Mon, 12 Oct 2026 17:58:42 -0700
X-Gm-Features: AclHuK_Ifxw9QoHyehe9vofNrat2BMmKWVVJ1nmld41C-se66_6KTgRsHhz1IK0
Message-ID: <CAH1Bc_wUq2Nmhvd9q85JP+KyCYHB_xqStfmo6ZirOxOkXzAg9A@mail.gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtl8xxxu: isolate the USB register buffer
 from CPU state
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

> Does it mean that data in a cache line can't be modified while a USB
> transfer? Even the data isn't a part of transferring data.
> How can it affect the transfer?

Yes, in this non-coherent DMA case, even modifying bytes outside the
transfer buffer can cause corruption if they share its cache line.

On the affected Pi, the 4-byte usb_buf shares a 64-byte cache line with
the mutex's waiter state.

The important detail is that a task waiting for the mutex still updates
its wait list before acquiring the lock. So the mutex serializes access
to usb_buf, but its own waiter state can change during the transfer.

For example, suppose the buffer initially contains 10:

1. Task A holds usb_buf_mutex and starts a USB register read.
2. Task B tries to acquire the same mutex and joins its wait list.
   This can bring the shared cache line into the CPU cache, including
   the old buffer value 10. Updating the list makes that line dirty.
3. The USB controller writes the new value 20 to RAM via DMA. Since
   this DMA is not cache-coherent, the cached copy still contains 10.
4. If the dirty cache line is then written back, the old buffer value
   10 can be written back along with the updated wait list, overwriting
   the value 20 from DMA.

Task B never directly touched usb_buf, but the writeback operates on
the shared cache line. A subsequent register read-modify-write can
then propagate that incorrect value into the hardware configuration.

I think one possible overlap during a rescan is between the
channel-change path in rtl8xxxu_config() and the periodic
rtl8xxxu_watchdog_callback(). The watchdog runs every two seconds
and may update frequency correction settings through
rtl8xxxu_track_cfo(). Both paths use the same register buffer and
usb_buf_mutex, so the watchdog could join the wait list while the
channel-change path is waiting for a USB read to finish.

Allocating usb_buf separately removes that sharing. The mutex still
serializes register accesses, while updates to its wait list no longer
affect the cache line containing the DMA buffer.

Wooseok
