Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2CB3E5EC6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865807; cv=none; b=jM4NsE8UCb01xfbmv+LWUljX+sFdL9aW+tEmm/9KLrjidfkGhCD45mr1CpXr97OME7teO+9mxQp550O1NXARJm6uSU17Wl0vBCJfo7Q10cP1/cRGoM640D1dmzyFAgQlbwItDO/qTSE5JHA4802xqUg6B//WyOLSK8Ug3/2Riq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865807; c=relaxed/simple;
	bh=WH0W2bauQBm+nb6RVbNhKWX+y2F7TVq4fXXOtXLmF50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k8PXok+XQMV0T870VNDe0LmD1WMnBhDvR3T6i61LpRqro80sSTiiYutLdcI3C0CPzYxvO21YxkolmgL4aejjIDQWvlxOV/vhPsOieKiUHS0v6n0sIZplw5bVZphBpD40lFyU7Fyg71XNz+C8vZh9870xyfgDYAcaXm2S9lnkvBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=lCVMYI1o; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="lCVMYI1o"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6de6b4c50f3so345228eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790865801; x=1791470601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cDEpol0QCzqiYvdJjeguJwYsx5jQEjffnNf3dXq7fM=;
        b=lCVMYI1ouuwjToGsvjh83k9l92F5a+LMA532/iUQfoeP0Gd1pkkO/K8I8FqmkDG5Jc
         QXOb6wkEEhv2bQoAUacwnmJZa1UTe0Q1/5i/vHhTyL80RKm3aCNm8TNtcpHLYm5IoXeC
         sXV5nhVjQrRgza3w1qBUvkvMtUYcApGxephgW2W1XY8lAcOjCakkqzahI4NML1mmzyfi
         6UUxW9xmM7L386Z6YM39RYcltIexO+lLHKayrxj+SJw8EvyIolAriU0AJZp5LqKbmk05
         AOoMfV6Lcdmi138Bkj9OlVdBW77XeHhIWS6MRD7wKj6GBFtnxd54jCQ0k/NcQtsq/7Xk
         ImqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865801; x=1791470601;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cDEpol0QCzqiYvdJjeguJwYsx5jQEjffnNf3dXq7fM=;
        b=BtJ2l9JNKwsvfmkK06VyNqeOnE9wbvSpU+lGbCc3a0Y0k5MilwENnlfgD8STLJEnib
         p7DmV8th/Qi3B4ROps6u/HbH06GG3kLyDJJ6OkInYhpRZ4fupGt/UuWjYGkBHYerarSu
         +UUT6PAY+T87BDDyV8/zUfvN2XVPY5hUNLEV6xIwy2jTWQm2pcRGJrulNTdEyPiDEczS
         Ozq/OBG5ag8pDQexd+tThHG7ckYO4JPGZksw391t1k7LKj/n7FXTFNs3JOsM2fA9WoaN
         tWf/ViAoZd+iXNzy509OQHsAmF8JtneeNuEyvnKYnT81JRetu7x8Rqh645jH/7qnkhbi
         FzzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB7iJXBsr5J10S7AC1ToPMQ4vXXFXK7uJcKATzM4sWT+LtJmQYKPqbIAZ194xGKXkohHtSn4Z9YYnyq+4=@vger.kernel.org
X-Gm-Message-State: AFuF++noW+c+lXkJZRP8FFmUcGIihKoU9UY0lZG9C5fdSPkWpK9wiEYh
	B1UXT4pNEXsVYDFOnENmaFALJa3et/K1k1Y3WxDzmfylfR9KNgSKei2glmtdDWycsYM=
X-Gm-Gg: AYBFou23jVXv/tSXYAbbC8Q6mHf2Ctpm/LEnSFZqxNEacQQrNDKveKCHi/JH1tFFPo6
	l2wXalT9Gl6SyI8gTr8szf/VnGcl4t1CtQhf8u30f8nc+8qoGQ9D8aHBB2n6IWqdrIhzvWry6u1
	p+tCciwVoIFa3XteUYb5JDFRHA7FZlX5/yz1aZM6rvgqnEQJ8/A8CL6OLGweIymjwoG/Fte8J1L
	h/bXICkDEVyEg5e/UI0xtKN58p4GyvQHflcVxlU+mMD3TP7Htr1AMliqYAxKbt1F8IlBSurSRDd
	TI8UM+5cY2OuT4oa0WvA0s/uWvgyhctN/vFH+dgFvHjODlKVqtpoSxqhxW3HvwQYi32ef7sC4L6
	mMq1+u2dxoUvOJZUnyubzsjaTzr1sKQ/tZHHFd9MnsoCFdaY3zt/fx0afVBDOxbyIh0ezvlVYJ6
	zwRYeJrEghU+dDql4nyjWKVJXLnx7nUp29hUwnCi0uK9hMQ8w5pAfMA6GytB0YdpxKLlja0u0gO
	0VfKyTwJhzF94uHen01E8Au60v7t/8vpoqfuI/klX5EknUrMRLYhYgqJZBEE967yg==
X-Received: by 2002:a4a:e913:0:b0:6c9:80d9:5e6 with SMTP id 006d021491bc7-6dcf4e626demr4261656eaf.39.1790865800818;
        Thu, 01 Oct 2026 07:43:20 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded14d8a0sm2638009fac.5.2026.10.01.07.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:43:20 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Qiliang Yuan <odys.yuan@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001-bug-ublk-del-dev-put-unlocked-v1-1-18e9bb9be727@gmail.com>
References: <20261001-bug-ublk-del-dev-put-unlocked-v1-1-18e9bb9be727@gmail.com>
Subject: Re: [PATCH] ublk: drop the device reference outside ublk_ctl_mutex
 in DEL_DEV
Message-Id: <179086579981.1687323.185182661206896039.b4-ty@b4>
Date: Thu, 01 Oct 2026 08:43:19 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 01 Oct 2026 11:10:47 +0800, Qiliang Yuan wrote:
> ublk_ctrl_del_dev() drops its reference to the device while holding the
> global ublk_ctl_mutex. When this is the last reference, ublk_cdev_rel()
> frees the tag set, and blk_mq_free_tag_set() waits for the pending SRCU
> callbacks of the tag set with srcu_barrier(). Every DEL_DEV thus waits
> for an SRCU grace period with the mutex held, and deleting devices from
> several threads serializes on it.
> 
> [...]

Applied, thanks!

[1/1] ublk: drop the device reference outside ublk_ctl_mutex in DEL_DEV
      commit: 812485c8ff2609489b164415befc7189965e1b38

Best regards,
-- 
Jens Axboe



