Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917E1ACED5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511825; cv=pass; b=Y/kMJM/SOpOLsv7clOrlqNgB+VI+NpNQUwNMZN2jAHluap2FvknpsBRm8lH60tLp/45CsP/svMnlBJn7608hV4qXIodZ7nKwRpeN4Frznq7/SqmXRAPMG6fA/hFEuZgMwU7YF6m1NjGCmPEdHHPA7nd7tt7J9kcdHICPNj6TI0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511825; c=relaxed/simple;
	bh=LEVAMfzTnIrU83A9+0hwO+Thr1TbDzEvww7s5Ai+Z6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2erCg1eENVKvnb+SaBBgIXP3fWBiOnp4FvxmvYvzFHbJpbNcwpexPyL3zuj2ay910xAhsQRQVK93OcQKM6zpIud4uw7jSI+JZ/NxMc6qLH2APw24d6y7NZ8Nh5FNFdxFnFJxnOCxDxazWdIsKtzIF54ORz+F86GJqnNDaq70yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNgct5au; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNgct5au"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2937c43f31so24837866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791511822; cv=none;
        d=google.com; s=arc-20260327;
        b=lsoCdGuC9RXLwDD/EJtmCNaTsfduc/4fBTVRo3QfNK97RCc6ZAJbT9y4JCPx/VbCaR
         gU2c5v1qcD1bky0+LMKkxueLywIs2g2S7RQUCVcL2q95Czx3b/4y1UwoWaphXPPuWSEw
         hyOazGmPoUIOip2pEemy5nZKm/UxYyQJyliViF+MoKUPSlrkf4IzscoegfR+VfebsLoX
         3ZwfE+pWFc9NJmG3KpFMyafs+fPcfPA3VK0Ff4+ywSINnYv/h0JeULYq4tdTi5wAEgaP
         P+miJxVMtd/iA1cSJsn0xQSfPiLRiHNvsIs/H0qnl1GsdlIz7HrBcpDZJu7avXG6+fqO
         XT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCrQzglEO/A7J/yCrkORnHOdyV+MsWSTQsRZD0EiG0E=;
        fh=OXXpdwQdq7AcSWGsD0qAb6TuaEpHbF7JoTkTIwfhNR0=;
        b=LQ1iOrcc4kUj0J+BzdLxpHIjptS2oVubr37sEN/6nQwGmJHPoxdRliSRIZdV6ZBgBv
         SOhiUE0epEHY8yb9oOjptocmzoeL5zjCK2+pX/klFwFN+Old74ex76llMYTSCf3OxjYY
         robVET29e/q475IF1yAshgZCjcDyeybI3uMTMg0wMu2Z5orEIBESdwRbBlotXCzdFqjO
         heHhc9aTWSnIYpMDcRXRECIJOqv2EFfXdQI91FxYzDcF6Z7upWHfsF0RfpMZns+jVyUU
         IDNPgo83uUeI9QY30SvSY1KyoQE03gF1AJ54iW0+TM7zLUpG8XUMVs9Hb+8cYBrTTkQB
         dLag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511822; x=1792116622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCrQzglEO/A7J/yCrkORnHOdyV+MsWSTQsRZD0EiG0E=;
        b=kNgct5au5wCwKWLNtoBCPHGbAjnHrJRqGe9RaVgWX0H+K+I1dJUsbZMsGwDLYf4Yvk
         0Xel3s/XBgDmE+qKpHDtixRGjkmk77c0a4sYu66YcmzaLZg2HbNG/uHEPQfbADs8JvHv
         uP5fpvXLiWtfRfm5k4UHoJQ/vyIgZkWQ6rh6fwRM8+vzqVJlaws68xsX11XwEFWdXAXp
         mFVOgIVaPYZ987YgOlFNAZcd5ZAXqDhLakDX53wLRwlVF8JeRm4Uz3NjZRg88qMvqjJr
         UdxA30mu1EdSR/RrAn1wHiIIH044Xj3p9cyyH1eI9Ccph9gn5cetQkyD/17A0Ib4GRJL
         gXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511822; x=1792116622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCrQzglEO/A7J/yCrkORnHOdyV+MsWSTQsRZD0EiG0E=;
        b=ip5Ih7PCLojrdDhy+17RAW9N6IJDO4F9INFXxx6QHOQPtqWrlSQa9NFUvzVJQY2g36
         Sr8Dpk4wYmYyd7RxuQJrsXnaG5KOka01TIt6AF8lc9BJ7Vtsq5r/Jiz3mm5MBnN/DpP0
         4jP4QnKeWw/NDCe1ZOxysEu+5jLPTCO0Ut+7fP+X4YRNhqwquynSldaC80oAw1MzGMuW
         jtzur3pDGhsdBjAMfhfWwjYVEpccZKQBPe34rylUJd0NXSklQk0UvxJdNZqBzIRsbFX3
         PHrtLDrHPrKZ5e8p4sDKgIUKig6qTMJO+dQ3m7EKaZOOI92dtypPskFIUSKBrMEvy9dr
         bYbg==
X-Forwarded-Encrypted: i=1; AKwUvBwdBkxJcAwkuLPAXaAYqDOCkXMG8oiJ4+LJgpjKj5LN1lhW88GKaNk0GGnMPLURNs9I5Y6QaXd5ujIe7Tc=@vger.kernel.org
X-Gm-Message-State: AFuF++nisWnbxuc4i5MsTMR+9rf6tMLEIIC2aTn69BbWGrmP9SyRL8cm
	0E9ug2ZZdt2Hr2hMfPJVGqDYV301BVZTo3xRI3YHs5/vaQz98iQfSrIyxribc4dMImEjglZueLS
	G2yBXAbXNjk1AL0sav5pbJCG4moi4pOM=
X-Gm-Gg: AYBFou0uyzVUDmKbeEFaU7arxki/fOhxw0+ZIMZpNTWJ/wuBhKRgxHTyLMdzLMYfLc5
	/BQALDletgtejawfPeL6p2CCfjznAww0yyZ7w3vGTgaZXrpTkWoD9XuNPXAqPhxGASGMRE6EjBt
	dS3B3b3tXqeSoiguwEARpO4bBdRiEw+3KB6RBLw4X8wKagf2kyGAKAccka5IDVWM4LyjYEFUFNV
	BAjLPKEW/X6CM0uuwMlf35xrKuuTJcvDAuWpU4AFNz0WGNMfEnKBY9UjO8jx3uFKg8ZnMvnikOB
	tV67vr/llO9ZqrqSIq6AVbS2FVAcvg0FTArrT+dybz8sTxVPe8OgO6rNxirnQEhFCq0QzTOhIWx
	ukA9Vfbbdag==
X-Received: by 2002:a17:907:d516:b0:c2e:39bd:d6bb with SMTP id
 a640c23a62f3a-c31a9a09d51mr46781466b.1.1791511821833; Thu, 08 Oct 2026
 19:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002173844.3537111-1-nicoyip.dev@gmail.com>
 <179096305349.1402591.6316561110428507255@kernel.org> <20261008164917.384b8e96@kernel.org>
In-Reply-To: <20261008164917.384b8e96@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Fri, 9 Oct 2026 10:10:09 +0800
X-Gm-Features: AclHuK_MKZrYKC0pZ5TgunLeFOJeDzBazt2GlOkbI3BRXa-QDM_6-DuNBaLWb9c
Message-ID: <CAAo+4rV243Tj28op=Pos81-g-txz59Tb-a6CP-6rbngN=rKU1Q@mail.gmail.com>
Subject: Re: [PATCH net v4] net: pin protocol module before inet socket allocation
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 7:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Fri, 02 Oct 2026 17:44:13 +0000 netdev-bot+sinfo@kernel.org wrote:
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>
> You have to answer the bot's question.

An LLM-based scan of the networking source initially identified the
issue, I then reproduced it with l2tp_ip by racing socket (AF_INET,
SOCK_DGRAM, IPPROTO_L2TP) against module unload on a KASAN-enabled
kernel on QEMU.

The reproduction used a temporary 50 ms delay between reading
prot->slab and calling kmem_cache_alloc() to widen the reported window
proto_unregister() destroyed the same cache before the allocation used
it.

Best regards,
Chengfeng
