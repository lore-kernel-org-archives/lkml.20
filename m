Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8F43DB64D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509652; cv=pass; b=okRK0R/7qqFlXYbHDE6h6aqyoeNicXM7jrtA43tSiku4inDjAMTs6CaDVjYXfF3UcCnPUr3QcY8CKzV6zj1o19fd6YO5lWJ/u9vzDTu56vtEIMCOYqd0RbMAJoJhr8OkC1pdtz0veGAXmWcZseHVq59jso9sY/iKNVWCKKxils8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509652; c=relaxed/simple;
	bh=cODYgkqioxaFXfwJn7xnB9uWDLxGNrCsLV4W2VTwJEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2uaApzoL3DJ6wZewO0PSheC52HaITRTvm3LWdzn/XJeqAhPY40Gbb60W6BVY8FUcKc1GMKwT3AZPi2ONn+g+TGCEX8VMVYheIx+cjssiwDY1nt9lmydZKCvLj27TK8NMXA/c2FHPtcKfGX8y1dijZ10IA0RAY0jxvvuYWd1fN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hp/XmOUL; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hp/XmOUL"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-866e57f63a3so8101597b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509649; cv=none;
        d=google.com; s=arc-20260327;
        b=ZnQt7uHgg1IurmelCt+U2xwc36LD2ZbJtpR94Ckf1TUOKNO3HgpJm/WGrrzifrYt54
         uGAYfT1osrXPGCYHqYLzoK0U46rZ99YyrR76ohb69rkLYWHAYNs7e2WY6cwwrp7Cch9B
         Ymr5AcHRLYKHr7ribIOJSiwoLrJX4Bmmt7IXX/aUc4AWiOJAHqEzhkB3F9hzK4w8ABek
         RuMU/Jdds5N+ysIxpL7ihlknX6xctgyCTquJ4KcjrK1syTmzQ1i1k64M0sdrB29eEt6L
         t1hU132/1MH0xmO63clHaPVJmWHy0DUQP+8tvfEXvr5PpVkkmebUDQ92xGw6g/j8ZAZZ
         eEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        fh=KlTqg+2r0sDubqlqKwumNNUbkNm9PaJBCJiYqIrconc=;
        b=MA1YS1G8rv1vZX/sl5mgjUzrQGJ6hFVFqUq2s3X5QmQBWzSx7pI8TqN9AUbd3LK6lT
         vtyOIg1ojx/fD0KU4cncx7NsdlnexjR/yeMWMWL+38aNoApCeWac2do8mg5IDCSKodbD
         vTKPrCmhCUMWsaFQbvpoOIInSXlZLb+54VCoqwWivbvQAnUrrJaybGPFXU7/4EHeUWkx
         EZeHmKOcUTcvmmfCgHv0T6mpUCEwp9urxuq0ZW1ab5DA7xaaJ/sa/kSsX9yKg9RJEML9
         pHWwQJIO0gRjvGXHxFyKyI2BzN28oEPm6iUIyrTLjookkJSMQPz+2chLF9xyn+7RT5gi
         bbhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788509649; x=1789114449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=hp/XmOULl8hos6ueQMCEt77YRd351d0QwD4CL8Yy2gzsVvec+jhdaCNrh4Yca7MN/k
         YhB7tlNKiaM7GQ3zRXyHKeyjCaxZJ/cA0ZIRA0nm6AuTFPVL1ldlfas1DpOLHB/0kpd0
         Ob74Fx912i3fzzb/UVa0abPBSIp99phjuhVgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509649; x=1789114449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=l65QhaGgy/x/baxTdtMDNGJeZ69Qcqdbh+CUa6+fNclvcKcITfy3qBvUxIZM15fqe0
         v+LxbU2UXHfQtES9AVEheszWgkN4aSl6RUIpLGNUMEM/S80/ZbG3fUKgI+9RtQuMqk8U
         VevBQp/rFe0//ZAfwfgGHW3wG+AIXzgpHHIjbt/yk+ihV8bn4QF0FIFiVmnNnYAhkydj
         zcjfICv/0KzIddeHXQfsj72Tn4IulKonyrVrLvv1MzcbdOpEAp6W/6T0TBSkDv6d5Kfr
         ic29JE/4AYGhGX91zWBXDMV5QMgSQsabMDvU2KDOLDCvmsBShPaQNSfz7qW3/brvAvVz
         ttYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzDeIEjnRY75PVt/CyDe6wCY7re288uy3vdGsZe9XX8z1ACTnk5psrySpP92yAyzfElod4Uvznv2uI6sc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqhrcObbrKTAjhPGgoChjkdzX5H5CKhyYOCDYIHgjbJU4N5909
	dm3NDeDT5Uh1XuG8y/sWbXxVLy5o4GCkKL0jzMreTZlVM5cH+CRtjFVz8dGUsK9e67ajW37xTGW
	/XrHcpZeRhOsIPPGtVwPn08Ndkq2VVI0DUdBw2hvw
X-Gm-Gg: AYBFou1RaOrrvAlUnbLUzj0WYJScCkXCFdx1QS3la8NjYvzEp2Dz9Dmt/pAIu8KOruN
	VoD61RHAr8K8Z3G2KdL2SLnNEUH6mJx6yM3JklEjAYsP52fecq3HudrmTR5nnVXZO9jKD5jVYj5
	DFgLtL3U/hwp1Fst09KuXhFtJuwEwf1s8chiAalMET9FfQNzELWn2Ck2gXoFgMzTYyC0sVWSIEt
	/hfJK8ENvb81KCxhxQ50MjrSVlP6Qo9ZHfGGiKSyTYR2ihIYvKq8MnpuT2KpzIcIXXJT+0qd0fZ
	YegRfq4EzVPPsBVHxClEZ0gc+ixJkGKC8kRh/MQpIN+FjxjH+FzA/uwV+f/xzvqtEVvhcE9Vk+t
	WWFdDWDpD
X-Received: by 2002:a05:690e:168d:b0:667:770c:f88e with SMTP id
 956f58d0204a3-66fb5aeafe7mr1463610d50.45.1788509649151; Fri, 04 Sep 2026
 01:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
In-Reply-To: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Sep 2026 16:13:58 +0800
X-Gm-Features: AcwNN1XC4LXAm1BwVIM4UDg-tlD1lttg9AE64QKW3tHBF46eVGyIPLVMv5NqRcM
Message-ID: <CAGXv+5FEx=H9r5MGequDpH3i62FAWbXdwkk66eBj8+ziT1fhMA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 4:23=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >
> > Apologies for missing this, but the first DT patch depends on the clk D=
T
> > bindings patch for the clk ID macros. This is causing build errors in
> > linux-next right now.
> >
> > Not sure how we can fix this right now.
> >
> > Brian, would it be possible for you to split out that patch into a
> > separate immutable branch for Angelo to merge?
> >
> > Otherwise Angelo might need to drop the DT patches until the next cycle=
.
> >
> >
> Yeah, that's so bad.
> I'd be happy to be able to resolve this, but it's too late on my side.
>
> I should've checked the DT patches more carefully, my bad: I got a bit to=
o excited
> to finally see this PowerVR stuff working on MT8173 and going upstream.
>
> Sadly, I have to drop the devicetree patches :-(

This is a reminder to re-apply the device tree patches from this series.


ChenYu
