Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924057;
	b=CcnlTOfVVgXpp6uFiQJPod/s33uKNFos7Je6eqlbgv4I5hZXKYOHL++Z/1gxEYf8HGeL
	 m17t56iqChHq3lUeEFG5348luhmJSTZmw4wOqnVM2aTb/njhSDUBfD9YzYrIpgM9WB4NF
	 t/NdqI0s18MILXzG6exFy10nCEa2Ca5ar9Q7BPkbcvScPRP0PUw3IpRK1YKOK5mj4G514
	 hF4fGO4U0r9/F+H8xVid8YyF3Y3bkCjiuEmssjxWrAaqH0TvMzwVch3co7gAF9k8JUCUn
	 rh89cwOgul2+zO/RegHtmN/vEajlPfDeMyr07DrQctskGqBz9BuzeTETs5MxAjlBU4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924057;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	b=UBUOK56ywcPU5x4uJyLdcOkcIpDdz9GnlnKLPEQRUtcfLRKFUUXh1PV33/DgBVep9aXw
	 Y2EPMetQpaCtLX1Pq/PRfSLgkgqQlL+LlKuOueFEPh99PyxbvbN3E+dW9ieNZ40xMjQFm
	 Js9P7pH494Y/RVUI62L8938X2TmJ/DQjCjiLdwhAeGKgMrPet30+N+cStClDnzWybh8I5
	 hay0Sg8Dmh7rMszsL0e7xreNsRK1wUPuZbO1zWBgwlK8ggiT91YeyCMkWGwAebdri8Jei
	 +x9gu7BHB1N2sYrcXJvvZQCt8GUOIt5Mack7k84VPAwUW5t/eR4WYk3zrjpi3/v98kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928C606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0652B1F000CE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924057;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N0OEanukXS6Mm9KTxE7SL8DxyX/MI0H/vbjirpu+EOJm3uRyP10i10RM03japU4sd
	 S8em5UDMgAqF3ZDHfpH1WJ+unNr8U4+QaoqU631+jFWK54v1LM1ZMXeiV+3S0oqAYd
	 LCaR3EuXIefsHGzJVwgsxWlbY+u1B7zw4tZqe1Jyy984WmpJFaHWCIuqiA7guWxW+d
	 U3r6OkBn2mbKRSCZZP28Fv37+ALd7EE9Pb39iIg1ccXfX13iaNM4AXULnC2Dfg9p4y
	 E0Cfbhsu4NWDndPrdhr8EVT4aGUZaYTddUw3lAhPYPz0hBANOFSMBh2906frfV5dpm
	 AYnohD2AseUuA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14f7768acso3800432e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:00:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE+CRggfdtrHRoenvCQ4gVXd3FJ2USQ6mcb75wIt5i+JHZNRWmZ5v7aSktD+qvsH+rwu76y8OZAFmh/4ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sdJ8R+k07j8njwPMEy3wixOIxGKUOdXNX1tkWjK/9JBsVBFGz
	tWhCNjEUGlbSvGaMo8F4vT91Z5PysMi/a62n5rHjJmZbOLW7DUJnXqWGerLEFeQKTrZMD5xWPcv
	fJp5mQljFIwc5AnfPgCkuuRjOjyRtyb0=
X-Received: by 2002:a05:6512:3a96:b0:5c1:4e4c:359c with SMTP id
 2adb3069b0e04-5c1709c44cemr4959950e87.36.1794924055639; Tue, 17 Nov 2026
 06:00:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com> <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
X-Gm-Features: Aa3M54pM4N8FrMarps7ie1VxRtJp-XfzSOJDJp1i6ICkP2NWqZ4utwFMO5THjsE
Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 4:57=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Changes in v2:
> - Add Fixes trailer.
> - Add Reviewed-by trailer from Andrew Jeffery.

Patch applied as nonurgent fix.

Yours,
Linus Walleij
