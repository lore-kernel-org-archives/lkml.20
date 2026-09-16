Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2A4B048F;
	Wed, 16 Sep 2026 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600782; cv=none; b=irRaoDloeHUeOFduNgHdrnwZUZziIg6UxssZPH5TLvODRcYclVXHv+9IZwZ+HXhanYjWE3sAQdoq5nyAq/fe4KUf24oQaJRxDxyc4UA8K+RoB3Q+a8oRZn2IE/fwm5ccLZKm9QB3/1M7J1q4tlsJo0vXW5Tx9JCWJ2MsG6xqZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600782; c=relaxed/simple;
	bh=7HHMpzsFpMEJ8JTQtHgtQlHewJFS3wqe7kpsi7T9nKM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tiwiYQ3JhUmgW4jp6r4lMYy8mMIod91sgij6VLXnhf5+RMo1Z06HKMpOE7HC6JS984u732PZ6Dv4AONjO2IYDFro+4hQqO3+iuFAX49DROwQv4RffcoZf+Qi7SCe+3aaPsBLtXdn9vcaEYIOq539z0VixVCwSLkQgDKh+RrP1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaUUfSP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaUUfSP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDCC1F000FF;
	Wed, 16 Sep 2026 23:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789600780;
	bh=YXFygDh577wbxnlTwuGjiT8vlvDVLVhL7hPxlcWwhto=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=VaUUfSP2WDtkXF8gi1lcsqZeruGqVZLehYWuR6jrMs4k0zoSkkumEMHnwOvG/mCyV
	 1SeQMu8xNE1r5urP5RTzNNV+Y7e6Kgmn8OPKovOlSI5p7oSNIwJWW7eaHL4Oxow6Qx
	 6zmXwK5oYpjjLYdNHUMGSuPZgxESqe2DWlcs8jL0A1n298pV9fVi8EiSobzvEIgtUH
	 3UyxGtSJHpfwo5Gd5rKhhiGhFXqjQ/r0dzc+GgqNolA05qVm+rGUcDWCp+HUcji+9p
	 3wnvpNfq2RKmrrQtg0hIBwRgKrMrVwt/zAXYhGaLrCn1wKc9iBNnCeDqPULHj5WVU1
	 fqI49/bljN2RQ==
Date: Wed, 16 Sep 2026 18:19:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org
To: Daniel Matyas <matyasdaniel005@gmail.com>
In-Reply-To: <20260916201253.483877-1-matyasdaniel005@gmail.com>
References: <20260916201253.483877-1-matyasdaniel005@gmail.com>
Message-Id: <178959747036.2021291.11640248030618302686.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: axis-fifo: Added missing binding


On Wed, 16 Sep 2026 23:11:50 +0300, Daniel Matyas wrote:
> drivers/staging/axis-fifo/axis-fifo.txt file described how the
> devicetree of the driver should look like. Convert it to .yaml file.
> Issue found by checkpatch.
> 
> Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> ---
>  .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
>  1 file changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.example.dtb: /example-0/axi_fifo_mm_s@43c00000: failed to match any schema with compatible: ['xlnx,axi-fifo-mm-s-4.1']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260916201253.483877-1-matyasdaniel005@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

