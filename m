Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155405448BD;
	Tue, 22 Sep 2026 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081204; cv=none; b=ipJ6/taBrKgFji/aqRUoLR/fvyqdbNni1kOeUNpLaP6gHE29ghXILSxW2/jv67Qr+ts/CYNEkwdr2n+p+5uBJ2sxPw/zXyTjzNN3D44gINZ+VmR0wKUrrhJyzH2Xj0fbCGPfxspPx5TWwWfOPbHjGuEXpLIorsQKFWvCcU8kD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081204; c=relaxed/simple;
	bh=vNIpBp7Mq3xucD0bjJbsHf7WV4eFM3nPd//WD4a1MoU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lcDnC/t1YFEUu1GfsIPNdy01QLvsWbn7yBZRfL34iLafWFazGsh+1FxG3JZaFPJ6fuXoGoItQzxupJYNXxxYsTKhkP/+IJUD94Nhzmhm+PFPhLX7wnSFG7VHI7bAPcDpcNV/PNc++QeM0I8AgWx8VUNHb8qwfCoTozWdulzqzOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5rB4Ibk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5rB4Ibk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A4D1F00893;
	Tue, 22 Sep 2026 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081202;
	bh=G1rkZ0T46UId3nWIoXsTfrSshnJUSXvrkqOmBXIvNK8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=I5rB4IbkwqDsxM+HeEmlyqq+u8L6ZoI2BXDwVR/HMoHSdfaQSJ48oeo5/mRJ7Wecf
	 t5nrvUYxyanw6t7S1Jys0Jv1/aZ1/SESZII8G8MSTF/rOBdZu/5Ohp6ZLV3PMXxNqQ
	 R5H5/1LUXGfLfnoQMMMIiwdP7I4TIvHPhHNHoEg6n1+TKFLgCOO9n42zZJu1SlJ6JG
	 rVFoe4puudVX6xdyV+E3WbKVFCoDVo51wHOaPrzX7BIiejPrDuNIohJV8mOFx3NLwq
	 +Lw+4DIn+p9dtbNd6Nc7RSZoyqSSAfI2fjtk31kkmtPX7P53Ww1eLim6wzqgBURyN1
	 HGjkrSMGLT2BA==
Date: Tue, 22 Sep 2026 07:46:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
Message-Id: <179008111464.3145305.16495726545311526155.robh@kernel.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus


On Tue, 22 Sep 2026 00:38:11 +0530, Ajay Kumar Nandam wrote:
> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
> context and cannot use the SMMU. PCM buffers must live in reserved-memory
> carveouts that are SCM-assigned to the appropriate VMIDs.
> 
> Add an optional memory-region property (1-2 entries) for the
> control-path and data-path carveouts, and remove iommus from the
> required list since mDSP platforms have neither IOMMU nor VMID DT
> properties.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml: properties:memory-region: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Control-path buffer (audio_heap_mem) for platforms where the DSP runs in a stage-2 protected context (e.g. modem-DSP).'}, {'description': 'Data-path buffer pool from which per-stream DMA buffers are allocated.'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

