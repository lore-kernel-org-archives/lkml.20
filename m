Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDAC3BED7D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494139; cv=pass; b=bjgAVzxeAchQeBUWnbH53ZiNOqvyhv/5PLwNubJBtDW0dTxgYxEjRIZjlcWPdLGZK0ZEu0wrzD6CnRtWp6As3JumwZ2dPGlv5nXKJPlYIhIbKagHtPk2R5TQs73vvCAqWNJXoIo1c+/sRO+z1yROCMSPBF4qbosezd6SuSM85Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494139; c=relaxed/simple;
	bh=ehijlCEC3hrjcJAznMfeQDeOfDoaMPKsYEk0yQczBFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+5qI5lwkP89lfrw0joUpUTI3gFG4sjauDyv4fQvVltSBTn8YGGBcoqG0Tq6f4M0DqDhE1lx+0lDGQDuKZnuke7W1JN+tncMg7f3BOfIaCuLZCv6pdBAUSje32xVDm+4XRGzZuu2EQwF3linzM8RaJUdJveBw/Z2yXHP+RSUFT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUP7ST4H; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUP7ST4H"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so2063039e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790494135; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYrmx/iLWs7KG+IC+yBFzHmta45pNhMPW3mOizCEO1fWPOo+AMfcVqt2nm8dExQGsC
         B9TyLxashHCEd8xojYLfrMaXkfvDvlvo9pXxjPceqqmz3tlsVpFwbLiYGwlLjo0ZB2ys
         9i08Yyy8FoPeJ4PoxWX54maH6V4UQlmWhAsD61/N2rqdtd/wYwwLhjpgVwuK3b4whmOY
         OnvZ9LI+MBtDlHIJoUsavQ627gTBCoyCXgLpACqG2rg57NcprrRbnJMGDTJg5GrE+Iv/
         K924KGZ3mgWNOt9+/LTOwo63bFYEUFVwolqVxeTFYbvjDDs0tGZVVApS1CUtVlRQRJK/
         sU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=;
        fh=b/x4NWBW18LKPFrJOzzp+/ktghaBTDzL3fZ1Rz5WdH8=;
        b=d8MjcPa9ge1gWL3c43LhKHPi4d9CPtrmunImGO/05ObMHX94qeGgCXBHvHPtDwODKc
         YBMOveU6HUKUWQNjknzv0BSe4hg5hDWSa7OUuet/0Ycd8adBuuXtuzfvYNBJQ1AvyYXJ
         3KsmLc/LE0X/GzzKctIbzqa1nWFVjRVEqCcpHSi4fOIKgsrF+rit1TStr7yUpNWFF0vX
         Cf6H5TBpSNFkclqHzx6CwbYsyWCVzqW2i6kqKwwcf5IRZVi7sKlMJnw76OSrwZ1kQVD0
         ibDqhwwsk+xw9UN0mX/MyTcg9k0fT3eM8xXyuq3sQVs3LUofdbzXmq0JtEhcS8l9RZqX
         3+PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494135; x=1791098935; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=;
        b=QUP7ST4HD4hHwLCrhLalJyjqqJxSSLxvhkwndOV3EcxUNDfLEIj7jTjaccryR8DqTp
         FksqFwirqQJrhUIFhNsu3UDaL+soJ7AfXvMm6jBF8lU6EBBgGRsvGZNiGcooaxmdO5+U
         wXZNFJ9ngRXIfc+xdCOkkJRyCzp6mAuRIT01rCnKhvDxmI+COG2YOy8mOYUicZpYzMc5
         c41cZ3Jk7cNODF3W8/eZhddzuhSRLTzInShZ3a0yVDunpC16nujtzoYVehcR+rkO/qeM
         fJ8xGfDsQWCvIr8v9Ya324Uze6JO2YplDEPD/mCEAN+4jApZyWln7Y5iiQhuusfKoHG2
         T/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494135; x=1791098935;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/XyK2jKdoKkKL5T7snSnH60cAWdSpGKwMQSo4tA4mUM=;
        b=bnakZ4I3TbBNQapIkUQNXcq/R2feUyrW4vrClEUK22KKvgR0doL3VkYcUP0WEDTYMP
         twxgYrAvYSr7U+6A0FY74iv/jkWHHLUpyYGhyEFh0KW77Uu+2DOdN+R3Y/G7vaBYN5DM
         gZDFAQI6GjArC4EdKSqREWZEpr1z5DHAa55JRECDbPE4oZ9CAW7O1H8SIEBa9kkAFDNj
         s73id8Z0PdGmFpJ6zNStlwwVS58yKs6IDh8eob/Wu0pKurdZih23pRZECOdNHnX6Zouc
         udNiB2ZWpdz7h02hUPGMAXuCKYIgyZXvqcUoAXQmX/rdTy/x3WMa2pLGLTVCSWyogIBb
         C61g==
X-Forwarded-Encrypted: i=1; AKwUvBwPXBAZYO+o6yRbqn5o66StHht6nhtl2JBMKf4XcLJ6mN3cAWwVXlrjOZ/2emK2PotcwGMkHuvD0MMdwlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaOA56N1ifaC5YZiVb1U5GCBcnK7ko1+f6IqihHSreZpFBSS6q
	X0ZZjAOl/BUN52iwOEzd5ehsKhPubUcfTjTdOwUxkpmMCfumEqd7NAp9eRqVVaG/QOC4hsZsboj
	3IdWufW4xxgf1lcQ6410ujfVVJb4Y8ts=
X-Gm-Gg: AYBFou39QrIeGQwkw2W5t6zz13kqN6LJQ1RNXredHlWtR8phC3ivqqGTfQf/VEykHPb
	RafaVsvo6ZOvQrOvka8qH1oaGzvnpOt6dNQl+frW/2BcJ/4+e5dMmSRhdeSD6DgIq34KuP9tdyE
	YYdJYAznZv2mKXuZp8w7JdgGy2yaDJljs8sAk7GLoQpjOlcekFXYsdhqAtYtfp6x6V4y/DH8iLb
	rvMVey7HDcq8zo5F7IElPV4wov18hQXi9q4fI8YbKZGtfbYbeU56ytfW0pFjyjYkEzryCH7g5PP
	JFb0yeJV117lGepcPF/M7/GBg2GPVcbQMypNcenu/KWhTiSHECEwtA==
X-Received: by 2002:a05:6512:39c3:b0:5b8:f42b:ee35 with SMTP id
 2adb3069b0e04-5b8f42bf011mr467408e87.51.1790494135280; Sun, 27 Sep 2026
 00:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 27 Sep 2026 10:28:29 +0300
X-Gm-Features: AclHuK9jR81YtUx1RQCcrT9bGJMnvoX8CDMxKrKA2UGl4RFqsdHHmwLzPsS4b9g
Message-ID: <CAMuE1bE9XGm31fKRf62kD_rP7xFvkjjePRTPfRSjwH815PPbBA@mail.gmail.com>
Subject: Re: [PATCH net v2 0/4] net: axienet: fix TX queue handling around a
 DMA error reset
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, daniel@iogearbox.net, andybnac@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am withdrawing this series.

The review of v2 found a real gap in 3/4: axienet_open() and
axienet_resume() can still wake the queue while the error handler is
running, so the claim that the handler owns the queue state for its
whole duration does not hold.  4/4 has a smaller hole in the same resume
window.  The other findings are older problems on the same paths:
axienet_open() ignores the result of axienet_device_reset(),
axienet_resume() ignores the result of axienet_open(), and the dmaengine
stop path has the same suspend race as the legacy one.

Fixing that properly means reworking open, suspend and resume together,
and I cannot test suspend and resume on the hardware I have.  I would
rather not keep posting partial fixes for paths I cannot test, so I am
dropping the series.  The TX buffer leak in axienet_dma_bd_release() is
posted as a separate patch.

pw-bot: cr
