Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D1492199
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816519; cv=none; b=JKyAr4SjYzy364+NzEP47Y1FzIH86PIjufFCnnULkWFe7Og1JHbObGCWu+XOHFxKFCbNkFVnmUT2v4fqJSXFMugWiXzfPLM0pia2tS3Y8PDWeil+CUcX3tfSAWrduRt/FbYTB2iTFxWJuVV6kU6+HALGzfegnD8nsiZDjND4IuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816519; c=relaxed/simple;
	bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1pQ1hYhpV69Lq58kSuoEgoQyeIhq7sxUZeI8yIuK29mStKgN2iJHc3a8rbR8fZyCxMUm3t/E7Y2Q7zHtHGtvsEDgDFLAnJHNpU+BACPkqjie8zUdQAfEOaEyFGbCqRHcmmXrivTPmTZREK1jKSCdwjegeq+9URQI4t4hOzQ0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=a18EyQSR; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="a18EyQSR"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5339381b46eso20905031cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816517; x=1792421317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=a18EyQSRv8P0iZVz2cFyE4nGgHoZsQEXyx8UJuHZjpdM+7Qf5SQhhP2xNWAH0VYzQf
         /hoTlApssge3VsQ/ughGQGY0EAl62gOiNulQUtPZtIib5tqYAnuOwBaIFP2jom9NqxZs
         Js7D3KhLF4ajJ3qghgQYaFLUYxdFUOYcU8NGDBSHwvQLHuHt9cmGCYRlNuetRRfZ8cBx
         q41L4B7/xbYzABJqwB1ksDueQgP+fEt/7CCxbNCqmetPUJk8paMF210jlmlyzh2TH+i0
         IYmXPXhqQploSSM8bOgX4etNpNXQAiPb3ki2WHim7bolH4+nLgdpLKyQW/5qIdwwO02t
         h5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816517; x=1792421317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=lrePX0EThTv0RMgTObwkKwIZLbT3RG3R6cPMGA1ZtI0J1ZGNHTm+UVpBOh+ebdoyBk
         iCw59BJofXgqZQLcytZf4zySfokYj5jU2PVqeejPDU5zIJVRV15POwM3FOpGRklYm1iA
         sZM8LzYqK0uBsDu5Oge9RPT8KmVv+6ZDFZv3MJ+lHGfwhdFyXs5FlqQkgs4n1Am5CG0p
         vLlY/cc8Fn/MzTX+X6rO5N7+HVyEX63wTOMsHBM/rh6vKauwr0Cer2VhvlOBfHR3ZY84
         nKWBy8TxXFC05dV5LljVefJt6kd/O5qlUmNwqXSI+GKVWvl9xhGmJjU+FGRU+pNEmalA
         pUxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz15Swnc261lD56uh/TPBkxx2YCW5rLqyr4SwE90mSitLeN18HIKaGuGkIzJpwjIDt18XX6+B+Mim3QfNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVVSDn7lcGw8DXkI0t+AbYEs6W4BTgVYqWdLFBGdvqzpriJGku
	eZ53voGzUQ8wPI+8hHO7fBUVMeq781bU2YIfT/greKvwaD0lXR89IWymDvMSe8oMgqw=
X-Gm-Gg: AYBFou0KtWPHD8X2CCHYGvKZ2nIJc2nYe1MkznhNiaW6AurOHFdzePzxhc/1CVvqDgY
	HTTvdeHA2aIbWoZ89EOK4FSZjrAJTTxGBapdRYL7ulWEB78grLRIeuoIF8jv+7JDcsdybOesiSS
	vxZCOmo7e/BMuCIzRr9yq893U7OT5YcGv0HHUTOPsxqxF7sUmX5v87859WnNzMSIFY9aJL7H29O
	AECHPOdD8ub6JfFwGhTifEPDmqIKoUBhS7QYNokLe90Mpd1Zvle9vnIh8DamkyzEN2QRRq48R2i
	fVj6MOYyzBn0OrC7DGxfxD1Zoe7zvn9J1reZFV7evQPRZFnuix3TuS0dhqh6mWqtx8JIEjVipVk
	3m6RMpZO9PITCPYVwyHLO/Y+BB5CfQr74gXjeare4lbGEJNibrmyYG0jseWQJQ36oOZJem+RoIb
	1UYDBb99wIt3AdlddLqb3BqyoehwtPIib72xEoaJNOmy7Wb8m4Tt20qMkkod0jEdbScZJfHKwOB
	X7MeukegaczDd556l24LAIMgu/7hFOZmIXuxmErRA==
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr175097251cf.8.1791816516771;
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fa173sm80625631cf.7.2026.10.12.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHKN-00000006Snm-0vE4;
	Mon, 12 Oct 2026 11:48:35 -0300
Date: Mon, 12 Oct 2026 11:48:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261012144835.GG14213@ziepe.ca>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>

On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:

> Thank you for providing this level of detail in your cover letter. I've raised
> this issue with the engineering team in the past, but I've once again raised
> the issue with your in-depth analysis.

The main issue here is the driver can't use a normal MSI-X in the
normal MSI-X table.

"private" MSI registers don't work for virtualization.

Jason
