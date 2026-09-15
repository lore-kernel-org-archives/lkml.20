Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8E4AE8A9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472890; cv=pass; b=s90a6eqrLAy7xz3GrBc5U1zvfFvEE3tNWdLRwUsvPJZL2NkvxCRdXfADhj882VpHqpRA5fU5N/UMwKYU1HIQXUuk9X89CpJII1iRDGkSDZPchntTAd+J91GZwE8WRggjFdcm127WjQTZ9cOSeyWUZTdQWhmtlvXliGvYAif3HUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472890; c=relaxed/simple;
	bh=D2u4z1INS3OCbqB0Da0PpeRDNT+ntWIhk7kEPI5aoiQ=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZwC80BT04C7+ec+hP9ffaXTljN8qAjO20wXA9OmJkk1KHmYC3IAmKHAd7kDcpxOu7wyn8WvNLQdxQndQYwzyqo6UkMTh12dfbzf+YkH/H2uDLZjZ2Qhi3FXR3+jtir7T4xktd4kEh5VtVqIYh1LgDYoGTt2EuNzHgEhgKZWhgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=ZeQ3JBt6; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="ZeQ3JBt6"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so492475e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789472886; cv=none;
        d=google.com; s=arc-20260327;
        b=Cq+a6BypWC/zhpvXO5J69zjLeapFxAQA0E1SeirxV8FuFgtxS6v+5m+n8Fw7IxKsTi
         fLasRk+VRMAQWroTYqG7lYjo/+n6PPSRfs/0E3hi1kiOrG+9u+zL2Ody7ftpN6mlrMP4
         ECwziRWePw+CILfeKWDmp3tHxWGRX58ycDIG0meeQYcHB3wvmB9xmJf1hKmFmszWEPtF
         qyVtzvZRYCXw+H+ZC7opwz+0fsveh00Gx82fOKossTzvBq4OnvUtL50foVCa+9PwiMvm
         07knAU6eEcf/ZS1o7ExxuedWEIOwtde2WU6bxWHGCTUcYU+do1qWtcgAiwNUIrAFmWYf
         SB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=D2u4z1INS3OCbqB0Da0PpeRDNT+ntWIhk7kEPI5aoiQ=;
        fh=xet45OMCfwwjgCsYyQ1B65B5nUBBBsOHk488ZL4EfjU=;
        b=cLJe6OSmL/ze+hdFzVq1HoyKJhg52cXSrtIVPm9Ot7nEJYMW2PLR17UFlVBT99m9Jg
         2Jlo/G3JQuzXePpYSFma36LbUGps/3q8iSY2fkQjvWSXPrOMJHh4Q5o1ijvicygRmrea
         UR0s5XZQbAWcz2ZNOE5jmH3dF878RHRw7GAceVl1iV5x1xZToIPv3VnslWxPhZRaQJxw
         h0edaXo7Y2hNZrROtK5uipUJtHsMiONITLHBaiiYB9rgOrcTuiAKDZTaHdypj4DZ3NL8
         e4+A6NUoi2E5XYDdZ0b5ZD59tcKnRvA/COzxLJQj/BmvaTKWw8ojcb/tF2rf1n3c6sGZ
         Topw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789472886; x=1790077686; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2u4z1INS3OCbqB0Da0PpeRDNT+ntWIhk7kEPI5aoiQ=;
        b=ZeQ3JBt6ZL4qtP6A5yHrgvoWtNiSYcveTyicFjb2DzvyplGtnCh33qW4ZZ+OHSQCKH
         N9TMxlnKo7a82h99ViR7psJePMZ5WHxOnKVFPtxLA91eaq9pqxREV0Od32CNvPewrTsW
         LEPwzkhtorGi4yVwgFDBpVQYCIfmU5HxUD1yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472886; x=1790077686;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D2u4z1INS3OCbqB0Da0PpeRDNT+ntWIhk7kEPI5aoiQ=;
        b=YCBAmU0OZRGXFrnKsDqoeTSDgkwi0i/p55UXpjxSPgjd5Nw5Re3nYZIFemATDcO5xn
         JEG7NPG7FH4gFyH62bvOdHcrk59ybgzqVCrA+VIH81yeJSYPJfkNwo3lcpU1xmyS5imm
         wG2Pg1mMQ42aPTKS1vDMU/tRz2wHUPIXz5UE0Kq7xE1b4WSDfOhLafSzCArzqdflbr6e
         6UIYVVdzI5cz3+dZYFopvZSsQyilVHdmFPI3c3rkt6WsJadwH7pkSgc8/R8A1OyKxLV+
         zUGu3tG0/EG9vAjCSSnCDrvnOH3You5R4LWqPBT6JYGC7htEixMUKaB+sM8j1HLneJR9
         em8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXrdowRSv4/4LBG5Kb21EwgDuIOrAqrMOx7r171jpE6jOhZ1PbL/DOGafAZTDlOZ7MzO5sGgHDF7X6S7E=@vger.kernel.org
X-Gm-Message-State: AFuF++mhBS4V4bYptlvm4H+H9gNXo73Bt021eNoB5n2P3cYkdBO/2ruI
	U6cAcqDWdGQO8pnx0ju8IwrbhAThxsWXFTJTuSgHohayFc14IWyxLNCCOrbLoBEq0LsSKsTVpW2
	8PzdWMIUWqaLmIbxaMS8LRMbJVM7nwZ8ppTI6SdCjyA==
X-Gm-Gg: AYBFou1BtpVx4Qv8742L6rhcvyo6IE42NipInzGizKdLYE8w/2fY42F3viGhGfovNRq
	H5pZwIozPO0pVbRvKlLt8LQBHuSZprY7ztdzs8hfPIWiiiVj5/zPYFqLlFMP4P/59jCkkrEB3Zf
	TW6QI2MVKbfoTw9CLxQQ+x5wmVnvFsV1MfhLfApgNZg78hkqNYFjJHSBQslgcUp6OuMekiv69ZS
	ZDb7etkgCyNHzzXOjIvC9aQnH5oCIaPUzy+/iapu1BLBn70DqStid1XQjXz44ig1VUPpYgs3htl
	LJxo7sLo1yz7pcAbIn7+z1trdNk+tUgzoZGzTFNtzXQqsn2Rgb8X
X-Received: by 2002:ac2:4c4e:0:b0:5b6:6af:4e0e with SMTP id
 2adb3069b0e04-5b8ae684057mr3533337e87.3.1789472886190; Tue, 15 Sep 2026
 04:48:06 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 06:48:05 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 06:46:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: kimwooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <20260915083849.72030-1-pabeni@redhat.com>
References: <178911388671.25348.11008812384009904081.macb-resend-2@khu.ac.kr> <20260915083849.72030-1-pabeni@redhat.com>
Date: Tue, 15 Sep 2026 06:48:05 -0500
X-Gm-Features: AcwNN1VuwiGfbvZNynavdGtn7nMsK2YRrftqALvlMAMvDCTcFiKgwLbTrVPs-uQ
Message-ID: <CAH1Bc_zWJ2HN831TjefE=1NHhYeg+8vOO+7aA1KynzjH0n0qkw@mail.gmail.com>
Subject: Re: [PATCH net RESEND 2/2] net: macb: Use all-frame timestamping for
 PTPv1 RX filters
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, theo.lebrun@bootlin.com, 
	conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, richardcochran@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replied on 1/2; the SRTSM and resume points are covered there.
