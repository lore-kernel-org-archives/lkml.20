Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2233F2100
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745836; cv=pass; b=TcXJMjxV0od2eS9WdMmYUqEMHbwMJ11ZbUygHj1PC0Pc1+Nlq2BJyEOHb7kKc+ZNos0V/nzd4Pu0XAmV1ue96l9I15H68wfG2uGyaPLMLIHz26DRIXgmx7yx7BUel8jrMjFaZO4C3SkVCJpnKMDJs8QPkL8M2Ld1cPHhgz+iC8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745836; c=relaxed/simple;
	bh=kqQV7FOuBNOfwsjfxs67LL/EcCSG5E3GWVr1Xi4F30E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6W3cJLwKplrovZUk7pZqVcw/vmD3OUiGg89QBllPZ7WGZNCuTv+Ll/BuA5T9BGBALnPicPd3dYR8+2Lpp859kkxkG8tIaX1tcCazZLxULj3Ut5qh/nPScqLVmgGNjs9DDcs2w/T/vIHlQ2oDi1jWNgeB6IpfhhaANPiQ/tSXoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJsSdFTU; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJsSdFTU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so447678f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787745833; cv=none;
        d=google.com; s=arc-20260327;
        b=SgEDKuqKYJ7/oNFCeB9xTu+lB6VoZgFYkou9qRRmWos64ISmVrMjOdf84vpNETuVUa
         IJlWEtd7GYRpM5sSlYJe68TfYtre2jvKLtlcuxrA9O6bvAxryyDgdPyXfqZ2LeN17uRu
         M2dN6J3Z6stZwBHKP2Wh8qwHyKAZ1SHaU9V0iOLyjDkqdcph7/Zcz0H31JGB7qcMuf1+
         Q4dX+2Vsk6r3w8/J5PKZwk20IiGXrH9i8QN6mdAcdGgJR0khcxCPdvXuOD+2ZhxGwi8N
         M1pRKJTX0V7u/QBHzDEc96LfySE7kwHExEt00A92TaQ5dXQCfV8oTFmLTl0auYtP0ulr
         Ji1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sZarIr+UucWyTVzB+5Hzy/ryJOKG+tI53G/aED1uVt4=;
        fh=YD1g6zIQx45xBpkDn0BJlpm5YIJCpvLtQBjm2NTxTXQ=;
        b=dE3kkJzZC6ax10H6SlNlDdvG5vrC5Q8xuqxSwg5SB2ZNAUNLrNCA6w8sRb4ByAlz/e
         JI/ZmLllLlns/iL/cHbFDO17inQzy6uB8vMOTHA64grG6X7d9G2YnCUOUTkzsCxgw3mY
         aZA3b7lJw6sZnbt9L5hzEUkx3x9fDBOY8NPepNKdkCF4YWJi3eBaAFSe8Q/1EoNsweTu
         4d7tu0m/WY/ZFr3CzGENB4ppdPlOsba6PW6c384dlXdQBq2Bicj2N+7S13P19Ke4Rdj7
         vPX/3u+rCYsRoX7d6eEOVY/KGa4TCGYcuPdPCae+1kUrYAtOIe2SHftey75pXj+sFGVC
         zCFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787745833; x=1788350633; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZarIr+UucWyTVzB+5Hzy/ryJOKG+tI53G/aED1uVt4=;
        b=LJsSdFTUFlhSxjlwFeCaUPlDhs4gHq5PKVyPb71YXFH1Zz53gaMuyY2sM+2dA3vOvZ
         p3kbx8NX0/ms7/NUu7/mHBk5HMnTA+mJfKC5yg4W5ZuzydeLepyIgpul57bscDTJlRDw
         85S9ti9/YTMqNqrftvLqN9OZkCuTNJQDjyi/I9enoHZbLKp3paRDteTldMoU27Irb6qM
         ABFyDVGt2GZGlno1Hnmi7jKk+hYy8jdQIHYmj455cdk2cgoWOvkahDuvHACmP2p2TAXz
         hLtR1csMoD2WThlVpt3saL1Xc46tSFmeLk/5RG7LMWtx3rLp+O6YxTgLETS5afjN+v7H
         8ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745833; x=1788350633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sZarIr+UucWyTVzB+5Hzy/ryJOKG+tI53G/aED1uVt4=;
        b=X4jLabC1YTISBJJN7ddprDr1s+zx+Sh9T2QQdeLtFMonZCn1Fq8iRXNtFQuQUEzMVC
         VFttWiR/yNB2ANaDj7+xwAFg1kkn/sk6UF+eoP2IfvXK3fHHi6NO4rz35yrf5ErZBa1Q
         sQnMxPuV5UIJO1aa7uUvPDruhmetdihlqpqMpai76x0Y46mrgDawS4t/9Xbpa2gQTAqz
         GjKznzKPzac94xgkkPCTalUJNzYMPUdnZCXjLOTrysFS3x5wnsPL5UN3GPlPmKx+6krW
         +JdfBAGOss/KF7yRZkWzdni2TG6GYntafcwGbr8x5aJNx7jdA9gRlq9Vg7f0PHXd5Y9P
         lcfg==
X-Forwarded-Encrypted: i=1; AHgh+RopHs9yBk6UNE/NN76Ml4+gVlYW+dJ5mX8sGzri73mmnQwi/TElXWiwKxDkKceOcY1IlE8kYsnFMrJUyrM=@vger.kernel.org
X-Gm-Message-State: AFuF++nhNn733b/bOCw8OOXrrmdb7jwvMLjs23Z6zrDFH1CbaVRphkN2
	h5ryd3gnBixjyio3urN12szpWpVykZ9vzhLpFDCtzRmcmbxekgq+fwqeCV+TpHzoem3TZ2F0mPb
	uMar1ia/8Mhh0OgLvOIjYXPm3A/6SdRo=
X-Gm-Gg: AR+sD10CfNM7OCij8zlFGYRJRv5VB6SPuc86pl/M1zMcrVjm2raj4MA76UTXEX8g0Ea
	Cb8HZbMOAHWM2/7ubfRzK0KCirJKu0X7JsQkdieifD5AK5Pk5hkxi+Z3bsUm0jmtHl96lB1kNsU
	uIT7mZ7QgS56+wXNR630KGiIT0U97p4Hys7lAoYvu5qIUODlrEeyqnsvRhN3xlHY5bJWDc3/rCS
	OqUXoMQS/7C3GRZWxJIBW1thjhF0Sv7WstGf4Z4gmJ5SMVcWRJEN74lLlPBDx5vCs7O/Vktu4fo
	yXnrr2Cmg84pVNw+Hc7zvjBCAF015eOIIPW4iD60zofFv5XWAJwebbRbKFVuVdUikgBhbK8aNtz
	1Ig==
X-Received: by 2002:a05:6000:25ca:b0:481:3db1:a62f with SMTP id
 ffacd0b85a97d-482e270a5fbmr6535891f8f.17.1787745832819; Wed, 26 Aug 2026
 05:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822124531.644834-1-sammiee5311@gmail.com> <IA1PR11MB6098D3A31961238BCC060D83F4AE2@IA1PR11MB6098.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6098D3A31961238BCC060D83F4AE2@IA1PR11MB6098.namprd11.prod.outlook.com>
From: HyeongJun An <sammiee5311@gmail.com>
Date: Wed, 26 Aug 2026 21:03:39 +0900
X-Gm-Features: AcwNN1VYn1rMJH0uBE8WqY0o2i5MTuBv0noINf9T0z1pd6bFWRTrogWnyxecfaI
Message-ID: <CAJciObF_qN2G0RNpqO0N+DURop0Ja053QY1krfneCT0bmmv51A@mail.gmail.com>
Subject: Re: [PATCH] HID: intel-thc-hid: intel-quicki2c: size the input buffer
 for the DMA
To: "Xu, Even" <even.xu@intel.com>
Cc: "Sun, Xinpeng" <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2026 at 10:10 AM Xu, Even <even.xu@intel.com> wrote:
> so it's not a problem, that's why you never reproduce the issue.

Thanks for the explanation, that clears up the SWDMA side.

I had read the RxDMA2 side as a separate case, and it looks like I have
that wrong too.  input_buf is max(max_input_len, SZ_4K) at
pci-quicki2c.c:607 while THC_RXDMA2 is sized ALIGN(max_input_len,
SZ_4K), and LNL leaves qcdev->ddata NULL so the max frame size feature
is never enabled.  I had assumed that gap was reachable, but you would
know whether it can be.

Either way, please drop the patch.  Thanks for taking a look at it.
