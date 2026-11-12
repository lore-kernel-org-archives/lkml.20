Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491166;
	b=uokG+XegUCsb4/rSEb8lX8OXg3mrqoF8RQ0noQLN/8buAsSNWL2g5Cx4uZnd7gVLfrF4
	 frvFiGG0qlKlX+dNdG5L0rzSD5Cr7BzKWn2UTaKme9bj4VkBWr+ideUmQH1yl8EuMsGru
	 bqd8Fd0L37NGRcGTnrOIdt+4INUjDtM6eH5d3L23tvU9cDE78LmBnTFBqLmmKy6hn+SqT
	 DTDlhjlQr5znfxAHWwIAha0/bOIb7W1AI0lqVIXo6aOBj65M4YlWfrd+7LMaUBhYio2g4
	 1QHOdWOSNUjbphY/o1lDufu8rDhV2jptMTbSOfjDKDr5+RffvwZc2UucI7aYSogpOHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491166;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
	b=zKg1N7Z+gIT2fuOiaXgcpNahx8Df55lbjJMMOZjZiHjGYL+40FBmT1nrH9dtJITCwtrX
	 0Fg55fK4xy+bnzF0IOmE+PCxAIwdZGoAt5X32C8WKBwBy0XAI/IP7rrKRLPzT5pY7NFEP
	 3D3YCGfNUg3O/uz+YptbcA5321NGpqphF+/XNy2dGEZxtePXtFeJSQS7ULutbFl4ZdSeO
	 89IwVMMhtyFwA/+mBhEFA1EvqLliKdSbkbt9kO2OCSQzwxeiFcUUP0LiD9jLP8COMmlLJ
	 5Nsc0ruWSpqNLA8NiLJELERMYWkxi0yKfv4QfLlzCTnwrO3pusbpmUCygbvXK+ECUEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34AB606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34AB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4c9abc1824so606504466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491164; x=1795095964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
        b=n5d3oWeFjupO2nHl37QUG0X7RJo7uQYj04cgWkE9LWBGkccD6iOwinbeKfy4xb5bfX
         rw2PPk/nyw6XzaB3h7Nq44gaalUcWPhB9grJpEH46r6FBwsq7E6gLKG12qCFLPMwQTiV
         CNQSzFSLULeUsw3sgBJru/wPqwgVJrQUXivef7Dl924lp5EC4co6SLI1B8Kd+HYGrBUv
         ZXVWyiGeHNxn5lEjDxq26UsMOJIHn0dtfZWi7AwEIwskGiWPW0CFvwmGI2FgfcMeKgJn
         +rd3LfvN8jsPZ3yzXSdnZEPatx0WypoALWHjxtT+azsA8I0KKopjKCncmPbCC6vrW/nX
         Z/iQ==
X-Forwarded-Encrypted: i=1; AL+hErGzJYIfh3E13VihY0fwNmO2Nibw3aHjPwdjz5m/T7J1WwEjM7ffs7q0O7LLKrNNgp42V6VEXmLPJ1K/npU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bhFmiGgY/h4+UT8WGIeCfHHssv4Ng38nk+TXUjxA0KslykEnN
	lXQZE3PrmN8yP7g3cxaHKRLmuYfXALPVaINNBKkxof+UBdUNEFkElfomvFDJv66KwRg=
X-Gm-Gg: AYBFou1buHVYWWzfpXCw790qKKf5EqC+SKTlbTyiERPyxwEme9WIRg9iQtBeq8ApLZv
	bB5lAT14klwEDN8DQ4+DQv3HBFBPXYZcgrxbnF7wrzYvKt+pz1qJgSkEYP/2wWJsvkimVUYbEIT
	SoAkDcJEfcVEUhmrMD7cqQ7fguqIYpG11vyOjw3f/upWeyLGjegwRo3EqUefLAZOh7nOJ5VoATV
	GuCyZNKs0dFIPzfp9ljKVatpxU1blOx/Z8yFP2d8zfADk0Fy6LIgKD4CfBQO8gMB9YWyfhA4NHb
	SE9fFMdfsHZwutWNjLsr/vgminZOd+NBOptG1pXsPyeRAnXQv7LT3IC3chLs8BZr/BD2hv7C0bv
	ey3ucWMIJyfIfv2gvJe2izFDemqhmu81tNeulr8N62dEGda3SRan+6rUBKRKIWGlglqvd36RpsN
	fNgaxEEpWs5T47qPnbtQSUW4TQAbhvggctbNumUNGu9LEWYiHUiygQekHNW95C5Qi7e31F9gwKO
	PG74f1g0tcY/WzC4qU0KBghprEwUVWOBwa3Z7lUpIDtmCxmKkOnV+V/G935pIcLtH/ZBIBA+3Cb
	5VL7xh/5SReiDN/cg4zrJpnSpAj8t47gkQJ6y5p8QUPv4XOEBUx6OCfzElbmQOXtC8U=
X-Received: by 2002:a17:907:7292:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c5066a84511mr471548366b.10.1794491164213;
        Thu, 12 Nov 2026 05:46:04 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a649875sm345825966b.64.2026.11.12.05.46.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:46:03 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so6081796a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEyZ7G9OnfyP62Bx0fhE5lr/ltj25Tdyy6h7eSMlMug/OcUlHQRmoWNgtA+yp71Ibsjf6DOLuOECE2k2jY=@vger.kernel.org
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b77770644dmr2967919a12.37.1794490681628; Thu, 12 Nov 2026
 05:38:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 14:37:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
X-Gm-Features: AclHuK8Bvm66uPuRAPPxi-MPPvPl-KdDJtyohfMgnqBqTlOChWJE1Vd3ab7DaZs
Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] media: rcar-fcp, vsp1: Enable on R-Car X5H
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased" branch [0].
> A branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
>
> Full summary:
> /dev/media0 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media1 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media10 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media11 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media12 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media13 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media14 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media15 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media16 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media17 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media18 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media2 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media3 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media4 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media5 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media6 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media7 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media8 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media9 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
>
> The last patch checks the device revision and prints it, which is useful
> for debugging but is unnecessary processing for driver operation so it
> is marked as DNI as well.
>
> In v3, most of the patches have become DNI because they depend on wip
> cpg and mdlc driver work. The non-DNI patches are targets for immediate
> upstreaming though.
>
> In v4, thanks to Geert's new rebased branch, all the clocks and power
> domains that were in DNI limbo have now graduated from DNI status.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased
> [1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.4-rc1/x5h/vsp/fcp
> [2] https://git.ideasonboard.com/renesas/vsp-tests/src/branch/epaul/fix
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> Changes in v4:
> - Change the clocks in the dt nodes to use SGD1 instead of SGD4. (see
>   patch 1 for details)
> - Removed "clk: renesas: r8a78000: Add clock for FCPV and VSP for SCP FW SDKv4.36"

And it still works without providing these clocks because the fcpv
and vsp2 drivers do not manage clocks, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
