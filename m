Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295511;
	b=d0lkHmWvCoJVX3C4bjWhAT8qyF22EBloddZhvv23mEItQYeziXMYyR3PtLLw061spslu
	 IB5IKT1SJ61gBiXzwjdB6YlflVK8ZYkTc3ylcT312gcpbdOvICFA+hBJikVW2gGwsS281
	 EP36OTG/dpQkJU4JIr/7C6q7ByThweUMoj+uxWwLDlQ0YyT89miklxDPNVTxYHy+8zm6p
	 kWXsmfcns8HLpAolXxbnf9mRhU6Sx5tY+2zuuMJWw6HdkjAhe3FMJ0k27ykC9o9Zb7xLW
	 654QMwqGq1Jzorfg6D5Gkth49aXT1OGRveXA4elzF2N0Scv1EEALHdg3BUMkfCZWlkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295511;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=/KEC84hmoiSqAMPb0/WNJj6+/aU+u2mLmnNoCNNmZpY=;
	b=Y/7+6dkzTRsfQG8UWA530mCQLeBzxATTxOTGKGKZLuOkrPWor5114H6+wFlqnmZ5XAJn
	 cHjPoK/5iCemGGDPG+vg0y5lSeecQEBSt9wzl0AMgQpxJj0WbR/8pVyESfRVqrNWpOg0O
	 wlwYSCkk0DIdiIR+EU8xsw1DU49T5AZ4NPUfuv6xFBLjm/EmVXUeSN8xpevdhRsrd8hk0
	 YhdP8yqVLO1g2mods5qjBlwsCKNeTQFJ3DpUv+gWvCl2svCO+87Lg4+vdib9+1RD2E+C+
	 YP7cMExeZbqOMLRbpimdQMbag7FH6mtv6xAlLJLfRNJ0DGQ3eA8gBTR2wdfgErA56BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2BGeVUp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDD606A324;
	Thu, 29 Oct 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2BGeVUp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7706E1F01826;
	Thu, 29 Oct 2026 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793295510;
	bh=/KEC84hmoiSqAMPb0/WNJj6+/aU+u2mLmnNoCNNmZpY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=X2BGeVUpZHoGajAQeQzH20EQSs95tIj1nCOEkAxuv3bdZFkgBT3F1oQphYaKbfZc9
	 rR9pXZmm8yihu6ppjvGoZ2oXEG+uTJuki8pvFHhRtEq1gF1uC5dwE25wPV2jKntI37
	 rGBjCVVYHu8X3PNlL0/xPxB58Lu2LDaL9VtOrGy4KbEvEvullSTPX05EUmsqlhhYnk
	 caxq/vugvm3w6bPfXGUtkGVvXpSEbDtCk10AEBGgbp0KrIUlCzJ1M7hvqCUJpgHMPn
	 wLV1Zy5fVR+JnKDVJQxrsMHtFTIQK0vR1rIWSxWI1BTnav0A1lYH5Q32uFV8a5dlWO
	 +hHWjhnsOTcbA==
Date: Thu, 29 Oct 2026 12:38:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk@kernel.org, linuxppc-dev@lists.ozlabs.org, chleroy@kernel.org, 
 npiggin@gmail.com, linux-kernel@vger.kernel.org, sashiko-bot@kernel.org, 
 ritesh.list@gmail.com, conor+dt@kernel.org, mpe@ellerman.id.au, 
 devicetree@vger.kernel.org, sshegde@linux.ibm.com, maddy@linux.ibm.com
To: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
In-Reply-To: <20261029112742.10238-1-lefteris.koutrakis@gmail.com>
References: <20261029112742.10238-1-lefteris.koutrakis@gmail.com>
Message-Id: <179329529616.3541731.13593434719099067546.robh@kernel.org>
Subject: Re: [PATCH v2] powerpc: dts: Add support for WatchGuard Firebox
 T30


On Thu, 29 Oct 2026 07:27:41 -0400, Lefteris Koutrakis wrote:
> Add initial device tree support for the WatchGuard Firebox T30 board.
> Enable building firebox-t30.dtb under CONFIG_MPC85xx_RDB in the
> arch/powerpc/boot/dts/fsl/Makefile. Document the watchguard vendor
> prefix in vendor-prefixes.yaml.
> 
> Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/powerpc/boot/dts/fsl/Makefile            |   1 +
>  arch/powerpc/boot/dts/fsl/firebox-t30.dts     | 386 ++++++++++++++++++
>  3 files changed, 389 insertions(+)
>  create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/vendor-prefixes.yaml:2022:1: [error] missing document start "---" (document-start)
./Documentation/devicetree/bindings/vendor-prefixes.yaml:2022:3: [error] syntax error: expected '<document start>', but found '<block mapping start>' (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/vendor-prefixes.yaml: error loading YAML: expected a single document in the stream
  in "./Documentation/devicetree/bindings/vendor-prefixes.yaml", line 4, column 1
but found another document
  in "./Documentation/devicetree/bindings/vendor-prefixes.yaml", line 2022, column 3
./Documentation/devicetree/bindings/vendor-prefixes.yaml:2022:3: but found another document

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261029112742.10238-1-lefteris.koutrakis@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

