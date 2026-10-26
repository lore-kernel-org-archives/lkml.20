Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029578;
	b=LQRUyYQdBEbpj6MyOK8IF0adVMg95fBQjspHLMuAd3LE9HQs4ZJBFPZGd+tBGdgPuiJw
	 wACOZOfnJM9piAV8p76OqHRxR3oqG1YmFaFyVZZummOJrFzH5+q3peVotb5nFxU+WBflx
	 YYnnT04UypCQF3lJ25oDpH62tuwk88mQEjD4uUtYvHQpAK15NBjSnBePwHnoeDorbdTIp
	 JmvhMZSRF9sg9Y2GGfAmfW+9CT8IrMjqMmlBqcxkfCAHR59siwZhj1JDOYA218KawPwPI
	 TwB6U7s0KuZK2v93yYAA+fos59wpFR34KHJzFQkEHgB8ZxlViGZSl7s0SavJIxCADEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029578;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=YOKqf03TET6D6ggGQXJQiZY++9E38KQ0FmeVIc+5yrA=;
	b=Ffrg2Aesdh8Nj0ENsX4F/iOg8pAEfExOqTuTceTf3RbHRuc7cOy+PZE2uqbtm89wyMXq
	 sSS1D8Ihqn3Wa+IyQpRajzhWdA49pitLG4diQsY32LP5evoNy4lUmTSRrr0UuwGbVIJdJ
	 T+5bg1OufZ6C6x0kS+WXhjBX2nMWXKEI+fmGzW3LMJe5yFg4OCLqdQGZaMC73wAq4x8+O
	 Sf8VNxFZMuKdTOX90fBtNnSxnvFNL9tj/n3C1ivjqcGwktYEgULMYb3G1JDx5It8bGAEh
	 my6RaaqU5Yd3Iu673dXHfXgfJq2mUBb2qxbjDkjwnfZcDQpmqEiTpmjmcG86s2Dy9Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=cK02k0uF;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99670606A325;
	Mon, 26 Oct 2026 15:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99670606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=cK02k0uF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793029569; x=1793634369; i=markus.elfring@web.de;
	bh=YOKqf03TET6D6ggGQXJQiZY++9E38KQ0FmeVIc+5yrA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cK02k0uFCS7I1GwsZWuh0KSn1KFBVVhwZkquyEWr/mMLb5uJ92GJv1v3WDmEYaUo
	 SyrmEx7nOtmzGWEYSKxG9AG5GR4DWTxFCFgiUPspBkjxllWmJrCSd7zuSJBMcO6iE
	 uJhpHEcBxZwnoHl+2ogzvBcW7yK94UjY9bUvIRJlsCvLqTMgVcKyWDpWFcuncnTOB
	 NlkdjJ7IdRN/qOZ3OpGxWIH5dBBOmXIWhYzbj4m2gU8TCDN/kNsGW3weP6ZrWk5xw
	 2ZG8ZMIvDVzxdWlHj9suPG9jMfqvu7f7+XdcoVhjM/yeXbW945i41rOCkBkTlL7St
	 bqnl7dTBM4MbDZS0yA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvsln-1wSiBC39BH-016hzi; Mon, 26
 Oct 2026 16:46:09 +0100
Message-ID: <74064ad6-8a0c-45c6-bdfb-0b4eb21d0f3e@web.de>
Date: Mon, 26 Oct 2026 16:45:58 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dm1105: fix rc_dev leak on probe error paths
To: Chen Changcheng <chenchangcheng@kylinos.cn>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <6217c190-e8f1-4faa-b934-b1774501a3af@web.de>
 <20261026082718.89558-1-chenchangcheng@kylinos.cn>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261026082718.89558-1-chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jGwdeGzhTsH18EyIgR9t1xSuBh+AE/ln19Qr2JyMAqjfngjv2IW
 C0kOUfl2XNFyTJCCxYrSdNovjiYCXFrngI3dqnUddfKbEJus/H/SCKYLDwKaZw98vGvuFJG
 L2g69xW+m4LT4BKwbNP/g3Eq2AXI+EoGizaxGpMV/Uy56E86G+bBuAz7EIOXdSYs1lxrUMc
 GVRKx74RjROoNaxt3NU+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MhcMJ1Wwd+Y=;ahsAkeCIC9DH/wfyZ3/s2ofn3og
 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
 SSEiJF2EjV/k=

> dm1105_ir_init() registers an rc_dev that must be cleaned up by
> dm1105_ir_exit().  However, in dm1105_probe() the return value of
> dm1105_ir_init() is ignored, and neither the workqueue nor the
=E2=80=A6

I propose to refine the change description another bit.

Wording suggestion:
The return value of a dm1105_ir_init() call was ignored within dm1105_prob=
e().
The error detection and exception handling was incomplete.
Thus add a needed condition check.
Adjust a subsequent jump target for the completion of the desired error ha=
ndling.


=E2=80=A6
> ---
>  drivers/media/pci/dm1105/dm1105.c | 8 ++++++--
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.3#n310

Regards,
Markus
