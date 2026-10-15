Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF444F0559
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102543; cv=pass; b=eoAfA6Yy8DLkevagWjQObnT5jm8v3tNMbhCf8N80XhZX8hBg1hW+RrzA8yGuXKpZslPDaU2XDmdo33nzLboyLZ90UlshoPMhXPiiELMOUC0S6Ubx1BBanHTnWHA3mzXT97KBZai/o433a3Wa0D0Pic/BH8Ilta3/JHFVWxPZaBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102543; c=relaxed/simple;
	bh=zanHTv7/ZyeQZHfsKPwin8RvJ5IaN24s1ZpGmgQs7Iw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i/hi167HArcPV2nU9a8n4wVcM2weezeGWbCJ20FxMw2jvSjZDBev3sQEbo545oz9PIwbpXj0CQT3V3Wd0nchbm3rCDpSmY+h6Nzf6D2zxY/yYyLuRisjuO9qu5z3j4MrcGxwu96PAsPkDfa4H6p8RTIAKAOAR0KOVOYJUKrMftU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdsFIoAz; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdsFIoAz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so731985f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102538; cv=none;
        d=google.com; s=arc-20260327;
        b=mbYbyr0XkMBa8CTl4TUIjnsTdFvUWCN3mps740aH4XlrL0qQ7ez0ZDNECUyLyMT2YA
         Gm9w2/mAs1JoQesa5uj8arUaJ0Wldjsc4Gd4q6A04w9KNI0y8By1TwH4BgxH+mrj+7uT
         wLlW5KNFPVgbEJ+rzVn+hQ4JZ9bEuiV5NFml589UyDh7jNJD7gRbX/S/3b6epk9Fuw8j
         jaNmK6gy3wnnuW9Wg24YhmqAT3GCsEln0h5bt1Esi0LQn8l0+bh49lgHaPxtVKeTwrv3
         xk9rA48iiUQy/fkkopjFQX8YFToD2MNCsw9L2IVvAC4xBcDmqXPyxqwmd5w8g+WsHgDD
         WpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mY+ZKTXmFpVQKg1buOuqoKdlktkLZpEVgeGpGNQXfgA=;
        fh=48FUrxsB8xbjHCkbo2h4ppVnTFTJwRdnRnztCmZaB0w=;
        b=EzwzLO/xcNR2YeVp3JJGWnqq5dmo8ovfxSPSBPf6Lvv7jKq1Rfe1fDeM/itZ/2iHad
         qK2F4ADzdBR04m/hOUL0qVIiDN69+bnhtQFBgi28PmqNKHXzBJRFPpFObRkccF7IUkI0
         qTX2gAEl+yW03i12ASagrgbdhgpKDEIrkuaRMepuGtJtNawo/S0HQo3wr2fHOPRVtP46
         pcJ2cTDo+8Oa5m6yzpt12yEhj3JQnZA02ZiTv0yJ6ZiMof8NlEZQhgcilZHbJmn+YESR
         SHhLPMKxQNNO5V10/TmRDLLEXU/HrOGcpLFZdF0egmFk1jZRBZeyOwTsdNaagf8uNlV4
         W6zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792102538; x=1792707338; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mY+ZKTXmFpVQKg1buOuqoKdlktkLZpEVgeGpGNQXfgA=;
        b=YdsFIoAz5tMpNxbL/HhMHEZhsXlYk/M0bZSr3AILBnLvNWnzRvL7yrH9GveT4YxPf9
         T7qKZciCJGtjJvpwFHg3RRuwugWZLG6wFHiSXe/YpR/0wJw8l2sUPMHOd4RfIgjfI4M7
         hiA13qrgpAjabUATywgL1f1/5NW6C+igfmnRV5dw8FBahjYJlUlA7H8ksshuk+Oz2/2S
         XT+1CwMnkhl0GBMuJ24WE61xAimgqcTRCSnv3Taxro7wUeK0WZfs+J4bUbq+Eu1AlavX
         Qskt11sSb65YQhpuxHG/V87JFp6DC4vf0nxWPQQEk3apOx3/zpcJ+p0FNslxWtrOaXAL
         GCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102538; x=1792707338;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mY+ZKTXmFpVQKg1buOuqoKdlktkLZpEVgeGpGNQXfgA=;
        b=RInVDZb7m+gWq+EUAbmi+/CAy3xGIp1y6VdRs/R6yaemyGwysCTMF4+ROXbM1Jwepv
         IgDsjuA8df3WJlWglnIUuiyGNHQsxRWsYFnSCWGld1pW4wC4UK8B0xKBS7l3hCIeKx0P
         l0zN0HxHX0EjK5FLWXx1xYNBo9MNN8R3GOw4WqoH40fDAkwpDyPVxyVp1p14Vf7QR5Vb
         nayshWPGIwB8+j0kNqinBE1DV+2mqk7O1VzKiC7+GDn4/Y3OEMdBekkeOD0ZRi/NweB1
         fDZnvZxsSbiHRON84l/LyqXIsVGrlOzE7mdmmjCxwyrZGWd1kvt1z3by4HQh8nAj5WHe
         ZvRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1KmHRr+KND4dNLTi8OPgeyAoBsiygz42pLMNjoPg+varBoqKfrjO/53e10fC0ztMJG3C2fsbfjb2R+vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcXdo+mwK00DWFgmA9Bg4PxNnvHLq5YHQk5209bXMjW0E7iglG
	9Rj7VwVlxkDWe4hROyAyy42ZpaUEFkt77MbnF5UwN8hgjr5MBUIP7Wr3qB1QU5m79qcOg5QDNO2
	v+HbUQaSDES+5eru7kjMMnodH9Jvq0w==
X-Gm-Gg: AYBFou1JjLJoYSf65D0Am1CAdyhVSbkLurVCAAUMFyt8oiaa506t6pp0zdTXvodNUm+
	zphGfGgYt1KWrYaGodL2CdMu7ZEOWRaccgUBPQgobQUyD63TCdR4MHafvbDrjEuhOvrg2atNiMG
	3EwNY2Kz8A+rEGhfSSkRB4NdBBzUOK7CcyDSqzopjaDk0pnCxt+nFDLpYsB+p2U/mEqtQ87IzGq
	+Z2HoyOYSnF6N5efw09rVEPLDu/pWffo93FcXSs9YBPPP7ls5gkELG9RlrJ/WsExnBOFqtxQ3wj
	tkTQz6qZsbJG6jmtqU7WzopnEPz24X/yCIssACgmpK6/BPnmT/JAdZfYEsYUc6LEfiplGmR5OWv
	uqjdoPy1hmeMy1iTDIJPFNdFD+zKB8cr7Zw==
X-Received: by 2002:a05:6000:4b0c:b0:48d:f3a5:4563 with SMTP id
 ffacd0b85a97d-48df3a5458fmr8712443f8f.20.1792102537577; Thu, 15 Oct 2026
 15:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jon Harrison <jonerickharrison@gmail.com>
Date: Thu, 15 Oct 2026 15:15:24 -0700
X-Gm-Features: AclHuK9akDF_HJC3l9c7A40e1CwGae7kkonYhBpFQpvWAgTE0uxWO6bwEHSJbw8
Message-ID: <CAEG=48+jRv7wHgd-yPTHEf9YFO++XusKQgT+WJz60hgCE8pGww@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
To: skbotnl@disroot.org
Cc: david.rhodes@cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, perex@perex.cz, 
	rf@opensource.cirrus.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026, Stefan Binding wrote:
> We are currently awaiting confirmation of the correct settings before we do
> so.

I have another HP OmniBook 7 Laptop 16-bh0xxx, SKU D2KR6UA#ABA,
BIOS F.12, subsystem 103c:8e60, running Linux 7.2.5. Both CS35L41
amplifiers still fail to probe:

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property
cirrus,dev-index: -22
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform
not supported

The speakers only play through the Realtek fallback and are very quiet.
Has that settings confirmation arrived, and is there an expected time
for the quirk?

Thanks,
Jon Harrison
