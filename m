Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026543;
	b=uYEgBI9YXb0EyFw3YomZfIaHpAd5qXv83ZSlwY2lO+rjDk+RMXI2e9ZfCx+DEEKK3rC8
	 9bbnsiecIpyEhMu99p4zhhtKIsoGgGFfaiWwWuWSHbR0NwzE2SJPa3DpW5xT0K5k3MI8D
	 N4R21Grdp2JikagKTz+KP7r5jrKDgMvFZtMn2Tf7ljGQgfS1z59ItudjdkhvJRIl8aofO
	 dWQc/z5fJztpjkFIWxtpWfTe5/gH4+ERzULE9RrgCha9bJm8GdPiwTP/GgfWgPKeCBokW
	 PhG8pM6VaCu0D1Y/IdWzCt2KOqtspGPqQNBaYpKTiGlP8bBelmPHAhLzl4J780YXRZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=N3UVCZ01NtzZBTQTfy6B2Rj4m9gham0iwhTudNRqEe4=;
	b=OlUsfLPixIcduv5qBGGvRl1JndibbAxa9KL3DCWawQzd9z2vI34p4t8RN2CqBrtN4OAp
	 GY978ElheKAn48FLuW5g+QmSBc6e6HCXt5gNvqll78U59cjEyteRXf1RbTTggQEIrPsTI
	 erjSgl+t/4bCpWsQQmXUYOZZvtttgQ5vZ3+hdYkeafmJSBHmVJSnbtnGsUtnAB191m7V6
	 BIJQUejxUaqBZOl3xHiKi6pW17Pjrk2w6afMgTjPN7viHQ5bO5TNwzqxF6ZOWqzrNvmuY
	 HJoljxRuh6TAaxiZbxtpJdjfeFN2AzZ77REB8ITF9KiQT2bcfAuDv0Yfx3tzXn9Z7kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ya7N+tEq;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5DB606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ya7N+tEq
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso665573a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793026543; x=1793631343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3UVCZ01NtzZBTQTfy6B2Rj4m9gham0iwhTudNRqEe4=;
        b=Ya7N+tEqw7L5wqauN62InhvMjZ07hzBv8z1qv4xYl2l7+7mOtjMxFicn89wJu8WQVz
         pVHjA1mp2HdRtfukIy/YsDoV3KYlr0G5uIegku1JE/42fMSxxJPmKtGDklYBwnkSwnI8
         TElChyK1/vUWAws789Aq0wc2r/GMyal2jK+81TKfc0m73RDr1V5P5Za1VVzQUNCedoqA
         478ec51dXrH/qGDIYhLjmf2T/uMmtN8c3aPqOKGIoiyNNn2Otxpq9Uo4VzNamliEKvoB
         Dg5S3jC5fM8ztd4zHkXjLifKH00SYCtNXc+pmNaBbQtEdgWdBOS4Mg1srpwqPYC9flbK
         aMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026543; x=1793631343;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3UVCZ01NtzZBTQTfy6B2Rj4m9gham0iwhTudNRqEe4=;
        b=ViC7/hBHgSPa5R5Q5Tkp34CTW3RN6cDZiGka9BOD+6Xn/fzJQVK3KCe5CtW+TBxqmc
         m1z6dvpKF7V79GTDyzyNzaHwXb88yfotP+/Tq3qP9iUnA4E6K2pUaggKOgVCwX2YiTye
         a3Uog5AogP+cqJETDLUWAppDAcV7265Sibm8ltmCzOHXqJ1a9lvcTGoGhsv00z86ecBN
         bT63BVmmYrP8z9MRtYSBR82BKlg6a2kwxj32SY2eRlO2cKLmS5927K5VNn1rQTFzBPfj
         Y16PYb5Jk7vCkaBe01DND6XbYWqokeN8aqQDbE0GuT4AJVoJzGphjjYwPeG6j/IIBnBx
         /NXg==
X-Forwarded-Encrypted: i=1; AKwUvBzmYf3CSQznLPmT6Xt2dHxwJs8hKjN4yNqc8ybqjRTkhfVh0BWztJydu6luLp/NsXH+WquYEw5dxdUDS+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfBwnBsSJEzNgPqdh2LCfEGNkTRLLxFNC8HMJGHhF2jLnl8lyj
	AlKDqAC4WltsR3mV+DSxOWNMP2TdC15UK+rqWs21v7s9eooLQ1Xb1fqk
X-Gm-Gg: AYBFou0iNFrSd7JHBG4t3Z9Q15sSlLTFsdnOgVvwNUrFbUvMhfJlsMLMvDRRqSohoBM
	PcsXcB6s+nWk1SWgGZ+pVq/8ted86IMzEwa0Vz97RHB6XxmkDkPNP5+dkyMSHDleRASjJe7SAQu
	oj94q7KUsQ7udTRd0TIlciBiTbtNBLpIBsf3FLYJ6nVFwY4A9ld7Gk8TVCWjV3oy9Jx9HevahTM
	G/VklZeMp9OvtNh8r47orRpuF+bWvSxqt7tar9dN01B9ZYaxVYJOGqVVyi+GRSUwTCNNn2zHb2Z
	LNkZuYx4uBzCB/jYUKQh22vQ7aX2SYk3emPWaZmEBNwkWk8Fy+hpnTk+ElXo9DgjvaA/Ai7Kd94
	M5hESHarQBQg+NU6gnJdwOls6Me++5xsTssH2RnVxSFoOxDeDtp27NaHExnQaLFeGM4IHubXFaE
	GPvHMGJDKs0sBK2pXjZSevXef/RnonZ5Otw7zmDjvKQkhi01xI8m0N7/SPFHDEC4U7qFBOkL2Ep
	y+7Cm58J3fiKVgKWFAk881oKaNBqbyUqoAQJYADLxTlEKYNTeglGf8ARqT/bkTOXKMt/dDtltOf
	g7fcZ0mTr5XRNJlO
X-Received: by 2002:a05:6a00:3a23:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a367a2e5bamr5994625b3a.20.1793026542774;
        Mon, 26 Oct 2026 07:55:42 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2300:286:8580:7ae4:15b1:705])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36b469507sm1361172b3a.31.2026.10.26.07.55.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 07:55:42 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v2 2/2] selftests/bpf: cover AF_XDP multi-buffer TX software checksum
Date: Mon, 26 Oct 2026 22:55:30 +0800
Message-Id: <20261026145530.46896-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <179293961591.3134.5478895656850588086@kernel.org>
References: <20261024141157.59301-3-testwrzwrz@gmail.com> <179293961591.3134.5478895656850588086@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sashiko,

Thanks for the review.

> Should RX_MAC and TX_MAC be copied here? In this file they are text
> strings meant for the ip link commands:

No. This is a regression I introduced in v2. RX_MAC and TX_MAC are the
text strings used for the ip link commands, so copying ETH_ALEN bytes
from them copies only the first six ASCII characters, "00:00:".

The root cause is that I reused the ASCII macros intended for the ip
link commands as packet bytes. The test only checks the UDP destination
port, so it still passed with the wrong Ethernet addresses. In v3 I will
restore the binary literals and add an Ethernet MAC check so this
regression is caught.

> Should the condition be retries-- > 0 instead?

This check is pre-existing and not introduced by this series. I will
send a separate patch for it rather than mixing it into this fix.

Thanks,
Rongzheng

pw-bot: cr
