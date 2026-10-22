Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649503;
	b=nYN+wn+osqTH5V2ygIHAbp0iwGkt0zqnMRhSj4g0lghv5OvSSbEiq6fP178cL1PmkITb
	 VaDvWs0GdqtAUJRg4zr4gR0HFnrT0LIn9N0wZh7EcC/NGKErlaF9ca245Y68EJUH6tdbG
	 06K3CTlxTBhCFupr9SHf98AoqRT1Nmzt4AEqsnDjNYeQWEoJQabWixwwmmDSwMQPEsP9Y
	 +XA8NFinoQTC41q70x2lNLObKhFDkxS9FKehdKcP5JuIDrag6jcGax3w6xmpYnzxxeYk+
	 +/buFKLVVSE3QZ4LOWWWEZx3csvjkfnLkATItd0CGH5lo3OcBvCGcGx3YY+X57m3fuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649503;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WB+qPHylD4j4YLw3dfH4zxL8YSpeWPdyUE/Y6qCaoeA=;
	b=S/uocU2gq2bfmdJT81Id2bgtKTtJDViNrECLpnnmokTTzWH9vBS52SR2DWrKbUSXJROR
	 cX6NaZheBMwAq/HgI4mmizL1ERCH2Q5s2cT3B82erV2xxNvp5mi+wta2CooDWWnYUljie
	 3Cwrk6tJ+h9vkLxzTWRMDT4xJJauTxMfFoLzhhYkwjW+3SldxTji4bDgDFjag2iZf7rhZ
	 gA9HdqR8ZnIXWodYt3NC19eSCRBLKUIoHZ1vIiT8LywgLaGOkRe2Ae20OAvLVS08Bgfun
	 S3erhHZrJugx6s7+V6EidomxEOZE8zn3YyZEnF++i2RR7Nl15I5K1nscAylBprHS67g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAR3oDje;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB371606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAR3oDje
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37ED1F000C1;
	Thu, 22 Oct 2026 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792649502;
	bh=WB+qPHylD4j4YLw3dfH4zxL8YSpeWPdyUE/Y6qCaoeA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DAR3oDjeYYnkl5WzTnZmoojSq+2Q8wphcAsUPt4JIaH0r4Bhkh+P1kYmxSU2nn86i
	 gKcAr9z87V12tj1BxkHqqfvqKPiJOVBJmPWjzMtugUCf7A8VhFRgpJGRTqO4v/ODF5
	 GOpWlQOeE0zs2dZYjdawQiaETOwEE5oJwRDIvSqWYyxvCidcTgtGuyTLKbL0b/LoID
	 qM0Ts7Xk5tKhJBIWj9LndTNtnEj5LuHb5RDasYmZSwam2avq3hBE/C2EhxUiEsxQKd
	 yPgJKEIRNe/xZbJwP4BGqnTuVTGbbwVfC6F91N7n6TCWm2EWr6olFwSnqnZ0vpEz8g
	 vkwgPy9KudvQg==
Message-ID: <9e529489-eff3-44fb-9e70-127971abf671@kernel.org>
Date: Thu, 22 Oct 2026 14:11:38 +0800
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
Cc: chao@kernel.org, Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 Barry Song <baohua@kernel.org>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <Ryan.Roberts@arm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large folios
 for writable files
To: Nanzhe Zhao <nzzhao@126.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com> <atA24UMtAqkmz_R8@google.com>
 <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
 <atD9Csw1-lj5_SR_@google.com> <atFFXafuVyyimmUk@google.com>
 <15373a26.1e3d.1a1494e8d1a.Coremail.nzzhao@126.com>
 <atY1gNfX9Lhg3zC6@google.com>
 <36f5c73d.3a87.1a162171418.Coremail.nzzhao@126.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <36f5c73d.3a87.1a162171418.Coremail.nzzhao@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 13:30, Nanzhe Zhao wrote:
>>
>> I'm testing the kernel on my primary phone. After applying the latest ones
>> again, I haven't hit the panic yet. So, could you please send v6? Then, I'll
>> reapply all and keep testing.
>>
> 
> I  have just fetched newest dev-test branch and dev branch, I see on dev-test branch
> you have already applied my v5 patches, so should I send a complete v6 patches
> to a different branch. or I send the changes to patch v5 on dev-test?
IMO, rebase v6 on dev should be fine.

Thanks,
