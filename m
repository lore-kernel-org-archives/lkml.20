Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3823CC7CD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217349; cv=pass; b=M7YkjLRfYimf63XiDy+3kB0u2FQbjCwVRu0AEEyCIc+ZH2F9MIpbkKmqLnPRP8l5X6b9kVASmC14KppCmIR8ltb607HH+QljwhNwkebIRJdInE9XbFAIAMGm8D7taRqAP9u0S00/q6YgPIZ7YLjRMI359nm78O60/zbLDMn0l1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217349; c=relaxed/simple;
	bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+BWDwKCCCmRl5n8JYWfiHLCUNjTPH7MhlkiBQAhPw+cRZL3zoiaK6T7IinI3LfGME//rJI5OSHUPPmztf5Ab9YX1uxlzT+T0n88v9G49Y+IQ2guqUEOqwGRJfH9WVvxmNUXhvyiWAwRT/17gliC1s/Uf0cwZDWNWEc/gGsAWe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifAx9q3R; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifAx9q3R"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a5f5d37778so477425a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788217346; cv=none;
        d=google.com; s=arc-20260327;
        b=ovaNFqFwXUQ7vJlEH601dSiOb5QGTVEL44EaxgN79O/GmOka9bdxoOFYg+YKSExC+G
         oyNDL35U0ODJybUT9svI6Gfqiuzn8bkgM1E669x6M1f0873Vzz6Z53c1T0dBRJulXsUv
         LiJWTO9zRNhkPgHPZzAfdbot4nsbWt6fo1c2nrRuy8G4Oe4mLuMK1r7XJH5/FRk7CplZ
         U/cQMKE8peKJTMpGNbX7hOYm5vjDWuNyHNqRigwwzlRt1jesDLE2SfMg5gFYvtTmKkUY
         bibUpEMkCwy7GHEt/Lm/Cpr4sC9KgzDfXbCvvjm4ifmdvyZlmuCWBl+hDf/OzqhFJNIj
         PTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        fh=XVrE3RkFFkn3FOGCKdTXCM0v6PdYUus9fp3ODY/cQXw=;
        b=IQU5q8bLmuXu/oh6bLn9sXMSCzRqBAxHE4flChwQSfz8xokmOU4rRGYZkmlUge4uA6
         LntHZskbPEp18HvL06mbK7TqhevSNsJ7BaN1Mn++QqY+de/oXASc/si1PRWPYs/qO1F6
         tP2wDx9xF2ETfIqzIfeB79+7pjEvbCUNgesw8hC6AtTnmjEWlFzmnvxDjxAvprBoddfD
         2w9Zt+w53pIKqdU/DEooB174411chpmopdr+lGX4aiDOhLBY1P1Rr1WIAM6SnNP6KW1b
         90LBQBC6TbMICjcYnytR+4fCTB3Pv+StkRA9fdNpguVfLmItKcmMwdoUDznf+7CyHOSC
         1g7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788217346; x=1788822146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=ifAx9q3RlC6ARp0ztxGHiYF8R3lsuyHdfd75Sqji3lFJLwP1kpmViWwvQmd3/yfyf0
         KDR7P0k+mJVSuHGHi9j+Cp30NtYgS7RSnqe/9mj1DIQapHsSAYDHRdYi6QCDWPEegnva
         Q1LwIQMU5eX65XkPV6ONsYL0ILxwlwxtBIK+OrdH40x7apHzJpTM1vL5jLVuDjgf/RRe
         1NXEWoMdp1XPBhOzgUnNUuOqrnuNNC2zkwvQDdXHa+XolulBwfBR49ADVuqUlZ74oufe
         uwWazj5+wpTOwCjT5pOhOa/vx2mfBAyq4Od3vJjLrSSh844fV1Y8S5U5wifmNeX2Ees5
         0RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217346; x=1788822146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=b9zpACEHlb4D2imeVf7MiOSK1egwMd7QZ07abHWsmilyl1uYQvlF7zQfmhaynfHmf9
         ltPphQpm/KSjeMawTAy60E2xYnQJipfn4JXIwSf1cJMchDp5Vhe6UVkv9H6KK9eLL4J1
         rKmYRh1oBExsQjaW2LX7rpMTjOElWo+ehEwfWlreHuhY60VMUPZiQKDIX1zjk6kePPIN
         /RS/kc9Ee1H9FJ3f063bj86mNaYRs1UgoyMCknSPN1HGU2463/k0hgNOA4JjxlHDB90L
         HoWLHyYMLvQrrLSww+zhhU6NtJdLPTOY1uEkMhCmw1af5UVqPs/fO27FCsuUsxIuhKO/
         Z4AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsinvPY3NJry9vdm7gKAakboFsCkUo9Y/dPk/PS63cvLoyxKpnOKW6DEt+3bE6mmLN4OGIODxfwGZ8fJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mqzkGapBCVk/5va1fCWiFvxJlFNZ+ozYdDg2YLSm9kEd58gd9t
	p68ECmMr7MRGiKZ32lOyqOxS9ZbGbYzYXK2Ypi5IZHK/Ix7OT/JShixRlXALn+jDktFIkk9X6Dg
	gcgHXEXbfdFcAi9LI4QY8aqPri4nvFK4=
X-Gm-Gg: AYBFou3EThQl18fi9N6twpqdC0dQiaaIs7VpmGYLLftsjBafvqR5cIwPVrSRvH9mKND
	WVZriRvcQsxsXvfzgmenl2aDlZkPxdZSMwfU6NCmF6Cxrbe5PKLCWnVPF1w4ASv5VFr7yumjiKp
	JWTAp4ppHV9xSw9tc/F45sXQZ46Xk7c+Hwe1/cMwsNWMyXJ27DpSua0LGS3HkJrJBfIlYf1KURR
	Rm+0xtfVpFJf4tWzLJyks00u75UCwyos+Joj752JPAnkdmN3/MHz5lf74cxc71L3OESZIqSSxjD
	RmBpgOgmcnXd+gVXT4u8RpW6yTjyqkcTOoTmPBLcJeJIjXt3i4DlOMQOZoJwn2YZUrMMKe9iNYO
	UwE8=
X-Received: by 2002:a05:6402:43c6:b0:6a0:d411:930d with SMTP id
 4fb4d7f45d1cf-6a60d36c8ddmr8084948a12.2.1788217345227; Mon, 31 Aug 2026
 16:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
 <20260818-ti-am33-usb-v2-3-66fd44d66824@gmail.com> <20260831134643.GA733140-robh@kernel.org>
In-Reply-To: <20260831134643.GA733140-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 1 Sep 2026 04:32:13 +0530
X-Gm-Features: AcwNN1X3HOOhqJKkqX2zS7vFMQd-QWtG1Ec31OOg1tzrgRf7iaa2sG06AC-hKII
Message-ID: <CAOWyW_4RpTD9zAmFDr41sFOj5LtRaGdad7M8QCvQNAQDtamYMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
To: Rob Herring <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Siewior <bigeasy@linutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Ravi B <ravibabu@ti.com>, 
	Kumar Gupta <ajay.gupta@ti.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 18, 2026 at 07:58:45PM +0530, Bhargav Joshi wrote:
> > The am33xx.dtsi defines a single interrupts property for the MUSB nodes=
.
> > Several board-level files override the usb0 node to use
> > interrupts-extended instead to include vbus interrupt.
> >
> > Since both interrupts and interrupts-extended cannot be used
> > simultaneously, Add /delete-property/ interrupts to the overriding
> > nodes to resolve the schema warnings.
>
> Actually, both should be allowed. In theory, an OS version not support
> 'interrupts-extended' and 'interrupts' is also needed for compatibility.
> Though in reality, we've now had 'interrupts-extended' defined for a
> long time. I'll look into what's causing this warning.

Sure will drop this patch in the next version. I also opened pull request t=
o
dt-schema fixing this warning
https://github.com/devicetree-org/dt-schema/pull/206
>
Best Regards,
Bhargav
