Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0374DEC36
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955060; cv=pass; b=RX3RDbKdistBC5eU5aHvgpP8+nWGp1k2L7i07CUkHHfBnM1s9zy60rEcJgIrlreSs3/p4b0Wuq3TUgS8jhez3rKBIOP+EaboTLNJyUzLYlmuX+R0wTn6XRQ8m1s7CksNE/+4uKNEQw3/p4Q7sh7V6zyCQCY45B/6BykWTy1Ukl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955060; c=relaxed/simple;
	bh=fs5RDQ985eGOdUMkYTIO1AkzMa4f/KMg1mJ+9inMXJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdkEbDrlTsICmNaxLzBMUzEARJ19kcQ+E2GmUmp84f8k0vPh+LC5Sr7HkHUvSfjiqi3uWr3/dEEXPBtquEsF/98RWqD3flioH1Yquqm5Vf8q/FADNL+u4Ni6jGc0anq5SCNQtVnbouNJpNUOVvB4jzW+K2SYtBtm0Pjh62xyXmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lraWVlnH; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lraWVlnH"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7299e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790955056; cv=none;
        d=google.com; s=arc-20260327;
        b=C4q55cytTF9FYeAvRoLLwAdpTlwMsarJn3d24fmPXgfbxsmWDXhsXAxga6ERMJ7lFo
         dfBXVX2x6WnyOsO4ETb5exSgqFfA2vn6ACimZFta/42Mvm1joWGKdFrHox1KAoll1tEg
         bbOgd+gDHx9je8X+tiyDzT5cYqxDyZqT/Y2+fDoyn3tD3lE1eorYIF3hnZgHJYMZCQO6
         5PQZItsL5evsJPqp5n+xJyLGa3FxCQ+cDCb5XU2PeLXsLZ43uszlCPy6OiwAFX1mao+v
         28Qarm/2NTw9aiZ7JhBFBBMhbM63YYXgF5KfkrwdrsaO1J2ukpiUzi8H43trMMap/7NK
         4fdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        fh=IDomy7scrHWElOfaLjTKNlbbQP+hgDAWt4IhIU6HEyg=;
        b=RfHNKcYByJWFcXG7XUagSIlw4ZVfvQ7uO8i+Ra8WuqsH21elPcnEvnycm5lTPp8ayc
         VClL4Xy7rluff1e7YPIwT6HB5ciUjnZ7QEW09xo26F4O6xjwQjZ39dLkAQeQILHYTrv4
         tvMgWH6g1ochTg1/M8uIt449zS/OEp1tweaJcXEHUK8VP2psTwCyfk2MVfYMxYzlBQ/C
         zu+Xps9ILlH/VNQUn6WrCSwCeXLG6fmyhUOSVijs/CmIO8o9fmGFRfx5H35CcLH6zlRG
         aFIcL3dOZ0OPRaSQ0d2xvQ5Y28DnFAXmFIFI+Es2qVvqW816L9jrmhY3ZUnC9+E3jStH
         N1UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790955056; x=1791559856; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        b=lraWVlnHTWnLzYvhUgmrjHmds6O2GIGVU24jii+X+UWOPPYcpiYQirlq9bGIW85lAa
         59aaGNKyagPML8CtUg40UoO+/QZjWD59n4K/XI9eh7BLT4eZN7pIFkVl7sC1uXpirLvG
         HJXMxsIN00fDxE5W6blLmGW+hzSF6WzsYJ5878Iad9CP5kyKipA4+R0x9q8TLrETvkcP
         woLpEvsD4OFvu+ldRdZHUPdasc8pU9XXOyrlox5lir1uhBvf62HmAnjeeMVpKdPp6K4A
         jUIF+ejQDXrH57A09yCmxrEAkxcztx1LR/81Kn+qmHFxT1tvU0VrADDTsCycIlksvDA5
         A+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955056; x=1791559856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        b=nlG5i8WDCdhe0WYX7ABwOtDn1ycIdRpPdz+5KSQkVj9WlJrazzpYEjXB4fMdkQqC5w
         m0CJ113dfHWdEKXZc4kCBtrZ7e7xVG4wwgrcmJw0FrCP0GcV4rFvM14JdCgj1dEJcpV5
         Dg9ehMaixyBWPPHfIwcMIQjmEyubV3p/ai+r8qeGUL958DX+mtJ8U0Tn7K6YNCxB4oSU
         LASasDzrVnsi2rpEcmin5UJrHkeQyj/RcDPOu0+4FWVKMoJukCS7ubsHD0+ztAS5pHn+
         /GnKJlNh3SuUPhwN+4Hm4W08j5sTf/g2ZYlpwXFKWjBPmdLB2iW3m0WCcD8rAOCRqUkm
         Yzug==
X-Forwarded-Encrypted: i=1; AKwUvBzKDltFGXBN3mZknV8u8M8d3u4Yy5vtEmL3T7RgWVBjHZ5A08ENLioxHCrwdmfpY+TMHexbTaWD6+ifr4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd8tT+anQ7unVhLF74+6KaSyffe2npY/zQeQetiFvxAxVq+jaT
	VVVDfZctmg9HPs+1Tzkw5ch96FQrgeSiaw+X4cLqkt0xQ3cEzU0R6jnkyZ3xoUbPHVeEiaGDERH
	jkl2QI4QPQ8NoXLOzSx/CvWjFzD2hZ5nNZu72yON0
X-Gm-Gg: AYBFou0O/e9lKK+J8Xl+Eu6OeZKGr5+68WiCCY2Vr+20DcMfLTLR5OrZE3n8ed10QyU
	HUvYVe52Rgw/loletvOkmJzIOE1PSR7BCUbNsU6xYH/etOa8uWQSpZv6pIsT5HhUQ6KXCiN6wtw
	eRcKmQqxQprSxixOZbDmuTOF28Fg8jOYOyDZlcdFIdS1ORZv84260R85VLjCh/ORXrvo+gSjz5q
	ykXdE0DGtmMTT2gPDhQDrItaKcQetYAF8ftu67grjinp/ncTuiFeS+VBzeNGjaS+Is3udPBO0GC
	x04kPJA/HsvrE5g1zXMZrSc0rqK+OBkCYBpUAr3Ia3iHiAMa+M/7mdBOqzB114xnQ7Xw+N7uINH
	xxXjsprsv3N6nUAMZpgllASxM
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr183008e87.2.1790955055657; Fri, 02 Oct 2026
 08:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org> <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org> <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
 <86o6dc2ka1.wl-maz@kernel.org>
In-Reply-To: <86o6dc2ka1.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 16:30:19 +0100
X-Gm-Features: AclHuK-WxuFGXDBt-i8aW4clYrHg0y_cefCod2ajVZ-nmk2Rl2Vmyq6bDATGZwQ
Message-ID: <CA+EHjTy9wTbjFpgvDOX9Xexw4jpx4uHMHM9ckXYZw8H0_QbAvQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 16:29, Marc Zyngier <maz@kernel.org> wrote:
...
> > I know this is a sketch, but just in case: that's inverted. The sync
> > only applies to non-protected pKVM VMs (EL2 ignores it for protected
> > ones), so it would be != VM_PKVM.
>
> See what I meant about this stuff being completely intractable? I
> still have no idea what it means! ;-)

Yeah... what is a `!= VM_PKVM` ?!

:D
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
