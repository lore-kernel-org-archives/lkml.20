Received: from mail-pz2-f13.google.com (mail-pz2-f13.google.com [74.125.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181639EB59
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217195; cv=none; b=TN+6a5ZuIWTFjdUj0eC/FOjbkUo+e7Kny9MCvObTAWTNGc0IMLu++nKua7y6mKL4q64Pnol+2lVfmoOFNn5yV7sTXLWFB1ex0Zh7FKrlDADhURS9r9j3wQ7r5iaBTvu3O4v+Mw4q0Y05xs5pa7um0ho/ZN+7v4Qew1MOywVT7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217195; c=relaxed/simple;
	bh=0jewx94Aol1IKcOojWLEYdfUZw5SFvsaq76oQocjly4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o0P4nd/tmJsSuGzY/tfUkVvP0ts2DFbv4NsRKYg+i7X+zgESuWwbGHJ0PyZvCn/uz8NlvTr5fYP4ZF32lWHoMxQiew+3HtElshUiS7XUjaRXehR59uU819wLO5P4kZXp/YEopUmALojQ0U8wrO0ydSJvjHBR2ZWaCd2GIIjwxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEPM2v4H; arc=none smtp.client-ip=74.125.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEPM2v4H"
Received: by mail-pz2-f13.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so762268a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790217192; x=1790821992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z/L1hXpzWJJQOqyHxMdxo06cE7DFt8m14lGkwmdYDss=;
        b=pEPM2v4HmYnCBdcjLhRfQthAUgIznDDSAb/yJkPUGOfEQjiFnEDwh8JEiXlb61EipG
         PGRLTSSYptj3quZrjdgtm54YnpmuMi+dxy3IPrQeStvlGoKMqYPWs7e9fNLRJqA51Pmi
         toE9TVa3Xy40yuFhjq80dI+kM3x6B6r8mAc80Wx/1lAIPgWlvB8Cw3amxz1si0NBl1Hs
         Jis2/P9TuAC5bAUa/89PWkNXHcN88hTwc+cTe0S7k5XYofc4GTKy8hCdD6OVKHdTM0A+
         21uMyWPvENaZFaCH84M+GoAzVmqV2b0UiCAfpMDx0M5gxt2NHp6Z+DpwSeqtQLLCG5iy
         nqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217192; x=1790821992;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/L1hXpzWJJQOqyHxMdxo06cE7DFt8m14lGkwmdYDss=;
        b=lGZNBv1mvrmHVG6PnrEkTdJHQxT/qZDHttUeoXuWHgjUZ/dPppyX0TsgNr5YaZxes0
         AeQmfyf5ZJ7YZ36hlKMTAbxooNIsczhlhAdxv5BLNopCXtgV9RGO2pUooHuUqOBzbWF6
         mraoydml0WgxHA0qJ3AGhUXp4PGt2BbS6R6Ybxc0U/YBWHA2BIn65S8rDqEVIveBecym
         8idzTXc5DH2MyAbhJQDrXRfn1y5owrIk+53JBa8B+RrUxzEpzkJ1a2HxF+hnpiQh5MHf
         vXx8tj1QWNlojwhQ5Fz5DRu2TBvOAtiUv+PcQ2dWhuixZGgjuHT6vk3gNcOBo4dFFxnN
         w36g==
X-Forwarded-Encrypted: i=1; AKwUvByGw2nGH2LmKUS174dute8oZLswzjyGLuSotfs5Voj5foMaW1/eUBnEoebOY8GXdr4QVElqTZayvuNxarU=@vger.kernel.org
X-Gm-Message-State: AFuF++llWNG2N49sNdaYCL+5xxMpCqL+c7vfpDdU4Sx2F5dCL7sw/Gt3
	Jm5SFqMTveowj9L3i1k54FtMr3RLVUIU+Mz0WHU2K0kFqYAYGaSb/E7A
X-Gm-Gg: AYBFou1UDDK4SeLlZ7usxLWGb4eyxqTgp+VtfRXApRo7ZYUh+buCD38HZM+7LuM9f3D
	Jq3e+AcbIKOE3OEIBjwprgw5pztoUroLDIiShOox++miQclHLsminZ2Zm45GsbYLCA4Pfd0lYee
	pA7pQ3pMFRq8PQ9K9fu0jVmKN75tTFXd4RRJl2YKiYDLra0NAE7PXWX1SQu3mMkX+m2vq2cnPBv
	QDF6CtEaiY6+gE/TEA4s30ndaiwkcZ/1QOUN3qdwhs6Yo4gebvjRUm9k8PzW/PXnpq1WQODFlkm
	vaGP/AoDCSjTb0syV6wfVZVaocQkl5eVFwH++FmFT35DUxkAJa2zL/GFwF2Isa/Nr+22gLRidSR
	Y9QiOU8FkCSrHWZR1ecakc/PsfGt4K4J4wUmT8M0n0mDIcHu+ZL70hEnowl2q09YrcmfTPjVNqW
	J4Fpn9ajgzdCrg+wf7ALp7K/l28O0DAD2+awvyJ8D9/61rOXyFroZko+WfQ2/C7yEQiSIdwIXtm
	LQ5wF3ToOfvwKj7LWm9zQF8/iznfZrqPAFWJ2wB
X-Received: by 2002:a05:6300:68c1:20b0:3de:1526:4602 with SMTP id adf61e73a8af0-3de15264efamr5628637.59.1790217192226;
        Wed, 23 Sep 2026 19:33:12 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad4e06sm2075342b3a.41.2026.09.23.19.32.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2026 19:33:11 -0700 (PDT)
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>, Greg Ungerer <gerg@linux-m68k.org>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org>
 <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org>
 <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3cc86de9-9007-42af-7291-70e52f6b0dd7@gmail.com>
Date: Thu, 24 Sep 2026 14:32:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Am 24.09.2026 um 02:15 schrieb Andrew Lunn:
>> The driver will always need to support big and little endian hardware, so I
>> am not sure how to avoid some abstraction like this.
>
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

Knowing the architecture may not be enough - there may be multiple 
platforms within one architecture that need different address 
translation, different endianness, access quirks, the lot.

We'd need a 'bus' parameter in all these macros to avoid what's in 
current use in arch specific code (take a look at 
arch/m68k/include/asm/io_mm.h for what may be the worst case example. 
Don't do that on an empty stomach though...).

Like, use arch supplied functions if needed, fall through to the 
standard macros if no special handling required.

Cheers,

	Michael
