Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218780;
	b=RvcHv2cvH5+/DPgNnSLl70cadDuTkuKtQdCI9eH9ifK4AC0CJmUgpne9n4RAXSdphvci
	 suUcqXYRsTXj+veQfWKsV7exsraFgSR/MWL+qPxekSnaK0EaUwPDiQ79zsjNNXE5uMNcg
	 wNmJmPsGhQaIw4U08DfAOSXQWdABeXCQ+QV4COD1cZ5id/CnzKmBQ6LlrC/+D71Xr8bOF
	 1ltWpDL9t/sC0jfgr2v3LUnUKVqs2cw8nBaZPs6TwjRxHJr4VOOGvzBMIPzjXGBR+/mTk
	 FRIsim+uDGkfmh4MK9GjrJHTJnNpbHyYEV63J0SHhYqtEIuVErEL+Ak6J9pUYauQ+AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218780;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fqL3XZWn3lvBGMeKYBjMwhAK+S83Rh/mZ3ulvhUUoZc=;
	b=pxpMNv///+iWN+aP8y8npJuQ5m8OouNCicMTepMkD6sZ5dvB0EZHnNEVI5vg4r6CMlHj
	 Qu4sjhT0MDm/m0DFQ5/12EjTdWVewSMqnFJkYIQBU2ptg601FPIppgNRtoRSGq6SQSXdb
	 /jPXdj7Jt0CKI3teX6m7lpltIZu0wx5wb4faJwMP0Q5tg0ikE6Hz8mBmptkXryiCY/kqY
	 R1b5d5O2+KolYbZ2J+5bwp9QEYbu4VDKMyfkZr6pquLReBarryKsoGl53r9FbXWjX3160
	 8qeOF12jAioOY6EeTG7KzxMhzkghxMKCUyM4DQ6RgqaFYkrG5wKmq09HPK2JEpnIUVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeR+6g3S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63693606A31C;
	Mon,  9 Nov 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeR+6g3S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CA01F008A1;
	Mon,  9 Nov 2026 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218780;
	bh=fqL3XZWn3lvBGMeKYBjMwhAK+S83Rh/mZ3ulvhUUoZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QeR+6g3S0TV9qVSPqEdHHEmTHAVELzEzqqppre92gYckO+0IXIujO+9E+X6ZyIgx1
	 RbakYZcJ6MVG3Fw/cD3NzTzJQLXNsfGaemAsGuLB5+5r30MWSIVT2iQZ5D7IEFNJ1H
	 8TDDrnyHhk43amxbIFAbzlYacU5FZM5NN/amwszqTuCpnVKYZ8AEUBHzkospHV5jLr
	 dX0iJ6MxddjbQeKkgCiQhMIB0L6fD+S82etBLyzf7orgvMK3LKOVim6HhlBuG70Yt+
	 VtHCXi5uSS04FDkMGTnBMJ6yEzxGZoNFKMQ8HDboWvOkMTX287oTOBmeivwo18tPhD
	 ZS8PempQb2NAQ==
Message-ID: <87cfa24d-7855-47d1-89d4-463d8a47cc17@kernel.org>
Date: Mon, 9 Nov 2026 11:06:12 +0100
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
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
 <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
 <20261013-musical-brown-mamba-ff87a8@quoll> <87v774j0z8.fsf@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <87v774j0z8.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2026 07:38, Steffen Trumtrar wrote:
> 
> Hi,
> 
> On 2026-10-13 at 09:31 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
>>> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
>>> similar, apart from the Display and touch controller.
>>>
>>> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
>>> variants to use overlays applied on this base version.
>>>
>>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>>> ---
>>>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
>>>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
>>>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
>>>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
>>>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
>>>  5 files changed, 91 insertions(+), 99 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>>> index 475e1ad9116e1..7c1b61249778e 100644
>>> --- a/arch/arm64/boot/dts/freescale/Makefile
>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>>> @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
>>> +
>>> +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
>>> +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
>>> +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
>>> +	imx8mp-skov-revc-tian-g07017.dtbo
>>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
>>> diff --git
>>> a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
>>> b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
>>> new file mode 100644
>>> index 0000000000000..33ddd08a7adb5
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
>>
>> I do not understand this. This is a board, so not an overlay.
> 
> yes, that's what I did up until v4. New board with new dts.
> 
> - Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de
> 
> The boards are all very similar apart from the touch panel, but they are all "real" boards and don't share a SOM, so dtsi is also not correct.
> 

Then it is not an overlay.

Please wrap your email replies to standard mailing list style.

Best regards,
Krzysztof
