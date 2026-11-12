Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472261;
	b=yL3WzQlWlnyy+F1safE+Yp5VriJA57XXzOWvc2dC/fAGQq7whN2UwtWGJZ1tsuK6N3WE
	 i7y0+hFcQQBsxjdxtFf8WuOBcoSHbRDxcECozBKbUW8QrmBRWaKzBgVMDX7f0gKZHKqMi
	 RpcJbXhmxCJZu8xjESfXrNnqn2eAVLH3tsTn1tXa/oM7DH03vYOHgPmIfSeY6+Vba//+D
	 a+Ym1JDVHQiyrnz4EdrQ7IVL6bFhm6G8T3N701S9Z2pEtFNf2/EefONQhAa+5eMAsDyVt
	 7OsrnX8IlWcZp9VS6CIJlhFSS+oCKBwoClaKPcmyBEqb6MCFMVUZK1CE2D5E33a40RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472261;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eanlO8+qwK7IG5ntFg8sssJop/6AkWJli9sPt2tg8Po=;
	b=MEYH5ILtlbS3z195LwYRMfY8M7c2WC2QEaDcNDhsRrI+y3dIWgzNf1BtEaNaGfS8B06f
	 0PNcVLNd3fTR+4fLfAadwpD68jW/H+tL2u0fqk+GfgdVnnYKDw7JmmSxsgTZiQwY608Co
	 /DDYWkqgO2Uv+IE7erTm098SYLzF+iFSiBhnPa+nUqTXcq3dBsy3frokmmW9AV5q892mO
	 jstHOMziqvG6XS2KY8RjdprLG5c3bIFchCLE40NeXMIIzcO8wZn8MtSkA6niyUSoThlfX
	 BhS+xO8WvbZcBghaMzy6Q4/2xFelVP6G433imwzZxrdVJ2yLh/wnX3P/Ns1vvAFgeTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLBsAVDL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493AD606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLBsAVDL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D198F1F00A0A;
	Thu, 12 Nov 2026 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472260;
	bh=eanlO8+qwK7IG5ntFg8sssJop/6AkWJli9sPt2tg8Po=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=JLBsAVDL04q5Rv/oBYdRC57LpRpSahHDXdVArIMbh88SZOB7r/sK7PasYqdQrs6dU
	 4tW2/LB3m8r8uw5rdl+gCxCj+xr0e6S85RrMTzpeDj/5p3N19wTEi8mF1J9l9nkfTx
	 Unhp59TFSIdaU1jLfKLEbdrfmQj0cM5NPF540qdcQ2zLYhh88uYvATUylQ5Bofhd28
	 fk0/80258SeNg/iynvmwX0yuToa1/e4TlM4Oc2XmKv8CE6za/2ZUxTpy8m2j+Okpbl
	 yw9IOXjK9iz+JlYFhQAKXFfBJ0RxyB8PbdJPmH+8bH33xuQtnbaKfKLS2kMlQy1Xgx
	 33qUnKXg7U/mQ==
Message-ID: <0e156b8a-2876-4bbe-b16c-55c70b3201b3@kernel.org>
Date: Thu, 12 Nov 2026 16:30:58 +0800
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
Cc: chao@kernel.org, jaegeuk@kernel.org, yi.sun@unisoc.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated
 blocks
To: Seongjae Jeong <jsjlee1020@gmail.com>
References: <20261004061007.7433-1-jsjlee1020@gmail.com>
 <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
 <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
 <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org>
 <CAPHXVry2O-AYxTvGdzu+m6b3Q=ho=xL0kpWWqCn0vjj-gOe0ZQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAPHXVry2O-AYxTvGdzu+m6b3Q=ho=xL0kpWWqCn0vjj-gOe0ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/26 11:48, Seongjae Jeong wrote:
> Hi Chao,
> 
> Thanks for checking.
> I agree that 81ffbd224e5f is the right Fixes tag.
> 
> I’ve sent v2 with stable on Cc and an additional Fixes tag for
> a66cdd985532 to cover the discard bitmap handling. Does the second
> Fixes tag look appropriate to you?

Hi SeongJae,

I don't see how commit a66cdd985532 ("f2fs: introduce discard_map for f2fs_trim_fs")
introduce the bug? from the timeline, at that point there is no error handling in
update_sit_entries() if sit bitmap is inconsistent, right?

Thanks,

> 
> Thanks,
> Seongjae

