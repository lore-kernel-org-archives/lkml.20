Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353221;
	b=MuSDPwkO0GSSA3Pj2jmrUqm1Aoz4+SmNspF9lQl6ccmWn1cyT4WVC3bKEkGVy4+VtU+u
	 HrTkno4SrtjGJLbdWmDMQaY8cZiZRnz8QP68uPhzmfmP2BnfN9okKu6lljEdd6fqw2IZ/
	 Db6r5GM2m2pbNrMC0rzKs4MlVSBd/mszIdd4kaiuSkOnhYRMGWoUjKpe4sWk5n6ybnncJ
	 v531jLlXQUta60hRAScMkiKITSYapAKK/8Hc/jakneZ2A3Qk0yYlqtMfRSgbaaBshY0s1
	 xFV3SrF8nGOZNLqG0K5IJ969hZT8KnFZFbFE6uJZdu6cZmATm8Y4FW4NYQ4t/shhrJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
	b=stkT0OV/UwJwcVKrwIb1Hu1MrB5n6bnCb1kT9LwL71TZe9xOWoQ+fYHCZSNE9hlAFuJP
	 qd/A/7AjUuqftd/dAELFf+mae4Ic1mW6lKUr2X6pheRbbiG6+KhOmvJvKG1TR+Ujs4KE+
	 NIEnWq8nY0ArIpghh8Jh8EeHMxGLRTF4j1ccJ3f3Yuk7XNJP9MQLFb+6YiLrn+fSjGzOE
	 1Bk453IRb1JBNP+BbMtyZ3DbGM6G8cldAmb3y1mYF4/C2Xz4ihpd2mD2pZ7UfJflQ9POd
	 v91qaVR+vMbwiTJXl1EMZvNyLGfYZvGYIrcH8rHuM7cMC36vkCIRcdr31t8CMYoBUvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Kv4m9vJR;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B141A606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B141A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Kv4m9vJR
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfc346401aso378890e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793353213; x=1793958013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
        b=Kv4m9vJR6R9/MCQPr8oImYroO5YLgSVS0DYGIvONwSH5eZkPBnkxNVp6UbPLFqhzJa
         mHwnam4KotFiiw2rxYegY1kWtGQiTINkwVf+f0Y+u2QzIsLuF3DneFaKE20yzTnkJvUL
         70+rwPeuEdD8KBv3DlclPXB2VFwYGOM9bVM++la8LT/SMXM8wnof4b6Sr9VGEuhyM5qi
         DH8zSsN+nlr7X7dPGz8SzGu1UlqoriuFXy1G9JxtzUCbp+ogvr7v5xumXPOz5NJ/Vd0Y
         /RvkMRt3ErRcgH7pb13vlNxMeCRHTiaIzHOaKj6JlTsxLzPyaWS/IEGF7NiBV8mjUXk9
         vdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353213; x=1793958013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
        b=QFtOCw5LCeKM1ZmIrCBJ+Kl6mh4m3lpkhd38jwbUqb5Qxe+gns7NzZC4YOwWwjK4Lt
         O5VI91X3S9ovzHiiO4YhFSIqef9v2cL1dioFtK1pfUStaBR6/62iNDNY3aUAArPsj02k
         E+hAiqqq/B0IJgEqZTNJBKGKV111L0IgP/AZSNllcHodGMahNIlsCxRWBgt26VfksRIh
         SvgMFG1zRXZ36KPmH9zgL6DjdjRrXASN9MZ2purR3+083bKKCjDNATFxV1RwqvNdiZO2
         hPAYq10gBLvTabzY45vFgyP9E4eLgVJeIoagq9+idT5geqPTjE8BHt/rGE7cjM5hjM4H
         zIgw==
X-Forwarded-Encrypted: i=1; AKwUvBxOyenhf9ioJEzOKaqXEaN4Kp1Jrk4875gRhnV9Hin1KjeGqUs5oZKa6eGKJOar3mA11I+c2aLKtpSmtTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaA93E814/MXuU6q/NNoOqWFWsixckPUV9jyixcTcnH37WVezK
	J56Gbr3sZqUIAA65lrRSIoI33km2iRYRZZj9qZbo7n29QHfIcWINHxGTowY444RwEEU=
X-Gm-Gg: AYBFou2bHfSAmFqn6UyREf9wPzeLcMvaKt/Qvm/y2NT1+OJftQBf9z8zxRS8349Y5re
	0lKehrVkWXXGTqgGzIuzyQ8gCYxxvnkzMOArdrvsTofsCtIhepSXJ3B1DnIRhiAwsj0RNIhaqRE
	TWSMQNuftSUXKhmhs2lW9UzmfTvXD58M5rx+3WluuIygC97b75Row0Fdj1V9kNHFgi3ADzev+6S
	m9iGRydlD8xtHfADENh5rX6he5gXP9UXAzGRwUl03IjhYalPrLSegoKr/vHi5XBtqCZLXdiME+Y
	yyqmtGp9KJ74qEfumES9zpTatk8lfS7k5S1FdNa0cJga0ZEZDBIbc9Yd0en2BF1z+WKcDvLzDQt
	uiKZ4iEexjspoIeMOQG+r+S8KSRaEeJH5APik3P7zigtcfbtWdyRr2pu/s5pynhQd4FKiXI222E
	DMy5LFEElsVtQX77fOc2iwGpvPag/3fbwpau9fcWXhVCJUCo/UO15V1Tk0ZpFGMWK5xjrQeNnlz
	CS1VIT77HzY2DV3VMN8+jC+2gZHaoZPP26eTUbSqrmL+9oUD8jlXjQypeMVXgErfmTsocLK1wd/
	EinvXv1JewDjyO0PY0OMuw0mEfxc1nDWSDXaaA==
X-Received: by 2002:a05:6512:668b:20b0:5bf:da1f:c390 with SMTP id 2adb3069b0e04-5bfda1fc9c2mr262942e87.36.1793353212517;
        Fri, 30 Oct 2026 02:40:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfdc08ea60sm221364e87.33.2026.10.30.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:40:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auRl4VzVljAQ1Suy@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <at9nsxtGOl3N5PJR@FV6GYCPJ69>
 <20261026161220.GA1671235@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026161220.GA1671235@nvidia.com>

Mon, Oct 26, 2026 at 05:12:20PM +0100, jgg@nvidia.com wrote:
>On Mon, Oct 26, 2026 at 03:52:30PM +0100, Jiri Pirko wrote:
>> >device-get:
>> >  request: {}
>> >  reply:
>> >    caps:
>> >      evidence?:
>> >        min-challenge-length: uint
>> >        max-challenge-length: uint
>> >        max-total-output-length: uint
>> >        objects[]:
>> >          blob-class: evidence-blob-class
>> >          format: string
>> >          representation: evidence-representation
>> >          max-length: uint
>> >      mr?:
>> >        mr-flags: mr-device-caps
>> >    info:
>> >      $extend: device-info
>> >
>> >So.. how about could we drop the sets, use a direct description of the
>> >layout and do something else for the ID numbering? Maybe the numbering
>> >can be solved directly by only listing the names in:
>> 
>> I didn't want to have a lot of duplications. Netlink show us that the
>> same attr, or attr group (or nest) is often used in multiple ops. It is
>> not good to repeat them each time (multiple obvious reasons), so I came
>> with the sets and groups. But I will think about how to make this
>> possible to be formatted in more readable way.
>
>If a "record" is re-used in multiple places, then sure, put it in one
>spot, not disagreeing with that.
>
>That can still work out with a clearer top down flow, more like C:
>
>records:
>   evidence-object:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>
>ops:
>  device-get:
>    reply:
>      caps:
>       evidence?:
>	 objects[]: record evidence-object
>
>Jason

Okay, I like it.

