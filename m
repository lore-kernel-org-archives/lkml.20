Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1B3DDB18
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367326; cv=none; b=DP1GKfvKQZGXE5wIalMfGp0+TRdS36PZEXrXwyNlKg/S6TuTrB0kN5VjKG3Wyi47wQx4a0S09e6eSXP2AOf56SvtFOYZ8bE4U1AZBGJUjPzO45vKpwRk8ixvtpUqP+kA/vhw/OtkUpfr1kThzSQLKj6H2W+CBRw7yfIDpsBmOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367326; c=relaxed/simple;
	bh=qQbNDtGIEBu1d7dXB51yp73gOkY2ynQCu3xKODdhecw=;
	h=Content-Type:From:Subject:Message-Id:To:Mime-Version:References:
	 Cc:Date:In-Reply-To:Content-Disposition; b=iaW81M/ErGV7JsZDo6p8R/Skc327XI7/EVXvhFJoI56wqTjlW7G0W9HNzbQTOwnxgRSc+aVtxuP1h5CJLjzq+NFdphCb55E50PYV8LyJxsV4yN8GFWoA+mY12YvXZcrqGJMDjI6x1HL094WnjnPIerWbbj9MAS4LJ2M9hY3TTJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=vtHhwFkD; arc=none smtp.client-ip=209.127.231.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="vtHhwFkD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1789367313; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sQMkuUXUspgukwSOb26Oq32mNEp/z9l0P4KjT+/v4T0=;
 b=vtHhwFkDXlFepJgpWBBnyZ7kW8fFQ4shf3ixMXKW6/OIpDidkh48B/ZjAJ65kCXd63DHcr
 IMydUSYGJmU9PQK+kMuOOCVeWiU0M+M4WOLacYTPiFdNgEUQEd3Yn3Jzhdj/0wBfRL3G+r
 hIp4f+D04MAORUCy4C+I9+Mf1zrPLBHj04uaKddZ68IIffqx7W8Tr8o7uJ4PSVuXoT1y4k
 2dyLm8eXTZrWd/lpL+t0P5hf2IyymnOaDlGUWr9Vx9UpifDEClDv/rJ6fJbN3wz0IVNDvC
 yyK2HVxhWycsQRaU8mKBkU/iBYFBpNMIgi31dviPwmBgxVNNCm6BvNx5x4ciYA==
X-Original-From: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
From: "Zhaoyu Liu" <liuzhaoyu.zackary@picoheart.com>
Subject: Re: [PATCH] iommu/sva: remove iommu_sva_present flag
Message-Id: <aqeUDObfmw+ZlFUj@hostpc>
X-Lms-Return-Path: <lba+26aa7940f+d8ceee+vger.kernel.org+liuzhaoyu.zackary@picoheart.com>
To: "Baolu Lu" <baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aoq8VGFL/Mdjd/M5@hostpc> <19132505-225a-45fb-a507-b916a718dccc@linux.intel.com>
Cc: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>, 
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Received: from hostpc ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Mon, 14 Sep 2026 14:28:30 +0800
Date: Mon, 14 Sep 2026 14:28:28 +0800
In-Reply-To: <19132505-225a-45fb-a507-b916a718dccc@linux.intel.com>
Content-Disposition: inline

Thank you, Baolu.

One more thing =E2=80=94 do you know why the maintainers haven't noticed / =
responded to this patch?
Jason, Baolu, are you able to contact them directly?

Thanks,
zackary

On Wed, Sep 02, 2026 at 09:37:00AM +0800, Baolu Lu wrote:
> On 8/23/2026 5:24 PM, Zhaoyu Liu wrote:
> > The global iommu_sva_present bool merely mirrors
> > !list_empty(&iommu_sva_mms) under the same mutex. Remove it and rely
> > on list_for_each_entry to handle the empty list case, which is a no-op.
> >=20
> > Signed-off-by: Zhaoyu Liu<liuzhaoyu.zackary@picoheart.com>
> > ---
> >   drivers/iommu/iommu-sva.c | 14 +++-----------
> >   1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
