Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496664;
	b=HcbFMr6xSxd5tM8a8/9GvgjR3trOovFNbhGgTtOfuqFwsMiQ3VMMENQoYN0jDuDty91p
	 +M71FFrXeWT/M+hixPpA3kUnckKm8wL5QGfc2YOJjts4HDWLKTfxKnGS8PjoXWoLZUpDC
	 ZgpMTmrW7QI4K5E+n4OxUyXfKMIxQRfSkfcyHZDnP/B1YD9BYj73KlkH9eXLQN7nzoipG
	 QcbUHt0dfgEq/SHRDNzfIIA5Mr1XR7wkrPJhFcQDfRxDu0GiOnN1uwU6zXlPGJITTCpdW
	 TZUcYuS4WTjudOuAQo5d8vjsCeho40O/h+8fLjHcr4NZKoTLUEIj0zSbi6YHhJtBPCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496664;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=IMfdPE71JGMz0w5ZnV6frJpbWmwy5N2jKBLBfwGOzTo=;
	b=Q9s2+dZCXlR9tBU4XvRbTt0PzI3y/S09UZ/bZHxosFwRFjN6jxIzry+Y1cXmQdz7EGVB
	 xONMfPg/kQLV/1zrjvzSX+yVMz0CrVbgi/izvTru5ikn7nhqS4d53qKv/O2FmhKgi1BXV
	 ZWqy/w/WKyu73+nM5s+bXCpNawirSv7RObB+L+tun63u2HZtn0vx1MpRxWv6o/ivI6Bn9
	 kv5tYEOET4YzAX1WkR/bmNA0Odde8Re6XJESo1t3xJjM8wXYbNxJ4TQwYJyLgbmkEMGbl
	 LtjK/q0e2AH21Zef9iRAf1wYOEB5TaAGRHDgrNBkUj6pEdgr56n/RNpbtjyKAxrfDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLDm92f7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD25606A31C;
	Tue, 20 Oct 2026 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLDm92f7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53431F000C4;
	Tue, 20 Oct 2026 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792496663;
	bh=IMfdPE71JGMz0w5ZnV6frJpbWmwy5N2jKBLBfwGOzTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LLDm92f7OD1AcHd6TKUBXFoM2VLT6WphvE2f45f1tzZFnpOgxC1kgmMj3Ur+ZFEe3
	 0b0Blc8a0Dv23K/7dLekWlhu56CI8wsUBF91W2tYRIS+BZfuFxQgRxWyb+k7gioixR
	 GZ4Bg08g5hv4smWhECzMq0fN4iaUdrUNOnl+gLvbO+mjwIIQmgsFKPp6w0K9RG/fKJ
	 zBWrsqc9KJ8w0XLui4zoy93q+YCF3NjgPPUi3wKBv0qkoF/640q91r39V4aE+eikIk
	 piUK6CLecex8UKqt8DOKa0cL7T4yafflQaQFOUohOWwadpLgtpxi6Yu7mAnvg89QMY
	 vccituqaRApfQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
Subject: Re: [PATCH v2 0/3] MTU3 MFD improvements
Message-Id: <179249666241.1894596.11435231074226854347.b4-ty@b4>
Date: Tue, 20 Oct 2026 12:44:22 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 04 Oct 2026 20:40:21 +0300, Cosmin Tanislav wrote:
> This series does some code quality improvements to the MTU3 MFD driver,
> and enables runtime PM to allow simplifications in the sub-drivers by
> relying on PM domains rather than open-coding clock handling.
> 
> V2:
>  * capitalize subject after prefix
>  * switch struct rz_mtu3_priv retrieval to a back-pointer stored in
>    struct rz_mtu3_channel::priv
>  * remove struct rz_mtu3::priv_data as it is unused now
> 
> [...]

Applied, thanks!

[1/3] mfd: rz-mtu3: Do not use struct rz_mtu3_channel::dev
      commit: 2e51117f96cfc96f3b83403d2f8988246a9085b4
[2/3] mfd: rz-mtu3: Reuse shared_reg_update_bit() in start_stop_ch()
      commit: da456a1d4097e0f67d0beecc7b359508fe7a00cb
[3/3] mfd: rz-mtu3: Enable runtime PM
      commit: b035c19121cd1163c3ea703ab603374b238a4742

--
Lee Jones [李琼斯]

