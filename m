Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815222;
	b=snNs17ymf7ln+34QZ1Oo7EA6mRvUjp1sImrdXhC4Lx5ATFAG3tm06HgJ2l6RsNSiwWty
	 B1zlPlc51e7Z8V6Z7+JX5cgetILQrb+z/wDrU9JN1f9ZoRutJhfvUeYqMphrVoQkESvXv
	 TDptnPkmxpAU6rAm6om9U7ku87HVCLjmuHSgzy2gytTkH5o7U38st733CyeQhb7t0ATp7
	 rHQJfKqjd/oDzVETwi9TnIwxG/Joml43/P+0Hj60dQyysAmJDzlAHbraWrk4xLZJHojR9
	 ArOuENz1HgvcL8UO3Ufwjjq1ePFuujGwG6cW6/TpoxuX2ZkRd7crXQQrIq0iLh94L4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815222;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Ji4IfJTnrzjE08ixsCtCfzOo4xSxQ09jGJFLpwyOOVA=;
	b=o8v/c82K1YRMFmiudvjdTIyiGG0apt65E4S+NZmj8UG4u0qvVo33zwuVqysw36axMeh/
	 NZ7nWV/ExnrTc2Ox+K7ErqsTy5hIJRGdBxffYOj2JGj1NddL6KqgQFS1SWxDcTfClSIBs
	 rjVkAYbd+I9/lkgGhzzqlpURRcTp9wiPAVSAUGqg7a0biF1of3bAgY74AxBGN3OF8H/5R
	 U+m8vw9p6/8Nkwgn+gQjDxeHdbKEmCP83nh79EuIQmsSunInt2UHqvDotNl896mqF7+7t
	 K71hEAo4wnCkQ/hHAzHKZ7pv9NX9rCy0FWQHwlyITYVxOc0TWp2rk5wuQrhLCLr6MyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFCFEUfN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE070606B23D;
	Wed,  4 Nov 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFCFEUfN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D37E1F00A17;
	Wed,  4 Nov 2026 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815221;
	bh=Ji4IfJTnrzjE08ixsCtCfzOo4xSxQ09jGJFLpwyOOVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YFCFEUfNj72O1vXb/Zw57un/AneRjG7Xj72Ej1t6H2QcoSpXcrb4dVz6aCkM9L9bm
	 Fvg0BxL97IPS6X6bYiXa+BYYJiVNj/2W/KkTy7T4ynMRl9X4ctGAJxsplRWbEznatX
	 zSi+oxv/MbN+uIWMfq6ZYcObcW8eWRSguCL5ngeFz+rthYvrkfyLb4bH8wI9ezONK+
	 HrbcIAGmqa5lm6jCp8L8zDK/eeJteYhMMu6xaAtvqxJMDLWpYiQ1ZuyekBK3XJQBDd
	 qnB5vyfHQ8fked8LOEVdrd68/Pz0iXgwJtRm4QP+LfIxHFvgblzLUaLnDeGL65OKpU
	 QLd7m1vr8KGVA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Riccardo Oliva <oliva.scorza@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261028021556.11988-1-oliva.scorza@gmail.com>
References: <20261028021556.11988-1-oliva.scorza@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: dln2: Clean up
 dln2_unregister_event_cb() loop logic
Message-Id: <179381522079.1916138.4679305340156782083.b4-ty@b4>
Date: Wed, 04 Nov 2026 18:00:20 +0000
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

On Tue, 27 Oct 2026 21:15:56 -0500, Riccardo Oliva wrote:
> Streamline dln2_unregister_event_cb() by using a dedicated 'entry'
> pointer to store the matching event callback. This removes the need
> for the 'found' boolean flag, restricts the iterator scope, and matches
> the pattern used in dln2_register_event_cb().

Applied, thanks!

[1/1] mfd: dln2: Clean up dln2_unregister_event_cb() loop logic
      commit: dad66a38052d2481dd5aabad636b05652a328573

--
Lee Jones [李琼斯]

