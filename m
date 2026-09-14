Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5734519AF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388644; cv=none; b=DD5fH92H0lvtirbUMg0NAo9ESUgDcY6NcuZ4P2BEMt5H32tj6Jgj9Pgypr0YsPb3kvQoeZWrRACBTmTpBNmC3vEZ9/pRZ2O4EfTr5pvqBJAfU1i+KL0WmfwL/LXRBtcideWuS/JRTDfgq2KxnewiKzE4BBwd5o/omlIG1Nx3REs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388644; c=relaxed/simple;
	bh=9Kcpzbv4sy+y+lMrRNRsGoPP7pYgrKWSQtK1/OqMCU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkHC6v8CGSlUGWEPaY7Xkjgr1HSXg78Iel7nD/H4ibZ9TTkyGwfgfupo10Skn3zTjpPDvDXKRFSg2laITXA9zi+DdwjJBt0jME53Qt6a2T7+X90v94ZZ4lbKmBSKoaqWHLbTcw2farZ4pNnujF0Z51zofaY13lGIM/RdqfOU6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUJPyma3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUJPyma3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E0A1F008A0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388642;
	bh=9Kcpzbv4sy+y+lMrRNRsGoPP7pYgrKWSQtK1/OqMCU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FUJPyma3QeZQA/owoYS+9vdIPV4aeJpiNgMa8o4nrGeIG4YK+ZPINb3SpRcVOI2p8
	 2Nd8WJkKnNfSySi2wLMxe/ENzbmbbH8Rp08aVs02qc0PBVf6ZF9YK0ixe6mkuPP2r4
	 tWfecmQuQpc3IxV7hd0pQqNW+EGm0ULW5VdcYl7uE6YskSDkn2hQ4iNd0KAErhupKs
	 JrKX35ZK6+e01/tAIVE6JIQ76/DnHF5hCT4NV3dSzzUfrFDlhVwukXi+sxybYCS5o4
	 qB+zK85hvbU/McrCqqqXisCFUvQcoo3OZt7oKqlOcyT715jYgA7QRW45v9EXQ7izaa
	 JPAdP315tHfBw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b7a9882e19so3009516e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:24:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztJFvVuADf5RhufHE8hqi1YqtAPAw9I9iC9wuEql7DhOkeiU7dm3+N2WYVhB/QsDt2FB7vfPvaNymvtMY=@vger.kernel.org
X-Gm-Message-State: AFuF++mgN/TGOfqtDDbwhUHZQONKAfKZkVT/YHL520DSZbJDOzXBuxUs
	A1U7UorlklPXyPhnFA5HSYjTd9ipI+bJpaO9nogEK5U+l51GvCiXbrs7fCQ0jnRNMBnG2EcB7UC
	6/YqBlWVh7rRc1gYmch16DEuKeBEAets=
X-Received: by 2002:a05:6512:3049:b0:5b6:1a7c:aa24 with SMTP id
 2adb3069b0e04-5b8ae6bcb2cmr617315e87.60.1789388640984; Mon, 14 Sep 2026
 05:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com> <20260903-drm-bridge-every-panel-v2-18-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-18-2ab8ee24538e@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:23:48 +0200
X-Gmail-Original-Message-ID: <CAD++jL=4RkvV32h_h0LEnrxVGMJVDnhcfZGr1fFEfmtpeKZ1ag@mail.gmail.com>
X-Gm-Features: AcwNN1UcodghRtt57PT2sAfDkq57FKogQIfybizYVujvwIEMI2XIW2BAiCJLK1I
Message-ID: <CAD++jL=4RkvV32h_h0LEnrxVGMJVDnhcfZGr1fFEfmtpeKZ1ag@mail.gmail.com>
Subject: Re: [PATCH RFC v2 18/19] drm/tve200: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Albert Esteve <aesteve@redhat.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:14=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel, so this
> code (similar to an open-coded variant of drm_of_find_panel_or_bridge())
> would lead to creating a second bridge for the same panel.
>
> Update and simplify the code by just getting a reference to the
> already-existing bridge.
>
> And since of_drm_find_and_get_bridge() returns a refcounted bridge, take
> care of putting the bridge reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
