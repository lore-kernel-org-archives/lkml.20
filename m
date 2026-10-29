Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793304423;
	b=US5FdMwFbJaBFRWbCst7E4Z0IeuI/Psnn+5uPc1lCVqwpqG5GVtr0TRIDrSrd5JDpEiU
	 ad02lLvnslU4LoyX29DzqRGXcPRMrSL6PCP0sxMEqQefIMDsLTU7DcRQW7bAC9JuKkAmr
	 e8ZmooYdiKl5Rc9TFpLo7GqQT1JK5Y5JX/oo2d2S24eACLKbjTegQ3TQM6vfxLw9z9jSu
	 rUN/CFF3NafyxykgUeGGc7i+dumKFTvvT/rweRS8NNikOz8oljf3NyAfxYjSxjE8tFnwG
	 RXNrPAG2UGbAcdgHV9jhfUT4dfG7z11IknDdVuo9HqFPRetf9qoajtQxEyasQ2bdMRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304423;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nxtHFNdbxLfpJKeztBg2OmFXpJNU4a+bz+t2k8oi7tw=;
	b=w2GfzSxXc6MsJp74wMPNOr7OvoyODAySzEXtHXjrf05RR62YP6vPRe23l9B2aOfZGO3H
	 kgEx31TPUQNZdS/o+w33jVepVnIcwZRlARIauElWvkvohL/ufHzzZVg9AppqP7K+WKYFL
	 d0UaGQecRUWxCZFQyqms5ygUaaZO0VxzaR8eI/Lgenejfw1iXF1wKWXr6yiMwx8jA6ZTZ
	 0AjSfFzahx69k11RJ5g51O+0GZ923sSSqS3jbh4diln9CPCKwzuSecciEmMd/IX23oLR6
	 ug9bN9uf4IQK8sFRsmXpeJ1mfq2a4WHIJxO62d7VgJa8DymhfOsld3ItA1/0IeWq26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MF7VJ143;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BA4606A31A;
	Thu, 29 Oct 2026 20:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MF7VJ143
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nxtHFNdbxLfpJKeztBg2OmFXpJNU4a+bz+t2k8oi7tw=; b=MF7VJ143euLo8LZY2oFSDQ/pA2
	ERLfk+Im9dSYj9uNL/8FdlpouSEtfIfrytbC/bDqV8aOtj2mpvo/QUZpjvRAdILA76UUig2Plj32V
	HsZ8PpKCnGO6FeVmUqGW7vu723baX56mX5jeVEWCJTPlEqn3cax4P6batROTmHbNC3/zzTtHX9Q/Q
	z1b0/+GXkCoDRqerva0nJzdvpexN2mSXGSnkyXuRGe3xFFxlYiP99Q8UbSsi07onrhuFtNHSoKuDf
	G+nuF2eWp2HZolEz9lPZklWw12xz+65ARmzP7Tt20T6tzmkH1EgqJdsNWgeUCKN2ABLjdsgyj+KVL
	cKbdpJEA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWOr-0000000AJ3m-20l4;
	Thu, 29 Oct 2026 20:07:01 +0000
Message-ID: <dc9ef1b7-62cf-42ce-8255-4583dfa0aa81@infradead.org>
Date: Thu, 29 Oct 2026 13:06:59 -0700
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
Subject: Re: [PATCH] docs: changes.rst: Remove obsolete link
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/29/26 11:09 AM, Manuel Ebner wrote:
> OProfile has been discontinued as of commit 24880bef417f ("oprofile-removal")
> 
> Suggested-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> @Bhaskar: Let me know if you want to do this patch yourself, then I'll drop it.
> ---
>  Documentation/process/changes.rst | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 28f2ca633..cc9a16543 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -564,11 +564,6 @@ Ip-route2
>  
>  - <https://www.kernel.org/pub/linux/utils/net/iproute2/>
>  
> -OProfile
> ---------
> -
> -- <https://oprofile.sf.net/download/>
> -
>  Kernel documentation
>  ********************
>  

-- 
~Randy
