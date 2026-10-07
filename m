Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C27243FD0B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361503; cv=none; b=G1YPd/5LwN1HaHkzGCo2oqvbvNYopyjlCLSfh/UibIzPhavuLQw9apmC5JNPcBTwYfD6FIPNwCQYv0aPFENO2XDfmCX9HHcbPDwYzLj40vTbL52oab4LWSxIKCi1gl0gX/+d0nR33aTcQ8HQfooScBvMf51CpibZ4OQ5/jnZupE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361503; c=relaxed/simple;
	bh=3Rd/a5nXdmgzi0cgbrX6gvWKTXtTz3BGHEkq0QQ5b9o=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=pwV7BOLYEiaN9Yw8+q1l3VEuMFHZBoFKxrGhLOQEjChQ9HcBnOlooHA34qXvVPN8FdXK1aiHJDZcTtLIgAZBT1Vsz/hq47c7W1l+pkDwHOvxkrRysI4TYX0BZsu8PyU/JqfHoA7neU1X1exU1srpZW3PJBzvr/HM+OdnCUF5D38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b+slKYAm; arc=none smtp.client-ip=95.215.58.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b+slKYAm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3Rd/a5nXdmgzi0cgbrX6gvWKTXtTz3BGHEkq0QQ5b9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791361498; v=1; x=1791966298;
 b=b+slKYAmu7m2YY4zRHyKiQ9crISQ76QGKMBSQpBNvadoWrWVRhvtvNA/YuZNE2yOsRZj58pP
 z8dImyycBvpigO0f5iN4UCfhWv1EP6STG76klpMzGAb1CChsuqb7iMOZsKLDm3JRXSdYLxfJdZN
 YIpUkFgUNVE43b9yCFzf8cSs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4a9baa7efef0d618;
	Wed, 07 Oct 2026 08:24:58 +0000
X-Mizu-Trace-ID: 4a9baa7efef0d618
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 08:24:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <df4a73de51784e35c15a39e85e4dae9629ba1132@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v8 5/7] wifi: rtw88: 8723b: add the RTL8723B
 chip driver
To: "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael 
 Straube" <straube.linux@gmail.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, "Bitterblue Smith" <rtl8821cerfe2@gmail.com>,
 luka.gejak@linux.dev
In-Reply-To: <3db085e6c3c14545ac9fd4221e0715ed@realtek.com>
References: <20261006130701.120460-1-luka.gejak@linux.dev>
 <20261006130701.120460-6-luka.gejak@linux.dev>
 <3db085e6c3c14545ac9fd4221e0715ed@realtek.com>

October 7, 2026 at 04:57, "Ping-Ke Shih" <pkshih@realtek.com mailto:pkshi=
h@realtek.com?to=3D%22Ping-Ke%20Shih%22%20%3Cpkshih%40realtek.com%3E > wr=
ote:


>=20
>=20Luka Gejak <luka.gejak@linux.dev> wrote:
>=20
>=20>=20
>=20> Add the Realtek RTL8723B 802.11n chip driver: the chip operations, =
the
> >  power sequences, the efuse layout, the RF and IQ calibration, and th=
e
> >  chip specific coexistence handling.
> >=20=20
>=20>  The RTL8723B chip support is based on the initial work by
> >  Michael Straube <straube.linux@gmail.com>.
> >  Link: https://github.com/mistraube/rtw88/tree/rtl8723bs
> >=20=20
>=20>  Co-developed-by: Michael Straube <straube.linux@gmail.com>
> >  Signed-off-by: Michael Straube <straube.linux@gmail.com>
> >  Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> >  Reviewed-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
> >=20
>=20Acked-by: Ping-Ke Shih <pkshih@realtek.com>
>

Hi Ping-Ke,

Thanks for helping and reviewing the series throughout this
upstreaming process. Just one question, when is the series planned to
be applied to rtw-next? I am planning to send a patch to staging to
remove staging rtl8723bs and I need to have information when is it
landing.

Best regards,
Luka Gejak
