Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513324;
	b=1eGORrMqQgfysZz8aEtXLT3sYa0HOImhXxqYCke0ksTEfKu0+dGJUoiMXn+lKKWVgAvK
	 zsr6GN/48gfoEWaQa9n3m/aCF2kuj0172dRFIYeUPRsKstfkvNF8AoqBvXY+ncz+0+z+6
	 sKHk0gbbUf5F/ApHa6JjAAeG6IaI2uxh+agM7dFvpnwTDrwpmPKRz0VchULnM5Gu/gBUp
	 X17b8ckk+6sv1fq/mVV3QrnT4RgksfcsE/z1/jBAuQFUuO/PA/PDij6S+RF091c9jIK04
	 hhDKMDSdPRpZNZnbW5zfKWrE0ddKCfaMqXflZt7eoBxn8fEZMhozQmFw2MUbSTQz7cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
	b=ajwGTeFR8/QBztLPDO6FWdtDfF4E/gfyAqMELBH3V58bsoQodNhrt5sLZzOol475OVuL
	 /wuMLeGvmYQ0VX40QN3qE+6/hhtchiWxQ5J8ap8Ix5/Vz+896NJ6vrdIwL1lQNF25vZhk
	 ZD0VZYxz9jqSDEx4S0KQBem1qfW4aG6CUY+lFdE6ScRK/sm8liPgSu5Dx8H/R3HrJgPIn
	 6W7MadJTusEOAMMay/KNUMm7De5AcrO+GM5EY9En1VJRx7jLwIIUzgn6vl5kiV19svE5T
	 8f1Q5zprSITlkWyU++D5MDxWZAxt1Ca+oBsHhtDhSROk+TjQgf8cMlugdBQiYpFvdqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gnPFKtLC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A48D60A260C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A48D60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gnPFKtLC
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac4806e210so23502227b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513323; cv=none;
        d=google.com; s=arc-20260327;
        b=mspbFmAh1Uzz/gM/PbUtULnIotGhhaHwoRxxl1laPHScFnf0JJ1g5WUUHdBdwo+tVG
         okiyGilS/PPKV1pPmmcKhXmUu0W/LceIPf0/ln1rdKqyrIrPxa7952rd4cDrpuo3z/5z
         EKxMhy7vVBXSxFxPtotv1KD3ucJouTlT9YI2r1XmK11oIqCtOsXNYPqCiufc1yBeCw3M
         v2o30Q8TmUby1jxtGctQypRUVID+3qu1JyRgYJk9E9YbOxAC+cckCZHGIEXQokEPLsRG
         1rjyfBvaHdcHEq2SVdrti0BeoYOurM1JyOyg20ZZWpuNHWRWn7NjlaSCm1XjFN3GFwGr
         jT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        fh=ldVglfpApvlk9rgYjSJ1WnYHwXhCR9+Huc/YvkZeY4A=;
        b=LkvIT57mtzXdw9ynkYGdEHebnqBWWsoo8HST6iOj5mhzmeC4hL0uUQO9yZlfejSxsL
         WV+TcpcIDSbYtqTnUHqF9uy4vz2AI8FJ6dePgAZNycBQuaepaUIlIXUeJo8uamhdPDtf
         Xl+PygtL6Qv4NPC+GgwohDkyHWwbz42f3gBEjU1OXpgzWp+w+VBRRRB2C6wbcMyDhzBv
         86Za0Y5e1U6f7QgKOvllRyLrSXnsnAKJ6yNCQnp04NPKWjY4+oMhMb5l2W0ShRvpOj7P
         YjAkhajsPAQJnn6LU80Touswon64cGhMKG9/UN7Ha7c+y4qUek1sb7tp75Mhj3DeaVST
         Bv8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792513323; x=1793118123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        b=gnPFKtLC1cxjedPI07dLFjkw4b2cRn7f0fFMWGzHn5WEoeoyBK1WecLrSk9Uy3OLNU
         pVjvt+O5IOxcIl9eAW6PfYW7LVfYmTMGIvNJCacag0E1srCm8hkkLUSlJpk9msY4bkR3
         pcZqggeK71hRIZPU7oG9y8ruCbQ/1RuYOyu2XVpgNW0CxRsopI+TtVEnZhlu4X9VDwoQ
         zWm1ylacfJJ5lW0qNEDNKfdVD+YRElhH+nxeAhAeNeBQAUfZsefiuoEc34YFOAzRiLgX
         jimchX6fSHTX5/SifDrHv+nz4Dxgl1A+llk0VBmwySudyIUFyABz15nfRG4F0nbouSB6
         TfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513323; x=1793118123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        b=MQdT8vy9HEe+gCularUcoBOCpxyHWgDUS/NpIYPljXyeTZRBZXyxUrl2tyJ5wl2VR2
         mD0DN7R9bYUy+60LbTqhCBiIHSDyYQUF7nBqhIEg+sq9f4SBfry8We3q87qiWjAkITbF
         XKa0z2XYQtNqSeZsCvOvO0PThRgiPnZOYFURddP4eaMF+ZTIAYHnYOmATqkyRqW0GP9x
         MzlpKtNDLkeyRBagtwMRhgnOAVi9VzC45gVrha7zjJIBdjOWA7TOXNHIQqS9srWG/LSA
         lmVg/5zDH1Ag8fhtRbvd6pJ9CVRWnajqbm93biMc8BBW8odgiztm3t7ls0fFsP8DK8Y+
         Uoow==
X-Forwarded-Encrypted: i=1; AKwUvByQ7ZGgJtwoaP5lKkR+9T5TK5l4fNyz2oxym+4+/6AumnRZXm/+PGg6UrBm9VAKQreirjDuJ61VOsjJbtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMMZ8h91aridelCzR3ZuzgkpnTdATIQzlTPFJLHV8jA+5MqaXn
	aMVrVTu6wW4hOp8Vwa7ONK5eckDj7pR5duYqgjPLMCY1NHQdAPNcFat8OEHdfdjbonOrJ/oFFKZ
	VISaC63Ak8iTxpZ04cWAT9/aNQcK7EZK61D4mlQkv
X-Gm-Gg: AYBFou3zP0KrRL0fjVnU2BmdVKtInHtgTnz31nzUFDnm9QFogZZdSNTSnKpvGXMEjc/
	qI3EpnfyTSoT5n02g+UiXJLkojuzBvRT1klcHUG7kC9hxKkbtyp16LBuK3O293EWuhwfiew8bTn
	W0fR1sWT+DtG/Ce1xwr7bi1o4xK3mkjXPDafhDsph93D2XqhlYw1FDytxyKbDVP0C4yniiiDAWl
	+ZdYnscX+3vHDZHiNA6xROFuDHGcJb/FnG5KO0jhxMATc4zdwtywjk571tiwvG16PwnUwfMiksv
	s/DFER0Y96X3kCj8qUXg1wl+glSaVeDp4PI50rThtYu4FPB9trAeRyjyHeVELztK541nVOLXtGh
	DQqPeoKpCEvCAr8UlRNbgrgo2MDw8eUrw5ePJZdPDSWKeCLrhjHbtpduxtfVj2Q4lg6ZgGGhY42
	jwgmK66dfYFM5HqbMLs1V5GkAUYSrkIq1G/+/fVM8bZOY1CwIw9zRYA5Qr2DukQ/xqpPqI3dW/n
	jsL51YspiMY7OQNv9fKs0idHddBRlcvkN4GXuMDa8vNZ1pMx6xg4s5qkw==
X-Received: by 2002:a05:690c:298:b0:8b0:cfe6:29c5 with SMTP id
 00721157ae682-8b0f2189609mr42132047b3.37.1792513323232; Tue, 20 Oct 2026
 09:22:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018131930.1116724-1-julius@bairaktaris.de> <20261020160831.2133912-1-jtornosm@redhat.com>
In-Reply-To: <20261020160831.2133912-1-jtornosm@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Tue, 20 Oct 2026 16:21:27 +0000
X-Gm-Features: AclHuK-kc3kyc5GKqkjHU7MJ9W5xa_vMhwo9wWG2suT1Jp0haBr3CNyjEmQ0QHc
Message-ID: <CAC1t37JurQdWm7+kvBRuAafTY88DudtmG_Y=oLp1zk6FKxSkBQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	baochen.qiang@oss.qualcomm.com, hujy652@gmail.com, 
	jeff.johnson@oss.qualcomm.com, jjohnson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	tamizh.raja@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Sounds good. Looking forward to it.

Julius
