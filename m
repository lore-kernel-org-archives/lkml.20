Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF43A3E68
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898627; cv=none; b=eqGpPOftTAvM1Y9pgwbjLQlKUJ0FY3W39qZN1lwNG7FpyHCbJEtBtl9bm5q5AGufNn3W/slkD3yq/LcH/3mT0lf2QatwtAtfNZdl5WU0ehqKPD8ryjN85VdlIY3ESIFI+yUffhMkCnLUirpiqACeGWQRkAEj1ywtYj4jmagvSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898627; c=relaxed/simple;
	bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDuSnoXU/VSdTwGG6Eijcp1BFe2TBKxED2wbpudqfs7ItLJQhhYieh62eJ8BMiIimXsY6VAsZoSBE1LZxiqzsx2p6vcAksIb9VBxqJemn7RHVDejfP87y2oHrqWWUM7dzZdDrwrq3MZAZvRN4zGWJcbJOUReHCBj3It+r7N105Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MPpzjFTh; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MPpzjFTh"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e55db58cfso301559485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791898625; x=1792503425; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
        b=MPpzjFThiloA1rXZ/Xs7+Ba+mlqw222Gl+AL341vd2von9MSnRwrzd9iFiGbSilR/L
         WFcgZ9zB55znMBK/Rzrzti49PR5I1oiyg+ji6myyeUH+GAHOY2YA26zRZ0U/HnSMRumQ
         NI8xIdJdHfQjKPn6H7vGGSEVV5KdoJLTtyu7owtx3s9MNvXPUrIB6cOSoLtUE3o8tZuw
         edAcX/LvBwk9pxMctutv2QEVP7NQTzTDf+DE3uAaq6VyRqd1nC4GkC8zgwD56GZPAiOt
         67JucTbHLZhY11Ovxr6Me9VENTwee8OOs6xeUAzRWN/i1mYXqpaY1HZ4R62BaxOvjU+1
         Q+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898625; x=1792503425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
        b=hFQmbr9dY9WsBBzTrjm+Yafkr1mNsfZEhgnI7EjsWByhrMlspyNkC/Kwa3ZpVX6+4W
         pup84sh1zLTh51Eue5/z9qPXzQh7VSy1Fe4x8RKFcGOQVj9zBltPh0gGlI1+FomKeMEv
         +4cv7tYJqb50pjhLpZFj952K4938OUhe/IdW0R4rpMmcc17T1Scr/i17MBDj7Dy+MwsY
         XRld+apKvClJAoPgTP+/O8FLxUuiFPHjD7APdMdQT+RRq6woxQg++kQ9919M8u5bx9Jj
         A/F75cu9olcb8u/Uj8iJ1vqll8vc5GXBvpSxDdb/wfYALeJE7MTeKLk/vf/UZHnHkF6K
         zn+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0gIsKmCxrllgQPzJGtHqJpmIngE1U5m0AAMBD8mDjeNIP4b38nCjmpJHW5LgGY3EvvebKOlHJhizapdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIne+5EZXrRvL0R7M9WifPSZKBzqERWcSWa8UVjHVasQE2KB+F
	2f2DVIxlwQ6nDXjuBV6EU8kY53DRwDe2rsjhFMHXUA9flAv+QVG+Ld1joBjsAd1uaas=
X-Gm-Gg: AYBFou3gAjq9GC9plMjXuAzQs5IqsKE75I34oymvwCJYy4FpouB1OV2oZChZD5BJrwH
	HdfNCG6rEsbw245kgLexFrhnet2IM9ttVG96wusZLzax8Ptdir7qjZ0rsOkr/AJ8uNeuIbk+WMe
	mx3Reil/qIMeoW6PmcIAK2msTrv1t5q8ZyQD587WXwfWO9tqY2uMzBtYRF4aiRwNxtQJneuY2Nx
	gR9pINSohxBaeC4UaE2cg9xhQ89lUnlRy02yHLLsqwpBSCChEEt3jt7mX+rKss1RU69H/JWV0rg
	fSlcnGpOZ9HlbwakcDR+OvatQivtWyzyNDpN1Vp3h3Uo9HzhNxog/nJxVQTmIcFSrAvGoCjM54g
	NglZhHfJj4aLy74Wps3SNWJ7vAwJJI+/1vlPCSZPcqH9T9MbXzzknQxj7fNrkoWjMYmpQACWtlo
	p+HuX4mVLO+9JacSrcLlrwoY0pY5qycmGFaazgZqvigz/2ru4XM4r1e1VvCIhc8Oh5H4tgdWjHM
	fm6/MeY63Bo+ZiOfbyu1efZOtBdoeFx5E69XLvsUOZrUuj2qIS5ixzTJsWL1LnFHyw=
X-Received: by 2002:a05:620a:1a03:b0:93c:ba44:673d with SMTP id af79cd13be357-93ebd1b7173mr2238297585a.23.1791898624601;
        Tue, 13 Oct 2026 06:37:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50295a7sm238844085a.23.2026.10.13.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGcgh-00000009eSN-12xH;
	Tue, 13 Oct 2026 10:37:03 -0300
Date: Tue, 13 Oct 2026 10:37:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Dan Williams <djbw@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <20261013133703.GJ14213@ziepe.ca>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
 <ar5tOUor0bp3MtQ6@e129823.arm.com>
 <9e74ff9d-e8a3-425e-bf7c-f973d06e6cdf@huawei.com>
 <as3uzQ7L6tJ-Lu-Q@e129823.arm.com>
 <1451a49c-f37a-486f-ac47-e2ff86fef28a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1451a49c-f37a-486f-ac47-e2ff86fef28a@huawei.com>

On Tue, Oct 13, 2026 at 09:05:37PM +0800, GONG Ruiqi wrote:
> I'd rather not base our work on Jiri's patch at this stage: it is
> a pre-RFC draft of the new attestation subsystem, whose design is
> itself still in progress. Building upon it instead of current
> mainline would be quite risky — we would be rebasing on a moving
> target, and merging would be blocked until the whole framework
> lands, which is realistically far off.

I'm going to be strongly against any work to try and put a ROT
multiplexor into IMA. This is architecturally the wrong direction and
is clearly very a short term project that will expose uABI that will
be difficult to unwind later.

If you want this to go faster please work with Jiri.

> I'd suggest we develop the proposal on current mainline, and
> switch to the new attestation subsystem once it lands. As I
> understand it, for us that is mostly just a matter of switching
> to a different set of APIs.

It isn't, one activity is moving the policy and ROT multiplexer into a
shared subsystem, the other is building a ROT multiplexer into IMA for
only IMA to use.

Jaon
