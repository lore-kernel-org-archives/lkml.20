Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169410;
	b=ZAjC//pXKcZ6i9VL8ADFAFPAlfvDPqrmple62CZe7i1pI/qNGbpYM6CnpjzYG4/2hKY5
	 yWl4AC1piel9KZmhZYZB0SGehGsntN3Y8BY6XnYJ/nRLcUQpa+F1rfhBh2Mvx2z9ld3FU
	 zvBAkHXNKbEbxPC4f7T3Ccjb9aV9hON39kFl0Lji537nP/krh5Q48gp9aTROKyWT8S71c
	 oJ9h85T5hedLapvZpez0aHpouaPyydykRd1BUA4tRzYd8eLgOfcpsB0hCnu5BR/PyPNtA
	 8CD2dqA71xDMcr7sOWVtobVGHP9KFpR7zqdMcqEUy0RL8lUxu56W4CfJWnqPDNiEduQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169410;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1dtWyhD7jwZKZFG5AGRcSW6g5SyHSgdWtbJuXnuJu0A=;
	b=tdo9P2NPj0FpW+3LqfiYCbJP3WgYH2SC5wE/QJeJjDJoGnAbfiChZWq4Jpthbe621cdF
	 KHQYYWBb4fGb6i+OkIwjyBcotRKfCSchaSN0AZg4eiW3JmrBSU+4jH7P4tm2IxTOd8ltV
	 FRiiNoQX15GRORcxg8ru6i+wML2Apqk71thPvAssE0lcwf6tpS5IGP8D5fbBr7Yi8Z9gq
	 /xc9krm4YYHgcnoLiqTSwNRIBq+wHOHokJvUlwxfdYAShqsAif8NkteTIIwsrPiJxPiZY
	 P6nAA4DOBhiLTyujvqAVKARLnpguZ4qB3czqlKDTod0EtRtC+U808efrl/bg7uKQAuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hup9f5vz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ABE6071630;
	Sun,  8 Nov 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hup9f5vz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B21C1F008BE;
	Sun,  8 Nov 2026 20:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169409;
	bh=1dtWyhD7jwZKZFG5AGRcSW6g5SyHSgdWtbJuXnuJu0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hup9f5vzJANYZxWKk2z1XOYjN/I6tNFz4AtFtfySO4N7Ino1xcI4DIiHYzGCZVXgF
	 QETxiJHpuvvvpCASBLQiepdQY5GxY8+WLHXkNxsbvDbEOcbLY9DxRiP2el0Z6FuhoI
	 sVE0ISYFveLTXAKN5iVmO9ETql44rtBER8OJJEz1PtW+yUwa5NKp+W92y44OId5jmW
	 ArZr0ggFG1KhFJOHZy6fl3z/AI8LJUvu3Yq2I3V9KdrR57zE1RfXHqeZ00hCafxj+g
	 3In948WocHpQ4C8RtDURWNbqCFfWAGecHEtH1HyDQxy6fWMmBhrrA/4OuxM8FgBNdE
	 M9XflQaM+lxeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add support for reporting boot status on Qualcomm IPQ9574 and IPQ5332
Date: Sun,  8 Nov 2026 14:20:14 -0600
Message-ID: <179416929436.628393.11004902662518300994.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 Oct 2026 22:16:15 +0530, Kathiravan Thirumoorthy wrote:
> Similar to IPQ5424, add the IMEM node and the restart-reason child node
> on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Applied, thanks!

[1/3] dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      commit: dbec23d260c9db8bad6537ecf6aea40c475f5352

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
