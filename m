Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F45282F24
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382282; cv=pass; b=YgZpHhnD37J5z5+p/npbDEMuZqIx3eWXzTr4rS/aIbzHS6zcRRuxlMyaPXajU1pzPxVOKNlojJA/z/rAXiKMgYSnYgKXE8ECWeipYP8nsZCmAO9QL/touPr7/u3iiQ4SwPPyGd0SGrKhm4cE4A0oPDs+PaHtieaEwYGhDP4DGrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382282; c=relaxed/simple;
	bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEdxxCAn+lxor7T5OFb4K0KNh+lrAvVR3c1b3JQEfH3S6b739rFymL9a/QgyeWcs/0Ij1OzvD5PmEQuxJbR0O6Ca7TD+P5zsAOVgwtU9m3XmofT9rvxrm0EBJor2iIa+6awoM2GhMH0P9UuR9b4t1kDy5w6JmaGhDG9Qdyj+xD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT1x5JC4; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT1x5JC4"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so2149171a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790382279; cv=none;
        d=google.com; s=arc-20260327;
        b=TG2oexNda75HD9F+m50tmZpgDCs4f96PW/nibJ9Ufun2/t0smnmw5kFooIobKN0B5X
         Ge+W32oJmNltBd/0JN+qJK7mqLncFMk+S+AgY6wmYTLryXQp4fbo9CNW4nak2BX65gXc
         /8leQcDBnjU5Na2WYBKDAqsandmX3yYsf+sy4aV8I3gv1LL0UdStCzPWW37F9CGMdLsc
         BJiCNavSnudq69vYp56Wy3mnTPHBEtQv0AAbbvpi4ppNXLtTCgAHV4vpl6SzOEsimmw3
         0VgRzfjR2TXN/BfP4n0SLVmx0P+rRlzwb04GvUNL/D7Uomti7sb4OhGVrf4lJvpqNVwA
         CJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
        fh=kfhJBzYvi26dzVYPgtOtbZazKRDcNg6VpBk8dJzD8C4=;
        b=UZ6WAJUQNJi28LldDs4BXMQhXnSUMXQ9vWcc/He1eSGF+33EYbew3yZBKuBiMm0d8v
         6tgO+KrvqnY2g9jNMxpKIVEEZlro2SSTXkQghi9mgscn5BFD7bQcCj+y0P+Sole+RZJA
         PkZBhuKNnXaRZgxzKJzlq4vfY06VNgprXFcf/zjbrgarznwVhp5m+ux6hFp2lTfG+CCZ
         0pMSaSPLxnYH1gyHspYcJAcgA99kcnUJX/S0cKgNKYaPXCRrEgWoslM3qp80ueUosaJ4
         xE9ALdsmPZl+n66KhK12BZNzIeEztkMcs1MmSN4e2akKmBdJzGrwsg5kLfX2pO1BrMWY
         Clrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382279; x=1790987079; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
        b=cT1x5JC4Um87x2uo1hZqxVtCEt2m3+uDTKGR4y7hqmzDnbiKMppmLUH2Wx39ppICqf
         WqODtHX4lVirdQrkRovQLsX24ivA/1csE3l6bPTeNLI2juhSdT56mBZwHQBTtrmY1xAE
         hx7xd8bo6rl1R7zpJXFHKqTNMwGPHz/kLuLvF9+m24hWyFAcXbh+H7gLavuHWItjgRom
         V83WzCwAighiPgFJ5yVV6EXfecVQGtgs5QPOXw+H/wgIB54Thstv9tO8KV/J4wO1Io/k
         3/DJCjZfwGwrYYnLFH9kRAyn+oiQFFnw4rJtsqiDvygZZzw4UvjlzlLsJ4zBLLqzzECN
         jnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382279; x=1790987079;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
        b=2muV5iZ8D+Ud5iTb1hiJYbKfBNu8CkLOl27Zfgv5F6h/jJH74xjI5rvybbPVwtHvHK
         QZ8IeNMszGNTSrProxJGiv4e8HgHlT0Xt/qMcu6TMjlk3wNbAFQvAo8IfSTwIkxhKzfV
         Ogx2QpdswDEBijEfPijPKS7scsNzOqhJiXCTRurYuwd3cjt1cIT36qrsyJO2b9AZ8CZX
         3glq38NqJatIs8fdgO2IPlBFwsk1M3WA1WP/JyrJMjAyhfBUUPKlEHwpoF6LFmA/jk7e
         rVs9d3pV/C7aZpGqlZ8gsVnqu7k1nnKUYYwLlP23tU84ymsmJ8Vkp7HVzi7tI6/BCqTe
         VWfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGXveu3SVEt2NF8R/zHCF2+LCRd9F/QF+WaR7jPF+CVBL8Wa9+7Y4jt6jhK59tW6siHC657z9l612w5iU=@vger.kernel.org
X-Gm-Message-State: AFuF++mFh6v/ZKClpkMbYPnJa8t89EqVwTOGOqhbgGYDDcY2rX1hoKGI
	KIGHh5PSumBOdIHjjT3RXMxocCcjCGrx2nSx6hane4z+5unCl+yAwSFL87jrvaz2uDMBUtVcu//
	kifsQ0aE9HNdDhj5qXu6BlsTzMIHN/HQ22W/+qAc=
X-Gm-Gg: AYBFou3QGfDUBVsxxKyOHnrlSlK3YxhVEFIp0g1XJ73avwuhDPUBdCD+J3lMJLp9cqG
	PriljKwTSGjpAzVDQAUOBrl3noMt8Mze0ZlP9KpfhmHFfhBY5ml/acSXWwUycvbnZX7p2GrOIdE
	U7k5wvUiZmb/e+VJ6Wc13j79PIKS6FKF9Uhoq3SluGcdvriPL3MCrtOxDBJ+hGG+/JIHtESHoXR
	QF7a6VKuUjH/2x5H/21qqA2GjZLaAG1ekkou94QYEFEpqPDutmBuYDL8NjR/NBeX+q3Pq/sCkdW
	QFozF2dNLAS7h/9bBVqoD2MRmLypUc6s/FIQ5dVrCs1PUQUsPR1orXt4WThznodkIWuiXjSlu48
	brsrQjEtmIKujrw==
X-Received: by 2002:a05:6402:28c9:b0:6a9:bb40:6e14 with SMTP id
 4fb4d7f45d1cf-6aac9143fcbmr6336665a12.44.1790382279146; Fri, 25 Sep 2026
 17:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925211635.1422516-1-amad3v@gmail.com> <20260925211635.1422516-2-amad3v@gmail.com>
 <00235605-05f0-48e7-8561-486b8ddc9c12@gmx.de>
In-Reply-To: <00235605-05f0-48e7-8561-486b8ddc9c12@gmx.de>
From: Am Dev <amad3v@gmail.com>
Date: Sat, 26 Sep 2026 01:24:28 +0100
X-Gm-Features: AclHuK_DpvgkbQkylfjRzRCGji52vYqlzbXoYUsACw21CI08o7oMUY8JnOnrcRA
Message-ID: <CADfX_O2Q9NEfRcev78jb-BL_vuHZ0eC-W829hkAV65fRto_dwQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: uniwill-laptop: Add PCSpecialist Recoil
 16 AMD
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 00:44, Armin Wolf <W_Armin@gmx.de> wrote:
>
> it is to be expected that the EC firmware will emulate a full charge to 100 percent even
> when battery health conservation is enabled. I strongly warn you against enabling the
> charge limit on machines other that Intel NUC-based models because apparently Uniwill
> considers the charge limit feature as a preview on all other models, so accessing it
> might permanently damage you battery!
>
> I suggest you continue to use the battery charge modes.
>
Hi Armin,

thanks for the warning, I did not know that the charge limit is only a
preview feature on these models. I have stopped using it and will switch
to the battery charge modes in v2.

One question: the EC originally had 0 in EC_ADDR_CHARGE_CTRL, and it is
now 100 after I lifted the limit through charge_control_end_threshold.
Is 100 safe to leave, or should it be restored to 0?

Thanks,
Mohamed
