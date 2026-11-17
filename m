Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935811;
	b=Avd4fd5QV15XdRl2kuw0WYB7NsYbwiwnWqi0O/SILWLGh3E+5rPjdrhBOaZxF0zZh09g
	 qutCSNCNgxkH/ulDVR34MxAh5AaKjLFoEx9PXiunIW0P7k9ONVjn+fwgpD8IBD6TBjzWi
	 OQsLQSWKDngkHwUnM5O3U5uYk4hQsCuZtaUTBmd8Dj0v44hN8C03FdX7gC0Sc/IWnupj/
	 dE9lQsD3r4eTkmkYdxRufKmkD52uFM+/SzYa5z//XUEaHKx4P+IfiKC4Lb248FKRM+Pk5
	 zZUAj8vVuYqX9/krBkbhO38pMReqcxy0L9wA8/TKlpz9RynO/71aOSxtQ9tyu1y02kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935811;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ajQ/NfmaDmDrFinUDbsJiOEob3STJRxwX/RHAbMyYho=;
	b=vNs3QZPPChJRkXX4rZ8a2rodOn4lfHIOMZUOsicXXo/6SVyQKwbf95tPrOtOdUFqb0Lv
	 HbYxrrXRjVl5siIV7cs+KmGvxL54UjCNZkv0ey1ARMnyCpRHygSB3TVTiZNiIttOnp9OR
	 loyjmXn1SMuWJlP6JjqAsVcN4zo8HtNr0XDFTtyJQdnLw7pC0Jf61MecX0YBs1tXhPLlZ
	 G+Abj4H/pGlv2PHzL9prVn9hLQ7MV+quL0ENzCnmW2NeTSIp1RPx0YY6DiAaQ2zjJxlTm
	 C/6XlWdBA9WywHrcSpC0Q/S3knmo7iiKIRVfM8uPcxVv/ccSjrYGUhg1ZJAp2G0bM6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="XVt/8iRm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C022606A880;
	Tue, 17 Nov 2026 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XVt/8iRm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83A81F000C4;
	Tue, 17 Nov 2026 17:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794935810;
	bh=ajQ/NfmaDmDrFinUDbsJiOEob3STJRxwX/RHAbMyYho=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XVt/8iRm+QjVRzmMMDH9VtuZ9jtsV7Upbp0uS1Jiwrxs+F0PHQYG1A1qTOVr79SkP
	 hrGYX2F3u2J49FHPQiQjf0LdklIgog7h10Dz1CgsxLCIzxG1UXZs9hJWEwyvd6g01B
	 okT7x8otO0ziDoQSXDhM/nOQ81/RnImModoUJjag=
Date: Tue, 17 Nov 2026 09:16:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-Id: <20261117091650.fc2f9558e84f76a5cdbfe7b4@linux-foundation.org>
In-Reply-To: <avx9_c_HWPAl9i1Q@sirena.org.uk>
References: <avx9_c_HWPAl9i1Q@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 16:17:01 +0000 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   kernel/profile.c
> 
> between commits:
> 
>   2ab6daee3c87d ("profile: account for partial /proc/profile reads")
>   0ff0b873d4d93 ("profile: simplify /proc/profile read layout")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   79011a80f0646 ("proc: give kcore, kmsg, the kpage files and profile their own file_operations")
> 
> from the fs-next tree.  This essentially discards Andrew's changes, AIUI
> the conversion to the iterator API ought to achieve roughly the same
> thing though I may be misunderstanding.  I may also have messed up the
> merge somewhere.

OK, thanks, I'll make those two go away for now, will take another
look in the next -rc cycle.

