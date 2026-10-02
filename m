Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11691349AF4;
	Fri,  2 Oct 2026 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922724; cv=none; b=oia9p8fd3IrBzQNqhii9L3pEpnWw9wXrxt+OTBUpTlYAr1E417HXSRx74CpphMzl4piaHlVs3x60qCq6jB9pqCpqw0UkaOAP46Eh6EUqFiJ4AeOGgzpCDHmD97cMa/Us9Wra23dpjmfm7Z2fKvd1Jes4uALwI01pqrCsq1v4APo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922724; c=relaxed/simple;
	bh=mEts7fifEGM8/0N0+HnCiXYMx+YkmgXssL0buYIKn6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLR+wawcOiMwcGHjGXzx/r5ZZI/DdWVIa2wfHMOlYLOt43cet+Qqkal0rim9Z4qbbGZlCFSIMTsCHoE7z51uJPec5l2oyXMzSHoQac5a8xB1yZB1H3KWB+ZxfYVb4OHayE0daEi73d0tREA/o9wG5RCxuutDOlRpWrhqNAFVU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2SyIKsi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2SyIKsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A078E1F000FF;
	Fri,  2 Oct 2026 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790922722;
	bh=tQDoPzEXeETyb5A+8w45tDo5texcaSJNAZPVI6AddNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X2SyIKsioyLVTQm2BnWymFfQoJP8kTE5L6FW3BJ+yBXaFESdcdA4pLu6QX+Pb5yPt
	 WSUmiZUPysaF4VGqhMnCiZi4vnehk2LpCsogLEz3lneolB1VUYT/SkBPYW0GL93RQt
	 SfgqC5fUUM7NVKII3pdhPyNX0QaBwYt4Bv4p5Umqzv/OBuz9tIuohD496g+pqE8o4+
	 CDWxbq4Yp1OWeZhVYH90+W6ZI8OJnVAFzG5vR8U5kfgXrlIQtbQrgAD7Ucm3/ngcBD
	 gRCJdticJPE33FwHk+r8Fkrs10ATGGGaHiq+MtHEAAc4/34hz7/XHbcgrGi+9V5jQd
	 zdyjRzM6ZO6EA==
Date: Fri, 2 Oct 2026 08:31:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com, 
	vigneshr@ti.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: arm: keystone: ti,sci: Add
 ti,tda54-sci-pdm compatible
Message-ID: <20261002-observant-prudent-booby-eac28e@quoll>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-3-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930194131.117129-3-b-padhi@ti.com>

On Thu, Oct 01, 2026 at 01:11:27AM +0530, Beleswar Padhi wrote:
> The previous TI K2G and K3 architectures were tightly coupled systems in
> terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
> were sent to a single sec proxy thread terminating at the core running
> Safety service (DM). In K2G systems, DM handled both Safety & Security
> requests by itself. Whereas in K3 systems, DM serviced the Safety
> requests itself, and forwarded the Security requests to core running
> Security service (TIFS) on the HLOS's behalf. This posed various
> limitations:
>    a. Increased latency: An extra forwarding hop through DM adds latency
>       in requests and responses.
>    b. Freedom From Interference (FFI) concerns: Having Safety service
>       proxy Security's requests (& vice versa) undermines the isolation
>       and FFI of the system.
>    c. Potential Deadlock Scenario: Forwarding messages between Safety
>       and Security cores can result in a deadlock if there are circular
>       dependencies.
> 
> To eliminate all the above limitations, the TI TDA54 class of SoCs
> introduce an architectural change: Isolation of Security and Safety
> services. To realize this enhanced isolation in hardware, two
> independent sec proxy threads are now provided for HLOS to communicate
> separately with the Security and Safety cores respectively. And the
> TI-SCI message forwarding has been eliminated in Software. The System
> Firmware ABI5.0 version necessitates this improved isolation and FFI
> change.

I don't get at all how above description helps to understand this patch
and this new compatible, except that this is not compatible with old
variants. So 30 lines of text instead of 3?

> 
> Add the compatible string for TI TDA54 SoC PDM system controller to
> support ABI5.0 communication protocol.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Note: This patch is independent and can be applied directly.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
>  .../bindings/arm/keystone/ti,sci.yaml         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 67acce8a559a1..f0548382f7d52 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -20,6 +20,11 @@ description: |
>    initialized early into boot process and provides services to Operating Systems
>    on multiple processors including ones running Linux.
>  
> +  The TI TDA54 SoC, however, has two independent system controller instances - a
> +  PDM (Power and Device Management) system controller, which handles Power,
> +  Device, Clock, and Reset Management, and a separate SMS (Security Management
> +  Subsystem) system controller, which handles security services.
> +
>    See https://software-dl.ti.com/tisci/esd/latest/index.html for protocol definition.
>  
>    The TI-SCI node describes the Texas Instrument's System Controller entity node.
> @@ -40,6 +45,10 @@ properties:
>        - description: System controller on TI AM654 SoC
>          items:
>            - const: ti,am654-sci
> +      - description: |
> +          System controller for Power and Device Management on TI TDA54 SoC

That's redundant, you just repeated the compatible.

> +        items:
> +          - const: ti,tda54-sci-pdm

Why it cannot be enum with existing entry(ies)?

>  
>    reg-names:
>      description: |
> @@ -135,3 +144,27 @@ examples:
>          #reset-cells = <2>;
>        };
>      };
> +
> +  - |
> +    pdm: system-controller {

No need for new example which is the same.

Best regards,
Krzysztof

