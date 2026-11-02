Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621172;
	b=IMvnxkNWQ9jaYIwpOjSCr1AYuIx6jzaKOQCL0lvTkIQTSsDxUg/IW6gVSmnRx30CM1Iy
	 IRTk+XjRFJTqrzT8l45C645ByTB26KPEx2MSOpIMAfmrAk9Fo9sfFcxYyGcq7or4Ogq3f
	 cUm736LtMxPQOZJOsWNqeU6r92ALrDVzHkDuhmmUa36t2OMBxQg8M2mROfmhO+DVIWzhY
	 hwBOHVG8vfUu68vWAIT//SQyiutl7f3ygwJUxmNaYnd/xPfxmFUdKBf7hCASxpXBUBynf
	 wcOx++GRaAQKPi8ISWB4n3K2bkNVtS3s3Ycft4uXXVwu3+NTbR+LuYObFs/fb9E2Ihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JgQSYzOM8+HGOvzxQgP9NPQLAChpRixPZZ8qdgqKf9Q=;
	b=sF0YIxsBSU8EorM0lgWqyf+I/k76W8an7YTDllZQmqwK6NSY+4wBdugMaK/cVtya4g+b
	 hWOM/xXM1bu/hMdPy1LDVl/52avOielBqAneLUPz4UPOz6pJ2A3Ds+ZTEGq+Bvm55F29V
	 uT9DiFopthpgOXI1ZhAW1ttCSOqSR7Rs2jPqupYTEEXJPk9sCBIRWWS8beNwE0zte/6iJ
	 ClmsxRLvnFhywjx3kqrmVHblXqpaStU8Xov7Fwwt9bBuleLfsBNzTYR7iTkWWHjLv+05S
	 qwSweeDlKTpR2uH2IOTwgGtY5HtfMx2B6bFhpRXoMVN4LYwbtJb2LV/JqhfFfTW3clA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgwkJYYZ;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B740606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B740606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgwkJYYZ
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso896733a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621170; x=1794225970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgQSYzOM8+HGOvzxQgP9NPQLAChpRixPZZ8qdgqKf9Q=;
        b=cgwkJYYZMfE6r66b5I1U11HhPhRT1h5Z9IRfty8MrBMFtBeybupr5di44D2ZNzDFFY
         edr7PwWChyMhIiWelXpxuVeQ7Syclr1iroFVkXVFwlvkdLAr//z9nWp71ygS2sxJPJnV
         Dm/iXTK33cGuUrOVs/D2vqXBaqzUykxqixAv4RbTAdZivXCaqTFDswadeGn03j1bcztJ
         x2aoEUt+YRnvmGcijfgW7iRgLbOpNTIQ5ZWE4ZrSAn0sk1SpxHZeX0jnW47+hqDvequD
         4aYhn+2Xp9WK27RWS0KfhqXLYlsC1DjmO/ezi4JBNNI+xgMd1j35FsFxeoNoxN2ujND0
         kpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621170; x=1794225970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgQSYzOM8+HGOvzxQgP9NPQLAChpRixPZZ8qdgqKf9Q=;
        b=EtkKRe6hiiGmXVo2NbEUOM1eyl/BjohXGFyUPFi7wtzH7P4rzpIoD5C1vMgCVn771u
         0ME8LDOBjxUVfMZT8k6T0Tnkt8Qxc7NUDojqnnUS/nIV+oBbjE2+Zrh1uvKBnZQ2blCS
         ajQHKMSCVgfKYtnePKR62oC9NjqxumUTuQiY/VN+qjOsZBfXkoNP3peZbZONI/4k425r
         +XGq6QJk6hzMGxuxdirdKIFpwtaoK0UEHOm/S/ICr1OXRjGhHzfXxpF0q2oGNl++h2yp
         vIPbBmuYyq3uuLRQLwQRsCqaZpZRom1nw3z+ZG5G+EauHsasb4TTjUIxISgRfbiEfgia
         PMGg==
X-Forwarded-Encrypted: i=1; AKwUvBy7iyht0D2zlmgIXXTGswX5bbrJJSBbzgN/fC3pWeuXAvGf05vGp1+z2lmXWdy75PLBIbl3u6HUekVTYz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WS4/bI3Au8yL4mAFYrNC9HPaAfEU/XZ6Q1cVfy8K30R/IbQYC
	Nnk7y12qYP2wCv8hl8Urd6ihmEfFloBHjrA77SctKE5ZgtCJoZCsvpMs
X-Gm-Gg: AYBFou36uEz8rJjfKUlP4+HNsdvWRIJOTIjq4n4yS/czhHKelbdqYAUwl48mGIbNSm1
	ghxAnrPktvF+sb+a5B2EMWmdKmOQ/HrwJQReuH2xOgopVCtsBO8++rqoyxAtsXzi6QS1kzUqaz/
	QP1M0OKE4egW6UjYjvXTwlpmnTlOpsZMQyzBIw9fJZpP+roguuZ+qO6c4qKmeZRs5/LMr4lO9Nd
	efB63fA/sc2mn2Q6hHV7m/i21UFsGgaZ2VKNol7xuhj36V7zXP695MtSKsrE4cBAirGN9WVbXYA
	FPNnnx6N0tkItflWg2B08Is8PzBFjiX2c/z4pUqqtsT6NnczbsPkOW7QDFPoHRCMspxWtTwBEs2
	iUn+Ks3x+rCpK/OuTOKxwcnBbdAdsVxdh0M+Qee7iwB2b/4TZr1WXn7kJgdEIxmGlf8Vma4zUVE
	DFyXe/GgNYij3vRA2/1Kw1mwm6wG4SIy0Hx5fmMOxLHq1bNTBLESQtDt2qKg50u/qhjZXAGPqVR
	tdxShUCpsj5+avlTEtsXqMoiPyiF9tFlMFGitaLD2qq0gckqF6GJ4btSt/07dw6xdkXGSUNdFty
	ZdHQddMyLoqyDCMsxZXneOnhs4956mNRPu34WX2xSRI9YC1gbTyASFzgLlNGPv63DJ8AYCmb0MG
	VBsggxM2mSgpDzs7oTSaWRnWpI/XmiyBO5po+VrrFQL1r8BBqbyHCsZ1qZm8w41sE5w==
X-Received: by 2002:a05:6402:1f45:b0:6b4:59d0:7294 with SMTP id 4fb4d7f45d1cf-6b4d4c6fdd6mr6927817a12.31.1793621170371;
        Mon, 02 Nov 2026 04:06:10 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a6f11sm3136954a12.3.2026.11.02.04.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:06:09 -0800 (PST)
Date: Mon, 2 Nov 2026 15:06:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maritu Hone <marehone12@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: axis-fifo: fix integer underflow in TX size
 check
Message-ID: <auh8rTgLTGuSUJM9@stanley.mountain>
References: <20261102114451.54579-1-marehone12@gmail.com>
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
In-Reply-To: <20261102114451.54579-1-marehone12@gmail.com>

On Mon, Nov 02, 2026 at 02:44:51PM +0300, Maritu Hone wrote:
> fifo->tx_fifo_depth is an unsigned int parsed from the devicetree
> property "xlnx,tx-fifo-depth" with no lower-bound validation.
> The
> write() packet-size check subtracts 4 from it:
> 
> 	words_to_write > (fifo->tx_fifo_depth - 4)
> 
> If tx_fifo_depth is less than 4, this subtraction underflows and
> wraps around to a value near UINT_MAX, so the check that is supposed
> to reject oversized writes never triggers, regardless of how large
> words_to_write actually is.
> 
> Reject the write up front when tx_fifo_depth is below the minimum
> required by the hardware, before the subtraction can underflow.
> 
> Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
> Signed-off-by: Maritu Hone <marehone12@gmail.com>
> ---

This patch has been rejected many times before.  Best to do a search on
lore.kernel.org before sending patches.

Device trees are trusted.  I wonder if the AI is actually searching the
device trees and not finding anything, so it thinks maybe the device
tree is wrong?

$ git grep xlnx,tx-fifo-depth | cat
drivers/staging/axis-fifo/axis-fifo.c:	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
drivers/staging/axis-fifo/axis-fifo.txt:- xlnx,tx-fifo-depth: Depth of TX FIFO in words
drivers/staging/axis-fifo/axis-fifo.txt:	xlnx,tx-fifo-depth = <0x8000>;

regards,
dan carpenter

