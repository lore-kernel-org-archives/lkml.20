Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F2D3C4169
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304109; cv=none; b=ahWNcfroSLl1H1/n28d6E0lzqlQ41woSxFxatnQfIeyzi3il4M3A2DTHOEoNNZ4FJ5ySIqlap0TAaeak9hG1sR9FnwXEt4oit3hUPE0D1CJdRvcTV9qUFbXMiLccwLBf09Dv+j/1foJEX4KEqkQaLcUv66yBEdoebL1Lz0KoPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304109; c=relaxed/simple;
	bh=dFRO/d/6Wl1NjIou5Sj9HlQFKiI/UvFn2/HqnF5nYY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ol2lxzOHGaWwGIEIGzQRB6Vu90ES6UwguRcgSlmudeBDDk4T1/OjTN5D9NC3gTXZtTwUtZOmIGu+B0GbomEgEr15dJPr/ggsFOoVEowBtV4sqEGSvnVg5c3c3sOWskZNtY2I3t1HWSBafIgLVzv3N5u0gALgNJV1rZRlwmrTg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=h3PwPNQe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="h3PwPNQe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e942864693so5260755ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304107; x=1792908907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRH5Jy551mYfc/WkSOrU9rJBVCAUTwu41wYys1NmakA=;
        b=h3PwPNQe7KKjKgZVpIK7synCo/UDTN54hSCWKXRywMpEsFftUOAPh0x+9S8iso4LlP
         rAitp2FcPWnRQWCA1pS7oJuxHgLQGLFxvvEVluYZ8SBu6nz9R2rfsAS/hzlqujcpPxT9
         VmCbtYMuMEzzFmbRkR3b0DiLsgpoP35MuS0ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304107; x=1792908907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRH5Jy551mYfc/WkSOrU9rJBVCAUTwu41wYys1NmakA=;
        b=hM1Ia8VqsyiV8GXIW/ws7zZQcun90aGoRChYe8w95g98teQPbDSEGnj17ySG3RPHme
         DgP9xP+eErczKAi1cBi0s7ml+1kCUz+k4CC+le0ABXtv5DZmAHfiyBmR5c4uZq0D+zlv
         hJ/iwaFn1f5auhdSWaH4SGVk9zqUOQOxgQIo75Yg88YtqesT0FTYC+auZErmZKIB+z1i
         q+oruRc9nbaVmQe/HjvKy6F4ZQMAtX5+sJg8W0tEKG339jcOweLwXymD5ZBc1SgS/z/Y
         E/ycuj79BOkVObjKOYy7gM+/8j8Xfmh/oDJlGamkH24L4uR0xupvRmE4VeiOxO6p2Zmg
         oFpw==
X-Forwarded-Encrypted: i=1; AKwUvBxHwyxfrpkJJSPN4FyNWZ4TmSwcPyD/s7CKQXn+dtftqEc9LWCosM9yUbC9szOnb1u7eTq0W47jDSp56tg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+WVc6KJMCGvSxVbnDQPfy2O2TZxtaRef6S4XqjLziFJUuthcM
	Hhfdb+7tvV9Kdu7AE6AW3cg1VjByP6aXb7ykNVNK8WUV+M59BK7O/WmzEkQR/3etqjc=
X-Gm-Gg: AYBFou3T+eKzdfjUy1EF1yEBzbp3V2Iq9KJrfo71WgtVk4/9OgVC2QxQJA7I4BxmSmx
	FqIKiJjmjDUlIebQy14qQWyfazjlTat+H34rY4mEZqiSmdLH4h7/QWJ1Drf6CQWeK64FZIFOlY1
	CafPv0wx8mvS4om6fnn35xLLrMGAs/MyXuYJUIwBjlVcf8h1XWePb38ZwP5yLT8oiTavw1wy/EL
	almrkrJEKK2yYH/NxlFxO+w7ooahrYqSuE0Mev9etRlCqnGqhu8lXIADd1wklQ0pzpYHLC1T0nA
	VB0Hrl6szZrRbG/3eCbqHCfSjtNI7A9SX8HWG+jv8CX8nXLK7DdZReQwUpZeoW7vta374nWxnvv
	LXIuy3K4uMxFDU+q4uTL3T/7rxo9nmSdT3rPLkVF99QURvgull9SrgKaM4UQZ7+97Qre3CEus+L
	m0Kv9n8h+TmkOkvRACFLPnLgBMySohYgZ/5b//TWG39ZWXeQF7YqsLzxheLM9Fl1tdgcHL+pKZ9
	4Je0rPsmgp+WO8Cct4jfMHF9hoHpcWoQJ7hsUec6vgBPa/uLDmelhw=
X-Received: by 2002:a17:903:2f87:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2e9a69e4360mr42362815ad.21.1792304107338;
        Sat, 17 Oct 2026 23:15:07 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e833f1asm26464945ad.43.2026.10.17.23.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:15:06 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: netdev-bot+sashiko@kernel.org
Cc: 98lawweijie@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	law.wei.jie@gt.tech.gov.sg,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	woojung.huh@microchip.com
Subject: Re: [PATCH net 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Sun, 18 Oct 2026 14:14:56 +0800
Message-ID: <20261018061456.18648-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179229346399.3135.12116533277810426921@kernel.org>
References: <179229346399.3135.12116533277810426921@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko is correct. Will be submitting v2 with commit messages changed:
- with patch 1 a zero-length stats reply is already harmless; the remaining
  leak is a 1 to 187 byte reply (the counter block is 188 bytes). The message
  now says so and no longer claims the counters "stay zero" because of 2/2.
- it says that 2/2 depends on 1/2 (otherwise the leak moves to the stack) and
  that both should be backported together.
- RX_ADDRL/RX_ADDRH are only written back for an invalid address; the heap
  derived address is written to MAF_LO(0)/MAF_HI(0) and set as the netdev address.

pw-bot: cr
