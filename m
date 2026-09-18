Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874043B27F1;
	Fri, 18 Sep 2026 22:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769610; cv=none; b=dd9RXyADJb1Ic2dwd3zmw6qlAig9CgUuC4hzO2unqyf5gcuLF0FYQLjdKL4W5xxb5scrrd1JIsbwxXLx1smDmsrpGPuK+7lHAO3Q4pkukB8caqiRtqlRxr92sKZkYO04v4FIoRfjNIuFwcQWP1+MCSLl1luoAnir269svWkFgUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769610; c=relaxed/simple;
	bh=zBXd4TKDras42gctQU7U8CYX3JEpoFsefoaB4PHVu88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CODftDW9xujsemb+nsfCOL1GXPupfohdnWfYx/HqDze4kfecUeogiDvcNKyJk7pmXJfEEVdXlmfJAOCfKfJw0MbvKb/nzNT9sPmr8lgsBly4o6D+we+7f9q2LFPYaKBuYJYy1t6ZLMmuiFgmA8dWe/impw0lETOBUVnaL7wxCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtXBCBWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtXBCBWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80761F0089A;
	Fri, 18 Sep 2026 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769608;
	bh=FmVGECcYy6DdHTmC1GUg8Vz4fMPOLMt+dY6g/7FsAU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtXBCBWmr16wPVDrK/fWUZblVkktDzqk2ed2tTKSpREmg1gCxeQDD7TbPr0uyS1z1
	 O6ZTQv/HYJZgTCrczIqSPNQURf6iSJvQBaCKBQAtOA8LF0tEOoUQemHL704DcVNXzG
	 DKN/D5Zcx+naOpGYvVWl5UdTL0qkoIuc2ZbTehrvNfq6Io+Pds7KJJD+X3pFr4Eoiu
	 KWA8NzOm0l2/X55xlB9GgU+id26OGLQC5NHGjTj1kYGLeyevgqXSOoavu6Qg+6RBsM
	 xoHYJnBhPqoY+HwwLmCvQLJt1GKiIqN6EtpeVqX85DHa8mc+5OyVP7WY5blt/tymGN
	 WoHREbYS/j+AA==
Date: Fri, 18 Sep 2026 17:13:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shaunak Datar <shaunakkdatar@gmail.com>
Cc: lee@kernel.org, ldewangan@nvidia.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: mfd: as3722: Convert to DT schema
Message-ID: <178976960588.2470978.5377150781222202766.robh@kernel.org>
References: <20260914174440.104115-1-shaunakkdatar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914174440.104115-1-shaunakkdatar@gmail.com>


On Mon, 14 Sep 2026 23:14:40 +0530, Shaunak Datar wrote:
> Convert the AS3722 PMIC binding from the text format to YAML Schema to
> enable DT Schema validation.
> 
> Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
> ---
>  .../devicetree/bindings/mfd/ams,as3722.yaml   | 230 ++++++++++++++++++
>  .../devicetree/bindings/mfd/as3722.txt        | 214 ----------------
>  2 files changed, 230 insertions(+), 214 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ams,as3722.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/as3722.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

