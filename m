Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839625;
	b=2EupDttnp1XUVs5N72DznPFRyzK2SPcou20alfMKc+10c0Zh0eNxSG3Z/Kc+UMDGEqj2
	 rZ14gYCLWJUix9PecvqCc0buOyk1h6lWQRPmePdLWQUtCDzpbUqjvwK/WYeEqDtrclXNt
	 CM/OIB40HxuYM0nRo6XD3O1TqQQqgrREPNkPnWBGc/dneehW4j58WsPnjwDiEHhtpueQe
	 dr7F/kqLXt6H+P+OefNGOHPNH7NfmqfiSmysn6HAIbwco+bBR/ZaW2He0bOW01Ga7e7OC
	 Z2GgUSXJDAogRtZEG7GC3W81jrh1IB8sD6iY4Wm0dzfCvJjZ869BlFdOq9Tim9AcZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839625;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gK7mnV0K5J5AZlPsKO/qnVm94znB+xyRhSHaNfoCvBE=;
	b=N+BtD+sR5BNwPVc+iFYhLgJSBoi4xmqz1+7jMrjdn/rTM9fT9Cd+2GoITxV6xkEWvmBJ
	 w80QUkZgDyF2rTRweTLx+ZtfoAjRJDWVpJ4rKDRnNmPq4L6cULN2ryRCnG8CogqfGECDT
	 8n2a/PfI8VrpwSN5WMihzLaFPlwLDfsgl8CbEcpnR7/9dITDQW6WALv3JiJcCJq4S4U8s
	 kmgohUzNrVExQRUQCJ6r4/F0ngVBwLjZrBGLXxed3WGygg8PXreLw0fYU4uSQU35Oldnd
	 kST+I1EZj/R7gSIbbkoOspIkkCtyM93+DHMmTzuDy44VA0CYhQy61Y+0saZ+We3pmZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUQWunDC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB580606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUQWunDC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FD11F000C5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839625;
	bh=gK7mnV0K5J5AZlPsKO/qnVm94znB+xyRhSHaNfoCvBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oUQWunDCwyheDaHGiEVDZgcG4hWfvsWBs2QCkprHpw8MX67IaQUh2iYSe01vKYcAH
	 EiRQNzEtK5tKIf6j8E4MlHfl3jf8dNN03Hc5lbVcGvnw4Jda8WVhVo1oNXwJqApcpX
	 RpflSVlxikJEz+X+bPL3IK4vT/rAhmByDUcNfqz8ZRFSXPaUjxmkPJ1lrSk8VVXwtt
	 q1RnPDMxR7G+ThyE+k2pFnJPuXnU9O1vGElAalCLXPIyy4wsDXwd5ZEigUML0BDXjj
	 qVLD+Sy9Pt/E4BE2q/MsnLjD03qq2T1D99uUJcaNHKDE8I25RHxUEMZBZf0IZjafkf
	 Vdu56iSZ33gYQ==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so4239389eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHGEHe2Z9ykFymsazw9Pb/QaeMNB3005LKR36fG5RQ98hSB+2VPC/KnUR4BS/WEgLB/ulK/yS01tJD3dWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b07Hlk86RP5TXyyOuEQoeOoPtfjOqCETs0JcY1Fnj0gYi8MOB
	hEgSyzKGMncLtLeILATsWYRikVdsIW7TVow52peFnB/Ds6/dmCJqEy8OrEI0kE3hkp9F+W36G/b
	euaM1GZd/4yuZ+EkZX9QCIVNqE7FNV3A=
X-Received: by 2002:a05:6820:c2c2:10b0:71a:facc:5a37 with SMTP id
 006d021491bc7-71afacc602amr779012eaf.63.1794839624591; Mon, 16 Nov 2026
 06:33:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com> <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
In-Reply-To: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 15:33:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLnkP2MHE5MTggjqti2qxMvm=KCs+XeoNsrUtXbRSZfhFg@mail.gmail.com>
X-Gm-Features: Aa3M54rzZJA3A38fzb3Px9Gx86UMNQxM77NnKlrXCliGaLoeMKhrWBrxmYmn9Sg
Message-ID: <CAD++jLnkP2MHE5MTggjqti2qxMvm=KCs+XeoNsrUtXbRSZfhFg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:08=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add a driver for the GPIO banks of the Cortina Systems CS75xx SoCs. The
> data and direction registers are handled by gpio-mmio; each bank has its
> own interrupt with level and edge triggers, both edges are emulated by
> flipping the polarity.
>
> A pin only works as a GPIO when the pin mux in the global control block
> selects the GPIO function. That is not part of the GPIO controller and
> is left to the boot loader until there is a pin controller driver.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Looks good, use nice helpers and all.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
