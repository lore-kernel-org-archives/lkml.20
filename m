Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823837;
	b=LQAf/EEJbgjgS4yQdkpqxBq1orLfISDp6+lCujHERxHMWMxMcYvqX0Iki5bwYyXAIr+d
	 TwlMgnZ1TObR+x4b2gwLrCZ/NBjvNa0tlyAt/Vgt5jxJ+QLQ3ZHIsNJH9uQ8l3VkIJM+m
	 NRkOTEPJUfRTcR3CiEuBaUWwPnQ4DWmWsEWU4cdPIG/PzrMx0tT+yA3wyoQGkRNXnkYIy
	 Zu8dYO4lCghU17SZuwyYVVGyQGuUOZUexpxIl5z+OdokP03guxHh9swB+FE4OpAzyjsmF
	 RM+m5BfaUINJ5vr6tRIuvCijyjqbli9/ZGKa38T3H1UUprRuJEqB3HeVv9nmUOzsieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823837;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=fkWCz/8JupYMan3nETw3vXIG95rQOXH/T65s9KBE3Sg=;
	b=XZh7L3iJtyyqGO4uapSLRjXnO0BNUWmRB6eS4TIj/jvU1tC/+jIMCdYsroFAItIpl1MP
	 b09MIP6LHJbYARMinGpDM73PEBcOIUPKELDmSsj6I0wdPkbip+04z7QwUi7hKKqVl8cOc
	 kZTI0FuQS+26jPM9QN8QU9wjlvZVU3VnpbBAdoZC4cTaH4gOxQvCZKPC9hwSXLtWG2vbx
	 jIB+37qP5jyk7ItQyp4jcc1wieCUpWCPQheurTO0/keuUH0HXQvV2Zwq7Ji2rmcsv76h4
	 3NY+XMt16Cr+POs/zpslvgeq+1N1uZtGDiT82+Xh5kPBzh6sgXjLbPQHIvpSCuLtsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EozP57ou;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6004606A32A;
	Mon, 16 Nov 2026 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EozP57ou
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607351F000C4;
	Mon, 16 Nov 2026 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823837;
	bh=fkWCz/8JupYMan3nETw3vXIG95rQOXH/T65s9KBE3Sg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EozP57ourVAjGji3+BoIddbIMHSGeDTda6i1rwnwM+tTYVDc6qqwSLBOAoAkLqI6H
	 +8w9nP2fRx/gVZ4+jH0cywGxlltGZwSKd7ftgOjswJ19omkFwikljg945b+GNa2ZzO
	 V4muu/W4wYLe344a8//BtLqjaUoUVS9NCf99yyGogFDlDWDZdoe3zZiEus/JcV8D22
	 E7vwtsYOOqzC9il5JySUp8EZ/Yk1lkzbwqGX+mqVLKDthjgRwV6jtA6AwRT1Vzy9Y1
	 1gnoHVYlQ0s41oyJFELbxcoXv9MqGkSrSgJ0Nn2r1TT7tnUzJg4ptT19HZrQhtxZrj
	 nhD/3yhyjsjQA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com, 
 quic_bkumar@quicinc.com, quic_chennak@quicinc.com
In-Reply-To: <20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com>
References: <20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com>
Subject: Re: [PATCH] misc: fastrpc: map ADSP remote heap into remoteproc
 IOMMU domain
Message-Id: <179482383503.16873.4208702948702896080.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 10:10:35 +0000
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 18 Jun 2026 15:21:21 +0530, Anandu Krishnan E wrote:
> On KVM-based targets the kernel runs at EL2 without a separate
> hypervisor to manage inter-VM memory access control.  In this
> configuration the remoteproc is assigned its own IOMMU domain, and
> any memory carveout the DSP must access requires an explicit mapping
> into that domain before the DSP can reach it.
> 
> The existing code calls qcom_scm_assign_mem() to transfer ownership
> of the ADSP remote heap carveout from HLOS to the DSP VM.  This SCM
> call is only meaningful when a separate hypervisor (e.g. Gunyah) is
> present to enforce inter-VM memory access control.  On KVM-based
> targets no such hypervisor exists, so the carveout must instead be
> mapped into the remoteproc's IOMMU domain via an identity mapping
> (IOVA == PA) using iommu_map().  Without this mapping the DSP
> triggers an SMMU translation fault when accessing the remote heap
> during audio PD static process creation.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: map ADSP remote heap into remoteproc IOMMU domain
      commit: f914df45c32280850dd7aaaaacb1b356087e5a09

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

