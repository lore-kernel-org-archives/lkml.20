Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDAA3F5BE5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682822; cv=none; b=OvMt5tQ66VOzfvEJJ05aImDK5Mqi3vJPr9qjV3fbcwWlM6JQu6QUEWZjg6VXVEVFXOe9GL/B0epiNAgjOQ3MvWsZsQK42P0wMU0HefkBgdtVpvF2cFY+H8tLvBXvqh+m7t1Ro8nkIqKxN7t5f+adMBt5HJjHR4zAyeea6xofufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682822; c=relaxed/simple;
	bh=k/46rd7cvC0Orx2Im4cugtLKMvwQQqOCYqTZRcALraA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUXHfTNW/okobG+Ob3aqq+9PFGwaJR5NuapavVGThwKWv6yJuTf2hwRiwRYHIwo/F4ms1LHEOHUlSKnxfomhsAxJYi4PmhAxIybdBpOCFKFo2D+Hn+ix/V5BF/8MIHxqK7glk0OyLPn3Oc4RRCVNoOO3zyl9bgCGQqrq51VYPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwW2vMy3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwW2vMy3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e257a23aso1649817f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 01:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788682819; x=1789287619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/46rd7cvC0Orx2Im4cugtLKMvwQQqOCYqTZRcALraA=;
        b=FwW2vMy3Y6OX6qxEXhuqufr0qz146QlrtA4T7qv1rwstpCr9rjRnQdR+U3WHGbuqMb
         f/01Ngr/ulnY9KH7DjpKw6doJoBoXBXM1v8GWC2b749Yb+9P5VQDXORsDI3sZZ3y4d3H
         MZBAzaHTCOJ+wkldxvMFpcWcX/uOW3qEj5HzahpUUxXQ1M1F79lKOs+4ajpaIxM3bvWG
         xK9tTs1X3RilTyDbPp5co7dpbU9ASkd8bWMoAz5ZRC1E+IgVevodNHR7PONfjBKLZbhA
         Wgh2IdQT/jtLp7efn25CjQw5jGq+HM+CG8m6h8mp33SX49XJp7fs9Nf+EHjQtlGghIx2
         JASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788682819; x=1789287619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/46rd7cvC0Orx2Im4cugtLKMvwQQqOCYqTZRcALraA=;
        b=DIS/+KFptwkF6jF57V8amrMeil7ga0V3JoDoEQXgDBPzLgeXheiTnvNxomXyZbCH1l
         iHgFH/IQ3SKS1Q6iM0tZKI6qV6RmJgpEM89msozQHm4LYx9YPr6Kixk3n0DDNY/qFJi+
         uDEciEkFqfc71/ZtYP8e363bDXoiOJvVptDHbWllIRjoYFCGALbDloXM29N7TSlON/bw
         a/NoteQrQRBQalolUoy+w25Vsqc8biYNnQ/hX7ZiW8q3QVzcqYEsNPaJePJGTQ638ODP
         f8k2ixam+uDBMUTQi6XqMY+esNeOO7tUhu1OMVLJqwPj223yEjKVH4VXuPYIn6E10Rrm
         PvyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5FwqXyqk98kem5DcQzp5MBbT5Zf+Y1QuLlMU79RsVrArKvDaACOQqClDJQVAMrQvPu2dQ9VB5nIvYxXg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgwlAL3WnrNs+yreVEbot3CGT5uiVGikI1bCS1g+Ls6Pk5Iv8f
	F+OVv7WJueXNkwTkGdtQJlVs8A6RgNdAnwxK9LzaaGEKQ3fxgcD9aHpp
X-Gm-Gg: AYBFou3p0Y1pOBM2mj8SOA6aYTeHTAykk2r59YnHCXWlOQAziinZm9z/dPnbqQdA24O
	VEtbf09URc94sSDjmjTWsCESxQuelm4zkwg6CRAJU+LCHTPa9By0AXzPtINN2uGzuEkfnDZMc/4
	Zfd0ZdrefDhyjMToR0s9cF9HZIZXvuCSix1zYimSPz6B4t6gZTwOkt0t+95RuCeNErYPj6XxGqM
	99+QIVJY5KpjXqebhm8r6Wn0/iv3Gcy/Bl3kf3bk6js2QA6dJ10gOOkGpzmwdRm1+l3tUXtD48m
	Q9tHfc/XLdHr9Hu3ui5DC9m3+j15fWtJ5gj8T4gAAI4a327EnsHSKYgnVi23eVGTYRDV8kuF+ej
	QCDUfaAPe8y1rj9pVdLNB7BOb9EpZgx86wyCpPo0nC4Ir/fic4+q6w6Om6sq/Trl/r/obsT33Tr
	FPunYnfvoELHHxwWMO6agpb3dWTjyvH42fzP5YFxsDikjp5BjZwEhlDTs3ofNy9HGo0A==
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr117480115e9.26.1788682819131;
        Sun, 06 Sep 2026 01:20:19 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm123450485e9.13.2026.09.06.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:20:18 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next v3] wifi: rtw88: usb: route bmc frames via the high queue only for DTIM delivery
Date: Sun,  6 Sep 2026 10:20:17 +0200
Message-ID: <20260906082017.909554-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <070f9724ca4a42a0b64bbf63724d8cdc@realtek.com>
References: <070f9724ca4a42a0b64bbf63724d8cdc@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

> FYI. I checked vendor driver. Normally REG_ATIMWND sets 0xa or 0xc in AP mode
> for chips.

Thanks, that matches what I measured: 0x04 already drained the storm, so
0xa leaves comfortable headroom. If you agree I will add a small third patch
to the series that programs REG_ATIMWND to 0xa when the interface goes into
AP mode, as a complement to the bound and the filter (each covers a
different failure mode: the window adds drain capacity, the bound protects
the pool if the window is not enough, the filter keeps the ordinary chatter
off the beacon-paced path altogether).

> As you saw it is for TDLS channel switching (timeslot sharing), I
> don't think it can work in AP mode...
> I will ask USB experts internally to see if there is an interrupt
> to notify driver about TBTT (or beacon early).

Understood, and thank you for asking. If such a notification exists I would
be glad to prototype IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING on top of it
as the long-term solution; the bound and filter series does not depend on it.

Mehmet
