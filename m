Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0897251812F;
	Fri, 18 Sep 2026 16:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750199; cv=none; b=qBIQRqM4xGrB8LYB65YOYS5rbS/9cto6qvSnXdFCEnoBaospZKFO1xFg7FZ94ZIss7JBVHrYUwaM5Z7KOIFacarNTLTJjPDf/lBJttbType3c+G1l0haPoPtxWwluMvIwtBeU48+vlanyRXOV4FhUztrkrCanaAQy79lUMR4kvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750199; c=relaxed/simple;
	bh=rNBGQU7AszV5BAwL1c12oEllfI35E9uMnuKrNgrhfKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUBHBzt7sFdMxRU9QhVUBqqX4dyQXAhTcoPCroVdMmPLbY1R078cKUjQF2wJFKvZyRhsyRbqXWQLjtuFxzN7ziPyQkW3CsfhHvDZd0ROIK5IxoJmHQuWDc+rMNpm9zfhplDTEtrkHKpHfAfdUVJlcGkZVKd4kC7bw18YY42lwUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARH+iPpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARH+iPpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AE71F000FF;
	Fri, 18 Sep 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750197;
	bh=Fluh5yS9+7yKj/7XUv8W4sSCve4jWOnqFlBa96EHvGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ARH+iPpY4RgoXo+iSq1LrQRSK28pS3t9C5aOO8sC1BLM+RCgzsl7eqXGyCUjNHCPd
	 3ovidnXxpcJzZlHn6sV//wc7yKtB45u6Z7CK33te/v1lajNlwJAHBIrzDsib0NNnQi
	 X8pnRuIq/VmXIl12htCPxx6di2KO9wfFjZt0luJvVJnjcBR6Xd3o07ywQ/7b16Zw2/
	 H2xqaRsVljLmrYNHNoYcTmoOBYXAqLY00RHWezAB8tjm00/s47jJ/PiMOmfB4r+zUU
	 LvmlMjgAAIEpKckvWB2h+HknVQkAcUOk3utZfSuL1kbKQYwlfGQXD7IpuS9ukmKpF9
	 PEDGzHeGrKP5g==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	Pierre Gondois <pierre.gondois@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: fvp: Add missing properties
Date: Fri, 18 Sep 2026 17:49:47 +0100
Message-ID: <178975014449.1809739.1787827854019049791.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 17:58:50 +0200, Pierre Gondois wrote:
> In order to align the Device-tree description with the ACPI description
> currently available in the edk2-platforms repository:
> - repo: https://github.com/tianocore/edk2-platforms/
> - at: Platform/ARM/VExpressPkg/ConfigurationManager/ConfigurationManagerDxe
> Add some missing properties to the Device-tree description
> of the FVP RevC.
> 
> [...]

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/3] arm64: dts: fvp: Add cpu-map property
      https://git.kernel.org/sudeep.holla/c/54087b4bac55
[2/3] arm64: dts: fvp: Add EL2 Generic watchdog
      https://git.kernel.org/sudeep.holla/c/4fcea5b932ce
[3/3] arm64: dts: fvp: Add additional PCIe memory region
      https://git.kernel.org/sudeep.holla/c/d8e88ad6f769
-- 
Regards,
Sudeep

