Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996423B05BC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296926; cv=pass; b=GnY6cWXksc3Ln7aB/dxutZhRLaRtuJgLxw+vKoUvvS/iSD/EBGlrQAxjMq1nynOw/3Qc4X3LjZprU5oaYK9qpN79KScqzI+rYgfmeiXlhUP+OluwKvzQPcuJ828OgxF4LThYa4SnwJX+vK2TJ+IxUYXpnsrVxFD+N9xM3zUYiGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296926; c=relaxed/simple;
	bh=87ORjmeZS90TYJ1aF4LdvctsFWMg8mb7HapFxeIBibg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhLmbX1B9qFo6TqOZfsjIr9CrSbmUew8QYx8kZEjefLV9pfla7wneJCnD5Vr4v8FAB31aoU84FsYnosnnhmvA1y0hLweewo2GrFrovTW3fJSOlGZp7N+oJQG5RGUHWSl1L+xUyGLmEsmfFKPZudalxHuvF+lS803pxC5l7dbovk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQgI9n0U; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQgI9n0U"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e2e064b932so15501285ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791296925; cv=none;
        d=google.com; s=arc-20260327;
        b=spJVVFnjMFir0c4aOfRx1TmsLDmt9tq14a8tQvUwf4X6mACj4NVJ0AnpVCECH1lNxR
         5ri1WPYfbSgnscSTjT/lgUJIOGC1tsM2pterraiXX5c0BJPYbGrP1aKXtEnCAbHSvwY1
         /Lz5dgxSlmPq4QUHpEY3o6DomxEdSCXqNDqhqrBdeAuu+0RmGyyD/hCSIMOq+je2Vbff
         OX3UNSVNrLIsvrLIisxamXe5llgdQUcYklVzLGNoQy6+q8evfLW1jKnVSWShU/buV/j9
         UhQ1KkFcrJAf6i4LhHN2e5/CLSOkwR9j+F/rdJCSmexixJnxvUnM44XBP0MQLAREGPYC
         ehxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sNKdgKJfuDIzOlDHBVpcxS6ncuYpdF8HQDhr4gmgvGc=;
        fh=NO8/1bA4pSpKRC4b4oA0fwsNy8SM4zThsnRGvz+AKrc=;
        b=s6BStIaEvXqYDR0eW7HZSPmgVhwVQ/fsSRKTysoZz9cn8m8PnqLIt1g+ukbdCSshem
         PfxgPjYUI38khOeFT5lB6D1A/MqP8rHHomVHPN0ruvAsPy68TarUxM8Q0Vj9MX1pvy71
         PlWVcOl7xr8pcKYAHr1impZU5iDMUNvT8DpGByL8MPNq1yWttcUqTiV+oTmcG+VdyyVW
         nEQ9ThyRt8JdHhy8pBIwMuOn8nVdEvVK/gsfDvzJhBtyUMoTnamfXoEZTsb5OhdYZaOf
         +w0kkKVDbQNt1cURHLe8oNnWW3O1Wejo7YRiBh5jSQMyEpKGRf2ZbCGh77GNo65R00CX
         jHDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791296925; x=1791901725; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNKdgKJfuDIzOlDHBVpcxS6ncuYpdF8HQDhr4gmgvGc=;
        b=kQgI9n0URkzTfajnld3BicKtIcoyGS8cSVxAgSud0RhhKXRsFWhHohZSOoUME9cblb
         o+/VbAIyTlclA3eJbleFaubrJhHgNgnpMBZqYLzbSGMZVCu5fjk1oTzqLh53vmzDQ7r3
         iRdBmP9bHVEIPeTWTMxJg3V0Kf8Z8HofkdDWOFs2k26cribEMV9UT8zdnCR4OLpJxF8p
         Cl00Ug1E+RPWFipF89Vwqrb9sP0CTTsV+4bEe2Zz7CNBPa5Ls0/y/HH+XWSpmvd4jLzc
         KMaCHWtPch4fe6IDF6EYvPRf2ea2Y3PwPEek/IPrM9BCQKQxfhM0N3q6fidlVmvIgl+v
         I+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296925; x=1791901725;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sNKdgKJfuDIzOlDHBVpcxS6ncuYpdF8HQDhr4gmgvGc=;
        b=rAcvTucY+pjqg86C2SYuGbkUR5g30/FhNBqTAriAMHypyMln7BJTT5jfTNcfSNEJG2
         h0GPBgjpy1jMC2UuzUI3jvpXusIjKXNZicERcvdPJpFudyNjPw5v8uSsH692pQ3zZPra
         3YFo0qNroUAZOE2p52CN++bYjqQnxZLmxqyuPaU8BJzUZeRY0yezqWJlNT0vVkICRH7Z
         XOn9FyNY4ROFI6RLxIfTb3la+OzQied2slzTbRx7gy12we0tIWKh81+YTuJ27SPkaaEP
         GWtXMwTazHvr9CsfGjfR/4fj6iqT4mx5t9AHDJm1sbE2gEj5KSWDw9XIv4gp6svawdUx
         584g==
X-Forwarded-Encrypted: i=1; AKwUvByxdbDik0NGFkm/PcV71jcDRFrYT3JtnieNOWqfJ/90avUxCilS21wLC/mLfX8bWp1vSUphCWcfF98EAnM=@vger.kernel.org
X-Gm-Message-State: AFuF++nAhQ4bifdqZ0NwbiwW8E/JesxZtsYsxAP+tt2AP/slCdXNVLVW
	UbrC1mEqIDm8p+F+vJ4z24CEXDvZrXH8GZkYPoRwY5JXBxE71ce1RYhgJbVd7/ps1IreZDp9p/6
	PpG5lD9brUnPO+xFk8UL2mjJ9SY3o9M0=
X-Gm-Gg: AYBFou15lVh8WyeXbuCM474dYDCOVGD1V45MZh8XbjDJjT5dC1TKGlnG784REItrB1K
	zAZ2eys9pMTUfY6UOsaflK/vzUrhMIk7zRNwhTYYtcY3trn4KxknLG1IDKRY3CRRafaeI8iScGK
	04fJF+ZVlYr8J+eKj2803kPl8zvjm9xDGLt01XIHZT/VPciaL1SqhAuaLrZBWhD9zhtBvZkHTdw
	/qKyl0URuKJdynaeSWuTMRL86GAA0CMsbNMqqplWZj9tn24j761xIktKVdvONwIpdXLQq6q86rz
	JnnBzELcC5LG00Nj8W8j4uqFUVZw5UYthpVAC0PTjarTbsLIVwQtGsL5RZ5Z3QC0pOkwTKHlu1B
	uZFwPqDUM9yBboWRMNdM=
X-Received: by 2002:a17:903:fa7:b0:2dd:c100:4248 with SMTP id
 d9443c01a7336-2e5104fcda3mr92782805ad.44.1791296924894; Tue, 06 Oct 2026
 07:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-asus-ec-x570e-cpu-opt-v2-1-74df23c22f04@gmail.com>
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v2-1-74df23c22f04@gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Oct 2026 16:28:33 +0200
X-Gm-Features: AclHuK-hyLPZ9vVLoRuEwnojL4qJYb0qoBFxRmZ2Kq3aqdU-d3LnXzx9-QGWZy8
Message-ID: <CAB95QATwqKoUPF=w7jQV5CYwTNBhcU6_vn7q15GL_fUWNGiefg@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
To: mdlayher@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

On Tue, 6 Oct 2026 at 16:15, Matt Layher via B4 Relay
<devnull+mdlayher.gmail.com@kernel.org> wrote:
>
> An LLM coding assistant did most of the work on this patch: it found the
> missing sensor while auditing this machine's monitoring, compared the
> driver's board table with the BIOS hardware monitor, worked out which EC
> register to read, and drafted the change and this changelog. I
> reviewed both, and every test below ran on my own machines.

I believe the Assisted-by: LLM sparse tag above is sufficient.

> Testing:
> - Runtime: the same one-line change applied to the driver in v6.18.54,
>   loaded on the board in place of the stock module; CPU_Opt read
>   1454-1463 RPM and the chipset fan 0.
> - Build: hwmon-next with W=1 and sparse (C=1), no warnings;
>   checkpatch --strict reports no errors, warnings or checks.

Regarding the testing section, I would suggest removing it from the
patch description as well.
While the testing is thorough, that detail is better suited for the
cover letter.

Otherwise LGTM.

Thank you,
Eugene
