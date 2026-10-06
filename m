Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CEE4A0922;
	Tue,  6 Oct 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301853; cv=none; b=SCiFFuzN1Ms0heSLwxRKPI9n+SXrUUEC9s01fPfulfIGkAgjibRRCrEmy9ykc1itP9EsGmzMlM7em0ajZ3ateIqRHvZ18tnXMfHuFRwXrW4gkAc6+qcUp0PLeqadRRlazmwuhd2Fqa3AACb1L1V15tVEz0liyKAp5v5L2q1x7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301853; c=relaxed/simple;
	bh=c1wkDG6pOePZ8hvHTeq1O27bhHD7/Is4dLehtufHo5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FG34wffiqCGpOiV5+XXii6n5Q6Shstbn1nCv4X2tqkH1sf7fmwyDv8RcAfaDa2Xjaxx/nTO48dIDnVTVQd2IdjbboSEeRwcwYRNPT18J7ibjg4VHsGviCt/jC1MqjDUJ8NJjW0UR7OY5iJF1PvPPl7PXlHdprKJLk77zmuXhGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUb9HEha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUb9HEha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523C11F0089D;
	Tue,  6 Oct 2026 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301840;
	bh=qOznVsW/CgzBqrcV7ubmPIMOIznMySiNCenyt8YgpnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lUb9HEhawLT8PJdApbWGXis8LFdZgIekSHddlkgnmkoye75YtvaxqflsfNjU/J88L
	 w8R1RDyZ+KfKocPYaPCrmPSrz357MxEjRgXCxuoDsPnP6KKnzE5cYO3h4fB5Wxeiwz
	 e5NSjdFgofoH9o3zdKY5oohH/oIC8N7gaYa503uSJlLAFNlNpRethewJ6j6FETMmSK
	 aReKhSLuZzSSKuP4m8slu84oPUm5Q8ErroIBkEK3haJ6N7rjj/aAn4dVQoEVtpHUJm
	 cwcVOktbjHp/KQfKwm5I599cCL2Mha8hnfZ5E8pqCaYHGOzb7Hs9ioSM+DYXU3jd7n
	 nAagQ13f8lKiA==
Date: Tue, 6 Oct 2026 10:50:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Message-ID: <179130183923.2392435.12092250762481422037.robh@kernel.org>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>


On Tue, 29 Sep 2026 15:18:06 +0530, Hardeep Sharma wrote:
> The QUP wrapper maps its serial engines 1:1 into the parent bus. On
> 64-bit Qualcomm SoCs that bus uses two address and size cells, but on
> 32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
> forces those SoCs to spell out an explicit ranges property instead of
> the plain empty "ranges;" which dtc only accepts when the child and
> parent cell counts match.
> 
> Allow either one or two cells so the wrapper can follow its parent bus.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

