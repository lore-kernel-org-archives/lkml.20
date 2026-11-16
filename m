Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847566;
	b=Cj4Nl23sf1/k/YIF9jbZPiRis7GZ1dTwW6cILpdvnYHg2E30LoboCBLXkdcpDliCpDYH
	 le+bY2lEA3Jk1SC+Taxe3bHtVekDTmS/cl8CZrAAziTeZXznBcvgOl7MB8W1ZncMLuqq0
	 dOJkf2ePOE60ZjmYEKrTr1n9RPniffSO4NwPUTpU73QNzdn+pP/aM9aUjhiu+actsmvOl
	 BHMqeJJnfWfNEQokwM5ZX+K1hMzGZ4+S3IPFb65sBXtn9Q+ENIGAIcBJ5shtWG7YvdPIu
	 nI3GN4qcmUVySKYf3ufGNuGzabDUNvq9blt/t/yeaygyNrz9Cmz/TIHaQOOL+IeUjlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
	b=S20QI0JhhT0+tX4OYorz6yLfQivvYGE7DxPwKK8303QFyl5ldAa2DrF3V7VEDhiTorah
	 XQuGwyjnHDokg5wep/x8AzNNGf3Vi41dMVNAK7ez81HQGsZsRR+DqqAI7vslBO/b8JvKW
	 QjMS/PJB/IzAYUsoRaq6rmYlx8lBoQEcCsDE2CAlT2gA4cAREH5PxTpdnLjCB+n1DV4UV
	 E7TO64Y/xyOcTngjAcWzZFlX8Ui7NinTmaX4xJtw5JqISn6Wf6CQyxvI6MewGsoUcpiik
	 QrCFenrHiIRa1IzOdDNn5mQQeu6ivDWMDHJYCaE6Qal3W+m2Ia8pLZxqyO5rnWz0EVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lI0Cs7lw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FC606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014FC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lI0Cs7lw
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so615065366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847564; cv=none;
        d=google.com; s=arc-20260327;
        b=RM65VM3Gti+eEFI8ymBlDjorwOPKYI7oyKR6eVi4qI33q2nKJiGiB+g2ML30BnHliT
         4WwZrXYYUwif2ZnIhFWQf7kRseoRG5pO7WpvIPrjl2yB5nVCt/eOz0NjpkgzlHtUZgGm
         SCY9WMbyFD/Gl6r8aMrYS496JQyYWTUvchdpxZNWIKkoxJEYW0lL76NEZtdIjJvgEIye
         7sKtVajBGgEGUAGfYT1rz9ANykG5SojhXqHKxHgMDhKN3gbGzc5VkRcIItjKWko2likE
         TJwHeoiDEy39SL/73TxtslJKyaqRpp5xzW0k6SdQJYzNp1+RiKjIspZeyWJK5I/bmJ48
         gVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
        fh=KGfxvnXXWC4K7/sRgIlS39sfUoYGiFFw82GY4UROP88=;
        b=T1ELcWPuLi/iWlilOroWnQ/cosnQF9ky9gInsvcM0F5nEHXfhdHTAgcfO2lsY3RuTC
         jmB0dA3IrMT6CFZhZoVowGWEEULkiUTppEPSOmJGJlQqlcb4qPecIqyNWkmY/szTY0eg
         7azOho1u7joqlhhOF8cqogQ1bSsu8nj77wgim6EUHjoc7K8X7k1gIAtELXLY7bQTAo3s
         73Jispy3htZB4+8EGDtzqOLb/lAKHQcy6BSbGwHjLbgjq5CYevv/20tQSCE5xl2FNmUJ
         EmT/4CIK1wvujyRzJ2zL5It9KCHszxtJjsSnUGi7ub1oEeas+7nt5cfS0fkNYSYtTFFQ
         N7Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847564; x=1795452364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
        b=lI0Cs7lw34shuZu+TXVsC1heBq13ajUejoM8zrjtRGUIcFIkn6ckIcMtCD5SHslIhU
         DegAUND4pUx2SZ38i2W2dqZu03y0oEwKYp2LHD2Pu/lEIKtNgwro+5OKfOwiLl9Lvhx6
         N/0ZVMD5ih/TzHBzc+5heCZ1CSOHaNznRiEJsMm3Cl3H6VgrGzUPbrHVMYb6EyyiAJIS
         2GqsePXkKSc6UbynzvtHYn5eBMYugxp782hHnck6/PkmwM0oGfSWDCz9b+diBKixfh57
         KlA2QQg/yaqKIEdMnVkLvYwkrBxu71jNHvLKdzi9UG1Stv9p0IaiEButyL+yewlKqEkf
         MuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847564; x=1795452364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRx112H2Vi/wC2nTJxgIojxoar70KiA3HIwHfFiZZ3M=;
        b=I8GVbL/Ri/EyNywXFnbWfvHeCWJ/VsF8Sp2sG+W/FdMhw6gKccizhxrjNPJcWkSvc7
         LHvMTGImF2e1hkSJCy1TTfkgM/QlV46qQ7wft/7Bu16wE8eP1++p05eItw71vRCXpEC0
         g9iE+81hGFpcIy7wAASCssuQ0Hbtbst+RYoHTe5Tt1wi4KPIM/1+oOuxcUxc5wg/oOOx
         VwaBk25YgaRnyTEKOEGnI22dsTvwx4z6LdXrj1a86URWoXosWfz3UCP/XQEWE8awK8Mn
         K2Ro23nFXOgW7XViGpRr7pIFKxHtqeiQPSxgN2VYHAvcplGTZqOwgSqSOjwhXwvT057o
         C6PQ==
X-Forwarded-Encrypted: i=1; AL+hErHBY/FbFqdSVqIJyYO0OC4hSphhj70pJet0/u1tuXLp+MdVVpKx6tF18bP1Y7sR1+DvErhqbnwpmMpNG/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+33EIW7s0VWEX2MZjOfkjlhPr+7pdYhJpMuaKYT9dZ/FtavuD
	tYUsVCVtS4EUVcUPsrz+Qzl4pwe38GU8NJN6NH0/bSikL/bikgiT2ayg/U3lvW0cBqwcagUEz7m
	w9/099ITWwO+m2oHe3/trPGj11WMx8QfNIRNHeKV5
X-Gm-Gg: AYBFou34fXTLGtDNCobynFMEir6B6K4mdGfEQfByY/5UD5xbjRO7Rak7JzFT6fltWEi
	Ev1LpMdiPxK4oNUCFGdg5MxvHP8+LRumTe9bdJtNOq4t7K/DSNSRjfKZVXsrSTh+e7Cr1CGayGh
	YbpaGwYnwkizuBkHNzL+3O5g1p9+az6CUDZX/WFAhJjAG4NG2vvgiOCUaFehN7/Dia+k4xjq6iA
	I8O1Gf1XxyzVMtrNJwm5FWSyzb5sbyr65wm21u6sqWKt2SSt29Sb0C8QssQd3cNC7jhSpQ//8Vu
	CU6931FScLDsVqbH2oElLyxCC3caGJcHT1k6VF05GqlBLuy5Fb2yLbzcBvodkpP+XQDEn/XZoEK
	exUPXm8VqpsW8T7kWVNZQz2O4xJ9rHW5QRsfAKA==
X-Received: by 2002:a17:906:c14e:b0:c34:83c0:b92b with SMTP id
 a640c23a62f3a-c509631747amr801733166b.23.1794847563720; Mon, 16 Nov 2026
 08:46:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com> <autxCZPJ9yiE2ucq@google.com>
 <aut0H65XKAHUqPR9@google.com>
In-Reply-To: <aut0H65XKAHUqPR9@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Nov 2026 08:45:36 -0800
X-Gm-Features: AclHuK91dkLFtARHO_doZgjfYRJFT_5pDlpQ_hxt-2ez4dAgAMEfCzexcKbTDgA
Message-ID: <CALzav=dp8HvdK=9cAkGfbsJAeckyU3_y7rCRM22R7+AmTTtxMQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live Update
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 10:06=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-11-04 01:00 PM, Pasha Tatashin wrote:
> > On 10-13 16:25, David Matlack wrote:
> > > v10:
> > >  - Save and restore the ACS Egress Control Vector along with the ACS
> > >    Control register, sizing the save buffer from the HwInit Egress
> > >    Control Vector Size field (Alex) and drop Bjorn's R-b tag
> > >  - Make CONFIG_PCI_LIVEUPDATE depend on 64BIT from the first patch
> > >    rather than adding the dependency later in the series (Pratyush,
> > >    Mike)
> > >  - Reword kernel-doc comments to read better in the HTML docs and
> > >    spell out "reference count" (Mike)
> > >  - Replace the version number at the start of struct pci_ser with
> > >    required_flags and optional_flags, and record the size of struct
> > >    pci_dev_ser, so that the PCI FLB ABI can be extended (LPC BoF)
> >
> > Hi Bjorn,
> >
> > I am planning to target this series for the 7.5 merge window through th=
e
> > liveupdate tree, as we previously agreed. However, there are still 6
> > patches that lack an Acked-by from you. I believe you might have
> > reviewed some of them before, but the tags were lost during subsequent
> > refactoring. Could you please take another look at the following to mak=
e
> > sure everything is in order for us to merge the series:
> >
> > PCI: liveupdate: Set up FLB handler for the PCI core
> > PCI: liveupdate: Track incoming preserved PCI devices
> > PCI: liveupdate: Document driver binding responsibilities
> > PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> > PCI: Save and restore the ACS Control register and Egress Control Vecto=
r
> > PCI: liveupdate: Adopt ACS controls in incoming preserved devices
>
> Thanks Pasha. One more for Bjorn's list:
>
>   [06/13] PCI: liveupdate: Preserve bus numbers during Live Update
>           https://lore.kernel.org/linux-pci/20261013162529.1928093-7-dmat=
lack@google.com/
>
> Bjorn's Reviewed-by on it was dropped in v9 when it changed materially
> (albeit based on his feedback).
>
> Alex, could you also take a look at the two ACS patches? 08 includes the
> Egress Control Vector save/restore you asked for in v9.
>
>   [08/13] PCI: Save and restore the ACS Control register and Egress Contr=
ol Vector
>           https://lore.kernel.org/linux-pci/20261013162529.1928093-9-dmat=
lack@google.com/
>   [09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devic=
es
>           https://lore.kernel.org/linux-pci/20261013162529.1928093-10-dma=
tlack@google.com/

Bjorn and Alex, these 2 patches still need your R-b or A-b tags, and
then this series will be all ready for 7.5.
