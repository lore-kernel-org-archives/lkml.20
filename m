Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD027364953
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412159; cv=none; b=Gt79NP5zDkKq6XwPIWSA9ZwFHtOCf1sEiR3vkB7A9PNlgI6YQfsz/DfQJCotZCRHH/STnS7ukgT2BHD49ROzHFh9ML3Y9IgV4QrLYvu349bCi/WjVZXIVNx9JZdJseU2gr5Y3RBEzr47ylqG8JY5utk98QcFdgG0VcrHWwBtixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412159; c=relaxed/simple;
	bh=uwoZsgRouGIrhRKPZcj3Ps59PD4lQcOoHkoPSOGiWms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxR8RbVdJS5IXDa5ncJwy9KeTJ8wlLITBM+HMTdXF/gg6ExrLMpfuTAhS661dUQSowObLwb9u0W2JY8QxoNO5VOPnusPyjNLmoYsWYtPfahsYArywLFTt0TzziuXoEFXwfuMS4BdguAzN8wtUOS66LT7W2q1OS2AgngCIb+2Ts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2RR3t07; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2RR3t07"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso1855629b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412157; x=1789016957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AEsAc2FwYgCrEyjqCaORwm1bF5GGCWm1AuGEwAPRkz4=;
        b=Y2RR3t07eD7W3jajbiKVBysdGh7+4s8knZoNZ23dxnlPiSa7QBPFKJAHU13rLHok0Y
         pgDHuOsLZ16Rf9KRfT56NAHotnb48arvW6/oGhtyP+xg9z6NGsHeGHAphowF+67KeedB
         RtcCK/W1u31PYmqjQ2Pn8sFBUKtxUyu3/fJ0svg7GkeUuz0WiT7NqpV8Tozdgw5QNDjq
         7y4oeJaLybQCWBdegWj6b64IKAfsP4njuxMTLvn5wSsky5GKKRECh1higc9sdTUVXNms
         cvIHRPIARDme2F/LgHXRDXaA0Mn/0x6dnUPfrpJCAeUs/dug4QbKWV0jyrjkWeFgKhqC
         fzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412157; x=1789016957;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEsAc2FwYgCrEyjqCaORwm1bF5GGCWm1AuGEwAPRkz4=;
        b=JW53xn7E0mrda3ZOHsPfShwupDlsp66PGRugW09XnMhNNUrDXiHRWIV2P8sKk9EM6i
         6q+XkzDlBHfadvA/t5JMniKE+4CL417c4p/n6PtyY049Yt7l/8mvDSehejfcvgB0rEMq
         5QqBoWh7lGSPXZRa1rsPS0gg3mJL7RdxwfISu4NTVx0z81jveHpSCiQY5tMLwFGccaBU
         uUlVDpLuMWU3/V/CdQpxTTuWlO/Qv8mMyulPT7x4sVCDkkMPeRJnuHEmnWxcRvDEMCZB
         AbHEFkmh/68vTPl9Kk+IGcG+IA40Xgcx8Dm0KoQF3dC3g6eUiatdTmJQYhe470Y1C4Om
         GiMA==
X-Forwarded-Encrypted: i=1; AKwUvBweYhWItEoJ8fZ2TqOB/Qpmi3J7ws9G8oS2xdigwLK8ZtOpuQxp+IZanw+CGFfnAuw/sWdJ0for//XSaLg=@vger.kernel.org
X-Gm-Message-State: AFuF++kzTd/mcSflUzSx+vMON4xOUJnqXaL/lQq8pdfjnrPRBew7htRH
	LudWb++vkXp8kCTMmEruYTXP5TMQ271IF9WoQF44sBltkqthFmfrp/1v
X-Gm-Gg: AYBFou2Bup5gm41yyfqUFZVAAwiHqZmEt47wjs5oVh+JqqFlCr8GGjJBVwL9cWgg3Tv
	VbFpC3IBWx+IoUJpzQ3ReLbz0b2XXrwS2RtWlNn6yghfezLNknujulSuXiMqzG9q4mDsPbLqO9d
	End87MuWbbDXOX+dr+nc5VisWaxG7QbhT94EF596jGTEUJP0PzKcNrrTdw9qTjuuavD6U8JRIIZ
	+DV0IwBwC5YuyZNxJrNpd/vFLbLHHKj53tEmGo68rBzx+jXW2H6jas5lWMaQ01MRZ/NiEIcGg1w
	wNvHLIaLMDowxtcLAFa+7ECZR5n6eq/qBsF3+NUySJY0ky67WndwhkrYUCFn5aZ6fL+bVcr+abt
	OUpKA2HEy22F0SCZLcU9mnMNs/Lh0YsjRyz1j3l1GcFECgzWx3bHvRvLZLiKNbj6lLysTkSe43m
	3F7ZAb0YT2X+JyE7rC8x6e3UeNEdY5DZYs6/1tz/Bt2ZqLpZI0eFUxGg==
X-Received: by 2002:a05:6a00:ac85:b0:848:76c4:fba9 with SMTP id d2e1a72fcca58-85ed23ded47mr15880315b3a.7.1788412156830;
        Wed, 02 Sep 2026 22:09:16 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0d052bfsm2161587b3a.52.2026.09.02.22.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:09:16 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: edumazet@google.com
Cc: andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] seg6: reallocate the skb head on L2 encapsulation only when needed
Date: Thu,  3 Sep 2026 14:09:05 +0900
Message-ID: <20260903130525.28296-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CANn89iKUqjbrRkr68+S9nKAu49C3K01e3XSNwkY1NCgmuPMPag@mail.gmail.com>
References: <20260902-seg6-l2cow-v1-1-e823ce216454@gmail.com> <CANn89iKUqjbrRkr68+S9nKAu49C3K01e3XSNwkY1NCgmuPMPag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 2, 2026 at 11:00 AM Eric Dumazet <edumazet@google.com> wrote:
> This is a nice improvement for forwarded traffic, but locally
> generated TCP traffic
> is still hitting two expensive reallocations (second one in
> __seg6_do_srh_encap())
>
> Can we combine needed headrooms so that only a single re-alloc occurs?
Thanks for looking at this.  I will send a v2 with the combined
headroom.

One clarification on the locally generated case: seg6_build_state()
does not redirect the output path for the L2 modes, so locally
generated traffic never reaches this branch:

	newts->flags |= LWTUNNEL_STATE_INPUT_REDIRECT;

	if (tuninfo->mode != SEG6_IPTUN_MODE_L2ENCAP &&
	    tuninfo->mode != SEG6_IPTUN_MODE_L2ENCAP_RED)
		newts->flags |= LWTUNNEL_STATE_OUTPUT_REDIRECT;

Two reallocations do happen on the forwarded path, though: with a
header-cloned skb whose headroom is below the total, asking only for
skb->mac_len leaves the second reallocation to __seg6_do_srh_encap(),
because the cow that unclones the skb does not also make room for the
outer header.  So the combined headroom is the right shape either way.
