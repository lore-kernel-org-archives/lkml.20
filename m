Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A8457E65
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195949; cv=pass; b=m1zykcH4ZPyAZFQVlPivDF7ritUOv5+vkUH6KYzO1L6lGOiEdgMLOBh4AHdRImKGav9G3Bsi9kKlC009IcibS++Bj5LLGJEVCRtUrjbGCNTejXCz/SmYVnTWyLL5LPlyVqcadKBHW+Q2Y7ap+NKZgq6jqFe+9eniw8ZQUwuAS2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195949; c=relaxed/simple;
	bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWmvhpTB0dutyEYtpbljkZ9/v1eRuMrys1KfUWepCUCQQLu2lgkf16a0NYwjjsY0VQWdXubPzw0d2cf18glia4W03VtLl809GEQOdy03JybBFLPbz6TNsBEM5rpQUV9b7xm0qHVeHvKlYRv19TMnp0pltUPymlrmqTCtlbI0gqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csMTY8Ox; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csMTY8Ox"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so12347741cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195947; cv=none;
        d=google.com; s=arc-20260327;
        b=grQl/Olf9Qf9n1qjuU7HF4RPHVY7OLB5yprHWj5nWdxT5Y/KTJG4k0IPgrnWnPF29n
         iDnX2CrEfMdABTZEp5U3jHXdpb7DoS3ifryfVoBqY3XclB99LcIiPkfb6SltObgDZ/Y8
         Dasrn60WLKyGv6iUfD0qwhDBQef1hmZMqb/Pc8sxH/u1dXNZKwdyptmchgioqNhOuGIf
         Exb/PkAEPTuodzgqK57I3WO8R8pxyAMSlRd5Ygc2p51tlNE9W4X1RnN3zb7rL8MoItnw
         IoB7vD9V/CUiLUsPm4I2EgnAoEyPWIUr/vxKCpONKaK/hnhU6RP9pRgyz+40stbgdkIq
         45Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        fh=O7p97InSi5tXzqoxT+pDDWCvBTq2uU/8obMBoi91uo4=;
        b=infvK6F2eYjJArqpFOb6u8IFkIqkjMm0RwWVsXuS1+f8NAdcqSaXkApbWEUt9SojXN
         rsUu19JmwkLYv9360l71o6iBQUczhuDKM9C52IVGbmMsXaUUdNzKAmhKF8qHdT2DLOk8
         xjxXKJiIkKy2ykuE0QRGl4B6NwWdLlwoUj6Ohmv3FDnXie4DZJNX3WeEn1SGVLsfFN3v
         8GO3pN5GW5aZAADqEQR7KS0LAOwZ90xAS4tLx41gK4+FL4ai9SOcyt3JjXKxAdtiA345
         vXOtqQy6TvytAxbINYQMb6EwxL6BW8643OLbfp9nsTfIJzqrC6nkKXzFz5ZwDu7I4f7p
         7KUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791195947; x=1791800747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        b=csMTY8Ox4rs2sHwbYAe4kdLfZHcAdNr4baJOZ/JVveY8zWFTt5wYIVohDWjQxoFcoe
         xQd1wZ5r4ELNp5/7I7jbVDfy/0D3fcKN2QPXg+2pV/VF2Nka0dZaRuvPdzRiV5nfs7da
         muDKjwY3GPCsBCF2D85E/7Vya09Yq9pOKp4XVx7/UFdldGqTCnXtNcQ+DDqwAmzEBJy+
         rOTuf/+lXuGbgvXfsOJWpkgl6zLULtLhshH6RezyNxOrqoo9ht2lh6Ga7KZaarFY1Vyq
         qCRq+LrNnJhIASGng0U3b6yzLMCnt+ujYnJ+dkwelGG5BlrrkNzJSYfBIzhmxPlb3SBu
         bjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195947; x=1791800747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        b=zJFj51+B66mKWDkUSA7R/k+G3L1YvC/CDghuLD8kV2IQL1VDTHpEr8bpLxBP3S5gAs
         BqXncugbe0vIhbCk88DpcrqIk9xMEQUt/agTblcbNRkR7NSCT6huZDfSF4oVWZRcWnSX
         jnI+zg4qisBes3P16fm44Rpg1/E9HEcWsm+SzOq3CP0P3fml5CUXWpQY2BYDOUP/iDw9
         yIBirdU7pPGsZUYU6S0zHkZkKLF5M5VyhMH+2QND0kYSI7pnu8S1jH6Bqj2ccQIqf4KM
         mkKAh2l13Vr1tvwi+rcNx3iDbs8huK5IIXfR2vupi6W2tlKrHC7CvpGiEtvcofAbkzo6
         m71w==
X-Forwarded-Encrypted: i=1; AKwUvBxFChvH80UsN6mn76PjOIgTk+yNR6SNnOT2CxomjDi4+XyTsLgYqHHjbeo2VrE25z2c8N1et2QwSeSeijE=@vger.kernel.org
X-Gm-Message-State: AFuF++nskW1JzoN971yKum9qFlvjgR23DXTnWDHlKe+eliEP8W06H3Co
	Sbf8rrLg5dUj8adgRCuZTTlipMssOv9TM3sFiVi8nURt8C0b+a/o1ZPAMcFYlHMuFrpeQLMbt8f
	jcPxgQ3ZpIKD/hZM4rNUwwfujkZAL+tM=
X-Gm-Gg: AYBFou1VnMemQTq00tKB4saEIkFHuw/4b64xoxNm1UlxUhJbVfCIPQHHqOnHd313oot
	/XCk3sgfJqwe2TXms7xQCKWCch45xgeFK2jmdYxFI6cvRZ+nGlRBBx8tWG2m9BQq0w7a5eBfwoN
	F5OVR4w78h3ZgkzlSu62EeoLE9zy3r2sLXHHISuDJx73gX/fZIIdoFQ4yTcUofGdJukUrHZIrTu
	E2dQzsMjhOCjWh4CtnZJbdctx8tJtF3h8RklwCVv0NKop7ZjWALl9ozquNimaA4NxGGfPIkO60c
	ZkDGKiOkqxzeXpzV0UeKguuKO9VITrIX/uF3DGaFGhgzEX1SGgtpBpbm8Rdh2v333hLF6OmhaL3
	juj7tgnMI
X-Received: by 2002:a05:622a:4d45:b0:533:972d:ff95 with SMTP id
 d75a77b69052e-533cbdb3d51mr186553931cf.34.1791195946812; Mon, 05 Oct 2026
 03:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930071826.48811-1-ansuelsmth@gmail.com> <asN42bZlK_jwS6uH@parshuram>
In-Reply-To: <asN42bZlK_jwS6uH@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 5 Oct 2026 12:25:34 +0200
X-Gm-Features: AclHuK8w1WLWfIar1hB2u7SB0lgs-cuuBNgIsiH-Khygv0yU4CoS92D4l8-G0p8
Message-ID: <CA+_ehUw-Lx0wvN5O_9QFZb7USV8xBc=_z+7dkkB1ZW6owv3jVw@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 5 ott 2026 alle ore 12:15 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 30-09-26, 09:18, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> >
> > Also other unrelated patch are dropped from this series.
>
> This does not apply for me and Kconfig seems to have a trailing
> whitespace which checkpatch complains about. Can you fix these and send
>

Sure I'm doing right now!
