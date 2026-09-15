Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E646344C51C;
	Tue, 15 Sep 2026 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509478; cv=none; b=GtPaYhKpF7u7Hdp9dAyHHJnBzQZkLNauyv7+byGoYfeOuB6gzoFabx0GGxxpGaPJXMGp843wqVUn11hbV7/7gaSHiIQEuzWjFLeTR8TPgn2+Byi+roIfNZbyxgOI9vmNdVuRmQc2iVzUqi5ki9hav3IS0r0yCsInueA1kjYc6xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509478; c=relaxed/simple;
	bh=KSRSukBJ7+z5WMKLZHiQkBBo8o2QH2dcCZtfvgcj/xg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SOp1n9pZhzRn6Oee/MKnOBvnijnbtAbiGa59pwSteyFSy7Sjpi6LmSM2cp8Jd0oqTnq2gxXIAYxXM6JUA7Y2V+MzPhgYlhNT6yyZGA16rauSHTu05VLoFxyk0gVi2UzzW+V3Rz8bzrNy3SWs4dJHBZw4K5m1TUfsrOBTlAdAZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZG9jUqRz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZG9jUqRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC581F000FF;
	Tue, 15 Sep 2026 21:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789509476;
	bh=+6kruBY6BSoJ8J6yTkBc3PXegyXTnrySEzokuashekU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ZG9jUqRz+UhtqswynhPgoVamZxHLGtN85OOaEEyZXlifjFR5oVIVC+jrYGLW44q46
	 KTOiGeZ4cwSyYMUeD9E2+js8v9KseS9zSfUfVDXJNwxC4RwFxZUmteBY7b8P07eoOx
	 zxfBve950Vv0mQKOWw22U8RpcE6+3xQVwE2OMAhgZTc0zy7Od2r449Ozfy+E7cTKV5
	 L7u8zRshh52zJs3Q1BNZnGSRQ4tCkH7TOrxUAjagwXM1iOmdbTGHpk2YPdRI820O8i
	 BapmzaEifIbLR9WbNwOYkRMjJ7AfXHYj+/AHIxYRbBv6LHE2guLYHQhP5/vR115V8Q
	 SlTJHfdq/dlrg==
Date: Tue, 15 Sep 2026 16:57:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 linux-sound@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
Message-Id: <178950938407.3847226.1050939911266528360.robh@kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec


On Tue, 15 Sep 2026 17:56:49 +0100, Srinivas Kandagatla wrote:
> Describe the WCD9378 SoundWire peripheral which is SDCA compatible
> soundwire device. It provides SDCA SimpleJack for headphone playback
> headset mic capture and MBHC jack detection.
> 
> The same silicon is integrated in two ways and enumerates with the
> same SoundWire class ID:
> 
>   mobile mode: two slaves (tx, rx) on separate SoundWire masters.
> 
>   SDCA / compute mode: one aggregated slave on a multi-lane
>   master.
> 
> Note: both of them have different bus toplogies 1 device vs 2 devices.
> 
> Currently only compute mode is supported by this bindings, mobile mode
> will extend this binding as required.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.example.dtb: soundwire@7630000: audio-codec@0,3:compatible:0: 'qcom,wcd9378c' does not match '^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$'
	from schema $id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml
Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.example.dtb: soundwire@7630000: audio-codec@0,3:compatible: ['qcom,wcd9378c', 'sdw20217011000'] is too long
	from schema $id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

