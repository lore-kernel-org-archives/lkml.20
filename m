Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76FA379C35
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570735; cv=pass; b=j/D1WMpwNg9rmacyCfy/OETFz6dxyQkAZpdoP+Ft26R11HS9fGWG4pXd0NTftWOwE4HDr/HtW4W5O//KDvDzxu+pziV/4LVpAN1i5kaCCd5PxCcdDLKob6bHRQz+D+eD+3+nrL9ERBa9tfWz1/koTc572j3Ffjp82Hp0+di0pm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570735; c=relaxed/simple;
	bh=AtQrPMl91+yYtI9BLCPBjsG0Yu7Rz7PLsn3mJ6H0/pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMVgxP02UqDx8gDoZB6QnWpbwPtrHRio75dSfSY5JnBts3Kju8aot9XqP6ik0QpP0TO9uImpMwsThHLQAgM2hjD3jJA3+koZKsWbGjo+dpWUKw18qYinwM5smzGWjCDbg3dvOmIDLtSvatA5J0TsXsR9CCYd9ubk36wUf8psS6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tC9vtssF; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tC9vtssF"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so205654766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789570732; cv=none;
        d=google.com; s=arc-20260327;
        b=noMvyD3KZJ3i6hGwD5IhpolNJfMx9wchCrRBa0hxaeKTfK3DMR6TmEm/7dtq4/C12+
         7b93LbfiNSab06HdWBWfTfc/pR18aGHVA516/NIOA2UMhO6HXX/diaZt9IeUxvhFVJa4
         Jlh5aGCRe9mvA3YXQPgTLrinCE7ke51Nmfy6WoUPG+hvci1KlqAn5q1ws5LaVMRYLHn3
         ehUYJVn0J5tVvZOKKYq6o6OQp+R6Qwdy20PtL8Y+o84moaLeAngCAWdoXuEEYtjO4MEy
         FsxJ2HqpU/m2ZgAK/qEcK2QURQ4RChzQa/qXzX7jtpp+/+tDkO2nc3Oxw0IM0s7CZXGS
         g50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7B8AGM6usS6/DkOynGbVPS6pps2aTMeSLXoc/PLBLeU=;
        fh=/e45o6hRo7ofKDVh4b9IVuzLmKnr+iGAernKxatW/SM=;
        b=PhD9FpKLPgJs9atSLRYeaamSvYzEHsJAaKTCwiQp4kW1OPeciLLEsPJTOSBmLqoBNE
         547IM8bH9p8JPgDpdyG9LS4/9qheHy8MW5nteWEPcAIuYPsnA9aEahcwspy0osFfTYJo
         bbGPdKLUdYjrm59Y2MpSfW2pOepZ+fYIJldfj328Q9z7hEQRUhP2oaPOtTW7HsyfFnyv
         7uRiwfCGBwf5cSIwgEroU7nBrNg0Q4Gcj2l2v6pDfkXPQxDij08GFQpm2dHoTRcteuhf
         ZpRIjbY0UVPt+kAvzjc8sxLvlqciFlxPWPu6qsZLWMRqjTOYRgs+ZePHz0IxqcwgHM8t
         T//w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789570732; x=1790175532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7B8AGM6usS6/DkOynGbVPS6pps2aTMeSLXoc/PLBLeU=;
        b=tC9vtssFRHP7YED+FiQg6pv4DT0aIDonO37ZnVDyqUCZ4dDzQxv+1bkP0tBwBwz9jQ
         cxBqDzXFyUOHth5/D5GyZH2n4VowYr+UEMZAiQLADVITanuFCLAHypEsyNrmuCIW91Vp
         eB4V6JFk06jQsBZRm6hKm53FuYMf8BuPCD/jSFAw489qhtRtDOVL8w4kRcWtVBAbZh92
         UiZwp39dec7eDR/ccqOp4u6GWLVGou//a8negWu75Iy57yVz1WhRHakEqjnbw2R6DpPp
         L/vgXxGtmn4DDPDiW2UUaCPaOrtIJYiuNM9l85x36q3GS4BTJXp6DfIDMxt4OVcbUFnG
         2eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570732; x=1790175532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7B8AGM6usS6/DkOynGbVPS6pps2aTMeSLXoc/PLBLeU=;
        b=mkZoiugphRvqXgLfJikirRfeJlV93gPJsKtjfHiVMHkA6CxmhIojUc2Vf/1x9SnaSv
         gr4PUuHDHaely/raouHwt3tyl+hNC4/yZBlQNApO/u4OG45sPKSxyUPVg4C/RtTn4MyG
         5MSMEQRBZLTD1NdAYJbnL/LXsn5Q42WNlZJ9froohlCd/Npw1fkmQumvsyalr1GockYl
         EtgyTtfniuVcZT/XaZZWEPqZSPNwUHTL9iQDGytJ/QkH5BeIbmSAgRtextyLakk3a58j
         d/fMj55n9EyNB354UvWNFim5sJRsJJVMU45iROokacE1+tOJASrgJvusa6f6lFeZGt8W
         mG+A==
X-Forwarded-Encrypted: i=1; AKwUvBzlwRFNMxAwWN1vAba47q5dS6K+xGmOCfpIneYOOG1exEdkmNLF+i263e/c8dW4wkxIsuzXkNPr+JuOIPs=@vger.kernel.org
X-Gm-Message-State: AFuF++mg6VKvfLG/+wEkIUq0fG8JppEc9vtzG9W8i5A6N6asKjsHqQqk
	3whAcjZvyi2VhhkFzztV/JflynDDNv+aGs+ROYyU9WCDzV4fltjWEP6DhP5mdb5DDL/pdPNB/Jc
	883FIUl53x81G3AUUZvmFqiWdpaGZJ4htaCeOqGzE
X-Gm-Gg: AYBFou3fzzzHg1MDy/lDM39XtK/plSktBsYQ0zbK7vs7r0wzANaxaqWezR9X6Bt0eoG
	vnooqiEdoUBl36yUzLVsOyeaKticHYQjCsKhJCtvIxUCIk7Y0ZYliSMFXRFPndmR/zDyhC0B0HL
	Da6JIl+wQbFvlRORfl1J2qO2uSwTlQBx3PaZcs50tks2eOYQlkk2GxP0JY4H1At4/gut7pXmzvU
	S61USd01TOcQ1gUr2Q7PlygYiHkZ+R0j7Lk2dyU133Q4Q0Rb4Yv8GOZutyhvQNHz0MKZ0NvGixa
	2d0BKf55nf9aJoc45S7IiGk7Kd5nT8cjKGG1MuhCQR2QlGjdCnAA7mE=
X-Received: by 2002:a17:907:c49a:b0:c28:fb3f:fe20 with SMTP id
 a640c23a62f3a-c29e52c71e0mr199279166b.30.1789570731516; Wed, 16 Sep 2026
 07:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com> <20260728221007.2098560-3-dmatlack@google.com>
 <9211b2b6-9fca-4ef7-a141-84636d56e67e@linux.dev>
In-Reply-To: <9211b2b6-9fca-4ef7-a141-84636d56e67e@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Wed, 16 Sep 2026 07:58:23 -0700
X-Gm-Features: AcwNN1V694h9Klbei55CjXCXrLccfSPzJ9ZF9qWXraB-n35v9TC4KupB_2aeuGo
Message-ID: <CALzav=dJUiZe+Hxck9X+kKVXoRn-Ks2WxV7B5i0RHRFGy7-Mpw@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] PCI: liveupdate: Track outgoing preserved PCI devices
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:10=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
>
> =E5=9C=A8 2026/7/28 15:09, David Matlack =E5=86=99=E9=81=93:
> > Add APIs to allow drivers to notify the PCI core of which devices are
> > being preserved across a Live Update for the next kernel, i.e.
> > "outgoing" devices.
> >
> > Drivers must notify the PCI core when devices are preserved so that the
> > PCI core can update its FLB data (struct pci_ser) and track the list of
> > outgoing devices. pci_liveupdate_preserve() notifies the PCI core that =
a
> > device must be preserved across Live Update. pci_liveupdate_unpreserve(=
)
> > reverses this (cancels the preservation of the device).
>
> Hi David,
>
> I have a question about the pci_liveupdate_preserve() and
> pci_liveupdate_unpreserve() APIs.
>
> Is it supported to call these APIs multiple times for the same PCI
> device? For example, a driver could do:
>
> pci_liveupdate_preserve(pdev) -- > pci_liveupdate_unpreserve(pdev) -- >
> perform some operations -- > pci_liveupdate_preserve(pdev) again, before
> the actual Live Update starts.
>
>  From the implementation, it looks like an unpreserved pci_dev_ser entry
> can be reused, so I wanted to confirm whether this preserve -- >
> unpreserve -- > preserve sequence is an intended and supported usage.

Yes that is a completely supported use-case. A device can be preserved
and unpreserved any number of times up until pci_device_shutdown(),
where the preservation status of the device is frozen (see patch 10).
