Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316621;
	b=2NLQpl2cdky5Z0QBBPUWM9A2fYCI6+CEJcgWKndJLs5+y+WLEgkT73LMQTcOJDnU/XUH
	 a9Mxv+4njnov0KBqfZdlD6c9/OikxpMG5esF2J1b5xlxozwL6vh4+sAtWFrupDJJcVtHe
	 v98Uq3bvckkwvfNzA8HcO287zYJge+Po5Y1d1R0Ebf5dTl9slC7fh5j+uM6KSDVngBx15
	 Qr5+bewVOZ5c7x35f6VELE0FkhjLE62QpkaE58T7hWmyVB1a4bVGecILWEFJ83VglyZpJ
	 Pdvx+0imkCUMbgY/5kgbp6DS5WjCiqnspFeATpAb2BTgJC+jhuXHHHSXf14ZLeWTa+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
	b=lFCROX1LJO5yMOEplS6oJa5SJKOVSNVN0Zfyg0Xdj3SNjgnu5+ZYGh58ddQ7o+miOwY2
	 9ArJ5adkL1lhU5KJkZNghQ8hHDErdPyhGan2mmMVDHtUj8GhnLFQJKJ2aLfyZwekpndS3
	 hhfeFHPdQgwdTMRt/AiC5I8sUY6Hspe5CrngO1IHJYb2U1zaaiNrsi/vw1kih2MqCBpDf
	 Heno2wAAZMCJsLjAH2BhZWpH4S+MuZI2vU5SYUeiT7IG3B2JX0XZMX5Oxzdsv8puW4+5k
	 IevaSO/stgW1O96RhRog7JFjhzJiLNidnAP+oW5+fNojB1DoysRR578SWhLLCKKkEFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=O2E1Zioc;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F17606A772
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F17606A772
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=O2E1Zioc
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso24343136d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794316620; x=1794921420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
        b=O2E1ZiocM1QEde3pbXv6YSzgLeQ/A1L6P4QUUGeLVnHRl7hZp1Iufjhb/HRQG4n+7k
         8gbRJK3bxRWNnttv8/vLyQ3i3EwYMspqgm678+6sjnMgVOzLvgYizMBYpjB1RYobZ2f2
         uKTP51hIos19xstFK7UzI66ziSHzX7bnS7Rd+EAu+EjVQcYx9PEcuxf580PwsOZKPLoa
         pPrkKoaf2unACk3+vtCkCw6RqH8fISr8QoIpF+urxZWvDCVcwqQ6qVHpgOVf1z910HQ6
         AxX+WnY+cYjMRUSGOe9q3QgIy/OxyD+YKVQRGFf6qMbv7zRbhsVkmn/qS+KkblXSGnIM
         IHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316620; x=1794921420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
        b=tV3hoOT6l4ZpUbOoKX3qCcHXypF3fu9hE03MvhL03eC3fRUCmX16c2KJPJpvUl6eVk
         IKlDF2k3pSzs2LvEjB5vpqJqx86saO/Qfdp6Pe+YUl1aRsJ1gct3SYm/3COBnsbsBcED
         waHxM/c1zYHYzV++56J82YiA3iR+6BOU+T5oz4UWNbowQfUvd93cGkEfW+c2v0G5KvV0
         zFkCEuSqBlBaLXh/dUaS9bsRXnUKiwTmmAumJkfy0TFx8pzkhIinYVRNiY/QseOMkjR6
         VtQO0bbezIZYqAtrLvo1WThsK3Gu+iEbExbBHjrn6z2BDb1pe1ERRwDyd2fHCHukVV/i
         qwuQ==
X-Forwarded-Encrypted: i=1; AL+hErFk0KKFAvnKC+dp0inQVaWgZobLvgcBDgZu6alNTYol/d+6orua/y0XwWmNTXeVFlQHUvV5J7TxyFBU2Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GgY+PQ43zuJJhxrfkSvO36noNmQkUE9S1hHYtXFgWU/2LM3M2
	8aeDg6PJe7AspA25r66txHn+oEyMbeaKwj/C2DPt6WcQu8qmhLN6KVNkC07C7vU4UIE=
X-Gm-Gg: AYBFou1mbs3TqMqlT3suqVA9UQcpq0o4zL8m72lcilXcu9BhURWd1zoc7VHPu/Jh6u1
	UWwBYkylLsAqWTI3zRt3RWyytx/Vq/Uv9BK6TPsZUNZ+ES6qtZl7PfzfY3D0h8bNMx79kfZ7q1V
	wskJnCAegzymEwSGvazLE4kqsPGtsQl9waei5L/dnp0j1lgcJ0R13S8Y+xMINNSYv53yQK7N+8+
	bWHVQ499Hk+YCOUV5fR+tLxkA7TK05O+nnbUNxiHhDv6Pz6iIGvct147QJdUWsQN8eREFbN+YA5
	DaHgYJQ1jwRFICWVDtKT1ILjUcPUng6FNw0J8Ag2koWIjrgnzy416Nu6EAFXpCQd62fHlkbOpCn
	q5MdwwhZHJvoI2xx2drGk+hZ63L/c64nrrSGGlWxyYmIRAN9F3YMIJASFcW07MJy+qjzlln+fQR
	33SD1Y1hFWm7v9XqJpwJQX+HcOYy5QhkI1G2jH4xuG5ozujhtuDVedtYloMlc+D7ew025W/RMaq
	B3/CKbo9MSB7AtFeMzbTQq9UM5spYjHllXi41T36LIywOh0H37oBya6AMiVkwH9+Sd6kqxIVVFj
	nL4FQWLCXY9R0S60WJwoeFZyqLTStcFktNcoXs1zks2WNzNa+AYr6F1eWHV9pFQAOigq+HxtFov
	yaTCRpQFefk0=
X-Received: by 2002:a05:620a:1724:b0:942:e4f7:6104 with SMTP id af79cd13be357-9479f3766f2mr439618585a.55.1794316619773;
        Tue, 10 Nov 2026 05:16:59 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61c333sm220869985a.3.2026.11.10.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQlic-00000005geL-2PDT;
	Tue, 10 Nov 2026 09:16:58 -0400
Date: Tue, 10 Nov 2026 09:16:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: tanchi25@mails.ucas.ac.cn, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Message-ID: <20261110131658.GW663069@ziepe.ca>
References: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
 <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
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
In-Reply-To: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>

On Tue, Nov 10, 2026 at 07:51:37PM +0800, Gong Shuai wrote:

>   2. Use the guest PSCID directly, but allocate a separate host GSCID for
>      each vIOMMU.

This is the right model. The viommu should allocate the GSCID directly
and keep it for the lifetime of the VM.

>   3. Share the GSCID and maintain a per-vIOMMU mapping from each guest
>      PSCID to a host-allocated PSCID.

AMD is doing this because they don't have something like a GSCID.

Jason
