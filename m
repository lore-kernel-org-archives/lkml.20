Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606852;
	b=qaQsLr8pCoywzSuiNiLU+nN8bktyUcXY1rVDriIuF1TOEgT2AZPLhFkWuLmP8Iks6ECw
	 Ce+Liv1cEtiejv/IXz83HZAjOFPndLZ+ClrWRm0waEcm3HhhpzLB0r3Y7cq29P6kqNhx5
	 p/hANe5gZkcac0WFK/y5vH50g2FL3H3v33TQdIGWu5pXdJUfidJfYJ+5XbPuxMiJ8weQY
	 5E0MnEsz7HY+1+6DvKsgfABOfnXL3eycbhgUFIxASIpalC5Xhl/kG5fyMZIe4/qy+DwE4
	 d3tBXTA70QQQBFVPxg/2zNMB9Oatih0ce7LEgB5Ssfg3cJ/5n91+6VZNSd5cP5UTGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606852;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/oj58aKuyaZti8escs/8mFarr+HxJQY84PpH6RXuizE=;
	b=uN4tHsEUehY9fH/DZYADGvsb4dJGEPBX68Fu4cVE8CIM1rc3Gut6LQqIMAmen8KEI4rs
	 llv0S6iJByyYIhJ8pDf+F2X+392ufxENf5b1+jgGiiT863ZlhUDmtL9OyUYEmbPMjRPKP
	 mxrKn7bqCSEtBA/Cwxktj8tYnZjGCrYpo6CPp6v2h4tTHdOCCljaCx4B2bqNBH7kYPfKn
	 ff425Bep3LfL7OSDsBFhlDzxuwBLeL84VDvuyDa5bK5tVvYY2vyA3MvdmPcUbal7sO93l
	 UHunbh0xu22YbWRepCvZATxDnEq5HKi23K9p8nPTw/w0FoUKlJbfYs4lHOH8Os0jmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5CVRA5t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AEA606A33E;
	Mon,  2 Nov 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5CVRA5t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099A41F00919;
	Mon,  2 Nov 2026 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793606851;
	bh=/oj58aKuyaZti8escs/8mFarr+HxJQY84PpH6RXuizE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5CVRA5tcXaqn690dE6geuoIl+Rlg7k6dtlDFCc2pBzxpH1DHhW4oIGFG15wkhYuL
	 A4UrnnGVvApaq2vxA3BwXX1TBQz6AErBQbypX4JGj6YwGDX8XeFmBH+aO2qqgm6GiN
	 D0Bn85HwarK441u302S8ururC7hlyHpsg6wt1CqEc4B/CVvVMkIAgX5/Ybiz8Vuxh8
	 VbC/arQzqIAg2MnZPuFpAs/6RQXKTpXPbCz6xOBm/YwS74nXPJWQdUXsvdiFVAKNAK
	 DZUmreXQilQNmt3b0iDwS9k69d8gNDIopGNO6UvEKn0CpoxVKJ9eYYecdnuaTnZPD7
	 yAA9yFG0R+ltw==
Date: Mon, 2 Nov 2026 09:07:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: snps,dwc3: tighten the
 two-connector shared HS bus
Message-ID: <20261102-armored-arcane-serval-43faf4@quoll>
References: <179359806935.413510.7108025505776923330@mail.ustc.edu.cn>
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
In-Reply-To: <179359806935.413510.7108025505776923330@mail.ustc.edu.cn>

On Mon, Nov 02, 2026 at 01:41:09PM +0800, Qianhui Xu wrote:
> Resending only 1/2 of this series.
> 
> The earlier post of this patch (Message-ID
> <20261031150154.1106455-2-xiaqinghuan@mail.ustc.edu.cn>, 0/2 cover
> <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>, 2026-10-31) used the
> wrong device-tree list address: it was sent to
> linux-devicetree@vger.kernel.org, which vger rejects with
> 
>   550 5.1.1 <linux-devicetree@vger.kernel.org>: Recipient address rejected:
>   User unknown in virtual alias table
> 
> so it never reached devicetree@vger.kernel.org.  The patch text below is
> unchanged, byte for byte, and is the same text as in the 0/2 cover.  The
> sibling 2/2 went to linux-usb and linux-arm-msm and is archived there; this
> resend is only about putting 1/2 into the devicetree archive.  The subject is
> kept as "[PATCH v5 1/2]" so it still lines up with that cover.
> 
> AI-assistance disclosure: this patch is drafted with an AI assistant and
> edited by me; the author reviewed, built and tested it, and the content and
> the measurements are the author's own.

I don't see how any of above is useful in git log.

Anyway, this is misthreaded - missing rest of patchset. Please read
submitting patches document and switch to b4 for sending your
contributions.

Best regards,
Krzysztof

