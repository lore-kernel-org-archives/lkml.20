Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839934;
	b=wabqefATkLNIuH7smSQC/bjKzU0rekThFKrttmikU9ZCDAom9Axq784oepZ6PYbOxMKb
	 H1eP8hlJDndDx5FO4IBFTQZj3Mtta4YFazADe8wv+RQMp+8ngO3MAdYUoqdsFQsbgEGP9
	 Nopy2GJxYOz+gJToPYABQoDKfu/ljs2fdZmCBftq7rweh3edibgz68XlwQUI5ANeqLtbA
	 ZFQ44mG+TAv58Mu9hm9mCOXtGLpBteRxLsrj1rxNeHNZ0E1pv4tUjZZ8EpM5qcW6svCOk
	 qx6eWQ1/TSKtCEN0wR3vum7DbSI0MBiSBM63g8znfsHRQuTOnFz5VF2VBeICwmS1fEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839934;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RCSsIAQr4ns8lByjqkl548Iact+tOp+5FXcI5XUX2Pc=;
	b=T628m7LOcuuJ4xVI35bYcvcOHJvhhr1vPTu8RtlS77MLmrYIGC7puf66gEQtWqOojtho
	 JhE9OeCd/4n5U/w9HC9ZLrz+NAyh1Dvk8Mzai1cqEhckK73Tqt6VGJs6j6wxAbALdkVyv
	 2t2Hz6/ufxah0zYk03cb6cVUuWIcuIjy+lV9wEYzZBWNh7xqyz8hUws3o9v3WQchnX3LA
	 0f0S3t3kRBvGd8d8+xR4tX7bwuy9EnmeQbSFTQHOQ0IsPllC6aSCM5eMHj/K/wovQWvKc
	 EiIidXh5Qj8OmhycsBVn/PQSQz2crVmkGwlW6+jmvCvIo7rvw0qNKi78Zi62WSo3ehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=v9liGBx9;
	arc=none smtp.remote-ip=95.215.58.33
Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E9606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773E9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=v9liGBx9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ztk7Pa//cX1DYQS+6PFeoSOK37LnXmVRwhbAOkkIc8Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794839931; v=1; x=1795444731;
 b=v9liGBx9pFghjKrHK//eWsSI/AkEIleCB+znkXZIWrFaWv9FQLJGI1XjcC/hdCae2zkfYKzR
 wLw4fs0Lvgs83sW/+OLnSBoV0CceVRMvjkZZeS+rITf7Wy42b84Y6L0Nm1YY50GZ5lRgWg9kRrE
 LqppFHjCyjojMufQz89T9iFnUnLzoUbbPvLClhjphp+k/IV76sntI8u32veQjhcqpZjVMNHxEG9
 E/+IleSJM7cBH3l3yWVEpPsBQ+I/eeUMFXwnnbux6/s96j3oMiBRRrsOZZkRdCamz76fp+RJZHV
 PJ5tmaY7Y4zL1ncpC7MqxaDd5E4SzHlBz1LeTofkItSDw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fcd1bff72ff77b43;
	Mon, 16 Nov 2026 14:38:51 +0000
X-Mizu-Trace-ID: fcd1bff72ff77b43
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 22:38:46 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
Message-ID: <avsVdm5rzX_ZxtsP@wyuan.org>
References: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
 <476202a2-26a7-4b6b-a7d5-ba8e586371bb@hust.edu.cn>
 <avsSapW0-wS_gEsz@wyuan.org>
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
In-Reply-To: <avsSapW0-wS_gEsz@wyuan.org>

On Mon, Nov 16, 2026 at 10:25:55PM +0800, Weijie Yuan wrote:
> > > Range-diff versus v2:
> > 
> > You need to tell your agent to forget about the range-diff.
> 
> Sorry, I realized immediately that I forgot to change my template for b4
> cover letter after sending out this. Now deleted.
> 
> --- a/.b4-cover-template
> +++ b/.b4-cover-template
> @@ -4,8 +4,6 @@ ${cover}
>  ${shortlog}
>  
>  ${diffstat}
> -
> -${range_diff}
>  ---
>  base-commit: ${base_commit}
>  change-id: ${change_id}
> 
> Thanks.

But anyway, for recent series I did not use b4, so absolutely no more
range-diffs will be generated manually. This series was created and
tracked with b4 in August, therefore I continued to use b4 to send out
v3. And yes, I might be better off asking an agent to check it for me.

Will pay more attention, thanks.
