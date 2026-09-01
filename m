Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569042E43D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277812; cv=none; b=dWow5WS3pG41rgAvIFtszYFtsoR9r1Z6FN379xQy/sEJUb7ZApSHMzlqDcMR3+fE8YCIzAIW0sEise7kIuIHHzMQtPJLaK+v5fW2QAOGh7IUCXHuthfYZjIODMO3qvU2+ELNzt51Vljokm59E5SXp1hHppY4cFGaajsNiMC2w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277812; c=relaxed/simple;
	bh=ajyzEffsSBkOYLQIR3aRKBK1NS8kHj7P6PrDglE8xvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JENCwie9SYD4TB8SvUVLFLQxWYSs2+MX0SDxdYRPLoE/PsnAm/pAxNujzaeoIyxRTwLifXF23/r2dZYekeBvRzGku4WA+luHf16qEFPEXMp5q7wit6v0X1Uem1WoHTE8X1gDjFHddkwqruCeKv1vw8mSC+1l/x47EYatfVmd3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+Ver7Lv; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+Ver7Lv"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1503972b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277811; x=1788882611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzaoCwMvhgrc258eCGx9+hCu2m0m8ZaOD9+JsPMrJD4=;
        b=O+Ver7LvAAalfLRKwzmexoL+t2ENXM8l9dNhVN+cGPN60oVqcqwqhh9ahQfnru1VS0
         CAL5EMN4UV/78D9e4ixNeekvmCMFDqU8yCJV619iQb2nMeS66wZf+MMc5SYw+zMdlkUq
         b/mU3BhmbSPAZqH1jLWJy93FbbnErVrQ6BltVRyVSxmzS+Zayzy1iL+hoxm9pI/sWMGg
         CWMSxkNjjMHBy5spybeUkl0FwpcTYWB3DaWzh29JNX8ck6rx84hIVET2jPCuvxehCVoE
         U78yjuMGP3NrNmlbowE3YKrXZaMI/6m9qmDgqoPFWvP6ItAZCB/7DbwPbAUnSfSV4iui
         x4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277811; x=1788882611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzaoCwMvhgrc258eCGx9+hCu2m0m8ZaOD9+JsPMrJD4=;
        b=lqmEdRGI3GGWEPEGk4q7+/XAN9FK3S0tmlapSwyZbFO+TbyFPMcyKWYrzskOQRAOvf
         8MZrbycZ7EjCx3O+bSvxK95kCwMItwjmbSNrrRTLODBavFBl8njhujqx6Atoqu3frksY
         qvST6Yg0HOhMLmmdG3uBGDgNz5zImsgPg1qjnX7tg/gfV771vXmRD+6j23i0DRp+3NIf
         Iz7qOxSglxeXQlxAtAZXrqt6j6gbSOyN6qdG/CAWhEuAh5Jqq/lPLlYkn4sZIsuIUZ/r
         NRPnodVn4ILg5M9Vbw+t7wzn0JK9t5a7dUXeckCKKVK9Gg9AwLMmRJXd2VZNAuWtca/y
         Zatw==
X-Forwarded-Encrypted: i=1; AHgh+RoFvOdSm0MHtIjSIdKHGwLtwveSTXdUwCkyaCh1vlGHGxXu6+Ju30bnSlj/Wvts8Qg0FNdxEWqXYfGa9gs=@vger.kernel.org
X-Gm-Message-State: AFuF++lW7bCv43N1+Jr8Re1ZcxYvax3HFKtpRjVEv/HlVALByayEZYCX
	FGPMZFFq2Zc1mapGzzW/UfcERsAgu9oy3BHHOnIPL4Y1jzcMEhAqsB+k
X-Gm-Gg: AR+sD11KRaE0dm0dw+8lTQvq0zqAk2lE3P4ZCI1g6dKlj8kyNkkIUVhpLqq11a9IXNZ
	eVTSyvogjpSN8YseGVGt+g+eJhSMsnMFCeaEjIzSSzE8UgVCQRV1ywrsVe4trZ4eenoPYSGu7NU
	0NC3F9zMfO4zyKCv1tdeXLek+IKhAOgfK1IqQAU1Y3Oj1/7ktFgWdaa+VSsGfufEVBRB+JvMN1e
	30066bTtH7u4P1LYDBl7qRHozqXXtoKAJ4S7ax43EXckf7AJZbrljXaUGAiQOy5/I2f6S7MbtPR
	f7S8OrM3zVB/Uj7dLmRcbo6zF6mp3Z8fWeAriURr1EZyXBZryTtQdYjmFLzhiB1UfUbUlaWiNOZ
	iXuRTfuC2ahAG6qwpzlU9BAHZk094l+YUWAAX4/chPO4SmsxGTeRAbVHoYCjmjg0ZMOK97DM9GW
	TEF5PuKM165XT9iPCOF1xFoSXffgErfzqvpK+jKA4kEcOXsJcTLfjhMyCGTZ/AbY8j5Bw7/8oNg
	w8RzmBL7X3UfmQvBMPoDRrjN4JuxQ==
X-Received: by 2002:a05:6a00:f0c:b0:852:5f99:1866 with SMTP id d2e1a72fcca58-8562514cfb6mr56762417b3a.0.1788277810606;
        Tue, 01 Sep 2026 08:50:10 -0700 (PDT)
Received: from localhost ([2409:40c4:10ef:9c41:92dd:ad43:5cf5:f6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0e01472sm105067b3a.55.2026.09.01.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:09 -0700 (PDT)
Date: Tue, 1 Sep 2026 21:20:01 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apbrp8EaJoIfEg5X@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>

On Tue, Sep 01, 2026 at 03:53:47PM +0300, Mathias Nyman wrote:
> I looked into this again and remember now why we didn't remove the msleep(120)
> earlier.
> 
> If we want the hub driver to keep us awake to detect delayed port activity,
> then we need to wake the (root) hub driver in xhci resume.
> 
> That means always calling usb_hcd_resume_root_hub() in runtime resume cases where
> resume is caused by usb device remote wake. (xHCI PME# in PCI case), even if there
> isn't any port activity yet.
Got it, thanks for the explanation.

> We don't currently check if runtime resume is caused by xHC PME# wake in the xhci-pci
> driver. Not sure if there's a driver api for it.
> Instead we in resume sleep for 120ms if there exists connected and suspended USB3
> devices without port activity, and then check again.
> 
> This msleep(120) is unnecessary if runtime resume was caused by userspace instead
> of usb device initiated wake (seen as PME for PCI hosts)
So the better implementation will cross into the PCI side, are there any
plans to implement that? Or any interest in it at all that you know of?

> Probably best to just take Patch 1/1 and look at this xhci resume part separately.
Do I need to resend the 1/2 Patch independently now that this one is
dropped? Or it'll be taken as is..? I'm still figuring the process out.

Thanks,
Lovekesh
