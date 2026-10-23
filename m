Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769304;
	b=lxmHpxjryrGWi1j5SGZfP4L3bTd+Qdg1PUR9x8iEPdyEO83XfRMr5n+kQbSU7ODnbaCe
	 lnHFZ9zrTMNp/2LD2v57km0oth+buFDTkIeiuQjeA4A2blxu6oKwmcQuW7qRUhPXcgvrv
	 OJfzlLwRtMfxA8EewPGOttpeSn3hhTjgaP/kL5Y1YPuHfw+WQoH/BoBW8UOz/bbrAEw1K
	 HgV+0iYy+rKWhjywyUMyLCfGD3bZYPQMc4tkATDLF6JZHGs75Za7gKGJee8KQdFAM7HEb
	 /h+DXVrt1fk/VRq4EEAWSY8PfBXwhadn9TDhu3d3sU7ByB1C+oFMGLVevpXOfBryrqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QZGX0P2xTOau5TUe7BXI3iIJao07AQUaeE1wHDTDxTw=;
	b=dsn5C13c8PLaTggDzzq0imV6D+8Issk92My5Ls987QfzYsP72Z5zTwpVlqDN3SPgISVR
	 UCM7HjzVzxHP0o8MLjNVrEaaggJ0KD7noFF39j1SOq0mdwKNQ8eAZHHGQpEoF4d8P1UUr
	 p0Eh3zgl7mm/F2Zw69GHO3nantcnJnVBpHWIJ7mQjWEYEVIoBwfcrxbU/OtPgPCzAb30L
	 7cHk1+7C7RuPzLokqhjOCJS+gSMYtUmbEeNF2v4DEBJDrzq/EgGwRoeG2+4+ilTIxvPNQ
	 8v1XJsf3NKj6syhHgyOz8dA3Y0QZ6YAIaTI1LpgAXAEQ3y4U2mbTMlIfGDq4AyIjcag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XJR4uCmy;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5947606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5947606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XJR4uCmy
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5364648ae07so10657971cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792769303; x=1793374103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZGX0P2xTOau5TUe7BXI3iIJao07AQUaeE1wHDTDxTw=;
        b=XJR4uCmy0sVZMFRUNj2/fNf0CMnbpKx0fBPL4GvjpjXRaDJzSJq1kf7WVhAR62Ivjz
         dnA7sAJcAr2k66f/NGLBAjqjMmtG1Gg8Szy6ypNIudi9kEMkjPD03/gq0TLJKnN0vkCb
         0DYgSepQoC0YELTwkmIYWl8HniM2Ju2yAAoUIzGsflt0cEORYhHnkmUWpQdt0oLIahZn
         7T8B821+UEMLMfG9BRk8AFzhkireXvPzMGreYa3v3E4JVXb2fWy/59RACkIoXw6aUBwq
         E5pusLqVK/9xtLl8KZigWh6ZAjyAkMR9C03VuotJKkRy2HhcBFABVV45XtpNc+qYOuGW
         y20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769303; x=1793374103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZGX0P2xTOau5TUe7BXI3iIJao07AQUaeE1wHDTDxTw=;
        b=lDLY2SSkECZffGRVAJUMHhivMUgf9L5+dgIoHxnNke2IfdMvXJS1xgV4SIIDIbmRuL
         y3DilSXqcBzz2E/jXcBPpn6J4vF+nSWxNBSmKZx0LwEUmu84NlJNGIiE3iy+4I7X0DAX
         Qj9q4v58P8XkXe7AoFivy05JoD5vqU2Yv78PSLEZab/4xdW9IY6Xk1ZmdLSWQJsvCOqQ
         F3d0N1wwMxhR/YytiL6i5+YgRQa8n3NQATO2IbjmuGBwqfkTmGUzap/qbkNkvx5RDUXG
         ieUDErlJRj+v5D34edv2hRg4QCOUvy7hY7bRldgUXnWjMHQqiUWHSVZOmG19xUiUuyeF
         qECg==
X-Gm-Message-State: AFq9FYL/ZnVWJJ/nPe4XdP+yRqNkXQaj0zk4lvoOYSjog+1voJTeVh3z
	kaXG5E9sfMK3lgo744s374ELtVl57/Bqn3BicWRx6rWfV8XSpsFrAOl1HcI7/hIm4i0=
X-Gm-Gg: AYBFou16hm5VXxFRHjQ4i5pdo09l1xWEU3eNQ9n6CmHi5Qtmem0w7gx+lJxDuXQuN8z
	DBlY6QqE/aITxdLJnNF6AzOkJMxQ3Cvj3VixmTZW3MzojVxXG4BgTmdxWFzGR5flNqQb0bNl1L3
	qC14yD9ZdHAjNjs5G+h1yCiyu1HoUdmiuckKLE1vEsaDOuxL8TWaTe3X1YKSm3OC/ZOQk10GhOI
	zy/khKhe9gIBvdN+Qafjyc1y4nVXYhupAxEJHMeFdAuzzg14BPTy5f/PSz2Y57As/7oWbgdtKI+
	7feUU+1G27vRDuRRRRW1Owd5grIHOHEpG6++k+62vvcSUaGn4YXA9unNbIrRGerSIMV9OOzGUzo
	sCK0S0Tw5yMaTfFuWDl433yCdTbs15Mmv0nq+Kyjf/g+zU91Op7uJYnhDRYBt+kWnUrdAt5Bn+o
	pb4M38le6kr8gw6GVAkHoZa8Miuvdr3gGB8IbnEjHoLJHCIabSgl2s7/y3oW4D5YYAv/Te20/+p
	AFqvXtFuZA6t6CfzwJo8LJx6IVlFZIrR6f0n1yRy9XPsmqwDzwsI1fUfWtHkHfFGL2BvQcsKB5k
	17686+7cE8yDac0r5/68g2+oMDwXqMxb+5vX6A==
X-Received: by 2002:a05:622a:14c9:b0:536:6856:f58b with SMTP id d75a77b69052e-536c21621f2mr38147761cf.8.1792769302579;
        Fri, 23 Oct 2026 08:28:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836b96bfdsm155091cf.7.2026.10.23.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:28:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKHBt-0000000GmTX-0FLE;
	Fri, 23 Oct 2026 12:28:21 -0300
Date: Fri, 23 Oct 2026 12:28:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the hmm tree with the origin tree
Message-ID: <20261023152821.GI3977851@ziepe.ca>
References: <att4_ahsvKhi4PXD@sirena.co.uk>
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
In-Reply-To: <att4_ahsvKhi4PXD@sirena.co.uk>

On Fri, Oct 23, 2026 at 04:10:53PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the hmm tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   47193113641e5 ("coco/tsm: Update maintainership")
> 
> from the origin tree and commit:
> 
>   c5277e5b71e39 ("coco/tsm: Update maintainership")
> 
> from the hmm tree.
> 
> Alexey is in the origin version and not the hmm version for some
> reason, the changelog looks the same for both...

My bad it got changed at the last min and I didn't update this
temporary branch. I fixed it up.

Jason
