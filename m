Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519FF49DBB2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847314; cv=pass; b=SrVMHNfSGon2ySd+fS1E2oX7935bVjXKLOczWilaQJ4LIG76P+r5suuMB+EJO7co1NETRoX93L9osRVJjqwBwu534haInEmO69tTahDqRqYjWUYY0VNpENKPLGAXyX8SQVXSajEGH+Vf13Pjod5QSOu03B6pvzft5qz2fHJbAPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847314; c=relaxed/simple;
	bh=pGCU+YkLRfAjqDH/u84zLx49H7YX5I4bzZSwZUj/YFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsHXkcRMQ8qq+PboYQqWE/1ts7XanrnLwbPL9EpYx0LuS0YCg6VMkKc0v5AsKn7D9/1xhVcW2tDfmCvE9HoePEkN6UVJejdGVL8eIqYq9+IKwAYRd6S5CKtnTZ7BwkfCDlSuGkYXMY8iMPMU2HcVqIFuh1z73q52HsgajJEFxg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sd7T1gK8; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sd7T1gK8"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so3583531a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790847311; cv=none;
        d=google.com; s=arc-20260327;
        b=MZjX0mWUD00z4pUlxC/nPgDodnM7xjtV96k5yqkC9M1W1zmsqXryswxqnziT+yhqAH
         zqRk0oDup4cyl+S2DQa3jVKwoLdsyclq0vbI2Rq1UpAbsO56NBbgBv/xSqjB6O76FCWJ
         PO+A0PRL4wRbFKzliI/PfwotS/Zlcsz3H2PLoUl2sXAP0Vs4sWAAgXsrh9Csa7+fb6+i
         HUQ3jkhc4Y5yAjsWHamQwBMOltQmUd8jv/81Zg8YXAzT7Y/m1f2UNGkXoJoVtG0vijpk
         80+zyGO3YrAu/eYe/SGDUhEPmuDimL/zBa99Q/YwoZhV6IVz3Of1S1/7tVuUD06a02p5
         Tyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        fh=uQ/NlsyQSi3eETUvkalcjHqVCMObVGgYCEEcgNbO2QE=;
        b=Ih0e5FQQWk67WwhSvq8QJtWQpFJgpTgRE29x/KYinHHM9BA/P7G2bw26sIPXuOCkmY
         b06L/kXBnsh0IONT8uYSg7JSORafOYvC1MZGWLe9meCydgrTONP16RzB1QBcZwtOND9S
         RcbzDE/sV+8ULlHXmWFJ3gW0GIoUcgLqayBkAFAXlPB8J+FrBhGUuaSPipSYajIiYTPD
         5zMhimppoogUJ5APbhaE+jSmWmWWmVyKnXJXhwYgg5RO+Y97aLT3ZMHJanP1K+0XN5oo
         YdoIen/oKnBxZQNNvyYl519yRFo4dfSDDPwesW4WuVCbhCXJluCGY2H91jqEID0BzxjL
         ttyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790847311; x=1791452111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=Sd7T1gK87cHX73HpDC9wTDcnlwIIaXy5PqhY4c2sGOrCxmMdIx4rOvNbQn2CPEUDXu
         gwE5IOMkEGtbfx4XkZim4q2TUpTZQzoRC0B8ZdmA4Z24Ix/KenG3YoHIwx3MAYaFmO+J
         79eeOg7h9GHcm7IBIO1976lnq7QaaGro4G/ZEN/lpW0nvoYkF2YSu6jykQ7q4J7jIiB1
         KUth2sGQZKhZykdCjBFqkO/n/FTtlLPZsXzSGeqcQDlrhypqqbLgQX5IgfO1V+Pgaqkn
         Xd/rvmey5JbFXViUf+xiL9oe/0gDfyB2176JFotDsBCjn5ZgciXTBQmJ0DUTHucGgPPo
         +rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847311; x=1791452111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=Qe+pW9He/HdjIVyxT2v7CAOp+L6gsUw81pdUsvJcWcGOmM7DNhQNTfVN2WtSerS8Hd
         zw2bCrZTDNywAsGlE4dhS7ysvRBxmE2TODQ0gKLbMqqs5YYW70/age4oN3VwqobDPAM+
         Fd22FFnf1Cy4F2+fz6IjyYKU6wUJcz11WBSj2+YDM3Pqa50W1VNrm+Dd85HxaJv5C2Bd
         CetgQn4YnlDIXZaBCLlBieXPW+1eaeW2O4tZTBQTeDCaiR/W3MjmhjQUlGpR0Kgm5yC3
         tQwp56YBVPhy6YufLx9G36f8ZnydfXvBXd22Ad6ZyAbw+r87VrnwVJpEt9f58vRc/BgI
         Q6LA==
X-Forwarded-Encrypted: i=1; AKwUvBxNljsyqBlXI/I1giBTfTnya/LOawKwLZxBSV/1Q1U3a+V21yRa59KUAtaY8oqsXkRNYOXyXjpChe4SQOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHLas+JSC8tIZRowjNYwpgEHRMqVZV3BWAxNEoCamEzL/luGSl
	72Bi2oYZOUEs5x9RDkJ3WP770h5/Zl5YA8/Qct4CxSzmKuZIgL8efxtoUpg3x7dPV9/6KDwFa9f
	EA8l35MP8/T4rsV2BUjwxaW/IXQTDhVxeDoVik6Il1A==
X-Gm-Gg: AYBFou3kNLM37cWyfIqJ0BqpMZm2dGu89vVsQZ2/xEVfK+7JgEy+g47W9tVmz3srzA8
	RcUg/NWHHreWrnSCeuJwjO8Mzy71yOjJpdVliSn2koG46mCkIzEH5AgXX9Fp6y6fnfF6HD9svZL
	LR03lFcGFW8SFtwyXeupAo0bA0kzEp2Dr5qH5yFDA5m5qrWFZ2p4VYSJcNa8vXtfwlJoDJygaZv
	HiqbAs7yjB0Otx8Q7izhKmH99P4hYcMjhYEHH/WzELYggJqAWWaY9gFcYCBw0WiQFKtrlMQCcu1
	PL4zpbbZOu530kMuGXdLIfwHNaCPg8/SlMJ2UUtAACsRLBxJZ8LQWR7RXqYxFHjGn9asrLJz5tB
	1pGMEJ4tguC7gtQ==
X-Received: by 2002:a05:6402:c4e:b0:6aa:490e:5506 with SMTP id
 4fb4d7f45d1cf-6ae1996fd65mr3129163a12.39.1790847311405; Thu, 01 Oct 2026
 02:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
 <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com> <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
In-Reply-To: <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 Oct 2026 10:34:58 +0100
X-Gm-Features: AclHuK_YpgKbBYxkFtRgH6bLpQ_dPXQcVCNkRBcwgfpIDgIy_RrFnu-Dzk9rMWU
Message-ID: <CADrjBPoppW+tAY3QXgawcCx7nvvSvWkQDKbP9R4r_4zAU3vWGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 06:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 17:47, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org> wrote:
> >>
> >> Fix newly introduced DT warnings:
> >> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588=
0000:
> >> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" =
or
> >> child "reg" or "ranges" property
> >>
> >> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for franke=
l/blazer/mustang")
> >
> > Is the above git hash correct? In linuxnext, I see:
>
> Yeah:
>
>         WARNING: Unknown commit id '80f23487d554c7', maybe rebased or not=
 pulled?
>
> I'll fix both when applied

Thanks Krzysztof and also Doug for noticing.

Peter
