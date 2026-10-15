Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348A35218A9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073483; cv=none; b=YzlEzMPPDo5BkQ/DwN9+L/1EiWCMcz8PxmN1Idvc8Lnf1DNC1g4Zkz9Ltfg4QZQVv2xsKSX7LJc71PMowsAypJ++0WKeWPYe7d7/pQVWdHtJihg2NsV442725XfLwjcCiULzUiNBOAl/mYecBAKTRSykY5PSHR91p6vGt6iECYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073483; c=relaxed/simple;
	bh=M7zUxXkG9kiUBcxSGb9IU1PEYhMVsKfXF8Ctk4NjpQI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=s1ViOK3lb3qeEutmy7r6YCSvM9GtInSwjBKg8Pz3+JoiYmo4vHXKB94kXdqqhb6Ifi3deqyuaiLdPh+1ENgaMz+rEqmTGbE3a/WoQw85bfZbIXjZOGYrKkMEQHVPhTBPoecvbNteZsxmN9uL42nFfJoXCy4+7oMUvuobaSUErtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iAdFUwBx; arc=none smtp.client-ip=95.215.58.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iAdFUwBx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M7zUxXkG9kiUBcxSGb9IU1PEYhMVsKfXF8Ctk4NjpQI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792073480; v=1; x=1792678280;
 b=iAdFUwBxjeLPK2WkTGdiUmwz5BtQJs8yXijV+pnb6NMcyDryQ2NVH+/GIhHF5cfcWxIVZkTW
 MbREdIkeeKQiQIyxND8GWIU7UcS8ulnNyO2n6XETLlymp0G8ISxVzQdl4B2UL6eir4BHysULomg
 fmXyNMrQ/ZleJ4HuCG+W4f74=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4891979b9d5aaca1;
	Thu, 15 Oct 2026 14:11:20 +0000
X-Mizu-Trace-ID: 4891979b9d5aaca1
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 14:11:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
To: pavankumaryalagada@gmail.com, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
Cc: error27@gmail.com, ethantidmore06@gmail.com, dennylin0707@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, "Yalagada
 Pavan Kumar" <pavankumaryalagada@gmail.com>
In-Reply-To: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>

October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:


>=20
>=20From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>=20
>=20Remove redundant parentheses around the address-of operator to
> follow kernel coding style.
>=20
>=20Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---

Hi Yalagada,

I'm just letting you know that this change is no longer needed as the
entire staging/rtl8723bs driver is being deprecated and removed.
Support for RTL8723BS has been ported to rtw88 subsystem.

Best regards,
Luka Gejak
