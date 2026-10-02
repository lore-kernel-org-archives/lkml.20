Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93307435EFA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970887; cv=pass; b=l+NerT7ka1KjS6vTBQ5ZpbPoegtgF9Ss1Lq7VvFYS9wEOD8QRUJ4Ufk4dV5EKL1cNE46u5aif9swj1JcjdeNIsTddiC3BQEedGjDT6qNkJmSFlwtMR/pzSjkrjz+fOXB8wXuBQ0bZHv72zeSefed+XNTkKvfIOptzSPS9MZvJRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970887; c=relaxed/simple;
	bh=N0X02+qX1ELSle0mhMXX7fXns5jHMk1hbZWZ56LRbLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQLWowQVKM+COUW+qwNX1GBmDWbk10+O27qDbqcd7Xe26MzLuaANwNYulyJiu/RQl9mOnuG3Cv8xghkSZaUQJe2aaQ6vkY1yxe7fC2GKNBBTkLk3AQS37dhR2bRnncmmj/46YjAnbEKFtj7RjOiGmCyVonVKql/nMDlhq8Zk618=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFmNdVwH; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFmNdVwH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso1750595e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790970884; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/onZ5JkzmNurDB4BX6vJ+SxIH81W1eMEZO1qH+DZwP8i/uwM7lPw4uTmuSCC2lxqX
         DptImdmVIl+U744Sg89RQBABkGonvDsMr5w/BpRvpGaeQT7ISbb+j8cNG6GHz5iHPXkF
         OvpGcpjA9Y/ZLUDmjXrONfLPuvCVMCsqWLXyggKhq1xwZf3R9vX8TinppmEC2NzzEPTx
         pjgYDssgnEjIiJDyjuyM0rk8CJZLtMAHcmpAJIydCJFLPMt/fzN/Ctuy3eqnKrqkBdiY
         zvxLsNcu6d8rfSt1DBE9VtIKzPpVIxV1ObkJls5wiAnxVDgiaJjLh7G4hWLamsoIN6Rg
         VCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T56mB/qO7F2b19FjXTV0J3sIArXRsxwJOvZayG4wLs0=;
        fh=LlZfA7JTcRGwaQsDzrY+vpFMIUXqk/2fGf8Jyt3zWIY=;
        b=apRPd0cC3rN3QVwXDbqn6ZtxOK2CpIJMFUg4V9Uke3M/rhFX3nw5vyzyrDGJwa8rO8
         VBp34wsNKpJaVSAC9+3wZB1OHHMf1Tnu1pcrz4cDlh8ppH0TLGNe7x51nu+NEDZfXRmx
         Z5QnUFPCbjvyP0cdmDrOSJRPvQJhbx5224ryqhDrPZDTJWb2Ql6qHO5zG4ITGYqu7wJR
         0hq2N1vERpcRdmEz6rzIZpP4+EXDvRoN7QokuNvTwgI36ea5jc9HnU1QXmAVZ3JE5HTG
         xzxbOxeWGIBYUYG0iVyzZZCV5ixRur3APLsFGWwWcYkwp/TcsSGrQ47nxnmok9e4yxmE
         ZBYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970884; x=1791575684; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T56mB/qO7F2b19FjXTV0J3sIArXRsxwJOvZayG4wLs0=;
        b=ZFmNdVwHByKMMo1Pr13/PQlCjB/vBL1vIASx4vZmpiofJ4I6rkQqwc/ihiYzDQDgfn
         9FVqk+H25Y+jpDJB/GvFVgiXSolBbcotjvCLTEEU7GDtswMF82vq/Ha8RRWb5reR3h0f
         0wHG+wRhAg5SXiI9hIFHINzuuc4Tl9cVSmbDBwSFlxnwD+qMTCNAzE61JpZs0QjQdzMP
         gUNk4Evbi5q6hcMQsMdFejkCvbsGN04nf1pizaoxvhrhz++zfH6zMsPwmRxxYENZBC8D
         RmMup73HcTi19uuj76sZWGwmThPHOuoS2pJTsbwEkq5r8+eVwbhJL2xhkuMLvzwuB1yD
         CnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970884; x=1791575684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T56mB/qO7F2b19FjXTV0J3sIArXRsxwJOvZayG4wLs0=;
        b=l+AdVIGHB4TJ1Tmj+459eLEv+U/s32GT2LDFDL/lMEBbQwaPAG+tYVc82SroCdg8lg
         vBWrHlI1IFE8J1i2Dq1O/0ucTzwutfvWqc2sJ8dhlBiNXuheiGMQyyyeTQejUjg9pAY0
         lBWGy5WF1jOgwAyD8C6pspNC1hDn4KGbwPb9cKUOPXJcPCDCxcKCx3T1ZsQRNPRHrPSa
         iYJnHX2DDhuu9x7XOIC/0VzQGRk4F8wPDYHde9xka5e3MuTkZCQzMtEt5VVkZAQY0Pvt
         qzFPjFBCeoM+zaMkj7Y9DJ3weWKXEM2UCvIA/XltFpK3eWcJNz+ypur2ovBwtxY+1hOY
         T3ww==
X-Forwarded-Encrypted: i=1; AKwUvBxJxB532vnJaxCBALB99BYaj/DfZF4ZCN3p5yG0Wxd0p1P2mkfbXGL9REjOouIdU2JgmHbncCJgdr+Nn6c=@vger.kernel.org
X-Gm-Message-State: AFuF++nrErtSK9q7PQ/XzLayEUkJD8N/WJ7THaGjl9QJ9B6mnR2ETxYK
	wvSSqn5EpUuEtsSKWp0iA/+hf6zcdqnz7iyph+EpGcmp/ulpbc77HoVwNAd9MV408w85+QZtS+v
	L3ZcV/ejOr3gxeG3qN/R8APhY9Czf4sI=
X-Gm-Gg: AYBFou2EhrrHLVikHyi172CPRYYW4GX0kg9TgkhuXT/itDMfq9Fe8jhsoJYOeLkYJwj
	tksloQ7EakyPtLKbnWNh+nNwoLOV9dkZlfQmIC/sZPVVMVArkVnpHINjaIit1fZ3T2GaqkuECpQ
	nlBkPL1A1CliT35i0gdpWaOIUj4B0tcomuls4sV63IUH8btHTSCM+6eFQt4DrrHWEht4Bi4u7g/
	DyXY0KdIymmjShI7G3vAQSUph8rExsR8+7c3tP/J7PPXkGNrkjpmjRhMtwchDJIlZrwWAAxNNF8
	OJy5PFEu+fiwS0WMl6ZcelobFptUCxDnG3NFvdf/CSm9i3z8rTBYfbhsbJKlOlMqlm0vFnrtuYg
	BH0ifIapsZdSm5jrxZczYZIXwyrV40Y5hFw3zi4+wtMHLI+uM54t1svh1jeh8K0QAIzTByvXtcK
	DNPUWOqijT783A29A5hKacggibmdNWZeiGFzB7WiMBo/QtDekfQLmDNmhaNrGUJAIpPC5Pi3PDU
	QJ8Wsk7L3xCuEzrrMTDVkKO0RA=
X-Received: by 2002:a05:600c:34d1:b0:4a0:1cfd:321 with SMTP id
 5b1f17b1804b1-4a027579e86mr73608285e9.12.1790970883466; Fri, 02 Oct 2026
 12:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com> <20261002153302.5c64819d@jic23-hlaptop>
In-Reply-To: <20261002153302.5c64819d@jic23-hlaptop>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 2 Oct 2026 21:54:31 +0200
X-Gm-Features: AclHuK9A4vQb0c3SCwfTX0zGIN6ZaHH90-IWtc-T6bQxe6DLhdppT_Ep7cPDR3w
Message-ID: <CALoEA-z6Q3YyYZfLyRixk9dPy8mn+mmVJVUrjoCZb6T7FXcDSA@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
To: Jonathan Cameron <jic23@kernel.org>
Cc: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, gregkh@linuxfoundation.org, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	andy@kernel.org, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	error27@gmail.com, narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 16:34, Jonathan Cameron <jic23@kernel.org> wrote:
> The driver no longer exists!  Support for the part was added to the
> adis16201 driver and the staging driver dropped.

This is also a case of "idiot reviewer forgot to check before reviewing" :/

--
Kind regards,
Joshua Crofts
