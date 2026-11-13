Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556004;
	b=gMHtRCsIuFtL7x2SWoHzo38bs8fFvw8zlEQvFXnlJfn3hF+OFbbNQ9ZI6D3BdHte3D8S
	 omfXRrkClwuNI5NztutyeLoLmuspyymzcaiLwfqukwr8wWPij2hgGXWT0KZ2vCRE4mO0s
	 dTQ6liWKzAbCo98tMcEzPC8ZID/9t5TrgLxoXV1d9CNMn6Hu8nCuJNbyXEvfOUV5x2r2P
	 kzYK7nUNI2J1WxYGrRjUtDYT4Of48Gf1Qg9qU2HDjkbwdpG2TOj5v6md9Tqfc+0/Pt4be
	 k55B/1lXdjbGCsIczEZxQGLgxAdrqaJs0CCqhCHHfF67/+PaKcwQNITcMiGmxReIanQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=a43i/wMJK2Jdp5fkamBiNm3l8yCGMzExiyPn/eHOlLc=;
	b=xxw1DfEYSBSs+3ESymdNDjY2M+TJQdBMjELLQ+anNlEWM/adplC/rh2FNbkBpgj38uWI
	 mwhc8VUKHuPvJ/zV6raAiJlOSUuSuRvpXHxsD/Ml7f6PCug1owl+jBIgIhOJ5om3Hd/++
	 wEam2d8uJdZjRpdetr2S1yEl/EIwRB9tUTSWMyubfjeO5/sUwy+xZVXqPoZqpRwkZf3kL
	 GnGu0oaRPStReohl3SEHE4ykPo6z8LV1AipQcGVBE0/35IksWMu0nfgJWQMOrbc1UaJ1s
	 G8dfBjf68EwtrTzUOVYqxGvhSWC5LXONTeilhFS0LaBdH6J/Z2SnVtvYZK05bOuDUfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ekCNuwIq;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7814606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7814606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ekCNuwIq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so8916885e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794556002; x=1795160802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a43i/wMJK2Jdp5fkamBiNm3l8yCGMzExiyPn/eHOlLc=;
        b=ekCNuwIqvKNyzzP8/TogupqdJ9S/lTcS7kvV5Lnc07oznazi/+/AbvzHMeKj4Fz1k/
         WV5ADfsksKzz4ELlKIoFlS6TA7id5kKKUA1hVO+Yp9EZyWmGGu+BUQFTzuxXZDkeYW3t
         0/c5MtBBPMOrTOMC+n1elC3PUHPP8C/w6FZ9ElwI44//poPXrTAXH7iCb2gcW+4t6eU4
         xrIdqrcrQ8pdck3vGfk+UCq75Xe2ecgvgCv7bVAKOOuxg/BA7Y6lm/pkjla11OXMHIfe
         SaWd3WdM6Rjr5btfGjNmhZl333D5rooop+oX4EYmKyMJ4vdawxFBQ6gq7z7QHEWaOa20
         e3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556002; x=1795160802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a43i/wMJK2Jdp5fkamBiNm3l8yCGMzExiyPn/eHOlLc=;
        b=M//V/UQdQD+Hn9vLHEWFJqdW9Vp9xDlJwIVOcj0tNwm/wG3z8GZhP11lCSsuyhBYd5
         VDDrmk6TmoKSdB52LxwJ9Emnb0EYqKDFpqWjINJGL4Z5h20Ux5Vf77p9AZeRopMZHj9o
         xKe7Ew59q/RILaPZuQHjSA4wYFXG79IHhnxFNWupXd3lxiJ6fEZb2IPThdLDiPLGxGkp
         kQ/59P2r4tE/VM/pBU4X6VAavp17m9PL2mSTZrTcMe/C1aaFXtuiLGrCAZ6XvbIlx0un
         tOrywczFOg5xjwiS8pgzEZ9vWvCWjTjtecrS3ty3YPL8o6ZNRaRBXwpTX4sFg+bITljf
         eKvA==
X-Forwarded-Encrypted: i=1; AL+hErFOJZjoIUu6rCU0Oc6CrMxFeoJpV2jg/GNRBKXLVO8issXgeTAWEpymW+wiuT4/UNYavxGngdJU3lKB64c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ei3n2AgtVS3AF0rTnHzjcWhIog/ikf58Ya4RqPWrCEvn/T3UJ
	8JPQRe6p6SSbVQ/zi70a6FCfoy/5yYKflICE4eXe5we4dCAiZy8Mzxp8ZNpgtTWRVoY=
X-Gm-Gg: AYBFou18d4mEOUH2mhgkIi1lR7ttmz3ESQ3fFp499oHbHJL3OpzEYHhLqTjjVOHNxdw
	kWfEVH4zLQud+qiKhoB304TkkrLxOSefONaxvY64Pk5+VmPKHhhTGy8UZeksyom5XHO4IrcFYjp
	zYbhQd8o+dYYKPQSEDdyW+9EiXj6ZOe0miz7RmJdb16Y/9Sf7WVaHjtydKXXLNDLmwdPL1qG4fv
	aAjiP7SyCWw2cNRifgOFTnm4PZqVxR96tyrMwtt4tMAeUZ2KkV4MuwMgQl7ntg2njdRGxC/Pkd6
	nV0xaaJFbG4WtEqffR5gBBDNkDjA7lK0r1VGS+4oKWttc/ujEnGPZBiRybkJ4Bkoy5RHVvrkBxZ
	NWdhvoLYLili1/zxVWH48y8FiMff8p5UI5u7fPI2Hd7r/iflpVcoZoBQykFRWNMhUxAqWLMjhIL
	U+68tyBJdykD7osuv6EcMfKHInMMJCUvCvAnW1lTNR6Rej0GaXLtxDee5gqRRlTVzCZjzv2MLep
	upH/w/22JxIb+F1IhSx0A/NjDsAzYS8YifQ1QbBN7lxZVbjBmHr6PcYaNrPuBrwVIa5857zQcxE
	whoQTSzyjDQno9bpVlg=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr34881985e9.30.1794556001990;
        Thu, 12 Nov 2026 23:46:41 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm5348297f8f.7.2026.11.12.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:46:41 -0800 (PST)
Date: Fri, 13 Nov 2026 10:46:38 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Priyanka Mani <priyankamani2100@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2] KVM: nSVM: Check full nested state size before
 writing to user buffer
Message-ID: <avbAXlFsL4J4zPr7@stanley.mountain>
References: <75b8ccd5e278ce8f13bedeceb196f5b4ee9c5256.1794545500.git.priyankamani2100@gmail.com>
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
In-Reply-To: <75b8ccd5e278ce8f13bedeceb196f5b4ee9c5256.1794545500.git.priyankamani2100@gmail.com>

On Fri, Nov 13, 2026 at 05:01:14AM +0000, Priyanka Mani wrote:
> svm_get_nested_state() compares the userspace-provided buffer size against
> kvm_state.size before adding KVM_STATE_NESTED_SVM_VMCB_SIZE for a vCPU that
> is in guest mode.  When L2 is active and userspace passes a size that is
> large enough for the header but too small for the vmcb12 payload, KVM thus
> skips the early exit, copies out the header, clears and fills the full 4KiB
> vmcb12 area past the end of the buffer described by userspace, and only
> then does the caller notice that the returned size is larger than the
> provided one and fail with -E2BIG.
> 
> As a result, KVM writes up to 4KiB beyond the buffer userspace said it
> has, and if that memory isn't mapped, the ioctl fails with -EFAULT instead
> of the documented -E2BIG without reporting the required size.
> 
> Move the size check to immediately before the first copy_to_user(), after
> the header, including kvm_state.size, has been fully filled in, so that a
> too-small buffer is rejected without writing anything to it, and so that
> any future additions to the size are automatically covered by the check.
> 
> Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
> Cc: stable@vger.kernel.org
> Suggested-by: Dan Carpenter <dan@pereq.eu>

Really suggested-by is only meant for original suggestions, not review
feedback.  But I'm always willing to accept undeserved credit.

Reviewed-by: Dan Carpenter <dan@pereq.eu>

regards,
dan carpenter

