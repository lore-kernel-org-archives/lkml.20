Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AE2264A9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229558; cv=pass; b=ii0DtVi9gBsh9kVmgJdeTHW5miqxiGdW/N2VqLjp56AMtGUH9aGeU8RUEbAat8+rtCTUVYnWLeeQe41Ocea0T3527WZVV75kPubCeklqdBR8k/ZrQ+akjeyZ5kIJmra/uhvlUTzEoWiBAzYxZMa00ASA4HP5jNFgB/QUqET3vdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229558; c=relaxed/simple;
	bh=YbYeAAPLr81n7CnKFq3+4NoTXD4yO0Ifbs0Ig3aYVPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saoVB1TO/NDfQcGse9FV3bQAD8uPqkH1xV1slPUJRGJL8f6ciU43nl0Yxs4YL/FIYw7DgTk5jJ0bNeleXoNr1PCwGndC5Ke3KiOKkaPhTWGzsrEbes1VxMGBIesLK5c29BFcIGCjDqblk9udijJwTJN3q9PNbMB6CatvtoLPKMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAiLIYoe; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAiLIYoe"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-82380ef95daso1316590a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791229556; cv=none;
        d=google.com; s=arc-20260327;
        b=h5VsWbyaiMM7bYhwTz/vdCNinK/MZLpJYi3r86UZvc6vg6oCROMlbUk/WnJR2h0uEK
         EGyaoM+lXjFFqIlymOpXwC/OhDBmLjcg4n2Oc3vme929W8o3RO7fFAM5vk8IUZwKpydc
         XU1IpZpAzf4LhEOZNY8myvQ0E8HVv/Mtary1mj1ST5r/NQ+v7UZm/PyKu9EyuLL26J65
         Dr1zopgzy4Jmr0n7dhZ3kIUzhluK2+CJ8qXVRIc4L0atOifa4mg2DPmkL3YDrD500coL
         O2UITtONpgCC1TQ9/lJ3sRNZ8xPL33PYyF6LCO4Q8EAYR77EjPd1WsVer0ChnSakRQTB
         pE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbYeAAPLr81n7CnKFq3+4NoTXD4yO0Ifbs0Ig3aYVPo=;
        fh=3oyEeA97++h9/TM7wT0L1sR2HT1jpt98Tcrrbk6IJOQ=;
        b=fVxz6Bk1cL66MxDx+tSsHqqrGJg5a05M7iQjnI0nwnMJp/WM6XShAFq3pIOQds/UHh
         Oda1CeGF4KL2L2WxNXFVZvYCXORacxpGLWSpkpUOlpxG0zQ+Rl3CZHB7FxytdlHAOXsS
         ZsS5bmwURm4HFe/KSKW83s46R9YkCZcShlLAasioEaqr671XIECQkpnAeV7G1KdFzTDB
         qhKLFiBn2TtZ2duwFLESqwCFjNSmpUYaJl1HG7G7ukoHsQH0oGuOI0NxgsvnXtwCdUUv
         tdRtApkmFHYLVjd6B3ODRSgOgfCxbc3N72AQNPq50JWtYF8g9uebG4zrnidA/qRj4DUp
         /0Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791229556; x=1791834356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbYeAAPLr81n7CnKFq3+4NoTXD4yO0Ifbs0Ig3aYVPo=;
        b=lAiLIYoe5m4p658n3T4QTXhvFOgrndbrU5e8xh9zY5eCs+AB0lODeWw6v2YnR6bTBD
         uXBSGoLR6lFuxxGE7vWOkT+vhLn7W3GlGpJyHfVyYPxPAEhDaF0dsLnP2J5e28OZTwxZ
         HES9L18p3CskrWre7t0M0jp2FZEXpmynYeJzyLrIRhaDiDwCZKnp2bqvrig6UBru7i36
         Ruh9EEsP35aAVEOdVKA5ZeMh3zqXsvGbewo2pcH2KXCPRjaj6Vi8Mr8Bs32OD0RjHlYh
         UJSpk3KIouGMi09OF8F6WJC/Kr5yzYuAM6L1pVVderf+bAp5qee4d5NuevlMttiH7sXB
         313A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791229556; x=1791834356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbYeAAPLr81n7CnKFq3+4NoTXD4yO0Ifbs0Ig3aYVPo=;
        b=m8+UdvrbtlkjB2q7AHgg6YblDVqJ7K8saW2gvrs+3f1IQYxPgbebDVM0cQcx54Sc3c
         cpgze2Y2GU/E4TF9VqLdXDbpNnXBi+FlKHXceYg26LrwLz33yGHvdzlIskYHVaQq+1Iy
         pcL8YuZLM9W4MpXx3pIfg+kfPldbeAeIaNRGgq4mUNNwgLw7RaUNyfGvGwoTAnA6yfHq
         GaIDixLowRhguLZCkfSywZF3oXeczK5uMVoQ2DYoOT4Yh6QVxo5l28GnAJfs4vA2UzPa
         DnhzLRyhQbiD65r4gx8zQ/euOMNzDJ/JJNOcARCsmOYVR23/ooaaux5Sl5PF668wRCLR
         Z7QA==
X-Forwarded-Encrypted: i=1; AKwUvBwSDmasWwZx4IPXVcnfdsADZLIApebF8W7Wosls5uvvhI6KDCxnasPCP9PgdnDBNCXnOcx1pmyY0Y4dZgA=@vger.kernel.org
X-Gm-Message-State: AFuF++k1I4UTBH0TNfAVT9qWJcDKJan5YGe+zxPYGZ3grFFgTTb9p+NG
	fVKupEFeHJJBt9d8EGPKFA2TAV1xwsmVPIFD0Nav4KX6Ogq094Q3cZLqog2rB09KM3ImHkPCZVt
	LBNY/G/WHmGzy4U/dNkK6kpMhBDEiEMI=
X-Gm-Gg: AYBFou2l7PBRdBRpF6y74z+Gnk5QUYPDNUTkKhBsvRVcrgTrehnhS3avJyO7FayPcVJ
	VVsyYeuivCPzB1LBI2VQVZVxB16qmtqy63MQLjQ2Db99/Ix+QgTElzY78E2pJgaoe/GgrB/CNPs
	ub18EqDRYquNaEBRz7X27KV1NUYcntvaUHlPsXxnfaY05yBc+2TCqZ5xnRHHYkobCYlSaTbfRGp
	b50DTnKwHPDzkUn+ImGuaVCCN4GOnSFplI3lLRZxjSIeRwc+8l7GN2hzDFZiCwFIBAJ8Us+/SYY
	BZuN5FX2O0b6hJM0OcgvRuu0xjz9ocJpgOKT8crvUFTkIBcYJm7ano3WLQK7nBxG16a6AqqqjKu
	DVFGFuHlvWt8QKVyhcE+ANMjD+MiIqDggYEKP6fF6
X-Received: by 2002:a05:6808:670d:b0:4cb:f21b:6f8a with SMTP id
 5614622812f47-4f529c14cb4mr8766254b6e.29.1791229556230; Mon, 05 Oct 2026
 12:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790359547.git.jbingham@gmail.com> <29e5bed16cef4904e9649a9b77d42ec10cd33051.1790359547.git.jbingham@gmail.com>
 <asNdbGAe7XGL3iBI@infradead.org>
In-Reply-To: <asNdbGAe7XGL3iBI@infradead.org>
From: Jeremy Bingham <jbingham@gmail.com>
Date: Mon, 5 Oct 2026 12:45:45 -0700
X-Gm-Features: AclHuK9sBR_JMbEJ17GZhtcFZl-KxwJ_VGnMPOWB_hH_tu9odnndxY0jemoRyWM
Message-ID: <CAMyBmMDqnjR-XFTp4JENa6qTYDXZ6MRP7=7gYTzTwaN=bws9nQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] minix: consolidate itree* files into one itree.c file
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brauner@kernel.org, jkoolstra@xs4all.nl, jack@suse.cz, djwong@kernel.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 1:18=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> Looks good from the high-level perspective:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> I assume you've run xfstests and checked nothing regresse=D1=95?

Of course. I covered the xfstests suite run for this in the cover
letter rather than the patch (so I apologize if that was a mistake,
but it seemed like the logical place for it), but it was the same
branch I've used in the past for the iomap runs. It ran with no
regressions compared to the baseline.

Thanks,

-j
