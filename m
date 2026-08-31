Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110E3E5A2C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177527; cv=none; b=hx+2dqqkcVTTwRc70B9DbMSoQBMw4Pt//HXq44TmG6iUVNhiA8czyhSGUWS1t9Aq6M9Hlqvj914GHl0N5qlDVfV7wK4mfEFG+0/IALaTs2bAdpxR12vs+ipUb0zdfWzU8CB354siUe5HLnC1It45jihaSja44UjBorJmReqCfK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177527; c=relaxed/simple;
	bh=o00rj5LszR8vLDe4SUDv1MQb52VTK99j/PLw+02G1+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RDbsXzIleQ2bbS3pyVkOvp38umVQcjI0IKdhPOLD6S1Bs4ZPch9YSjyU0aBTNJXsRgUwxufstuIBBCc3h10hG737ZqBY40QZzhzVykf2L2RoI9dbHBKTDqvnUEH/JGki3Es7UpvtlsMtF6LiD0zsdhsdbMZ44l5wG7P4FxciHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=BHjc2uO+; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="BHjc2uO+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aNbCjFVIuJYNB8+haqmfInpJlaQvl8qC6NDl65ZkQyw=;
	b=BHjc2uO+C6lYOZPaXhd34wLAcGOm9vn6mA5Kq60tW021U0S2nmIAhenp50eWh6RYp8b6IpuvJ
	kqZAAt7dx6Lx+ReriWigIjmA9doIwpFm+5F8+koxw/XpvXuG0CtRTb5ZpDpnRtwn9Bs/JXkF0LI
	t7VPNXWMN44+jREmH1JvF1c=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hYS0F4SNkznTVd;
	Mon, 31 Aug 2026 19:47:25 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id DED7840563;
	Mon, 31 Aug 2026 19:58:39 +0800 (CST)
Received: from [10.174.186.187] (10.174.186.187) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 31 Aug 2026 19:58:39 +0800
Message-ID: <b5979755-6089-4e6e-844d-2e6f32f687a6@huawei.com>
Date: Mon, 31 Aug 2026 19:58:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] kho: Convert error handling to immediate return
 pattern
To: Mike Rapoport <rppt@kernel.org>
CC: Alexander Graf <graf@amazon.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>,
	<kexec@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <hewenliang4@huawei.com>
References: <00c96a62-f783-497c-a7ac-1de495e4af06@huawei.com>
 <20260824024448.550552-1-longwei27@huawei.com>
 <178817571946.3691424.3757525664520719609.b4-review@b4>
From: "longwei (I)" <longwei27@huawei.com>
In-Reply-To: <178817571946.3691424.3757525664520719609.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo200009.china.huawei.com (7.202.195.26)

Hi Mike Rapoport=EF=BC=8C

Thanks for the review.
To be honest, I haven't observed any actual failures in this path in our =
production environment.
This change was identified during our internal team code review=E2=80=94t=
he err |=3D func() pattern looked concerning to us at first glance, so we=
 attempted to clean it up.

However, I agree with your assessment: the caller doesn't care about the =
exact error value, libfdt uses its own error codes, and this is a cold pa=
th where failures are unlikely. The change is indeed unnecessary churn wi=
thout a concrete bug to fix.

I'll drop this patch. Please ignore this submission.

Thanks,
Long Wei

=E5=9C=A8 2026/8/31 19:28, Mike Rapoport =E5=86=99=E9=81=93:
> Hi,
>=20
>=20
>> Replace the chained error accumulation (err |=3D func()) with immediat=
e
>> per-step error checking and early return in kho_out_fdt_setup().
>>
>> Two problems with the current approach:
>> 1. It continues executing FDT operations even after a failure, which
>>    is pointless and potentially unsafe on an invalid FDT context.
>=20
> Did you actually see failures here or was it an LLM suggesting that the=
y
> may happen?
>=20
>> 2. Bitwise OR of multiple negative error codes produces a result that
>>    may not represent any actual error, making debugging misleading.
>>
>> Early return fails fast and preserves the original error code for
>> accurate diagnosis.
>=20
> The caller does not care about the exact error value, so the diagnosis
> statement is moot at best.
> Moreover, libfdt does not return Linux error values.
>=20

