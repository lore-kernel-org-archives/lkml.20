Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636164;
	b=A7tCWCjjzlS9WRYfRK+EiFY/g54uBQknE7zdbyoW4TkpbNDpSbvGGdhvs2YHXv+thxqY
	 6fu5ntvRk3rtsg6c3Ifh6xARUSnHcOR7k+xF0P9nyC8qGhdrGY8FAVhYXe6RIgNjt+u4Y
	 T7fVkgUSu6IPVcuf6ZbVg7nGL0aL1LCpV+QAfoy36A/VaBO0Bo/LQAMcaSmYDWxd6mAy0
	 PkPkGdKTnBzPnst/ru74IUjr9D3sR1zgPY8r02L58HWdFrUhEZv8n3EBJLyuC1Wir6Lu6
	 9i0ZrBIaLt2f4cV2+HFUyqVmxF3e2lNs+/c8+RPo3O5tr4lZxHYiXsNSG0Lpixii2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636164;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=FSQS9O8mpAsPeW86pVBIvdj87OSEblfkP36UkWEi9KU=;
	b=U2w22GUvrdgaCZuCdCV+xYg7RBRhST5fBPvCL9bcdH0BVVX5bRSvgo3YgS++BH81mfQd
	 cOMwmgKjZHtm5I56mbu0zOmfBGqTNnhqR/FS1YWhKgnaTqP5SASy6DL5g3oFbGfDUydUd
	 hP5pFtwlW5pq1667oxq3ux8sWu0sNs0c4cTpozM3gmouP6kmegNGMwv10oycql5jwcW/B
	 ME6QSfQndJ18or4enBEQAd67a4nfy8Oef0h1+j1rPh3uih9FQvRu6bWV5FCmObkdRBqGb
	 Keuu7XOHPHz3kw9VS2L/2PJK9gvCW2RtkWu+7KfSG3lL/tbUtfXz5faD45vARDuqJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCccHqi9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D8606A319;
	Thu, 22 Oct 2026 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCccHqi9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD5D1F000C1;
	Thu, 22 Oct 2026 02:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792636164;
	bh=FSQS9O8mpAsPeW86pVBIvdj87OSEblfkP36UkWEi9KU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=dCccHqi9ScYC4HYWLwNalyKxzmm+XvtubgSxnMRdzq3pxqUP4CYFj5n3StHBYixX+
	 u6NXO6PLAQP0DnyADWatxmIyaYbWuJARU0lwAoLqY+Wgk6JGy85VZFrLKtM1n2HNtd
	 qUhwzkWfHteETqcvSMzBNRQOJ7PBmDlXnzagW+L0Z+GX77iVGhi2jiQrujP3GUASZC
	 /T+3UA5Z88mdMm6sX4c8Rjs9lkJ7kalXBrn5BPQl/mVXj3lzcpcXHT+UPDw1X9V7Qw
	 UGeuVNZds37dQQSrsSMqad+3yVUD+m7q4mJlvTFUWI2iDa+qLfCePhLES6uMlgUh3e
	 mHytvWup4DadQ==
Date: Wed, 21 Oct 2026 21:29:22 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
In-Reply-To: <20261021-feature-timeout-ip-v2-1-a037be089518@bruker.com>
References: <20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com>
 <20261021-feature-timeout-ip-v2-1-a037be089518@bruker.com>
Message-Id: <179263613504.745061.2093851751692286121.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: bus: Add Altera AXI Timeout Bridge


On Wed, 21 Oct 2026 19:56:23 +0000, Vyacheslav Yurkov wrote:
> The Altera AXI Timeout Bridge is an FPGA IP core placed between an AXI
> host, such as the HPS-to-FPGA bridge, and peripherals implemented in
> the FPGA fabric. It forwards transactions unchanged and monitors each
> one for completion. If a peripheral does not respond in time, the
> bridge terminates the transaction with an error response so that the
> host does not hang, raises an interrupt, and reports the address of
> the timed-out transaction in its control and status registers.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/bus/altr,axi-timeout-bridge-1.0.yaml  | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.example.dtb: /example-0/timeout-bridge@10000/timeout-device@100: failed to match any schema with compatible: ['timeout-device']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261021-feature-timeout-ip-v2-1-a037be089518@bruker.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

