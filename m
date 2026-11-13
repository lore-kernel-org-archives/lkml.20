Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557789;
	b=3yeL6IkPasBmz1dQkFCU2btHOyW5uASHORTfcz/yc70ssJS63M9W7wAhxLSAcqwjZV1P
	 EqVjx3/tItkDF/H6nb+sl/cFZZRBYOzTyKZjSr1qZdGaoTwj7E0Rh6XPYyNunlUciTsqr
	 vDRlFcgn0RkljhsjUHB92VIaDLrZKYBRo74oeuFM8aWVgh4h9xpvXsuaysMPOzS7OdRsw
	 8krj6fQSBL+ScLSEo8JSKqW47y1xiuFZoOSWDlANsiAOitDGeMriWg9vsD5P2z4mv832b
	 MtZMzK8IL6wog6CEuejjcqL3L54UsuBUCbItOSULB9u/SdZZkVZ7MqzhjVjr+UkZLhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557789;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4glu3x+tAhEPalsruyc5KViBR3uz1/1KbqNK0sIATxc=;
	b=CpReALonRc0QDb6cCNH8v3KMXkS1hqMuCnA7Vg7nt+LsBaFZQJGBvxgKG4b2AT4JUZnj
	 2I9pcNZNvUbL7mtqs9/+bgJ7xLqPm40rZxQs4t33insgQ6DnoFYmjXdk2A4leL6uUDEo1
	 qJIJtbj1hVSvGk8iNVUaYQhdawnUWUyT15HRB2UdDDWKEJOiaz0dtKQqK9n2qmYQggk9I
	 Kv7U5U4ggyAeca2kCQ1V3hSYAaEtGIefCne5yvqsgzlC0hnj7Y1jmtNaVeqH070I6PF8p
	 qZW5ryuYcQ84lKeWa7+zvRiAGoGRQqK3vuaBpwVZFRwbUR5lQJPJs2eGeGciYrfKIAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CV2LlrrQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34664606A31C;
	Fri, 13 Nov 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CV2LlrrQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5791F000C4;
	Fri, 13 Nov 2026 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794557788;
	bh=4glu3x+tAhEPalsruyc5KViBR3uz1/1KbqNK0sIATxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CV2LlrrQQfwZPhTWvrutdXH6o/6h/jf/MMM009acdFub3bb8DR3UQlCYyf4QTDpgo
	 N48oLnwuCj8tLYAj5tzSJxMhamCIqBhZ8QOfaARcX+sKPqmZY/T/8mfBaOl0iZW6l0
	 xe7PnlzeVdZW2ou1/L59IQ099jLcTPqzC6QHovFDdsAgBmeolG3XNSqjb39SeyQeMO
	 k2jGmuDNXLwyy/nHRbzImKkU/BeOcmTSrhcXTQjYyQQLOuM1DVgi5Rc5CINSGY+UDk
	 6OhVvPdQXOrQxwVVnW8UIDi/yL/SwP+0PCG0u59c3W9NTEnJ+Dufa2gWqWCN+OLKvZ
	 qg5o6GhqqoUPg==
Date: Fri, 13 Nov 2026 09:16:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, heikki.krogerus@linux.intel.com, abel.vesa@oss.qualcomm.com, 
	abelvesa@kernel.org, wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org, 
	val@packett.cool, balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com, 
	effeffe99@gmail.com, prashanth.k@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Message-ID: <20261113-gigantic-vague-harrier-1cc952@quoll>
References: <20261112113838.506-1-26rote@gmail.com>
 <20261112113838.506-2-26rote@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112113838.506-2-26rote@gmail.com>

On Thu, Nov 12, 2026 at 08:38:37PM +0900, Joonhoe Kim wrote:
> The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> DisplayPort pin assignment gives it all four lanes for DisplayPort,
> while the controller can keep running its USB 2.0 port. The controller
> has to move to the UTMI clock before that happens, so it needs to know
> the Type-C mode. It does not route any signals itself.
> 
> The Type-C class passes the mode only to graph nodes that have the
> "mode-switch" property, so allow it on the controller node through
> usb-switch.yaml. Orientation and retimer switching do not apply to the
> controller.
> 
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

