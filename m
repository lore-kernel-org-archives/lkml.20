Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313638;
	b=Q68WDPceQqaLQJdXKYeYl69l1XvUAia0m1YwJUzr8aP+fFcVqUde1Zk6jkcIa2pd+lUX
	 OmvKyMQW69rIjsM0u0jZkohPhLbF7Kg1qKsQL8zYI4K0zi5Wx6nhcT1wyxy+7gsLUZYJ6
	 ZqVMFgRnbPuazRI8IOViX8CmwWLaf3CZSibPv6pBF8iXfk1nJlDtE0fc9OioGjN7eQaAp
	 a+5TJzl++S1uUP1mK04uGcswjP1BU5PBNr2tZbUyeuVeFza1c4lMc332/VDzPjQlIiZO+
	 yt5ofKdh75ECvBfij8dnqHGs9DpX7y0yYcqAIUPkHFoM7PQFpydbb17wBeGxOYxydzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313638;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=P1TOwjSBpVmzlTpkye1A7TaQqrxpcgA/ZVUQvzoOveg=;
	b=YIUmAm02dFSxkX83i2ccXxYmodZFNjqVqOlLk9OdsvGhNaqcqXOhr4nBXoqyBgP1FYdm
	 qVphkFuNZbIDx/zRfc7E8xKjz57rAcW0V30k8SZQkd+fKaXdNtQpvFZQdRgdEZOJIG1JA
	 6XqINk8o3YSfPgAdykHIgSBybEJrtpWXJtnvpPBNbsPSzZYLjrAlyhPUsBGO/JGWby9hS
	 2LBiN0vFNfNdF1+DyHJxbxNr53oWKWgRGo9OzgFpkZtWlsmf89nakZ4CCQfdqsHEGN4ez
	 j7bISSD/FzJiQMc1Hpu2aAmGIVVKmWZ7WjL23Pol93OxQlDHIH16J0vu2ezy1Gcc30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gWyhvU4i;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FCA606A321;
	Tue, 10 Nov 2026 12:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FCA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gWyhvU4i
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C16B1F8;
	Tue, 10 Nov 2026 13:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794313493;
	bh=Q/ns5vfPB5rYk/V3wlThFVH2cm+bdatbrKGfy+X0PNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWyhvU4i8ZaMmE1PcuBmx2DLRuRjkFyzrDm8qlkQwbjnYOcowt0A6hVCf8K7yPyO+
	 PmGaq/RcEcqJBp6q/HBCwRVXezPl7xcEK7eOd74MS5JN4texxd9OUY3f6B0GZt7p9h
	 OMryMC/bJYlDgYkBSNCE4/Lxrwf3Manearl3b4QY=
Date: Tue, 10 Nov 2026 14:27:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
Message-ID: <20261110122714.GA3809@killaraus.ideasonboard.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
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
In-Reply-To: <179430684554.3011466.3431045638041318447@iscas.ac.cn>

On Tue, Nov 10, 2026 at 10:34:05AM -0000, Wentao Liang wrote:
> Hi Jeff,
> 
> I'm sorry for taking so long to reply and for the confusion and extra
> work caused by sending patches from a shared address and failing to
> follow up on review feedback.
> 
> To keep the existing discussions clear, I'll continue to reply from
> vulab@iscas.ac.cn under my own name in the threads for patches I
> submitted. I will not send any new patches or revisions.
> 
> For context on this submission, static analysis flagged the candidate,
> and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
> preparing the fix.

What is your core motivation for doing this ? I understand how someone
would start contributing to the kernel to fix issues they experience, or
to learn about operating systems, or for the fun of tinkering, but none
of that seems to apply to this flood of patches. What's your reason ?

> Again, I'm sorry for the confusion and the extra work this caused.
> 
> Wentao

-- 
Regards,

Laurent Pinchart
