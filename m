Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793133400;
	b=MJcbIJPAAVB0Yf/YwNMV4eN0bYIm1yU90QAeekzbykdaNu0dpQPrcPcFZ+Q1Bbm+vnu1
	 SOGAVAeZ9GvYU0v2wRol7v1N45pXqqtaKe6kKxU6aY11Q2Xq4Im/OJwZdfz9nUhyWnDzQ
	 SYlFEy2kZkY0csp6qA691Q2Kj15sZlYYGiW34tcHLTGQ3D5J4xf2nglZIGMNxDL04RYM/
	 a9kNdfOD3QQAFb2sB7Tx9igu6fzKh1izPOchMRbjIm9W9v3RSrwCsJSouohevy9GOGamu
	 R0bPM2qAzJCMLZi4hsFZFwyjmk04xIRpznKGO2ezQcPBRf7Ljw8x8nqbD6NhL3Q/1kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
	b=HK9wRo+ieApzOb7Y4X1mVCmBVN08VgNNkdJpD11TJdlqswH91SrY8DezCsNPftFodGah
	 Qh9Uab7WjWL1ruj4A1iTyE2v17OsoYIfHh2JxfoOJaOfWVikm+sDKhk+aAfXVm2OmONWg
	 QbO0DHKnUVMnjjLvLtUjdk9v6Fi7blKKP30t3KBugpQ+KxFUcHkcItqp99PRWvxtxp9qX
	 UCW7o0e5L98dtW6SacXYLvxWIyVw6QG/MWGbTZ1kxGbqDP01wJMtaEZsu2TsC6KPtGZI9
	 JiDImEJvh+ExsZ9N703xW+jGxddz89oEoI0lV6u2UKEm2lZ/S6R10QsfIT8/yxgwtTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	dkim=pass header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=XF37o1F4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A86606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A86606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=XF37o1F4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a17a332ecso352166eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793133398; cv=none;
        d=google.com; s=arc-20260327;
        b=ewQrX6sO9J5xGQ0ya7zyQGdf1qNd3kI4kPwqzGu4PRAc0zGv8GnUh36beG/ZcjSJ9/
         xsshWfIBX5hITE75TD7LQw/X9Gm5k3gw5Vp1oj4l5bjIt2jSLH5zGo69HRkATPi9Pn43
         ISFf9KsPEqENrIpgM5CNzpunDUVoii5OnzM4pYnbtWCPIwtvZlBBBCtOxfNEea8KklX+
         zcYGeDBAJANO6E2gEgdTLiiZuyhWhdXapq/FRgVgmuaI6vkfTS0uxM5MkxPdRTpsyA0K
         bVXF1fsDv7GhE1qEDyO1QfDj97nPvsn22I9nmEVRC5Ut/lFYmrflVBIA/hHt8PKSI18U
         LfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        fh=PbxobVLpef7oZlZXLMZiBYaHYrjqThxZkhQDvNB5rtQ=;
        b=aZ2DpoF8yuhwofy9i+ijYFr5eRXV9fgSMXj/W0LqZZagtRFmOcFCTS9iaLSXEtklUy
         iqkpaLS4z28TbNATrlRY1m1BOMcvza/xJLjVALMrNItYVLndi6+qPB+pwtQ90O8T1xEX
         aegBB5hLalsINyEMjAdy1nk9X3XlXheFGByv/J38hW2g+3wJ9XNSUjyVeA1jIKXXazYd
         Po2uTCpc1VCJNuDW6lur+F1eOCA1Ot31nXVc2GegZ9ss1MFbJkgS4CXhPy9KcCTQGmtJ
         69AMzvKMRyiGQYF9u2riXFAinYsikh4DbByGJ/yZMAR3s3Os1LuXwiSON30nGnkYzQm+
         EnHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1793133398; x=1793738198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        b=XF37o1F4Yl22QTQkqyOw0BCFOpbxrXxBKGoWPBi77Y2u8CtYc+P1QCvBeSxf47fdAP
         29tRm+6w/glVebXC+gX6d+yM5K+kw+hekrWg2R9pV6Pnc5doMduUSAWT60BwjgTL6zkf
         cyu2yiN+Xo+DaEDEC7O8dkvcfp1Uz0r6PXJPXqFUIogytB6Nove67Ywco+YMSI2sz9Xv
         cyKVZrMMapJcAUfwOPJy3u7xxISTvjh5qHD2iSTmAS1In2clRR6ORix/Nqf3RvEZ56Ck
         Wnt2J0Gu/z3/EEUHRh+nWpikqGRBqshdDL0BkXrHrbpm9sj58D0t7MtpDqIBGa52P/vx
         M6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133398; x=1793738198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        b=ez0u7txWtmDN3PnzwHXCu+NfS0CLsBtO1gbrlscwWenxMyMyXIkr74LnLajykETdYJ
         TO0O3lRFzYtIkcEUGNJBLtOEs6t5TYw+8y5kbLtRBtvtVKbTw6UKIt8mwCcLDkf4LmSH
         NzW8DH6irQwDqwJW40x1WPO1+cZGp/Oa3ojkWqcN3dfuvlglXTSZ2ID1I5CWxSXU3Lap
         A7Kgw/+nuQv4Nal5pranfBcH3qeizESdLrzQubUtmQVGYPdEU6NDtOWUE2Sat0q8nt8l
         J5Kd58xB91jw3xrvwt56JV3SdxvWAcEk+DTAUOy8vMCD+16Mx1+kgCxuSHpYRA+pDzCw
         yQ3g==
X-Forwarded-Encrypted: i=1; AKwUvBwOaPjNup6Wrj0wQ3jPqrdI4mGDWhflELM/PceRksCTlbHnP+ihDggLHSyJndyJUVnuVNKd7toWAAWw2Vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+NmnqvlMmECdDRU1l+7ww0EJJZsEtXHWOiEa7g8HLfgGN0qlq
	DwrlZ4eM5VoK6/i4NrX9/ejEjKeF5coS/lGqVaMvZKsfSsGrHL5SpHQ6/wlRTO9V3YSiF1fBbZ+
	zO6KofAKLjpmfpjPWYVCKbkQ2F4TyUI3/Q23vQ9kEog==
X-Gm-Gg: AYBFou29zJoEmssCDt7VzRj6WORrHApg9BIupsmzqs7y4PjsrJc/kZLm4PoNOX4i15p
	9jYu0lj+QDoH8N8PjqXGtDhza3jrcJCnJAsbiq6dB0kmGSN3Mgs7ZJm1qUx996LqhTuirco3e+n
	Ymcy8TxCOw9hDslavuiG55HSUnohDTWiQPhCnywvFajvHQ5vIFnewkUcBxmAmZC5wbIyoYOtNB7
	QH+G5RJQoTjomxdth4+7ohbnBunYi6dwTWvlurcfxhH44QwMxIsrrvwYGFjiwHZ1pdn756ECvkN
	tgsoazsM20I67Uyb5H0s8uNoT3xpbwzjddYk2550ORkzOGD+4s2UduiqjfmkNItaFKQnS++ao6y
	awwOrYh0M5OxhZq78W8SyVsyFhAQkB7c1AXbznPWOA+gYJdNaJTDChI823AT5w6LAtRsdw7V7IE
	Sg6sMEJRRbN4x03GDyLkxumfxA64Cz5BIcn//JgXatKQNgMd5aybj5zhc=
X-Received: by 2002:a05:693c:821b:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-36a20179d20mr630828eec.24.1793133398014; Tue, 27 Oct 2026
 13:36:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com> <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
In-Reply-To: <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Tue, 27 Oct 2026 13:36:27 -0700
X-Gm-Features: AclHuK_MdLe_77m-KmkFSnccE3-4pezFMsWPScpQmmJScc5U5CiCCI34Cd6wgxQ
Message-ID: <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com>
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Suraj Gupta <suraj.gupta2@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Alex Bereza <alex@bereza.email>, Folker Schwesinger <dev@folker-schwesinger.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In theory. I haven't seen a reset time out on our hardware. Every failed
reset in my testing was injected with fail_function, as the cover letter
notes.

PG021 describes the soft reset as graceful: "Pending commands/transfers
are flushed or completed", and the Reset bit reads 1 while the reset is
in progress. My reading is that a transfer that must complete needs the
memory side to respond, so a stalled interconnect or memory port would
keep the reset in progress. The driver already allows for that, since
xilinx_dma_reset() polls the Reset bit with a timeout and returns an
error. It just doesn't act on the error: xilinx_dma_terminate_all()
frees the descriptors and returns 0 regardless, so if the engine is
still fetching, the next transaction reuses segments the engine owns.

Patch 4 may be more than this series should carry as a fix. One option
is to drop it from the series and post it with patch 5 as a two-patch
RFC, scoping failed resets out of this series.

-Jeff

On Tue, Oct 27, 2026 at 12:22=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > When xilinx_dma_chan_reset() times out, all the driver knows is that it
>
> Does this real happen? or just in theory
>
> Frank
>
