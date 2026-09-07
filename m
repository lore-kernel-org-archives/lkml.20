Received: from mail-pz2-f10.google.com (mail-pz2-f10.google.com [74.125.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D62C408626
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763804; cv=none; b=uie1FBYfk4O4h0lujOyRYY+SLuh+YcdHY6LOHam3iQwU4BkW1zvBsqcbD2gfwccgvy7eV4fEtJk4ES6P+JAM9+PxlMcgF03NK6mYqHVOcNdhYmsRyWSondYz92bjPX92ND6yAs7cepqZD0AvYjM3mRimQfpo6ap8MQjB7drPk68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763804; c=relaxed/simple;
	bh=7VFpsFqN5hv0mth4uo6pwkDrjHr3r43bvKIwfuyBXOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXOlDtthza+Tkmi6r9suMn7MDzzxEg1UFsBJjUM9bKfwL1cOhIEiphKcT0d/5u4K50Lu7dDb3TrFmPcG3MWpRjO7lFmawLMipCxMMFH6W/nTlf/QGa29PjrTkpAn0Hl5klCULAwKZxLNNniJQwaEZQZSxwmWYAG+G+8OgUYAUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOFgbW1c; arc=none smtp.client-ip=74.125.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOFgbW1c"
Received: by mail-pz2-f10.google.com with SMTP id 41be03b00d2f7-cc1c753b1bbso488405a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763802; x=1789368602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VFpsFqN5hv0mth4uo6pwkDrjHr3r43bvKIwfuyBXOU=;
        b=dOFgbW1coX//rSqcm/WlT28w+mkxdouqP5+pwzjsQjN07YMu52f79QTcFX6PGjGfGO
         UFnYR6BvTMk0WE/PhlYmToGdNDIRmURh5z0xrXqfdBiamHUzc39M3lCCGJgIaWjJo7wc
         ovvxvyVQHSG8ft0EQZSXyK4n3/071UF1jeLjTzqyMS/de/9jKTm/KsRnvzRm9Y8s2aQu
         fKEBA220K0jSHgid3lMa5ANGOALZEzrGyqGVP+BXAKXPAxk3Lu/3vO9uMHAd9WTtq7va
         0WvBEKoVVJtqny//MfPq21YlLBjYx95OwtPyy9+JirpJE8RDPaJBQ+esCdeg0+mDKXO5
         KSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763802; x=1789368602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VFpsFqN5hv0mth4uo6pwkDrjHr3r43bvKIwfuyBXOU=;
        b=TLnMUXwbObqAvZmXaNmcFE+Iu9785Je3cGDoGRUTvSWCabQ0zRvQIlr0sSHsZNhFpE
         Sa+fcGO7oOqfbrmOLMxb3++fzZdRBC6lg7ucm6ODM8TiZGzOeFRKp1YnzxxaTRCHSoMy
         MkoQDXcYHUsCRX5UIDjdEeHi+ozQhuBQoiScUOoc9PnIUBzSFrqG9xo+JzDvEPI9zMzf
         DZt/AqtuPIeABPeRtLEPZdahWb/TmF9TeE93Ob+LKNChMs1x3ci3AMDzhQrBQf+CfpkZ
         9TkBsxvuD3YYZKcFecTbkHhSV5tG3fa+5xDwFlOItxRwPeRKH/VIgZeCUL3OYhuZ9vRM
         WgrQ==
X-Forwarded-Encrypted: i=1; AKwUvBysTQilSSH88dLVOj7M57VOXPizQRYh/vEwRsL7uMt9599H9mxXarnktnzAjXuyBn9LNCLYh7G6rkdnbWc=@vger.kernel.org
X-Gm-Message-State: AFuF++lGwgDIkio6thcdBlXgwjecDQKe83FKpSGQvT7uzmYRkwwlA4gr
	z2K7pjoRolQRONjVFDlPgyxRzDBANn9xSAHhtET/IeGNwS+IvBHOekES
X-Gm-Gg: AYBFou2Dgu3meSLWx1KKXw9GpNFByhNVdgdNHh9NxCTI2ScOml4O6lRpIHvSM2t35kZ
	/Jv0Svf1MUxu9j0/rmORT7tyFxWldLT4DtvxkVK9upGeCgYKrd6stNNdDe0ruBC8HlSHVlgN22o
	M4vzWtphDXtgpjRtQ5SVCERj/kngWOH6caZGBAs9A229tk0Wv51ost1TCrWRLBFg2NFFtP0haC4
	/qWqXwLNEOhtExM1mqcab/eWXeaAihuG8YJCqKRipBqZiBoLmTjaZqXo/JmpY2PEwsKEpjbbvCF
	5V/ZiV2IHbxveGqzNeEwGARF+CgOz75zsqWVY+l9qlBkyXv6hyrc0enTw36RG3RTTpf7YTN5tch
	iwXq4PWTcimEHItERZViZM3h52o1PUjn5ZyMZdx4aiggJCsJ6POeLW36BniltcNvGuQCTgjgS0J
	kH9LfM6maQwcVdIGamp0VaJuPQN7g399a9aW9jgXCP5jFB9hMWQRkFwgFFgFwFaygVwOZ+decKh
	UDSRwXU9QRQiHRKDpR+kVv6ng==
X-Received: by 2002:a05:6a00:414e:b0:857:7384:b5f7 with SMTP id d2e1a72fcca58-861692846b6mr31875588b3a.19.1788763801572;
        Sun, 06 Sep 2026 23:50:01 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152734e53sm3904452b3a.21.2026.09.06.23.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:49:59 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: extend folio state for large folio write path
Date: Mon,  7 Sep 2026 14:49:51 +0800
Message-ID: <20260907064951.2313595-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
References: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 13:51:06 -0700, Daeho Jeong wrote:
> I understand it is used to avoid failing in-flight I/O or writeback
> when allocating the subpage state. However, invoking __GFP_NOFAIL in
> memory reclaim/writeback paths risks OOM livelocks under extreme
> memory pressure.
>
> Ideally, we should ensure ffs is always pre-allocated during
> write_begin() and page_mkwrite() (where returning -ENOMEM to userspace
> is safe), so that the writeback path never has to allocate ffs on the
> fly with __GFP_NOFAIL.

Thanks for the review. I agree with your suggestion.
I'll remove GFP_NOFAIL in the next version.

By the way, I think GFP_NOIO is not necessary here either; GFP_NOFS
should be enough.

Hi Jaegeuk, what's your opinion?

Thanks,
Nanzhe
