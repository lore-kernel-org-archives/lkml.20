Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A52DEA93
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547372; cv=none; b=WHLCaz6RplwMTalnrWk5pCM38jnnfM23dBslfzex6iuuMCrpPk3iHL6dCJmkpgx2fHfwlMoa3MEGYQNG9K0BYK9TbSa7tHcQUd1SfhDEPVwOWaW+2+jx4iCSWlJ0iXklD+kM8qSvBzl14hSjiftd8V5R+3Z2eQOhY/mJB1AbU/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547372; c=relaxed/simple;
	bh=mgP0U5nmhxHVOFGKUcGuCWBysre1xc+hrQKissKOZMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IXjnzBiYB0ICVTh0M8LAy+FVHmEzcxzY/wd8xk1dPMpKhzlXHfDY/iRC8qM12E4S4dnRAZTDHnPoAo3OnJXr6TKfkirr0SeO10N7LlIJuqPPLjH1q5lVwZNX0Hkm7ZVUqMIqXGx2k0I9C2eF+G/wJr2/zsg4ecs6MSzYT3UAzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw5c6vA3; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw5c6vA3"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso534531a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547370; x=1790152170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idOsVahZustf70E3vcAEJkdJDD+K7D4L7o1uL+BpNms=;
        b=Mw5c6vA3WYZFKuuhLcTK1nxO3K3AouqKATKiEjpd6F6SNM1eu+4SClqtgxbmPuS5ix
         7kG+zxqWjpdtusAxrH4R8enOCC9KLNYztXfzQBwe5gDzHjVGsahs4hB5zsqqxJm6fqEx
         ctxCd6I7mtZunoB5dhigv/BuSUS6KHFkzup7XyJiTqriLzHomH5ZffTGojHSj6LFbwk0
         05swiVCDrWizP6r8EJzy809jA+zEMN7IipQdBzhDRNrKIYJYEXpL3norJfDo6maStoVq
         b55nU2OnrBq3g6ZJJw1aaLd3zvk0nq+MpkWotMNOJUkE0x1w9luX+ingp9KHbmgulRln
         b3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547370; x=1790152170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idOsVahZustf70E3vcAEJkdJDD+K7D4L7o1uL+BpNms=;
        b=yKQHwZmGBIAyFzTYW10q/y6t8ZA/0pRBj3EOYPOOuMMPnxVS0CgkvcpFeVGjdJTfm6
         lVBVkReSfGefN/i0VxxvJjgqf3Wg4Y2y9dYLroVigsLN04iSbaMfglaYrGohh1K/QznH
         YCTEi9P7yFLbl7mv2/zoiFoJ5kUZ9FySJwd7hHar8BGIhrsehl7ZkPkE/Ov7s8mJR4Nl
         9LHw7vCsJT62Tj79jdnOP3osOyIXKyqIfHOjTeBBPk1fknszX6T7blukOWUHzSpECDUk
         CGB3HjgrpSYMws1wRLH+l7Lr9i1asuJFmhmPqlf2ZQDK1QcT7raX58YT82NROtzohhb2
         hDDg==
X-Forwarded-Encrypted: i=1; AKwUvBx2nv/f1XjA7la9CrBPVYnObJLe3v898oeEFaVLaeayp0PTA6I5g0fPbWcadGUnCuKa93z/AQot22z3z7M=@vger.kernel.org
X-Gm-Message-State: AFuF++nXP0tOr166wtqNNYbE/IkScyGRLKjTv/fQOZDq2IyWtDsM7udq
	ldm3m9gAkBVJxu+nhkI5Zr+S3tfiqeitjUn36gA66Vw2dy6AdzHZU3PM
X-Gm-Gg: AYBFou2LtjipJS35jhyfLJysy2BdSVKvdR3ifM6LU8B92FBuKjJIh5zFm8p1ni8Nuo4
	OzbymPBDJDs959Q67DUyFRFAnVvqubL6RuasCFC2FTPjG+5KvEHlYX/Dp71aqrEQUaASQDYs4+P
	IkoKjqtNPehleNDUwWdSbj7kMCMqsXgLuwSiNLKZ5zJQ7AUD5BzE+kGcFiqeQXo6erUPkUoDj4X
	fFKbpH3Wu+kCA7XLaE3sZO3v+naaVJIkGeyyGmomwdQ1UT75IEddjsmxsWRxjeEAR4SlWzsCyNJ
	A4GYrf8iJ717L8JxWHPYhKGc3XbhT4NcDSduqMSCDh23iJzBEIWjXwZc5HBRyjUJyYKeiI7aWKE
	y7if9s0uwG9aG4CR77U7gEC/mcGcUmOYxaT5hF81PgAvCEjIdW2mQiTmJtJbgjC+YyElt1oYvp7
	0lYu/idKS+/h8ibgRqrdX/TxKpOXsYeUPdu3uEC1dZIHKxeaatCpUipvsQFvlb6RRdLZEkJyITa
	m+m+9DZiGUW9jyM46GBNem/lV/vR9sQK+nVkIBagd2JynKtMhE6/8I/DcZS9CFrzIWr43bTOrMD
	74ojVZKRR7k=
X-Received: by 2002:a05:6a20:7d9d:b0:3da:34a7:6444 with SMTP id adf61e73a8af0-3dd5f7ad642mr4109891637.26.1789547370506;
        Wed, 16 Sep 2026 01:29:30 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aba9dbbsm1157594a12.24.2026.09.16.01.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:29:29 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Wed, 16 Sep 2026 16:29:24 +0800
Message-Id: <20260916082924.956116-1-zaq14760@gmail.com>
In-Reply-To: <20260731035705.3198816-1-zaq14760@gmail.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com> <20260731035705.3198816-1-zaq14760@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh, Thomas,

Sorry to come back to this thread after a quiet spell, and apologies in
advance if I have missed something obvious.

Devarsh, the three fixes from my July testing on the PIXPAPER 4.26m are
still available:

  https://lore.kernel.org/all/20260731-ssd16xx-pixpaper-rpi5-v1-0-18ffc0dbf59a@gmail.com/

I am happy to rebase them, reshape them into whatever form fits your
series best, or retest on a newer kernel - whatever is most convenient
for you. There is no hurry at all from my side; please just let me know
if anything would be useful, and thank you again for making room for the
panel in your work.

Thomas, may I ask your advice on how best to handle the panel support in
the meantime? The PIXPAPER 4.26m is the only SSD16xx hardware I have, so
everything I can contribute is limited to this one panel, and its support
has been on hold since June waiting for the shared driver.

I wondered whether it might be acceptable to merge the standalone
PIXPAPER driver as an interim step, on the understanding that I convert
the panel over to ssd16xx and remove the standalone driver once the
shared driver lands. I realise that is not ideal, and I may well be
missing a better option - if you would prefer to wait for the shared
driver, I am perfectly happy to do that instead. I would rather follow
your judgement than guess.

Thank you both for the review time so far.

Regards,
LiangCheng
