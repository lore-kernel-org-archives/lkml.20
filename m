Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E34B44B0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004212; cv=pass; b=MNCiYTBa4MWrUTnCth8L7JPV6Y+RrKHlcvheQ6Tnn3N1faLshh9Q/So4yCrbkJA8wnBko+J3WmeJq3itUDzoac+FgNDUqzYMWC/5KCStSlgnWqCykhd3RgAK+cR/78QpB8B34O6/kIjm0whlU4CsPPtiJ6dFssXdUBD4dlGU9ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004212; c=relaxed/simple;
	bh=Qvro5yCQlNCOhITq/IgfziBeqn/uBwkhHPkGycI5TvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1Ix7rpkcFrW4/3E1OVKyXGfB70xwgq84USubEqhvsRpA12kmdHki0QRRwJWQbyiRT1diBKGRSnr1r8o27aX4abyFK3XmR1LHBvmcat/kBlJO2GdhztF1A4gXV0Ur267Vi3YABB8W1WTi5DqssLhhJwoeCULvLe4e2Q1d1OuBAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMIjwpvC; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMIjwpvC"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so29235795ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790004210; cv=none;
        d=google.com; s=arc-20260327;
        b=mZEXr0dwC5qr4mE3nC3CRs4iiMkYvhMUIk3KVTykI2QziDECpkD+YsHyFA1EhKITfa
         yHz6f2oPnclwNSfBeNgG2sYQ4DNNNM7SPz0OHC8AvVO1CXC3LSgi5A4iLPSuCysKbjLR
         4Pg1h2m+hvPpAQV+94rh9iVcFtBpf3O6T97cUx7j9FoKmrEOYfASYoLt7ZtN8SNvAQke
         ZRzUkJYXU7lqVChIlgmNWTQymyfjj6xjc6H/JynErWzfY1ARtNGJM+UqegclBJIEYAxX
         tsgCgP75uoGreZosaidGYusNMvipGBZ6KZO7TUdOXMs2LIoVjkkssEy+saakhItaZXsI
         gQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=INq7XmDF4W6s4uqXjWWhutx+bhm3j3Ixyq53lQ+50kg=;
        fh=YDPukBKsDvFYl8bfbqlvGzKLtKsDprd9UWyAdE1bV1Y=;
        b=f2iHR/MK+RTaIlpx0oLXpnAmPFvZbJyqd1xbaoK77N27eZrvmOvsDnNI2F9CTPlbt4
         KQ1xIRz4T/w4lGd3oEsj0Nbw17D2QArLhdFmQK2NCLIqG7NfBWlvOBVUQCij7PZ0uwPe
         gKNyUaPamgUVtBuvCzCn17dNJz2awYVQLcY7pZoLdZMPrpRjyait01lYdy8KjxGnShKl
         k6d6PID4bV1IyNd/iMvgXy6HwQdZH6QUWroCLmf6YXNUImHXixvP3Bx9upxSDmmmTSST
         5DY8+s4B320cBiEk2WTnXoSPLLX1ZSpaYgE/aWt9MSHWVzSq/0K/ZxXYKPipMVwClFJo
         3ZwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004210; x=1790609010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INq7XmDF4W6s4uqXjWWhutx+bhm3j3Ixyq53lQ+50kg=;
        b=RMIjwpvCSnEId6iLqqzpVweOuPEhmX1L+Tyr4Zz8O4OoKvZsfMUg9mCUiJbpa+uXBj
         N+gFFQ2TQIjV5LoHWXs+7fstuuvcCxCLBXFh7cnKrt5NfNsv3Ha4Fb8l5Id0PvqH/J4m
         ch761hTNk4r/QmVt+ht2v+JxUB3/GQftp52qqqMJnV+GyREll5VMIF+AMySfJuKaofbv
         NXQxD4VkvwCtzzUwCQoB0+In7Rhl8vJv9wKf85Lqash/c+SotgbIHx7KFaiIP9Ph8Jxv
         FrBPPYYNgsc4bVkj1pbGWtk2LzBoBd0B6xlMISvgZoq9NMcnR+FeTEbcHs6AG1rQROBv
         TXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004210; x=1790609010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INq7XmDF4W6s4uqXjWWhutx+bhm3j3Ixyq53lQ+50kg=;
        b=XaOt0Qc1vCbbP3etkamNPY/r4v0GrWBHpCy+aGS2Teq3MDxQCqinX8HVlPlGS7NP5B
         yiq4FjBKxTGfYgRPn3uwLCWX0CO8CH9vChAa5eLlV/MqHnyO4vP/JagzlMidb0tMGY3p
         k/R64gjzHI7pOWAmfRnZ7Qp916gcj0M3zBKb2a4zmkL6sU9Ov5sCo510HIa3ZTFL99z0
         hygy/hXsqZDHHDHJDUuQlSOX3aFy07FJstQy8X+iS9B1vyeLviAanOzusxR4/TnOdPvw
         aoWE/JZ+PCR4IKi4xQd073dkjeL30ueIYr5Y4TRKvRrrKCmLQhT0GFU/ptQWeSCRbgwe
         QaGw==
X-Forwarded-Encrypted: i=1; AKwUvBzTYdyYzeSS/ts5CobwYmCpjsG1wJkOisCCVXTkk0/l+KIaGjwSrmkKKEBUWGUdYhnypAFP/uDsCX/LvXw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/AsoVgwl+p5ewdc7/VTLglFyUMzfWrYRhjgTTs+vmclDgsExy
	LxHAk8xQqvffT7IaifmSoHa3eMYtxbywC9SMKD/ek2JtZxxP6coD6UjkIQsCxq4jQB2YJbacgRr
	VGIotrDcvzAU7yEBwxcZoaCIb+2D3Xq0=
X-Gm-Gg: AYBFou0M0En+RzC2FP6xrWBSzG7NuBi4yk+k6FGwKiCl509aqS6ae9IMV/c2sk1+4dT
	3ZtBbXlPeRvthMblgL3fLSKRfeOvatkBkvCXB9089jk5M8nc6GlzTGQblZi+604z8HsyKAr1Wgm
	a9YJllck60UIr9KqGkWA4raA01hciTb23j0Z7tbdAwdYgjBxdog+CZu1dQ7G48D+e5ghtj+mkRv
	d0f3T8dRW7+YG1htsHOfweZmK9sfdXJU2QFWnoTt+HcLNXzUnozE2QJPWRuirl9HVrCFl7t/fyK
	BxVrNNyIAAvq1vL/cxeyYilfz+p/q4IuDDwYnE59e9VEAFBWi/2dnFP5YQ==
X-Received: by 2002:a17:90a:d445:b0:3a0:2817:1fcf with SMTP id
 98e67ed59e1d1-3a0281720f7mr8496428a91.11.1790004210586; Mon, 21 Sep 2026
 08:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916022954.2690322-1-lgs201920130244@gmail.com> <178953744017.13037.8123570146284827976.b4-review@b4>
In-Reply-To: <178953744017.13037.8123570146284827976.b4-review@b4>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 23:23:16 +0800
X-Gm-Features: AcwNN1VTUBM-S9HR0eeeidh2kablCG-BVFJX7Z6YN2-YKoW6ujal7wVJmjF5B58
Message-ID: <CANUHTR_pjrYXHkMZH_QheAUr86=dJ4WFC+DNMgzUYsm+MsEXPg@mail.gmail.com>
Subject: Re: [PATCH] net: ena: fix PHC cleanup on probe failure
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Arinzon <darinzon@amazon.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sang-Heon Jeon <ekffu200098@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Dawei Feng <dawei.feng@seu.edu.cn>, Amit Bernstein <amitbern@amazon.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arthur,

Thanks for the review.

On Wed, 16 Sept 2026 at 13:44, Arthur Kiyanovski <akiyano@amazon.com> wrote:
>
> On Wed, 16 Sep 2026 10:29:54 +0800, Guangshuo Li <lgs201920130244@gmail.com> wrote:
> > diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
> > index ea89619039d8..5f0864d16dd3 100644
> > --- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
> > +++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
> > @@ -4122,6 +4122,7 @@ static int ena_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  err_device_destroy:
> >       ena_com_delete_host_info(ena_dev);
> >       ena_com_admin_destroy(ena_dev);
> > +     ena_phc_destroy(adapter);
> >  ena_devlink_destroy:
> >       ena_devlink_free(devlink);
> >  err_metrics_destroy:
>
> Thank you for the patch.
> It looks correct.
>
> Please resend this together with "net: ena: fix MMIO read buffer leak on
> probe failure" as one two-patch series - both insert a line into the same
> hunk, so they conflict with each other.
>
> --
> Arthur Kiyanovski <akiyano@amazon.com>

Sure, I'll resend both fixes as a two-patch series, with the PHC cleanup
as 1/2 and the MMIO read buffer cleanup as 2/2.

Thanks,
Guangshuo
