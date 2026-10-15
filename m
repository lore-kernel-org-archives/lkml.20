Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAC41E9B3D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034291; cv=none; b=WwsCgUnUGg/zODUWYNhEOpL2GsWAFZYc+7Ap5OtpjvYD4/V9bBtjB1Z0oibMPvRE2CRU1HqioOMROUICQWEjk40uzdscOSwvizuUzY/uyrI0GvXC0fV5gYF+uS+m+C/Bb3VOxKHrfgW8oS2ZPDnzitohAqAJ2d/MYXMcymg/Ic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034291; c=relaxed/simple;
	bh=hB2ZNX/rJnn2nJuoPEcoB4KqJRjKtOsgXsv5npDuaDo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=WwPM0AloVGRDzZULX14y5n5RLsdiO9o7MgEl77wQtkycWSZFsVTiqN0tm3hbmL34ChuXYNdxVqZsAo+NdAEv9mQWo28vPphUOFD5V6Nhp+H81OIZoRKXOC6629Y2jDKFNc/5bSyQ45cewzouWQffjoAmFBnskhsS0pcntZJFIlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hl1yOi4i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hl1yOi4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC7D1F000C4;
	Thu, 15 Oct 2026 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034290;
	bh=hB2ZNX/rJnn2nJuoPEcoB4KqJRjKtOsgXsv5npDuaDo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Hl1yOi4iXNyVGUOCP1I7Pv+Lr/Dh3sB048yXX0PtvipwnMCN19KCZ+PdCvYDpJX6K
	 bRvzRluy03QFcNC5CqlH4yKyu5xA1OH1n/xWQtGBXIj9kclZlAiZtj3+WZ8iOSsp3K
	 wKLuhlpjO28ySpAs2XLoLl0NJ3PXgigkPbsgDoG00EZY0xBJ/ZseGzQWnWZaKA8Jrn
	 Vb1VhpW2BdatIsM/FDvZGGmC/1cxIWMsCjJWk6MD9bJRqVLQMWyntJ3VqjT+IW6JUh
	 ywtHUx+sQ+Om18BjmmI/Bbeaco7TJsuM6JwxIYY+nZC2NZpFtZIXm0uhv7SX6SuOnR
	 xCl8MhdZRpckQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261008-spmi-add-abel-maintainer-v1-1-bd1618a5d977@oss.qualcomm.com>
References: <20261008-spmi-add-abel-maintainer-v1-1-bd1618a5d977@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: Add Abel as SPMI co-maintainer
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 20:06:13 -0700
Message-ID: <179203357349.5720.59181446607801022@localhost.localdomain>
User-Agent: alot/0.12

Quoting Abel Vesa (2026-10-08 13:57:45)
> Add myself as a co-maintainer for the SPMI subsystem to help with
> patch review and handling.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Applied to spmi-next. Thanks!
