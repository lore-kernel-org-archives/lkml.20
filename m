Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25D4BEE58;
	Wed, 23 Sep 2026 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165534; cv=none; b=ZypdthXFWU6FQ/RuDwvwhHFNrfenpFM4dL4DC4AZJEhlmMRU0s5YZ6Rf+d4EiSu5nlnUvpQCH0t6N/gs3mFpRCgvzlcwIjh2rzdz5SQLcb+Io1PN7Lq8Xcfxz4tM0xX6L+idsa0aoYnXBqsMkoTZz0UZsJquWIGX6Gy2LkBHy74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165534; c=relaxed/simple;
	bh=Njp7DdE4mN3WK3y8zd2BiYez9bY4PJlKG+o2NyyCt7U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Lko3KhLzXlEFc1BbfhrS1cnZRhvwMq/jaS8W7zyBIQuIyyYRlg7RenGZMPE1QZQFxRKbLEz4ALRXF1fUg9cnjXWak2E3v1oTpE+N0NSgS+qx1sGLaSUgivHqkm+Ob4IGXvj0A9UEJJAxrGub2eIecXn5VX8KVsyK55sAoOoVwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGzCbXOC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGzCbXOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA731F00898;
	Wed, 23 Sep 2026 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165532;
	bh=41hUWES7pbAlbHSGkaQiLHGpUJJzIo2wTh85YdC5i7Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=nGzCbXOCErUWL32EnIWhmVFip4E6yArRe/VGuqcfdgd/L82uIDqUzhiqYiXdqztc5
	 b5SA5UV+28wf9XQzqtzrfZWpoX4VdowWMAH8sVux7PZ9nILIJVTrHyg8twyyDO9odo
	 QA3AGIMJEAOxeyRwVdMFKX1ysH18hBWuqkpxjzfSkyz9R2Atz14Lk051hOSo4sUlZU
	 BMHmEG/sV6iUb3ZDhv8hzbixQP2UYyiR6y79hTgTIgiF5IXiI7qi5bzhgX25p56A3H
	 9IHsbcWnBnWwQg/fhkz3z3/XYrqq9bfCFE/T8ACQHGfjKea0d+0tnLoGKB5qM4kSS6
	 hKAUdLN7Epk/w==
Date: Wed, 23 Sep 2026 07:12:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nicolas.dufresne@collabora.com, linux-rockchip@lists.infradead.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, 
 kernel@collabora.com, linux-media@vger.kernel.org, festevam@gmail.com, 
 kernel@pengutronix.de, devicetree@vger.kernel.org, mchehab@kernel.org, 
 s.hauer@pengutronix.de, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com, conor+dt@kernel.org
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260923090307.49959-2-benjamin.gaignard@collabora.com>
References: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
 <20260923090307.49959-2-benjamin.gaignard@collabora.com>
Message-Id: <179016528765.6905.14962207522862834482.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: verisilicon: Remove deprecated variant


On Wed, 23 Sep 2026 11:03:06 +0200, Benjamin Gaignard wrote:
> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
> merged since v5.17-rc1.
> There is more reference to it since that.
> Remove for driver and Documentation to clean up the code.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../bindings/media/nxp,imx8mq-vpu.yaml        |  2 -
>  .../media/platform/verisilicon/hantro_drv.c   |  1 -
>  .../media/platform/verisilicon/imx8m_vpu_hw.c | 60 -------------------
>  3 files changed, 63 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml: properties:compatible:oneOf: [{'const': 'nxp,imx8mq-vpu-g1'}, {'const': 'nxp,imx8mq-vpu-g2'}, {'const': 'nxp,imx8mm-vpu-g1'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260923090307.49959-2-benjamin.gaignard@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

