Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055906;
	b=CctOTYR9I7yGq4kUU3vGuQzdU3y41rXB0eFEa7c6WmcGAk2JDxHAf1ThzeGWjpANwvht
	 PP3i35GGoyS8Lh4PfU1ZEjgD8R/NIjGckvKNWSHRbCvPakN2i7qe2Aj7nheRs+GlaURpp
	 qKamGvt/FTW6GgioESB9W4s9w1lnemgMtFomTeKogEgJ/JqybGSqfq49wcMZRCXfMSArq
	 RluVgyQm4ckcUg+JgDTAmc2ciSuiAk9Hj8o5zjzRLBtd0at70tjoHNXTYVU6KXrNInp6V
	 wGOElBLeCV7Bpnf8wcJbCRC2/SaoGruwfj0MV7xSzHXsu+i5n5rSAjHVwgWOWwGvw6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mS8o8LE6/P7UzDYNIS5DVu7f5ackztetuCI0LIcPVJM=;
	b=bKDyFDVQhOLJfDyi5AYLDB1psd3eGNQRMrVCAdTmb165fMRBtijFWrInujDUaPcR6Taj
	 /bAEGVCMb4dXv7jyB9xPR8e/6CAAZ7b390f+60wb/ll0VCS3faOAtuvFd763OiazLR+AA
	 hrD3IMRNTf844I46jqKhJMsr53qdSpAQP4hkRSzEZbArlHOq2kg2QRljmSdq58ouXIbN+
	 YtqZkbJXE7JOCYSoxABKA0LJ9Wxmmj9Afn9BG5uDESxCzTTt+ykQRDKnXu2OONhQy8ye3
	 xmlQTQtz4Ki3MUWDqluWMR4M3Fzc+rvSEDky1MgxBJLppt3p41ECvQWN5ywfyh9NcOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=sBzeQInx;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C4606A31B;
	Mon, 26 Oct 2026 23:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=sBzeQInx
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD8NJ6J04z1XM30g;
	Mon, 26 Oct 2026 23:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793055900; x=1795647901; bh=mS8o8LE6/P7UzDYNIS5DVu7f
	5ackztetuCI0LIcPVJM=; b=sBzeQInx8PZvDhu8NsER0CYGZkvuTLRrEXHT42BJ
	gZKm3LtXPTIggtiAJNalbsFDFo6KZL/dPcbgIJq3GVmHdEbqo7ijsF18hD0rSOkI
	b95crvdw54jp10BaWbu3fBaL7kQTkI2JVMKjlcR0G3sWNCLpnorx3HT/SP/DLdYV
	OzXcIR5VKo1wArVaPrG6Xhtcj6b631mFSvUwuFyHcI4fooFEROYx+wjg75F1X/1W
	9OSR6TQekBiHMhZ1dGMW+XmTQx+4yHOHckLgqU1ZrriHwiY8eWWbgfTFZzUG1HPm
	JFJVrOEzXffSthzNqkpNYcJFgCDF85jgtGAcOaRUt+4McQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tWaatCI9yzHm; Mon, 26 Oct 2026 23:05:00 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:d824:fc54:e646:594c] (unknown [104.135.182.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD8NB36pLz1XM4Tl;
	Mon, 26 Oct 2026 23:04:58 +0000 (UTC)
Message-ID: <78ae70dc-bbfc-462f-9c79-632b97543f7a@acm.org>
Date: Mon, 26 Oct 2026 16:04:57 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gem: Add some cleanup.h
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261026213701.22126-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261026213701.22126-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 2:37 PM, Rob Clark wrote:
>   drivers/gpu/drm/msm/msm_drv.c        | 38 ++++++++------------------
>   drivers/gpu/drm/msm/msm_gem.c        | 41 +++++++---------------------
>   drivers/gpu/drm/msm/msm_gem.h        |  3 ++
>   drivers/gpu/drm/msm/msm_gem_submit.c |  6 ++--
>   drivers/gpu/drm/msm/msm_gpu.c        |  3 +-
>   5 files changed, 29 insertions(+), 62 deletions(-)

Please consider adding the following to drivers/gpu/drm/msm/Makefile:

CONTEXT_ANALYSIS_msm.o := y

Thanks,

Bart.
