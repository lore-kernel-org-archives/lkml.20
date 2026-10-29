Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267734;
	b=fy2g1YoL+tSLsVtA/oV7CS3rhLk3zUuJQImPPeDChwAJ+M8F0vqGNfE54Ew42JU4h01I
	 rQwd+Hyw9WCoHi43kp195OeyY0s+GwZ9dh3XlHOgyHonzvMB/yTi3/4RRqcieA9oj5sJQ
	 b9HKprMQvwMps7r67mUz0IhFHqv4pHKv8FUT9fb972X/SctSuM/+35wKmPrtyza8W6kxd
	 3ppzCeV9oaIaIayEaogXCFyXKiBve1jtdYQvjf66tvRw8qDpGNXomuE4Bca6NLA6fkfye
	 RGm5jDJBFJ7G9e8CY17YwWnrxXrr+O0l/oaNWlQL+EcGVvDKgfMlvhAcI/W0sQ18uoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267734;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AhutDWkOWkSxo4qLK8XDA1UI/079xgog2oc9UuMcw0k=;
	b=VmkYawXvTnJk+tz0X2FxNiDGopuhfL7txs385p7CAjAdGPmugD83J8asQdR8QVFSBvgI
	 GJb+LR4jaKc1C7CYuItMUM/8EeldYJfib4JEAWlIMP8cQYJEBjWvC1bJuiF0xWSHR0xis
	 Nob3ZgmkrmZuuTpXyiSPwoVakLY0dJGLTKlcRsq3kxcxtjsFEU6IP4ZUe39cRxscMvmDc
	 JkbrDZlNvCxm9qBJ2Ek3UaiP2YxRdowUtAuJTiERNUoj9gtfszasf4f3mwoGdiXlxVEad
	 wfA+OL7gZV2o3JyAahvGMvN3KbMH0n0oEwADXl6P9J0DpifV+qmMv2+HwtVP2bRGioQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CcUm9jo7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F5F60A3802;
	Thu, 29 Oct 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CcUm9jo7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E521F031F5;
	Thu, 29 Oct 2026 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793267733;
	bh=AhutDWkOWkSxo4qLK8XDA1UI/079xgog2oc9UuMcw0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CcUm9jo7uNrWMbdj7omatprjnqc7pY7p5BW1zrNFoshqoPk2LRh9+PWFFwlBCiE2d
	 QJmgGqsB61TdQTHWBfJt1m1jbDyShwjL0w2n5GoPCItkmJHtP1FEnlVejX99eqFdEr
	 LFyl+YkwlJuABN2vJHQ581aQ1p95Jkcy2cb3DueQ=
Date: Thu, 29 Oct 2026 10:55:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
Message-ID: <2026102912-iguana-purposely-496d@gregkh>
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>
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
In-Reply-To: <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>

On Thu, Oct 29, 2026 at 12:40:06AM +0530, Faisal Hassan wrote:
> Hi all,
> 
> A gentle ping on this v2 when you get a chance.
> 
> It addresses the sashiko review comments on v1: a linearized request is
> now unmapped before its bounce buffer is freed, and an allocation
> failure or a short SG list is returned from usb_ep_queue() instead of
> leaving the request stuck on pending_list.
> 
> Please let me know if you have any comments, or if you'd like me to
> change anything.

You seem to have missed the review comments on this patch:
	https://lore.kernel.org/r/sashiko-outbox-162302@kernel.org
