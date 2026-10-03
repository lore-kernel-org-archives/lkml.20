Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D52340286;
	Sat,  3 Oct 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791040658; cv=none; b=uVQd/fdNMmdv2NXf+4P1dmdL2Ur50j2Di1qfaQfVteLW4cKXTPAPrjwV74eadtzNeou7dBHUMS6l1jPyIxRyNqT/RobU0oVFtDOT1ZDl/MGrb9gVyQzQEovpZpZR8FQelQ6tesuU75UNr5IrctR1nomCExffI/qWecB2iulmK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791040658; c=relaxed/simple;
	bh=rgldtZpLkFqEpbVJLYzKfsnWlNWW1DWwOHtsyc7DBS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjTFzt1ma43rTYckIysOS/sf61bauG1Wzi9AaNYrl+uExT4AlXhrfUCPxdxE99FJazgc4UU1KFodn7bmBe2TTTUYWKcIeNp1gy0IGCWi1e1VA5LGTK8aPpIUw6JZHbQ96JRLeOM7VzkV6BXMpVcFmHcQjzDlpd4vpTgH7cUCw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YvZuJbTd; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=exVuABOx; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YvZuJbTd";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="exVuABOx"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1791040645; bh=LK7rDovFbgbMJXcaZMQcEJY
	o+GPJqqDJCmRHc5uCgNM=; b=YvZuJbTdBq2t80dEaM4De9J/jB/ocCKSGG6Vgv6Lg2IVlgThd2
	oDFc6tqJgfQLBZ1SWHbQMkV5POdTODHqGyML5OJ3qHXaHSyKOthQT7xz3uoXRIOlegjQmMMLGdW
	hU9d6eiEU/Ey3GQD0P2J+Hphfm567M2MM91R6CW9kYvSFavbca63NcShrwDWhNufl5MyvjDqDIv
	c/EEHUpVl0i/R1e4kWTT7S00pkVkzx/+xcUd4FBRD3dVbAMNLk232NgSd6XAvcYfJGu9KbmwPn3
	3vPFPzAr+s1hd6r3NqrDCjHIdtNw5Q1C40RvL4dmYIfh2IXihJZMMBzGAm6aXI8XiuA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1791040645; bh=LK7rDovFbgbMJXcaZMQcEJY
	o+GPJqqDJCmRHc5uCgNM=; b=exVuABOxbGFRcZ2zIobC2lqos+Hprh3xccJ1Zc1Vqe8RQJ5x+3
	yToMdsW7Ivz4id0iMh6EfEP1CoetIakoMFBA==;
Message-ID: <756945c1-e46c-42e4-a442-bf8ca5411e66@mainlining.org>
Date: Sat, 3 Oct 2026 20:47:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Allocate message buffer from remote heap
 for sensors PD
To: robin <robin@snyders.xyz>, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4hxf4z2g3kz87m@smtp-3-0000.mail.infomaniak.ch>
Content-Language: en-US
From: Piyush Raj Chouhan <pc1598@mainlining.org>
In-Reply-To: <4hxf4z2g3kz87m@smtp-3-0000.mail.infomaniak.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Robin,

   I am really sorry about the attribution mix-up. Using Suggested-by 
was an honest mistake on my end while preparing the submission, and I 
apologize for that.

   I've fixed this in v2: you are set as the patch author with your 
original Signed-off-by retained, followed by my sign-off for testing and 
submitting. (Because git send-email dispatches through my server, the 
outer email envelope will show my address, but the mbox body preserves 
From: Robin Snyders <robin@snyders.xyz> so git am records you as author).

   Thanks for pointing this out and for authoring the fix!

   Best regards,
   Piyush

On 03/10/26 14:01, robin wrote:
> Robin Snyders <robin@snyders.xyz>
