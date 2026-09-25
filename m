Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB50442E408
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333539; cv=none; b=U9cW3BMYgOCzGvlRnKZcwq9VYuEzOZKFkOsF9VNr8FSIFOME34xjatsUbs7YCuCbHZMo0OZHQW0KBmwXQZyNrt7iVjCt24OvS+FsB4QdHCQ3HdQ6uS3o0dnkyoXBirlJckLulLyNL7qmNGKwu+Z9B9JRPDg58UvoO+R9UE6O4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333539; c=relaxed/simple;
	bh=gYmV9h3Y04T+xS+GpRpVX8FBEQJz28IyyGsuf0PJTvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HhX37Dc4veyVNDosA8k/LgbNmXhdnyKRQEx6HMtxF8qMzsdY+4zkl9GY55J7JoGp7e6zUYCv8H/N7c+HoWYa9r4QvMK47VhnR8vmLFe2bySUT/vv/NtFOsux6s6IhMQ/OYwwzfjHRihaZLJNgWRtHXiZypDtxI9AE9EylVtC/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYtnBm0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYtnBm0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE1E1F000FF;
	Fri, 25 Sep 2026 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790333534;
	bh=inb3CIUveHk3xe1X02zHlEHFX4YXvw4xqoOKZ0xv0no=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mYtnBm0BCAATQiHDVEQutThALmRaEZ8EeOcJ3WEoLtGV2uo2iMu8itPoWQhTtMnNQ
	 fFlNp92QhjqokBtAKPM697YBMjbMuyo+S+PRl93QBiFeY0R4UQFM4xtHOLfUg1xbKI
	 1I6erCbrcyy7YEbvd1dPt2Gsc+tt6zRhdKdDtoHm4LA919niWNikd/Svf2MaUvQQuI
	 OVVnA9wR8ifcjGhyRgS0Q0X2xlxtW9KZAbSGLZJNaSnOZ9g3rRv9nPd7qo6CiyJtC8
	 pqU1KkfaA31Ndks9vy1tP+LjrLdat64NH9it467BBgkvI4LDVnfNgqrOrBB1sjhExo
	 Zxaju4wVFy9Kw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org
In-Reply-To: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
References: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] nvmem: rework nvmem core and allow unbinding
 with active consumers
Message-Id: <179033353313.446736.2638212211591611400.b4-ty@kernel.org>
Date: Fri, 25 Sep 2026 11:52:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 25 Sep 2026 11:52:15 +0200, Bartosz Golaszewski wrote:
> This series was queued by Srini for v7.3[1], sent out to Greg[2] but
> last two patches didn't apply[3] and subsequently slipped through the
> cracks and never got into mainline. This is just a resend of the two
> patches missing from mainline rebased on top of current next.
> 
> --
> 
> [...]

Applied, thanks!

[1/2] nvmem: remove duplicated reference counting
      commit: f2928a7103008f27fff6340c161817faffa7d390
[2/2] nvmem: protect nvmem_device::ops with SRCU
      commit: d30804cbeea7ebb6277badc8d6210af5383ac1a4

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

