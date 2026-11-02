Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624501;
	b=Zib/Td/Fqe0lLeyOUMr9bs1yGH79r1cmabV91iOnVxhg3VPSMvZ4asOe/Wg2WSx1y7jO
	 pAz/rmPyXggLFYiDBnQS+PJGA0dKzooNiuVrOeskSygn+8txC/oak1yljFeAyIjHSZ8ry
	 Nj2kZnU1We6QS0x/lw2lVmrioMC3s5YsFH+myBbkP6ohWWNp4rsih2fI3L0RkITgCObFW
	 BiamVqvqYfwWx92BstSBTx+L3kzkBBaQOnLnC2jlqzF0kuYM88UwkJsGZ/i7Aj7Xz5IzH
	 YGV5pFDGqsu7zRT1zd8zH7AaRcX0kvImlkLVqdL4gKRuB+8UE1OK49TRhXk6/eecOIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624501;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uNDILjA423ZBNGp2ol7/8zi7jJMR4YhZA191jSFJ2Og=;
	b=pPpumKfVDAfPktK92zuIzrF1b2QcbwFZDE6QUVws3z8h20W4JrWUaHho6J8uonhgS6sL
	 x/+B19mDus0sjMEAbTqSMlLM5j9yGMKto4yN3K7Q01Inxn5XkGkoqBRUq0a97Xy0oa9t1
	 cQ/YEPdoRrnordABoUznXDryAvOVbG+k7x583iZI54OhiaFjuTxfZY2FU8xNsmVCf4JRF
	 JcJjo//FRTVIWW8ftOZYc37sHYKNhgcUTLFqdI4SQQeY3M5HGJmW+aeOQVptWt2JJkhX9
	 tBUcLHA6vrwdS83xHrMVStlTKPlLYa1H94yWJPUk243cGXD4zKp+jPE/9Te122OMtQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vv9D59kp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE541606A327;
	Mon,  2 Nov 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vv9D59kp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864A61F00A16;
	Mon,  2 Nov 2026 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624500;
	bh=uNDILjA423ZBNGp2ol7/8zi7jJMR4YhZA191jSFJ2Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vv9D59kpaTbTZGLu/kRooSchcb1Jx5/XYBbPtSm/ERYmPFnJqe48UvRhBci5kid+c
	 pSApOeyIQB+tVGvJsbHUrewxVoikpZkMruGonVYvSWt9b8aEi8jmrVwgCLTHP7Ro+s
	 q9PdM48cec5FtVprybOe8nVOqc++k77XdrZdlQUOd+Jsow6dQbqkRStMtba/kYblLS
	 LF+ilJNMnUPwbKO3w2S+v2KdoGBnF0GNQbaXEkIVEkUETn4V+8cHAhaxdW8vPNmSek
	 UA+RFtTmjAZO8b6AYPUC6m+OFzFFSHvwq4EsRdDPLvwy7SeqH7VzCS/vW/DiRLEsPA
	 L8TXsoBy0DDXA==
Date: Mon, 2 Nov 2026 14:01:33 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, Anandu Krishnan E <anandu.e@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <uq5ttclbqpqprbckugxlkvzxesmzs7yjmlsnpbc2yajdqqzbb5@yra7tx6y6rzo>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 02:39:45PM +0800, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> It has a dependency on the commit e484a765f543
> ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index") from
> Ulf's immutable branch below.
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> 

Hi Bjorn!

Turns out there's no need to resend it, it still applies on top of
v7.4-rc1. We'd really appreciated it if you could queue it in linux-next
soon to make it easier for the rest of the nord changes to be respun for
this cycle.

Thanks,
Bartosz
