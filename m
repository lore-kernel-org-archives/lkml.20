Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305088;
	b=WeCpL40CbCnFdtYpafWKwHU2Q5BvHnzqXAZ9xONEkuzDUkN3bgPATXDVDmpEBwA1XQpK
	 4LzWTTDdc/I6/wQ4jriibJhX8LwkONecEYA/7gXelP8KtM5JGQcCTBPKXvWncb42BIPaS
	 RvIHVsaLs2nad7WQB+tJB8TE6xnzR5Z0DF06iABqr1tvsiMk4rP5PAHChEQosLo5+O4fL
	 aevYxZdpFC7Fz7voAlzfR/azHxGjkCOq5QqvrvIeoOQAgUIBjbllV2jsDbZKC/AWEvG+O
	 gVMGvIjtiq13L+nyAuxLpQNePNP8bCQB+85T4nTKQXujGcTdlP2MC5vuiM3DSsoSlsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=c8SH9EDnCkmjUHGPR0P2Z3gz/VtKXf2f2iywxNQfoIM=;
	b=UCIFODByZnxZlfQEuTcZQRa/Mx1DcBimH9XkdRIo/xonsrE9PC0vzdEK4KmXt0D49jNe
	 L65vtw9ehpvD/tVvbA5YbPdE5dpauZ+CtYOFRHZvqWWhu4IDMJwcRLLME9mK/xUnYFvug
	 +i7jNRdMK2YkiW/ImC/g4dP4KczncYsivk4/SqM9UbfT7517ddbEB/tOCuAlvBQtpwfHj
	 +MNpc45GqyiCPEltY+oV4DEJPuIbI/5XDRJ9eLIiGV/T9nQULD3sLr9TrCKCRXkUIyf8+
	 Z1UAuhwzDh5UvOUiN4otHkGhh/0gtI8acFWA1VZUcXy3suTgTDLVL++s/UF/e21N0Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcSkI3ou;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D206D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcSkI3ou
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df0b02fe91so1042132eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794305087; cv=none;
        d=google.com; s=arc-20260327;
        b=cUPIRMsoWGNKwcZUlOVMqPc35YmcHui6Trt59e9K+P1TFLoBU4vKc19wJD/ZUQW+E+
         944SEaIUxCGayFB2H8BYTcPBIZMQR5CX61/o48x0oSU5d7xZ7f8fLZb+xcpVi1/ir0/U
         N4DevS0hcbZdcmjm+QYkvq9wHx5l72SLXZ0QJ9yb4imwcT2/H4MEtoZA3Z9ykhgayBj5
         kqcbNl3RCTjaKENycKZP6S7Cn7QNQK9j1RugWLX7v1Yzgi0pse6HC5xsHVzqhBtYFL7R
         mR5MOgosxtiLJLPR6QsLBdRHydMsxOpF+6TThPirWYhcsFBMlIP9Xmwwtf3Jt0e4BDDw
         NKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c8SH9EDnCkmjUHGPR0P2Z3gz/VtKXf2f2iywxNQfoIM=;
        fh=kcXHKRQT4xHAs6Knr/adus18tnuI0OB/zDSZ6D5Wo8k=;
        b=XMZ/JGniNGqkvhtgXDVKv6/fdIAHEikTSINkZXD8g1t1PZCrFIkm9vM39VXAck2V7M
         tu1p9ZHbNxSt40CbZyLBIRYsWdYjrziWqRqF3Ng8ipU1zPb8dcv22+5MC4/qu7oPjXfy
         NJzu9ffwpxVc1EAf/TMeKOds3vqvQu8xjLaSuyY+Q3oyVhk3oCdQ6ov6GGhxpn6lFwvG
         /595dBoFMzx3av8F1GXEMwf42P7hefc/2F7OgbLGvClnO1snpjClkTdsrqXkOd5cYD4m
         5o1NOInLQGb/BpKPCXljEiR8l171aWTPNvbprbEU1suRM4BlSItsurigCPK+RejENVvc
         6Kcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794305087; x=1794909887; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8SH9EDnCkmjUHGPR0P2Z3gz/VtKXf2f2iywxNQfoIM=;
        b=OcSkI3ouRW9vs2LVKGDINf3yMFDOmmg31mz72m3rL8PkscnCWSry26doTrToWEx5Qf
         gSyD/P15uxrBzs7tQxF6aiYUxQaqMniPE42cAZzKntQFlisY9gXNto0j2mLA/uEgTIEr
         Ekhk9TD0X7fdJ35AYJA+k2/d8jJkt6tIjfg4T8UKXLc64qrvFYSyocIyWG+PpqXUP51b
         jSAK8GvC0TbcAOgT8AafDEn/49BPkIcXMnqJ5hi1gnop2IXZ6U0e+We28buIwv6e5vRr
         Pp+13VPfJ14rB9SjSFDBfY57KDwNYTyW4uuLyLsxy15BxKm5C0FI7W2NwrH4X1aPM4BU
         vnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305087; x=1794909887;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8SH9EDnCkmjUHGPR0P2Z3gz/VtKXf2f2iywxNQfoIM=;
        b=YSe1FcaN9rAzKKC2TSoLy+Awi1d+m1CnGozOI0gYN8bliiaCKh7oSNkAj3y0oGIJCI
         EV/jqOKmT/HP+yPJi78mFvGCdt8VbiEHCk1PYXddiZHMcMi9dd+mNKzyBpvze66khtmU
         bB3stYPFI/nOe3ui05T70rcOK7D/f02vqmRWg6z+feOQdI+IeHVltyVRZcOCtAVRN+He
         uc1PR+Jf9phJlYHnaC0VFjWtfNhlJLkdwa1j4fFO4ei34EABT5ZMTijcbg7wWoj1mqJG
         UCHkKdukLvnPKe3ELhraVgLjAyLX/mZetXCRNefojF6VV361xpJtnfHUnzD5yWNCnRyM
         naLw==
X-Forwarded-Encrypted: i=1; AL+hErGvQiGEUagLEyl3IYnBA40uua/i06mm57JSn/zpGxyLSz7Bm98d6t/1Z8UlK7K/nPE+vOrpGElLS4zG/II=@vger.kernel.org
X-Gm-Message-State: APuU4Z+58JasZb+ZDiV/6ArUGaKr1zU0g+kv15jpo/e/JPCY1EwYzt9I
	DgjwmzSzbKbbe6JptmB557NrVDMdVFFKT3ceOimar8q+wSm/ReXac7F0pcb16ycIc8RHy15+UMi
	JIR4+hNPyFYiGYn8mI6GSzSl1hmy0nYE=
X-Gm-Gg: AYBFou3oak/puby5N/xsZM1Tc50CEh/rqr/2gMUQDBCR9fk8UM49DtbLK4qd/NAdxgV
	JXWgGV9uOyxGfKHCJ+xaom7VkGdW/T2cRXQzNAtSCpZz3em3VWwLapWRQaXS6hyrXSD9zwU7px+
	SpkVaCM1tELpUwaKxXVNe1cAetTt7LIszA6npi76HFFkqg9PF//CdvcrAIFasL5vuzalRZ50HYG
	aGwszDNHPnoCKunGvAImP3uEYEV08qAzCADDoAM7Jk7FFhK82hSqI01HTXqYgWTMjBpZCtRmLJN
	TdCHeP4hFL+KhAWbUvGwniTlU3Mkq6rTB//ZMcuF50P2i5ZBw/HBHIWQXg/rhTymfy7UTvPs1iV
	EFJITTzkxhOpCn0ThocvTJooVEnrKwzzJ8jsA7Q7o8gxvkG0MolDBehXyy3pnSugQ22K+04bVgN
	cdvEsq7sQUn19Y/zaZt3fZrASdV3gmPlmbOC6umlUv45fubWi9hklfriJReMgarv/eVspsIaQK
X-Received: by 2002:a05:6820:c0d4:20b0:6f7:e193:8326 with SMTP id
 006d021491bc7-718a70211bcmr533260eaf.32.1794305086687; Tue, 10 Nov 2026
 02:04:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925112850.189302-1-danividanivi@gmail.com>
 <179068206160.434549.1717741783856466607@kernel.org> <02c36d47-ad50-4f2c-88cc-6c91f62bba00@intel.com>
In-Reply-To: <02c36d47-ad50-4f2c-88cc-6c91f62bba00@intel.com>
From: =?UTF-8?Q?Daniel_Via=C3=B1o?= <danividanivi@gmail.com>
Date: Tue, 10 Nov 2026 11:04:35 +0100
X-Gm-Features: AclHuK8llmPJAPoIuNJK-9z_1ADOqNSF_GH_KJ9E3vYufuFCOTh_YkEnA-aSzHQ
Message-ID: <CAD6rab8LEfZcQgcZLmeiDzd-PUi56h=9aBEsuOS2qnoyZEsdxA@mail.gmail.com>
Subject: Re: [PATCH net] igc: Disable PCIe L1.2 substate on I225-LMvP and
 I226-LMvP devices
To: "Ruinskiy, Dima" <dima.ruinskiy@intel.com>
Cc: netdev-bot+sashiko@kernel.org, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"

On 09/11/2026 12:45, Ruinskiy, Dima wrote:
> I think this patch might better be split into several patches.
>
> 1. Adding the missing IGC_DEV_ID_I226_LMVP to igc_is_device_id_i226().
> This was probably an accidental omission.

Agreed, I'll send this as a separate patch. Note that it also changes
the TSN code paths in igc_tsn.c for I226-LMvP (they will now get the
i226 behaviour), so it would be good if you could confirm that this
is correct for 0x5503.

> 2. Addressing the locked vs. non-locked call to pci_disable_link_state
> (the possible deadlock noted by Sashiko) - this should be looked into a
> bit more, I don't know off the top of my head what race is / isn't
> possible.

I believe the deadlock is real and already present for I226.
pcie_do_recovery() runtime-resumes the affected devices through
pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL), i.e. with
pci_bus_sem held for read. If igc is runtime-suspended at that point,
igc_runtime_resume() -> __igc_resume() -> pci_disable_link_state()
takes pci_bus_sem for read a second time, which can deadlock if a
writer queues in between.

The L1.2 disable done in probe is sticky (link->aspm_disable) and the
PCI core honours it when restoring state on resume, so I plan to drop
the call from __igc_resume().

> 3. The actual problem with L1.2 substate this patch aims to solve. I
> checked with the HW team and there are two conclusions - (a) it is
> strange that L1.2 is enabled somehow for I225_LMVP - this is not
> expected.

You are right, and I was wrong about the mechanism. On my setup (HP
Thunderbolt Dock G4, I225-LMvP rev 03 behind a Goshen Ridge
downstream port) the NIC only advertises L1.1:

  L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+
            ASPM_L1.2- ASPM_L1.1+ L1_PM_Substates+

and the upstream port has no L1 PM Substates capability at all, so
L1.2 can never be enabled on this link. I will drop the I225-LMvP
part and investigate the dock errors separately with AER enabled.

> (b) generally it is probably best and simplest to remove any
> device ID checks and simply disable L1.2 across the board in this
> driver.

I can add a third patch doing that if you prefer. Otherwise I'd leave
it to you, since I have no I226 hardware to test it on.

Thanks,
Daniel

pw-bot: cr
