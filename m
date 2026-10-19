Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821C496D46
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415537; cv=none; b=n/gOpe/VORM5M+OC7IrykHfHcIksPVDwbpWiQb+HyneA5DOuq6OHQeKS2/A/f03Y2Eq8CLcDiJYUj3GcZ2wFVXruMWTJGjCu6XzYgHr6RFDiESd2a7QD9lK4+qN8gZMLPVMPNevj7G1Uhnw9hHAcUXsbKHurj7zx1na6GaWaCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415537; c=relaxed/simple;
	bh=AylRuBno5Pn8TsJf9Ogcc7yJ2eqTf3rwdkgyP0EaziM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOl4wwWSAm09NSSx1PM7MfQYCQTvWfBA4aUBO7bEXwE4gEe4nZefgqQmaYf95pgPPsLTyUagkQwUPuxWp0tOqHMePuGXK/pYrwRgTot9FckTyk7HH5AXvkOVbQC4/16Wg/087vgqJ1h8lpSvQPMjyjNqKN70gZ818JtxogKX8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbyhOs0t; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbyhOs0t"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5fb79ce82so10545145ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792415535; x=1793020335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT7565n3cY+YDTERB3uQ8khKJFfspA8uXPmSUyaFk3g=;
        b=EbyhOs0tFneOfR9xE/+BSI3DP45VZFZje1WhNWGgycmEF1wEOUqUQSyZLzSpVZkx2L
         qZZCXHei2N7+ZmdiivPDUThwJtK28eHmjXAhEN7JSPScUu47dR+snYIN8ctRyT9miEf9
         4K3B9YLN3F7/Qns7iug3EFqfgfVhpb5QYdaTYQ6VhY4XlSQbtDX0f23P+BlWqEfd9XR3
         fdYKY1sWeqfmfLkmLn/zRUp4ieXl1NhbF+7hunG25u8vATtj0uSdRAIRftPxX+tBZA29
         SmAYo/lfeXIdMtV+LaybytDBLSogqQ7ABVEnu7YWu+W/4InGc3ojwdguobJRbigGGPgq
         mwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415535; x=1793020335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT7565n3cY+YDTERB3uQ8khKJFfspA8uXPmSUyaFk3g=;
        b=v8YhApWxlFErDSgFHY4hiasCk48CT9s0fNpa5aiJkoR4dtL2ArMP8Lm+3Rl9zwbtwY
         ipj5ui2nnnY+9ItwVCvcCLwulfPDNm21pQkkFgbqzjcOpbXMUwgg5VV8NWT9OnoLqi4M
         swO6kXACJVcKKiWlP9il2s85Y7bFcxewUVyypG3dMdr7xAACIbQ3BozgA1YYRd+9GPPR
         VEifQJ1rwW2Bw7waSGrJhMOm3LpIbZjrfa/WRkkpL0BfdQeFb1DtHo8JUPBsCLRQ0ftq
         jCMEcnNhMdSh+bT5c+MpTnr06+cXqyMEeDKQdbK6V9/pisblAqlfCjcGsLro/W7vkHg6
         EwNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8V6wQTSP/5VAd8IJKJLoPuJ2cPCFT6R3X+xAOTuj2raAx3QUu6bowjymfgjuHCNBBSevSVZvk2veHimc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzRR69pfCKN/1cUvcyGBG0kTGvB87jiGU41jkAMxakiF+TVSMU
	IyW2yB+QF2TQWK6/Rw6AMPz356U9AHaGQia0SbW1MUhFWFmFPmYvdd7+3BBKIg==
X-Gm-Gg: AYBFou1uscs2FFdwUMCs3zKq7FjcgJ7VkXJPn/AwUnrbAVfpHMP5AV/Q7cti2svxH7N
	Lc095jtYhrr0CvLLIS7/TPVuFgxpCLUyYkeyg2BShRJcPR1MEAZCsSVqxUUdSk391jx5k0bzTss
	lL32BE7qSCIJJpiQ8JewBMuSO5ZYk4qJWDrX5Kb+xst2FTaUbylwjCLXVna94+LPz09wevzTk8O
	RAXTRL+lnbZVw2NLsyuZKvwnJ6aGvaVi5nsrvhrJrZQGdCG+ECToAfX94eB9HcVUxFHx6vG8HMm
	NBatFwW63oTTozQdPg5NupJDfbuE8LWNAzsLSwPvk/bSiU+Y1Qu4FsBANrmRi6dCzWpggkLFoQE
	Wz6pB0WuKm/zlml1g3gd3O9MC8FMsFfeBQZiCxI21RTMlrochRWawylTHagRLFW0dGnqLzKXojo
	3nHseNpIrO7uoJNcU7E9AF/Jz1ffQ9tKqDDUWOq3rJVGs6b03Mhl9TRiJgwh03i55/omPuUS17s
	4ihUrgCCIqyJujTc1ZQ/Rn2mf0mwzybgZkb/f+6Tl0/EdY5rynRf8D/riPjjCBfFW0A9aaHuCP6
	+eE5AghD
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr70486035ad.30.1792415535050;
        Mon, 19 Oct 2026 06:12:15 -0700 (PDT)
Received: from [192.168.1.164] (h69-130-12-20.bendor.broadband.dynamic.tds.net. [69.130.12.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1517e895sm430215ad.57.2026.10.19.06.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:12:12 -0700 (PDT)
Message-ID: <61207966-c403-441d-9019-583702833a7f@gmail.com>
Date: Mon, 19 Oct 2026 06:12:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/3] wifi: ath10k: bring down a station vdev that
 never came up
To: shunsuke@nagashi.ma, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 Fabricio Akio <fabricioakio@gmail.com>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shunsuke,

On 10/15/26 5:17 PM, Shunsuke Nagashima via B4 Relay wrote:
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> When a connection attempt fails before the station vdev is brought up
> (authentication timeout, SAE failure, association rejected, or an Auth
> burst the AP never acknowledged), mac80211 removes the AP station and
> unassigns the channel context. ath10k deletes the peer and sends
> WMI_VDEV_STOP, but no WMI_VDEV_DOWN: for a station vdev that never came
> up, the down would only come from ath10k_bss_disassoc(), which a failed
> connection attempt never reaches.
>
> On WCN3990 firmware WLAN.HL.2.0.c10-00459 and c10-00236, the Auth frames
> of the next attempt on the same vdev are then not transmitted
> (management tx completion status "discard") until about 20 s after the
> first Auth frame of the failed attempt. In sniffer captures, 241 such
> holds ended 19.94-20.03 s after that frame. Some lasted longer (in one
> overnight run, 29 of 226 had not ended when the cycle ended), for
> example when user space gave up on the attempt during the hold. Probe
> requests still go out. The state belongs to the vdev: an attempt to
> another network (another BSS on the same AP) on the same vdev was held
> too (2 of 2), and re-creating the vdev cleared it (2 of 2). This happens
> on WPA2 networks as well as WPA3. An older firmware build,
> WLAN.HL.2.0-01387, did not hold the frames (0 of 7 reconnects after
> status 30).

This seems similar to an issue we see on the QCA6174's. I don't see a 20 
second delay, but sometimes after an auth/assoc timeout we get a spam of 
failed connections with NL80211_TIMEOUT_UNSPECIFIED. I've mentioned this 
quite some time ago [1]. Do you think it has any relation to whats being 
fixed here?

Thanks,

James

[1] 
https://lore.kernel.org/linux-wireless/441e9883-1efc-498b-ba33-6a4f12443f3b@gmail.com/

