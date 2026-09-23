Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72D4756C1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157088; cv=none; b=fes+h5c8xigR0eHh1LKpIoDUy4+U+tomiwQj4ZqhB/vd7JH6iQhNHNOBAU9rFnBHZWgscVW7gEG1ZIQf0R7xjKmwj+9HsUmy0qTl6XouElK4KroLIVZ2RHOH3Lcv60oal8jUUyaWtZR18thPISpTI2dDKKTvSylUSbeYyKHSVEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157088; c=relaxed/simple;
	bh=UuWqsWA9strdMyWMxsoB9b/nhWJSlI8PVXRAHFyk1to=;
	h=To:References:In-Reply-To:Mime-Version:Content-Type:Date:
	 Message-Id:Cc:Subject:From; b=nwciDK97OYBhqNFOfZcx7ikH6LcTChwtgEvsxuK1Gj4q0PF5RzfSrSZLeP4oZYGFUJ8+V/K3GDcZ4Hj+Oxd6XbWfX/eDe7JGdDyfd5ayPPabvs4UtcfIcGhRKgcAWcSRI+foTIdzo+6uH1SlwPNG3Rw3Ac2ph1FOWxf79N1Ltjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=WnxS+DCF; arc=none smtp.client-ip=209.127.231.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="WnxS+DCF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790157074;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UuWqsWA9strdMyWMxsoB9b/nhWJSlI8PVXRAHFyk1to=;
 b=WnxS+DCFCfrWFGqGc6/fJguG9Mj2C+tQEIBB1e1GmDFs3W9wyGSDBGeOhHaoNUY5i5amYL
 O8LJpQyqT1hYHrgqZ9Izp2B1LQTzk6YkRyBCI5R51RvVvS/YpAX7HxBiV8bVFRlxC+UWOP
 U+/jokkmse36ePfKibmeAM5rv28ak81MMh1oF2fDc4kjBgjPd0KtxfTVFJbNVv8rPExPUo
 B7Gig1g2fg6kKB1t4i1ZL6Wa47enOpZilFr6Ps6blX+Dk812NrKJI4QFDH+96Gp0hmPVSC
 N9vMeSu2n8uGbH8ZHJ92Gu+d5T8A0niFJ+sO5RbjmUcdlORbnAXjDJHr6O+87g==
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110450.3426070-1-sandie.cao@deepcomputing.io> <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
	<DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
In-Reply-To: <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
X-Lms-Return-Path: <lba+16ab3a10e+98bdf8+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 17:51:09 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.a37d568d.f88e.4fdb.8c5f.8da4b148415f@feishu.cn>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Wed, Sep 23, 2026, 17:14
> On Wed Sep 23, 2026 at 4:01 PM +08, Sandie Cao wrote:
> > Hi, Troy:
> >
> >> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> >> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
> >> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
> >> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
> >> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
> >> > driver.
> >>=C2=A0
> >> An internal slot does not necessarily mean the card is non-removable.
> >> I don't think its location alone justifies keeping card detect asserte=
d:
> >> GPIO88 would report a card present even when the slot is empty.
> >
> > Yes. The FML13V05 hardware is designed for this. We can't change it.=C2=
=A0
>=C2=A0
> I may not have been clear: an internal card slot does not necessarily
> mean the card is non-removable. If GPIO88 is connected to the
> card-detect switch, it still needs a pull-up. Is GPIO88 tied low on
> the board, or does it reflect the state of that switch?

The FML13V05 SD card slot doesn't have cd-gpio. But the K3 SD card driver n=
eed it, so the GPIO88 is tied low on board.=C2=A0
=C2=A0
>=C2=A0
> >
> >>=C2=A0
> >> > We check the vmmc-supply is p3v3. We have the same SDK DTS config wi=
th
> >> > k3_com260[1] , so, this patch follows the SD card patch of k3_com260
> >> > dts[2].
> >> >
> >> > If this is not correct, we will change it.
> >>=C2=A0
> >> Could you confirm from the schematics that the SD power wiring matches
> >> CoM260 and that the card's VDD is actually connected to ALDO4? If so,
> >> this supply reference is fine. The same SDK configuration alone does
> >> not establish the wiring.
> >>=C2=A0
> >> If the card instead uses a fixed, always-on supply with no software po=
wer
> >> control, vmmc-supply is optional for the MMC core; it should not point=
 to
> >> an unrelated ALDO4 rail.
> >
> > We check the schematics both of COM260 and FML13V05, both use p3v3 (a f=
ixed, always-on supply with no software power control), not ALDO4. ALD04 is=
 only for USB.
> > We will correct it in next patch.
> I'll send a separate patch to fix the CoM260 vmmc-supply reference.
> You can focus on FML13V05 in this series.

Got it. Thanks

Best regards
Sandie

