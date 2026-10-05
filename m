Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AA36A01A;
	Mon,  5 Oct 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207012; cv=none; b=FZQiCQCwkpnsV42BFLqgHepa7zBdsDkVyDyskBwwbD2A1vuKGBaac89yCmDkzdxG36yOpHHTf1MXM5N1T8uteb0PBmruwJmwwVUYKNirz1kWk5WOncVDizC1qdL0wMQU4PqnQooCUdSeM40+2qauHHCkCHbaKKlPmadXsoTuZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207012; c=relaxed/simple;
	bh=nKQXyt8mL2/HrB+QU6v3tRnauuz7m58NFLoQkIX8e+4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mx36PqF5uRsvTBIDiTuMIoP7kRcjQ/WOqreTqSHqEBg+O41fr2Xc0fl0HYHFX9khjCIt2a29xn8MJcIdLiwW4hKF5A7G7cEHdbxechuBoZF+oxoSljIcjvTqea93v70VU5bjgrmYShmImOm/z9eiuAZOZlCVx1aycUgRQfQuHk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqjsvYH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqjsvYH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160CB1F00898;
	Mon,  5 Oct 2026 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207008;
	bh=bvPHzI8oXEK1bkbrOLYfzpBDQ8RbFS8d/wha52PmQVQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=VqjsvYH5ioXhhbf8hk89R6AIMdwAE2JKbRJ8tclwFbPIMPPTi+BcmUkA0Mov4ZhK1
	 rcuzm+jUNCwlXDf6pMn3X6mGTmkZXEBvViy3739Uil0wJO0A3W3vuzu8eb+c9tf0hV
	 yjYXuXlxJ7wkxXilSZG2Aqt5lW+fDJzd0BolXkxUNBZdSJ3CQWbNURwxRtQfMKIeIF
	 UiQEfNrD/tpDaHi/DdhqrhMYIYUvVzGXm7gM56YKmME48hSftX9onENKrlMAieiWs2
	 xYV9DerHxdqq0RGxrC3ceXDEYusxIXTmgZSasxQt1MjrCznKCPUSB8NHLfzNmse216
	 dKrjzyN0BrwSw==
Date: Mon, 05 Oct 2026 08:30:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
In-Reply-To: <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
 <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
Message-Id: <179120692532.84799.797022927171285613.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: bus: Add binding for Altera AXI
 Timeout Bridge


On Sat, 03 Oct 2026 20:19:19 +0000, Vyacheslav Yurkov wrote:
> Add a device tree binding for the Altera timeout bridge, which connects
> an Avalon bus to the HPS and provides an address space for child
> devices with a fall back to a simple bus.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/bus/altera-timeout-bridge.yaml        | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/bus/altera-timeout-bridge.example.dtb: /example-0/timeout_bridge_hps@10000/timeout-device@100: failed to match any schema with compatible: ['timeout-device']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

