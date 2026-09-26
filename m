Received: from mta1.migadu.com (out-209.mta1.migadu.com [95.215.58.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB94279F9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422045; cv=none; b=k4g+me/qGfLz9pp+dJ0XrcmX+TRIZZK2TnEoYORa9gwBR0K5tk3xV6ho9YhnFOcQpsKOj6MyblHteUTCnRVI4Wo6sFYD3Z7+AapUF2AEuAUiZMuOJWcG4tBGPTpYKfBOh/YhBWOQsN5kX5HYqeosgS2a1LxSqy1xn485THCrKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422045; c=relaxed/simple;
	bh=T4B8koZHXao09W8S53CIz/FVviqLMcdkW6FA4VTg8TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfXLZ+CC8KfGFNFx+eJgZih3ysyf2HQMqZJREmmQCkibBTdhY5sdled2HmyS87CleIKjk/Up/VIC3D0cf8DBliTSGR7GRbb2sdvRfrlx3I9zzNThRdwq51AWztRn9b+HdnqTO/HBga9hkGytBQG1VB6M2S5DFOut92S4Cavc9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=mCiBB4wk; arc=none smtp.client-ip=95.215.58.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="mCiBB4wk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T4B8koZHXao09W8S53CIz/FVviqLMcdkW6FA4VTg8TE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790422040; v=1; x=1791026840;
 b=mCiBB4wkTAx2GHZYADq2FDYGjmG6ArYSvd6ssTt0k6New3MXsk/8e3nYoujkreJgRiw4njSx
 Z0Xo0t2NQUuc/kMHHaZzJ2RYP15GEE6Jv0NoSKaB3YHi+aoYc1lvnqsQZ9I/TBU8LKiB7+ueO9r
 JhbTjFDxl6FaN4N8M3a2IiYfJaUmuRWfpbwx6qzmZr99kFQUdxDuSAgEhnMc7KSY67sB2m8oJSb
 zp6uGqs66c7Tgy1AtXYcXJZ62WIR/cxh8zGFxHHO07j0S0T5x9mteqmzBnpKFsFctYlcCJWUqQw
 aH5x3138dN06i0rVo4BLOwbtpDk9s+HwhKlnw3oRsILmA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4d4961d2960db9ff;
	Sat, 26 Sep 2026 11:27:20 +0000
X-Mizu-Trace-ID: 4d4961d2960db9ff
X-Migadu-Flow: FLOW_OUT
Date: Sat, 26 Sep 2026 19:27:09 +0800
From: Weijie Yuan <wy@wyuan.org>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Jiaming Ouyang <jiamingouyang13@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, si.yanteng@linux.dev,
	rdunlap@infradead.org
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <aresDaW09qoYZsVH@wyuan.org>
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
 <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092601-reassure-darkness-229b@gregkh>

Hi Greg,

On 2026-09-26 09:13:26 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Sep 25, 2026 at 05:28:47PM +0200, Jiaming Ouyang wrote:
> > Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
> 
> This shouldn't be in the email body :(

Although this line of text is somewhat redundant, as it is the same as
the "Subject" line in the email header (git mailinfo would strip the
"Re: " by default), it is fine to leave it here.?

git.git/Documentation/git-am.adoc::[[discussion]]:

"From: ", "Date: ", and "Subject: " lines starting the body override the
respective commit author name and title values taken from the headers.

e.g. https://lore.kernel.org/git/xmqqms63ok7g.fsf@gitster.g/

But I guess you know all about this, just want to handle it here in a
simple way. ;-)

Thanks.
