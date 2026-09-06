Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA633B42C0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714580; cv=none; b=bEQAuAREvyO3+BJLbQqRo22e6PoKF6H5vivKjmS9+lD8nxnCI3kdma5sc0xc/DhKISUPm3DCvS3G2iv8MdMtloYIyXQdq1hpUtIl6ffJXP35gZ0PnDfpINDJvAl1DQnpEEenzCOVobchGs48/mBFPFBc0mRY/XVGiHllF4Gm5LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714580; c=relaxed/simple;
	bh=nhrOTQyh7UMtQn++M8YzWCE80xzQyVC8r6SweaDBB30=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TAB/dRKmPVGe05xMjWBI/JYQaFq9VjrzNV9YlSmg726GkLq2i12uM9nc2rIU4qF9I/r+Z9m7uIdZwJy4mupsUiYv6H3xq59MiqRfK/vM82tnmGVklH4HBb40vIysAg0BLkKd5M1Cdeb8MiP5N3juR0hBbda4bXMI9muJMJWOQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiP6r0mY; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiP6r0mY"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66fc2844f0eso2618418d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714577; x=1789319377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DnDqiRyDIRazRpP6ROT2Wb0aydA/WE32NiS4KyeFgZU=;
        b=BiP6r0mYUopx2Wk8A73Ezx23pVme8oQ9cJFLOQ9nesQy1OBAdWVeVWf7F3rct7Pcfq
         ugbPsG7rrLrbFC7Kaf84OMVs4NWXFZfyk8UkjubXN7Jkiw1s8a/Sqx3bEXWjHSjXjICS
         10WmzfmE7JwcbcJ1IQQtYjjk/jsr7KMW27v6Bq4KO2kJ72IbzlbF1nAGr9g2XSPlUaE+
         DdfTS6QHFWPMYJLbhvWJMglv5+ayTYHMH9Nm4mGeVT91/2aTvHr0pNQYGi2exXrIz6dW
         qJrpOCOhzVdcTM5SkKjAcznbhIPv9nV89YN9hvChbFz00VJiaHv0CEfk5IxE6EVDOJ0W
         KlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714577; x=1789319377;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnDqiRyDIRazRpP6ROT2Wb0aydA/WE32NiS4KyeFgZU=;
        b=jwOjSwz08dMF/2dd6kylp7H+SgoXq2nXZRT+WSQqycBsiMxknCY/aCN4dz5IKcY5Vk
         ooFxnDeu6XbMlAqCHvZzraA65lNtih+7b73et7/56b+AcyIuIGx81Oym+KmKA5p5FwOd
         0utr0/PxG479LNEIJjEXECjjbQeVl4Dm7f47rqNdH+rB5gK6BkMcRlgLoi8sRj55Q7ri
         HHCM0eDixMsgRkLwQ34Zg+owPXL1Zr5mzSZ4sicgPXoLnvyJC7jg5Q3Rtt3rbxXGKjTc
         5CDC/+hpW7PsIuFlPRFqy1nXxRH1LbBZ2btJLk/thg9JRPPdA0B1Fqcl+IafSHC5x9VM
         hEuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO4jk8wiS/vgKzkAB+CuMbqOdBbCad6yw/QFK6aiGRwxuLsHu7lH3Ucx3cSxGZbH7Xyc0KmSqqVa1JDgs=@vger.kernel.org
X-Gm-Message-State: AFuF++l6A1TQakFSibscn9a/cVWOEsKXF3r/EEMC8uZNdWVJoCl1vkJ9
	sUoyAm0n5YEymU/rzaMMKxAjPPgScImOnSLJtRELWQo3Z/DUu/2H9a0X8XBCoA==
X-Gm-Gg: AYBFou1YN7hK96p9TMS9PvcMCLLTeGyym01+X/wgYkHorMw3s5x/+czsT0vD/uuSTT9
	1VJaV6p0fVS8zlLhp8OKAW07iO47oTylJpvo5T8Z4IjWexppLq1vg3xInj35GXfRuALZyMcGy95
	d2N9iN2Z64lB/PY4eyAY1sNVbTwNRWu5BRQeebaoaHHjB9qvc2aiLmNenLQqjLu94DSL3x9tKDE
	P8Onc8ue2oA4q54U0CScJIQP6o4epDfYy4lWCBtH+O0xTyyjBv2rl4w9m4ctbD0T7SabFh6NjUW
	Xt88uO2aScbgVTHYOUNb17DJZfK8rHCd755GNpzYY8Q/u9JglrUI2f+CGj/0FEM91s/Lh9B4zmw
	whNWT+nplA3aGhHygyX22OaGP+1uWSQ+5934OWGrsbwClnnP2HRSOHSIs0CVDQUArbPXiXaaNKg
	LQM+9uBJ/mEi1iSj12YlUaEESXQw9pBmoeHFXanloR19VqNKKeNA1b2lpCKDtl96xtyV3Bd6y93
	2O3meOdPHJkWviIKBx5ynptag7UN89+ldmIq0soBA==
X-Received: by 2002:a53:bf12:0:b0:66f:c1be:84e0 with SMTP id 956f58d0204a3-66fc1be870amr2769319d50.78.1788714577274;
        Sun, 06 Sep 2026 10:09:37 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm6679692d50.9.2026.09.06.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:09:35 -0700 (PDT)
Date: Sun, 06 Sep 2026 13:09:35 -0400
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
Message-ID: <willemdebruijn.kernel.6b59f4fe2f7f@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-4-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
 <20260903-psp-prep-v1-4-d47e9c4c375d@gmail.com>
Subject: Re: [PATCH net-next 4/4] netdevsim: psp: drop tx key ops
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
> netdevsim has no SADB. The usage of psp_assoc_drv_data() was always
> obsolete given psp_validate_xmit(), so we can remove nsim_assoc_add()
> and nsim_assoc_del(). netdevsim::assoc_cnt can also be removed. PSP core
> can track the balance of tx_key_add vs tx_key_del calls in a future
> change.
> 
> Delete psp_assoc_drv_data() because there are no more callers left in
> the tree. mlx5 accesses pas->drv_data directly.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
