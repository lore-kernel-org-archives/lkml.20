Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325867;
	b=DyPW8lBxfPqRDcd7vy5FcKRwblz4fiEBLVzf4i2FO6PWn8eiYNKlBxsBceHlKPIK/5XI
	 dzR1yqqGDyHM0ds7uQqO7z0Sk0KPa8lgpt8BJaXcuDOXhU364IYorzNem4NkKcVtKoX+U
	 EJYEhZWxvCJdZhtj4jFd1HTuknJFNtwnS6GNAeKpVXJ3GuGjGhZgLMWLIOBhB9aGr2prP
	 A60d6TwfljLWLHP8cRsaDyqZYDB9SHdjJle7kKsoDdqmCUDth6igM1k9682o70/uumET8
	 A4UZ/xKuYLPt3qNUMMGJxg82duOnnx1PKNgGNF3RrQXbp3GAfIDpydXM2r+51586AQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325867;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=pumged/0aPi5xqnB+RarXs8Eh9+4eMDOVCGQ7bmfyDY=;
	b=J9ob5uJSRuGkCLIGwmhpzu1F+i5+XTFeXcxl7npbWSD7GB5VTfqVXDApHTwk+cNTOdpG
	 Z/1c7L1wgzs0IiLIHX8EBl0L/SLDX6/bYRb+fYBzXeRQn14SPw1K/KqAE/RVwqW3tpfbf
	 +3SBiEXa4im8kBZxwJvefYGpEb45cWA5Tt9vQW+U7topxddWtWd1RjmS3tl5d5Z9jq4ij
	 eLcuNt8OnYQwNHQWZme5wTYw+VD/upjNlNpHTQb+61/CkDi6VDdyFIvWgS28V+0ph5b3k
	 If85MADCKTNBuMEo5pEFqSHDCMu3CLf0W1DAczGzk+ekw/B3BVb5bCSlcEK7T1W4KSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pST1Bafh;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B4606A31A;
	Fri, 30 Oct 2026 02:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pST1Bafh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793325834;
	bh=pumged/0aPi5xqnB+RarXs8Eh9+4eMDOVCGQ7bmfyDY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pST1Bafh9YDZnRMH21BHCclv5V5LLeCK6ZGjg1da1GUVhXhgHyoBYRfABI/cSEHmf
	 zSm5d+DY2loPXq7ucezKX3N7gr81xHUMKmJ58kjGY8IaWxx6S5HJSDuO68Pls2ZNIl
	 WMxRR1SBnVewM/sRYSyCNWSZBiHI0Ve7bL+gTmnA=
X-QQ-mid: zesmtpgz5t1793325832tbc76324c
X-QQ-Originating-IP: 1BbxyIvlF3AOamn5bZyHYBEFlVP5ZviaER6ZNnc482Y=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Oct 2026 10:03:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9133408313636271411
EX-QQ-RecipientCnt: 16
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 30 Oct 2026 10:03:47 +0800
Message-Id: <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "E Shattow" <e@freeshell.de>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <docular.xu@gmail.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261029162343.1896134-1-e@freeshell.de>
In-Reply-To: <20261029162343.1896134-1-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MRoXHVs8e1kF+8olKmi2bjyN+Iu7GOtZU0RQJmb2PbZGb6ZSNwGZaSrV
	jDGkx8jeXuJrF5Q0nT/DQjrXcIYy7Lb7/AolC0OFYBA+gIQOyaHYK3qCCUID9YbHElpAhrU
	yg56NlakCROQc1grP1XbNg7XWGmyMRK/X56Z9Ks8Dri9I+AlDaaTzVNSdkym025w+rjo0qg
	Sp5sg4I1Ne4PHuOeTaSHkpSv/+gRa6Ejm+5d1rlpFqUT3LeB6d+dtYwgjYQzNdrrpHQSdFs
	iVA/dIhB+aJZ4itgP9WOcnHfLDtL63lI2+Xqllsez3MlgwWIc2FDT7/pA12ziKD+SFZeYcl
	NncS3QRm+qi1W1g5ImO6uHCegqd58pT7bUtsOkhINSWEG36hRS82oWzusx/3fiPEu68Pv3R
	LgugnXvvl215eiBHvbgKgqY8dQAMC0NOX6qFIwyeK2Wjy+O1rilb4Hx9z3b5G8KRXF8VeO9
	WQbE4SaNiRY/WjNsN7UpUlTrFDZGkUpX8zE/+2cVe4Jit+HRnnZTVP5kPjVEY+aQvWhSQCp
	kErdeBNcrSkD7yz4XBbe2tel/6ngm/O67Vw6hCOKQ3a/vZBOa4TtZDl/qqDyfL8bNEyOBv2
	y6kv5mL+RULYuug5fez8TaOoxS/RX9WgdKtJlOFDyLqVUH6E44HnIcls+p9TkMDrYw3N6Yb
	xrFuxLGsZxBbRy6TtxstPuWSIJblyc4eOcQqw/ofNWe2+8S08cI2guT/7ukePDLa3ncQWq+
	pcX7Y7HbRnuXBvwt4s3ed87QcYRQNn0T5KbrgZhGMbECWHokpLKxqJir4wd9/Ws5cR6O4qI
	ZdWUIyF0HTZelN9WDA8V7+GhzoWq8Q++JNd7WlwlFrnp77uQvIow5pV3/iES8U7n8tCNaMb
	4QpO9DDAji0ecYZgsBo2FT2mi+AWPT5szPReBtZrIivhbNXT6ACjz0ugtvQdzi7WTZHxn4+
	76mKdtV+ZbJMr5e6m/HnimNDvllp6Z2hGbWpxa1OUo/z7uV5aBfN2ct9zhKlLPKhVS14XtE
	7zkwv4l1crAhtWEaNcXTZ+vTbFGd/dLEMf5i+9tQKy7a1lxVb5ZEtZDKym2XXAMexzQSFXD
	vVk30RYxdYCmuD1/v06DGwCXq70qKAk8clfjjGivBlu5ScKa0pUELY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi E,

On Thu Oct 29, 2026 at 9:23 AM -0700, E Shattow wrote:
> Change the "reserved" status of mimsic and maplic to "okay". There is
> an mainline OpenSBI user of this and setting status okay resolves the
> stall of Linux when probing peripherals at boot.

Thanks for bringing this here. I still think status =3D "reserved" in
k3.dtsi is the right description.

(To clarify the Acked-by I gave on the U-Boot thread: it was for
carrying the override in spacemit-k3-u-boot.dtsi, not for changing
the kernel DT)

> @@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
>  			msi-controller;
>  			riscv,hart-index-bits =3D <4>;
>  			riscv,num-ids =3D <511>;
> -			status =3D "reserved";
> +			status =3D "okay";
>  		};
> =20
>  		maplic: interrupt-controller@f1800000 {
> @@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,children =3D <&saplic>;
>  			riscv,delegation =3D <&saplic 1 512>;
>  			riscv,num-sources =3D <512>;
> -			status =3D "reserved";
> +			status =3D "okay";
>  		};
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 So=
C")
I don't think this is a bug in the kernel DT either.

This was also discussed when k3.dtsi was reviewed [1]. The DTB built
from the kernel tree is often loaded directly by the bootloader (e.g.
from /boot) instead of the FDT that OpenSBI has already fixed up. With
"okay" there, Linux would probe the M-level IMSIC/APLIC and take an
access fault. The compromise back then was to keep them out of the
kernel's view in k3.dtsi ("disabled" at first, "reserved" since v5)
and enable them for the firmware build in -u-boot.dtsi, which is
exactly what your U-Boot patch does.

(Also replacing Guodong's address with his current one in Cc.)

[1] https://lore.kernel.org/all/77f9a001-7f0a-4c29-abcb-501e875da117@sifive=
.com/

--=20
Troy Mitchell

--d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauP7AxAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQv7O4A/0OMejfxLYWKCiyBxXllnt6RD3VnWHq2NL5z
/dd3+uI/AP990NcnV/KPEsOBMIQFQt2/RvfPFEHzG8uLFdZpTMS7CQ==
=6CKn
-----END PGP SIGNATURE-----

--d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663--
