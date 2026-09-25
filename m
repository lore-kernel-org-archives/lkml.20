Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5E485505
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331552; cv=none; b=pD2i95hINKX06v+afiL1E6WfstU58wU1HU8HJTiDyz8p59hWURv7bjWUYYUb8cvmpySl3/CRN+rmx2q8nM2aGJ8MAtS70nSH1SqS6MaUH5zMrz4doIoBR8SGUg8IKnlesxUDTysXYEsmEGiCXwS4B7QobqPVrTHgBtkaZXokQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331552; c=relaxed/simple;
	bh=Vy0BEaJXI/sgJiHnpzCCPocdjuq8/DGs5MXWEPWVMLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcnvypGjiU0nNalqhxlGu61/eK2MZoJhWP4bNE6vhf1aRRSUdjrswH6sWRLf//Ujb0jTH5MheYTyzrGu+0Tu0ISJJVXf3SHmHubi4at2UN1CLjW7WLZdFWj+M3X5nC38wFXNvvCADWL4xGw6yMnuBV26JuUdnbDN4t+OysFN7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+ChUMlF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+ChUMlF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so163962f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331547; x=1790936347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uzt8qnaNUNgPrBzOLY5U/g5H8B5eMSOss0W//LWBCGk=;
        b=l+ChUMlF+DbiAK5Nl2eXQbTxXMNm1SZwCWM5/eF/ZoKOoE4qM/S2J6gCDKmOuMesF4
         W2W0HcTpXxq+t2aJ3a0wRVA11VTmh573Nvv6rmL2XHHTaEAQJeQqy93WrzBGtSacWxbj
         nm7lylCNFEW81fAfI1Q5lGtPX9+Shbh2ZQFELkvvwRUOJ2yLv5x3VF/gIgmFf048yyov
         5NjVMuP1pOSbm7HqPJNDp0qPWClTWOKA/iTu/hlFlJhBUAW9X1NWmKqC/4X4nTUl39WR
         r04fKu+Z80ReW6SS7zNZZ0FDP6rHFgrcdzpzM1IwoxID7i7L9ECvzUb6msU72KcxMBTF
         5XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331547; x=1790936347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzt8qnaNUNgPrBzOLY5U/g5H8B5eMSOss0W//LWBCGk=;
        b=AbN5q9hK5QEwZowSdUtEAaIEnF8zSffLG9EesLL/uXw71YYeQKwNul7ITe8WqNZ6jU
         WrncvtwnwzX7xJtwJE855uRSc2epePBD2YfV0AJqVNVTzF9qp+qNNWgAHLEN5p6CvzE5
         Spp1V4vY3w9rT/IrmUDtjwWHRIBUQ5vJLoS182GgyMhxdczsu7zSYE/rSkG73VeTv7Cl
         iHAtPyYOK8MzNmjIpRiHINakSAr4M1e18q81hgxIrfnxNSe6fIEfgvrootuYxI3hRZ/V
         /0VJk+EAaJS+U51/BsznhM0jagtAK6veci+zdxGiZ6s2kMdmqw6YUOF2zaFu0J1/3JqJ
         MMkA==
X-Forwarded-Encrypted: i=1; AKwUvBymMGBU1AXNXf6cIgJiH/gYPgTnRUaAzEv5Ufrcupq1KfcpwIhVOmFE5sDcvU7FzpA1VfJ4PVs4zmn4jl8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyPQrsZW27pD3Xdfqll+rFALmw00K6gF30t1YAhWQgtgcvT9nu
	uMgkKE4eCCd+FotgdfO/abBUN8kTN7SIPeiX+V8cVjbrjrHl4/HzXrxx
X-Gm-Gg: AYBFou1ABh6JHcQq1klerxDo8G7wy1WuHGulJvbMMEyt0LnGv45Fng/bTvj/si97dJ4
	RbY8pWB0UZKz0t2b25wlXa9V1baSKDptoV7czNDV3NDxAC5CQ5ZrppWRRjtZjSa0yi2e8/HtUCf
	YYSFR0wFagmHzRcPBmNul8Kv1B3bLi74JQ9gPfwIq6Zd3UwCauHa6soHDIGFeTglYDW3iAMOpTS
	0FGZBxBTduxRDY2vf7mFfL741Xs9SeAg1y+64XlRwhF4tj0LBxI+yZg1yiriQNYDusaChbQk/UB
	al8CXRvqCq3cu9mWo/ePv5qJIdwul/8p9rQ9imqM6tdbL/Wwkc9iiOMoHkx+WZpy4UkGDqsRfZ3
	4SX+rztemTKDT0/QsCoJjr7BD3aqdedcUkqo6GAj1WE0HQMfkjYEs2uCh4+r9DSVBbIcqlmxuep
	E479oItfMR8GJix5w4e3PIgHr412T7LP69qXbCau8+lwq2UxKtwkkxcmbfyAr48qB2QaEAZued6
	oL9YGAtD6kcW8zwfRIR2Q==
X-Received: by 2002:a05:600c:3b84:b0:49f:f099:6f98 with SMTP id 5b1f17b1804b1-49ff09970dcmr34896555e9.20.1790331546908;
        Fri, 25 Sep 2026 03:19:06 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm56519475e9.1.2026.09.25.03.19.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Sep 2026 03:19:06 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:19:02 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Kean Ren <rh_king@163.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Stern
 <stern@rowland.harvard.edu>, Griffin Kroah-Hartman <griffin@kroah.com>,
 Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>, Nikhil
 Solanke <nikhilsolanke5@gmail.com>, Thorsten Blum <blum@kernel.org>
Subject: Re: [PATCH 1/2] usb: core: hub: recognise two-lane SuperSpeed
 sublinks as Gen 1x2
Message-ID: <20260925121902.3d75df9b.michal.pecio@gmail.com>
In-Reply-To: <arSByjrfc4e9fUr1@vbox>
References: <20260920025308.2358862-1-rh_king@163.com>
	<20260920025308.2358862-2-rh_king@163.com>
	<arSByjrfc4e9fUr1@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 02:06:12 +0000, Thinh Nguyen wrote:
> On Sun, Sep 20, 2026, Kean Ren wrote:
> > get_port_ssp_rate() rejects every matching sublink speed attribute
> > whose link protocol (LP) is not SuperSpeedPlus by jumping to the
> > "unknown" exit before it looks at the number of active lanes.
> > 
> > USB 3.2 Gen 1x2 runs two SuperSpeed (Gen 1) lanes, so the matching  
> 
> Gen 1x2 is SuperSpeed Plus and should use LP = SSP
> 
> > sublink entry advertises LP = SuperSpeed while two lanes are in use.
> > The current code therefore returns USB_SSP_GEN_UNKNOWN for such a
> > link and the USB core falls back to USB_SPEED_SUPER, reporting 5000
> > Mbps.
> > 
> > Handle the two-lane cases before rejecting non-SuperSpeedPlus
> > entries: 
> >   >= 10 Gbps per lane and 2 lanes -> USB_SSP_GEN_2x2
> >   >=  5 Gbps per lane and 2 lanes -> USB_SSP_GEN_1x2  
> > 
> > so that a genuine Gen 1x2 link is reported as 10000 Mbps instead of
> > 5000 Mbps.

Was it tested with a genuine Gen 1x2 device? On which hub?

> > 
> > Signed-off-by: Kean Ren <rh_king@163.com>  
> 
> 
> Gen 1x2 is a SuperSpeed Plus mode and should advertise LP =
> USB_SSP_SUBLINK_SPEED_LP_SSP. A controller reporting Gen 1x2 with LP =
> SuperSpeed is violating the expected encoding.

This deals with the bmSublinkSpeedAttr array of hub BOS descriptor.
For host controller root hubs it's generated by xhci-hub.c.

And I think that the code which generates it already tries to avoid
setting SS (non-P) in multi-lane speeds, so what triggers this bug?

Regards,
Michal
