Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD61476CD6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249753; cv=pass; b=l83XuoQLB7WCrRrudDvTuFN0VOcPtJ0kwLZmWVk9Pg9tmGrNi8olRTK0GE/psqkfTucSA5gTblt7RdPfgjxiWcmiNrrq/HF2DyBvyZrSTTd2r0s+KANsSSdiGOFkRUDVU+gkxqs0zphgchFu6YQvD0NCth6ek7SWd2xiu0cVONo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249753; c=relaxed/simple;
	bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDQPSmElWJC76gZ2Vq58PQyzTAPKERtL5u84DJo/SAzSmMX+hE1qpZC0sHer2PMKHyWbayqV+0+C3CYW+D6E2iLiV8ht6VC4UgZAyFMyCG54mhwMmy/ccP9EBv+Mg78M7a4bvDVWUIwO6ZTm7/P9w5i3SgvV3oYiqPLZZEj3gFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=xK4h+BEG; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="xK4h+BEG"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6737f134de1so125316d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790249746; cv=none;
        d=google.com; s=arc-20260327;
        b=P/f7tDDOkx7hLrifVQ9EKYssOlLqN+rVp5RiaVDuKbvulSNxYVtn5nOShIj2srWbzl
         TSf3do+OQBMHFmkcSRkMoyMtDbM0WKq2pw3b5VwUivkUY6xa+Dk5ligbdlpfxdrFWZ9n
         ojGhzrzXYIMi3PWFPLcXxZU36+6QlAMrEYonARK683KDAc2E4NuGr4X58rKUg871t1xO
         1L70XRA5QHCBRfQRop+IlqTG8ALiISRnGY2gkVq4xCoYCc9MRgTSDqhH/7tyBaC/FwDC
         1qsleFzI+mTcWc2Gj9dU0eMS/iTuPx0URsTF3CPkbiMjmyQz4c1zeNMWV1uzXw4tlEmU
         6nEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
        fh=90HNUtLQWLuyGnwO6Jexrv/GWmJVuhujUs+R15Su9Hw=;
        b=TGDuK+W2mlCLCPc6AiFN2KD/UFFb1ymuTe/YjMQ9eD7uNtWtfDezKGPuJdK0sVKWVx
         wz6x/LKAmsMV/AcGOP7RWS0pmt+agB09gG366tSyonYSFdnKl4aPV+BxBxxE0vA5PW0k
         lnxWqSYs9tqedp9obcB8mP5u4WEoQKshqRetHaemklzta3sSihfpTtbhMX27KP0W6oGS
         tk/WN1lYZQos58RX/wzMKsRohp9e2DF8pwwcFOWdgaJa/h1wYpyWa4niWRVbZPSzAmfC
         wx1SouUb30S67lTVNsuqM8WH76uTaSHCz87bCW6nMC+a4saePr9Lg+X2tSEicyEe/tS8
         GPjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790249746; x=1790854546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
        b=xK4h+BEGyL+E90xx9DgrNVsR6LX4UDsARJwaIBG2gY5vy4ER/CTK/f3S2qfBGCrrfe
         O38Od+Enb4Ma6/sVWoNVe2Sn992OWTCj1IgISGm1Q49BdmaRg+7GoeXgSaQt17sK3WBq
         I6Ytmj24dDQ9lXRtVNHbbyyPBGu2jEbqBscKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249746; x=1790854546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
        b=a7P82m4keb8sEQE4o3QDaork4VEUHk8pB8hox07SnL12F89RjmDZpSyRuVoZaYDL9J
         aEeHgFvLGNqVu9Upgi7ip5GyH7/PZ+OZ8vuwqYUN8XmrIfU6vpbo5AV+yFoJTiCFEivP
         XA7tUuWNrzTORwD4A1XBEmuZRIAHqXxl7DZ/z5CbCTZbvHtCCUj+wwsu56zM+rnjtkn1
         WIhcq96uCxFaSELTpNLE8/JIDquiZsOkuJUgNr1ByxQhXiF5SR5i0IPlQlMhp6uXjtNI
         spd+dGZDtTkptQ+sexBw94OxQ/eDT14T22HJIya5l12dqc39QFIbHWDilaiWhQkgH1Z9
         1q+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTmlOa9D7Dnycq4//Ga5yoUGfjeMf2z7EgjAqf2voMBtEtupU6l2OjWTgvasRBt7FXZlD9yKJW9x1qyd4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYjxZkuqLAt5VH7G5JDKk/+43Rz6iLX8ehI/yu7IcXU0MUT9W5
	h3pyzckoUBMC2Y+nH0zPxgqmsWN1yq7p9uUwRa9FkRso+XHzo3SZm1q5QwDZgL5kiiS2L6NJORy
	+MyC1/rs31pJAZlmrFkkClzUAQj6RENaTybigPLo+
X-Gm-Gg: AYBFou3tx/nkvSg3DOZxz7IhOrw8/v75nF1P9KAzlx8DTbZQzQZvHHp7O9icJ2/rJu4
	JQzVhR6nINTQLYCVBQ0pOko4e0dFFzW705wMcUEnU14Fr6shp9MHHVDH/8K+5rhj92N86IeA0YV
	LwTeQOSbxp2dx4dsVESKP6xeR8avjQImrHbVOluVdKX6Tv8K/rCfua6o4HVGPtHJlCaRC8Mu3Jz
	NFZviwbx0jKuJbSRJRQRKOADozlt1A8KWBZHH8BKxYknk+t/kGWV1O5lv7pPdLdIxP1n6Bhxso7
	EuO+QF9eCRNhetAShbiYJjaHXjJKinijMjJCPNZEisn2sSN0zgEYA5tjC3xVOOsDfcebFA==
X-Received: by 2002:a05:690e:d44:b0:66f:c1be:318d with SMTP id
 956f58d0204a3-672ed4db1a4mr713251d50.100.1790249746028; Thu, 24 Sep 2026
 04:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922180458.5c54ebb8@kernel.org> <20260923040136.13432-1-hemendranaik@gmail.com>
 <20260923195323.5413f128@kernel.org>
In-Reply-To: <20260923195323.5413f128@kernel.org>
From: Victor Nogueira <victor@mojatatu.com>
Date: Thu, 24 Sep 2026 08:35:34 -0300
X-Gm-Features: AclHuK8W5cypXoOg5YOqWG1817rRnO3Ny_pZWJxth2uHtxKh-dQ0MfUQJ9PpABo
Message-ID: <CA+NMeC9CWgt9=0=_HjNH=Fsg7igmFqDS=VnqWh6tZBr98ZkPgQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow class statistics
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Hemendra M. Naik" <hemendranaik@gmail.com>, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	tahiliani@nitk.edu.in, vishy0777@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Wed, 23 Sep 2026 09:31:36 +0530 Hemendra M. Naik wrote:
> > Hi Jakub,
> >
> > We have vendored the temporary UAPI header changes into the GitHub
> > development branch (https://github.com/H-N41K/iproute2-next/tree/fq_pie=
_class_stats/)
> > as requested, so it should now build standalone in your CI pipeline.
> >
> > Please note that this header sync commit is not present in the official
> > iproute2 patch submitted to the mailing list
> > (https://lore.kernel.org/netdev/20260922211139.38570-1-hemendranaik@gma=
il.com/).
> > It was added to the GitHub branch strictly for validation and testing p=
urposes.
>
> Thanks!
>
> Victor, could you pull this into tdc as well?

Done, it's in tdc.

cheers,
Victor
