Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33B3803EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772951; cv=pass; b=blGpbfJFtW1JCp/UAnN9GjDW6oM81cGrYnPfZFcGjDxAM7uOZKTyB4r+wJjnc3EHh6mxpV3sg23pE3HDc7G1poBjN8kwCyM6dCsiRMwXw+bLKxzc0emUyEkzE/wMEFkr3z6giGx0EXBktFQ+FwbeCpLDgUpy2qi9C2ssiHXov4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772951; c=relaxed/simple;
	bh=9pP2LBH2tRB2fSrm0jAQcOrNlQWLGQS+CkLe4y+uwzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPWJ0lzYM7qCbWx/OCeBJY68hygTgYxxQMoF8XfPM8o0PEiA3Cu4uFbnFDybrFpiDtYonUv+kK0ztpMCvr1JujReMSk0euen3xBZ+ckyjm7Bf5CmbRWNqTvlra+e28jwMs8N5V42dC8fkOuew93GiBXhwEgz8lLwIb06EqXwIm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jC/PHI2r; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jC/PHI2r"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d560775ca2so22419615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788772947; cv=none;
        d=google.com; s=arc-20260327;
        b=pG+yjXkqQWgC32ePCHJAKM6B4QEyUmPDvllqJQ/dTjLbabd0WWogVmpNvWppdCkzV8
         y45Vz5fjufKlt792ljuZkOpPn6/KaD3fu3L2dC2FaqXY0cvYrrfy6N/FWOJckMxun0O1
         5/nOv0CF+87je20og0MtgZUogwVGJv6A6ohIm30e+if6aTCeVQuICn6HIFvKoqPDuVoR
         R0EgOPGpTpVpae88hRtVO9AIJbgkhcNmmZt8rtl2lt7WopFHXnkM8KwMLIy8HgBRP5MD
         fF9qb1HE4KUDtSG74e6ktDgDeAMq7KFEYzWiRLjaf4V71S8uztoCRQ5LdxBkorQvm7tG
         3nIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dIdpvoo6ET3LdAMRgZeWItpBO23tAVsjAcGJm+O6jZE=;
        fh=+bvtpGm++Vkxbt6hP0//aHCLHQIRpg8zMEgd9JQN5fw=;
        b=mUTmFsJ/kXEnttshxQSERhA2ubSl35e2rlZqrrx2Eg8p6uRCgxvRU6wZg/xssZGez9
         D8GjZbHnQbuvbx8yF+9P+plrVllHds3nZ24YXZByYmFHOx73MVPJ8DQ1DxY/1jXzGTX8
         bYqN8lerMdjhPKhRERT3OourpuSFANeIrU5dxvvMjz793+kucdWlXSYMxvyLv1YKV0qn
         IvYZGLmRdU66PKGXWmMcnfza4CJg7X6ZkIjaRniQM8hmekmFsz9rK+KO8JgEs5cwtLNE
         IEuWgBCVdcbOaZ9egrHcc2Aj6mxsi87VCOQ2benlrVYDKZ1G09gvo4K34eGnO2Hz0jzW
         vpqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788772947; x=1789377747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dIdpvoo6ET3LdAMRgZeWItpBO23tAVsjAcGJm+O6jZE=;
        b=jC/PHI2riJypuO8NVdbNerP0XWgRprHZGTvwZIihk8LTdB3keI9jti2BaG3VP5mKDe
         +Jef7ErE76z4s8n27PjY9K/aoHso11aU+OBE6OLBrpHjyDj+Y3zXtL9Bkaerkjf2NxsY
         tgujVxBymAO/luRvnkJ6HU6WHpumH7hjSo96E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772947; x=1789377747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dIdpvoo6ET3LdAMRgZeWItpBO23tAVsjAcGJm+O6jZE=;
        b=tHYPFIpYwnj8raf0VftSez6rww5UZq2cdDxKGoXiV5nseVEDYJZFj3N/hBik8ZxoXH
         aXBoxJqNT+jtKPCMkU8O9wIH31g3XePTSjk7GMGi2KcewwqcQNj0v8jCjjFjgE3pjuc7
         uQbMT4wdx7y2/oI+vN5SE0aMTcKt42NCQaT1y//+Oll5aBuD4g5rua1MrOdckRpScwYT
         IumCcAlN86+bfoNgXFjAIOPEsuI2StRUDhnSxJI39WsOgtJZU+/mPgtkQLE9ObHKeKMi
         N9rIbwXIVrDZza1FAJrAxlOo7Ww/EbUfD6Mdek4dWwkgZrB9f/APvAoGd+D1mUwH4VNA
         wMnw==
X-Forwarded-Encrypted: i=1; AKwUvBwllDHhIN9WWx8VRGAd9lFTxEnKTMI7Njfb+mAG7Jo93eViezN06XKrV278x4UzUQfv0pTpdKAHy4n9ZWM=@vger.kernel.org
X-Gm-Message-State: AFuF++nxAAZRKCydZxuFmPeVX7mzJMH9g9MNy8ImyHZ/tHr+hk6jDvvT
	uZigDsSPhj18Q7qmiHWz4j0ql+sLkacXF54YAPVf7ArZ0quil992XuUkbA+JlBmXO6DhDBdPkqv
	qdPakeOU9LzKvNe5HZUI1qmtE3HPH9q8W+sRPEO/l
X-Gm-Gg: AYBFou2ibwIBbEn6V7Hgsoq9s/UTWOGXr6cj9j2cmlgRbcwywc0q8XTkFlakQIMPPom
	hinMxUWMJoepmMUWcqoQVqWsR+z3vxsT9H/x2yQjAY4c3LgF5vEwo8bq2cx3o1tdqO+2B4SJ06U
	CqbMbkLZFiPsZXFU7R58Amp7wtNiLAfnnoqkTW7tqm5ucabYVz/Nj3WNpKfGsBGtej3CGn7xQZC
	DT4rbxbVEl2NRbBTN/Ay771b7GCRcNUmV8gkEjVOI7uLEdOFxSsWKuKQn0FjDnbxTsrwJVWY6AF
	A064zNPtoeG1r8vjIN/xT4jObDing+d+T1caevzApuY5Aw27q/YdvMQKpVclVgO8bKHGF+lSTzs
	=
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id
 98e67ed59e1d1-39b260d333amr33194124a91.2.1788772947395; Mon, 07 Sep 2026
 02:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129131928.794768-1-akuchynski@chromium.org> <MW4PR00MB15018588F16E0D52D1DF923BBFB52@MW4PR00MB1501.namprd00.prod.outlook.com>
In-Reply-To: <MW4PR00MB15018588F16E0D52D1DF923BBFB52@MW4PR00MB1501.namprd00.prod.outlook.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 7 Sep 2026 11:22:16 +0200
X-Gm-Features: AcwNN1XUAas48pVFC6R6vrCHxAVxzljD-4_1LSrSn5q2OojYadYh0KoAXibEGQg
Message-ID: <CAMMMRMf=5SoF_UdkraUEZ=GdzpCxHONUw9wxJOAPCcWTG5QXLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Shijia Zhang <codgician@outlook.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 1:50=E2=80=AFPM Shijia Zhang <codgician@outlook.com>=
 wrote:
>
> Hi Andrei,
> I tested both posted patches on a Redrix Chromebook with an HP
> Thunderbolt 4 Ultra 180W/280W G6 dock attached throughout boot. My
> latest test uses NixOS linux_testing built from upstream Linux v7.2.3.
> The Chrome EC reports AP-driven mode entry as enabled:
>
>   /sys/class/chromeos/cros_ec/ap_mode_entry: yes
>
> I am testing this as a user with affected hardware and have limited
> familiarity with the kernel's Type-C internals. The observations below
> concern patch 1/2; I did not notice a separate problem with patch 2/2.
>
> 1. USB4 capability was not exposed
>
> With the posted series alone, cros_ec_typec did not list USB4 in
> /sys/class/typec/port1/usb_capability, so the new USB4 entry path was
> not reached. The connector has a usb3-port reference. That referenced
> USB3 port contains usb4-host-interface and usb4-port-number, while the
> connector has no usb4-port reference.
>
> I checked upstream coreboot to understand the firmware topology. At
> commit 42f142bd9fad2c9f47c4925845bac6fa686f68c7, the Chrome EC ACPI
> generator looks for a USB port object with port type 4 when populating
> the connector-level usb4-port reference:
>
>   <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845ba=
c6fa686f68c7/src/ec/google/chromeec/ec_acpi.c#L46-L90>
>
> The generic connector writer can emit that reference when supplied:
>
>   <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845ba=
c6fa686f68c7/src/acpi/acpigen_usb.c#L93-L102>
>
> However, I could not find a USB port type 4 object in that tree. The
> Intel platform files instead put usb4-host-interface and
> usb4-port-number on the xHCI SuperSpeed port. Alder Lake does so here:
>
>   <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845ba=
c6fa686f68c7/src/soc/intel/alderlake/acpi/tcss_xhci.asl#L120-L186>
>
> I found the same pattern in the Tiger Lake, Meteor Lake, Panther Lake,
> and Nova Lake platform files. Linux already consumes this mapping in
> usb4_usb3_port_match():
>
>   <https://github.com/torvalds/linux/blob/v7.2/drivers/thunderbolt/usb4_p=
ort.c#L95-L127>
>   <https://learn.microsoft.com/en-us/windows-hardware/design/component-gu=
idelines/usb4-acpi-requirements>
>
> To test whether this missing capability was the blocker, I made a
> local diagnostic change that kept the connector-level usb4-port check
> and also recognized the mapping on the referenced USB3 port. The
> Type-C class then reported:
>
>   /sys/class/typec/port1/usb_capability: usb2 usb3 [usb4]
>
> 2. USB4 entry did not replace the existing mode
>
> After the diagnostic capability change allowed the posted USB4 path to
> run, I observed a second problem. In one cold boot the EC mux initially
> reported:
>
>   Port 1: USB=3D1 DP=3D1 TBT=3D0 USB4=3D0
>
> The cros_typec_enter_usb_mode(..., USB_MODE_USB4) call returned no
> error, but the EC remained in the existing mode and no downstream USB4
> router appeared. I also observed a boot where the EC reported USB4
> while the AP-side mux state was not yet coherent, so treating that
> reported USB4 state as a completed transition was not sufficient.
>
> To test whether the existing mode was the blocker, I locally requested
> USB_MODE_USB3 to exit modes, waited for a later EC port update to report
> DP/TBT/USB4 clear, and then requested USB_MODE_USB4. I advanced those
> steps from the existing serialized port worker and used a bounded
> timeout only to detect a missing transition.
>
> For this test I also registered the PD notifier before queuing the
> initial port update, so a mode-change event generated during that update
> could be observed.
>
> With the dock continuously attached, a later cold boot reached:
>
>   EC mux:                                  USB4=3D1, DP=3D0, TBT=3D0
>   /sys/class/typec/port1-partner/usb_mode: usb2 usb3 [usb4]
>   IOM port status:                         0x86000368
>
> The HP router appeared at 16.885 seconds, its retimer at 17.147
> seconds, and boltd authorized a 40 Gb/s link in both directions. The
> complete USB hub and 2.5 GbE topology also enumerated, and no
> cros_ec_typec transition timeout occurred.
>
> Could you advise whether these observations match the intended behavior?

Hi Shijia,

Thanks for running tests on the patch!

>
>   1. Is cros_ec_typec expected to obtain USB4 capability from the
>      standard mapping on the referenced USB3 port, or is firmware
>      expected to provide a connector-level usb4-port reference?

I am unable to assist with this directly. A potential workaround would be
altering the cros_typec_parse_port_props function:

    //if (fwnode_property_present(fwnode, "usb4-port"))
        cap->usb_capability |=3D USB_CAPABILITY_USB4;

>   2. Does the USB4 entry path expect DP/TBT/USB4 to be inactive before
>      requesting USB_MODE_USB4? If so, which layer is expected to exit
>      the existing mode and wait for completion?
>

No, it doesn=E2=80=99t. The typecd daemon probably enables DP altmode.
To test mode_selection, stop the service first:

# stop typecd

Thanks,
Andrei
