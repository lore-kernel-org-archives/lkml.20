Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794A3264D1;
	Thu, 15 Oct 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061448; cv=none; b=RZggNdGsws9U9ihkbY41APJC56r1VH45Dy+MAKgONmHz7wELj+zVAhNm93RDWMi8q+m0YY6/AdA+Qkmyi9nJK7Bg5OFW0pxRxXU/xxmML6CstlWgFOA7al7FpDHBOAkoqqJLk8Kkvit8T2YKWagje8AXHzxf/jtVglh0cSdRauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061448; c=relaxed/simple;
	bh=v+0gqgeAv+u2MidpA8kdHgPnBc5OwfSPu4zwLlNJr1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEh4X+Fm/6rQI5n2FgAPaETI9o/yoCcNm/Su9Ces/soepVest45HuvSgJAbsoD2vR4mL3eocGZ4Sw7zDDczlKbSp9CL3mOm96kOE/HPka5qBWMvRFgVaLIbHRNToftgAObVy5OuRfq0NiYxXNKM6hmXlZlrNh2RmY0yfgctG+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNvnW9GU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNvnW9GU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B2E1F000C4;
	Thu, 15 Oct 2026 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061443;
	bh=Lg7TOt6XcTyEdNiE5CmdXlCwY1B5FyDuCn0rC6jxWBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cNvnW9GUrhLinFBjC6477v73avjTrrQ7q2SPtXIcbbbu5XfcOxKI6PY+4Z+CmYla3
	 FB3xpamgSxabA7NqCjrru1Kkmkbg8UXyjRegetGO8dgQ1pKsOXAZRKVk8DbWfXwiB9
	 2lUpoIT5inXQlt0czvv8uyhAtt/sIZkOoZ3ypbofciipgFDYZleVxJISxCKDfpg31Q
	 1ZEH8kcWG5iaJBVFgjHM92bSd89NRYblPZxX40YCwjRrwViCrdAAMBXI9xHMu5w7tS
	 wqVgS7gIhuOXtKDUqM19JQjeI6f3dowA+9qlyMmk75lD0qbtgEndPSqpiFgRKdmg19
	 Lf1z4eufhfREA==
Date: Thu, 15 Oct 2026 12:50:38 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: gicv5: Relax IRS
 properties constraints
Message-ID: <atCv_t_KPJ23UAhJ@red-moon>
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
 <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>

On Thu, Oct 15, 2026 at 10:20:25AM +0200, Lorenzo Pieralisi wrote:
> An IRS is architecturally allowed to be stand-alone (ie with no direct
> CPU connection).
> 
> Relax "cpus" and "arm,iaffids" properties constraints allowing a standalone
> IRS configuration.
> 
> Fixes: 7d7299bd07c6 ("dt-bindings: interrupt-controller: Add Arm GICv5")
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
> I have not marked the patch for stable though I think it should go
> to stable kernels to fix the original schema. I am a bit nervous about
> making cpus and arm,iaffids optional but I don't think there is a way
> to keep them required and force them to be empty for an IRS with
> no CPU connection.

Hi Thomas, all,

I have noticed this is now queued into -tip (thanks), I would still appreciate
DT maintainers feedback though on the above and I still think that this must
go to stable kernels (I have not tagged the patches CC: stable as mentioned in
the cover letter but I believe the Fixes: tag will do ? If not I can send
them myself anyway).

Thanks,
Lorenzo

> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> index 86ca7f3ac281..b901e4288816 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> @@ -120,13 +120,14 @@ patternProperties:
>  
>        cpus:
>          description:
> -          CPUs managed by the IRS.
> +          CPUs managed by the IRS. Omit it if the IRS has no associated CPUs.
>  
>        arm,iaffids:
>          $ref: /schemas/types.yaml#/definitions/uint16-array
>          description:
>            Interrupt AFFinity ID (IAFFID) associated with the CPU whose
>            CPU node phandle is at the same index in the cpus array.
> +          Omit it if the IRS has no associated CPUs.
>  
>      patternProperties:
>        "^its@[0-9a-f]+$":
> @@ -210,12 +211,14 @@ patternProperties:
>            - reg
>            - reg-names
>  
> +    dependencies:
> +      cpus: [ "arm,iaffids" ]
> +      arm,iaffids: [ cpus ]
> +
>      required:
>        - compatible
>        - reg
>        - reg-names
> -      - cpus
> -      - arm,iaffids
>  
>  additionalProperties: false
>  
> 
> -- 
> 2.53.0
> 
