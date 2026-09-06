Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C582931F8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714558; cv=none; b=VpvXHRmXe6XcLiONCirZ2w+qFAZyLNErbbP9Qmi7TEUiVeg56SJQH/ocwBjC/uM4VRqA5JTr/6YSr1VK0kYv3FMn3sgiu0kx45ezlFfZdaDtPktMZbEjMCmriE616lCCCl/LW2G0qn79rFmWY6by2Mgm/LasKfZZ9ByvWicC7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714558; c=relaxed/simple;
	bh=YuAissJBxd/oEcul73Oqcl2w4eCknoHW3mzGMcbV8V4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=DCgZYVvFR+HZFqQJIn90CWxWpBX0oPwSUa4JD36tgD+1KBv+x4UA6SvoqffELqEc3JE3RMldiHqtXo8mVIQKNOE28p58bg9ZtFvvigtDEUsft0SDzjWnQihVD8sgutUPcQ8zeWrwnMX2WxmeeB9oxcWAf7WXTIhLjMAqsCmWLjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcuSwJGJ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcuSwJGJ"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-867a943b149so42725857b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714556; x=1789319356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yx2dnKqh0YARmk7SiDnWQoiCJSWS0Gox86DZ0zODi7Q=;
        b=IcuSwJGJ2ZYbj3csiAyUkOaEpS4X+Pfzz6izHgYKhMY6oTKr4aU9E1f0kh6qGDvTc2
         Pv/KDx8m8mLRAEC0vuR48m8BPN8U8xJMeFNYKQugnU5b/afEMtycVRPQyyd4d1lfduQ+
         LHB1HDL3TfvfvZ1gcmYCpSj90P9/PWl3piUIuB9E38ZFZ+1rxvi6/nDKIMrU3ESvMGV6
         ed3P6mJC+RKadejwRQ1VOxLhjYi+2ZiDbngbB3CFdn6yHiLWXGh9G7fGNJmLFMrzm9jj
         aXT8fnCa5wwZCpKzcRq7PKfxbrwq2CO3MJHmRKIxA3L7UjZVvbJiPK5fEJy3qMOII+U7
         5jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714556; x=1789319356;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx2dnKqh0YARmk7SiDnWQoiCJSWS0Gox86DZ0zODi7Q=;
        b=hbrrFUdqS4ZFniYARH7r9xNJ46gDlaLQSL1icw8INlVqRHz9i+VZhS1QarKcMCUKxo
         jHqeEx0cHqCxp/Y6IGCiwPNNBIN1cZw+ppKcuhhanhhmQgL688g9crzJ32STwBpb8v+D
         6ZIozMyA+Y8+w+AVGVSWJpXs7sNH95W2uBgIva3Rr7UldWm9LOGnjtzz1um6MeEqHj6B
         Gnghq4JWyflPkhm6y6U9W/BIfmi/DkZ6DLsEyrkAdCc/Vc1cM05JxNzaC+PjOrbqumpv
         OBhj57BFmq6KxvPhUCN//OwfVXJdCuxhOUNlfgKsnBiOe8q2XlANjlaNN9Vtct/wfvai
         baCA==
X-Forwarded-Encrypted: i=1; AKwUvByvwPXTU2agjrqVoTkfJOX4YMfoezJr4DWwl/6H5RtCg+rZ6xiVwGo44fC3Anh2I6AYl1WCA6035PsCVow=@vger.kernel.org
X-Gm-Message-State: AFuF++luoYm7U9FuSKVpSZnfdI2g/NHAJFza2k1HKhGWlqwxrTtTDyuP
	FFe6+R0B9o/986S40CTzJld9qDaIdO35WyAiv5BrXGEqr1GdK8ahOGAE
X-Gm-Gg: AYBFou1L3iK8EAfBiZCe8NzgnIKqY3khD5zORJDK9Gr3sjOJ27wjYIJfKtDym0chprb
	8S+HHCHH3CZIjh3XYhqU870RJS71FgPmzmzrnnHZ2RqvuFkS2izW+4XHHEMSSADVMKvmWUK296l
	l8R58JgP08u4tuGgvFWWelgC8Um5W4V2wMZAHrpZeeykPJPmU/USbjYtfh7sc6q73AtiMLqrgGk
	hNrANvtrKD6EyTuEe7akaTfQQj6dbDXKm0s9WTUOWfIrb8cYooWKo5yj2SbdoqcxJdJR35om/wH
	Qfas2HANFVfqPLrLpGL+AUhUCVlue8Jq3Xv8ldAT54+G9qytYV0D28soyYvrgjC4kbD150iG8C0
	2PqFjGk/bDoeOg5LZ/8k29J/yE4YHWt8AfDBW4ju59H/xOLGgSYDF2oOiRCN+WFfje8E6TFuUCp
	ua0g6hF+cjOaeyTXvJ+UdJCeIXzAJnwNPRVQXjMB7j/REPNZdQetgMIWkUSBdFXKyOmOZlD3Yuc
	Ggi2IpLfRjxdXIhUFrOEqayRPz60WZYCW1rEVUnxQ==
X-Received: by 2002:a05:690c:d8e:b0:870:107b:6353 with SMTP id 00721157ae682-87126c9bc61mr65866247b3.23.1788714556284;
        Sun, 06 Sep 2026 10:09:16 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316361sm57718437b3.14.2026.09.06.10.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:09:15 -0700 (PDT)
Date: Sun, 06 Sep 2026 13:09:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.a00ab9d6c61@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-2-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
 <20260903-psp-prep-v1-2-d47e9c4c375d@gmail.com>
Subject: Re: [PATCH net-next 2/4] psp: move code from psp_sock_assoc_set_tx()
 into helper functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> No functional changes.
> 
> Lift code that needs to be called from both initial tx establishment
> and tx rekeying into functions that can be reused in both paths.
> 
> The plaintext in recv queue checks and mss adjustment only run on
> initial tx keying. The dummy psp_assoc machinery will be used in both
> paths.
> 
> psp_dev_tx_key_add() absorbs the dummy assoc machinery, as its main
> purpose is to populate the device specific psp_assoc:drv_data.
> 
> psp_assoc_set_tx() exists so that a future change can allow
> psp_dev_tx_key_add() to be skipped entirely for devices that don't use
> an SADB, while copying of the tx spi and key into the assoc needs to
> happen regardless of SADB vs. no SADB.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
