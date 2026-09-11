Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59A416842
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121965; cv=none; b=iZ1Rxlxlntk2lS0lpXSuDjr6vG9gmoYy13//my0bAU4U73yRJWjemtRbpx1lxjUXk1vT/6TxU62Q1eFY1ph8fL/hm133aDFreYPLz7XE//9beiLhcctGIoKr5z27hWv7HRSK6iyDJtJiYazJIUVc5EpCqn8/YDzjlLGcydOx+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121965; c=relaxed/simple;
	bh=n6SP3rxcsgBQwYDRodqbs8EqZBwaeHAu098RqMv9lvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSqIukFsDsI7AI0xQ/iZJ6WYAEqlANDeERhbICl9vdD4Q+Lw1UP0MHcpEyJXQO6gwcakcOEvGb7pbO/QqTfYCoZz6Jk0K95pSo9aQzIEzxSX38Chajg6Bu5w9XYMdltEiXSyczlrCUKRafHhpneQVwTygkTrzJt5HjZVuoCic6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGZEScCX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGZEScCX"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a7f5655823so1040548a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789121961; x=1789726761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEzfJV11LjKwQWypwntHmfatnZ4DOiDzcipp8kgfTiQ=;
        b=bGZEScCXieK4TVaf0rjSBlC5cyukKEf5BOyZC1osFiVUBgC1I3GuiEbED7S7QshW+4
         lQuFNSkbESvduBo+iB80KLZ5ZftlWPdvUcNN580RlNaUnuaw93zSdUYNeYM2M1YzbIZP
         sPcy7qXE3+koFlTxPVJnYD2M+IwhIwNsNYO+CTv5xNtrS+/2xh9UcZx6pCaQx5BMsbHO
         gKCaErmigFmsUPl7xy3QKaLveFPlFWBliBlyBys8zw1xXSGymBX0WXSdCp9SUZhn4TyG
         gst2SbSDDwWdkEHBhCj30JuGt7YjuMPzLpauKgCDxP5p4K5eLgGD7qQFa8qjJcVSv745
         3bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121961; x=1789726761;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEzfJV11LjKwQWypwntHmfatnZ4DOiDzcipp8kgfTiQ=;
        b=UZaPBAm3jwIOuclBtsQnccpgt+gx8oWb+I1zplR9VpmJa4FFppFOn0DuLEKpdERE5a
         3zj0PC2G3ZMLvTfWwAyZ5ev44D+yNLZz+VgFSzooCTbtq7/xinkBNQKGASgCXOsCo5Yu
         30OHqucPdl/3QqlcPcr5kzSAYMU1VygoZ0mCXwPt4YRsx6Wkp7MbhLdujqYLnK0KddiK
         h3HK0/VUPs98jqHGdGWf5mVym7MqdPUCc50y1pfVucUP0zQ5EmgH+xpMyjbjMe1KEgVW
         PbpKhXLJeH4s1cbQIjkn0YbIgq8JEeTmAZ6RREnO7zcxvjgWLfBBa0zw+92KAfLkEqvj
         1egg==
X-Forwarded-Encrypted: i=1; AKwUvBz4u9s9MziT03gjRtJNQKtp+HpG8KnxB/Ah1a+BtWqz++GJ8HXQk6rM4TKmmkrw4J+AuQuM0kI13FU3LTI=@vger.kernel.org
X-Gm-Message-State: AFuF++k7uNEGdRDDC6wcY1oiqHzHYNYEeu5gss5K63Ligk/MAhZdXh87
	xc8b8mhD6vWT4uFAVerYAFLNkQOHCiY0hs/c0fB9b+NryjCGLQMf0YSF9/EYS9QnDVs=
X-Gm-Gg: AYBFou24NKjesT3rSGHcZgpS4/n1b0Ym0QqF9j7619kS1T4wkUsGoslX+WCTjAifHA9
	qePvvCQbeee4A0KSDlpbqIjllL+XMGE+2ZPaw/XEGxne4M2CA8b+XCIxfYd/KpzPkjQQo9wyeTz
	a99eV5hVuJzUzI76FDIMMzuOv+ne/7mJOapwWTxHXxtok6wj02HopkVmRkvn4XFCAY7JdqRkWbb
	+YuN6hEL6fW6WTCgB8SA5aXuK9Lj8xUtMjji6wG1fv02NzzU6aJkhv+OjIax25JZ5weGwy4DqKI
	mrvZPDxjptin/8ynmW8LcLkqWLJqezH9UkbxZZ4sjGjq97z0MW+xaP3Et9pniHpGwgO07uqFZ49
	IGmyrAbW3iXZbXgjA+Kkaq/y7ZYHbbFJ6ZEIrte+3ROMe0No7jWVa8OZfyah3/Tb2M98AexSRQh
	3fTmUhHpbPlzauDbuzghbzWZoX2TOYwvgxbNZxnvlU1vyx0W+RnQHO26aye20j6HzAigA+pY4ke
	C5W0+u5Ggpx
X-Received: by 2002:a05:6402:2115:b0:6a6:32f5:5573 with SMTP id 4fb4d7f45d1cf-6a9b569f04emr1620126a12.21.1789121961346;
        Fri, 11 Sep 2026 03:19:21 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.225.241])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5773f72sm637132a12.0.2026.09.11.03.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:19:20 -0700 (PDT)
Message-ID: <b44d7cc0-203f-4bf0-ac3b-5393bb0e1a90@linaro.org>
Date: Fri, 11 Sep 2026 11:19:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API
 support
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> This series adds V4L2 subdev streams API support to the CAMSS driver.

Can you please provide a use-case and test in your overview.

i.e. show what it does and show it doesn't break anything in a way a 
reviewer can test ?

> Each subdevice gains streams-aware enable_streams/disable_streams pad
> ops alongside the existing legacy (non-streams) subdev ops, guarded by
> a new per-instance streams_enable resource flag.
> 
> Patches 1-4 add the CSIPHY/CSID mechanism:
>   - CSIPHY: passthrough routing, NO_STREAM_MIX/NO_N_TO_1 validation, and
>     shared D-PHY lane enable/disable gated on stream-count transitions.
>   - CSID: per-source-pad routing (a single sink stream propagated to
>     every source pad by default, remappable for multi-VC sensors),
>     VC/DT discovery via get_frame_desc, and new hw_ops
>     (configure_rx/enable_stream/disable_stream) with a gen2 backend
>     implementation.
> 
> Patch 5 is a standalone bug fix, independent of the streams API:
> camss_link_entities() used to create an all-to-all CSID-to-VFE
> crossbar, but SM8250's hardware wiring is a fixed 1:1 pairing
> (csid[i] <-> vfe[i]). Enabling a mismatched link (e.g. csid0 -> vfe1)
> exposed a media link with no real hardware datapath. Fixed via an
> opt-in csid_vfe_fixed_pairing flag, set only for sm8250_resources.
> 
> Patches 6-8 complete the mechanism and turn it on for real hardware:
>   - VFE: streams-aware pad ops. VFE lines are inherently single-consumer
>     (vfe_link_setup() enforces one link per pad), so no refcounting is
>     needed there.
>   - camss-video: the video device pipeline walk now checks, via
>     v4l2_subdev_has_op(), whether the directly-connected subdev supports
>     enable_streams/disable_streams; if so it issues a single top-level
>     call instead of manually walking the pipeline one subdev at a time
>     with .s_stream(). Falls back to the existing legacy path unchanged
>     when the remote subdev doesn't support the streams API, so no other
>     platform is affected.
>   - SM8250: streams_enable is set true on every CSIPHY, CSID, and VFE
>     line resource entry, turning the mechanism on for real hardware.
>     Every other platform keeps using the legacy non-streams subdev ops,
>     so this is a no-op everywhere else.
> 
> A practical benefit of the CSID routing change (patch 4) is routing
> flexibility for multi-VC sensors: the CSID's routing table maps sink
> streams to source pads/streams via userspace-configurable
> v4l2_subdev_route entries instead of a fixed pad<->VC assignment, so a
> sensor emitting multiple virtual channels can have each VC directed to
> a different RDI output (and thus a different VFE line/video node)
> with a set_routing call, rather than being constrained to whatever
> fixed mapping the driver hardcodes.
> 
> When a sink stream is shared by multiple source pads/streams, CSID
> only enables the corresponding upstream CSIPHY stream on the first
> source stream that needs it, and only disables it once the last
> remaining source stream using it is disabled. Enabling or disabling
> additional consumers of an already-active shared stream is a no-op
> upstream, so no consumer can double-enable or prematurely disable a
> stream still in use by another. This also avoids ever hitting v4l2
> core's own -EALREADY re-enable gate.
> 
> Verified clean with checkpatch --strict. Built, flashed, and tested on
> RB5/SM8250 hardware; ran the no-routing capture verification test
> across all four CSID/VFE RDI pairs (csid0->vfe0, csid1->vfe1,
> csid2->vfe2, csid3->vfe3) at 4056x3040 - all four passed with
> correctly-sized frame captures.

What's that - please detail your exact steps in the cover letter. What I 
need to see in the first instance is that nothing breaks.

Maybe try running libcamera cam with or without gpuisp. Show some yavta 
commands to prove nothing breaks and then something to show how to use 
your code.

> 
> Gjorgji Rosikopulos (8):
>    media: qcom: camss: Add streams API support for CSIPHY
>    media: qcom: camss: Add streams API hw_ops to CSID interface
>    media: qcom: camss: Implement CSID streams API hw_ops for gen2
>    media: qcom: camss: Add streams API support in CSID subdevice
>    media: qcom: camss: Fix CSID-to-VFE all-to-all link crossbar on sm8250
>    media: qcom: camss: add streams API support for VFE
>    media: qcom: camss: add streams API support in camss-video
>    media: qcom: camss: enable streams API on SM8250
> 
>   .../platform/qcom/camss/camss-csid-gen2.c     |  59 ++-
>   .../media/platform/qcom/camss/camss-csid.c    | 494 +++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csid.h    |  45 ++
>   .../media/platform/qcom/camss/camss-csiphy.c  | 223 +++++++-
>   .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
>   drivers/media/platform/qcom/camss/camss-vfe.c | 119 ++++-
>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>   .../media/platform/qcom/camss/camss-video.c   | 119 ++++-
>   drivers/media/platform/qcom/camss/camss.c     |  21 +-
>   drivers/media/platform/qcom/camss/camss.h     |   7 +
>   10 files changed, 1046 insertions(+), 44 deletions(-)
> 

