Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02C35F5ED
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457489; cv=none; b=PXNvJQOnEUrVLtxOp3ftQkJJwkIOLDIYVKu5tHXeuK9v/K/vFcePxWw5tH3CvE5WHa61NNRUuBXhT+ulzsSitvWRwI59SpXVs16rB47RELVyA2PCXcUUo68aXSEs45TcTBaoQahZys8dutrjp12+WLNtv5Wg1CMP1BS0/33Kx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457489; c=relaxed/simple;
	bh=qlm/bJfgtFajTheKRRCZuiPqJh7TW3GFCgC3RxG5nNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X16Vur4i/ZBXnXhCUWgVXREFvp6ma5Kir/QnK2Rt3CykB3AwhF1magiX90pbcLOJ93Dzz4Z1YKkGEwNVIpWNtJa/YehyNHUV4hW5xknWeVbXaV9/MWUwBINLUmZ+VMOLOR59DRcguNroraLu6y4xNF/NIb3Pnna0KT3pYb1hlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=oPx3MVST; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="oPx3MVST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789457481; x=1790062281; i=deller@gmx.de;
	bh=+nYDTbBQtZ7P6uv/cfTcoAmGjs5PDew0vdAVMymWX24=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oPx3MVST1TxxSbKGHplHPIG2Dlr2C78Ruoor8PNAUQXVyam7cptUB80xgPBE86Yn
	 fjiuVv7JnFv6Gk9XEZnbsQsV+kFkmX74vCtbj2LnBTkKAyVonxFnVKsteqAf/pLfe
	 mo+h9731hz9wtErpIv4qqMbxRdEbPWOqFaGna5cKgE+Ae/QDg400qzKz1gUux2Bsy
	 jU5/5tpnMmOENbj9Ah8h9SgNljIi5jxKPmjVMBh+y3kGDYW1foOjgAoAfpxjsUBJ4
	 U7MUVD7QDFLx1Q0nOxn22sk+SyD8QVrbf3MbhPDj7DPDWV2LoTM5ks5er+kaoMpJa
	 nIqlnKBO1Mi4zdzWmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1wgIHL26K2-00tpNI; Tue, 15
 Sep 2026 09:31:21 +0200
Message-ID: <4da6291f-45ab-4651-a824-b5efb945e8f3@gmx.de>
Date: Tue, 15 Sep 2026 09:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: unwind: Replace open-coded binary search with
 bsearch()
To: Sean Young <sean@mess.org>, parisc-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260913141228.176399-1-sean@mess.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260913141228.176399-1-sean@mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1he30Svj42dYbJxR1FplXelzdbRf9uPuXkbFA2s5TznjM9JlEen
 ot7OutooXGx6TUFjakmiBNUGqHvP6tGSEsBGT/jB3jR7iY+ESeTALynf9U4o8No+otRf0fQ
 RrCXpfEK7OMO8tS1zp4O1xr6sVPrUeV1m/vBifr0jt7J2Z8oe/Ks6pEXtXGCB8eN3nKadzo
 zCL1KbSVJoxDRxevOUZ1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Iu7fTaQLj3o=;seH/vTF6p6qZ8+AbaWfxY3XJKf9
 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
 zmRcHB980toXKmqZPfJtRl1cdtdPpjs

On 9/13/26 16:12, Sean Young wrote:
> There is a bug in the binary search where hi can underflow. If
> addr is less than the first entry, then "hi =3D mid - 1" will underflow
> to ULONG_MAX. Then we have an out-of-bounds read.
>=20
> Replace the open-coded binary search with bsearch().
>=20
> Issue found by an LLM.
>=20
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>   arch/parisc/kernel/unwind.c | 33 +++++++++++++++------------------
>   1 file changed, 15 insertions(+), 18 deletions(-)
Applied.

Thanks!
Helge
