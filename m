Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42591514764
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984167; cv=none; b=SjlSKwozeNWjURNPVvWr1oIxAbKc1JgeBmoIvvTh4CVzW8N8rcg4HE5EvinVJQppeh9UJJOC7eEZfYTUF/UHcEdyY++6a5AVuBNbqMy+uu3bik2bKSchXiE92zUhg+KhVbsHx2j/nN5R5xK1+wgV8qouIoH/YSLl660e3elin2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984167; c=relaxed/simple;
	bh=VxZoAljQg8X9g58/P0C0sY0HcC8zN88ektdLn/9pGu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atP7L6O0LGD9kC8rM4HEqBdQoW+x+6s5YK+5Z12/y4fUpJ6SKZNg+nO/7qX+V9/SLNXw3nu8XmKaX3sevVRdjIY/+xrHU6c/xc9LXSaC6sJmRB7ldOObSl68+q241OaoL61zpzKwXcP8QqdAjVaN7acKi97PFA3IDDQIUn57RLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKHsaqkW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKHsaqkW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso29522725e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984164; x=1792588964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hd38ijOM+6m0YlO9CNyRffd3FI0XsgwLLBKO8/eaiNE=;
        b=LKHsaqkWfIz4tCaIYOUogLDQfZbjLlsq+wcCMLtWoNxdNyrzCVSH/lpDfL5zsBa9Tc
         4a/0Ef2JSN20HFxg2vPsjv/jNsx+oPQ3x+xJeHCWeL+Kzi3vuPkeEj8ioiV2KOJXwWjL
         hScEEA6fedL8oNlqIOfHrIzBXvycr9FSGks6h1NgZV/iY9sSj9zpGGZqWRgnlhlf2Dx/
         hFPf1jNCDLjet8k1wiMHA0WZtdGaXS/S/kkhbF610I6qRvzNVuGIBrrRMpZK6EOFBess
         oNNKbYMIc6DdR4mBjFYNt9WWxOm/hUReBRxiIlVmihrLuPFEjoj7791kUSjKbR59yWGy
         eUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984164; x=1792588964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hd38ijOM+6m0YlO9CNyRffd3FI0XsgwLLBKO8/eaiNE=;
        b=1ri9FWSb8T+Vq1GHEpG5rWUpeglwc84CheJ4iSDOdY8sNbvWwRejFp/sRR5lORK64X
         kA3ldzoXt5RzgPjfu9LkrbF3m8bYqTeFdZ0kk/Qy8bIK3ytfBNHnPuHkpX/a1Wvd8Ois
         oKAjn1r3BWuiPUbq8PkjnbANYZAOQI0Ww2bM+hmMett8Zpb5SeixkAtDwmmle8GJc16m
         /7ZkKGmnUV2O3qRoxTC86EOnL0HRmf0Ds94bqBEjeJy90HdbVscg2Mngw3Y2iXq1v8vm
         ZpNXD1acAEgLyzKbqZP7dhm28DBkwordF1R4KrHaLwo7wX0jvPMbgPFVx5uGs4dQFTOu
         uFPQ==
X-Forwarded-Encrypted: i=1; AKwUvByPCEK4X0U/8nGLNZdLGHOzEVykx9uwLQUIoh8OoikcW3inA2ni/LOu8+o3hhwNxVzjteW6QnE7RRBu9QQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeKJUklFa8JTDxRAZ7JquGmbb6baMrpLro207SDrNOcl74/nSn
	uv6Jnz+T55+GKl7C9A/y1iuvA8rRpjIJm33LiiaaQpc4br5LCV4vf60f
X-Gm-Gg: AYBFou3W5+c0EseDSRUyc6ZDrh9WOZ/R998dIvyOTC+B9IIceevqC2V54YQALgX/Rfl
	VAZwupBXWCbFd+yTkPMeuIgMOGqYiTy1orZ2u5ocEW8StgxUZHIhegthrybp8zkl42zHPipBbys
	hRku3t8/mlBixoUSGjOnW3OyItuSS4x1dWiKXyjIxRnfBepetx/9u56SFS4DxugACSlCPIMqSLN
	6R8i80CQj7GoyeeXgNkPoawgz12/GtbL5dH6oSUJzre58ZaikwjO8A0RcHBiKTFKHqmoRXhJUZU
	k4/muclpiDYDw+sOfhyDKSg13wC3AN1QmtjSFa+Hmbn7DSh+m0GuQPhds0V3zppqZ4cQr9TrWYY
	ZOIgQRhb24mZI1jtnB4V2HJuMkFSZwOxnY1L8cyDEALF8h5WQPBAYv6lfKntms0mUgEze8Mbiek
	asbBax8oi/ub64cm0E9BcxANYG93LpBUwcKOR047tpcggD/RE1tr73MQ32u8rwVOQBEs0VXdej5
	kskydLQDNFNgPbI/dhZ6bjZ5daNGlYIPjBOFRL014hve38Bj0Qq1y9QdA==
X-Received: by 2002:a05:600c:4e45:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a18e4d8c30mr312327195e9.28.1791984164137;
        Wed, 14 Oct 2026 06:22:44 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:b136:6ba3:ec00:b37e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b489742csm34733045e9.2.2026.10.14.06.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:22:43 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Denis Benato <denis.benato@linux.dev>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 0/7] HID: asus: ASUS Zenbook Duo keyboard support
Date: Wed, 14 Oct 2026 15:21:54 +0200
Message-ID: <20261014132242.118388-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <424edeef-9663-4e64-a267-66a185b3df07@linux.dev>
References: <20261013104033.36079-1-p.pisati@gmail.com> <20261013114506.1697676-1-rebecca.mara@posteo.de> <424edeef-9663-4e64-a267-66a185b3df07@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 04:56:39PM +0300, Denis Benato wrote:
> My greatest concern is with report size: every device needs its own and
> hardcoding it is not an option anymore because no device can be fully
> made happy (and working): xg mobile is 300, ally and new ROGs is 64,
> some have 32, some 16 and I think TP is 15.
>
> I have yet to look at the patch that changes the report size but please
> make the report size variable reading it from the descriptor.

Isn't 5/7 what you are looking for?

asus_kbd_set_report() looks up the feature report with the ID in
buf[0] and never sends more than hid_report_len() of it, that is what
the descriptor declares, report ID included. The Zenbook Duo declares
15 data bytes for report 0x5a, so the 64 byte backlight buffer goes
out as 16 bytes, like the handshake, and the keyboard answers it.
A device declaring 64 or more sees no change.

No hurry, enjoy the vacation.
-- 
bye,
p.
