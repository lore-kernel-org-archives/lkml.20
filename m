Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03C8489FA4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404493; cv=none; b=JSvffZxq9SWFDt8sNwmqY5sOJuj1Qatri+Aej/4hqLmjzuV5GmybJqOSnXXWjNyq15dqJdVWW/DrT2Chnh80vlU1rVJP0Ts3sUJ+6tdUz1Y51vG4+pXsLi4QMH/7uzq5kLKzKN45XWePWlkVS0qLE5rbLCkgrjp+lRvQ5ZgAKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404493; c=relaxed/simple;
	bh=nQv1E13YkzPalp5ZoDTBV98THL9e7wpxBV655wN/rkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G7yB9WlLoQdL3lla2uM0K6uJ+ARQN3xFyZ1/4+8JmlZ/5HVJsZWgCcxKuZuDXQZ0lX1HDMgMxAyHfOJhHS/bGb9BeH7ct8S+vxUfN2zra7HZ+csAPqRJNdMAA2aZq03JfFzVyXmHbqIOiW6fXrRB7X8CK6FI/ize2aiMoLY09yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJewek0L; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JTKwblkb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJewek0L";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JTKwblkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789404490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
	b=fJewek0LlHZCVpBR8Hggh86aTN/VarOPT230e+kqKI+HYP+EnxrBTvyi3uhBIYxYb1r1pe
	cDsLIZM6Y5mOXfk38B3ZnN1vs18dSlF4B15eoeS76LmzopEwgdRP1rIAnVDu767s4qTuJd
	nf8uBr1U9j62C7yKy4U639YH2+BD8yU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-3zr5f7zqO82Dg8ePxJWaTA-1; Mon, 14 Sep 2026 12:48:09 -0400
X-MC-Unique: 3zr5f7zqO82Dg8ePxJWaTA-1
X-Mimecast-MFC-AGG-ID: 3zr5f7zqO82Dg8ePxJWaTA_1789404489
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530ef71ee55so25753871cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789404489; x=1790009289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
        b=JTKwblkbjNft4wxQZLZyfktXVNAQaMzWglSwDkR271lZCcMytCf+CzR8amCFhPtaB/
         1fbQjxvzaTBtbB2bQnaDuYA/qu5r4xNsOxRqtu3GEZZFlgycPKJa/np7uWBGfmnxxXUp
         X0BeT+4LlUQA/pJIpQgcK2MJsE0fJ4Ocb6Aw0fzscqkfKVi3D1D0YcmcQpckP116+O9J
         GPEzB5n8Y3vRJaModFVpD6gSUwDqQUl+/CH50FI+CENvzCmqaFul9cailX3qeGHiep+H
         lqEAT58KpRT6TPq3qYZOIOTh1qcjq0OPZLG799BGNwZKxexbBmvjKuBKAfAQvg8FRa5L
         sCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404489; x=1790009289;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
        b=mq0MbWrp83EwffDGOcHz0e6LMbYjXEqH1Ve9sSyc7xLBGOCH0CZ/dPVqYnPkqpS7r8
         2R5QuW+sDDPCrRiCu6vy3QqRhbO1kPkxCLfp4zTuwNMbOPjTRc9bMC1SeqXEy5Q/s4/+
         b7cy/n9DzdMAnY9QIuxHF0/9h+p6e2h0ixPvWc5KXXQMvf3eZCbzyoSMQxER3+o/6TxA
         wGjDe1R53HOGRdVAa2+0UkVO4WKSO8eiJCZdS/rJYfjl4/vaJGaYg0WxpH/bkgIGY7ee
         v/Tt5IMecGQyJ+ScQBzpug48sVsM7/b7Ju8Wm7oKJgo0Dfrz/6azHeTQntC/6L5HeefP
         AP+w==
X-Forwarded-Encrypted: i=1; AKwUvBxcAKRlc7TABw8oiM6F5DxLAyFqKX8Rt2VHxsBAJUiC6tPdK6nADy1Ljj0TkOev7vx7lWu/fo8BIuIuu+w=@vger.kernel.org
X-Gm-Message-State: AFuF++mt73CqG/tmrGC9mrKsqp4PHHSPzNAg0l4XdDP9Hhyazz4ce3OW
	6arzk9VBELnpyQ2rwLyByOjOaB1LPX9bUndOUtj03hOQ0qOahdHAnNQA+fH7M/YVymr2dVExO5n
	u84wnOydj92p+Var8k0/8SXg9D35HaaG/Zw5PwUnyY55Hopux4wqrz+QhYneNbsiRkw==
X-Gm-Gg: AYBFou1iZQlDosBggzypR/G1vAU1N2izqecJlag4WQ7JEs9GSR+0UtYdq2uDOfY/5vp
	6jm9j2ca64zN4doMBsj/H+i7EjniJ7pqhHAouWxTaOYe5LwLhZaGO1YA/JKNpRI/kPIKcFg3pyf
	NxsiCXLdwSTrKIicTsT9tLWkssZ6Ci6p7GaMji0AP2dZgp9xGP2iY5PFAcIwTUTSwVfcRDtKH9H
	Xa+3H7O8LWqdW11sp+V5ULHUFRzXZodBpQpkUsvw4iJ0D2RAJdCW8XHIUrJUGkgyvRb1Wx9Xja4
	WKt+K30RyjDbJ1u2PFIZJncI/RtQGHq6ZwsyoxJGstocll/kM9nW7rlkYiD37EM4soch1uWNSUd
	0ajR/o5NNt2SNCEthBY6M5w+GKKJlwYUApCgEyUNx
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51736211cf.38.1789404488696;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51735621cf.38.1789404488088;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm104363801cf.9.2026.09.14.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:48:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
References: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek Clock Drivers
 submaintainer
Message-Id: <178940446474.51095.501258130718058993.b4-ty@b4>
Date: Mon, 14 Sep 2026 12:47:44 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=344; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+LRTP52U/oWNmbfVd/dRn41R6JZhfEc41nXAbJPqOy0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJWqLosfyA364GJ7ESnXd/ZO36fyFZiL+eeKfRCIcPde
 5vTPIuXHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRTzDf8/S522nJQuW7m18
 cTj25s9nGxdedWLcpWzh2H3f8lH76zSG/9EhGXrvHDkW9/b4PzzBJx0qcPSXa/hRN+9URgNdRjd
 bbgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 14 Sep 2026 16:20:39 +0200, AngeloGioacchino Del Regno wrote:
> MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer

Applied, thanks!

[1/1] MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer
      commit: 6b838130d2759008f8e8a80093c9eb6fcd435707

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

