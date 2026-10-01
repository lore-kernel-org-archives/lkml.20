Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1724E0B86;
	Thu,  1 Oct 2026 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850550; cv=none; b=J8UvhmmtFsWGklqGXSSz5EcQyiFLTAZJ6ORWj6XU5BiSBBfA5AWy3Xvtbz79IJBTVx0GiAE+zeAljLKY+lEBtIzf3KJWH8DrYJ17f/Zc5kwZrnSMM1Q+04l3MVeKS6tbXamM9Pn2Dpz05FHdNl+esaIDiKGnhLalrZMNn0UEd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850550; c=relaxed/simple;
	bh=73oSwkKCYqWzzExevAPff4fr/D8xpltdYO1PZSPHRqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwftDkXLC/le13XYXXHhXkUrQR9dBS9RNQSuHhpqQDVbEL/Bm6vB6rY+DI4KNRsB1UqPlwCHt0B6wwiXl+qvrG6SImOKg+8xo3fe+A7pslnraTZtkvXYGND06r7PSCs2uIvluRHthaDNns0iYP3BU2zv1p1ZkliGBo2wRm3ZaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50044 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCE2B-00000001mDp-120F;
	Thu, 01 Oct 2026 12:29:00 +0200
Message-ID: <8a9299bf-4b92-4df2-89e5-eb8363e361b8@norik.com>
Date: Thu, 1 Oct 2026 12:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
 <CAOMZO5Aibmm3d=9Ucro0Tqvyh_s3EozLM25axV3XxeLuG67PCg@mail.gmail.com>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <CAOMZO5Aibmm3d=9Ucro0Tqvyh_s3EozLM25axV3XxeLuG67PCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Fabio,

On 10/1/26 12:14, Fabio Estevam wrote:
> Hi Primoz,
> 
> On Thu, Oct 1, 2026 at 5:10 AM Primoz Fiser <primoz.fiser@norik.com> wrote:
>>
>> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:
> 
> Shouldn't they have a Fixes tag, then?

For patch #1 it think it is pointless because those properties didn't
exist until aforementioned commit 888e5fad9b78 ("Input: stmpe - add axis
inversion and swapping capability"). So it is an addition not a fix as
commit message suggests.

For patch #2 I could add:

Fixes: 800d595151bb ("ARM: dts: imx6: Add initial support for
phyBOARD-Mira")

in v3 if you want?

BR,
Primoz



-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

