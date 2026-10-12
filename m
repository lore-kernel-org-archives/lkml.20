Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47030372060
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791216; cv=pass; b=HK35jG98li/TaFnqL9e9ETS+B07b12GqdbdeFl7bW78s6iQOaK7gGCbXCiWp+wyANlabeqrXUlNz+V0REMSKk53HmpkUiFhpBazvzNMjBLpZkfFtmsJmoeqMWDo2az9lbqZWFCaDr0tp/UIZNIqm8Ws93YkEfWz8kkOcLIibKto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791216; c=relaxed/simple;
	bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWOV0E1COM6fadOrwICeFhAWLzeSjv3HY4t8BtFaRHvtPmz5Kgtlp2yt6SbdhLb6ft3Gbf+B/jEIllM6olZfGcWCw+nGs7GqKoTlR0KzjN+SsrTLq9bjSwPuEMtGa0cwkVD1uOcLtCaE3X0VUjT6AvCa+WohAdbYBI+k1WbrQ2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Wlwa7tlP; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Wlwa7tlP"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ace0741488so10783147b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791791213; cv=none;
        d=google.com; s=arc-20260327;
        b=G6sbrSwvyg0h4hq3BH7F51w67pY9ifPMH+WlUU724YP33F7+Q9/yV14BOy4PcMfjyC
         izqW9sggkwcsP69fEwAhYBVYIgvT2YHjm1wJ7eEDAGWAhToB0SOIHubVYDVxjSGIM81J
         CdtvcDYwoQM5tgW2yahb50soJMZ2qufx0Wz+fD1C2AnUYK8VL94N8Qn4PFxBxMNMQN+J
         UHAlHf/HwhogDWNdp2j9/pSyoejQSRYY5XrvdvOE1+3kYypBBIAbrWjeZckXaK11wkBI
         +Jm8sUmzCrACSQhjcwYfEMB+bNEdqV49qfpsmgCXWDJNSXEuSFffsjkvSWPtfpk80oAg
         xs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
        fh=0gE5wtJxBkN5ISZMKqDFB/cXFKYXSB4o/lUB/VTTv+s=;
        b=kOj+epJ/o8XnKUfZ3Fw32I5joIyjkMVJ0bM78SjhaJFkR++5qW+/T7E3kddv1w+YAH
         PaCKOV9ZDoIsJcek+YE+cSMDr3CqOc4DqwrOt8VWoczgGvrjY2l/HG3oJsAbsyO18y0y
         3EO21rfvE4YRfGpGuysvnduXGcs96rTCUBebwxyZLNGhvZ7tSwBRFrf/03G08CVs/ddC
         aexXhl8aMnwqe1LzbrXJqMKtGWJY2KRtN6xsVNT87pJaaARPFuZa5+UDnwuX5M0tg3Nq
         FqVd270NkgHjj1lnjI+6Xa83hHuMVEHG452aisSxmEDMJEdUZ1BXoz7+hiXVbzxlsx8D
         bmXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1791791213; x=1792396013; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
        b=Wlwa7tlPoBc1IpaV6OHhbUXK3jPIaDkowRP0RemMbWKjuoUIolHEdOzvmXLU4Jm6ah
         HjjtGomQZyEmjMQMMondu1mMoF9kGGl+ZG17H1E0qF5yiH6yX+NgMAHqeJes7M/Ys479
         /FZPJGXyTK0sPgYXN4o5KXU9fb/5cNlSE9D/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791213; x=1792396013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
        b=cNcUjNzHrZaSyczJ7qx+jmDw62gJ/Arn0U7CNDOpLvsrI0sLZ60qvAyvgcsYIVB9+n
         ae0i5TaO0NwUMAXBbqK9PoNoszHnfl2cJVlzmcnhVa7jFPztqYTXETjWSSOGjZukZ/65
         ME0opTaMdWtRRHpHqA+nT1drGk3apeSjP76iZUZ08nbLMHAFkj85ary1mexmmskdLumW
         GOZhDagg5VxezwrGpOmu+LEc3tuM3AYvDTW2/x26b8DR0xe/2iSP8Z2oD5ilWWWWohFk
         GjFPDDtfJY3jRLK2AVENW5fIMgMjrBZToZbR6m74QGMc97c3d2mwMFMLXjj5jjfb1vFo
         vecQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJXrmKDmDcHxnkGpgwWe5u540NHZVHcJ2ymF54qWR/mAHaQIoNYtqp5y6IMixPf21LCVSbkUkaYgUpdBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGQAP2LbqNC8YfmRlgzzsuQxeTN+Whg5VAut1fVlfUfoXbUW1X
	M3p93Ql9qLH2lo73JGAoyqrMDxrCXX6swdawyUUA6kgYjnlx3b5ajscduFMPlb7NmcOuplTgwPr
	lXzmxTx7dVcOf145YAtzkwOU67u/tcDd16YHaGmLI2w==
X-Gm-Gg: AYBFou0xKIUSUrZTUbAhZ5px+qD6bEzauihsAUnxoEt7i9ciabfLiPuf2LGUsJRtL8m
	sh41p7vdSXTc9u9U1E2r5FMhC2aZWf7fDWca3686sahAURhZbtfIvSHlbZjfFjSAGTEqkWgJg4a
	EwfYAsrf7UOE4JJ3sPVoBwdFQYdhqyJAX5BwfPJjgmfzjR+IZc+am7bbqOSWwe/H4nHsfjll0W1
	7M3hlLJlRU3iWqjzZVCPDQp1o5n1U9giRBw9kFiBa/LMYTD0Z3GGT5O7K4e6Sqz/umMYX9JP2zn
	JnMnPNZjjT7bl75owg7qy4PHt1h+K8bkS3nuFG5iPg7Csf4I98LE1PCw
X-Received: by 2002:a05:690c:580c:b0:8ae:1a87:cb03 with SMTP id
 00721157ae682-8b07ec01440mr20948907b3.16.1791791213159; Mon, 12 Oct 2026
 00:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908094016.1997918-1-visitorckw@gmail.com> <asyPRtp_6AXHhB-_@google.com>
In-Reply-To: <asyPRtp_6AXHhB-_@google.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 12 Oct 2026 16:46:41 +0900
X-Gm-Features: AclHuK_wv0S7JAvE7gn6Av1ZwK-aND01tCCb14lS-XSMWIDuQ216xDlDYD3DVjI
Message-ID: <CAFr9PXmrugbSh3hweHV1YYXSNYMM4QEg0gPs6tEsJ8Z7Y721sg@mail.gmail.com>
Subject: Re: [PATCH 0/6] m68k: virt: Switch to generic goldfish PIC driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: geert@linux-m68k.org, tglx@kernel.org, miodrag.dinic@mips.com, 
	radu@rendec.net, zewenchen@google.com, jamiechen@google.com, 
	edwardwchen@google.com, marscheng@google.com, eleanor15x@gmail.com, 
	jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Mon, 12 Oct 2026 at 16:43, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> It seems Miodrag's email bounced, so I guess I'll need to look for
> others to help review this patchset.

FWIW, I have a version of this in my devicetree'd nommu m68k setup I think.
When I get some time I will pull in your version and test it out.

Cheers,

Daniel
