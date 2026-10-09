Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC62421239
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525606; cv=none; b=WhRW30D9yGMpa+/VyL3SuNfv82JXsGgFv0Xrgdv/PR5w/AxBA8mN75TYOzYCAqx3RnjvSVv+WNDPZFvXWSp4Kccdst1CYor/Az1mpZdUF9XeJKMj/IJ6QSVZ8fnZPczsA1JflP6121OUcPak0kG6L4se4qG1wkCj+YnVUwObrHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525606; c=relaxed/simple;
	bh=is4gJLoi2ipJmooXAfray6TyXKGcAgJe47D+iW9qPlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3972S8Z2HF/lrCEuXmbD5dRBKR3z6ID/h5S8hAWzziH+J0TJK8MSD6Z4wh+tnrradPjxMRhbKwMIVr3BAcKJ68nBgxfstcyAhbYBF5gz79c4BQNgdJeGkGU+9kwM+zOHsirQeNz2FyjrjbuT+i3EKuOri/RD6G4+gHXv+aG5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab38a051aaso38545887b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525604; x=1792130404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWTuV8nTat+7Ise5DAVZrckoXbB3rEEMphlZwWdvIzs=;
        b=KTVCs5cvxNr1VpSNRWEuw/+b0NfHxvGH/7RvjnXPybKjWzqy4dVMHjzjNIPjiooh9C
         DOydZsM+LYPWH3gb3ymOrVKgYRj8Ci3tK3SrI8LukYYcBveivK15zIVTxm+r7yImidsu
         jv/HCu79uNvZ7wRcOtWPx5WgeoOA9MxlKZXN/omLtmDItg/J1QBHxqKEgUwR/4olf86r
         fksWcfOfv9EmlGoA+j6Djph2xOhKAXb0a9EDCMDB09IQ3+HW4WZM4R7wIXEd/kqjZ/ew
         fQ678rdGjUyskVoHEq0k46t3Wnbog3A3sekz/JawJD0f74BieFRgixndxUSgmG1F4PJT
         r4gA==
X-Forwarded-Encrypted: i=1; AKwUvBxTa6/axnr+ioSe9ECDem8qMLEzkbL6buMJRGax6pp1T0p2Qlo59ZL3sZLZjtDhgisZZMNDMTQ+HDnHSW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhensos5ANQBgPtkqJwhNZH6wflmEhro4DKdPEuj9lroIo1DEF
	mfbaB/vc7BVDft+ILswWiVhSNvbup+0hKWqCO5g9kM46Su6iFHlCEX1Hjzf+LqmAD08=
X-Gm-Gg: AYBFou2KT4NVwDfVjQ6+eTodWrbhlNhny6bqfef+M49YYDxW42n7pdXG/krfpn2VbV4
	/dZ7nSc4UT035egqy9PfMTmOLIPQctI+aCmJoAHEW2Wb6/tUp9JBEhhMxKn8zemCD0UDryw8tsC
	H3/Ik/lS8sP907X2dLEh+Z/dNx7Bmm3nhKbNITlz2eGNdim5WXPYUoYaW78DSR91EgkzpEtxfJk
	LphQVgC6aZFbB51FNkE1Cc3U9xOpKbU1ZP8feVMV3aMBKi9HRPvKan6MX32YH5+GbnNVWv6W/SN
	fEkr/mizBp41fqR8laJQ1Pjjtth3s6yyeb6DcaHxmPR/j8u/I3m2+Zco7bOO/hxHKHDtC0hBepe
	pXxB//J3jc45Xc2QwbuMTJtEVv2lYv3LE9GB4ob+//vP+m5Ft0HN1QpEuI43kuKP/xzhT5V6eC1
	hXOlN+2nPCj6hUJohRNXnJpYeh0nmOefjwpwwFadcqOVPShmHxuLWOqbyP/UeNU5S9zI8NXM8yY
	SqMM0O9NSj/0/6Vt0TaGdaWQDL9hjmWVlkrttqZtmbL7XYrGPD9SNQMP8duEEi2x0KhceOlSsqy
	QuM=
X-Received: by 2002:a05:690c:4f8a:b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b07ee51851mr2561217b3.48.1791525603709;
        Thu, 08 Oct 2026 23:00:03 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f21bc70sm3559857b3.27.2026.10.08.23.00.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:00:01 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab38a051aaso38545477b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+84hmQotRqogL5rFR3MeGJmHLft/Ibjc9LLgMUt8ktMLxfhDx/XCjDItiry9dYi/MenPJUuibzw8Et6c=@vger.kernel.org
X-Received: by 2002:a05:690c:ec4:b0:8ae:8d28:77ca with SMTP id
 00721157ae682-8b07edfbad7mr3120487b3.33.1791525600619; Thu, 08 Oct 2026
 23:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
In-Reply-To: <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:59:49 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
X-Gm-Features: AclHuK8Z8XHB904erYGkjWemp1Y2Gn2Ya3i9_K0CjW0XJN3l42AYcMZ32Srg4dI
Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > The T7 pairs a Synopsys gigabit MAC with the same glue registers the
> > G12A has, but nothing described it. This adds the binding, the driver
> > support and the device tree nodes, and enables the port on the Khadas
> > VIM4.
> >
> > Unlike the G12A, the controller reaches DRAM through a pipeline stage
> > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > clk_disable_unused switches it off and transfers stop.
> >
> > v2 changes the RGMII delays, after review. phy-mode describes the
> > board, not which chip adds the delay, so this board is rgmii-id.
> > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
> > transmit delay does not work here.
>
> What is special about the RTL8211F?
Maybe nothing, it may be this board. I cannot tell from here.

The RTL8211F does add the delays, the driver sets both bits and the
chip takes them. But when the RTL8211F adds the transmit delay, this
board gets no working link.

I measured the receive side by sweeping the MAC delay against the CRC
counter, with the PHY delay off and then on. The window moves by
about 2200ps, so the PHY receive delay is right.

Transmit is the problem. With the PHY doing TX the peer sees nothing
we send. With the MAC doing TX it runs at 935Mbit/s both ways with no
errors.

I asked Khadas about the board, no answer yet.
>
>      Andrew
