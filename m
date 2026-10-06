Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC63B637A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272798; cv=none; b=WSoALMkTjm8F6OhHcQ/0TtOWwn0rkByFx1rii/w6gn7hdFCzY71CLJHqiyhvmZuzXzWSftutW2UQ2dwgttVfq1730vFqZW7YPYRuhE4cCeQ6/RlqEHmOqoO8waAsca4BLgN3V4MFOD4xrPjXIaaVQdcpjVKtd9XzEHH0V1Ghq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272798; c=relaxed/simple;
	bh=D3gB1XP2QGK8Z9e+6oRiVNsyyn/P+mt36J/dj2dEDzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FF3ow2R95krcx5eqph7AzvxBQztcL2/ziHIKwSmWuYjQh05KAZGMBAxM3j6CbzvycDnRNHxmegkz33wR8h5ozRef0/C23qjUxO1hHXxMYQw0aJz8D+KiJ7fnoAKDY3XnOefgRRnvx0ToVVhdVmeQMC8CNgW0xmE13Uf4QKvZyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S132A0wB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S132A0wB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b03f23305so2232649f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272792; x=1791877592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3gB1XP2QGK8Z9e+6oRiVNsyyn/P+mt36J/dj2dEDzs=;
        b=S132A0wBCgnBBXjwr9TelgxWqG3KZNr1RhGW5O/cN5BS3WcaYPgsn35iFk2rZtGaju
         1wyLpwIoOvyRmOOMLwaEqgl9P1UmmH2pn07mgTTIjeFC8tHeodBeWwSty7Mta/T216Zk
         WC+q+kakRxo0xybUwhynUrdGJK1iMOpr4k1kw0mEk4rhkHaWadNAfZTGSBbvTVfRId2m
         13xGJGY1xFJK5/bPxykMypRxj1qDR5s5D8EzmkVbNXoGFk9y/q0MBjFHq6drvPeqWepr
         D/woN7lvCtJjOgyfW2FK8e6oQYb6wJxwDnTudxjFM25FQnxyGNB/kJIMgpQvr/ZRHQPb
         nSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272792; x=1791877592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3gB1XP2QGK8Z9e+6oRiVNsyyn/P+mt36J/dj2dEDzs=;
        b=IjbIc1Hxw57pb73NA5zSr7ENcTrECJb9rSD8u/RhbppUxs8RSlYVkJP3tnj39Xw5Cw
         K7vTT3VkjAQTjv+YLQpjaN1FxboBeH0xf1hM6NACnmVmWxJAHYolkJFqsp+rh6TIQKxf
         CuyqH5rN9U8M1Ss4fbv+qO6zWvqs1MloVlVSyUyqC80vf0QUFcnuQjDhgGMKtrjBCURg
         GuyZXnHX8j9/N24dGdfZWfaqHd/6bhdM7VpEfCAogVfMjLZ4/DrC2ww60N+sXmc7MHzf
         8dsZGzVc8R4rPxaLFVV216iADkb3rvMg4/rO3QFm6k2i69KB6T95Z0S+AjD/rE5aWrKB
         fAng==
X-Forwarded-Encrypted: i=1; AKwUvBxe05+ztaGL9Vhv2fCPzWjEfqAyqsWuGRTQbOFSiwY82PpwbALssVaIwbM/CGTUSq7OlYw2LYVk8DhvgFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYImWdW6I91UOMx2f/gW+E8XEuKuK1kqO0ysHMtpzP04I/CfRxrP
	8BpH3ITg6IAOOIV1cR+WB3jeZZrjmuxHg4CG+HnreXPwfx0DKDL33Gd+
X-Gm-Gg: AYBFou3r1O1xzrfY5e/SCHYmzlTqoQrK6ZBCuefgoqeOWZ83Oo5/zDMwmD6BCjezozQ
	r5yh61ASmRfA9iuCPMcHm4+nVGz41dsvEJH0+ogLsjWTM2ei2b9C2b9Udb1fzscvt4mi8weH+qV
	57YExnKW73xT6JhXytcw8Nw9hEHfXpNHUbVBbUbzUk5OGwUEuE6QTRlyye07YgNb0mnCBgf+XpI
	t7fIf78bjGpYLfYQldP7/DRO5puz/40MmJ3Pd7EvNu0GggMMfqvR3thS9iYUWj70nZ1Awj0uN4l
	+zBUhyfSZLaeTAWqyIg7mzSGIpiCoQt0RKR8/+bZ5pR5YQ+8XtAfCnFKAXCaGnh4a0/C82uKfCQ
	MESwcOLHCLTP3lm6QPwBpl3S8f3EtNmD1Bqkpb4l9b8fx2WbNUt+tURl7Om946PmMuA9QJpZ4jV
	yFl1gcTD3dtak1jylNwZNE2UR/QkLefhG7X7RImsJKXtda+y6id+yDIa+xpUKaFwOO6qyAyOuji
	T7xvR8cD8IdYQ4=
X-Received: by 2002:a05:6000:144c:b0:48b:180:b900 with SMTP id ffacd0b85a97d-48c47fe7564mr17336900f8f.16.1791272792189;
        Tue, 06 Oct 2026 00:46:32 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6f3a36dfsm166254f8f.19.2026.10.06.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:46:31 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 2/2] wifi: rtw88: support channel switch in AP mode
Date: Tue,  6 Oct 2026 09:46:30 +0200
Message-ID: <20261006074630.372808-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173326.2306-1-luka.gejak@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

On 2026-10-05 Luka Gejak wrote:
> so an association during the countdown moves the count a second time in
> the same interval. Can this download skip the page while a switch is
> announced, the way set_key does?

Yes. v4 skips the download and the H2C on association while a switch is
announced; the next countdown download carries the pages of the new
station. Of the remaining callers, the WoWLAN ones run after the
countdown work is cancelled and the beacon change is the countdown
itself.

> so the AP leaves the channel during the countdown anyway. Can the check
> move above the feature test?

Yes, v4 takes the mutex first and refuses the scan before the offload
test and the scanning flag, so firmware without scan offload gets -EBUSY
as well instead of a software scan.

Both verified on an RTL8821CU, whose firmware has no scan offload: a
scan during a countdown returned 32 BSSs with v3 and -EBUSY with v4,
and an association that completes inside a count-2 countdown hits the
mac80211 warning about the counter reaching 0 with v3, not with v4.

Best regards,
Mehmet
