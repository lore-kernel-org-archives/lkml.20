Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163293002AB;
	Thu, 27 Aug 2026 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810613; cv=none; b=fSTmyRCetUYe71h0jry8ZItwfY6AI6i8Sr3GCH4sJDfLiajjeAL8WPrba1+UhrcDgLyCk6jq3f6gPApc9ZTOHs3YZWZE4xLgHOx3l4YL12fTyqwm5iVXH+tlIkhdYzB5Ckg1eE7Y3Pefi199TO4XWAEqvU3HxeainDSWiHtlGaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810613; c=relaxed/simple;
	bh=eVYzJGAIjQtqQDbeCgDE5Md9phOns18vg8xOXxuMsRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVLxX24/5F0iyNvAqCWi7NnfwDSO83Jii7qEs2vaUlZn4ye4QxbQwGA1pf/l75eac9nhT8/3fkQ1wRIKHHwK8cpWaxmwCJXKRnMiRf3Oa+nNe8fkYqvpcb+lb5u234pEaWu6H6NfmJhEwAG27jWNweoOO9TzL1lJMQHeSk9lGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b084J/mv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b084J/mv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564891F000E9;
	Thu, 27 Aug 2026 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787810611;
	bh=lJlXA2kwLoTfDo4tJ3+9iNIhRW5M0Zb7cMLr/tH8zJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b084J/mvtWIlJZRA0TvNW50gmDidKFYYLtXiIK/+EoWo8nNi4HZFQ3RB3pKZ5yJsR
	 xZGJn1oGgULrLcLlNvk7dAbFeSgjaQrG0Hf/wTVMpUC0e9WuJmN8dSJb/XoxMHhuLc
	 EzfisW4LrqLTvEnKd5wCvjoAtgUCs2ITmC442ys/wQRgEqZn7wo3bUmAwLXNXxMT/W
	 PcbmYMtuw4qCRWlX2+X+Rfvba95TbSBBWGO3L5CC99QbgE1l2qFIeJ4IPhWdw11b6V
	 ohlPjU8eqZvh4qZEbOOZ4lXr4SSpZzIfTxPDsZeqJ862KqHE24iw+QJmhlrJAGt/aC
	 Xj1ditT75Gb2w==
Message-ID: <006617c6-e3b0-4a3b-85e5-6b5af8f11879@kernel.org>
Date: Thu, 27 Aug 2026 08:03:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/08/2026 20:40, Ajay Kumar Nandam wrote:
> The APM DAIs expose PCM buffers that the backing DSP must be able to
> reach. On existing targets the DSP runs in a stage-1 context and the
> buffers are described to the SMMU via the iommus property.
> 
> On platforms such as Qualcomm Shikra, where audio is served by the modem
> DSP (mDSP) rather than the ADSP, the DSP runs in a stage-2 protected
> context and cannot use the SMMU. The buffers are reachable only after
> hypervisor (SCM) memory assignment to the fixed set of consumer Virtual
> Machine IDs (VMIDs) that own that protected context. Describe those
> consumers with a new qcom,vmids property.
> 
> The two access models are mutually exclusive: a node carries either
> iommus (stage-1/SMMU) or qcom,vmids (stage-2/SCM), expressed with a
> oneOf constraint. iommus is therefore no longer unconditionally required.
> SCM assignment replaces the buffer's current owners with the supplied
> destination set, so the driver always adds HLOS to that set itself to
> retain host access; HLOS must not be listed in qcom,vmids.
> 
> When qcom,vmids is present the PCM buffers must reside in reserved-memory
> carveouts that are SCM-assigned to the consumer VMIDs. Add an optional
> memory-region property listing those carveouts. The first entry is the
> control-path buffer and subsequent entries are data-path buffers.
> memory-region is only meaningful alongside qcom,vmids, enforced via
> dependentRequired.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  | 72 +++++++++++++++++++++-
>  1 file changed, 70 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> index 9e5b30d9c6e6..d9a6bc4a14f2 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> @@ -10,7 +10,15 @@ maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  
>  description: |
> -  This binding describes the Qualcomm APM DAIs in DSP
> +  This binding describes the Qualcomm APM DAIs in DSP.
> +
> +  The DSP that runs the APM must be able to reach the PCM buffers. On
> +  existing targets the DSP runs in a stage-1 context and the buffers are
> +  described to the SMMU via iommus. On targets whose APM DSP runs in a
> +  stage-2 protected context that cannot use the SMMU, the buffers are
> +  reachable only after hypervisor (SCM) memory assignment to the fixed
> +  set of consumer VMIDs that own that protected context, described by
> +  qcom,vmids. The two access models are mutually exclusive.
>  
>  properties:
>    compatible:
> @@ -20,9 +28,42 @@ properties:
>      minItems: 1
>      maxItems: 2

As I said last time, different hardware, different programming
interface, different features, so a different compatible.


>  
> +  memory-region:
> +    description:
> +      Reserved-memory carveouts (shared-dma-pool, no-map) that hold the
> +      PCM buffers and must be SCM-assigned to the VMIDs in qcom,vmids.
> +      The first entry is the control-path buffer; the second entry is
> +      the data-path buffer. Only used together with qcom,vmids.
> +    minItems: 1
> +    maxItems: 2

List the items with description, isntead of free form text

items:
  - description:
  - description:

> +
> +  qcom,vmids:
> +    description:
> +      Virtual Machine IDs (VMIDs) of the processors that consume the PCM
> +      buffers and therefore must be granted access through SCM memory
> +      assignment. Required on targets whose APM DSP runs in a stage-2
> +      protected context and cannot use the SMMU; mutually exclusive with
> +      iommus. SCM assignment replaces the buffer's current owners with the
> +      supplied set, so the driver always adds HLOS to the destination list
> +      itself to retain host access; HLOS must not be listed here. All
> +      listed VMIDs and HLOS receive read-write access.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2
> +    uniqueItems: true
> +
>  required:
>    - compatible
> -  - iommus
> +
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - qcom,vmids
> +
> +dependentRequired:
> +  memory-region:
> +    - qcom,vmids
>  
>  additionalProperties: false
>  
> @@ -32,3 +73,30 @@ examples:
>          compatible = "qcom,q6apm-dais";
>          iommus = <&apps_smmu 0x1801 0x0>;
>      };
> +  - |
> +    #include <dt-bindings/firmware/qcom,scm.h>
> +
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        audio_heap_mem: audio-heap@a1000000 {
> +            compatible = "shared-dma-pool";
> +            reg = <0x0 0xa1000000 0x0 0x100000>;
> +            no-map;
> +        };
> +
> +        audio_mdsp_carveout_mem: audio-carveout@a1100000 {
> +            compatible = "shared-dma-pool";
> +            reg = <0x0 0xa1100000 0x0 0x400000>;
> +            no-map;
> +        };
> +    };

Drop entire node, not really relevant.

> +
> +    dais {
> +        compatible = "qcom,q6apm-dais";
> +        /* index 0: control path, index 1: data path */
> +        memory-region = <&audio_heap_mem>, <&audio_mdsp_carveout_mem>;
> +        qcom,vmids = <QCOM_SCM_VMID_LPASS QCOM_SCM_VMID_MSS_MSA>;
> +    };
> 


Best regards,
Krzysztof
