Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8464446FA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185309; cv=none; b=rj3L0KMrIho76+OXAv9YQEGJxpY0uPwNSatc0O38KJx9O8TO+9a0Ey39xUM6R99xopAYepspnPd4NxYJP/hqO4/HKhwU9pdgGsfLtlvRVGUASPypbqSZ6gv+1e+lMquRirWonmkW+D+9e7bxzYxx+FMzhMYVi2+XeG3BOt859Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185309; c=relaxed/simple;
	bh=yriD6uTUC4utVl0VQfR0kaNvh3CTGmhVvw9IdhjcU9U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sHopKJiD4QcIDxwIUxRg5fKau9zXEEVo8bUxoEpL7iJOl6vyeoVDRqXvOrSrKXBviSnCBGopgYGdYgSUcUQJ6HRnzVKAsv0RuqwXbF4PwLBdekLptNPZ1/W/fQkZrDuZ/x7Gjnxbl1fid4drWO96OPhJo1BoicQNBu/z6BdWP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ka542Eie; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ka542Eie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792185305; x=1792444505;
	bh=yriD6uTUC4utVl0VQfR0kaNvh3CTGmhVvw9IdhjcU9U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ka542EieI1HlnKcdLNL5Kb8J/GV7sNF9S/D9bPxc2PYgNpB7HkVAmckd9Ene/fA64
	 38M/Xpt6rX3wxU/ObwQa7XYdFcZ4bjAPhbJVe8w11NdOoQ98/BAkoPwiT/a+E6G+Fx
	 QBTCvBRNSkgLrDA0VCjj6A2L7YRSXRZVFaYYI7KSZYQS+ZlKKVqRfd4x5FwsYfr5J/
	 bRU7JmIyTqx3TalLOC8QogqdE4MecepVvrnRcr8XLvTf6J1C0jeFHADurDPPogdr+p
	 PUf/yR1aEHY2SZYJMP5yBQKt07oI23TfnEsj7ssx+elVu3xQYWXkrlZ9MQQ1zSP0zh
	 rBUpbqDIULxlw==
Date: Fri, 16 Oct 2026 21:14:58 +0000
To: George Neacsu <geocausa@gmail.com>, Bryan O'Donoghue <bod@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Andre Gilerson <andre.gilerson@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
Message-ID: <20261016211450.62994-1-lsa.uz@pm.me>
In-Reply-To: <20261016160853.193378-1-geocausa@gmail.com>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com> <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org> <20261016160853.193378-1-geocausa@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: f8ff3cfe9572acb7d8752375a1bfad56a4c2b617
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

On 16/10/2026 17:08, George Neacsu wrote:
> I will also read the CCS capability register 0x1602 (bit 3 =3D
> C-PHY) here, and Sergey may be able to read it on the Intel model.

Read on the Intel model while the sensor streams on two D-PHY lanes
(model 0x0681): CSI_SIGNALING_MODE_CAPABILITY, 0x1602, is 0x04, so bit 2
(D-PHY) is set and bit 3 (C-PHY) is not. PHY_CTRL_CAPABILITY, 0x1600,
reads 0xff, every bit set, which is also what an unimplemented register
can return, so I would not lean on this block alone. Either way it does
not show C-PHY here; your reading on the Snapdragon model will tell
whether the two differ.

Sergey

