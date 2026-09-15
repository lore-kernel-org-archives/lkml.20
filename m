Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9C3379EE0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456131; cv=none; b=rYAS+gihyjgySB3IEMJQ644XpxIHDRK/HsWZnJkMeay/OzlXVtiJz4rRijYI0LuLrGf8hwVt0bXelJuBbSw+fASowZFP2qr5TgoOXBqO7+ainLwqlZt6nfQyzTsEVZTb2hTV4jcImb5HhqWmnLAmb2of0y2w1KsKslf5a8kVlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456131; c=relaxed/simple;
	bh=AK2s88F7nEv4dz2wyh5b0V/BQf8lJLUyZNZtandR/is=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fo0hM1NrEWk54M3VUaYRIy5o2lByg6p+6vunipaC3kIrJGj9KCo4wB4AfZVCbON8PtdoP9WVL+q/KIiiLMdlrVkTHnj+aDQrQEdH3fbbDEN5g0a5SpqxmODm1h3UJDP3n3pLZH2xs+Or1euG3NC6M8UOPu98taVkC6aYw5wO4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8ngipPf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8ngipPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0A61F000FF;
	Tue, 15 Sep 2026 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456127;
	bh=8TgXehxFGyZR3DBBNZ4sTpV3Ifkyf2QyqSuVLOJXsKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H8ngipPf8xFUONeOvHH46Xh4ujQILlFSkMHQQwZ/zVoc/aeZswy9kSHotzBwG3ddx
	 Fr+RUoXYl7LsUj6xeFCtWYEG/yu9QdKuAWm3N/0CJMEWrZE5NUNQ7RGT5XwfWCE/ws
	 zeH6lTTsNEJoTtcVoRdOjO7Wy2sU+bvh7kgBrfaTtSMRUpheePoFlypsNCX1ZaJpRa
	 BsGUoPlOhRSt5i+54K0X1HRM1egok6upltRi4O9G8h1IJ2OOkRAtrRjrIhrnp7LDou
	 KilRs6jaoX7vsW2yfhONzD/xBlblQ6TPGETSXZlhQfaltUPEI1I2LH5qW2oGnDn/Za
	 5SQKHSEI3x22A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Benoit Cousson <b-cousson@ti.com>, Aneesh V <aneesh@ti.com>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miles Krause <mileskrause5200@gmail.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909-master-v1-1-8800f5647ab2@gmail.com>
References: <20260909-master-v1-1-8800f5647ab2@gmail.com>
Subject: Re: [PATCH] memory: emif: fix device_node reference leak on np_ddr
Message-Id: <178945612468.44296.16954992443488071978.b4-ty@b4>
Date: Tue, 15 Sep 2026 09:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 09 Sep 2026 19:26:26 -0400, Miles Krause wrote:
> of_get_memory_device_details() takes a reference on the DDR device
> node via of_parse_phandle() and stores it in emif->np_ddr for later
> use, but drops that reference without calling of_node_put() on two
> error paths: the devm_kzalloc() allocation-failure check and the
> is_dev_data_valid() check. Both return NULL immediately, leaking the
> node reference each time either failure triggers.
> 
> [...]

Applied, thanks!

[1/1] memory: emif: fix device_node reference leak on np_ddr
      https://git.kernel.org/krzk/linux-mem-ctrl/c/314ef67d673284d4c070455bd62d332f6d0f8634

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

