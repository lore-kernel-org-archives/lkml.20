Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF84A2062;
	Thu, 15 Oct 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091286; cv=none; b=iv+aDbBDxqidjrsPzR/vNq13Pbjhf2ayS483jkT7t4NCBRXqSeXm/x2kLE8KRhygu7U4SaO73HUBigGsHg7S9fy77eRQ0M4L4cBmft0gcHbrh4wAOtKfEXTUVvvmtbmpIEY6qKs4ks3QDGOrW94jf1CjJO3Tp/8CJ9Sv23XhOUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091286; c=relaxed/simple;
	bh=cyU3X4JdKoxg9kUry1GAjfUWGDLRoQEz8UieWr1cxb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=og+DV+rh4r56yZw7t4AXgqm8BJ/HMvlwDNSRuBJJGCsD/aFiz8isrVqDB08NM8ByEuZFxpG7P8SFtFBGOE3oUj/z3AIWGWt6ZL4XqQRryCxvXgeB2Ncb5j0jB6l4y3N8OTJodD5h2brzheJNelVjNrlXHJe+gJ3VbieUcCnV1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=et8klXTX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="et8klXTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994EF1F000C4;
	Thu, 15 Oct 2026 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792091284;
	bh=uOLB46dfm0aerWqo4MfS0HfL8CCeDthLlQvQVMVFuVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=et8klXTXLJglDd5uZg1slra9e0Xq9rIEh8OqusA0qBEtB7+kUpPInQx9jvMMELUxA
	 8N/G9s1ZGbpj+o6gL6Rm07lZSnHAvSCyuivYwCFXfAciV7gK6taEcrAcF8H3Ibkbsn
	 0quw91+s/Xnqx/qI7+vjtx9Fi14T1hCJ38qcJgb9AJadMNIP0UZXpqk0NQCTRWu+AJ
	 IBrMbjo9D0idyoexyyHmGfM9ReHS+W5TOrUVPCt75SmPckAFapJVPlv+d2asXEnPIz
	 ZglE5gCNhNokb4svGKVj9o7r94NRHo6aXaMcYBuDq9L7Ti3Wqy89+H/FIcVZSfGsOa
	 nOeT6nuuxJuVw==
Date: Thu, 15 Oct 2026 14:08:02 -0500
From: Rob Herring <robh@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v8 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Message-ID: <20261015190802.GA5059-robh@kernel.org>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com>
 <20261006141620.GA1950759-robh@kernel.org>
 <CAC-tS8DzW88Lu_k-yKQtyfYc8u5-rh9WKTSanJ6dq6Xo3wp+kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC-tS8DzW88Lu_k-yKQtyfYc8u5-rh9WKTSanJ6dq6Xo3wp+kQ@mail.gmail.com>

On Mon, Oct 12, 2026 at 12:15:52PM +0530, Harendra Gautam wrote:
> > > +

[...]

> > > +
> > > +      qcom,qaif-aif-lane-map:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description:
> > > +          Per-lane direction map, one entry per lane starting from lane 0.
> > > +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> > > +        minItems: 1
> > > +        maxItems: 8
> > > +        items:
> > > +          enum: [0, 1]
> >
> > Can't you use a single uint32 bit mask for this?
> Here intention to keep this consistent with the other tdm mask array properties.

What I mean is use 1-bit per lane/slot. That *is* aligned to the 
existing properties:

  '^dai-tdm-slot-[rt]x-idle-mask$':
    $ref: /schemas/types.yaml#/definitions/uint32
    description: Idle slot mask. Optional. A bit being set to 1 indicates
      that the corresponding TDM slot is inactive/idle.

It can be extended to an array if you someday have more than 32 lanes, 
but it seems you only have 8 ATM.

Rob
