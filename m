Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42AC52122B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175872; cv=none; b=DhK34ZjZQqOID+yh6S9i6kzwLJOsx5kdI/x6uESaW9W6eD1m+5Iu2ehtdDwVaf4kdc7g4Cyqzz9sGcJVJaLb5Fy4i10H2gVuOxZlQeRS0yO5OFnUudPdpI+2WBzE1A3pWQW0QV59P5DNMbHw0pRx/e/rcYiqkyJdQ0iOoz9467Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175872; c=relaxed/simple;
	bh=FNdaQtDLXPhBhDneZAU5Xq3VTmYyqfMdIvCqNB5oh7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0Mt3jCg2EvZtBYMFOHrwWneXALkPT9sRL/Z3skDJ/M2H1165ThoiC2oO2/neet9TPHluRH1wdDtE0fBq/osHFrCL6NiUaFXpgzf4yhJuJ2e6xP0BDLdLlQEx3SG0QpyQamVQWTfHXQiiibgit2AhVtXnJ9i1iPGW6cZXn83F18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKtqr3E6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKtqr3E6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so5830635e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175869; x=1790780669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHYobJCB0QM9EQB8543tguRP7m9oT9qsRVNrSacw7So=;
        b=iKtqr3E66lcWq5nTzK/gLhvX29zHjM/fG0/kOZJQc5lKqsk3M580WEyfDTq+DUlfvT
         cio1oh1GBEgDxTX4Omm0nOGP0xTmXcO5tX7zDbfnQtejlCMwsdrX3hrGu/tR1d+SDnsF
         I0epbhIoc0nmWnTnTtvkobMf4/YhK3parnLuLLZByyGcCzzdtGhM1pyQ0mLAiavxWZAr
         Bb/kXVeuiT0IwxaDIhSlx+V7M1RgTbcwuEsDYzfo8AL/d4NKYu1lxQ7/ewMtJ/HKDObT
         XnUS+sx71CDvSIS3hdEe+KHDBiYyba91aLcMlmiuBN+Z5qqPM2agznrhx5csEF+uAGzn
         5bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175869; x=1790780669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHYobJCB0QM9EQB8543tguRP7m9oT9qsRVNrSacw7So=;
        b=kFOItn90xrgR85tHvoSJ2xajUKbZkyXCd6pGKkSPeJDCbGAV+uTL9ggJic9VTa4+0g
         EukmNxQygsMvAkB+TfKiSpfJ7S+rUWkm0+9vIYP9ttOg7ELnjyuT9weYi74RuAgMP8Uz
         RJzVXw1sXJG6dCtqU+iAPre+cK/oUQDrWrROWq4P1qMANZU+9mev9ZtHKUCzetd3E9I1
         7m0YTsHhBloxuL5fAYurryj3fibtaZK/bNBtBaeKbEsFGDvbEfzYGpkRZd+0jbRi9rwX
         nncKjVqh0PEiNbYNpmLWJuM1UcQQb5G4ougDOV1MS5x28Pv3Hd144nwXHqsD8DTy7kkd
         aMlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE2JRKmsP+Rywl/vwAhCPwREL5cAl6wSLt6Px1DTAWb9KVz40XX4acfzNG091JqIfjw9t6r0dOxt4tm0s=@vger.kernel.org
X-Gm-Message-State: AFuF++k6QTegqRx2IlKHSkWaSdvaWW6xAp52d75f4OFrW4ZfXDH9xRER
	6urX3Q+ZTafIQH9VSoe5Gl+IHN45fSBN1O8qEh5E1Qq7jkImKaswBBoL
X-Gm-Gg: AYBFou33yHnT/r4JXNn2q6vciQVGLrdUWkuWr1PUCDS73IbinyNjrc/QQ3UqN183oRI
	LVOjKBmN5XUVodHpiJ6MUomSik1Rr0a0iEimhAJ6owD+0ta9jo0EKntmOQGczg26Nb74XkV1w7x
	ckp5h/975WzKh64cGH0o5Op0Y+PCLRYCRoNXFZ9jBVoTfwOAbTreQx+B472kBviZmxrR3qkuMPd
	BvEFwcS3SyodWmvQmkoNIBk5FDD9x2kGnlN3Ft8Hr7hTBndg5o0PUUuwlbJtCY8ymA35gqK5+ud
	Ts6rR2RpL9iunOJueBhIZJsSXQXMdlJ+ipd1Ceqq5x7TiNXkC2JMx3P0LILrKNo5eS54jb+1tg6
	0QiVeyee6kHkA/wZuNNnfkTWdqYtqBeQRHP+J24wAxJ/I9fQpX9wS48f7D9+V4RNswyLJy5Fbx8
	zu04dtN0Fg+s9vOEjBUbuzdXs8MzbZPX9qSqTt0xI57PRBk+hK4vSnd3+Kg991jyH5BiezrpBFM
	qZgqH5UOcVEhf9ltfUD/1ou8OgZ8+duWdQIoNE4APQFr+8LxNplRMPWe3o47ezqof+Q160YRnXr
	2XGqUSvZ4kXiLeVyhlSvsoo=
X-Received: by 2002:a05:600d:644e:10b0:49f:e441:d61f with SMTP id 5b1f17b1804b1-49fe441d6c9mr12105775e9.21.1790175868945;
        Wed, 23 Sep 2026 08:04:28 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:ce47:40ff:fef1:ce77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18093csm94979015e9.3.2026.09.23.08.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:04:28 -0700 (PDT)
From: abkarada <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	briannorris@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next] wifi: rtw88: pci: recover from a stalled TX ring
Date: Wed, 23 Sep 2026 18:04:03 +0300
Message-ID: <20260923150403.184831-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6f2a314798c64ccfbfd59ac8a8ee6e01@realtek.com>
References: <6f2a314798c64ccfbfd59ac8a8ee6e01@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the slow reply. I wanted to answer your questions with
measurements rather than with an opinion, and that took a while.

> > +               stopped = ring->queue_stopped;
> > +               ring->last_rp = cur_rp;
>
> Does software pointer cause driver doesn't restart queue?
> Or without changes of this chunk, the stuck can be resolved?

No. last_rp and stall_cnt are detection state only; they never touch the
data path. The only action in the patch is the kick below.

> I mean just doing this kick is enough to resolve the stuck?

No, and you were right to ask twice.

I taught my watchdog to rewrite the TXBD host index during a real stall
and then measure whether the hardware read index moves. Three live
occurrences since:

  2026-09-06 03:17   BE rp 0x00b7 before and after the rewrite
  2026-09-14 17:48   BE rp 0x00c9 before and after (wp 0x6c -> 0x6d)
  2026-09-14 19:09   BE rp 0x009e before and after (wp 0x50 -> 0x51)

In all three the read index never moved and traffic stayed at 100% loss.
The premise of this patch is wrong: the hardware is not waiting to be
told about new descriptors, it has stopped consuming them, and writing
the doorbell again changes nothing.

Please drop this patch. I will not resend it in this form.

I have sent a longer reply in the bug thread with the rest of the data,
including the fact that the stall also happens on 7.0.12, so my earlier
good/bad version claim was wrong as well. It also proposes a different
direction for the driver side, which I would rather agree with you
before writing.

Thanks for the review, and for pushing back on the mechanism.
