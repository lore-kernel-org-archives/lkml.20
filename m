Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CF23C3443
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166530; cv=none; b=StBFdpjli4MdEraUtaIorueTrRKnXZx6hxlvCreA8SPNoZtczD0BXGhVp+XA0xrDxn3Lr9+wo1j6Kc6PBM+4wA5uQNlupAUploZa9jQwEoluk4SZR3l4mS+V2QPMx3p6wLPN3iQr/p4ET1+J4UWez7oFwSm4dosjiKsBGK3nCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166530; c=relaxed/simple;
	bh=Emj2orDwq+TLyUpyoqbTeu0kDi+iYHkJ66Z3x2M3kpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yf1QC70P+i8XgvrHtbsKeRacuZf9pSIPJmHnyzN5DlOZbDtfo37d5Nju9OOScKHtKS9Zt/gdRTu9v1ykjodzhhe71wSAcsuxwDg9iWx1ybafsA4W4braA3ATbK9DcwkA/z+x8h5balpXt9w3+o39j1xH/liCBIWDo3pFN1WXoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZwicUVnd; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZwicUVnd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so97772a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789166526; x=1789771326; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0IJ+jRiSwpoAInuExu0806wVM7DzlfDcKn5ukHmHWM=;
        b=ZwicUVndg/QzL1/tbUpHHki8gdjw72SE3wD4dETAoNEslZ3NOVMddjJiDw2FnTDg4v
         tkpz/A5mNCmtgmt3yGYoFNJ6SM7PVcVwsNZe7O9zXsX/cxNgPWCcfLqxsZo+hq/segTQ
         z1dC3pgD2swXkl119prr+rlIEC1Kp3b64v1G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166526; x=1789771326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C0IJ+jRiSwpoAInuExu0806wVM7DzlfDcKn5ukHmHWM=;
        b=c45FurYfXjmvrCwWI0q1mh28OLOAtBg4B81EEKkRgjZJStjsrZ7ZMDq19kDZclIlMR
         rmYsOI1O2/4BKqh+n7lWFsg0Fg6zx/gIQ+ftwKTfbSpyJEn7PWWGhHTwRSgi/Sikzwua
         wtFYDEfY35uD9maJEFQki6Cm+YUdB/75tunLQrIDghx4YhV17w1Nu1L3GnXXPMN2PlbP
         DWOVDowT/ospVr3AEFJvV/3bnFR2FEqPCjkeV06QQXypCqq+A0Y87PVmyxdZyfmO0zI+
         t6ttyMqBM89VsB03bSe3kOYUWXx2b6dfiqFRDxEc2goZqgXEI+RG3L8gLjndY1b98v9j
         wu2Q==
X-Gm-Message-State: AFuF++kPPSnGwQPxP+7j/YjlXO5cf8Pw9qNP7WI2JGv6StYUXGrvxeDC
	q9WxyYxh5VsNbGg9tkvj6jCgIGN2XDt4HGjQXWv+6G22n1rc8f/oSNtTWE8qhMSGV3SvWehfdnt
	PBgQwniw=
X-Gm-Gg: AYBFou1UcJ2TxVsYBr9u/lvXCf9y9ZX7jGr7l1rnMLCOf3nFFg8sGGF5QeGAVaT+Vql
	Y1J1G9THyT+r2CPtt9HruHZH9CVZNsmXetincnm3XBJhlp1CRA14C1WUeiSH+ycecG2uDbQwN3p
	MNbuMDO29Q34eULYbmRg0fh+zK0admW8kk/RJxGMIwerULvoRfY8cXAgLY+8AKDHcbAHMXSQlA0
	4PAoG3pQOJl18HvVZ21j5OIRlrSyCJBgmn/tnn4VqFI12/EnAOBg45cGnFP2KbC8e8+oM8fuyu3
	gHrHyUKp2IpXYKyecXcuSFOU0klxKdXEeOuh/LDg4y8OPC1nZjLh3p49GBACaW/MYmh0AxX5MNj
	ZeMGh2umGmb2Y/v36OcTGpXTUMn5rHB0rkwZfXTk3fdwShwPnDPjjn6OTsE6Duec44Q7dheIJKG
	Tmfohrne3LL2Ggk7il5N7EOp2qTm+mYi+mecwnp1v2G/qWK1TYDEtIRIpfz9VFNu8sDIFontifU
	CnK6dpQKNokxF98ZIn/epmK+VWBHwGFnal5yG4Mf7xfYbwDAFZ6QP0iXfyJ
X-Received: by 2002:a05:6402:a0d5:b0:6a9:ab99:ebda with SMTP id 4fb4d7f45d1cf-6a9cd1c712fmr195866a12.7.1789166525887;
        Fri, 11 Sep 2026 15:42:05 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm1086950a12.4.2026.09.11.15.42.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 15:42:05 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso10718866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:42:05 -0700 (PDT)
X-Received: by 2002:a17:907:970f:b0:c29:6136:3df1 with SMTP id
 a640c23a62f3a-c29858e8fa4mr14946366b.34.1789166525306; Fri, 11 Sep 2026
 15:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb210ac8-b00b-42ff-8fc1-6f9243302b61@kernel.dk>
In-Reply-To: <fb210ac8-b00b-42ff-8fc1-6f9243302b61@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Sep 2026 15:41:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgscVQOpma5sANWVLEu_VWBbVDz3dxbBcc_JM0CcR7QJw@mail.gmail.com>
X-Gm-Features: AcwNN1UJoSJNO-vhWsZyiYIU_iBpB5lM2_Ass8azxe5zVawINj3xTfiRsZvTpMs
Message-ID: <CAHk-=wgscVQOpma5sANWVLEu_VWBbVDz3dxbBcc_JM0CcR7QJw@mail.gmail.com>
Subject: Re: [PATCH] mailmap: update entry for Jens Axboe
To: Jens Axboe <axboe@kernel.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, io-uring <io-uring@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 14:45, Jens Axboe <axboe@kernel.dk> wrote:
>
> Linus, could you pick this one up directly? Thanks!

Done.

          Linus
