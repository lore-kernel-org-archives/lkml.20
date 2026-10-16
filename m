Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377604A4851;
	Fri, 16 Oct 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155810; cv=none; b=tSaVc1xeWbM5wx3hlBdHNWA26vXCtTU2vZFhBLVVXkoxXYU1pSF8AaSDXc8wYTpqI14Gtjm2JSjJ9B+RWlBOFYO9WujzKway8knLhUFCGZ5u1Ph/P84kg0lxQEJKs9cB/tn5hKRzUvsyPCh9O4KMOQzec2UYM96hQRG4Jz7/lUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155810; c=relaxed/simple;
	bh=KrEq8tdhNAQWlBopCYYfsCBMJRhjfo3OnyarrRYdguA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GKhbSbiRZ5h6vruxtfJ2ab/9M22XE/eWIJ/NDwoE/ZkbMBX6Os1fFSB9623aoq9Tu3IfxmtMZ7W/U/JLjl4t4bZtWl3woJhTAm0VtLRMEuWEx8fTFH+E4smZXa0ckkPQzTKEPCMIkWi4yC5FgbWeHXCqSFWYN4Kyc3GgW890Pis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkAqeU4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkAqeU4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C1D1F000C4;
	Fri, 16 Oct 2026 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792155808;
	bh=fc5qkf+opbENZox87OF6VoR1ajjtxrL0RgBZy6gQzHg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=hkAqeU4QLfpl66vsdpcPtEYPOOfrCft/ng62iPvBQYodjQEW8N+hmjn8ErQda7IQo
	 L2X8QLBfWbC9zotm8/hdMADpDbc4OQvB8BvI6+D0/m3TuN6ZpYlzazTmYCX3sBZLNq
	 jvq5YuzMyuwfBhyMpUNKtwuuRE6IkjO7PxNhyC5GDoLPNQfOKXGHCcf5KkPOdLsc3K
	 HwjHp9hnFzmcj6px9UfA2nf6DiJSjuDo7Q0RjdQ29rRvyuvcCCzbO2t2qTMN5cKwXV
	 ZrFAkpjqq8oXxnWr1iZNfJBVA9jur3OWdoieIeY92uD8fiwfOnuVhtx1cWlasAvDKl
	 p+fbftlVqtloQ==
Date: Fri, 16 Oct 2026 08:03:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: wyibo6109@gmail.com
In-Reply-To: <20261016090930.947830-1-wyibo6109@gmail.com>
References: <20261016090930.947830-1-wyibo6109@gmail.com>
Message-Id: <179215575885.1306875.3257622892398482430.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document
 DW9714VA


On Fri, 16 Oct 2026 04:09:29 -0500, wyibo6109@gmail.com wrote:
> From: Yibo Wang <wyibo6109@gmail.com>
> 
> The dongwoon,dw9714va compatible names the DW9714V silicon revision
> found on the OnePlus Pad 4 (iceland) camera modules.  DW9714VA is not
> an official part number: it is coined to distinguish this revision,
> which shares its IC INFO id (0xFE) with the other DW9714V revisions.
> 
> In its register-mapped ("advanced") mode it exposes the DW9719
> register interface, with the SAC mode field in MODE shifted by 6 like
> on the DW9800K.  This differs from the advanced-mode layout of the
> currently available DW9714V datasheet (Rev. 0.03G), which puts
> SAC_MODE in [3:0] of SAC_CFG and splits the prescaler and SACT into
> separate registers.
> 
> The datasheet-conformant DW9714V and DW9714A, used in their normal
> (direct DAC) mode, are covered by the dongwoon,dw9714 binding
> instead; see the in-flight series by David Heidelberg documenting
> them:
> 
> https://lore.kernel.org/linux-media/20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz/
> 
> The module-specific SAC tuning is carried by the already-documented
> dongwoon,sac-mode and dongwoon,vcm-prescale properties.
> 
> Cc: David Heidelberg <david@ixit.cz>
> Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/dongwoon,dw9719.yaml     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml:21:23: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml: error loading YAML: mapping values are not allowed here
  in "./Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml", line 21, column 23
./Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml:21:23: mapping values are not allowed here
make[2]: *** Deleting file 'Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.example.dts'
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml:21:23: mapping values are not allowed here
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1725: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261016090930.947830-1-wyibo6109@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

